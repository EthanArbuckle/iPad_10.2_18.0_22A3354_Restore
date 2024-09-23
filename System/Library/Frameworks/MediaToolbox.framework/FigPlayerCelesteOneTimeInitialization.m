@implementation FigPlayerCelesteOneTimeInitialization

uint64_t __FigPlayerCelesteOneTimeInitialization_block_invoke(uint64_t a1)
{
  uint64_t result;
  IONotificationPort *v3;
  const char *v4;
  NSObject *global_queue;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  FigByteStreamFactorySetCachedFileByteStreamEnable(1);
  result = FigCFWeakReferenceTableCreate();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    result = FigCFWeakReferenceTableCreate();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      qword_1EE2A1FA8 = FigSimpleMutexCreate();
      if (qword_1EE2A1FA8)
      {
        result = FigThreadAllocKey();
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
        if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        {
          CentralOneTimeSetup();
          gRootPowerDomainPort = IORegisterForSystemPower(0, (IONotificationPortRef *)&gRootPowerNotificationPort, (IOServiceInterestCallback)FigServer_SleepCallBack, &gRootPowerNotifier);
          if (gRootPowerDomainPort)
          {
            v3 = (IONotificationPort *)gRootPowerNotificationPort;
            if (playerceleste_getSharedQueue_onceToken != -1)
              dispatch_once(&playerceleste_getSharedQueue_onceToken, &__block_literal_global_14_1);
            IONotificationPortSetDispatchQueue(v3, (dispatch_queue_t)playerceleste_getSharedQueue_sharedQueue);
          }
          if ((_os_feature_enabled_impl() & 1) == 0)
          {
            v4 = (const char *)*MEMORY[0x1E0C83A00];
            global_queue = dispatch_get_global_queue(0, 0);
            notify_register_dispatch(v4, (int *)&fpServer_RegisterForThermalNotifications_thermalPressureToken, global_queue, &__block_literal_global_26_1);
          }
          return FigInstallSysdiagnoseBlock();
        }
      }
      else
      {
        result = FigSignalErrorAt();
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
      }
    }
  }
  return result;
}

void __FigPlayerCelesteOneTimeInitialization_block_invoke_2()
{
  if (playerceleste_getSharedQueue_onceToken != -1)
    dispatch_once(&playerceleste_getSharedQueue_onceToken, &__block_literal_global_14_1);
  dispatch_sync((dispatch_queue_t)playerceleste_getSharedQueue_sharedQueue, &__block_literal_global_12_1);
}

uint64_t __FigPlayerCelesteOneTimeInitialization_block_invoke_3()
{
  return FigCFWeakReferenceTableApplyFunction();
}

@end
