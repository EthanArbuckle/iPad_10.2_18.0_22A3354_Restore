@implementation MuxedAlphaEncoder

void __MuxedAlphaEncoder_EncodeFrame_block_invoke(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  CFTypeRef v5;
  NSObject *v6;
  const void *v7;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = a3;
  if (cf)
    v5 = CFRetain(cf);
  else
    v5 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = v5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  v6 = *(NSObject **)(a1 + 40);
  if (v6)
    dispatch_release(v6);
  v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v7)
    CFRelease(v7);
}

void __MuxedAlphaEncoder_EncodeFrame_block_invoke_2(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  CFTypeRef v5;
  __int128 v6;
  NSObject *v7;
  NSObject *v8;
  const void *v9;
  _QWORD v10[4];
  int8x16_t v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[4];

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = a3;
  if (cf)
    v5 = CFRetain(cf);
  else
    v5 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = v5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2000000000;
  v16[3] = 0;
  dispatch_retain(*(dispatch_object_t *)(a1 + 56));
  v10[1] = 0x40000000;
  v6 = *(_OWORD *)(a1 + 48);
  v11 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v14 = *(_OWORD *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __MuxedAlphaEncoder_EncodeFrame_block_invoke_3;
  v10[3] = &unk_1E2F63838;
  v12 = v16;
  v7 = *(NSObject **)(v14 + 152);
  v15 = *(_QWORD *)(a1 + 80);
  v13 = v6;
  dispatch_async(v7, v10);
  v8 = *(NSObject **)(a1 + 56);
  if (v8)
    dispatch_release(v8);
  v9 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v9)
    CFRelease(v9);
  _Block_object_dispose(v16, 8);
}

void __MuxedAlphaEncoder_EncodeFrame_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t MuxedAlphaFormatDescription;
  CMFormatDescriptionRef FormatDescription;
  CMFormatDescriptionRef v5;
  uint64_t v6;
  int v7;
  const void *v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  opaqueCMSampleBuffer *v12;
  opaqueCMSampleBuffer *v13;
  const opaqueCMFormatDescription *v14;
  uint64_t v15;
  const void *v16;
  const void *v17;
  const __CFAllocator *v18;
  CFArrayRef v19;
  uint64_t MuxedAlphaDataBuffer;
  const void *v21;
  const void *v22;
  const void *v23;
  NSObject *v24;
  CMTime v25;
  CMTime time1;
  CMTime time2;
  CMTime cf;
  void *values;
  CMSampleBufferRef v30;
  OpaqueCMBlockBuffer *v31;

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  MuxedAlphaFormatDescription = *(unsigned int *)(v2 + 40);
  if ((_DWORD)MuxedAlphaFormatDescription)
    goto LABEL_37;
  MuxedAlphaFormatDescription = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if ((_DWORD)MuxedAlphaFormatDescription)
    goto LABEL_37;
  FormatDescription = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(v2 + 48));
  v5 = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
  v6 = *(_QWORD *)(a1 + 72);
  if (*(_QWORD *)(v6 + 32))
  {
    v7 = FigCFEqual();
    v6 = *(_QWORD *)(a1 + 72);
    if (v7)
    {
      if (FigCFEqual())
        goto LABEL_20;
      v6 = *(_QWORD *)(a1 + 72);
    }
  }
  cf.value = 0;
  v8 = *(const void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = FormatDescription;
  if (FormatDescription)
    CFRetain(FormatDescription);
  if (v8)
    CFRelease(v8);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(const void **)(v9 + 104);
  *(_QWORD *)(v9 + 104) = v5;
  if (v5)
    CFRetain(v5);
  if (v10)
    CFRelease(v10);
  v11 = *(const void **)(*(_QWORD *)(a1 + 72) + 32);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(*(_QWORD *)(a1 + 72) + 32) = 0;
  }
  FigHEVCBridge_CreateAlphaInfoSEI();
  MuxedAlphaFormatDescription = FigHEVCBridge_CreateMuxedAlphaFormatDescription();
  if (cf.value)
    CFRelease((CFTypeRef)cf.value);
  if (!(_DWORD)MuxedAlphaFormatDescription)
  {
LABEL_20:
    v12 = *(opaqueCMSampleBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
    v13 = *(opaqueCMSampleBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
    v14 = *(const opaqueCMFormatDescription **)(*(_QWORD *)(a1 + 72) + 32);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v30 = 0;
    v31 = 0;
    values = 0;
    CMSampleBufferGetDecodeTimeStamp(&cf, v12);
    CMSampleBufferGetDecodeTimeStamp(&time2, v13);
    if (CMTimeCompare(&cf, &time2))
      goto LABEL_46;
    CMSampleBufferGetPresentationTimeStamp(&time1, v12);
    CMSampleBufferGetPresentationTimeStamp(&v25, v13);
    if (CMTimeCompare(&time1, &v25))
      goto LABEL_46;
    v16 = (const void *)*MEMORY[0x1E0CA2620];
    alphaencoder_getSampleBufferSampleAttachment(v12, (const void *)*MEMORY[0x1E0CA2620]);
    alphaencoder_getSampleBufferSampleAttachment(v12, v16);
    if (!FigCFEqual())
      goto LABEL_46;
    v17 = (const void *)*MEMORY[0x1E0CA2618];
    alphaencoder_getSampleBufferSampleAttachment(v12, (const void *)*MEMORY[0x1E0CA2618]);
    alphaencoder_getSampleBufferSampleAttachment(v12, v17);
    if (FigCFEqual()
      && (v18 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00], (values = (void *)FigCFNumberCreateSInt32()) != 0))
    {
      v19 = CFArrayCreate(v18, (const void **)&values, 1, 0);
      if (v19)
      {
        CMSampleBufferGetDataBuffer(v12);
        CMSampleBufferGetDataBuffer(v13);
        MuxedAlphaDataBuffer = FigHEVCBridge_CreateMuxedAlphaDataBuffer();
        if (!(_DWORD)MuxedAlphaDataBuffer)
        {
          MuxedAlphaFormatDescription = alphaencoder_createDerivedSampleBuffer(v12, v13, v31, v14, &v30);
          if (!(_DWORD)MuxedAlphaFormatDescription)
          {
            *(_QWORD *)(v15 + 24) = v30;
            v30 = 0;
          }
          goto LABEL_29;
        }
      }
      else
      {
        MuxedAlphaDataBuffer = FigSignalErrorAt();
      }
      MuxedAlphaFormatDescription = MuxedAlphaDataBuffer;
    }
    else
    {
LABEL_46:
      MuxedAlphaFormatDescription = FigSignalErrorAt();
      v19 = 0;
    }
LABEL_29:
    if (values)
      CFRelease(values);
    if (v19)
      CFRelease(v19);
    if (v31)
      CFRelease(v31);
    if (v30)
      CFRelease(v30);
  }
LABEL_37:
  v21 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  if (v21)
  {
    CFRelease(v21);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = 0;
  }
  v22 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  if (v22)
  {
    CFRelease(v22);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = 0;
  }
  alphaencoder_emitEncodedFrame(*(_QWORD *)(a1 + 80), *(const void **)(a1 + 88), MuxedAlphaFormatDescription, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(opaqueCMSampleBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v23 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v23)
  {
    CFRelease(v23);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  v24 = *(NSObject **)(a1 + 64);
  if (v24)
    dispatch_release(v24);
}

void __MuxedAlphaEncoder_EncodeMultiImageFrame_block_invoke(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  CFTypeRef v5;
  NSObject *v6;
  const void *v7;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = a3;
  if (cf)
    v5 = CFRetain(cf);
  else
    v5 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = v5;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  v6 = *(NSObject **)(a1 + 40);
  if (v6)
    dispatch_release(v6);
  v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v7)
    CFRelease(v7);
}

void __MuxedAlphaEncoder_EncodeMultiImageFrame_block_invoke_2(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  CFTypeRef v5;
  __int128 v6;
  NSObject *v7;
  NSObject *v8;
  const void *v9;
  _QWORD v10[4];
  int8x16_t v11;
  _QWORD *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[4];

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44) = a3;
  if (cf)
    v5 = CFRetain(cf);
  else
    v5 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = v5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2000000000;
  v16[3] = 0;
  dispatch_retain(*(dispatch_object_t *)(a1 + 56));
  v10[1] = 0x40000000;
  v6 = *(_OWORD *)(a1 + 48);
  v11 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v14 = *(_OWORD *)(a1 + 64);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[2] = __MuxedAlphaEncoder_EncodeMultiImageFrame_block_invoke_3;
  v10[3] = &unk_1E2F638F8;
  v12 = v16;
  v7 = *(NSObject **)(v14 + 152);
  v15 = *(_QWORD *)(a1 + 80);
  v13 = v6;
  dispatch_async(v7, v10);
  v8 = *(NSObject **)(a1 + 56);
  if (v8)
    dispatch_release(v8);
  v9 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v9)
    CFRelease(v9);
  _Block_object_dispose(v16, 8);
}

void __MuxedAlphaEncoder_EncodeMultiImageFrame_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t MultiviewMuxedAlphaFormatDescription;
  CMFormatDescriptionRef FormatDescription;
  CMFormatDescriptionRef v5;
  uint64_t v6;
  int v7;
  const void *v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  uint64_t v12;
  _WORD *v13;
  opaqueCMSampleBuffer *v14;
  opaqueCMSampleBuffer *v15;
  uint64_t v16;
  const opaqueCMFormatDescription *v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  const void *v21;
  uint64_t MultiviewMuxedAlphaDataBuffer;
  const void *v23;
  const void *v24;
  const void *v25;
  NSObject *v26;
  CMTime v27;
  CMTime time1;
  CMTime v29;
  CMTime cf;
  CFTypeRef v31;
  OpaqueCMBlockBuffer *v32;

  dispatch_group_wait(*(dispatch_group_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  MultiviewMuxedAlphaFormatDescription = *(unsigned int *)(v2 + 40);
  if ((_DWORD)MultiviewMuxedAlphaFormatDescription)
    goto LABEL_42;
  MultiviewMuxedAlphaFormatDescription = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if ((_DWORD)MultiviewMuxedAlphaFormatDescription)
    goto LABEL_42;
  FormatDescription = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(v2 + 48));
  v5 = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
  v6 = *(_QWORD *)(a1 + 72);
  if (*(_QWORD *)(v6 + 32))
  {
    v7 = FigCFEqual();
    v6 = *(_QWORD *)(a1 + 72);
    if (v7)
    {
      if (FigCFEqual())
        goto LABEL_30;
      v6 = *(_QWORD *)(a1 + 72);
    }
  }
  cf.value = 0;
  v29.value = 0;
  v8 = *(const void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = FormatDescription;
  if (FormatDescription)
    CFRetain(FormatDescription);
  if (v8)
    CFRelease(v8);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(const void **)(v9 + 104);
  *(_QWORD *)(v9 + 104) = v5;
  if (v5)
    CFRetain(v5);
  if (v10)
    CFRelease(v10);
  v11 = *(const void **)(*(_QWORD *)(a1 + 72) + 32);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(*(_QWORD *)(a1 + 72) + 32) = 0;
  }
  FigHEVCBridge_CreateAlphaInfoSEI();
  v12 = *(_QWORD *)(a1 + 72);
  LOWORD(time1.value) = 0;
  v13 = (_WORD *)FigHEVCBridge_AllocThreeDimensionalReferenceDisplaysInfo();
  *(_BYTE *)v13 = 31;
  if (*(_QWORD *)(v12 + 144) || *(_QWORD *)(v12 + 136))
    FigCFArrayGetInt16AtIndex();
  else
    LOWORD(time1.value) = 2;
  v13[4] = time1.value;
  if (*(_QWORD *)(v12 + 144) || *(_QWORD *)(v12 + 136))
    FigCFArrayGetInt16AtIndex();
  else
    LOWORD(time1.value) = 3;
  v13[5] = time1.value;
  FigHEVCBridge_CreateThreeDimensionalReferenceDisplaysInfoSEI();
  free(v13);
  MultiviewMuxedAlphaFormatDescription = FigHEVCBridge_CreateMultiviewMuxedAlphaFormatDescription();
  if (!(_DWORD)MultiviewMuxedAlphaFormatDescription)
  {
    LODWORD(time1.value) = 0;
    MultiviewMuxedAlphaFormatDescription = FigVideoFormatDescriptionDetermineCompatibilityWithCoreMediaRequirementsForHEVCWithAlpha();
  }
  if (cf.value)
    CFRelease((CFTypeRef)cf.value);
  if (v29.value)
    CFRelease((CFTypeRef)v29.value);
  if (!(_DWORD)MultiviewMuxedAlphaFormatDescription)
  {
LABEL_30:
    v14 = *(opaqueCMSampleBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
    v15 = *(opaqueCMSampleBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
    v16 = *(_QWORD *)(a1 + 72);
    v17 = *(const opaqueCMFormatDescription **)(v16 + 32);
    v18 = *(_QWORD *)(v16 + 128);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v32 = 0;
    v31 = 0;
    CMSampleBufferGetDecodeTimeStamp(&cf, v14);
    CMSampleBufferGetDecodeTimeStamp(&v29, v15);
    if (CMTimeCompare(&cf, &v29))
      goto LABEL_53;
    CMSampleBufferGetPresentationTimeStamp(&time1, v14);
    CMSampleBufferGetPresentationTimeStamp(&v27, v15);
    if (CMTimeCompare(&time1, &v27)
      || (v20 = (const void *)*MEMORY[0x1E0CA2620],
          alphaencoder_getSampleBufferSampleAttachment(v14, (const void *)*MEMORY[0x1E0CA2620]),
          alphaencoder_getSampleBufferSampleAttachment(v14, v20),
          !FigCFEqual())
      || (v21 = (const void *)*MEMORY[0x1E0CA2618],
          alphaencoder_getSampleBufferSampleAttachment(v14, (const void *)*MEMORY[0x1E0CA2618]),
          alphaencoder_getSampleBufferSampleAttachment(v14, v21),
          !FigCFEqual()))
    {
LABEL_53:
      MultiviewMuxedAlphaDataBuffer = FigSignalErrorAt();
    }
    else
    {
      if (!v18)
      {
        FigSignalErrorAt();
        MultiviewMuxedAlphaFormatDescription = 0;
        goto LABEL_38;
      }
      CMSampleBufferGetDataBuffer(v14);
      CMSampleBufferGetDataBuffer(v15);
      MultiviewMuxedAlphaDataBuffer = FigHEVCBridge_CreateMultiviewMuxedAlphaDataBuffer();
      if (!(_DWORD)MultiviewMuxedAlphaDataBuffer)
      {
        MultiviewMuxedAlphaFormatDescription = alphaencoder_createDerivedSampleBuffer(v14, v15, v32, v17, (CMSampleBufferRef *)&v31);
        if (!(_DWORD)MultiviewMuxedAlphaFormatDescription)
        {
          *(_QWORD *)(v19 + 24) = v31;
          v31 = 0;
        }
        goto LABEL_38;
      }
    }
    MultiviewMuxedAlphaFormatDescription = MultiviewMuxedAlphaDataBuffer;
LABEL_38:
    if (v32)
      CFRelease(v32);
    if (v31)
      CFRelease(v31);
  }
LABEL_42:
  v23 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  if (v23)
  {
    CFRelease(v23);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = 0;
  }
  v24 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  if (v24)
  {
    CFRelease(v24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = 0;
  }
  alphaencoder_emitEncodedFrame(*(_QWORD *)(a1 + 80), *(const void **)(a1 + 88), MultiviewMuxedAlphaFormatDescription, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(opaqueCMSampleBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v25 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v25)
  {
    CFRelease(v25);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  v26 = *(NSObject **)(a1 + 64);
  if (v26)
    dispatch_release(v26);
}

@end
