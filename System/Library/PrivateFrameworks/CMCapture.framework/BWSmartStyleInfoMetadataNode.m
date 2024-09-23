@implementation BWSmartStyleInfoMetadataNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWSmartStyleInfoMetadataNode)init
{
  BWSmartStyleInfoMetadataNode *v2;
  BWSmartStyleInfoMetadataNode *v3;
  BWNodeInput *v4;
  BWNodeInput *v5;
  BWVideoFormatRequirements *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BWNodeOutput *v12;
  BWNodeOutput *v13;
  BWNodeOutput *v14;
  BWNodeOutput *v15;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)BWSmartStyleInfoMetadataNode;
  v2 = -[BWNode init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_smartStyleReversibilityUses4x3Spotlights = 1;
    v4 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v2);
    if (!v4)
      goto LABEL_10;
    v5 = v4;
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", v6);

    -[BWNodeInput setPassthroughMode:](v5, "setPassthroughMode:", 1);
    -[BWNode addInput:](v3, "addInput:", v5);

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = *MEMORY[0x1E0CA2528];
    v9 = *MEMORY[0x1E0CA2518];
    v20[0] = *MEMORY[0x1E0CA2528];
    v20[1] = v9;
    v10 = *MEMORY[0x1E0CA2440];
    v21[0] = CFSTR("mdta/com.apple.quicktime.smartstyle-info");
    v21[1] = v10;
    v20[2] = *MEMORY[0x1E0CA2538];
    v18 = *MEMORY[0x1E0CA2540];
    v19 = *MEMORY[0x1E0C9AE40];
    v21[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    objc_msgSend(v7, "addObject:", v11);
    if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, (CFArrayRef)v7, &v3->_boxedMetadataFormatDescription))
    {
      goto LABEL_10;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v8);
    objc_msgSend(v11, "objectForKeyedSubscript:", v9);
    v3->_localIDForSmartStyleInfoPlistMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
    v12 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v3);
    if (!v12)
      goto LABEL_10;
    v13 = v12;
    -[BWNodeOutput setName:](v12, "setName:", CFSTR("SmartStyleCameraPassThru"));
    -[BWNodeOutput setPassthroughMode:](v13, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v3, "addOutput:", v13);
    v3->_passthruOutput = v13;

    v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1835365473, v3);
    if (v14)
    {
      v15 = v14;
      -[BWNodeOutput setName:](v14, "setName:", CFSTR("SmartStyleInfoMetadata"));
      if (v3->_boxedMetadataFormatDescription)
        -[BWNodeOutput setFormat:](v15, "setFormat:", +[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:"));
      -[BWNode addOutput:](v3, "addOutput:", v15);
      v3->_boxedMetadataOutput = v15;

    }
    else
    {
LABEL_10:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  opaqueCMFormatDescription *boxedMetadataFormatDescription;
  OpaqueCMBlockBuffer *emptyMetadataSampleData;
  objc_super v5;

  boxedMetadataFormatDescription = self->_boxedMetadataFormatDescription;
  if (boxedMetadataFormatDescription)
    CFRelease(boxedMetadataFormatDescription);
  emptyMetadataSampleData = self->_emptyMetadataSampleData;
  if (emptyMetadataSampleData)
    CFRelease(emptyMetadataSampleData);
  v5.receiver = self;
  v5.super_class = (Class)BWSmartStyleInfoMetadataNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("SmartStyleInfoMetadata");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->_passthruOutput, "setFormat:", a3, a4);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  -[BWNodeOutput makeConfiguredFormatLive](self->_passthruOutput, "makeConfiguredFormatLive", a3, a4, a5);
  -[BWNodeOutput makeConfiguredFormatLive](self->_boxedMetadataOutput, "makeConfiguredFormatLive");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWNodeOutput markEndOfLiveOutput](self->_passthruOutput, "markEndOfLiveOutput", a3);
  -[BWNodeOutput markEndOfLiveOutput](self->_boxedMetadataOutput, "markEndOfLiveOutput");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CFTypeRef v6;
  const void *v7;
  void *v8;
  void *v9;
  CMTime v10;
  CMSampleBufferRef sampleBufferOut;
  CMTime v12;

  memset(&v12, 0, sizeof(v12));
  CMSampleBufferGetPresentationTimeStamp(&v12, a3);
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    v6 = CMGetAttachment(a3, CFSTR("FileWriterAction"), 0);
    if (v6)
    {
      v7 = v6;
      if (CFEqual(v6, CFSTR("Start")) || CFEqual(v7, CFSTR("Resume")))
      {
        self->_previousGeneratedMetadataBufferWasEmpty = 0;
        v8 = (void *)CMGetAttachment(a3, CFSTR("RecordingSettings"), 0);
        if (v8)
          self->_currentRecordingSupportsReversibility = objc_msgSend(v8, "smartStyleReversibilitySupported");
      }
    }
    sampleBufferOut = 0;
    if (CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, &sampleBufferOut))
    {
      v10 = v12;
      -[BWNodeOutput emitDroppedSample:](self->_boxedMetadataOutput, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F078, &v10));
    }
    else
    {
      -[BWNodeOutput emitSampleBuffer:](self->_boxedMetadataOutput, "emitSampleBuffer:", sampleBufferOut);
    }
    if (sampleBufferOut)
      CFRelease(sampleBufferOut);
  }
  else if (self->_currentRecordingSupportsReversibility)
  {
    v9 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (v9)
    {
      v10 = v12;
      -[BWSmartStyleInfoMetadataNode _emitSmartStyleInfoBoxedMetadataForSampleBuffer:metadata:time:]((uint64_t)self, a3, v9, (uint64_t)&v10);
    }
  }
  else
  {
    v10 = v12;
    -[BWNodeOutput emitDroppedSample:](self->_boxedMetadataOutput, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F238, &v10));
  }
  -[BWNodeOutput emitSampleBuffer:](self->_passthruOutput, "emitSampleBuffer:", a3);
}

- (void)_emitSmartStyleInfoBoxedMetadataForSampleBuffer:(void *)a3 metadata:(uint64_t)a4 time:
{
  uint64_t v4;
  int v9;
  int v10;
  char ShouldBeBypassed;
  __CVBuffer *ImageBuffer;
  opaqueCMSampleBuffer *AttachedMedia;
  void *v14;
  const __CFAllocator *v15;
  const __CFData *Data;
  CFIndex Length;
  CFIndex v18;
  size_t v19;
  UInt8 *v20;
  UInt8 *v21;
  OSStatus v22;
  OpaqueCMBlockBuffer *v23;
  char v24;
  const void *v25;
  __int128 v26;
  CMTimeEpoch v27;
  __int128 v28;
  CMTimeEpoch v29;
  OSStatus v30;
  OSStatus v31;
  OSStatus v32;
  CMBlockBufferRef *blockBufferOut;
  uint64_t v34;
  CMSampleTimingInfo error;
  size_t sampleSizeArray;
  CMSampleBufferRef v37;
  CMBlockBufferRef v38;
  CFRange v39;

  if (!a1)
    return;
  v37 = 0;
  v38 = 0;
  if ((*(_BYTE *)(a4 + 12) & 1) == 0)
  {
    Data = 0;
    goto LABEL_28;
  }
  v9 = *(unsigned __int8 *)(a1 + 121);
  if (!objc_msgSend(a3, "count")
    || (v10 = *(unsigned __int8 *)(a1 + 140),
        error.duration.value = 0,
        ShouldBeBypassed = BWSmartStyleRenderingShouldBeBypassed(a2),
        ImageBuffer = 0,
        (ShouldBeBypassed & 1) == 0)
    && ((AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1E495B378)) == 0
     || (ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia)) == 0)
    || (v14 = BWSmartStyleInfoDictionary(a3, a3, ImageBuffer, 0, 0, 0, v10 != 0), !objc_msgSend(v14, "count")))
  {
    Data = 0;
LABEL_17:
    if (v9)
    {
      sampleSizeArray = 0;
      goto LABEL_28;
    }
    v25 = (const void *)-[BWSmartStyleInfoMetadataNode _emptyMetadataBlockBuffer](a1);
    if (!v25)
    {
      v38 = 0;
      goto LABEL_28;
    }
    v23 = (OpaqueCMBlockBuffer *)CFRetain(v25);
    v38 = v23;
    if (!v23)
      goto LABEL_28;
    v24 = 1;
    goto LABEL_22;
  }
  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, kCFPropertyListBinaryFormat_v1_0, 0, (CFErrorRef *)&error);
  if (error.duration.value)
    CFRelease((CFTypeRef)error.duration.value);
  if (!Data)
    goto LABEL_17;
  Length = CFDataGetLength(Data);
  if (!Length)
    goto LABEL_17;
  v18 = Length;
  v19 = Length + 8;
  v20 = (UInt8 *)malloc_type_malloc(Length + 8, 0x902CAB6BuLL);
  if (!v20)
  {
    fig_log_get_emitter();
    v34 = v4;
    LODWORD(blockBufferOut) = 0;
LABEL_38:
    FigDebugAssert3();
    goto LABEL_28;
  }
  v21 = v20;
  *(_DWORD *)v20 = bswap32(v19);
  *((_DWORD *)v20 + 1) = *(_DWORD *)(a1 + 136);
  v39.location = 0;
  v39.length = v18;
  CFDataGetBytes(Data, v39, v20 + 8);
  v22 = CMBlockBufferCreateWithMemoryBlock(v15, v21, v19, (CFAllocatorRef)*MEMORY[0x1E0C9AE10], 0, 0, v19, 0, &v38);
  if (v22)
  {
    v32 = v22;
    fig_log_get_emitter();
    v34 = v4;
    LODWORD(blockBufferOut) = v32;
    goto LABEL_38;
  }
  v23 = v38;
  sampleSizeArray = 0;
  if (!v38)
    goto LABEL_28;
  v24 = 0;
LABEL_22:
  v26 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
  *(_OWORD *)&error.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
  *(_OWORD *)&error.decodeTimeStamp.value = v26;
  v27 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v28 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  *(_OWORD *)&error.duration.value = *MEMORY[0x1E0CA2E90];
  *(_OWORD *)&error.duration.epoch = v28;
  *(_OWORD *)&error.presentationTimeStamp.value = *(_OWORD *)a4;
  v29 = *(_QWORD *)(a4 + 16);
  error.decodeTimeStamp.epoch = v27;
  error.presentationTimeStamp.epoch = v29;
  sampleSizeArray = CMBlockBufferGetDataLength(v23);
  v30 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v38, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 112), 1, 1, &error, 1, &sampleSizeArray, &v37);
  if (v30)
  {
    v31 = v30;
    fig_log_get_emitter();
    v34 = v4;
    LODWORD(blockBufferOut) = v31;
    FigDebugAssert3();
  }
  if (v37)
  {
    objc_msgSend(*(id *)(a1 + 104), "emitSampleBuffer:");
    *(_BYTE *)(a1 + 121) = v24;
    if (!Data)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_28:
  *(_OWORD *)&error.duration.value = *(_OWORD *)a4;
  error.duration.epoch = *(_QWORD *)(a4 + 16);
  objc_msgSend(*(id *)(a1 + 104), "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F078, &error, blockBufferOut, v34));
  if (Data)
LABEL_29:
    CFRelease(Data);
LABEL_30:
  if (v38)
    CFRelease(v38);
  if (v37)
    CFRelease(v37);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput emitDroppedSample:](self->_passthruOutput, "emitDroppedSample:", a3, a4);
  -[BWNodeOutput emitDroppedSample:](self->_boxedMetadataOutput, "emitDroppedSample:", a3);
}

- (uint64_t)_emptyMetadataBlockBuffer
{
  uint64_t v1;
  char *dataPointerOut;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 128))
    {
      if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 8uLL, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 8uLL, 1u, (CMBlockBufferRef *)(result + 128)))
      {
        fig_log_get_emitter();
      }
      else
      {
        dataPointerOut = 0;
        if (!CMBlockBufferGetDataPointer(*(CMBlockBufferRef *)(v1 + 128), 0, 0, 0, &dataPointerOut))
        {
          *(_QWORD *)dataPointerOut = 0x8000000;
          return *(_QWORD *)(v1 + 128);
        }
        fig_log_get_emitter();
      }
      FigDebugAssert3();
    }
    return *(_QWORD *)(v1 + 128);
  }
  return result;
}

- (BWNodeOutput)passthruOutput
{
  return self->_passthruOutput;
}

- (BWNodeOutput)boxedMetadataOutput
{
  return self->_boxedMetadataOutput;
}

@end
