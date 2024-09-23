@implementation BWCinematicVideoMetadataNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWCinematicVideoMetadataNode)init
{
  BWCinematicVideoMetadataNode *v2;
  BWNodeInput *v3;
  BWVideoFormatRequirements *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFArray *v15;
  BWNodeOutput *v16;
  BWNodeOutput *v17;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[3];
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];
  _QWORD v38[3];
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  _QWORD v43[5];

  v43[3] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)BWCinematicVideoMetadataNode;
  v2 = -[BWNode init](&v21, sel_init);
  if (v2)
  {
    v3 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v2);
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v3, "setFormatRequirements:", v4);

    -[BWNodeInput setPassthroughMode:](v3, "setPassthroughMode:", 1);
    -[BWNode addInput:](v2, "addInput:", v3);

    v6 = *MEMORY[0x1E0CA2518];
    v41[0] = *MEMORY[0x1E0CA2528];
    v5 = v41[0];
    v41[1] = v6;
    v7 = *MEMORY[0x1E0CA23F0];
    v43[0] = CFSTR("mdta/com.apple.quicktime.aperture-float");
    v43[1] = v7;
    v42 = *MEMORY[0x1E0CA2538];
    v8 = v42;
    v39 = *MEMORY[0x1E0CA2540];
    v9 = v39;
    v40 = *MEMORY[0x1E0C9AE40];
    v10 = v40;
    v43[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v41, 3);
    v37[0] = v5;
    v37[1] = v6;
    v38[0] = CFSTR("mdta/com.apple.quicktime.disparity-float");
    v38[1] = v7;
    v37[2] = v8;
    v35 = v9;
    v36 = v10;
    v38[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v33[0] = v5;
    v33[1] = v6;
    v11 = *MEMORY[0x1E0CA2440];
    v34[0] = CFSTR("mdta/com.apple.quicktime.cinematic-video.cinematography");
    v34[1] = v11;
    v33[2] = v8;
    v31 = v9;
    v32 = v10;
    v34[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
    v29[0] = v5;
    v29[1] = v6;
    v30[0] = CFSTR("mdta/com.apple.quicktime.cinematic-video.rendering");
    v30[1] = v11;
    v29[2] = v8;
    v27 = v9;
    v28 = v10;
    v30[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
    v25[0] = v5;
    v25[1] = v6;
    v26[0] = CFSTR("mdta/com.apple.quicktime.cinematic-video.stabilization");
    v26[1] = v11;
    v25[2] = v8;
    v23 = v9;
    v24 = v10;
    v26[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v22[0] = v20;
    v22[1] = v19;
    v22[2] = v12;
    v22[3] = v13;
    v22[4] = v14;
    v15 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
    if (CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v15, &v2->_metadataFormatDescription))
    {

      return 0;
    }
    else
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", v5);
      objc_msgSend(v20, "objectForKeyedSubscript:", v6);
      v2->_localIDForAperture_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
      objc_msgSend(v19, "objectForKeyedSubscript:", v5);
      objc_msgSend(v19, "objectForKeyedSubscript:", v6);
      v2->_localIDForDisparity_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
      objc_msgSend(v12, "objectForKeyedSubscript:", v5);
      objc_msgSend(v12, "objectForKeyedSubscript:", v6);
      v2->_localIDForCinematographyMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
      objc_msgSend(v13, "objectForKeyedSubscript:", v5);
      objc_msgSend(v13, "objectForKeyedSubscript:", v6);
      v2->_localIDForRenderingMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
      objc_msgSend(v14, "objectForKeyedSubscript:", v5);
      objc_msgSend(v14, "objectForKeyedSubscript:", v6);
      v2->_localIDForStabilizationMetadata_BE = bswap32(FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors());
      v16 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v2);
      -[BWNodeOutput setName:](v16, "setName:", CFSTR("PassThru"));
      -[BWNodeOutput setPassthroughMode:](v16, "setPassthroughMode:", 1);
      -[BWNode addOutput:](v2, "addOutput:", v16);
      v2->_passthruOutput = v16;

      v17 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1835365473, v2);
      -[BWNodeOutput setName:](v17, "setName:", CFSTR("CinematicVideoMetadata"));
      -[BWNodeOutput setFormat:](v17, "setFormat:", +[BWMetadataFormat formatWithMetadataFormatDescription:](BWMetadataFormat, "formatWithMetadataFormatDescription:", v2->_metadataFormatDescription));
      -[BWNode addOutput:](v2, "addOutput:", v17);
      v2->_metadataOutput = v17;

    }
  }
  return v2;
}

- (void)dealloc
{
  opaqueCMFormatDescription *metadataFormatDescription;
  OpaqueCMBlockBuffer *emptyMetadataSampleData;
  objc_super v5;

  metadataFormatDescription = self->_metadataFormatDescription;
  if (metadataFormatDescription)
    CFRelease(metadataFormatDescription);
  emptyMetadataSampleData = self->_emptyMetadataSampleData;
  if (emptyMetadataSampleData)
    CFRelease(emptyMetadataSampleData);
  v5.receiver = self;
  v5.super_class = (Class)BWCinematicVideoMetadataNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("CinematicVideoMetadata");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->_passthruOutput, "setFormat:", a3, a4);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  -[BWNodeOutput makeConfiguredFormatLive](self->_passthruOutput, "makeConfiguredFormatLive", a3, a4, a5);
  -[BWNodeOutput makeConfiguredFormatLive](self->_metadataOutput, "makeConfiguredFormatLive");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  -[BWNodeOutput markEndOfLiveOutput](self->_passthruOutput, "markEndOfLiveOutput", a3);
  -[BWNodeOutput markEndOfLiveOutput](self->_metadataOutput, "markEndOfLiveOutput");
}

- (void)_emitCopyOfMarkerBuffer:(void *)a3 onOutput:
{
  CMTime v5;
  CMSampleBufferRef sampleBufferOut;

  if (a1)
  {
    if (a3)
    {
      sampleBufferOut = 0;
      memset(&v5, 0, sizeof(v5));
      CMSampleBufferGetPresentationTimeStamp(&v5, sbuf);
      if (!CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], sbuf, &sampleBufferOut))
      {
        objc_msgSend(a3, "emitSampleBuffer:", sampleBufferOut);
        if (sampleBufferOut)
          CFRelease(sampleBufferOut);
      }
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  CMTime v14;
  CMTime v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CMTime v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  memset(&v20, 0, sizeof(v20));
  CMSampleBufferGetPresentationTimeStamp(&v20, a3);
  v6 = (void *)CMGetAttachment(a3, CFSTR("CinematicVideoMetadata"), 0);
  if (v6)
  {
    v7 = v6;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v13 = (void *)objc_msgSend(v12, "objectForKeyedSubscript:", 0x1E4959E98);
          memset(&v15, 0, sizeof(v15));
          CMTimeMakeFromDictionary(&v15, (CFDictionaryRef)objc_msgSend(v13, "objectForKeyedSubscript:", 0x1E4937518));
          v14 = v15;
          -[BWCinematicVideoMetadataNode _emitMetadataWithCinematographyMetadata:time:]((uint64_t)self, v12, (uint64_t)&v14);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }
  }
  if (BWSampleBufferIsMarkerBuffer(a3))
    -[BWCinematicVideoMetadataNode _emitCopyOfMarkerBuffer:onOutput:]((uint64_t)self, a3, self->_metadataOutput);
  if (!CMGetAttachment(a3, CFSTR("RefinedCinematographyStreamEndMarker"), 0))
    -[BWNodeOutput emitSampleBuffer:](self->_passthruOutput, "emitSampleBuffer:", a3);
}

- (void)_emitMetadataWithCinematographyMetadata:(uint64_t)a3 time:
{
  uint64_t v3;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  _DWORD *v17;
  const void *v18;
  OpaqueCMBlockBuffer *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  size_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  _DWORD *v28;
  _DWORD *v29;
  unsigned int v30;
  unsigned int v31;
  OSStatus v32;
  __int128 v33;
  CMTimeEpoch v34;
  __int128 v35;
  CMTimeEpoch v36;
  OSStatus v37;
  OSStatus v38;
  OSStatus v39;
  CMBlockBufferRef *blockBufferOut;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CMSampleTimingInfo sampleTimingArray;
  size_t sampleSizeArray;
  CMBlockBufferRef v46;
  CMSampleBufferRef v47;

  if (!a1)
    return;
  v46 = 0;
  v47 = 0;
  v7 = *(unsigned __int8 *)(a1 + 104);
  v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", 0x1E4959E98);
  if (v8 && (v9 = v8, objc_msgSend(v8, "objectForKeyedSubscript:", 0x1E4959E18)))
  {
    v42 = v3;
    sampleTimingArray.duration.value = 0;
    v10 = objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E4959E18);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    objc_msgSend((id)getPTSerializationClass(), "writeObject:toData:options:error:", v10, v11, 0, &sampleTimingArray);
    v12 = objc_msgSend(v11, "length");
    v13 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", 0x1E4959EB8);
    if (v13)
    {
      v14 = v13;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v13, "sizeOfSerializedObjectWithOptions:", 0));
      objc_msgSend(v14, "writeToData:withOptions:", v15, 0);
      v16 = v12 + objc_msgSend(v15, "length") + 16;
    }
    else
    {
      v15 = 0;
      v16 = v12 + 8;
    }
    v21 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", 0x1E4959ED8);
    v43 = a3;
    if (v21)
    {
      v22 = v21;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v21, "sizeOfSerializedObjectWithOptions:", 0));
      objc_msgSend(v22, "writeToData:withOptions:", v23, 0);
      v16 += objc_msgSend(v23, "length") + 8;
    }
    else
    {
      v23 = 0;
    }
    v24 = (v16 + 24);
    v17 = malloc_type_malloc(v24, 0x611D96CuLL);
    *v17 = bswap32(objc_msgSend(v11, "length") + 8);
    v17[1] = *(_DWORD *)(a1 + 144);
    memcpy(v17 + 2, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    v25 = objc_msgSend(v11, "length");
    v26 = v25 + 8;

    if (v15)
    {
      *(_DWORD *)((char *)v17 + v26) = bswap32(objc_msgSend(v15, "length") + 8);
      *(_DWORD *)((char *)v17 + v25 + 12) = *(_DWORD *)(a1 + 148);
      memcpy((char *)v17 + v26 + 8, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
      v26 = v25 + objc_msgSend(v15, "length") + 16;

    }
    a3 = v43;
    if (v23)
    {
      v27 = objc_msgSend(v23, "length");
      v28 = (_DWORD *)((char *)v17 + v26);
      *v28 = bswap32(v27 + 8);
      v28[1] = *(_DWORD *)(a1 + 152);
      memcpy((char *)v17 + v26 + 8, (const void *)objc_msgSend(v23, "bytes"), objc_msgSend(v23, "length"));
      v26 += objc_msgSend(v23, "length") + 8;

    }
    v29 = (_DWORD *)((char *)v17 + v26);
    *v29 = 201326592;
    v29[1] = *(_DWORD *)(a1 + 136);
    objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E4959DB8), "floatValue");
    v29[2] = bswap32(v30);
    v29[3] = 201326592;
    v29[4] = *(_DWORD *)(a1 + 140);
    objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E4959DF8), "floatValue");
    v29[5] = bswap32(v31);
    v32 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v17, v24, (CFAllocatorRef)*MEMORY[0x1E0C9AE10], 0, 0, v24, 0, &v46);
    if (v32)
    {
      v38 = v32;
      fig_log_get_emitter();
      v41 = v3;
      LODWORD(blockBufferOut) = v38;
      FigDebugAssert3();
      goto LABEL_28;
    }
    v19 = v46;
    sampleSizeArray = 0;
    if (!v46)
      goto LABEL_26;
    v20 = 0;
  }
  else
  {
    if (v7)
    {
      v17 = 0;
      sampleSizeArray = 0;
LABEL_28:
      *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)a3;
      sampleTimingArray.duration.epoch = *(_QWORD *)(a3 + 16);
      objc_msgSend(*(id *)(a1 + 128), "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F0F8, &sampleTimingArray, blockBufferOut, v41));
      goto LABEL_29;
    }
    v18 = (const void *)-[BWCinematicVideoMetadataNode _emptyMetadataBlockBuffer](a1);
    if (!v18)
    {
      v17 = 0;
      v46 = 0;
      goto LABEL_28;
    }
    v42 = v3;
    v19 = (OpaqueCMBlockBuffer *)CFRetain(v18);
    v46 = v19;
    if (!v19)
    {
LABEL_26:
      v17 = 0;
      goto LABEL_28;
    }
    v20 = 1;
  }
  v33 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v33;
  v34 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v35 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
  *(_OWORD *)&sampleTimingArray.duration.epoch = v35;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *(_OWORD *)a3;
  v36 = *(_QWORD *)(a3 + 16);
  sampleTimingArray.decodeTimeStamp.epoch = v34;
  sampleTimingArray.presentationTimeStamp.epoch = v36;
  sampleSizeArray = CMBlockBufferGetDataLength(v19);
  v37 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v46, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 96), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v47);
  if (v37)
  {
    v39 = v37;
    fig_log_get_emitter();
    v41 = v42;
    LODWORD(blockBufferOut) = v39;
    FigDebugAssert3();
  }
  if (!v47)
    goto LABEL_26;
  objc_msgSend(*(id *)(a1 + 128), "emitSampleBuffer:");
  v17 = 0;
  *(_BYTE *)(a1 + 104) = v20;
LABEL_29:
  if (v46)
    CFRelease(v46);
  if (v47)
    CFRelease(v47);
  free(v17);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput emitDroppedSample:](self->_passthruOutput, "emitDroppedSample:", a3, a4);
  -[BWNodeOutput emitDroppedSample:](self->_metadataOutput, "emitDroppedSample:", a3);
}

- (uint64_t)_emptyMetadataBlockBuffer
{
  uint64_t v1;
  char *dataPointerOut;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 112))
    {
      if (CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 8uLL, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 8uLL, 1u, (CMBlockBufferRef *)(result + 112)))
      {
        fig_log_get_emitter();
      }
      else
      {
        dataPointerOut = 0;
        if (!CMBlockBufferGetDataPointer(*(CMBlockBufferRef *)(v1 + 112), 0, 0, 0, &dataPointerOut))
        {
          *(_QWORD *)dataPointerOut = 0x8000000;
          return *(_QWORD *)(v1 + 112);
        }
        fig_log_get_emitter();
      }
      FigDebugAssert3();
    }
    return *(_QWORD *)(v1 + 112);
  }
  return result;
}

- (BWNodeOutput)passthruOutput
{
  return self->_passthruOutput;
}

- (BWNodeOutput)metadataOutput
{
  return self->_metadataOutput;
}

@end
