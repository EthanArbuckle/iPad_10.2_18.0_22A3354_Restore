@implementation EnsureInternalStateSetup

void __remoteFigProcessStateMonitor_EnsureInternalStateSetup_block_invoke(uint64_t a1)
{
  const __CFAllocator *Default;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  char *v8;
  os_log_type_t type;
  int v10[2];
  const char *v11;
  __int16 v12;
  int v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  Default = CFAllocatorGetDefault();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigCFWeakReferenceTableCreate(Default, 1, &gStateMonitorPerPID);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    || (gStateMonitorMutex = (uint64_t)FigReentrantMutexCreate()) == 0
    || (gRemotesSupportingPurge = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray")) == 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt(4294947865, 0, 0, 0, 0, 0, 0);
  }
  if (dword_1ECDA84D8 >= 2)
  {
    v10[0] = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type((uint64_t *)qword_1ECDA84D0, 1, v10, &type);
    v4 = v10[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFE;
    if (v6)
    {
      v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v10[1] = 136315394;
      v11 = "remoteFigProcessStateMonitor_EnsureInternalStateSetup_block_invoke";
      v12 = 1024;
      v13 = v7;
      v8 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v4) = v10[0];
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose((uint64_t *)qword_1ECDA84D0, 1u, 1, v8, v8 != &v14, v4, 0, v5);
  }
}

@end
