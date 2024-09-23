@implementation CopyContextAccessQueue

dispatch_queue_t __CopyContextAccessQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("FPDS Context Management", 0);
  gContextSerialAccessQueue = (uint64_t)result;
  return result;
}

void __CopyContextAccessQueue_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  size_t lengthAtOffsetOut;
  int v8;
  char *dataPointerOut;
  uint64_t v10;

  v2 = gCurrentContextQueue;
  if (!gCurrentContextQueue)
  {
    gCurrentContextQueue = (uint64_t)dispatch_queue_create("FPDS Context Access", 0);
    if (gCurrentContextQueue)
    {
      v10 = 0;
      dataPointerOut = 0;
      v8 = 0;
      lengthAtOffsetOut = 0;
      u8tyhm3ety((uint64_t)&v10);
      if (!FAIRPLAY_CALL_LOG(v3) && !FigCreateBlockBufferCopyingMemoryBlock())
      {
        FigTransportGetRemoteRootObject();
        if (!NeroTransportSendSyncMessageCreatingReply()
          && !CMBlockBufferGetDataPointer(0, 0, &lengthAtOffsetOut, 0, &dataPointerOut))
        {
          Fhjfdethrte87erhy4();
          FAIRPLAY_CALL_LOG(v4);
        }
      }
      if (v10)
      {
        jEHf8Xzsv8K(v10);
        FAIRPLAY_CALL_LOG(v5);
        v10 = 0;
      }
      dispatch_release((dispatch_object_t)gCurrentContextQueue);
      v2 = 0;
      gCurrentContextQueue = 0;
    }
    else
    {
      v2 = 0;
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  v6 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v6)
    dispatch_retain(v6);
}

@end
