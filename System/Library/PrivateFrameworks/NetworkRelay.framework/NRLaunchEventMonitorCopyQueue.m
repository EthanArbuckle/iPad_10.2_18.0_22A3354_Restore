@implementation NRLaunchEventMonitorCopyQueue

void __NRLaunchEventMonitorCopyQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (_NRShouldDebugAutoRelease_onceToken != -1)
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_30);
  if ((_NRShouldDebugAutoRelease_debugAutoRelease & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = dispatch_queue_create("com.apple.networkrelay.launchEventMonitor", v0);

  if (!v1)
  {
    v3 = nrCopyLogObj_25();
    if (sNRCopyLogToStdErr)
    {

    }
    else
    {
      v4 = v3;
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

      if (!v5)
      {
LABEL_13:
        _os_log_pack_size();
        MEMORY[0x1E0C80A78]();
        __error();
        v12 = _os_log_pack_fill();
        *(_DWORD *)v12 = 136446466;
        *(_QWORD *)(v12 + 4) = "nr_dispatch_queue_create";
        *(_WORD *)(v12 + 12) = 2080;
        *(_QWORD *)(v12 + 14) = "com.apple.networkrelay.launchEventMonitor";
        v13 = nrCopyLogObj_25();
        _NRLogAbortWithPack(v13);
      }
    }
    v6 = nrCopyLogObj_25();
    _NRLogWithArgs((uint64_t)v6, 16, (uint64_t)"%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed", v7, v8, v9, v10, v11, (uint64_t)");

    goto LABEL_13;
  }
  v2 = (void *)NRLaunchEventMonitorCopyQueue_queue;
  NRLaunchEventMonitorCopyQueue_queue = (uint64_t)v1;

}

@end
