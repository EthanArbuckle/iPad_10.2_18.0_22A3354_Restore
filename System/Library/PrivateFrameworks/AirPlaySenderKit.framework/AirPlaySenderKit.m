uint64_t AudioSBufSourceGetTypeID()
{
  if (gAudioSBufSourceInitOnce != -1)
    dispatch_once_f(&gAudioSBufSourceInitOnce, 0, (dispatch_function_t)_AudioSBufSourceGetTypeID);
  return gAudioSBufSourceTypeID;
}

uint64_t _AudioSBufSourceGetTypeID()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  gAudioSBufSourceTypeID = result;
  return result;
}

uint64_t AudioSBufSourceCreate(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t Instance;
  uint64_t v8;
  AudioStreamBasicDescription *v9;
  dispatch_queue_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t CMBaseObject;
  uint64_t (*v18)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char label[64];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (gAudioSBufSourceInitOnce != -1)
    dispatch_once_f(&gAudioSBufSourceInitOnce, 0, (dispatch_function_t)_AudioSBufSourceGetTypeID);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    APSLogErrorAt();
    return 4294960568;
  }
  v8 = Instance;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  v9 = (AudioStreamBasicDescription *)(Instance + 32);
  *(_QWORD *)(Instance + 24) = CFStringCreateF();
  SNPrintF();
  *(_QWORD *)(v8 + 16) = dispatch_queue_create(label, 0);
  SNPrintF();
  v10 = dispatch_queue_create(label, 0);
  v11 = MEMORY[0x24BDC0D88];
  *(_OWORD *)(v8 + 112) = *MEMORY[0x24BDC0D88];
  *(_QWORD *)(v8 + 128) = *(_QWORD *)(v11 + 16);
  *(_QWORD *)(v8 + 136) = v10;
  v12 = *(_QWORD *)(a2 + 32);
  v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v9->mSampleRate = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 48) = v13;
  *(_QWORD *)(v8 + 64) = v12;
  *(_QWORD *)(v8 + 80) = FigCFWeakReferenceHolderCreateWithReferencedObject();
  if (a3 <= 0)
    v14 = 5;
  else
    v14 = a3;
  *(_DWORD *)(v8 + 148) = v14;
  v15 = *MEMORY[0x24BDBD240];
  v16 = CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, 0, 0, 0, 0, 0, (CMAudioFormatDescriptionRef *)(v8 + 72));
  if ((_DWORD)v16)
  {
    v22 = v16;
    goto LABEL_16;
  }
  CMBaseObject = FigEndpointStreamGetCMBaseObject();
  v18 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v18)
  {
    v22 = 4294954514;
LABEL_16:
    APSLogErrorAt();
    CFRelease((CFTypeRef)v8);
    return v22;
  }
  v19 = v18(CMBaseObject, *MEMORY[0x24BDC1208], v15, v8 + 88);
  if ((_DWORD)v19)
  {
    v22 = v19;
    goto LABEL_16;
  }
  v20 = FigEndpointAudioSourceBufferQueueCreate();
  if ((_DWORD)v20)
  {
    v22 = v20;
    goto LABEL_16;
  }
  v21 = FigEndpointAudioSourceCopyProperty(*(_QWORD *)(v8 + 96), *MEMORY[0x24BDDCF08], v15, v8 + 104);
  if ((_DWORD)v21)
  {
    v22 = v21;
    goto LABEL_16;
  }
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v22 = 0;
  *a4 = v8;
  return v22;
}

uint64_t FigEndpointAudioSourceCopyProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t CMBaseObject;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);

  CMBaseObject = FigEndpointAudioSourceGetCMBaseObject();
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v8)
    return v8(CMBaseObject, a2, a3, a4);
  else
    return 4294954514;
}

uint64_t AudioSBufSourceEnqueueAudioData(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __AudioSBufSourceEnqueueAudioData_block_invoke;
  block[3] = &unk_25075C340;
  block[5] = a2;
  block[6] = a1;
  block[4] = &v6;
  dispatch_sync(v2, block);
  v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t ausrc_enqueueAudioDataInternal(uint64_t a1, CFDataRef theData, __int128 *a3, CMTime *a4)
{
  uint64_t v5;
  unint64_t Length;
  unint64_t v8;
  CMItemCount v9;
  const __CFAllocator *v10;
  uint64_t BlockBufferWithCFDataNoCopy;
  const opaqueCMFormatDescription *v12;
  CMSampleBufferRef v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v20[5];
  _QWORD block[5];
  __int128 v22;
  uint64_t v23;
  CMTime v24;
  CMTime presentationTimeStamp;
  OpaqueCMBlockBuffer *v26;
  CMSampleBufferRef sampleBufferOut;

  if (*(_DWORD *)(a1 + 40) != 1819304813)
  {
    v5 = 4294960591;
    goto LABEL_22;
  }
  if (!theData)
  {
    if (!*(_BYTE *)(a1 + 152))
      return 0;
    *(_BYTE *)(a1 + 152) = 0;
    v16 = MEMORY[0x24BDC0D88];
    *(_OWORD *)(a1 + 112) = *MEMORY[0x24BDC0D88];
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(v16 + 16);
    v17 = *(NSObject **)(a1 + 136);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 0x40000000;
    v20[2] = __ausrc_enqueueAudioDataInternal_block_invoke_2;
    v20[3] = &__block_descriptor_tmp_8;
    v20[4] = a1;
    dispatch_sync(v17, v20);
    CMBufferQueueReset(*(CMBufferQueueRef *)(a1 + 104));
    v5 = 0;
    v18 = atomic_load((unsigned int *)(a1 + 144));
    if ((_DWORD)v18)
    {
      APSLogErrorAt();
      return v18;
    }
    return v5;
  }
  v5 = atomic_load((unsigned int *)(a1 + 144));
  if ((_DWORD)v5)
  {
LABEL_22:
    APSLogErrorAt();
    return v5;
  }
  v24 = *a4;
  v26 = 0;
  sampleBufferOut = 0;
  Length = CFDataGetLength(theData);
  v8 = *(unsigned int *)(a1 + 48);
  v9 = Length / v8;
  if (Length % v8)
  {
    v5 = 4294960591;
LABEL_25:
    APSLogErrorAt();
    goto LABEL_28;
  }
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  BlockBufferWithCFDataNoCopy = FigCreateBlockBufferWithCFDataNoCopy();
  if ((_DWORD)BlockBufferWithCFDataNoCopy)
  {
    v5 = BlockBufferWithCFDataNoCopy;
    goto LABEL_25;
  }
  v12 = *(const opaqueCMFormatDescription **)(a1 + 72);
  presentationTimeStamp = v24;
  v5 = CMAudioSampleBufferCreateReadyWithPacketDescriptions(v10, v26, v12, v9, &presentationTimeStamp, 0, &sampleBufferOut);
  if (!(_DWORD)v5)
  {
    v13 = sampleBufferOut;
    sampleBufferOut = 0;
    goto LABEL_8;
  }
  APSLogErrorAt();
  if (sampleBufferOut)
    CFRelease(sampleBufferOut);
LABEL_28:
  v13 = 0;
LABEL_8:
  if (v26)
    CFRelease(v26);
  if ((_DWORD)v5)
  {
LABEL_31:
    APSLogErrorAt();
    if (!v13)
      return v5;
    goto LABEL_15;
  }
  v14 = CMBufferQueueEnqueue(*(CMBufferQueueRef *)(a1 + 104), v13);
  if ((_DWORD)v14)
  {
    v5 = v14;
    goto LABEL_31;
  }
  if (!*(_BYTE *)(a1 + 152))
  {
    *(_BYTE *)(a1 + 152) = 1;
    CFRetain((CFTypeRef)a1);
    v15 = *(NSObject **)(a1 + 136);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ausrc_enqueueAudioDataInternal_block_invoke;
    block[3] = &__block_descriptor_tmp_7;
    block[4] = a1;
    v22 = *a3;
    v23 = *((_QWORD *)a3 + 2);
    dispatch_async(v15, block);
  }
  v5 = 0;
  if (v13)
LABEL_15:
    CFRelease(v13);
  return v5;
}

uint64_t AudioSBufSourceEnqueueAudioDataWithTimestamps(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, char a5)
{
  NSObject *v5;
  uint64_t v6;
  _QWORD v8[8];
  __int128 v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v5 = *(NSObject **)(a1 + 16);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = __AudioSBufSourceEnqueueAudioDataWithTimestamps_block_invoke;
  v8[3] = &unk_25075C368;
  v8[4] = &v12;
  v8[5] = a1;
  v8[6] = a4;
  v8[7] = a2;
  v9 = *a3;
  v10 = *((_QWORD *)a3 + 2);
  v11 = a5;
  dispatch_sync(v5, v8);
  v6 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

void _AudioSBufSourceFinalize(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  NSObject *v8;
  NSObject *v9;

  v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  v3 = (const void *)a1[9];
  if (v3)
  {
    CFRelease(v3);
    a1[9] = 0;
  }
  v4 = (const void *)a1[10];
  if (v4)
  {
    CFRelease(v4);
    a1[10] = 0;
  }
  v5 = (const void *)a1[11];
  if (v5)
  {
    CFRelease(v5);
    a1[11] = 0;
  }
  v6 = (const void *)a1[12];
  if (v6)
  {
    CFRelease(v6);
    a1[12] = 0;
  }
  v7 = (const void *)a1[13];
  if (v7)
  {
    CFRelease(v7);
    a1[13] = 0;
  }
  v8 = a1[17];
  if (v8)
  {
    dispatch_release(v8);
    a1[17] = 0;
  }
  v9 = a1[2];
  if (v9)
  {
    dispatch_release(v9);
    a1[2] = 0;
  }
}

void __ausrc_enqueueAudioDataInternal_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  CFDictionaryRef v9;
  uint64_t CMBaseObject;
  uint64_t (*v11)(uint64_t, _QWORD, CFDictionaryRef);
  unsigned int v12;
  unsigned int v13;
  CMTime v14;
  CMTime time;

  v2 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)&v14.value = *(_OWORD *)(a1 + 40);
  v14.epoch = *(_QWORD *)(a1 + 56);
  v3 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!v3)
  {
    v13 = -6709;
    APSLogErrorAt();
    goto LABEL_22;
  }
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDDCF10], *(const void **)(v2 + 96));
  time = v14;
  v6 = FigCFDictionarySetCMTime();
  if (v6)
  {
    v13 = v6;
LABEL_27:
    APSLogErrorAt();
    v9 = 0;
    goto LABEL_18;
  }
  v7 = FigEndpointStreamAudioEngineResumeSync();
  if (v7)
  {
    v13 = v7;
    goto LABEL_27;
  }
  v8 = FigEndpointStreamAudioEngineSetEndpointStreamSync();
  if (v8)
  {
    v13 = v8;
    goto LABEL_27;
  }
  time = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  v9 = CMTimeCopyAsDictionary(&time, v4);
  CMBaseObject = FigEndpointStreamAudioEngineGetCMBaseObject();
  v11 = *(uint64_t (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v11)
  {
    v12 = v11(CMBaseObject, *MEMORY[0x24BE03138], v9);
    if (!v12)
    {
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v13 = 0;
      goto LABEL_18;
    }
    v13 = v12;
  }
  else
  {
    v13 = -12782;
  }
  APSLogErrorAt();
LABEL_18:
  CFRelease(v3);
  if (Mutable)
    CFRelease(Mutable);
  if (v9)
    CFRelease(v9);
LABEL_22:
  atomic_store(v13, (unsigned int *)(v2 + 144));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t __ausrc_enqueueAudioDataInternal_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  unsigned int v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = FigEndpointStreamAudioEngineSuspendSync();
  v3 = result;
  if ((_DWORD)result)
  {
    result = APSLogErrorAt();
  }
  else if (gLogCategory_AirPlaySenderKit <= 50)
  {
    if (gLogCategory_AirPlaySenderKit != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  atomic_store(v3, (unsigned int *)(v1 + 144));
  return result;
}

CFTypeRef APMediaSenderFVDSourceCreate()
{
  const __CFAllocator *v0;
  uint64_t DerivedStorage;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD handler[5];
  CFTypeRef v7;

  v7 = 0;
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  FigVirtualDisplaySourceGetClassID();
  if (CMDerivedObjectCreate())
    goto LABEL_8;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  *(_DWORD *)(DerivedStorage + 112) = 0;
  *(_QWORD *)(DerivedStorage + 16) = CFStringCreateF();
  v2 = dispatch_queue_create("APMediaSenderFVDSourceQueue", 0);
  *(_QWORD *)(DerivedStorage + 8) = v2;
  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, v2);
  v4 = MEMORY[0x24BDAC760];
  *(_QWORD *)(DerivedStorage + 80) = v3;
  handler[0] = v4;
  handler[1] = 0x40000000;
  handler[2] = __APMediaSenderFVDSourceCreate_block_invoke;
  handler[3] = &__block_descriptor_tmp_0;
  handler[4] = DerivedStorage;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_source_set_timer(*(dispatch_source_t *)(DerivedStorage + 80), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  dispatch_resume(*(dispatch_object_t *)(DerivedStorage + 80));
  *(_BYTE *)(DerivedStorage + 116) = 1;
  if (VTPixelTransferSessionCreate(v0, (VTPixelTransferSessionRef *)(DerivedStorage + 24)))
  {
LABEL_8:
    APSLogErrorAt();
    if (v7)
    {
      CFRelease(v7);
      return 0;
    }
  }
  else if (gLogCategory_AirPlaySenderKit <= 50
         && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v7;
}

uint64_t APMediaSenderFDVSourceSetDisplayInfoBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage;
  NSObject *v6;
  _QWORD block[7];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2 && a3)
  {
    v6 = *(NSObject **)(DerivedStorage + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __APMediaSenderFDVSourceSetDisplayInfoBlock_block_invoke;
    block[3] = &unk_25075C468;
    block[4] = a3;
    block[5] = DerivedStorage;
    block[6] = a2;
    dispatch_sync(v6, block);
    return 0;
  }
  else
  {
    APSLogErrorAt();
    return 4294955226;
  }
}

uint64_t APMediaSenderFDVSourceSetWritebackMode(uint64_t a1, char a2)
{
  uint64_t DerivedStorage;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[6];
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderFDVSourceSetWritebackMode_block_invoke;
  block[3] = &unk_25075C490;
  v8 = a2;
  block[4] = &v9;
  block[5] = DerivedStorage;
  dispatch_sync(v4, block);
  v5 = 0;
  if (*((_DWORD *)v10 + 6))
  {
    APSLogErrorAt();
    v5 = *((unsigned int *)v10 + 6);
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t APMediaSenderFDVSourceSubmitPixelBuffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage;
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v6 = *(NSObject **)(DerivedStorage + 8);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = __APMediaSenderFDVSourceSubmitPixelBuffer_block_invoke;
  v9[3] = &unk_25075C4B8;
  v9[4] = &v10;
  v9[5] = DerivedStorage;
  v9[6] = a2;
  v9[7] = a3;
  dispatch_sync(v6, v9);
  v7 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t fvdsrc_submitPixelBufferInternal(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  int v6;
  uint64_t v7;
  size_t Width;
  size_t Height;
  uint64_t (*v10)(uint64_t, _QWORD, uint64_t, CVPixelBufferRef *, double, double);
  unsigned int v11;
  OSStatus v12;
  __CVBuffer *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  size_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CVPixelBufferRef v26;
  double v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, CVPixelBufferRef, uint64_t, _QWORD, _QWORD, double, double, double, double, double, double, double, double, double);
  unsigned int v31;
  uint64_t v32;
  NSObject *v33;
  dispatch_time_t v34;
  const void *v35;
  double v37;
  CVPixelBufferRef destinationBuffer;

  destinationBuffer = 0;
  v6 = *(_DWORD *)(a1 + 112);
  if (v6 == 2)
  {
    if (pixelBuffer)
    {
      if (*(_BYTE *)(a1 + 116))
      {
        v7 = *(_QWORD *)a1;
        Width = CVPixelBufferGetWidth(pixelBuffer);
        Height = CVPixelBufferGetHeight(pixelBuffer);
        v10 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CVPixelBufferRef *, double, double))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 88);
        if (!v10)
        {
          v28 = -12782;
          goto LABEL_23;
        }
        v11 = v10(v7, 0, 1, &destinationBuffer, (double)Width, (double)Height);
        if (v11)
        {
          v28 = v11;
          goto LABEL_23;
        }
        v12 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 24), pixelBuffer, destinationBuffer);
        if (v12)
        {
          v28 = v12;
          goto LABEL_23;
        }
        v13 = destinationBuffer;
      }
      else
      {
        v13 = (__CVBuffer *)CFRetain(pixelBuffer);
        destinationBuffer = v13;
      }
      v18 = (double)CVPixelBufferGetWidth(v13);
      v19 = CVPixelBufferGetHeight(destinationBuffer);
      v20 = (double)v19;
      v21 = *(double *)(a1 + 48);
      v22 = *(double *)(a1 + 56);
      v23 = v21 / v18;
      if (v21 / v18 >= v22 / (double)v19)
        v23 = v22 / (double)v19;
      v24 = (1.0 - *(double *)(a1 + 64)) * v23;
      v16 = v24 * v18;
      v17 = v24 * v20;
      v14 = (v21 - v24 * v18) * 0.5;
      v15 = (v22 - v24 * v20) * 0.5;
      v25 = 0.0;
      v26 = destinationBuffer;
      v27 = 0.0;
    }
    else
    {
      v14 = *MEMORY[0x24BDBF090];
      v15 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v16 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v17 = *(double *)(MEMORY[0x24BDBF090] + 24);
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        v37 = *(double *)(a1 + 16);
        LogPrintF();
      }
      v26 = 0;
      v20 = v17;
      v18 = v16;
      v25 = v15;
      v27 = v14;
    }
    v29 = *(_QWORD *)a1;
    v30 = *(uint64_t (**)(uint64_t, CVPixelBufferRef, uint64_t, _QWORD, _QWORD, double, double, double, double, double, double, double, double, double))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
    if (v30)
    {
      v31 = v30(v29, v26, a3, 0, 0, v27, v25, v18, v20, v14, v15, v16, v17, v37);
      if (!v31)
      {
LABEL_21:
        fvdsrc_stopRetrying(a1);
        v32 = 0;
        goto LABEL_34;
      }
      v28 = v31;
    }
    else
    {
      v28 = -12782;
    }
  }
  else
  {
    if (!v6)
    {
      APSLogErrorAt();
      goto LABEL_21;
    }
    v28 = -12072;
  }
LABEL_23:
  APSLogErrorAt();
  v33 = *(NSObject **)(a1 + 80);
  v34 = dispatch_time(0, 50000000);
  dispatch_source_set_timer(v33, v34, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  v35 = *(const void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = pixelBuffer;
  if (pixelBuffer)
    CFRetain(pixelBuffer);
  if (v35)
    CFRelease(v35);
  *(_QWORD *)(a1 + 104) = a3;
  *(_BYTE *)(a1 + 88) = 1;
  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v28 == -12073)
    v32 = 0;
  else
    v32 = v28;
LABEL_34:
  if (destinationBuffer)
    CFRelease(destinationBuffer);
  return v32;
}

void fvdsrc_finalize()
{
  uint64_t DerivedStorage;
  int v1;
  NSObject *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  NSObject *v7;
  NSObject *v8;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_DWORD *)(DerivedStorage + 112))
  {
    v1 = gLogCategory_AirPlaySenderKit;
    if (gLogCategory_AirPlaySenderKit <= 100)
      fvdsrc_finalize_cold_2(gLogCategory_AirPlaySenderKit);
    goto LABEL_24;
  }
  v1 = gLogCategory_AirPlaySenderKit;
  if (*(_QWORD *)DerivedStorage)
  {
    while (v1 > 100)
LABEL_24:
      __break(1u);
    fvdsrc_finalize_cold_1(v1);
    __break(1u);
  }
  else
  {
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = *(NSObject **)(DerivedStorage + 80);
    if (v2)
    {
      dispatch_source_cancel(v2);
      dispatch_release(*(dispatch_object_t *)(DerivedStorage + 80));
      *(_QWORD *)(DerivedStorage + 80) = 0;
    }
    v3 = *(const void **)(DerivedStorage + 32);
    if (v3)
    {
      _Block_release(v3);
      *(_QWORD *)(DerivedStorage + 32) = 0;
    }
    v4 = *(const void **)(DerivedStorage + 96);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(DerivedStorage + 96) = 0;
    }
    v5 = *(const void **)(DerivedStorage + 24);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(DerivedStorage + 24) = 0;
    }
    v6 = *(const void **)(DerivedStorage + 16);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(DerivedStorage + 16) = 0;
    }
    v7 = *(NSObject **)(DerivedStorage + 40);
    if (v7)
    {
      dispatch_release(v7);
      *(_QWORD *)(DerivedStorage + 40) = 0;
    }
    v8 = *(NSObject **)(DerivedStorage + 8);
    if (v8)
    {
      dispatch_release(v8);
      *(_QWORD *)(DerivedStorage + 8) = 0;
    }
  }
}

uint64_t fvdsrc_copyProperty(uint64_t a1, const void *a2, uint64_t a3, _QWORD *a4)
{
  CFTypeRef v5;
  uint64_t result;

  if (!CFEqual((CFTypeRef)*MEMORY[0x24BDDD070], a2))
    return 4294954512;
  v5 = CFRetain(CFSTR("APMediaSenderFVDSource"));
  result = 0;
  *a4 = v5;
  return result;
}

uint64_t fvdsrc_setProperty()
{
  return 4294954512;
}

uint64_t fvdsrc_plugProcessor(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    v4 = *(NSObject **)(DerivedStorage + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __fvdsrc_plugProcessor_block_invoke;
    block[3] = &unk_25075C578;
    block[5] = DerivedStorage;
    block[6] = a2;
    block[4] = &v8;
    dispatch_sync(v4, block);
    if (*((_DWORD *)v9 + 6))
    {
      APSLogErrorAt();
      v5 = *((unsigned int *)v9 + 6);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    APSLogErrorAt();
    v5 = 4294955226;
    *((_DWORD *)v9 + 6) = -12070;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t fvdsrc_unplugProcessor(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (a2)
  {
    v4 = *(NSObject **)(DerivedStorage + 8);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __fvdsrc_unplugProcessor_block_invoke;
    block[3] = &unk_25075C5A0;
    block[5] = DerivedStorage;
    block[6] = a2;
    block[4] = &v8;
    dispatch_sync(v4, block);
    if (*((_DWORD *)v9 + 6))
    {
      APSLogErrorAt();
      v5 = *((unsigned int *)v9 + 6);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    APSLogErrorAt();
    v5 = 4294955226;
    *((_DWORD *)v9 + 6) = -12070;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t fvdsrc_start(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v4;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __fvdsrc_start_block_invoke;
  block[3] = &unk_25075C5C8;
  block[4] = &v8;
  block[5] = DerivedStorage;
  block[6] = a2;
  dispatch_sync(v4, block);
  v5 = 0;
  if (*((_DWORD *)v9 + 6))
  {
    APSLogErrorAt();
    v5 = *((unsigned int *)v9 + 6);
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t fvdsrc_stop()
{
  uint64_t DerivedStorage;
  NSObject *v1;
  _QWORD block[5];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = *(NSObject **)(DerivedStorage + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __fvdsrc_stop_block_invoke;
  block[3] = &__block_descriptor_tmp_21;
  block[4] = DerivedStorage;
  dispatch_sync(v1, block);
  return 0;
}

uint64_t fvdsrc_suspend()
{
  uint64_t DerivedStorage;
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = *(NSObject **)(DerivedStorage + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __fvdsrc_suspend_block_invoke;
  v4[3] = &unk_25075C638;
  v4[4] = &v5;
  v4[5] = DerivedStorage;
  dispatch_sync(v1, v4);
  v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t fvdsrc_resume()
{
  uint64_t DerivedStorage;
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = *(NSObject **)(DerivedStorage + 8);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __fvdsrc_resume_block_invoke;
  v4[3] = &unk_25075C660;
  v4[4] = &v5;
  v4[5] = DerivedStorage;
  dispatch_sync(v1, v4);
  v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

CFTypeRef *__fvdsrc_plugProcessor_block_invoke(CFTypeRef *result)
{
  CFTypeRef *v1;
  _DWORD *v2;

  v1 = result;
  v2 = result[5];
  if (v2[28] || *(_QWORD *)v2)
  {
    *(_DWORD *)(*((_QWORD *)result[4] + 1) + 24) = -12073;
  }
  else
  {
    result = (CFTypeRef *)CFRetain(result[6]);
    *(_QWORD *)v1[5] = v1[6];
  }
  return result;
}

void __fvdsrc_unplugProcessor_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const void *v3;

  v2 = a1[5];
  if (!*(_DWORD *)(v2 + 112) && (v3 = *(const void **)v2, *(_QWORD *)v2 == a1[6]))
  {
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)a1[5] = 0;
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -12070;
  }
}

void __fvdsrc_start_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, CFTypeRef *, CFTypeRef *);
  int v5;
  int v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _QWORD, _QWORD);
  int v9;
  int DimensionsFromTimingMode;
  int v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  _QWORD block[5];
  __int128 v17;
  int v18;
  char v19;
  int v20;
  __int128 v21;
  unsigned int v22;
  CFTypeRef v23;
  CFTypeRef v24;

  v2 = *(uint64_t **)(a1 + 40);
  if (*((_DWORD *)v2 + 28) || (v3 = *v2) == 0)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12070;
    return;
  }
  v23 = 0;
  v24 = 0;
  v22 = 0;
  v21 = xmmword_235FE80B0;
  v20 = 60;
  v19 = 0;
  v4 = *(uint64_t (**)(uint64_t, CFTypeRef *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
  if (v4)
  {
    v5 = v4(v3, &v24, &v23);
    if (v5)
    {
      v14 = v5;
    }
    else
    {
      v6 = FigDisplayModes_LookupTimingModeIDByIndex();
      if (v6)
      {
        v14 = v6;
      }
      else
      {
        v7 = *v2;
        v8 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
        if (v8)
        {
          v9 = v8(v7, v22, v22);
          if (v9)
          {
            v14 = v9;
          }
          else
          {
            DimensionsFromTimingMode = FigDisplayModes_ExtractDimensionsFromTimingMode();
            if (!DimensionsFromTimingMode)
            {
              FigDisplayModes_ExtractOverscanInfoFromTimingMode();
              FigDisplayModes_ExtractVSyncRateFromTimingMode();
              *((_OWORD *)v2 + 3) = v21;
              v11 = v20;
              *((_DWORD *)v2 + 18) = v20;
              v2[8] = 0;
              v12 = v2[4];
              if (v12)
              {
                v13 = v2[5];
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 0x40000000;
                block[2] = __fvdsrc_init_block_invoke;
                block[3] = &unk_25075C5F0;
                block[4] = v12;
                v17 = v21;
                v18 = v11;
                dispatch_async(v13, block);
              }
              if (gLogCategory_AirPlaySenderKit <= 50
                && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              v14 = 0;
              goto LABEL_21;
            }
            v14 = DimensionsFromTimingMode;
          }
        }
        else
        {
          v14 = -12782;
        }
      }
    }
  }
  else
  {
    v14 = -12782;
  }
  APSLogErrorAt();
LABEL_21:
  if (v24)
    CFRelease(v24);
  if (v23)
    CFRelease(v23);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v14;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    LOBYTE(block[0]) = 0;
    FigCFDictionaryGetBooleanIfPresent();
    if (LOBYTE(block[0]))
      v15 = 1;
    else
      v15 = 2;
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 112) = v15;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __fvdsrc_init_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), (int)*(double *)(a1 + 40), (int)*(double *)(a1 + 48), *(unsigned int *)(a1 + 56));
}

void __fvdsrc_stop_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 112))
  {
    fvdsrc_stopRetrying(v2);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

void fvdsrc_stopRetrying(uint64_t a1)
{
  const void *v2;

  if (*(_BYTE *)(a1 + 88))
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 80), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    v2 = *(const void **)(a1 + 96);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 96) = 0;
    }
    *(_QWORD *)(a1 + 104) = 0;
    *(_BYTE *)(a1 + 88) = 0;
  }
}

uint64_t __fvdsrc_suspend_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 40);
  if (*(_DWORD *)(v2 + 112))
  {
    *(_DWORD *)(v2 + 112) = 1;
    if (gLogCategory_AirPlaySenderKit <= 50)
    {
      if (gLogCategory_AirPlaySenderKit != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_AirPlaySenderKit <= 90)
    {
      if (gLogCategory_AirPlaySenderKit != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = -12070;
  }
  return result;
}

uint64_t __fvdsrc_resume_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 40);
  if (*(_DWORD *)(v2 + 112) == 1)
  {
    *(_DWORD *)(v2 + 112) = 2;
    if (gLogCategory_AirPlaySenderKit <= 50)
    {
      if (gLogCategory_AirPlaySenderKit != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_AirPlaySenderKit <= 90)
    {
      if (gLogCategory_AirPlaySenderKit != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = -12070;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return LogPrintF();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _LogCategory_Initialize();
}

void sub_235FDEF78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_235FE0060(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_235FE16D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13, id *a14, id *a15)
{
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak((id *)(v16 - 112));
  _Unwind_Resume(a1);
}

void remoteSessionHandleDeadConnection(void *a1)
{
  _QWORD *v1;
  NSObject *v2;
  _QWORD *v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  if (gLogCategory_AirPlaySenderKit <= 100
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = v1[3];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __remoteSessionHandleDeadConnection_block_invoke;
  block[3] = &unk_25075C6B0;
  v5 = v1;
  v3 = v1;
  dispatch_sync(v2, block);

}

uint64_t remoteSessionHandleServerMessage(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t OpCode;
  uint64_t v7;

  v3 = a2;
  v4 = a1;
  OpCode = FigXPCMessageGetOpCode();
  if ((_DWORD)OpCode)
  {
    v7 = OpCode;
    APSLogErrorAt();
  }
  else
  {
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 4294960591;
  }

  return v7;
}

void remoteSessionHandleServerDeath()
{
  if (gLogCategory_AirPlaySenderKit <= 100
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sRemoteClientLock);
  if (sRemoteClient)
  {
    CFRelease((CFTypeRef)sRemoteClient);
    sRemoteClient = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sRemoteClientLock);
}

void __remoteSessionHandleDeadConnection_block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  char v4;
  _QWORD *v5;
  NSObject *v6;
  _QWORD block[4];
  _QWORD *v8;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = *(_QWORD **)(a1 + 32);
      v6 = v5[2];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __remoteSessionHandleDeadConnection_block_invoke_2;
      block[3] = &unk_25075C6B0;
      v8 = v5;
      dispatch_async(v6, block);

    }
  }
}

void __remoteSessionHandleDeadConnection_block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "sessionDidFail:withError:", *(_QWORD *)(a1 + 32), 4294896154);

}

uint64_t APSKServiceSerializeFrame(__CVBuffer *a1, uint64_t a2, _QWORD *a3)
{
  xpc_object_t empty;
  void *v7;
  __IOSurface *IOSurface;
  xpc_object_t XPCObject;
  CFDictionaryRef v10;
  uint64_t v11;
  uint64_t bytes;
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  empty = xpc_dictionary_create_empty();
  v7 = empty;
  bytes = a2;
  if (!a1)
  {
    xpc_dictionary_set_data(empty, "data", &bytes, 0x28uLL);
    goto LABEL_9;
  }
  IOSurface = CVPixelBufferGetIOSurface(a1);
  if (IOSurface)
  {
    XPCObject = IOSurfaceCreateXPCObject(IOSurface);
    if (XPCObject)
    {
      xpc_dictionary_set_value(v7, "surface", XPCObject);
      CVPixelBufferGetExtendedPixels(a1, (size_t *)&v14, (size_t *)&v14 + 1, (size_t *)&v15, (size_t *)&v15 + 1);
      v10 = CVBufferCopyAttachments(a1, kCVAttachmentMode_ShouldPropagate);
      xpc_dictionary_set_data(v7, "data", &bytes, 0x28uLL);
      if (v10)
      {
        v11 = FigXPCMessageSetCFDictionary();
        if ((_DWORD)v11)
          APSLogErrorAt();
        else
          *a3 = v7;
        CFRelease(v10);
        goto LABEL_10;
      }
LABEL_9:
      v11 = 0;
      *a3 = v7;
      goto LABEL_10;
    }
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = 4294960534;
  }
  else
  {
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = 4294960591;
  }
LABEL_10:
  FigXPCRelease();
  FigXPCRelease();
  return v11;
}

uint64_t APSKServiceDeserializeFrame(void *a1, CVPixelBufferRef *a2, _QWORD *a3)
{
  _QWORD *data;
  _QWORD *v7;
  xpc_object_t value;
  IOSurfaceRef v9;
  __IOSurface *v10;
  uint64_t v11;
  const __CFAllocator *v12;
  const __CFDictionary *Mutable;
  uint64_t v14;
  uint64_t v15;
  size_t length;
  CVPixelBufferRef pixelBufferOut;

  length = 0;
  pixelBufferOut = 0;
  data = xpc_dictionary_get_data(a1, "data", &length);
  if (!data)
  {
    if (gLogCategory_AirPlaySenderKit > 90
      || gLogCategory_AirPlaySenderKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_36;
    }
LABEL_35:
    LogPrintF();
LABEL_36:
    Mutable = 0;
    v15 = 4294960591;
    goto LABEL_23;
  }
  if (length != 40)
  {
    if (gLogCategory_AirPlaySenderKit > 90
      || gLogCategory_AirPlaySenderKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  v7 = data;
  value = xpc_dictionary_get_value(a1, "surface");
  if (!value)
  {
    v15 = 0;
    Mutable = 0;
    *a3 = *v7;
    *a2 = 0;
    pixelBufferOut = 0;
    goto LABEL_23;
  }
  v9 = IOSurfaceLookupFromXPCObject(value);
  if (!v9)
  {
    if (gLogCategory_AirPlaySenderKit > 90
      || gLogCategory_AirPlaySenderKit == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  v10 = v9;
  v11 = FigXPCMessageCopyCFDictionary();
  if ((_DWORD)v11)
  {
    v15 = v11;
    APSLogErrorAt();
    Mutable = 0;
  }
  else
  {
    if (v7[1] || v7[2] || v7[3] || v7[4])
    {
      v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v7[1])
        FigCFDictionarySetInt64();
      if (v7[2])
        FigCFDictionarySetInt64();
      if (v7[3])
        FigCFDictionarySetInt64();
      if (v7[4])
        FigCFDictionarySetInt64();
    }
    else
    {
      Mutable = 0;
      v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    }
    v14 = CVPixelBufferCreateWithIOSurface(v12, v10, Mutable, &pixelBufferOut);
    if ((_DWORD)v14)
    {
      v15 = v14;
      APSLogErrorAt();
    }
    else
    {
      v15 = 0;
      *a3 = *v7;
      *a2 = pixelBufferOut;
      pixelBufferOut = 0;
    }
  }
  CFRelease(v10);
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
LABEL_23:
  if (Mutable)
    CFRelease(Mutable);
  return v15;
}

uint64_t APMediaSenderGetTypeID()
{
  if (APMediaSenderGetTypeID_once != -1)
    dispatch_once(&APMediaSenderGetTypeID_once, &__block_literal_global);
  return APMediaSenderGetTypeID_typeID;
}

void sender_finalize(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;

  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(a1 + 182))
  {
    if (gLogCategory_AirPlaySenderKit <= 100)
      sender_finalize_cold_1(gLogCategory_AirPlaySenderKit);
    __break(1u);
  }
  else
  {
    v2 = *(const void **)(a1 + 120);
    if (v2)
    {
      _Block_release(v2);
      *(_QWORD *)(a1 + 120) = 0;
    }
    v3 = *(const void **)(a1 + 128);
    if (v3)
    {
      _Block_release(v3);
      *(_QWORD *)(a1 + 128) = 0;
    }
    if (*(_QWORD *)(a1 + 136))
    {
      FigSimpleMutexDestroy();
      *(_QWORD *)(a1 + 136) = 0;
    }
    v4 = *(const void **)(a1 + 40);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 40) = 0;
    }
    v5 = *(const void **)(a1 + 32);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1 + 32) = 0;
    }
    v6 = *(const void **)(a1 + 48);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(a1 + 48) = 0;
    }
    v7 = *(const void **)(a1 + 56);
    if (v7)
    {
      CFRelease(v7);
      *(_QWORD *)(a1 + 56) = 0;
    }
    v8 = *(const void **)(a1 + 104);
    if (v8)
    {
      CFRelease(v8);
      *(_QWORD *)(a1 + 104) = 0;
    }
    v9 = *(const void **)(a1 + 112);
    if (v9)
    {
      CFRelease(v9);
      *(_QWORD *)(a1 + 112) = 0;
    }
    v10 = *(NSObject **)(a1 + 152);
    if (v10)
    {
      dispatch_release(v10);
      *(_QWORD *)(a1 + 152) = 0;
    }
    v11 = *(NSObject **)(a1 + 144);
    if (v11)
    {
      dispatch_release(v11);
      *(_QWORD *)(a1 + 144) = 0;
    }
    v12 = *(NSObject **)(a1 + 24);
    if (v12)
    {
      dispatch_release(v12);
      *(_QWORD *)(a1 + 24) = 0;
    }
    v13 = *(NSObject **)(a1 + 16);
    if (v13)
    {
      dispatch_release(v13);
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

CFStringRef sender_copyDebugDescription(uint64_t a1)
{
  const __CFAllocator *v2;
  const char *v3;
  CFStringRef v4;

  ASPrintF();
  v2 = CFGetAllocator((CFTypeRef)a1);
  v3 = "yes";
  if (!*(_BYTE *)(a1 + 182))
    v3 = "no";
  v4 = CFStringCreateWithFormat(v2, 0, CFSTR("<APMediaSender %p %s>{ active: %s, usage modes: 0x%x }"), a1, 0, v3, *(unsigned int *)(a1 + 168));
  free(0);
  return v4;
}

_QWORD *APMediaSenderCreate()
{
  uint64_t Instance;
  _QWORD *v1;
  CFTypeRef v2;

  if (APMediaSenderGetTypeID_once != -1)
    dispatch_once(&APMediaSenderGetTypeID_once, &__block_literal_global);
  Instance = _CFRuntimeCreateInstance();
  v1 = (_QWORD *)Instance;
  if (!Instance)
    goto LABEL_11;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_QWORD *)(Instance + 176) = 0;
  *(_OWORD *)(Instance + 144) = 0u;
  *(_OWORD *)(Instance + 160) = 0u;
  *(_OWORD *)(Instance + 112) = 0u;
  *(_OWORD *)(Instance + 128) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 16) = 0u;
  *(_QWORD *)(Instance + 16) = dispatch_queue_create("APMediaSenderQueue", 0);
  v1[3] = dispatch_queue_create("APMediaSenderCallbackQueue", 0);
  v1[19] = dispatch_semaphore_create(0);
  v1[17] = FigSimpleMutexCreate();
  if (APEndpointManagerCreate())
    goto LABEL_11;
  v2 = APMediaSenderFVDSourceCreate();
  v1[6] = v2;
  if (v2)
  {
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
LABEL_11:
    APSLogErrorAt();
    if (gLogCategory_AirPlaySenderKit <= 90
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v1)
    {
      CFRelease(v1);
      return 0;
    }
  }
  return v1;
}

uint64_t APMediaSenderSetAuthBlock(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderSetAuthBlock_block_invoke;
  block[3] = &unk_25075C950;
  block[5] = &v6;
  block[6] = a1;
  block[4] = a2;
  dispatch_sync(v2, block);
  v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t APMediaSenderSetFailureBlock(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderSetFailureBlock_block_invoke;
  block[3] = &unk_25075C978;
  block[5] = &v6;
  block[6] = a1;
  block[4] = a2;
  dispatch_sync(v2, block);
  v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t APMediaSenderSetDisplayInfoUpdateBlock(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderSetDisplayInfoUpdateBlock_block_invoke;
  block[3] = &unk_25075C9A0;
  block[5] = &v6;
  block[6] = a1;
  block[4] = a2;
  dispatch_sync(v2, block);
  v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t APMediaSenderSetVideoPassthroughMode(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  v1 = *(NSObject **)(a1 + 16);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __APMediaSenderSetVideoPassthroughMode_block_invoke;
  v4[3] = &unk_25075C9C8;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync(v1, v4);
  v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t APMediaSenderSetVideoOverrides(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFDictionaryGetTypeID())
    {
      if (IsAppleInternalBuild())
      {
        v5 = *(NSObject **)(a1 + 16);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 0x40000000;
        block[2] = __APMediaSenderSetVideoOverrides_block_invoke;
        block[3] = &unk_25075C9F0;
        block[4] = &v9;
        block[5] = a1;
        block[6] = cf;
        dispatch_sync(v5, block);
      }
    }
  }
  v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t APMediaSenderSetAudioDescription(uint64_t a1, uint64_t a2, char a3)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[7];
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (a2)
  {
    v3 = *(NSObject **)(a1 + 16);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = __APMediaSenderSetAudioDescription_block_invoke;
    v6[3] = &unk_25075CA18;
    v6[4] = &v8;
    v6[5] = a1;
    v6[6] = a2;
    v7 = a3;
    dispatch_sync(v3, v6);
    v4 = *((unsigned int *)v9 + 6);
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t APMediaSenderSetAuthString(uint64_t a1, const void *a2)
{
  NSObject *v4;
  const void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  MEMORY[0x23B7E93F8](*(_QWORD *)(a1 + 136));
  v4 = *(NSObject **)(a1 + 144);
  if (v4)
  {
    dispatch_retain(*(dispatch_object_t *)(a1 + 144));
    v5 = *(const void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = a2;
    if (a2)
      CFRetain(a2);
    if (v5)
      CFRelease(v5);
    MEMORY[0x23B7E9404](*(_QWORD *)(a1 + 136));
    dispatch_semaphore_signal(v4);
    dispatch_release(v4);
  }
  else
  {
    MEMORY[0x23B7E9404](*(_QWORD *)(a1 + 136));
    v6 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __APMediaSenderSetAuthString_block_invoke;
    block[3] = &unk_25075CA40;
    block[4] = &v10;
    block[5] = a1;
    block[6] = a2;
    dispatch_sync(v6, block);
  }
  if (*((_DWORD *)v11 + 6))
  {
    APSLogErrorAt();
    v7 = *((unsigned int *)v11 + 6);
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

void APMediaSenderStart(uint64_t a1, CFTypeRef cf, int a3, int a4, int a5, uint64_t a6)
{
  NSObject *v12;
  _QWORD block[7];
  int v14;
  int v15;
  int v16;

  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (cf)
    CFRetain(cf);
  v12 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderStart_block_invoke;
  block[3] = &unk_25075CA90;
  v14 = a4;
  v15 = a5;
  block[5] = a1;
  block[6] = cf;
  v16 = a3;
  block[4] = a6;
  dispatch_async(v12, block);
}

void APMediaSenderStop(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  if (gLogCategory_AirPlaySenderKit <= 50
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(a1 + 181) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 152));
  MEMORY[0x23B7E93F8](*(_QWORD *)(a1 + 136));
  v2 = *(NSObject **)(a1 + 144);
  if (v2)
  {
    if (*(_QWORD *)(a1 + 112))
    {
      CFRelease(*(CFTypeRef *)(a1 + 112));
      *(_QWORD *)(a1 + 112) = 0;
      v2 = *(NSObject **)(a1 + 144);
    }
    dispatch_semaphore_signal(v2);
  }
  MEMORY[0x23B7E9404](*(_QWORD *)(a1 + 136));
  v3 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderStop_block_invoke;
  block[3] = &__block_descriptor_tmp_24_0;
  block[4] = a1;
  dispatch_sync(v3, block);
}

void sender_stopInternal(intptr_t a1, int a2)
{
  const void *v4;
  const void *v5;

  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  sender_stopDiscovery(a1);
  if (*(_QWORD *)(a1 + 40))
  {
    FigEndpointDeactivate();
    v4 = *(const void **)(a1 + 40);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 40) = 0;
    }
  }
  v5 = *(const void **)(a1 + 56);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 56) = 0;
  }
  if (a2)
  {
    *(_WORD *)(a1 + 181) = 0;
    *(_DWORD *)(a1 + 176) = 0;
  }
}

uint64_t APMediaSenderSubmitPixelBuffer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v3 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 0x40000000;
  v6[2] = __APMediaSenderSubmitPixelBuffer_block_invoke;
  v6[3] = &unk_25075CAD8;
  v6[4] = &v7;
  v6[5] = a1;
  v6[6] = a2;
  v6[7] = a3;
  dispatch_sync(v3, v6);
  v4 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t APMediaSenderEnqueueAudioData(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __APMediaSenderEnqueueAudioData_block_invoke;
  block[3] = &unk_25075CB00;
  block[4] = &v6;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync(v2, block);
  v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t APMediaSenderEnqueueAudioDataWithTimestamps(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, char a5)
{
  NSObject *v5;
  uint64_t v6;
  _QWORD v8[8];
  __int128 v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v5 = *(NSObject **)(a1 + 16);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = __APMediaSenderEnqueueAudioDataWithTimestamps_block_invoke;
  v8[3] = &unk_25075CB28;
  v8[4] = &v12;
  v8[5] = a1;
  v9 = *a3;
  v10 = *((_QWORD *)a3 + 2);
  v8[6] = a2;
  v8[7] = a4;
  v11 = a5;
  dispatch_sync(v5, v8);
  v6 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v6;
}

void sender_handleAuthRequiredCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, CFTypeRef, uint64_t, uint64_t), uint64_t a7)
{
  const void *v11;
  NSObject *v12;
  unsigned int v13;
  dispatch_time_t v14;
  CFTypeRef v15;
  NSObject *v16;
  const void *v17;
  uint64_t v18;

  FigCFEqual();
  if (!*(_QWORD *)(a4 + 120))
  {
    v15 = 0;
    if (!a6)
      goto LABEL_19;
    goto LABEL_15;
  }
  MEMORY[0x23B7E93F8](*(_QWORD *)(a4 + 136));
  *(_QWORD *)(a4 + 144) = dispatch_semaphore_create(0);
  v11 = *(const void **)(a4 + 112);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(a4 + 112) = 0;
  }
  MEMORY[0x23B7E9404](*(_QWORD *)(a4 + 136));
  (*(void (**)(void))(*(_QWORD *)(a4 + 120) + 16))();
  v12 = *(NSObject **)(a4 + 144);
  v13 = *(_DWORD *)(a4 + 172);
  if ((v13 & 0x80000000) != 0)
    v14 = -1;
  else
    v14 = dispatch_time(0, 1000000000 * v13);
  dispatch_semaphore_wait(v12, v14);
  MEMORY[0x23B7E93F8](*(_QWORD *)(a4 + 136));
  v16 = *(NSObject **)(a4 + 144);
  if (v16)
  {
    dispatch_release(v16);
    *(_QWORD *)(a4 + 144) = 0;
  }
  v17 = *(const void **)(a4 + 112);
  if (v17)
    v15 = CFRetain(v17);
  else
    v15 = 0;
  MEMORY[0x23B7E9404](*(_QWORD *)(a4 + 136));
  if (a6)
  {
LABEL_15:
    if (v15)
      v18 = 0;
    else
      v18 = 4294950568;
    a6(a1, v15, v18, a7);
  }
LABEL_19:
  if (v15)
    CFRelease(v15);
}

void sender_handleEndpointFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int Int64;
  int v6;
  NSObject *v7;
  _QWORD block[5];
  int v9;

  Int64 = CFDictionaryGetInt64();
  if (gLogCategory_AirPlaySenderKit <= 100
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Int64)
    v6 = Int64;
  else
    v6 = -6762;
  v7 = *(NSObject **)(a4 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __sender_handleEndpointFailure_block_invoke;
  block[3] = &__block_descriptor_tmp_52;
  block[4] = a4;
  v9 = v6;
  dispatch_sync(v7, block);
}

void sender_handleEndpointStreamFailure(int a1, const void *a2, int a3, int a4, const __CFDictionary *cf)
{
  const __CFDictionary *Mutable;
  CFTypeID v7;
  __CFNotificationCenter *LocalCenter;

  Mutable = cf;
  if (cf)
  {
    v7 = CFGetTypeID(cf);
    if (v7 == CFDictionaryGetTypeID())
    {
      CFDictionaryGetInt64();
      CFDictionaryGetValue(Mutable, (const void *)*MEMORY[0x24BDC11F0]);
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      FigCFDictionarySetInt32();
    }
    else
    {
      Mutable = 0;
    }
  }
  if (gLogCategory_AirPlaySenderKit <= 90
    && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("APMediaSender_VideoStreamFailed"), a2, Mutable, 1u);
  if (Mutable)
    CFRelease(Mutable);
}

intptr_t sender_stopDiscovery(intptr_t result)
{
  NSObject *v1;
  intptr_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD, _QWORD);

  v1 = *(NSObject **)(result + 160);
  if (v1)
  {
    v2 = result;
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    v3 = *(_QWORD *)(v2 + 32);
    v4 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v4)
      v4(v3, *MEMORY[0x24BDC0E68], 0);
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_QWORD *)(v2 + 160) = 0;
    return dispatch_semaphore_signal(v1);
  }
  return result;
}

uint64_t endpointMatchByName(const void *a1, const void *a2)
{
  CFAllocatorRef v3;
  uint64_t CMBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, CFAllocatorRef, CFTypeRef *);
  uint64_t v6;
  CFTypeRef cf1;

  cf1 = 0;
  v3 = CFGetAllocator(a1);
  CMBaseObject = FigEndpointGetCMBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
  if (!v5 || v5(CMBaseObject, *MEMORY[0x24BDC11B8], v3, &cf1))
  {
    APSLogErrorAt();
    v6 = 0;
  }
  else
  {
    if (!cf1)
      return 0;
    v6 = CFEqual(cf1, a2);
  }
  if (cf1)
    CFRelease(cf1);
  return v6;
}

BOOL endpointMatchByID(const void *a1, const __CFString *a2)
{
  CFAllocatorRef v3;
  uint64_t CMBaseObject;
  unsigned int (*v5)(uint64_t, _QWORD, CFAllocatorRef, CFStringRef *);
  _BOOL8 v6;
  CFStringRef theString1;

  theString1 = 0;
  v3 = CFGetAllocator(a1);
  CMBaseObject = FigEndpointGetCMBaseObject();
  v5 = *(unsigned int (**)(uint64_t, _QWORD, CFAllocatorRef, CFStringRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 8)
                                                                                     + 48);
  if (!v5 || v5(CMBaseObject, *MEMORY[0x24BDC1180], v3, &theString1))
  {
    APSLogErrorAt();
    v6 = 0;
  }
  else
  {
    if (!theString1)
      return 0;
    v6 = CFStringCompare(theString1, a2, 1uLL) == kCFCompareEqualTo;
  }
  if (theString1)
    CFRelease(theString1);
  return v6;
}

BOOL endpointMatchAssisted(const void *a1)
{
  CFAllocatorRef v1;
  uint64_t CMBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, CFAllocatorRef, CFTypeRef *);
  CFTypeRef v4;
  _BOOL8 v5;
  CFTypeRef cf;

  cf = 0;
  v1 = CFGetAllocator(a1);
  CMBaseObject = FigEndpointGetCMBaseObject();
  v3 = *(unsigned int (**)(uint64_t, _QWORD, CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
  if (!v3 || v3(CMBaseObject, *MEMORY[0x24BDC1168], v1, &cf))
  {
    APSLogErrorAt();
    v5 = 0;
    v4 = cf;
    if (!cf)
      return v5;
    goto LABEL_4;
  }
  v4 = cf;
  v5 = cf == (CFTypeRef)*MEMORY[0x24BDBD270];
  if (cf)
LABEL_4:
    CFRelease(v4);
  return v5;
}

uint64_t __createEndpointForNetworkAddress_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = APAdvertiserInfoSetProperty();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    if (gLogCategory_AirPlaySenderKit <= 90)
    {
      if (gLogCategory_AirPlaySenderKit != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

dispatch_semaphore_t __sender_startDiscovery_block_invoke()
{
  dispatch_semaphore_t result;

  result = dispatch_semaphore_create(1);
  sender_startDiscovery_activationSema = (uint64_t)result;
  return result;
}

intptr_t sender_availableEndpointsChangedCallback(uint64_t a1, uint64_t a2)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a2 + 152));
}

void __sender_handleEndpointFailure_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 128);
  if (*(_DWORD *)(v2 + 176))
    v4 = 1;
  else
    v4 = v3 == 0;
  if (!v4)
  {
    v5 = *(NSObject **)(v2 + 24);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = __sender_handleEndpointFailure_block_invoke_2;
    v6[3] = &unk_25075CBB8;
    v6[4] = v3;
    v7 = *(_DWORD *)(a1 + 40);
    dispatch_async(v5, v6);
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_DWORD *)(v2 + 176) = *(_DWORD *)(a1 + 40);
}

uint64_t __sender_handleEndpointFailure_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void apsksa_rtDispatchSignalHandler()
{
  uint64_t v0;
  unsigned int *v1;
  unsigned int *v2;
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  unsigned int v8;
  CMTime v10;
  CMTime v11;
  uint64_t hostTime;
  uint64_t v13;
  uint64_t v14;

  v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  v1 = (unsigned int *)v0;
  hostTime = 0;
  v13 = 0;
  v14 = 0;
  memset(&v11, 0, sizeof(v11));
  if (v0)
  {
    v2 = (unsigned int *)(v0 + 120);
    if (atomic_load((unsigned int *)(v0 + 120)))
    {
      v4 = 0;
      while (1)
      {
        if ((unint64_t)APSRingBufferGetBytesUsed() <= 0x17 || APSRingBufferDequeueBytes())
        {
LABEL_17:
          APSLogErrorAt();
LABEL_11:

          goto LABEL_12;
        }
        v5 = objc_alloc(MEMORY[0x24BDBCEC8]);
        v6 = (void *)objc_msgSend(v5, "initWithLength:", v14);

        if (!v6)
        {
          APSLogErrorAt();
          goto LABEL_12;
        }
        v7 = v14;
        if (APSRingBufferGetBytesUsed() < v7)
          break;
        v4 = objc_retainAutorelease(v6);
        objc_msgSend(v4, "mutableBytes");
        if (APSRingBufferDequeueBytes())
          goto LABEL_17;
        do
          v8 = __ldaxr(v2);
        while (__stlxr(v8 - 1, v2));
        CMClockMakeHostTimeFromSystemUnits(&v11, hostTime);
        v10 = v11;
        objc_msgSend(v1, "enqueueAudioDataWithTimestamps:forHostTime:forSampleTime:forDiscontinuity:", v4, &v10, v13, BYTE4(v14));
        if (!atomic_load(v1 + 30))
          goto LABEL_11;
      }
      APSLogErrorAt();

    }
  }
LABEL_12:

}

void sub_235FE67DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_235FE6B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void fvdsrc_finalize_cold_1(int a1)
{
  if (a1 != -1 || OUTLINED_FUNCTION_1())
    OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
}

void fvdsrc_finalize_cold_2(int a1)
{
  if (a1 != -1 || OUTLINED_FUNCTION_1())
    OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
}

uint64_t sender_finalize_cold_1(int a1)
{
  uint64_t result;

  if (a1 != -1)
    return LogPrintF();
  result = _LogCategory_Initialize();
  if ((_DWORD)result)
    return LogPrintF();
  return result;
}

uint64_t APAdvertiserInfoCreate()
{
  return MEMORY[0x24BDFD510]();
}

uint64_t APAdvertiserInfoCreateTestInfoDictionary()
{
  return MEMORY[0x24BDFD518]();
}

uint64_t APAdvertiserInfoSetProperty()
{
  return MEMORY[0x24BDFD520]();
}

uint64_t APEndpointCreateWithTransportDevice()
{
  return MEMORY[0x24BE03128]();
}

uint64_t APEndpointManagerCreate()
{
  return MEMORY[0x24BE03130]();
}

uint64_t APSLogErrorAt()
{
  return MEMORY[0x24BE03468]();
}

uint64_t APSNetworkAddressCreateWithString()
{
  return MEMORY[0x24BE034A0]();
}

uint64_t APSRealTimeSignalCreate()
{
  return MEMORY[0x24BE035C8]();
}

uint64_t APSRealTimeSignalRaise()
{
  return MEMORY[0x24BE035D0]();
}

uint64_t APSRingBufferCreate()
{
  return MEMORY[0x24BE035E8]();
}

uint64_t APSRingBufferDequeueBytes()
{
  return MEMORY[0x24BE035F0]();
}

uint64_t APSRingBufferEnqueueBytes()
{
  return MEMORY[0x24BE035F8]();
}

uint64_t APSRingBufferGetBytesFree()
{
  return MEMORY[0x24BE03600]();
}

uint64_t APSRingBufferGetBytesUsed()
{
  return MEMORY[0x24BE03608]();
}

uint64_t APTransportDeviceCreateWithNetworkAddress()
{
  return MEMORY[0x24BDFD5B0]();
}

uint64_t ASPrintF()
{
  return MEMORY[0x24BE28DF0]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

uint64_t CFDictionaryApplyBlock()
{
  return MEMORY[0x24BE28F48]();
}

uint64_t CFDictionaryCopyCString()
{
  return MEMORY[0x24BE28F50]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x24BE28FC0]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

uint64_t CFStringCreateF()
{
  return MEMORY[0x24BE290E8]();
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0040](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

OSStatus CMAudioSampleBufferCreateReadyWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0060](allocator, dataBuffer, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x24BDC0090]();
}

OSStatus CMBufferQueueEnqueue(CMBufferQueueRef queue, CMBufferRef buf)
{
  return MEMORY[0x24BDC0110](queue, buf);
}

OSStatus CMBufferQueueReset(CMBufferQueueRef queue)
{
  return MEMORY[0x24BDC0138](queue);
}

uint64_t CMClockConvertHostTimeToSystemUnits(CMTime *hostTime)
{
  return MEMORY[0x24BDC0148](hostTime);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x24BDC0150]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x24BDC0158](retstr, clock);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x24BDC0168](retstr, hostTime);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x24BDC0228]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x24BDC0230]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x24BDC0238]();
}

uint64_t CMNotificationCenterRemoveListener()
{
  return MEMORY[0x24BDC0248]();
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC0420](retstr, lhs, rhs);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0468](time, allocator);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x24BDC5140](buffer, *(_QWORD *)&attachmentMode);
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5188](buffer, theAttachments, *(_QWORD *)&attachmentMode);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
  MEMORY[0x24BDC52A8](pixelBuffer, extraColumnsOnLeft, extraColumnsOnRight, extraRowsOnTop, extraRowsOnBottom);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

uint64_t FigCFDictionaryGetBooleanIfPresent()
{
  return MEMORY[0x24BDC06C0]();
}

uint64_t FigCFDictionarySetCMTime()
{
  return MEMORY[0x24BDC0720]();
}

uint64_t FigCFDictionarySetInt32()
{
  return MEMORY[0x24BDC0738]();
}

uint64_t FigCFDictionarySetInt64()
{
  return MEMORY[0x24BDC0740]();
}

uint64_t FigCFEqual()
{
  return MEMORY[0x24BDC0758]();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return MEMORY[0x24BDC0798]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x24BDC07A0]();
}

uint64_t FigCreateBlockBufferWithCFDataNoCopy()
{
  return MEMORY[0x24BDC07E8]();
}

uint64_t FigDisplayModes_ExtractDimensionsFromTimingMode()
{
  return MEMORY[0x24BDDCD78]();
}

uint64_t FigDisplayModes_ExtractOverscanInfoFromTimingMode()
{
  return MEMORY[0x24BDDCD80]();
}

uint64_t FigDisplayModes_ExtractVSyncRateFromTimingMode()
{
  return MEMORY[0x24BDDCD88]();
}

uint64_t FigDisplayModes_LookupTimingModeIDByIndex()
{
  return MEMORY[0x24BDDCD90]();
}

uint64_t FigEndpointActivateSync()
{
  return MEMORY[0x24BDC0828]();
}

uint64_t FigEndpointAudioSourceBufferQueueCreate()
{
  return MEMORY[0x24BDDCD98]();
}

uint64_t FigEndpointAudioSourceGetCMBaseObject()
{
  return MEMORY[0x24BDC0830]();
}

uint64_t FigEndpointCopyFirstStreamOfType()
{
  return MEMORY[0x24BDC0838]();
}

uint64_t FigEndpointDeactivate()
{
  return MEMORY[0x24BDC0840]();
}

uint64_t FigEndpointGetCMBaseObject()
{
  return MEMORY[0x24BDC0850]();
}

uint64_t FigEndpointManagerCopyEndpointsForType()
{
  return MEMORY[0x24BDC0860]();
}

uint64_t FigEndpointStreamAudioEngineGetCMBaseObject()
{
  return MEMORY[0x24BDDCDA0]();
}

uint64_t FigEndpointStreamAudioEngineResumeSync()
{
  return MEMORY[0x24BDDCDA8]();
}

uint64_t FigEndpointStreamAudioEngineSetEndpointStreamSync()
{
  return MEMORY[0x24BDDCDB0]();
}

uint64_t FigEndpointStreamAudioEngineSuspendSync()
{
  return MEMORY[0x24BDDCDB8]();
}

uint64_t FigEndpointStreamGetCMBaseObject()
{
  return MEMORY[0x24BDC0870]();
}

uint64_t FigEndpointStreamResume()
{
  return MEMORY[0x24BDC0880]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x24BDC09F8]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x24BDC0A00]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x24BDC0A08]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x24BDC0A10]();
}

uint64_t FigVirtualDisplaySourceGetClassID()
{
  return MEMORY[0x24BDDCE70]();
}

uint64_t FigXPCCreateBasicMessage()
{
  return MEMORY[0x24BDC0AA8]();
}

uint64_t FigXPCMessageCopyCFDictionary()
{
  return MEMORY[0x24BDC0AB0]();
}

uint64_t FigXPCMessageGetOpCode()
{
  return MEMORY[0x24BDC0AC8]();
}

uint64_t FigXPCMessageSetCFDictionary()
{
  return MEMORY[0x24BDC0AD8]();
}

uint64_t FigXPCMessageSetCFObject()
{
  return MEMORY[0x24BDC0AE0]();
}

uint64_t FigXPCMessageSetCMTime()
{
  return MEMORY[0x24BDC0AE8]();
}

uint64_t FigXPCRelease()
{
  return MEMORY[0x24BDC0AF8]();
}

uint64_t FigXPCRemoteClientAssociateObject()
{
  return MEMORY[0x24BDC0B00]();
}

uint64_t FigXPCRemoteClientCreateWithXPCService()
{
  return MEMORY[0x24BDC0B08]();
}

uint64_t FigXPCRemoteClientDisassociateObject()
{
  return MEMORY[0x24BDC0B10]();
}

uint64_t FigXPCRemoteClientSendSyncMessageCreatingReply()
{
  return MEMORY[0x24BDC0B18]();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x24BDD8B60](aSurface);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8D28](xobj);
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x24BE295B0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t SNPrintF()
{
  return MEMORY[0x24BE29958]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x24BE29A28]();
}

uint64_t TextToHardwareAddressScalar()
{
  return MEMORY[0x24BE29AA0]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

