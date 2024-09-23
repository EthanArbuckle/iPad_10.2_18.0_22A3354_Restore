@implementation VTDecompressionSessionRemoteServer

uint64_t *__VTDecompressionSessionRemoteServer_Destroy_block_invoke(uint64_t a1)
{
  uint64_t i;
  uint64_t *result;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;

  for (i = *(_QWORD *)(a1 + 32); ; i = *(_QWORD *)(a1 + 32))
  {
    v5 = *(uint64_t **)(i + 120);
    v4 = (uint64_t *)(i + 120);
    result = v5;
    if (!v5)
      break;
    v6 = *result;
    *v4 = *result;
    if (!v6)
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = *(_QWORD *)(a1 + 32) + 120;
    vtdss_freeQueuedFrame(result);
    FigSemaphoreSignal();
  }
  return result;
}

void __VTDecompressionSessionRemoteServer_DecodeFrame_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  const void *v5;
  const void *v6;
  CMTime v7;
  int v8;

  v8 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v2 + 152) = 1;
  CMSampleBufferGetPresentationTimeStamp(&v7, *(CMSampleBufferRef *)(a1 + 40));
  *(CMTime *)(v2 + 224) = v7;
  v3 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v3 + 248) = *(_QWORD *)(a1 + 48);
  v4 = VTDecompressionSessionDecodeFrameWithOptions(*(_QWORD *)(v3 + 24), *(opaqueCMSampleBuffer **)(a1 + 40), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), &v8);
  VTDecompressionSessionRemoteCallbackClient_DecodeFrameReturn(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), v8, 1, v4);
  if (*(_DWORD *)(a1 + 76))
    FigMachPortReleaseSendRight_();
  if (*(_DWORD *)(a1 + 80))
    MEMORY[0x194029090](*MEMORY[0x1E0C83DA0], *(_QWORD *)(a1 + 64));
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 56);
  if (v6)
    CFRelease(v6);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __VTDecompressionSessionRemoteServer_FinishDelayedFrames_block_invoke(uint64_t a1)
{
  OSStatus v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 0;
  FigSemaphoreSignal();
  v2 = VTDecompressionSessionFinishDelayedFrames(*(VTDecompressionSessionRef *)(*(_QWORD *)(a1 + 32) + 24));
  VTDecompressionSessionRemoteCallbackClient_FinishDelayedFramesReturn(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), v2);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

double __VTDecompressionSessionRemoteServer_GetMinOutputPresentationTimeStampOfFramesBeingDecoded_block_invoke(uint64_t a1)
{
  uint64_t *i;
  uint64_t v3;
  double result;
  CMTime v5;
  CMTime time1;
  CMTime v7;

  for (i = *(uint64_t **)(*(_QWORD *)(a1 + 40) + 120); i; i = (uint64_t *)*i)
  {
    time1 = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v5 = *(CMTime *)(i + 5);
    CMTimeMinimum(&v7, &time1, &v5);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_QWORD *)(v3 + 40) = v7.epoch;
    result = *(double *)&v7.value;
    *(_OWORD *)(v3 + 24) = *(_OWORD *)&v7.value;
  }
  return result;
}

double __VTDecompressionSessionRemoteServer_GetMinAndMaxOutputPresentationTimeStampOfFramesBeingDecoded_block_invoke(_QWORD *a1)
{
  uint64_t *i;
  uint64_t v3;
  double result;
  CMTime v5;
  CMTime time2;
  CMTime time1;
  CMTime v8;

  for (i = *(uint64_t **)(a1[6] + 120); i; i = (uint64_t *)*i)
  {
    time1 = *(CMTime *)(*(_QWORD *)(a1[4] + 8) + 24);
    time2 = *(CMTime *)(i + 5);
    CMTimeMinimum(&v8, &time1, &time2);
    *(CMTime *)(*(_QWORD *)(a1[4] + 8) + 24) = v8;
    time1 = *(CMTime *)(*(_QWORD *)(a1[5] + 8) + 24);
    time2 = *(CMTime *)(i + 5);
    CMTimeMaximum(&v5, &time1, &time2);
    v3 = *(_QWORD *)(a1[5] + 8);
    *(_QWORD *)(v3 + 40) = v5.epoch;
    result = *(double *)&v5.value;
    *(_OWORD *)(v3 + 24) = *(_OWORD *)&v5.value;
  }
  return result;
}

void __VTDecompressionSessionRemoteServer_DecodeTile_block_invoke(uint64_t a1)
{
  opaqueCMSampleBuffer *v2;
  uint64_t v3;
  int v4;
  const void *v5;
  const void *v6;
  int v7;

  v7 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(opaqueCMSampleBuffer **)(a1 + 40);
  *(_BYTE *)(v3 + 152) = 1;
  v4 = VTTileDecompressionSessionDecodeTile(*(_QWORD *)(v3 + 32), v2, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(void **)(a1 + 48), *(_QWORD *)(a1 + 80), *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 56), &v7);
  VTDecompressionSessionRemoteCallbackClient_DecodeFrameReturn(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), v7, 1, v4);
  if (*(_DWORD *)(a1 + 92))
    FigMachPortReleaseSendRight_();
  if (*(_DWORD *)(a1 + 96))
    FigMachPortReleaseSendRight_();
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 48);
  if (v6)
    CFRelease(v6);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __VTDecompressionSessionRemoteServer_FinishDelayedTiles_block_invoke(uint64_t a1)
{
  int v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 0;
  FigSemaphoreSignal();
  v2 = VTTileDecompressionSessionFinishDelayedTiles(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  VTDecompressionSessionRemoteCallbackClient_FinishDelayedFramesReturn(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), v2);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
