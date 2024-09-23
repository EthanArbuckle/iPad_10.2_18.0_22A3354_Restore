@implementation BWCameraInfoMetadataNode

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  -[BWNodeOutput makeConfiguredFormatLive](self->_passthruOutput, "makeConfiguredFormatLive", a3, a4, a5);
  -[BWNodeOutput makeConfiguredFormatLive](self->_boxedMetadataOutput, "makeConfiguredFormatLive");
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  $470D365275581EF16070F5A11344F73E Dimensions;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFData *v11;
  __CFData *v12;
  const __CFArray *v13;
  const __CFAllocator *v14;
  opaqueCMFormatDescription *basicBoxedMetadataFormatDescription;
  OSStatus v16;
  opaqueCMFormatDescription *boxedMetadataFormatDescription;
  CMMetadataFormatDescriptionRef v18;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[BWNodeOutput setFormat:](self->_passthruOutput, "setFormat:", a3, a4);
  if (!self->_generateLivePhotosMetadata)
    return;
  Dimensions = ($470D365275581EF16070F5A11344F73E)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(a3, "formatDescription"));
  v18 = 0;
  formatDescriptionOut = 0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v8 = *MEMORY[0x1E0CA2528];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("mdta/com.apple.quicktime.live-photo-info"), *MEMORY[0x1E0CA2528]);
  v9 = *MEMORY[0x1E0CA2518];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("com.apple.quicktime.com.apple.quicktime.live-photo-info"), *MEMORY[0x1E0CA2518]);
  v20 = *MEMORY[0x1E0CA2540];
  v21[0] = *MEMORY[0x1E0C9AE40];
  v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CA2538]);
  v11 = FigLivePhotoMetadataCopySetupDataAddingDimensions((const __CFData *)sLivePhotoMetadataSoftwareVersionSetupDataWithAtomHeader, *(_QWORD *)&Dimensions);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CA2530]);
    CFRelease(v12);
  }
  v13 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
  v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v13, &formatDescriptionOut))
  {
    fig_log_get_emitter();
    goto LABEL_17;
  }
  basicBoxedMetadataFormatDescription = self->_basicBoxedMetadataFormatDescription;
  if (basicBoxedMetadataFormatDescription)
  {
    v16 = CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions(v14, basicBoxedMetadataFormatDescription, formatDescriptionOut, &v18);
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    formatDescriptionOut = 0;
    if (!v16)
      goto LABEL_11;
    fig_log_get_emitter();
LABEL_17:
    FigDebugAssert3();
    return;
  }
  v18 = formatDescriptionOut;
  formatDescriptionOut = 0;
LABEL_11:
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  self->_localIDForLivePhotosMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
  boxedMetadataFormatDescription = self->_boxedMetadataFormatDescription;
  if (boxedMetadataFormatDescription)
    CFRelease(boxedMetadataFormatDescription);
  self->_boxedMetadataFormatDescription = v18;
  self->_videoDimensions = Dimensions;
  -[BWNodeOutput setFormat:](self->_boxedMetadataOutput, "setFormat:", +[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:", self->_boxedMetadataFormatDescription));
}

- (id)initForLivePhotosMetadata:(BOOL)a3 generateDebugMetadata:(BOOL)a4
{
  return -[BWCameraInfoMetadataNode _initForMotionMetadataSource:generateLivePhotosMetadata:generateDebugMetadata:](self, (uint64_t)a2, a3);
}

- (BWNodeOutput)boxedMetadataOutput
{
  return self->_boxedMetadataOutput;
}

- (CMMetadataFormatDescriptionRef)_initForMotionMetadataSource:(void *)a1 generateLivePhotosMetadata:(uint64_t)a2 generateDebugMetadata:(int)a3
{
  CMMetadataFormatDescriptionRef *v4;
  BWNodeInput *v5;
  BWVideoFormatRequirements *v6;
  const __CFArray *v7;
  BWNodeOutput *v8;
  BWNodeOutput *v9;
  objc_super v11;

  if (!a1)
    return 0;
  v11.receiver = a1;
  v11.super_class = (Class)BWCameraInfoMetadataNode;
  v4 = (CMMetadataFormatDescriptionRef *)objc_msgSendSuper2(&v11, sel_init);
  if (v4)
  {
    v5 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v4);
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v5, "setFormatRequirements:", v6);

    -[BWNodeInput setPassthroughMode:](v5, "setPassthroughMode:", 1);
    -[CMMetadataFormatDescriptionRef addInput:](v4, "addInput:", v5);

    *((_DWORD *)v4 + 38) = 0;
    *((_DWORD *)v4 + 39) = 0;
    v7 = (const __CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a3)
    {
      MEMORY[0x1A858C99C](&_initForMotionMetadataSource_generateLivePhotosMetadata_generateDebugMetadata__s_cimn_registerLivePhotosMetadata_once, cimn_registerLivePhotosMetadata_once);
      *((_BYTE *)v4 + 96) = 1;
    }
    if (-[__CFArray count](v7, "count"))
    {
      if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v7, v4 + 14))
      {

        return 0;
      }
      v4[13] = (CMMetadataFormatDescriptionRef)CFRetain(v4[14]);
    }
    v8 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v4);
    -[BWNodeOutput setName:](v8, "setName:", CFSTR("CameraPassThru"));
    -[BWNodeOutput setPassthroughMode:](v8, "setPassthroughMode:", 1);
    -[CMMetadataFormatDescriptionRef addOutput:](v4, "addOutput:", v8);
    v4[17] = (CMMetadataFormatDescriptionRef)v8;

    v9 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1835365473, v4);
    -[BWNodeOutput setName:](v9, "setName:", CFSTR("CameraInfoMetadata"));
    if (v4[13])
      -[BWNodeOutput setFormat:](v9, "setFormat:", +[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:"));
    -[CMMetadataFormatDescriptionRef addOutput:](v4, "addOutput:", v9);
    v4[18] = (CMMetadataFormatDescriptionRef)v9;

  }
  return v4;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  opaqueCMFormatDescription *basicBoxedMetadataFormatDescription;
  opaqueCMFormatDescription *boxedMetadataFormatDescription;
  OpaqueCMBlockBuffer *emptyMetadataSampleData;
  objc_super v6;

  basicBoxedMetadataFormatDescription = self->_basicBoxedMetadataFormatDescription;
  if (basicBoxedMetadataFormatDescription)
    CFRelease(basicBoxedMetadataFormatDescription);
  boxedMetadataFormatDescription = self->_boxedMetadataFormatDescription;
  if (boxedMetadataFormatDescription)
    CFRelease(boxedMetadataFormatDescription);
  emptyMetadataSampleData = self->_emptyMetadataSampleData;
  if (emptyMetadataSampleData)
    CFRelease(emptyMetadataSampleData);
  v6.receiver = self;
  v6.super_class = (Class)BWCameraInfoMetadataNode;
  -[BWNode dealloc](&v6, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("CameraInfoMetadata");
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
  CMTime v9;
  CMSampleBufferRef sampleBufferOut;
  CMTime v11;

  memset(&v11, 0, sizeof(v11));
  CMSampleBufferGetPresentationTimeStamp(&v11, a3);
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    v6 = CMGetAttachment(a3, CFSTR("FileWriterAction"), 0);
    if (v6)
    {
      v7 = v6;
      if (CFEqual(v6, CFSTR("Start")) || CFEqual(v7, CFSTR("Resume")))
        self->_previousGeneratedMetadataBufferWasEmpty = 0;
    }
    sampleBufferOut = 0;
    if (CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, &sampleBufferOut))
    {
      v9 = v11;
      -[BWNodeOutput emitDroppedSample:](self->_boxedMetadataOutput, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F078, &v9));
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
    if (v8 && self->_generateLivePhotosMetadata)
    {
      v9 = v11;
      -[BWCameraInfoMetadataNode _emitLivePhotosAndDebugBoxedMetadataForSampleBuffer:metadata:time:]((uint64_t)self, a3, v8, (uint64_t)&v9);
    }
  }
  -[BWNodeOutput emitSampleBuffer:](self->_passthruOutput, "emitSampleBuffer:", a3);
}

- (void)_emitLivePhotosAndDebugBoxedMetadataForSampleBuffer:(void *)a3 metadata:(uint64_t)a4 time:
{
  uint64_t v4;
  int v7;
  BOOL v8;
  void *v16;
  signed int v17;
  id v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  const __CFDictionary *CorrectedDetectedObjects;
  void *v22;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  size_t v28;
  unsigned int *v29;
  unsigned int *v30;
  size_t v31;
  const void *v32;
  OpaqueCMBlockBuffer *v33;
  OSStatus v34;
  __int128 v35;
  CMTimeEpoch v36;
  __int128 v37;
  CMTimeEpoch v38;
  OSStatus v39;
  BOOL v40;
  OSStatus v41;
  CMBlockBufferRef *blockBufferOut;
  uint64_t v43;
  const void *v44;
  id v45;
  CMSampleTimingInfo sampleTimingArray;
  size_t sampleSizeArray;
  CMSampleBufferRef v48;
  CMBlockBufferRef v49;
  uint64_t v50;
  uint64_t v51;
  size_t v52[2];

  if (!a1)
    return;
  v51 = 0;
  v52[0] = 0;
  v49 = 0;
  v50 = 0;
  v48 = 0;
  v7 = *(unsigned __int8 *)(a1 + 120);
  v8 = *(_BYTE *)(a1 + 120) != 0;
  if ((*(_BYTE *)(a4 + 12) & 1) == 0)
  {
    v22 = 0;
    CorrectedDetectedObjects = 0;
    v20 = 0;
    v19 = 0;
    v18 = 0;
    goto LABEL_34;
  }
  if (!objc_msgSend(a3, "count") || !*(_BYTE *)(a1 + 96))
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    CorrectedDetectedObjects = 0;
    v22 = 0;
    if (!v7)
      goto LABEL_23;
    goto LABEL_10;
  }
  sampleTimingArray.duration.value = 0;
  *(_QWORD *)&sampleTimingArray.duration.timescale = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&sampleTimingArray.duration.epoch = _Q0;
  FigCFDictionaryGetCGRectIfPresent();
  v16 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
  v17 = objc_msgSend(v16, "count");
  if (v17 < 1)
  {
    v45 = 0;
  }
  else if (*(double *)&sampleTimingArray.duration.epoch == 1.0
         && *(double *)&sampleTimingArray.presentationTimeStamp.value == 1.0)
  {
    v45 = v16;
  }
  else
  {
    v45 = BWCreateCorrectedFacesArray(v16, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value);
    v17 = objc_msgSend(v45, "count");
  }
  v23 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
  v18 = v23;
  v44 = a2;
  if (v23)
  {
    if (objc_msgSend(v23, "count"))
    {
      CorrectedDetectedObjects = (const __CFDictionary *)cimn_createCorrectedDetectedObjects((void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06498]), (_DWORD *)&v51 + 1, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value);
      v20 = (const __CFDictionary *)cimn_createCorrectedDetectedObjects((void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06478]), &v51, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value);
      v19 = (const __CFDictionary *)cimn_createCorrectedDetectedObjects((void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06488]), (_DWORD *)&v50 + 1, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value);
      v18 = cimn_createCorrectedDetectedObjects((void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D064C0]), &v50, *(double *)&sampleTimingArray.duration.value, *(double *)&sampleTimingArray.duration.timescale, *(double *)&sampleTimingArray.duration.epoch, *(double *)&sampleTimingArray.presentationTimeStamp.value);
      v25 = v51;
      v24 = HIDWORD(v51);
      v27 = v50;
      v26 = HIDWORD(v50);
    }
    else
    {
      v27 = 0;
      v26 = 0;
      v25 = 0;
      v24 = 0;
      CorrectedDetectedObjects = 0;
      v20 = 0;
      v19 = 0;
      v18 = 0;
    }
  }
  else
  {
    v27 = 0;
    v26 = 0;
    v25 = 0;
    v24 = 0;
    CorrectedDetectedObjects = 0;
    v20 = 0;
    v19 = 0;
  }
  FigLivePhotoMetadataComputeSerializationSizeV3(3u, v17, v24, v25, v26, v27, v52);
  if (v52[0])
  {
    v28 = v52[0] + 8;
    v29 = (unsigned int *)malloc_type_malloc(v52[0] + 8, 0xB9949744uLL);
    v30 = v29;
    v31 = v52[0];
    if (!v52[0]
      || (*v29 = bswap32(LODWORD(v52[0]) + 8),
          v29[1] = *(_DWORD *)(a1 + 160),
          *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)a4,
          sampleTimingArray.duration.epoch = *(_QWORD *)(a4 + 16),
          !FigLivePhotoMetadataSerializeIntoBufferV3(v44, (CGPoint *)&sampleTimingArray, (const __CFDictionary *)a3, (const __CFArray *)v45, CorrectedDetectedObjects, v20, v19, (const __CFDictionary *)v18, 3u, v31, v29 + 2)))
    {
      v34 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v30, v28, (CFAllocatorRef)*MEMORY[0x1E0C9AE10], 0, 0, v28, 0, &v49);
      if (v34)
      {
        v41 = v34;
        fig_log_get_emitter();
        v43 = v4;
        LODWORD(blockBufferOut) = v41;
        FigDebugAssert3();
        v22 = v45;
LABEL_39:
        *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)a4;
        sampleTimingArray.duration.epoch = *(_QWORD *)(a4 + 16);
        objc_msgSend(*(id *)(a1 + 144), "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F078, &sampleTimingArray, blockBufferOut, v43));
        goto LABEL_40;
      }
      v8 = 0;
      v22 = v45;
LABEL_28:
      v33 = v49;
      sampleSizeArray = 0;
      if (v49)
        goto LABEL_29;
LABEL_34:
      v40 = 0;
      goto LABEL_35;
    }
    free(v30);
    v52[0] = 0;
  }
  v22 = v45;
  if (v7)
  {
LABEL_10:
    v8 = 1;
    goto LABEL_28;
  }
LABEL_23:
  v32 = (const void *)-[BWCameraInfoMetadataNode _emptyMetadataBlockBuffer](a1);
  if (!v32)
  {
    v8 = 0;
    v40 = 0;
    v49 = 0;
    goto LABEL_35;
  }
  v33 = (OpaqueCMBlockBuffer *)CFRetain(v32);
  v49 = v33;
  if (!v33)
  {
    v8 = 0;
    goto LABEL_34;
  }
  v8 = 1;
LABEL_29:
  v35 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v35;
  v36 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v37 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
  *(_OWORD *)&sampleTimingArray.duration.epoch = v37;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)a4;
  v38 = *(_QWORD *)(a4 + 16);
  sampleTimingArray.decodeTimeStamp.epoch = v36;
  sampleTimingArray.presentationTimeStamp.epoch = v38;
  sampleSizeArray = CMBlockBufferGetDataLength(v33);
  v39 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v49, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 104), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v48);
  if (v39)
  {
    fig_log_get_emitter();
    v43 = v4;
    LODWORD(blockBufferOut) = v39;
    FigDebugAssert3();
  }
  v40 = v39 != 0;
LABEL_35:
  if (v40 || !v48)
    goto LABEL_39;
  objc_msgSend(*(id *)(a1 + 144), "emitSampleBuffer:");
  *(_BYTE *)(a1 + 120) = v8;
LABEL_40:

  if (v49)
    CFRelease(v49);
  if (v48)
    CFRelease(v48);
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

@end
