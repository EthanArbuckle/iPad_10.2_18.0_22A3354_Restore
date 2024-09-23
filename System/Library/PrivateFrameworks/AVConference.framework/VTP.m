@implementation VTP

uint64_t __VTP_NWConnectionContext_block_invoke()
{
  VTP_NWConnectionContext_context = nw_context_create();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_scheduling_mode();
  return nw_context_activate();
}

void __VTP_NWConnectionQueue_block_invoke()
{
  NSObject *CustomRootQueue;
  NSObject *initially_inactive;

  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  VTP_NWConnectionQueue_queue = (uint64_t)dispatch_queue_create_with_target_V2("VTP Receive Proc", initially_inactive, CustomRootQueue);
  if (VTP_NWConnectionContext_once != -1)
    dispatch_once(&VTP_NWConnectionContext_once, &__block_literal_global_48);
  nw_queue_context_target_dispatch_queue();
  dispatch_activate((dispatch_object_t)VTP_NWConnectionQueue_queue);
}

void *__VTP_DuplicateVFD_block_invoke(uint64_t a1, uint64_t a2, void *__src)
{
  void *result;
  uint64_t v6;

  result = memcpy((void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), __src, 0x200uLL);
  v6 = *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 52);
  if ((_DWORD)v6 != -1)
    ++*(_DWORD *)(a2 + 4 * v6 + 128);
  return result;
}

void __VTP_ScheduleReceiveForNWConnection_block_invoke(uint64_t a1, NSObject *a2, NSObject *a3, int a4, nw_error_t error)
{
  int error_code;
  uint64_t v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t *v20;
  void **v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unsigned int *v26;
  unsigned int v27;
  uint64_t v28;
  int v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD applier[6];
  uint64_t v36;
  void **v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  _BYTE buf[64];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (error)
  {
    error_code = nw_error_get_error_code(error);
    if (error_code)
      goto LABEL_7;
  }
  else
  {
    error_code = 0;
  }
  if (a4)
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_BYTE *)(a1 + 40);
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __VTP_ScheduleReceiveForNWConnection_block_invoke;
    *(_QWORD *)&buf[24] = &unk_1E9E56100;
    *(_QWORD *)&buf[32] = v10;
    buf[40] = v11;
    nw_connection_receive_multiple();
    goto LABEL_14;
  }
LABEL_7:
  if (error_code)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "VTP_ScheduleReceiveForNWConnection_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 5332;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = error_code;
        *(_WORD *)&buf[34] = 2112;
        *(_QWORD *)&buf[36] = v28;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = v29;
        _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d NWConnection failed to receive data with error=%d connection=%@ shouldIgnoreConnectionRefusedError=%d", buf, 0x32u);
      }
    }
    if (error_code == 61 && *(_BYTE *)(a1 + 40))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __VTP_ScheduleReceiveForNWConnection_block_invoke;
      *(_QWORD *)&buf[24] = &unk_1E9E56100;
      *(_QWORD *)&buf[32] = v14;
      buf[40] = 1;
      nw_connection_receive_multiple();
    }
  }
LABEL_14:
  v15 = CheckInHandleDebug();
  v16 = v15;
  if (v15)
  {
    if (a2)
    {
      v17 = *(_QWORD *)(a1 + 32);
      v40 = 1;
      v36 = 0;
      v37 = (void **)&v36;
      v38 = 0x2020000000;
      v39 = 0;
      v18 = MEMORY[0x1E0C809B0];
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = ___VTP_HandleReceiveForNWConnection_block_invoke;
      applier[3] = &unk_1E9E56170;
      applier[4] = &v36;
      applier[5] = v15;
      dispatch_data_apply(a2, applier);
      *((double *)v37[3] + 23) = micro();
      v45 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43 = v19;
      v44 = v19;
      *(_OWORD *)&buf[48] = v19;
      v42 = v19;
      *(_OWORD *)&buf[16] = v19;
      *(_OWORD *)&buf[32] = v19;
      *(_OWORD *)buf = v19;
      VCSDInfoConstructWithNWConnection(v17, (uint64_t)buf);
      VTP_SetConnectionFlagsForPacket(v16, 0, (uint64_t)v37[3], (int *)buf);
      if ((VTP_ProcessPacketType(v16, 0, -1, (uint64_t)v37[3]) & 0x80000000) != 0)
      {
        _VTP_ReleasePacket(v16, v37 + 3);
      }
      else
      {
        v31 = 0;
        v32 = &v31;
        v33 = 0x2020000000;
        v34 = 0;
        if (a3)
        {
          v30[0] = v18;
          v30[1] = 3221225472;
          v30[2] = ___VTP_HandleReceiveForNWConnection_block_invoke_39;
          v30[3] = &unk_1E9E56198;
          v30[4] = &v31;
          nw_content_context_foreach_protocol_metadata(a3, v30);
          v20 = v32;
        }
        else
        {
          v20 = &v31;
        }
        v21 = v37;
        v22 = (char *)v37[3];
        v23 = *(_OWORD *)&buf[16];
        *(_OWORD *)(v22 + 232) = *(_OWORD *)buf;
        *(_OWORD *)(v22 + 248) = v23;
        v24 = v43;
        *(_OWORD *)(v22 + 296) = v42;
        *(_OWORD *)(v22 + 312) = v24;
        *(_OWORD *)(v22 + 328) = v44;
        v25 = *(_OWORD *)&buf[48];
        *(_OWORD *)(v22 + 264) = *(_OWORD *)&buf[32];
        *((_QWORD *)v22 + 43) = v45;
        *(_OWORD *)(v22 + 280) = v25;
        v26 = (unsigned int *)v21[3];
        *((_BYTE *)v26 + 516) = a4;
        *((_BYTE *)v26 + 352) = *((_BYTE *)v20 + 24);
        v27 = v26[56];
        VTP_UpdateReceivedBytes(v26[54], v26[136], (*v26 & 0xF0) != 0, *((unsigned __int8 *)v26 + 223), (uint64_t)buf, *((unsigned __int8 *)v26 + 413), *((unsigned __int8 *)v26 + 408), *((_BYTE *)v26 + 412) != 0);
        if (v27 != -1)
          _VTP_HealthPrint(v16, *((_QWORD *)v37[3] + 68), v27, 0, 0);
        pthread_rwlock_rdlock((pthread_rwlock_t *)(v16 + 5376));
        VTP_DemuxPacketsToVFDList(v16, v37[3], &v40);
        pthread_rwlock_unlock((pthread_rwlock_t *)(v16 + 5376));
        _Block_object_dispose(&v31, 8);
      }
      _Block_object_dispose(&v36, 8);
    }
    CheckOutHandleDebug();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __VTP_ScheduleReceiveForNWConnection_block_invoke_cold_1();
  }
}

uint64_t __VTP_GetPktType_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  **(_DWORD **)(result + 40) = *(_DWORD *)(a3 + 28);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t ___VTP_SendOnePacketWithNWConnection_block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(v3 + 32);
        v7 = *(_QWORD *)(v3 + 40);
        v8 = *(_QWORD *)(v3 + 48);
        v9 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
        v10 = *(_DWORD *)(v3 + 344);
        v11 = 136316930;
        v12 = v4;
        v13 = 2080;
        v14 = "_VTP_SendOnePacketWithNWConnection_block_invoke";
        v15 = 1024;
        v16 = 5239;
        v17 = 2048;
        v18 = v6;
        v19 = 2048;
        v20 = v7;
        v21 = 2048;
        v22 = v8;
        v23 = 2080;
        v24 = v9;
        v25 = 1024;
        v26 = v10;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nw_connection_send(%llx, %llx, %llx) failed with error=%s, expiration time=%dms", (uint8_t *)&v11, 0x4Au);
      }
    }
    kdebug_trace();
    return VTP_NotifySendFailed(v3 + 348);
  }
  return result;
}

BOOL ___VTP_HandleReceiveForNWConnection_block_invoke(uint64_t a1, dispatch_object_t object, uint64_t a3, void *a4, size_t a5)
{
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        ___VTP_HandleReceiveForNWConnection_block_invoke_cold_1();
    }
  }
  else
  {
    dispatch_retain(object);
    if ((_VTP_AllocatePacketWithBufferFreeCallback(*(_QWORD *)(a1 + 40), a4, a5, (void (__cdecl *)(void *, void *, size_t))_VTP_DispathDataFreeCallback, object, (CMBlockBufferRef **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          ___VTP_HandleReceiveForNWConnection_block_invoke_cold_2();
      }
      dispatch_release(object);
    }
  }
  return a3 != 0;
}

uint64_t ___VTP_HandleReceiveForNWConnection_block_invoke_39(uint64_t a1, int a2, nw_protocol_metadata_t metadata)
{
  uint64_t result;

  result = nw_protocol_metadata_is_ip(metadata);
  if ((_DWORD)result)
  {
    result = nw_ip_metadata_get_hop_limit();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __VTP_SetIDSReadHandler_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, __int16 a6, unsigned __int8 *a7, void *a8)
{
  uint64_t v10;
  NSObject *v11;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  double v21;
  char *v22;
  __int128 v23;
  char *v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  _WORD *v32;
  __int16 *v33;
  __int16 v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  const void *v39;
  int v40;
  double v41;
  char *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  int v47;
  int v48;
  double v49;
  double v50;
  unsigned int v51;
  int v52;
  char *v53;
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  unint64_t *v58;
  unint64_t v59;
  int v60;
  unsigned int v61;
  int v62;
  uint64_t v63;
  NSObject *v64;
  char *v65;
  _DWORD *v66;
  char *v67;
  _BYTE buf[48];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  unint64_t v73;
  uint8_t v74[4];
  uint64_t v75;
  __int16 v76;
  const char *v77;
  __int16 v78;
  int v79;
  __int16 v80;
  _BYTE v81[10];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  if (a8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "VTP_SetIDSReadHandler_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 6233;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = a2;
        *(_WORD *)&buf[38] = 2080;
        *(_QWORD *)&buf[40] = objc_msgSend((id)objc_msgSend(a8, "description"), "UTF8String");
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Datagram channel [%p] failed to read with error=%s", buf, 0x30u);
      }
    }
    return;
  }
  if (a7)
  {
    v17 = (*a7 >> 6) & 1;
    if ((_DWORD)a4)
      goto LABEL_13;
  }
  else
  {
    LOBYTE(v17) = 0;
    if ((_DWORD)a4)
      goto LABEL_13;
  }
  if ((v17 & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __VTP_SetIDSReadHandler_block_invoke_cold_9();
    }
    return;
  }
LABEL_13:
  v18 = CheckInHandleDebug();
  if (v18)
  {
    v19 = v18;
    v65 = 0;
    v66 = 0;
    v20 = a4;
    if ((_VTP_AllocatePacketWithBufferFreeCallback(v18, a3, a4, 0, 0, (CMBlockBufferRef **)&v65) & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __VTP_SetIDSReadHandler_block_invoke_cold_2();
      }
      goto LABEL_96;
    }
    v21 = micro();
    v22 = v65;
    *((double *)v65 + 23) = v21;
    if ((a5 & 0xFF00000000) != 0)
      v22[519] = BYTE4(a5);
    v73 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v71 = v23;
    v72 = v23;
    v69 = v23;
    v70 = v23;
    *(_OWORD *)&buf[16] = v23;
    *(_OWORD *)&buf[32] = v23;
    *(_OWORD *)buf = v23;
    VCSDInfoConstructWithDatagramChannel((uint64_t)a2, a5, a6, 0, (uint64_t)buf);
    VTP_SetConnectionFlagsForPacket(v19, 0, (uint64_t)v65, (int *)buf);
    v24 = v65;
    v67 = 0;
    if (!a7)
      goto LABEL_77;
    v25 = *(_DWORD *)a7;
    if (!*(_DWORD *)a7)
    {
LABEL_66:
      if (*(_BYTE *)(v19 + 5897))
      {
        if (v24[408])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v45 = VRTraceErrorLogLevelToCSTR();
            v46 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v47 = v24[408];
              v48 = *((unsigned __int16 *)v24 + 192);
              *(_DWORD *)v74 = 136316162;
              v75 = v45;
              v76 = 2080;
              v77 = "_VTP_ProcessDatagramOptions";
              v78 = 1024;
              v79 = 6155;
              v80 = 1024;
              *(_DWORD *)v81 = v47;
              *(_WORD *)&v81[4] = 1024;
              *(_DWORD *)&v81[6] = v48;
              _os_log_impl(&dword_1D8A54000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d datagram readHandler received packet with numOfStreamIDs=%d and streamID[0]=%u", v74, 0x28u);
            }
          }
        }
      }
      v49 = *((double *)a7 + 8);
      if (v49 > 0.0)
      {
        v50 = v21 - v49;
        if (*(double *)(v19 + 21864) > v50)
          v50 = *(double *)(v19 + 21864);
        *(double *)(v19 + 21864) = v50;
        v52 = *(_DWORD *)(v19 + 21856);
        v51 = *(_DWORD *)(v19 + 21860);
        if (v51 <= v52 + 1)
          v51 = v52 + 1;
        *(_DWORD *)(v19 + 21860) = v51;
      }
LABEL_77:
      _VTP_ReleasePacket(v19, (void **)&v67);
      if ((VTP_ProcessPacketType(v19, 0, -2, (uint64_t)v65) & 0x80000000) == 0)
      {
        v53 = v65;
        v54 = *(_DWORD *)v65;
        if (*(_DWORD *)v65 == 0x10000)
          goto LABEL_81;
        if (v54 == 48)
          goto LABEL_82;
        if (v54 == 2)
        {
LABEL_81:
          v55 = *(_OWORD *)&buf[16];
          *(_OWORD *)(v65 + 232) = *(_OWORD *)buf;
          *(_OWORD *)(v53 + 248) = v55;
          v56 = v71;
          *(_OWORD *)(v53 + 296) = v70;
          *(_OWORD *)(v53 + 312) = v56;
          *(_OWORD *)(v53 + 328) = v72;
          v57 = v69;
          *(_OWORD *)(v53 + 264) = *(_OWORD *)&buf[32];
          *((_QWORD *)v53 + 43) = v73;
          *(_OWORD *)(v53 + 280) = v57;
          if (v54 == 48)
          {
LABEL_82:
            v58 = (unint64_t *)(v19 + 21952);
            do
              v59 = __ldxr(v58);
            while (__stxr(v59 + 1, v58));
          }
        }
        v60 = *((_DWORD *)v53 + 54);
        pthread_rwlock_rdlock((pthread_rwlock_t *)(v19 + 21640));
        _VTP_ReportIDSOnTheWireBytesLocked(v19, v60, a4, (uint64_t)a7, 0);
        pthread_rwlock_unlock((pthread_rwlock_t *)(v19 + 21640));
        v61 = *((_DWORD *)v65 + 56);
        VTP_UpdateReceivedBytes(*((_DWORD *)v65 + 54), a4, (*(_DWORD *)v65 & 0xF0) != 0, v65[223], (uint64_t)buf, v65[413], v65[408], v65[412] != 0);
        v62 = objc_msgSend(a2, "dataPath");
        if (v62)
        {
          if (v62 == 1)
          {
            _VTP_ProcessPacketForDirectIDSDataPath(v19, v65, v66);
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v63 = VRTraceErrorLogLevelToCSTR();
            v64 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              __VTP_SetIDSReadHandler_block_invoke_cold_4(v63, a2, v64);
          }
        }
        else
        {
          _VTP_ProcessPacketForSharedIDSDataPath(v19, (uint64_t)v65, v66);
        }
        _VTP_HealthPrint(v19, v20, v61, 0, 0);
        goto LABEL_96;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __VTP_SetIDSReadHandler_block_invoke_cold_3();
      }
LABEL_90:
      _VTP_ReleasePacket(v19, (void **)&v65);
      _VTP_ReleasePacket(v19, (void **)&v66);
LABEL_96:
      CheckOutHandleDebug();
      return;
    }
    v65[376] = 1;
    if ((v25 & 1) != 0)
    {
      v24[414] = 1;
      *((_QWORD *)v24 + 52) = *((_QWORD *)a7 + 1);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        v28 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *((_QWORD *)a7 + 1);
            *(_DWORD *)v74 = 136315906;
            v75 = v26;
            v76 = 2080;
            v77 = "_VTP_ProcessDatagramOptions";
            v78 = 1024;
            v79 = 6089;
            v80 = 2048;
            *(_QWORD *)v81 = v29;
            _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d datagram readHandler received packet from participantID=%llu", v74, 0x26u);
          }
        }
        else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          __VTP_SetIDSReadHandler_block_invoke_cold_8();
        }
      }
    }
    v30 = *(_DWORD *)a7;
    if ((*(_DWORD *)a7 & 0x10) != 0)
      *((_WORD *)v24 + 205) = *((_WORD *)a7 + 8);
    if ((v30 & 2) != 0)
    {
      LODWORD(v31) = (char)a7[19];
      v24[408] = a7[19];
      if ((int)v31 >= 1)
      {
        v31 = v31;
        v32 = v24 + 384;
        v33 = (__int16 *)(a7 + 20);
        do
        {
          v34 = *v33++;
          *v32++ = v34;
          --v31;
        }
        while (v31);
      }
    }
    if ((v30 & 8) != 0)
    {
      v24[412] = a7[18];
      if ((v30 & 4) == 0)
      {
LABEL_41:
        if ((v30 & 0x20) == 0)
          goto LABEL_55;
        goto LABEL_45;
      }
    }
    else if ((v30 & 4) == 0)
    {
      goto LABEL_41;
    }
    v24[413] = 1;
    if ((v30 & 0x20) == 0)
    {
LABEL_55:
      v40 = *(_DWORD *)a7;
      if ((*(_DWORD *)a7 & 0x10000) != 0)
        v24[460] = a7[112];
      if ((v40 & 0x40) != 0 || (v41 = *(double *)(v19 + 22000), v41 > 0.0) && v21 - v41 > 0.2)
      {
        *(double *)(v19 + 22000) = v21;
        if ((_VTP_AllocatePacketWithBufferFreeCallback(v19, 0, 0, 0, 0, (CMBlockBufferRef **)&v67) & 0x80000000) != 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              __VTP_SetIDSReadHandler_block_invoke_cold_6();
          }
          _VTP_ReleasePacket(v19, (void **)&v67);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              __VTP_SetIDSReadHandler_block_invoke_cold_5();
          }
          goto LABEL_90;
        }
        v42 = v67;
        *((_DWORD *)v67 + 57) = *((_DWORD *)v24 + 57);
        *((_DWORD *)v42 + 54) = *((_DWORD *)v24 + 54);
        v43 = *((_DWORD *)v24 + 1);
        *(_DWORD *)v42 = 0x20000;
        *((_DWORD *)v42 + 1) = v43;
        *((_QWORD *)v42 + 23) = *((_QWORD *)v24 + 23);
        if ((*a7 & 0x40) != 0)
        {
          ++*(_DWORD *)(v19 + 22008);
          v42[426] = 1;
          *((_WORD *)v42 + 214) = *((_WORD *)a7 + 23);
          v44 = *((_QWORD *)a7 + 6);
          *((_WORD *)v42 + 219) = *((_WORD *)a7 + 28);
          *(_QWORD *)(v42 + 430) = v44;
        }
        else
        {
          v42[426] = 0;
        }
        v66 = v42;
        v67 = 0;
      }
      v24[441] = a7[80];
      goto LABEL_66;
    }
LABEL_45:
    v24[424] = 1;
    v35 = *((_DWORD *)v24 + 54);
    v36 = a7[44];
    v37 = CheckInHandleDebug();
    if (v37)
    {
      v38 = v37;
      if (*(unsigned __int8 *)(v37 + 21636) != v36)
      {
        *(_BYTE *)(v37 + 21636) = v36;
        if (v35)
        {
          pthread_rwlock_rdlock((pthread_rwlock_t *)(v37 + 21640));
          v39 = VTP_getConnectionManagerForCallID(v38, v35);
          VCConnectionManager_SynchronizeParticipantGenerationCounter((uint64_t)v39);
          pthread_rwlock_unlock((pthread_rwlock_t *)(v38 + 21640));
        }
      }
      CheckOutHandleDebug();
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __VTP_SetIDSReadHandler_block_invoke_cold_7();
      }
      *__error() = 13;
    }
    goto LABEL_55;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __VTP_SetIDSReadHandler_block_invoke_cold_1();
  }
}

void __VTP_ScheduleReceiveForNWConnection_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed due to invalid handle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VTP_HandleReceiveForNWConnection_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Ignore packets with offset", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VTP_HandleReceiveForNWConnection_block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "_VTP_HandleReceiveForNWConnection_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  v4 = 2048;
  v5 = v0;
  OUTLINED_FUNCTION_15_5(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VTP/VTransport.m:%d: VTP packet allocation failed. Datagram size=%lu", v2);
  OUTLINED_FUNCTION_19();
}

void __VTP_SetIDSReadHandler_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_8_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VTP/VTransport.m:%d: VCDatagramChannelReadHandler failed due to invalid handle.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __VTP_SetIDSReadHandler_block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "VTP_SetIDSReadHandler_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VTP/VTransport.m:%d: VTP packet allocation failed. Datagram size=%d", v2, *(const char **)v3, (unint64_t)"VTP_SetIDSReadHandler_block_invoke" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __VTP_SetIDSReadHandler_block_invoke_cold_3()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "VTP_SetIDSReadHandler_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d Process packet type failed with error=0x%08X", v1);
  OUTLINED_FUNCTION_3();
}

void __VTP_SetIDSReadHandler_block_invoke_cold_4(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "dataPath");
  v8 = 136315906;
  v9 = a1;
  v10 = 2080;
  v11 = "VTP_SetIDSReadHandler_block_invoke";
  OUTLINED_FUNCTION_4();
  v12 = 6318;
  v13 = v5;
  v14 = v6;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a3, v7, " [%s] %s:%d Invalid data path value=%d. Ignoring the packet", (uint8_t *)&v8);
  OUTLINED_FUNCTION_19();
}

void __VTP_SetIDSReadHandler_block_invoke_cold_5()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "VTP_SetIDSReadHandler_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d _VTP_ProcessDatagramOptions failed with error=0x%08X", v1);
  OUTLINED_FUNCTION_3();
}

void __VTP_SetIDSReadHandler_block_invoke_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "_VTP_ProcessDatagramOptions";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VTP/VTransport.m:%d: VTP packet allocation failed, result=%d", v2, *(const char **)v3, (unint64_t)"_VTP_ProcessDatagramOptions" >> 16, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __VTP_SetIDSReadHandler_block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_11_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VTP/VTransport.m:%d: %s: failed due to invalid handle.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_19();
}

void __VTP_SetIDSReadHandler_block_invoke_cold_8()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_3();
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d datagram readHandler received packet from participantID=%llu", v1, 0x26u);
  OUTLINED_FUNCTION_3();
}

void __VTP_SetIDSReadHandler_block_invoke_cold_9()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "VTP_SetIDSReadHandler_block_invoke";
  OUTLINED_FUNCTION_4();
  v4 = 6241;
  v5 = 2048;
  v6 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d Datagram channel [%p] returned empty datagram", v2);
  OUTLINED_FUNCTION_3();
}

@end
