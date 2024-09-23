@implementation HandleNewClientConnection

void __figXPC_HandleNewClientConnection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  int64_t int64;
  double v6;
  const __CFString *EnvironmentName;
  uint64_t v8;
  _xpc_connection_s *v9;
  void *v10;
  pid_t pid;
  void *context;
  CFTypeRef v13;

  v4 = MEMORY[0x193FFCDCC](a2);
  if ((isFirstTime & 1) == 0)
  {
    if (FigServer_GetEnvironment())
    {
      int64 = xpc_dictionary_get_int64(a2, ".Date");
      if (int64 >= 1)
      {
        v6 = (double)((FigGetUpTimeNanoseconds() - int64) / 0xF4240);
        EnvironmentName = FigServer_GetEnvironmentName();
        FigCAStatsReportingSubmitData(EnvironmentName, (uint64_t)CFSTR("com.apple.coremedia.serverstartup"), (uint64_t)CFSTR("startupTime"), v6);
      }
    }
  }
  if (v4 == MEMORY[0x1E0C812F8])
  {
    figXPC_HandleMessage(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_xpc_connection_s **)(a1 + 48), a2);
  }
  else if (v4 == MEMORY[0x1E0C81310] && a2 == (void *)MEMORY[0x1E0C81260])
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_xpc_connection_s **)(a1 + 48);
    v10 = (void *)xpc_connection_copy_invalidation_reason();
    pid = xpc_connection_get_pid(v9);
    context = xpc_connection_get_context(v9);
    if (context)
      v13 = CFRetain(context);
    else
      v13 = 0;
    FigApplicationStateMonitorRemovePIDToIgnore(*((_DWORD *)v13 + 40));
    FigSimpleMutexLock(*(pthread_mutex_t **)(v8 + 112));
    FigServer_RememberProcessInfoForAFewSeconds(*((CFTypeRef *)v13 + 3));
    figXPC_ForgetProcessInfo(v8, pid);
    FigSimpleMutexUnlock(*(pthread_mutex_t **)(v8 + 112));
    CFRelease(v13);
    free(v10);
  }
}

@end
