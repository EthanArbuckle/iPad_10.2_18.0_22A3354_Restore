@implementation FigOctaviaVideoRenderPipelineCreate

void __FigOctaviaVideoRenderPipelineCreate_block_invoke(uint64_t a1, int a2, OpaqueCMBlockBuffer *a3)
{
  uint64_t v5;
  __CFString **v6;
  uint64_t DerivedStorage;
  OpaqueCMTimebase *v8;
  CMTime v9;
  CMTime timebaseTime;
  CMTime v11;
  CMTime v12;
  Float64 destination;

  v5 = *(_QWORD *)(a1 + 32);
  CMBaseObjectGetDerivedStorage();
  if (a2 <= 1852138851)
  {
    switch(a2)
    {
      case 828797549:
        v6 = kFigRenderPipelineNotification_FirstVideoFrameEnqueued;
        break;
      case 945976678:
        v6 = (__CFString **)MEMORY[0x1E0CA2778];
        break;
      case 1684370034:
        v6 = kFigRenderPipelineNotification_DecodeError;
        break;
      default:
        return;
    }
    goto LABEL_13;
  }
  switch(a2)
  {
    case 1936093805:
      v6 = kFigRenderPipelineNotification_SynchronousFrameEnqueued;
LABEL_13:
      octrp_reflectNeroNotification(v5, *v6, (uint64_t)a3);
      return;
    case 1918989413:
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      destination = 0.0;
      v12 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      v11 = v12;
      if (CMBlockBufferGetDataLength(a3) == 56
        && !CMBlockBufferCopyDataBytes(a3, 0, 8uLL, &destination)
        && !CMBlockBufferCopyDataBytes(a3, 8uLL, 0x18uLL, &v12)
        && !CMBlockBufferCopyDataBytes(a3, 0x20uLL, 0x18uLL, &v11))
      {
        v8 = *(OpaqueCMTimebase **)(DerivedStorage + 120);
        timebaseTime = v12;
        v9 = v11;
        CMTimebaseSetRateAndAnchorTime(v8, destination, &timebaseTime, &v9);
      }
      break;
    case 1852138852:
      FigAtomicIncrement32();
      octrp_sendSampleBuffersToNeroIfNeeded();
      break;
  }
}

@end
