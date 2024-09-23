@implementation BWVideoPlaybackSupportMetadataNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWVideoPlaybackSupportMetadataNode)init
{
  BWVideoPlaybackSupportMetadataNode *v2;
  BWNodeInput *v3;
  BWNodeInput *v4;
  BWVideoFormatRequirements *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFArray *v11;
  BWNodeOutput *v12;
  BWNodeOutput *v13;
  BWNodeOutput *v14;
  BWNodeOutput *v15;
  objc_super v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)BWVideoPlaybackSupportMetadataNode;
  v2 = -[BWNode init](&v17, sel_init);
  if (v2)
  {
    v3 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v2);
    if (!v3)
      goto LABEL_10;
    v4 = v3;
    v5 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v4, "setFormatRequirements:", v5);

    -[BWNodeInput setPassthroughMode:](v4, "setPassthroughMode:", 1);
    -[BWNode addInput:](v2, "addInput:", v4);

    v6 = *MEMORY[0x1E0CA2528];
    v7 = *MEMORY[0x1E0CA2580];
    v8 = *MEMORY[0x1E0CA2518];
    v21[0] = *MEMORY[0x1E0CA2528];
    v21[1] = v8;
    v9 = *MEMORY[0x1E0CA24C8];
    v22[0] = v7;
    v22[1] = v9;
    v21[2] = *MEMORY[0x1E0CA2538];
    v19 = *MEMORY[0x1E0CA2540];
    v20 = *MEMORY[0x1E0C9AE40];
    v22[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v18 = v10;
    v11 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v11, &v2->_boxedMetadataFormatDescription))
    {
      goto LABEL_10;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CA2520]);
    v2->_localIDOfLuxMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
    v12 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v2);
    if (!v12)
      goto LABEL_10;
    v13 = v12;
    -[BWNodeOutput setName:](v12, "setName:", CFSTR("PlaybackSupportMetadataCameraPassThru"));
    -[BWNodeOutput setPassthroughMode:](v13, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v2, "addOutput:", v13);
    v2->_passthruOutput = v13;

    v14 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1835365473, v2);
    if (v14)
    {
      v15 = v14;
      -[BWNodeOutput setName:](v14, "setName:", CFSTR("PlaybackSupportMetadata"));
      if (v2->_boxedMetadataFormatDescription)
        -[BWNodeOutput setFormat:](v15, "setFormat:", +[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:"));
      -[BWNode addOutput:](v2, "addOutput:", v15);
      v2->_boxedMetadataOutput = v15;

    }
    else
    {
LABEL_10:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return v2;
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
  v5.super_class = (Class)BWVideoPlaybackSupportMetadataNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("VideoPlaybackSupportMetadata");
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
  uint64_t v9;
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
        self->_prevSceneIlluminationValue = -1;
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
  else
  {
    v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (!v8
      || (v10 = v12,
          (-[BWVideoPlaybackSupportMetadataNode _emitPlaybackSupportBoxedMetadataForSampleBuffer:metadata:time:]((uint64_t)self, v9, v8, (uint64_t)&v10) & 1) == 0))
    {
      v10 = v12;
      -[BWNodeOutput emitDroppedSample:](self->_boxedMetadataOutput, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F078, &v10));
    }
  }
  -[BWNodeOutput emitSampleBuffer:](self->_passthruOutput, "emitSampleBuffer:", a3);
}

- (uint64_t)_emitPlaybackSupportBoxedMetadataForSampleBuffer:(void *)a3 metadata:(uint64_t)a4 time:
{
  int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  _DWORD *v10;
  OpaqueCMBlockBuffer *v11;
  __int128 v12;
  CMTimeEpoch v13;
  __int128 v14;
  CMTimeEpoch v15;
  const void *v16;
  CMSampleTimingInfo sampleTimingArray;
  size_t sampleSizeArray;
  CMSampleBufferRef v20;
  CMBlockBufferRef blockBufferOut;

  if (!a1)
    return 0;
  v20 = 0;
  blockBufferOut = 0;
  v6 = *(unsigned __int8 *)(a1 + 136);
  v7 = FigCaptureSceneIlluminationValueFromLuxLevel((void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06C40]), *(_DWORD *)(a1 + 140));
  v8 = v7;
  if (v7 != -1)
  {
    *(_DWORD *)(a1 + 140) = v7;
    v10 = malloc_type_malloc(0xCuLL, 0xFB8DA2DDuLL);
    *v10 = 201326592;
    v10[1] = *(_DWORD *)(a1 + 120);
    v10[2] = bswap32(v8);
    if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, 0xCuLL, (CFAllocatorRef)*MEMORY[0x1E0C9AE10], 0, 0, 0xCuLL, 0, &blockBufferOut))
    {
      fig_log_get_emitter();
      goto LABEL_16;
    }
    v11 = blockBufferOut;
    sampleSizeArray = 0;
    if (!blockBufferOut)
    {
LABEL_12:
      v9 = 0;
      goto LABEL_20;
    }
LABEL_7:
    v12 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v12;
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    v14 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
    *(_OWORD *)&sampleTimingArray.duration.epoch = v14;
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)a4;
    v15 = *(_QWORD *)(a4 + 16);
    sampleTimingArray.decodeTimeStamp.epoch = v13;
    sampleTimingArray.presentationTimeStamp.epoch = v15;
    sampleSizeArray = CMBlockBufferGetDataLength(v11);
    if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], blockBufferOut, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 112), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v20))
    {
      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 104), "emitSampleBuffer:");
        *(_BYTE *)(a1 + 136) = v8 == -1;
        v9 = 1;
        goto LABEL_18;
      }
LABEL_17:
      v9 = 0;
LABEL_18:
      if (blockBufferOut)
        CFRelease(blockBufferOut);
      goto LABEL_20;
    }
    fig_log_get_emitter();
LABEL_16:
    FigDebugAssert3();
    goto LABEL_17;
  }
  if (v6)
  {
    v9 = 0;
    sampleSizeArray = 0;
    goto LABEL_18;
  }
  v16 = (const void *)-[BWVideoPlaybackSupportMetadataNode _emptyMetadataBlockBuffer](a1);
  if (v16)
  {
    v11 = (OpaqueCMBlockBuffer *)CFRetain(v16);
    blockBufferOut = v11;
    if (!v11)
      goto LABEL_12;
    goto LABEL_7;
  }
  v9 = 0;
  blockBufferOut = 0;
LABEL_20:
  if (v20)
    CFRelease(v20);
  return v9;
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
