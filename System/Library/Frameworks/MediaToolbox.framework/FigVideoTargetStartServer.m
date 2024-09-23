@implementation FigVideoTargetStartServer

uint64_t __FigVideoTargetStartServer_block_invoke(uint64_t a1)
{
  uint64_t result;

  if (FigServer_IsMediaparserd())
  {
    result = FigSignalErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  else
  {
    FigServer_IsMediaplaybackd();
    result = FigXPCServerStart();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      gCommonVideoTargetServerAsyncQueue = (uint64_t)dispatch_queue_create("CommonFVTServerAsyncQueue", 0);
      return FigWatchdogMonitorDispatchQueue();
    }
  }
  return result;
}

@end
