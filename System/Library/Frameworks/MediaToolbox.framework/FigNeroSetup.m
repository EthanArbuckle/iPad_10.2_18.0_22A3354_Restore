@implementation FigNeroSetup

void __FigNeroSetup_block_invoke(uint64_t a1, uint64_t a2, CMBlockBufferRef theSourceBuffer)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, CMBlockBufferRef, char *);
  NSObject *v8;
  uint64_t block;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  CMBlockBufferRef v13;
  CMBlockBufferRef v14;
  char v15;
  int destination;

  v5 = *(_QWORD *)(a1 + 32);
  destination = 0;
  if (!*(_BYTE *)(v5 + 114))
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v5 + 120), 0xFFFFFFFFFFFFFFFFLL);
  v15 = 0;
  v6 = *(_QWORD *)(v5 + 152);
  if (v6)
  {
    v7 = *(void (**)(uint64_t, uint64_t, CMBlockBufferRef, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 16);
    if (v7)
      v7(v6, a2, theSourceBuffer, &v15);
  }
  if ((int)a2 <= 1684628835)
  {
    if ((_DWORD)a2 != 1635151988)
    {
      if ((_DWORD)a2 != 1651470958)
        return;
      if (theSourceBuffer)
        CMBlockBufferCopyDataBytes(theSourceBuffer, 0, 4uLL, &destination);
      *(_BYTE *)(v5 + 113) = 1;
      if (*(_QWORD *)(v5 + 128))
        nero_tellOctaviaDisplayWasAttached(v5);
      CMNotificationCenterGetDefaultLocalCenter();
      goto LABEL_24;
    }
    if (theSourceBuffer)
      CFRetain(theSourceBuffer);
    v8 = *(NSObject **)(v5 + 48);
    block = MEMORY[0x1E0C809B0];
    v10 = 0x40000000;
    v11 = __nero_asyncMessageHandler_block_invoke_2;
    v12 = &__block_descriptor_tmp_60_2;
    v13 = theSourceBuffer;
LABEL_22:
    dispatch_async(v8, &block);
    return;
  }
  if ((_DWORD)a2 != 1684628836)
  {
    if ((_DWORD)a2 != 1870031993)
      return;
    if (theSourceBuffer)
      CFRetain(theSourceBuffer);
    v8 = *(NSObject **)(v5 + 48);
    block = MEMORY[0x1E0C809B0];
    v10 = 0x40000000;
    v11 = __nero_asyncMessageHandler_block_invoke;
    v12 = &__block_descriptor_tmp_59_3;
    v13 = (CMBlockBufferRef)v5;
    v14 = theSourceBuffer;
    goto LABEL_22;
  }
  *(_BYTE *)(v5 + 113) = 0;
  nero_reset((_QWORD *)v5);
  CMNotificationCenterGetDefaultLocalCenter();
LABEL_24:
  CMNotificationCenterPostNotification();
}

void __FigNeroSetup_block_invoke_2(uint64_t a1, int a2, CMBlockBufferRef theSourceBuffer, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t BBufFromPointer;
  CFTypeRef value;
  _QWORD *v11;
  uint64_t CFTypeFromSerializedAtomDataBlockBuffer;
  const __CFAllocator *v13;
  const opaqueCMFormatDescription *ValueAtIndex;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  uint64_t v17;
  const __CFAllocator *v18;
  char *v19;
  const void *v20;
  __CFArray *v21;
  __CFDictionary *MutableCopy;
  const __CFDictionary *v23;
  const void *v24;
  uint64_t v25;
  __CFDictionary *Mutable;
  uint64_t v27;
  uint64_t CMBaseObject;
  uint64_t (*v29)(uint64_t, const __CFString *, const __CFAllocator *, CFTypeRef *);
  uint64_t v30;
  void (*v31)(uint64_t, const __CFString *, const __CFAllocator *, CFTypeRef *);
  uint64_t v32;
  void (*v33)(uint64_t, const __CFString *, const __CFAllocator *, CFTypeRef *);
  const __CFDictionary *v34;
  const void *v35;
  __CFArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t FigBaseObject;
  void (*v40)(uint64_t, const __CFString *, const void *);
  const __CFDictionary *v41;
  __CFDictionary *DictionaryRepresentation;
  uint64_t v43;
  void (*v44)(uint64_t, const __CFString *, __CFDictionary *);
  uint64_t v45;
  CFTypeRef v46;
  NSObject *v47;
  CFTypeRef v48;
  CFTypeRef v49;
  CFTypeRef v50;
  CFTypeRef v51;
  uint64_t v52;
  CFTypeRef v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, const __CFString *, const __CFAllocator *, char *);
  uint64_t v56;
  __int128 v57;
  CMTimeEpoch v58;
  opaqueCMBufferQueue *v59;
  uint64_t v60;
  VTDecompressionOutputCallbackRecord destination;
  void (*v62)(uint64_t, int, uint64_t, uint64_t);
  void *v63;
  char *v64;
  CFTypeRef v65;
  CFTypeRef v66;
  CFTypeRef v67;
  CFTypeRef v68;
  CFTypeRef v69;
  uint64_t v70;
  CFTypeRef cf;
  CMTime v72;
  void *v73;
  char *v74;
  const __CFDictionary *v75;
  CFTypeRef v76;

  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v7 + 114))
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v7 + 120), 0xFFFFFFFFFFFFFFFFLL);
  if (a2 == 1668703347)
  {
    v11 = malloc_type_calloc(1uLL, 0x20uLL, 0x10200404161829EuLL);
    v75 = 0;
    v76 = 0;
    v11[2] = dispatch_queue_create("nero.decompressionsession", 0);
    v11[3] = CFRetain(*(CFTypeRef *)(v7 + 24));
    CFTypeFromSerializedAtomDataBlockBuffer = CMBlockBufferCopyDataBytes(theSourceBuffer, 0, 8uLL, v11 + 1);
    if ((_DWORD)CFTypeFromSerializedAtomDataBlockBuffer)
      goto LABEL_16;
    v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CFTypeFromSerializedAtomDataBlockBuffer = FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer();
    if ((_DWORD)CFTypeFromSerializedAtomDataBlockBuffer)
      goto LABEL_16;
    if (CFArrayGetCount(v75) == 2)
    {
      ValueAtIndex = (const opaqueCMFormatDescription *)CFArrayGetValueAtIndex(v75, 0);
      v15 = (const __CFDictionary *)CFArrayGetValueAtIndex(v75, 1);
      destination.decompressionOutputCallback = (VTDecompressionOutputCallback)nds_didDecodeFrame;
      destination.decompressionOutputRefCon = v11;
      CFTypeFromSerializedAtomDataBlockBuffer = VTDecompressionSessionCreate(v13, ValueAtIndex, 0, v15, &destination, (VTDecompressionSessionRef *)v11);
      if ((_DWORD)CFTypeFromSerializedAtomDataBlockBuffer
        || (v72.value = MEMORY[0x1E0C809B0],
            *(_QWORD *)&v72.timescale = 0x40000000,
            v72.epoch = (CMTimeEpoch)__nero_createVideoDecompressionSession_block_invoke,
            v73 = &__block_descriptor_tmp_88_1,
            v74 = (char *)v11,
            CFTypeFromSerializedAtomDataBlockBuffer = NeroTransportRegisterObject(),
            (_DWORD)CFTypeFromSerializedAtomDataBlockBuffer))
      {
LABEL_16:
        BBufFromPointer = CFTypeFromSerializedAtomDataBlockBuffer;
LABEL_17:
        value = 0;
        goto LABEL_18;
      }
      BBufFromPointer = FigTransportCreateBBufFromPointer();
      if ((_DWORD)BBufFromPointer)
        goto LABEL_17;
      v11 = 0;
      value = v76;
      v76 = 0;
    }
    else
    {
      value = 0;
      BBufFromPointer = 4294954516;
    }
LABEL_18:
    nds_destroy((uint64_t)v11);
    if (v76)
      CFRelease(v76);
    v16 = v75;
    if (!v75)
      goto LABEL_43;
LABEL_42:
    CFRelease(v16);
    goto LABEL_43;
  }
  if (a2 == 1668706928)
  {
    v75 = 0;
    v76 = 0;
    v70 = 0;
    cf = 0;
    v68 = 0;
    v69 = 0;
    v66 = 0;
    v67 = 0;
    v65 = 0;
    v17 = CMBlockBufferCopyDataBytes(theSourceBuffer, 0, 8uLL, &v70);
    if ((_DWORD)v17)
      goto LABEL_24;
    v18 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v17 = FigRemote_CreateCFTypeFromSerializedAtomDataBlockBuffer();
    if ((_DWORD)v17)
      goto LABEL_24;
    if (v75)
      MutableCopy = CFDictionaryCreateMutableCopy(v18, 0, v75);
    else
      MutableCopy = CFDictionaryCreateMutable(v18, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v23 = MutableCopy;
    v24 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionaryAddValue(MutableCopy, CFSTR("AllowClientProcessDecode"), (const void *)*MEMORY[0x1E0C9AE50]);
    if (v75)
      CFRelease(v75);
    v75 = v23;
    v25 = *(_QWORD *)(v7 + 96);
    if (v25)
    {
      v17 = FigToolViewCopyPixelBufferAttributes((uint64_t)v18, v25, (__CFDictionary **)&cf);
      if (!(_DWORD)v17)
      {
        v17 = FigVisualContextCreateBasic((uint64_t)v18, 0, &v68);
        if (!(_DWORD)v17)
        {
          if (v75)
            Mutable = CFDictionaryCreateMutableCopy(v18, 0, v75);
          else
            Mutable = CFDictionaryCreateMutable(v18, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v34 = Mutable;
          CFDictionaryAddValue(Mutable, CFSTR("ShouldRotateAndScale"), v24);
          if (v75)
            CFRelease(v75);
          v75 = v34;
          goto LABEL_75;
        }
      }
    }
    else
    {
      v27 = *(_QWORD *)(v7 + 152);
      if (v27)
      {
        CMBaseObject = FigLayerViewGetCMBaseObject(v27);
        v29 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
        if (!v29)
        {
          v19 = 0;
          value = 0;
          v20 = 0;
          v21 = 0;
          BBufFromPointer = 4294954514;
          goto LABEL_25;
        }
        v17 = v29(CMBaseObject, CFSTR("PixelBufferAttributes"), v18, &cf);
        if (!(_DWORD)v17)
        {
          v30 = FigLayerViewGetCMBaseObject(*(_QWORD *)(v7 + 152));
          v31 = *(void (**)(uint64_t, const __CFString *, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
          if (v31)
            v31(v30, CFSTR("VisualContext"), v18, &v68);
          v32 = FigLayerViewGetCMBaseObject(*(_QWORD *)(v7 + 152));
          v33 = *(void (**)(uint64_t, const __CFString *, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
          if (v33)
            v33(v32, CFSTR("ImageQueue"), v18, &v67);
LABEL_75:
          if (*(_BYTE *)(v7 + 144))
            v35 = v24;
          else
            v35 = (const void *)*MEMORY[0x1E0C9AE40];
          v36 = CFArrayCreateMutable(v18, 2, MEMORY[0x1E0C9B378]);
          v21 = v36;
          if (v68)
            CFArrayAppendValue(v36, v68);
          if (v67)
            CFArrayAppendValue(v21, v67);
          v37 = FigImageQueueTableCreate(v18, &v65);
          if ((_DWORD)v37
            || (FigImageQueueTableUpdateToMatchOutputsArray((uint64_t)v65, v21, 0, 0, 0, 0),
                v37 = FigImageQueueTableCopyFigImageQueueArray((uint64_t)v65, (uint64_t *)&v66),
                (_DWORD)v37))
          {
            BBufFromPointer = v37;
            v19 = 0;
            value = 0;
            v20 = 0;
            goto LABEL_25;
          }
          if (v68)
            v20 = FigImageQueueTableCopyFigImageQueueForVisualContext((uint64_t)v65, v68);
          else
            v20 = 0;
          v38 = FigVideoRenderPipelineCreateWithFigImageQueueArray(v18, 0, cf, 0, 1, (CFArrayRef)v66, 0, v75, &v69);
          if ((_DWORD)v38)
          {
            BBufFromPointer = v38;
          }
          else
          {
            FigBaseObject = FigRenderPipelineGetFigBaseObject(v69);
            v40 = *(void (**)(uint64_t, const __CFString *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 56);
            if (v40)
              v40(FigBaseObject, CFSTR("ForceFullPowerDecode"), v35);
            v41 = *(const __CFDictionary **)(v7 + 128);
            if (v41)
              nrp_setMinImageBounds((uint64_t)v69, v41);
            DictionaryRepresentation = FigCGSizeCreateDictionaryRepresentation(1920.0, 1200.0);
            v43 = FigRenderPipelineGetFigBaseObject(v69);
            v44 = *(void (**)(uint64_t, const __CFString *, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                       + 56);
            if (v44)
              v44(v43, CFSTR("MaxImageBounds"), DictionaryRepresentation);
            if (DictionaryRepresentation)
              CFRelease(DictionaryRepresentation);
            v46 = v69;
            v45 = v70;
            v47 = *(NSObject **)(v7 + 56);
            v48 = v68;
            v19 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x10600401BDAA220uLL);
            v49 = CFRetain((CFTypeRef)v7);
            v50 = v46;
            *(_QWORD *)v19 = v49;
            *((_DWORD *)v19 + 2) = 1986618469;
            if (v46)
              v50 = CFRetain(v46);
            *((_QWORD *)v19 + 2) = v50;
            *((_QWORD *)v19 + 4) = v45;
            *((_QWORD *)v19 + 5) = v47;
            dispatch_retain(v47);
            if (v48)
            {
              v51 = CFRetain(v48);
              *((_QWORD *)v19 + 6) = v51;
              v52 = *(_QWORD *)(*(_QWORD *)v19 + 96);
              if (v52)
                FigToolViewAddVisualContext(v52, v51);
            }
            if (v20)
              v53 = CFRetain(v20);
            else
              v53 = 0;
            *((_QWORD *)v19 + 7) = v53;
            v54 = FigRenderPipelineGetFigBaseObject(*((_QWORD *)v19 + 2));
            v55 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFAllocator *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
            if (v55)
            {
              BBufFromPointer = v55(v54, CFSTR("SourceSampleBufferQueue"), v18, v19 + 64);
              if (!(_DWORD)BBufFromPointer)
              {
                v56 = MEMORY[0x1E0CA2E18];
                v57 = *MEMORY[0x1E0CA2E18];
                *((_OWORD *)v19 + 5) = *MEMORY[0x1E0CA2E18];
                v58 = *(_QWORD *)(v56 + 16);
                *((_QWORD *)v19 + 12) = v58;
                v59 = (opaqueCMBufferQueue *)*((_QWORD *)v19 + 8);
                *(_OWORD *)&v72.value = v57;
                v72.epoch = v58;
                BBufFromPointer = CMBufferQueueInstallTrigger(v59, (CMBufferQueueTriggerCallback)nrp_sourceQueueDidBecomeReady, v19, 5, &v72, (CMBufferQueueTriggerToken *)v19 + 9);
                if (!(_DWORD)BBufFromPointer)
                {
                  if (nrp_createWithFigRenderPipeline_sNeroRPNotificationNameToMessageTypeDictCreateOnce != -1)
                    dispatch_once(&nrp_createWithFigRenderPipeline_sNeroRPNotificationNameToMessageTypeDictCreateOnce, &__block_literal_global_76_0);
                  CFDictionaryApplyFunction((CFDictionaryRef)sNeroRPNotificationNameToMessageTypeDict, (CFDictionaryApplierFunction)nrp_registerNotificationListener, v19);
                  CMNotificationCenterGetDefaultLocalCenter();
                  CMNotificationCenterAddListener();
                  v19[129] = FigGetCFPreferenceNumberWithDefault() != 0;
                  CFArrayAppendValue(*(CFMutableArrayRef *)(v7 + 136), v19);
                  nero_setVideoGravity(v7);
                  v72.value = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&v72.timescale = 0x40000000;
                  v72.epoch = (CMTimeEpoch)__nero_createVideoRenderPipeline_block_invoke;
                  v73 = &__block_descriptor_tmp_73_2;
                  v74 = v19;
                  destination.decompressionOutputCallback = (VTDecompressionOutputCallback)MEMORY[0x1E0C809B0];
                  destination.decompressionOutputRefCon = (void *)0x40000000;
                  v62 = __nero_createVideoRenderPipeline_block_invoke_2;
                  v63 = &__block_descriptor_tmp_74_1;
                  v64 = v19;
                  v60 = NeroTransportRegisterObject();
                  if (!(_DWORD)v60)
                  {
                    BBufFromPointer = FigTransportCreateBBufFromPointer();
                    value = v76;
                    if ((_DWORD)BBufFromPointer)
                    {
                      if (v76)
                      {
                        CFRelease(v76);
                        goto LABEL_117;
                      }
                    }
                    else
                    {
                      v19 = 0;
                      v76 = 0;
                    }
LABEL_25:
                    if (v75)
                      CFRelease(v75);
                    if (cf)
                      CFRelease(cf);
                    nrp_destroy((uint64_t)v19);
                    if (v69)
                      CFRelease(v69);
                    if (v68)
                      CFRelease(v68);
                    if (v20)
                      CFRelease(v20);
                    if (v67)
                      CFRelease(v67);
                    if (v21)
                      CFRelease(v21);
                    if (v66)
                      CFRelease(v66);
                    v16 = (const __CFDictionary *)v65;
                    if (!v65)
                      goto LABEL_43;
                    goto LABEL_42;
                  }
                  BBufFromPointer = v60;
LABEL_117:
                  value = 0;
                  goto LABEL_25;
                }
              }
            }
            else
            {
              BBufFromPointer = 4294954514;
            }
            nrp_destroy((uint64_t)v19);
          }
          v19 = 0;
          goto LABEL_117;
        }
      }
      else
      {
        v17 = FigSignalErrorAt();
      }
    }
LABEL_24:
    BBufFromPointer = v17;
    v19 = 0;
    value = 0;
    v20 = 0;
    v21 = 0;
    goto LABEL_25;
  }
  if (a2 != 1668771937)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(a4 + 16))(a4, 4294955260, 0);
    return;
  }
  v72.value = 0;
  destination.decompressionOutputCallback = 0;
  if (*(_QWORD *)(v7 + 104))
  {
    v8 = CMBlockBufferCopyDataBytes(theSourceBuffer, 0, 8uLL, &destination);
    if ((_DWORD)v8
      || (v8 = FigNeroPlayServerSetOctaviaSender(*(_QWORD *)(v7 + 104), (uint64_t)destination.decompressionOutputCallback), (_DWORD)v8))
    {
      BBufFromPointer = v8;
    }
    else
    {
      BBufFromPointer = FigTransportCreateBBufFromPointer();
      value = (CFTypeRef)v72.value;
      if (!(_DWORD)BBufFromPointer || !v72.value)
        goto LABEL_43;
      CFRelease((CFTypeRef)v72.value);
    }
    value = 0;
  }
  else
  {
    value = 0;
    BBufFromPointer = 0;
  }
LABEL_43:
  (*(void (**)(uint64_t, uint64_t, CFTypeRef))(a4 + 16))(a4, BBufFromPointer, value);
  if (value)
    CFRelease(value);
}

@end
