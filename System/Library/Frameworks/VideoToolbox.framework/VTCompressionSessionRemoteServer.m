@implementation VTCompressionSessionRemoteServer

uint64_t __VTCompressionSessionRemoteServer_PrepareToEncodeFrames_block_invoke(uint64_t a1)
{
  OSStatus v2;

  v2 = VTCompressionSessionPrepareToEncodeFrames(*(VTCompressionSessionRef *)(a1 + 32));
  return VTCompressionSessionRemoteCallbackClient_PrepareToEncodeFramesReturn(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), v2);
}

void __VTCompressionSessionRemoteServer_EncodeFrame_block_invoke(uint64_t a1)
{
  unsigned int *v2;
  const void *v3;
  const void *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;

  if (*(_DWORD *)(a1 + 96))
    FigMachPortReleaseSendRight_();
  v2 = (unsigned int *)MEMORY[0x1E0C83DA0];
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    MEMORY[0x194029090](*MEMORY[0x1E0C83DA0], *(_QWORD *)(a1 + 80));
  if (*(_DWORD *)(a1 + 100))
    MEMORY[0x194029090](*v2, *(_QWORD *)(a1 + 88));
  v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v4)
    CFRelease(v4);
  v5 = 0;
  for (i = 56; i != 256; i += 40)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_DWORD *)(v7 + i - 32))
    {
      FigMachPortReleaseSendRight_();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    if (*(_DWORD *)(v7 + i - 16))
    {
      MEMORY[0x194029090](*v2, *(_QWORD *)(v7 + i - 24));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    if (*(_DWORD *)(v7 + i))
      MEMORY[0x194029090](*v2, *(_QWORD *)(v7 + i - 8));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(const void **)(v8 + v5 + 32);
    if (v9)
    {
      CFRelease(v9);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    }
    v10 = *(const void **)(v8 + v5 + 24);
    if (v10)
    {
      CFRelease(v10);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    }
    v11 = *(const void **)(v8 + v5 + 40);
    if (v11)
      CFRelease(v11);
    v5 += 24;
  }
  v12 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v12)
    CFRelease(v12);
}

uint64_t __VTCompressionSessionRemoteServer_EncodeFrame_block_invoke_2(uint64_t a1)
{
  OpaqueCMTaggedBufferGroup *v2;
  OpaqueVTCompressionSession *v3;
  const __CFDictionary *v4;
  void *v5;
  OSStatus v6;
  __CVBuffer *v7;
  const __CFDictionary *v8;
  void *v9;
  int v10;
  uint64_t v11;
  CMTime v13;
  CMTime presentationTimeStamp;
  VTEncodeInfoFlags infoFlagsOut;

  infoFlagsOut = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 144) = 1;
  v2 = *(OpaqueCMTaggedBufferGroup **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v3 = *(OpaqueVTCompressionSession **)(a1 + 72);
  if (v2)
  {
    v4 = *(const __CFDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v5 = *(void **)(a1 + 80);
    presentationTimeStamp = *(CMTime *)(a1 + 88);
    v13 = *(CMTime *)(a1 + 112);
    v6 = VTCompressionSessionEncodeMultiImageFrame(v3, v2, &presentationTimeStamp, &v13, v4, v5, &infoFlagsOut);
  }
  else
  {
    v7 = *(__CVBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v8 = *(const __CFDictionary **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v9 = *(void **)(a1 + 80);
    presentationTimeStamp = *(CMTime *)(a1 + 88);
    v13 = *(CMTime *)(a1 + 112);
    v6 = VTCompressionSessionEncodeFrame(v3, v7, &presentationTimeStamp, &v13, v8, v9, &infoFlagsOut);
  }
  v10 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return VTCompressionSessionRemoteCallbackClient_EncodeReturn(*(_DWORD *)(v11 + 40), *(_QWORD *)(v11 + 48), infoFlagsOut, 1, v10);
}

uint64_t __VTCompressionSessionRemoteServer_CompleteFrames_block_invoke(uint64_t a1)
{
  OpaqueVTCompressionSession *v2;
  OSStatus v3;
  CMTime v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  FigSemaphoreSignal();
  v2 = *(OpaqueVTCompressionSession **)(a1 + 40);
  v5 = *(CMTime *)(a1 + 48);
  v3 = VTCompressionSessionCompleteFrames(v2, &v5);
  return VTCompressionSessionRemoteCallbackClient_CompleteFramesReturn(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v3);
}

uint64_t __VTCompressionSessionRemoteServer_PrepareToEncodeTiles_block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v5;

  v5 = 0;
  v2 = VTTileCompressionSessionPrepareToEncodeTiles(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), &v5);
  v3 = HIDWORD(v5);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 28) = v3;
  return VTCompressionSessionRemoteCallbackClient_PrepareToEncodeTilesReturn(*(_DWORD *)(*(_QWORD *)(a1 + 48) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v2);
}

uint64_t __VTCompressionSessionRemoteServer_EncodeTile_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unsigned int *v5;
  const void *v6;
  const void *v7;
  int v9;

  v9 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(v3 + 144) = 1;
  v4 = VTTileCompressionSessionEncodeTile(v2, *(const void **)(a1 + 48), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), &v9);
  if (*(_DWORD *)(a1 + 104))
    FigMachPortReleaseSendRight_();
  v5 = (unsigned int *)MEMORY[0x1E0C83DA0];
  if (*(_DWORD *)(a1 + 108))
    MEMORY[0x194029090](*MEMORY[0x1E0C83DA0], *(_QWORD *)(a1 + 72));
  if (*(_DWORD *)(a1 + 112))
    MEMORY[0x194029090](*v5, *(_QWORD *)(a1 + 80));
  v6 = *(const void **)(a1 + 48);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(a1 + 56);
  if (v7)
    CFRelease(v7);
  return VTCompressionSessionRemoteCallbackClient_EncodeReturn(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v9, 1, v4);
}

uint64_t __VTCompressionSessionRemoteServer_CompleteTiles_block_invoke(uint64_t a1)
{
  int v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  FigSemaphoreSignal();
  v2 = VTTileCompressionSessionCompleteTiles(*(_QWORD *)(a1 + 40));
  return VTCompressionSessionRemoteCallbackClient_CompleteFramesReturn(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v2);
}

void __VTCompressionSessionRemoteServer_EstimateMotion_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char *v5;
  int v6;
  unsigned int *v7;
  const void *v8;
  const void *v9;
  uint64_t v10;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 144) = 1;
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = __VTCompressionSessionRemoteServer_EstimateMotion_block_invoke_2;
  v11[3] = &unk_1E2F24A80;
  v4 = *(_QWORD *)(a1 + 64);
  v11[5] = &v12;
  v11[6] = v4;
  v5 = *(char **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v6 = VTMotionEstimationSessionEstimateMotionVectors(v5, v2, v3, 0, 0, v11);
  if (*(_DWORD *)(a1 + 88))
    FigMachPortReleaseSendRight_();
  v7 = (unsigned int *)MEMORY[0x1E0C83DA0];
  if (*(_DWORD *)(a1 + 92))
    MEMORY[0x194029090](*MEMORY[0x1E0C83DA0], *(_QWORD *)(a1 + 72));
  v8 = *(const void **)(a1 + 48);
  if (v8)
    CFRelease(v8);
  if (*(_DWORD *)(a1 + 96))
    FigMachPortReleaseSendRight_();
  if (*(_DWORD *)(a1 + 100))
    MEMORY[0x194029090](*v7, *(_QWORD *)(a1 + 80));
  v9 = *(const void **)(a1 + 56);
  if (v9)
    CFRelease(v9);
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  VTCompressionSessionRemoteCallbackClient_EncodeReturn(*(_DWORD *)(v10 + 40), *(_QWORD *)(v10 + 48), *((_DWORD *)v13 + 6), 1, v6);
  _Block_object_dispose(&v12, 8);
}

void __VTCompressionSessionRemoteServer_EstimateMotion_block_invoke_2(_QWORD *a1, int a2, int a3, const void *a4, const void *a5)
{
  _QWORD *v10;
  _QWORD *v11;
  CFTypeRef v12;
  CFTypeRef v13;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 176))
  {
    v10 = malloc_type_calloc(1uLL, 0x30uLL, 0x10E00405F1B3371uLL);
    if (v10)
    {
      v11 = v10;
      v10[1] = a1[6];
      *((_DWORD *)v10 + 4) = a2;
      *((_DWORD *)v10 + 5) = a3;
      if (a4)
        v12 = CFRetain(a4);
      else
        v12 = 0;
      v11[3] = v12;
      v11[4] = 0;
      if (a5)
        v13 = CFRetain(a5);
      else
        v13 = 0;
      v11[5] = v13;
      *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
      vtcss_enqueueFrame(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24), (uint64_t)v11);
    }
    else
    {
      FigSignalErrorAt();
    }
  }
}

uint64_t __VTCompressionSessionRemoteServer_CompleteMotionEstimation_block_invoke(uint64_t a1)
{
  int v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  FigSemaphoreSignal();
  v2 = VTMotionEstimationSessionCompleteFrames(*(_BYTE **)(a1 + 40));
  return VTCompressionSessionRemoteCallbackClient_CompleteFramesReturn(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v2);
}

@end
