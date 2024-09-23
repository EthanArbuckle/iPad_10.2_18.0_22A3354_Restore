@implementation FigCaptureMemoryReporter

void __51__FigCaptureMemoryReporter__changeReportFrequency___block_invoke(uint64_t a1)
{
  -[FigCaptureMemoryReporter _reportMemoryStatus](*(_QWORD *)(a1 + 32));
}

- (void)incrementActiveClientCount:(BOOL)a3 clientIsCameraMessagesApp:(BOOL)a4 withMemoryPool:(id)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (self->_anyLoggingEnabled)
  {
    v6 = a4;
    v7 = a3;
    if ((dword_1ECFE9630 & 4) != 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    self->_memoryPool = (BWMemoryPool *)a5;
    -[FigCaptureMemoryReporter _updateActiveClientCountWithDelta:]((uint64_t)self, 1);
    if (v7)
      self->_activeClientsIncludeCamera = 1;
    if (v6)
      self->_activeClientsIncludeCameraMessagesApp = 1;
  }
}

- (void)_updateActiveClientCountWithDelta:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  uint64_t v9;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    v5 = *(_DWORD *)(a1 + 44);
    v6 = v5 + a2;
    v7 = v6 & ~(v6 >> 31);
    *(_DWORD *)(a1 + 44) = v7;
    if (v5 != v7 && (!v5 || v6 <= 0))
    {
      *(_BYTE *)(a1 + 40) = 1;
      v8 = v6 < 1;
      v9 = 104;
      if (v8)
        v9 = 112;
      -[FigCaptureMemoryReporter _changeReportFrequency:](a1, *(_QWORD *)(a1 + v9));
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)_changeReportFrequency:(uint64_t)a1
{
  NSObject *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD handler[5];
  os_log_type_t type;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 16);
    if (v4)
    {
      if ((dword_1ECFE9630 & 4) != 0)
      {
        v11 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v4 = *(NSObject **)(a1 + 16);
      }
      dispatch_source_cancel(v4);

      *(_QWORD *)(a1 + 16) = 0;
    }
    if ((dword_1ECFE9630 & 4) != 0)
    {
      v11 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 8));
    *(_QWORD *)(a1 + 16) = v7;
    dispatch_source_set_timer(v7, 0, 1000000 * a2, 0x3E8uLL);
    v8 = *(NSObject **)(a1 + 16);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __51__FigCaptureMemoryReporter__changeReportFrequency___block_invoke;
    handler[3] = &unk_1E491E720;
    handler[4] = a1;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_activate(*(dispatch_object_t *)(a1 + 16));
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_sOnceToken_1 != -1)
    dispatch_once(&sharedInstance_sOnceToken_1, &__block_literal_global_105);
  return (id)sharedInstance_sSharedFigMemoryReporter;
}

- (void)_reportMemoryStatus
{
  _BYTE *v2;
  int v3;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;
  int v12;
  char v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  const __CFString *v18;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v20;
  unsigned int v21;
  NSObject *v22;
  NSObject *v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  int v31;
  int v32;
  NSObject *v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t ContinuousUpTimeNanoseconds;
  mach_msg_type_number_t host_info64_outCnt;
  integer_t host_info64_out[4];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  os_log_type_t v62;
  int v63;
  os_log_type_t type[4];
  uint64_t v65;
  uint64_t v66;
  int v67;
  const char *v68;
  __int16 v69;
  _BYTE v70[10];
  unint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  unint64_t v75;
  __int16 v76;
  unint64_t v77;
  __int16 v78;
  const __CFString *v79;
  unsigned int v80;
  integer_t task_info_out[16];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  int v101;
  __int128 buffer;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = &unk_1ECFE9000;
  if ((dword_1ECFE9630 & 4) != 0)
    ContinuousUpTimeNanoseconds = FigGetContinuousUpTimeNanoseconds();
  else
    ContinuousUpTimeNanoseconds = -1;
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
    *(_BYTE *)(a1 + 40) = 0;
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  buffer = 0u;
  if (proc_pid_rusage(*(_DWORD *)(a1 + 64), 6, (rusage_info_t *)&buffer))
    goto LABEL_93;
  v4 = *((_QWORD *)&v119 + 1);
  v5 = (unint64_t *)(a1 + 128);
  v6 = atomic_load((unint64_t *)(a1 + 128));
  v7 = v4;
  v49 = v4;
  if (v6 > v4)
    v7 = atomic_load(v5);
  atomic_store(v7, v5);
  v8 = *((_QWORD *)&v106 + 1);
  *(_QWORD *)(a1 + 120) = *((_QWORD *)&v106 + 1);
  v9 = v8 >> 10;
  if (*(int *)(a1 + 44) > 0 || *(_BYTE *)(a1 + 70) || *(_DWORD *)(a1 + 80) < v9)
  {
    v65 = 0;
    v66 = 0;
  }
  else
  {
    v24 = *(_DWORD *)(a1 + 84);
    v65 = 0;
    v66 = 0;
    if (v24 <= v9)
    {
      v25 = 0;
      goto LABEL_45;
    }
  }
  v10 = *(void **)(a1 + 144);
  if (v10 && (dword_1ECFE9630 & 0x40) != 0)
    objc_msgSend(v10, "getInUseFootprint:andOutOfUseFootprint:", &v66, &v65);
  proc_reset_footprint_interval();
  if (v9 <= 0x100000)
  {
    v11 = v9 + (v9 >> 4);
    v12 = v9 - (v9 >> 4);
  }
  else
  {
    v11 = v9 + 0x10000;
    v12 = v9 - 0x10000;
  }
  *(_DWORD *)(a1 + 80) = v11;
  *(_DWORD *)(a1 + 84) = v12;
  v13 = dword_1ECFE9630;
  if ((dword_1ECFE9630 & 1) == 0)
  {
    if ((dword_1ECFE9630 & 0x40) == 0)
      goto LABEL_22;
LABEL_32:
    v80 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v20 = v80;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT))
      v21 = v20;
    else
      v21 = v20 & 0xFFFFFFFE;
    if (v21)
    {
      v67 = 136315650;
      v68 = "-[FigCaptureMemoryReporter _reportMemoryStatus]";
      v69 = 1024;
      *(_DWORD *)v70 = v66 >> 10;
      *(_WORD *)&v70[4] = 1024;
      *(_DWORD *)&v70[6] = v65 >> 10;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v2 = &unk_1ECFE9000;
    if ((dword_1ECFE9630 & 2) == 0)
      goto LABEL_44;
LABEL_38:
    v101 = 0;
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v82 = 0u;
    memset(task_info_out, 0, sizeof(task_info_out));
    *(_DWORD *)type = 93;
    if (!task_info(*MEMORY[0x1E0C83DA0], 0x16u, task_info_out, (mach_msg_type_number_t *)type))
    {
      if ((v2[1584] & 2) != 0)
      {
        v63 = 0;
        v62 = OS_LOG_TYPE_DEFAULT;
        v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v2 = (_BYTE *)&unk_1ECFE9000;
        if ((dword_1ECFE9630 & 2) != 0)
        {
          v63 = 0;
          v62 = OS_LOG_TYPE_DEFAULT;
          v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v2 = &unk_1ECFE9000;
        }
      }
      goto LABEL_44;
    }
LABEL_93:
    FigDebugAssert3();
    return;
  }
  v80 = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  v15 = v80;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v16 = v15;
  else
    v16 = v15 & 0xFFFFFFFE;
  if (v16)
  {
    v17 = *(_QWORD *)(a1 + 120) >> 10;
    v18 = CFSTR("true");
    if (!v3)
      v18 = CFSTR("false");
    v67 = 136316674;
    v68 = "-[FigCaptureMemoryReporter _reportMemoryStatus]";
    v69 = 2048;
    *(_QWORD *)v70 = v103;
    *(_WORD *)&v70[8] = 2048;
    v71 = *((_QWORD *)&v103 + 1);
    v72 = 2048;
    v73 = *((_QWORD *)&v105 + 1) >> 10;
    v74 = 2048;
    v75 = v17;
    v76 = 2048;
    v77 = v49 >> 10;
    v78 = 2112;
    v79 = v18;
    _os_log_send_and_compose_impl();
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  v13 = dword_1ECFE9630;
  v2 = (_BYTE *)&unk_1ECFE9000;
  if ((dword_1ECFE9630 & 0x40) != 0)
    goto LABEL_32;
LABEL_22:
  if ((v13 & 2) != 0)
    goto LABEL_38;
LABEL_44:
  v25 = 1;
LABEL_45:
  v61 = 0;
  v60 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  *(_OWORD *)host_info64_out = 0u;
  v53 = 0u;
  host_info64_outCnt = 38;
  if (host_statistics64(*(_DWORD *)(a1 + 52), 4, host_info64_out, &host_info64_outCnt))
    goto LABEL_93;
  v26 = v9;
  v27 = *(_QWORD *)(a1 + 56);
  v28 = v27 * host_info64_out[3];
  v29 = v28 >> 10;
  v45 = v27 * host_info64_out[0];
  v46 = v27 * host_info64_out[1];
  v47 = v27 * host_info64_out[2];
  v48 = (16 * v60);
  if (*(int *)(a1 + 44) > 0
    || *(_BYTE *)(a1 + 70)
    || *(_DWORD *)(a1 + 88) < v29
    || *(_DWORD *)(a1 + 92) > v29)
  {
    if (v29 <= 0x100000)
    {
      v30 = v29 + (v29 >> 4);
      v31 = v29 - (v29 >> 4);
    }
    else
    {
      v30 = v29 + 0x10000;
      v31 = v29 - 0x10000;
    }
    *(_DWORD *)(a1 + 88) = v30;
    *(_DWORD *)(a1 + 92) = v31;
    if ((v2[1584] & 1) != 0)
    {
      v44 = v25;
      v80 = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v34 = v80;
      if (os_log_type_enabled(v33, type[0]))
        v35 = v34;
      else
        v35 = v34 & 0xFFFFFFFE;
      if (v35)
      {
        v67 = 136316418;
        v68 = "-[FigCaptureMemoryReporter _reportMemoryStatus]";
        v69 = 2048;
        *(_QWORD *)v70 = v28 >> 10;
        *(_WORD *)&v70[8] = 2048;
        v71 = v45 >> 10;
        v72 = 2048;
        v73 = v46 >> 10;
        v74 = 2048;
        v75 = v47 >> 10;
        v76 = 2048;
        v77 = v48;
        _os_log_send_and_compose_impl();
      }
      v32 = 1;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v2 = &unk_1ECFE9000;
      v25 = v44;
      if (!v3)
        goto LABEL_65;
    }
    else
    {
      v32 = 1;
      if (!v3)
        goto LABEL_65;
    }
  }
  else
  {
    v32 = 0;
    if (!v3)
      goto LABEL_65;
  }
  if (*(int *)(a1 + 44) >= 1 && (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 49)))
    goto LABEL_67;
LABEL_65:
  if (*(_BYTE *)(a1 + 69) || *(_BYTE *)(a1 + 68))
  {
LABEL_67:
    v36 = *((_DWORD *)v2 + 396);
    if ((v36 & 0x20) != 0 && (*(_DWORD *)(a1 + 76) <= v26 || *(_BYTE *)(a1 + 69)))
    {
      -[FigCaptureMemoryReporter _logCurrentTransactions](a1);
      v36 = *((_DWORD *)v2 + 396);
    }
    if ((v36 & 8) != 0 && (*(_DWORD *)(a1 + 72) <= v26 || *(_BYTE *)(a1 + 68)))
      -[FigCaptureMemoryReporter _generateMemgraph:](a1);
  }
  if ((v25 | v32) == 1)
  {
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
    if ((v2[1584] & 0x11) != 0)
    {
      v37 = *(NSObject **)(a1 + 136);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = *(_QWORD *)(a1 + 120) >> 10;
        task_info_out[0] = 134219520;
        *(_QWORD *)&task_info_out[1] = v38;
        LOWORD(task_info_out[3]) = 2048;
        *(_QWORD *)((char *)&task_info_out[3] + 2) = v49 >> 10;
        HIWORD(task_info_out[5]) = 2048;
        *(_QWORD *)&task_info_out[6] = v28 >> 10;
        LOWORD(task_info_out[8]) = 2048;
        *(_QWORD *)((char *)&task_info_out[8] + 2) = v45 >> 10;
        HIWORD(task_info_out[10]) = 2048;
        *(_QWORD *)&task_info_out[11] = v46 >> 10;
        LOWORD(task_info_out[13]) = 2048;
        *(_QWORD *)((char *)&task_info_out[13] + 2) = v47 >> 10;
        HIWORD(task_info_out[15]) = 2048;
        *(_QWORD *)&v82 = v48;
        _os_log_impl(&dword_1A2C80000, v37, OS_LOG_TYPE_DEFAULT, "m11:%lld, m12:%lld, m21:%lld, m22:%lld, m23:%lld, m24:%lld, m25:%lld", (uint8_t *)task_info_out, 0x48u);
      }
    }
  }
  if ((v2[1584] & 4) != 0 && (ContinuousUpTimeNanoseconds & 0x8000000000000000) == 0)
  {
    v39 = FigGetContinuousUpTimeNanoseconds();
    if ((v2[1584] & 4) != 0)
    {
      v40 = v39;
      v80 = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v42 = v80;
      if (os_log_type_enabled(v41, type[0]))
        v43 = v42;
      else
        v43 = v42 & 0xFFFFFFFE;
      if (v43)
      {
        v67 = 136315394;
        v68 = "-[FigCaptureMemoryReporter _reportMemoryStatus]";
        v69 = 2048;
        *(_QWORD *)v70 = (v40 - ContinuousUpTimeNanoseconds) / 0x3E8uLL;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

FigCaptureMemoryReporter *__42__FigCaptureMemoryReporter_sharedInstance__block_invoke()
{
  FigCaptureMemoryReporter *result;

  result = objc_alloc_init(FigCaptureMemoryReporter);
  sharedInstance_sSharedFigMemoryReporter = (uint64_t)result;
  return result;
}

- (FigCaptureMemoryReporter)init
{
  char *v2;
  host_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigCaptureMemoryReporter;
  v2 = -[FigCaptureMemoryReporter init](&v5, sel_init);
  if (v2)
  {
    FigDebugIsInternalBuild();
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    *((_QWORD *)v2 + 1) = FigDispatchQueueCreateStandardDispatchQueue();
    *((_DWORD *)v2 + 16) = getpid();
    v3 = MEMORY[0x1A858DB90]();
    *((_DWORD *)v2 + 13) = v3;
    host_page_size(v3, (vm_size_t *)v2 + 7);
    *((_QWORD *)v2 + 4) = 0;
    *((_WORD *)v2 + 34) = 0;
    v2[70] = 0;
    *((int32x2_t *)v2 + 9) = vdup_n_s32(0x4B000u);
    *(_OWORD *)(v2 + 104) = xmmword_1A32B2230;
    v2[96] = (_WORD)dword_1ECFE9630 != 0;
    *((_QWORD *)v2 + 18) = 0;
  }
  return (FigCaptureMemoryReporter *)v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMemoryReporter;
  -[FigCaptureMemoryReporter dealloc](&v3, sel_dealloc);
}

- (void)decrementActiveClientCount:(BOOL)a3 clientIsCameraMessagesApp:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (self->_anyLoggingEnabled)
  {
    v4 = a4;
    v5 = a3;
    if ((dword_1ECFE9630 & 4) != 0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[FigCaptureMemoryReporter _updateActiveClientCountWithDelta:]((uint64_t)self, -1);
    if (v5 || v4)
    {
      if (v5)
        self->_activeClientsIncludeCamera = 0;
      if (v4)
        self->_activeClientsIncludeCameraMessagesApp = 0;
      if ((dword_1ECFE9630 & 8) != 0)
        -[FigCaptureMemoryReporter _startMemgraphCoolDown:]((uint64_t)self, 1);
    }
  }
}

- (void)_startMemgraphCoolDown:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[5];

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    if (!*(_QWORD *)(a1 + 24))
    {
      v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 8));
      *(_QWORD *)(a1 + 24) = v5;
      v6 = dispatch_time(0, 1000000000 * a2);
      dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);
      v7 = *(NSObject **)(a1 + 24);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __51__FigCaptureMemoryReporter__startMemgraphCoolDown___block_invoke;
      handler[3] = &unk_1E491E720;
      handler[4] = a1;
      dispatch_source_set_event_handler(v7, handler);
      dispatch_activate(*(dispatch_object_t *)(a1 + 24));
    }
    os_unfair_lock_unlock(v4);
  }
}

- (unint64_t)peakFootprintSinceReset
{
  return atomic_load(&self->_peakFootprint);
}

- (void)resetPeakFootprint
{
  atomic_store(0, &self->_peakFootprint);
}

- (void)_startReporting
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 96))
    {
      *(_QWORD *)(a1 + 136) = os_log_create("com.apple.coremedia.CMCapture.FigCaptureMemoryReporter", ");
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
      -[FigCaptureMemoryReporter _changeReportFrequency:](a1, *(_QWORD *)(a1 + 112));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    }
  }
}

void __51__FigCaptureMemoryReporter__startMemgraphCoolDown___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 36));
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 24));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 36));
}

- (void)_generateMemgraph:(uint64_t)a1
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  ipc_space_t *v5;
  task_read_t v6;
  kern_return_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  mach_port_t corpse_task_port;
  uint64_t v13;
  _QWORD v14[3];
  _QWORD v15[17];

  v15[16] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    v3 = *(_QWORD *)(a1 + 24);
    os_unfair_lock_unlock(v2);
    if (dword_1ECFE9630)
    {
      corpse_task_port = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (!v3)
    {
      v5 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      v6 = *MEMORY[0x1E0C83DA0];
      corpse_task_port = 0;
      v7 = task_generate_corpse(v6, &corpse_task_port);
      if (dword_1ECFE9630)
      {
        v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (v7)
      {
        FigDebugAssert3();
      }
      else
      {
        v9 = corpse_task_port;
        v13 = 0;
        v14[0] = &v13;
        v14[1] = 0x2020000000;
        v10 = getReportMemoryExceptionFromTaskSymbolLoc_ptr;
        v14[2] = getReportMemoryExceptionFromTaskSymbolLoc_ptr;
        if (!getReportMemoryExceptionFromTaskSymbolLoc_ptr)
        {
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __getReportMemoryExceptionFromTaskSymbolLoc_block_invoke;
          v15[3] = &unk_1E491EC40;
          v15[4] = &v13;
          __getReportMemoryExceptionFromTaskSymbolLoc_block_invoke((uint64_t)v15);
          v10 = *(void **)(v14[0] + 24);
        }
        _Block_object_dispose(&v13, 8);
        if (!v10)
          -[FigCaptureMemoryReporter _generateMemgraph:].cold.1();
        ((void (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))v10)(v9, 1, 0, 0, 0);
        mach_port_deallocate(*v5, corpse_task_port);
        if (dword_1ECFE9630)
        {
          v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[FigCaptureMemoryReporter _startMemgraphCoolDown:](a1, 60);
      }
    }
  }
}

- (void)_logCurrentTransactions
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  os_log_type_t type;
  unsigned int v21;
  _BYTE v22[128];
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    obj = (id)FigOSTransactionCopyDescriptions();
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
    if (dword_1ECFE9630)
    {
      v21 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16, v11, v13);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v17 != v4)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v7 = objc_msgSend(v6, "rangeOfString:", CFSTR("://"), v12, v14);
          if (v7 != 0x7FFFFFFFFFFFFFFFLL)
            v6 = (void *)objc_msgSend(v6, "substringToIndex:", v7);
          if (dword_1ECFE9630)
          {
            v21 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v9 = v21;
            if (os_log_type_enabled(v8, type))
              v10 = v9;
            else
              v10 = v9 & 0xFFFFFFFE;
            if (v10)
            {
              v23 = 136315394;
              v24 = "-[FigCaptureMemoryReporter _logCurrentTransactions]";
              v25 = 2112;
              v26 = v6;
              LODWORD(v14) = 22;
              v12 = &v23;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v3);
    }
    CFRelease(obj);
  }
}

- (unint64_t)currentFootprint
{
  return self->_currentFootprint;
}

- (void)_generateMemgraph:.cold.1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_ReportMemoryExceptionFromTask(task_t, BOOL, const char * _Nullable, dispatch_queue_t _Nullable, void (^ _Nullable)(NSError * _Nullable))"), CFSTR("FigCaptureMemoryReporter.m"), 38, CFSTR("%s"), dlerror());
  __break(1u);
}

@end
