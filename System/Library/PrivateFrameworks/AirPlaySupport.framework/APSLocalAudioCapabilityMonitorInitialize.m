@implementation APSLocalAudioCapabilityMonitorInitialize

void __APSLocalAudioCapabilityMonitorInitialize_block_invoke()
{
  uint64_t Instance;
  uint64_t v1;
  uint64_t *v2;
  dispatch_queue_t v3;
  uint64_t v4;
  int v5;

  if (gAPSLocalAudioCapabilityMonitorInitOnce != -1)
    dispatch_once_f(&gAPSLocalAudioCapabilityMonitorInitOnce, 0, (dispatch_function_t)_APSLocalAudioCapabilityMonitorGetTypeID);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    APSLogErrorAt(0);
LABEL_14:
    v5 = -6728;
    goto LABEL_11;
  }
  v1 = Instance;
  *(_OWORD *)(Instance + 16) = 0u;
  v2 = (uint64_t *)(Instance + 16);
  *(_QWORD *)(Instance + 48) = 0;
  *(_OWORD *)(Instance + 32) = 0u;
  v3 = dispatch_queue_create("APSLocalAudioCapabilityMonitor.queue", 0);
  v2[1] = (uint64_t)v3;
  if (!v3 || (v4 = FigSimpleMutexCreate(), (*v2 = v4) == 0))
  {
    APSLogErrorAt(0);
    CFRelease((CFTypeRef)v1);
    goto LABEL_14;
  }
  *(_QWORD *)(v1 + 40) = 0;
  *(_QWORD *)(v1 + 48) = 0;
  if (gLogCategory_APSLocalAudioCapabilityMonitor <= 50
    && (gLogCategory_APSLocalAudioCapabilityMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  gAPSLocalAudioCapabilityMonitor = v1;
  dispatch_async(*(dispatch_queue_t *)(v1 + 24), &__block_literal_global_13);
  v5 = 0;
LABEL_11:
  gCreationErr = v5;
}

@end
