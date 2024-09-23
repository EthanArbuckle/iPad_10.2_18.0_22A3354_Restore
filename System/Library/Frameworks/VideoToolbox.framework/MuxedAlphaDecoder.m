@implementation MuxedAlphaDecoder

void __MuxedAlphaDecoder_DecodeFrame_block_invoke(uint64_t a1, int a2, int a3, uint64_t a4, const void *a5)
{
  const void *v7;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = a3;
  if (a2)
    a5 = 0;
  if (a5)
    CFRetain(a5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = a5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = 0;
  }
}

void __MuxedAlphaDecoder_DecodeFrame_block_invoke_2(uint64_t a1, int a2, int a3, uint64_t a4, const void *a5)
{
  const void *v7;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = a3;
  if (a2)
    a5 = 0;
  if (a5)
    CFRetain(a5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = a5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = 0;
  }
}

void __MuxedAlphaDecoder_DecodeFrame_block_invoke_3(uint64_t a1, int a2, int a3, const void *a4)
{
  const void *v6;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = a3;
  if (a2)
    a4 = 0;
  if (a4)
    CFRetain(a4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = a4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v6 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = 0;
  }
}

void __MuxedAlphaDecoder_DecodeFrame_block_invoke_4(uint64_t a1, int a2, int a3, const void *a4)
{
  const void *v6;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = a3;
  if (a2)
    a4 = 0;
  if (a4)
    CFRetain(a4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = a4;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  v6 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = 0;
  }
}

void __MuxedAlphaDecoder_DecodeFrame_block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  const void *v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  OpaqueCMTaggedBufferGroup *v10;
  uint64_t DerivedStorage;
  uint64_t i;
  const __CFArray *v13;
  uint64_t ValueAtIndex;
  uint64_t v15;
  const void *v16;
  const void *v17;
  uint64_t FirstValue;
  const void *v19;
  OpaqueCMTaggedBufferGroup *v20;
  OpaqueCMTaggedBufferGroup *v21;
  OpaqueCMTaggedBufferGroup *v22;
  CMItemCount Count;
  CFIndex v24;
  __CVBuffer *CVPixelBufferAtIndex;
  int v26;
  __CVBuffer *v27;
  int v28;
  __CVBuffer *v29;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_DWORD *)(v2 + 24))
    *(_DWORD *)(v2 + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 44) | *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                              + 44);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24) & 0xFFFFFFFE | (*(_BYTE *)(a1 + 112) != 0);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (*(_BYTE *)(v3 + 136))
  {
    if (!v4)
    {
      v20 = *(OpaqueCMTaggedBufferGroup **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      if (v20)
      {
        if (!*(_BYTE *)(v3 + 124))
        {
          v21 = *(OpaqueCMTaggedBufferGroup **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56);
          v22 = *(OpaqueCMTaggedBufferGroup **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56);
          Count = CMTaggedBufferGroupGetCount(v21);
          if (Count == CMTaggedBufferGroupGetCount(v22))
          {
            if (CMTaggedBufferGroupGetCount(v21) < 1)
            {
LABEL_31:
              v28 = 0;
            }
            else
            {
              v24 = 0;
              while (1)
              {
                CVPixelBufferAtIndex = CMTaggedBufferGroupGetCVPixelBufferAtIndex(v21, v24);
                v26 = CMTaggedBufferGroupGetCVPixelBufferAtIndex(v22, v24);
                v27 = CMTaggedBufferGroupGetCVPixelBufferAtIndex(v20, v24);
                v28 = alphadecoder_mergeBaseAndAlpha(CVPixelBufferAtIndex, v26, v27);
                if (v28)
                  break;
                if (++v24 >= CMTaggedBufferGroupGetCount(v21))
                  goto LABEL_31;
              }
            }
          }
          else
          {
            v28 = FigSignalErrorAt();
          }
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v28;
        }
      }
    }
    v5 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56);
    if (v5)
      CFRelease(v5);
    v6 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56);
    if (v6)
      CFRelease(v6);
    v7 = *(const void **)(a1 + 96);
    v8 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v9 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v10 = *(OpaqueCMTaggedBufferGroup **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    VTVideoDecoderGetCMBaseObject(*(_QWORD *)(a1 + 88));
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    VTDecoderSessionEmitDecodedMultiImageFrame(*(uint64_t **)(DerivedStorage + 8), v7, v8, v9, v10);
    --*(_DWORD *)(DerivedStorage + 120);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(DerivedStorage + 112));
    dispatch_group_leave(*(dispatch_group_t *)(DerivedStorage + 104));
    for (i = 0; ; ++i)
    {
      v13 = *(const __CFArray **)(*(_QWORD *)(a1 + 80) + 128);
      if (v13)
        v13 = (const __CFArray *)CFArrayGetCount(v13);
      if (i >= (uint64_t)v13)
        break;
      ValueAtIndex = FigCFArrayGetValueAtIndex();
      VTDecoderSessionForgetPixelBufferForFrame(*(uint64_t **)(*(_QWORD *)(a1 + 80) + 8), *(_QWORD *)(a1 + 96), ValueAtIndex);
    }
    v15 = *(_QWORD *)(a1 + 64);
  }
  else
  {
    if (!v4)
    {
      v29 = *(__CVBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (v29)
      {
        if (!*(_BYTE *)(v3 + 124))
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = alphadecoder_mergeBaseAndAlpha(*(__CVBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)+ 8)+ 48), v29);
      }
    }
    v16 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
    if (v16)
      CFRelease(v16);
    v17 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
    if (v17)
      CFRelease(v17);
    alphadecoder_emitDecodedFrame(*(_QWORD *)(a1 + 88), *(const void **)(a1 + 96), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(__CVBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    FirstValue = FigCFArrayGetFirstValue();
    VTDecoderSessionForgetPixelBufferForFrame(*(uint64_t **)(*(_QWORD *)(a1 + 80) + 8), *(_QWORD *)(a1 + 96), FirstValue);
    v15 = *(_QWORD *)(a1 + 72);
  }
  v19 = *(const void **)(*(_QWORD *)(v15 + 8) + 24);
  if (v19)
    CFRelease(v19);
  dispatch_release(*(dispatch_object_t *)(a1 + 104));
}

@end
