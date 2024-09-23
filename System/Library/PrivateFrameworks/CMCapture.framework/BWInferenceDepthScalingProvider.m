@implementation BWInferenceDepthScalingProvider

+ (void)initialize
{
  objc_opt_class();
}

- (BWInferenceDepthScalingProvider)initWithOutputRequirements:(id)a3 configuration:(id)a4
{
  BWInferenceDepthScalingProvider *v6;
  _BOOL4 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWInferenceDepthScalingProvider;
  v6 = -[BWInferenceDepthScalingProvider init](&v9, sel_init);
  if (v6)
  {
    v6->_outputRequirements = (NSArray *)a3;
    v7 = (int)FigCapturePlatformIdentifier() > 6;
    v6->_GPUDepthConversionSupported = v7;
    v6->_processingMode = v7;
    v6->_flipX = objc_msgSend(a4, "flipX");
    v6->_NANValue = (NSNumber *)objc_msgSend(a4, "NANValue");
    v6->_clampMin = (NSNumber *)objc_msgSend(a4, "clampMin");
    v6->_clampMax = (NSNumber *)objc_msgSend(a4, "clampMax");
    v6->_allowUpsampling = objc_msgSend(a4, "allowUpsampling");
    v6->_concurrencyWidth = objc_msgSend(a4, "concurrencyWidth");
  }
  return v6;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v4;

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);

  v4.receiver = self;
  v4.super_class = (Class)BWInferenceDepthScalingProvider;
  -[BWInferenceDepthScalingProvider dealloc](&v4, sel_dealloc);
}

- (int)prepareForExecution
{
  return 0;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  BWInferenceVideoFormat *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  MTLTextureDescriptor *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int result;
  uint64_t v13;
  MTLTextureDescriptor *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSDictionary *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  self->_metalContext = (FigMetalContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), 0);
  v4 = -[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat");
  v5 = (void *)objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat");
  v6 = -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat"), "width");
  v7 = -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat"), "height");
  v8 = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 23, v6, v7, 0);
  self->_srcdesc = v8;
  -[MTLTextureDescriptor setUsage:](v8, "setUsage:", 1);
  v9 = objc_msgSend(v5, "width");
  v10 = objc_msgSend(v5, "height");
  v11 = objc_msgSend(v5, "pixelFormat");
  result = -31740;
  v13 = 55;
  if (v11 > 1717856626)
  {
    if (v11 != 1717856627)
    {
      if (v11 != 1751411059 && v11 != 1751410032)
        return result;
LABEL_9:
      v13 = 25;
    }
  }
  else if (v11 != 1278226534)
  {
    if (v11 != 1278226536)
    {
      if (v11 != 1717855600)
        return result;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:
  v14 = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v13, v9, v10, 0);
  self->_dstdesc = v14;
  -[MTLTextureDescriptor setUsage:](v14, "setUsage:", 2);
  self->_requestedRotation = bwisr_getRequestedRotationDegrees(v4, v5);
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = (void *)-[FigMetalContext device](self->_metalContext, "device");
  v26 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = objc_msgSend(&unk_1E4A023D8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(&unk_1E4A023D8);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", (id)objc_msgSend(v16, "newComputePipelineStateWithFunction:error:", (id)objc_msgSend((id)-[FigMetalContext library](self->_metalContext, "library"), "newFunctionWithName:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i)), &v26), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        if (v26)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          return -31702;
        }
      }
      v18 = objc_msgSend(&unk_1E4A023D8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v18)
        continue;
      break;
    }
  }
  v21 = (NSDictionary *)objc_msgSend(v15, "copy");
  result = 0;
  self->_pipelineStates = v21;
  return result;
}

- (id)bindVideoInputFromAttachedMediaUsingKey:(id)a3 preparedByAttachedMediaKey:(id)a4 withVideoFormatProvider:(id)a5
{
  BWInferenceLazyVideoRequirement *v6;

  if (self->_inputRequirement)
    return 0;
  v6 = -[BWInferenceLazyVideoRequirement initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:]([BWInferenceLazyVideoRequirement alloc], "initWithAttachedMediaKey:preparedByAttachedMediaKey:videoFormatProvider:", a3, a3, a5);
  self->_inputRequirement = &v6->super;
  -[BWInferenceDepthScalingProvider _resolveProcessingMode]((uint64_t)self);
  return v6;
}

- (uint64_t)_resolveProcessingMode
{
  uint64_t v1;
  _BOOL4 v2;

  if (result)
  {
    v1 = result;
    v2 = 0;
    if (*(_BYTE *)(result + 48))
    {
      result = objc_msgSend(&unk_1E4A023F0, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "videoFormat"), "pixelFormat")));
      if ((result & 1) != 0)
        v2 = 1;
    }
    *(_DWORD *)(v1 + 44) = v2;
  }
  return result;
}

- (void)setInputRequirement:(id)a3
{

  self->_inputRequirement = (BWInferenceVideoRequirement *)a3;
  -[BWInferenceDepthScalingProvider _resolveProcessingMode]((uint64_t)self);
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  uint64_t v9;
  __CVBuffer *v10;
  __CVBuffer *v11;
  _DWORD *v12;
  NSArray *outputRequirements;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_inputRequirement);
  if (v9)
  {
    v10 = (__CVBuffer *)v9;
    v11 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", -[NSArray firstObject](self->_outputRequirements, "firstObject")), "newPixelBuffer");
    if (v11)
    {
      v12 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      if (*MEMORY[0x1E0CA1FC0] == 1)
        kdebug_trace();
      if (FigDepthConvertBuffer(v10, v11))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v18 = 4294935556;
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        outputRequirements = self->_outputRequirements;
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](outputRequirements, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v21 != v16)
                objc_enumerationMutation(outputRequirements);
              objc_msgSend(a4, "setPixelBuffer:forRequirement:", v11, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
            }
            v15 = -[NSArray countByEnumeratingWithState:objects:count:](outputRequirements, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v15);
        }
        if (*v12 == 1)
          kdebug_trace();
        v18 = 0;
      }
    }
    else
    {
      v18 = 4294935553;
    }
  }
  else
  {
    v11 = 0;
    v18 = 4294935584;
  }
  if (a6)
    (*((void (**)(id, uint64_t, BWInferenceDepthScalingProvider *))a6 + 2))(a6, v18, self);
  if (v11)
    CFRelease(v11);
  return v18;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v11;
  __CVBuffer *v12;
  uint64_t v13;
  __CVBuffer *v14;
  const void *AttachedMedia;
  void *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  NSNumber *NANValue;
  int v22;
  int v23;
  NSNumber *clampMin;
  int v25;
  int v26;
  NSNumber *clampMax;
  int v28;
  int v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  int requestedRotation;
  _BOOL4 v38;
  NSDictionary *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  _BOOL4 flipX;
  NSDictionary *pipelineStates;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  NSArray *outputRequirements;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  uint64_t v58;
  _QWORD v59[6];
  int v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  _QWORD v67[3];
  uint64_t v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a4, "pixelBufferForRequirement:", self->_inputRequirement);
  if (v11)
  {
    v12 = (__CVBuffer *)v11;
    v13 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", -[NSArray firstObject](self->_outputRequirements, "firstObject")), "newPixelBuffer");
    if (v13)
    {
      v14 = (__CVBuffer *)v13;
      v74 = objc_msgSend((id)objc_msgSend((id)CVPixelBufferGetAttributes(), "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FC8]), "shortValue");
      AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)-[BWInferenceMediaRequirement attachedMediaKey](self->_inputRequirement, "attachedMediaKey"));
      v16 = (void *)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E0D05C28], 0);
      objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D063A8]), "floatValue");
      v18 = v17;
      objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D063B0]), "floatValue");
      v20 = v19;
      NANValue = self->_NANValue;
      if (NANValue)
      {
        -[NSNumber floatValue](NANValue, "floatValue");
        v23 = v22;
      }
      else
      {
        v23 = 2143289344;
      }
      clampMin = self->_clampMin;
      if (clampMin)
      {
        -[NSNumber floatValue](clampMin, "floatValue");
        v26 = v25;
      }
      else
      {
        v26 = 2143289344;
      }
      clampMax = self->_clampMax;
      if (clampMax)
      {
        -[NSNumber floatValue](clampMax, "floatValue");
        v29 = v28;
      }
      else
      {
        v29 = 2143289344;
      }
      v30 = (void *)-[FigMetalContext device](self->_metalContext, "device", a7);
      v31 = (void *)objc_msgSend(v30, "newTextureWithDescriptor:iosurface:plane:", self->_srcdesc, CVPixelBufferGetIOSurface(v12), 0);
      a7 = (id)objc_msgSend(v30, "newTextureWithDescriptor:iosurface:plane:", self->_dstdesc, CVPixelBufferGetIOSurface(v14), 0);
      v68 = 0;
      v69 = v26;
      v70 = v29;
      v72 = v18;
      v73 = v20;
      v71 = v23;
      v32 = -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat"), "width");
      v33 = -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat"), "height");
      v34 = (void *)objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat");
      v35 = objc_msgSend(v34, "width");
      v36 = objc_msgSend(v34, "height");
      requestedRotation = self->_requestedRotation;
      if (requestedRotation != 90)
      {
        if (requestedRotation == 180)
        {
          flipX = self->_flipX;
          pipelineStates = self->_pipelineStates;
          v46 = CFSTR("convertToFloatNoRotationFlipYInference");
          v47 = CFSTR("convertToFloat180RotationInference");
        }
        else
        {
          if (requestedRotation == 270)
          {
            v38 = self->_flipX;
            v39 = self->_pipelineStates;
            v40 = CFSTR("convertToFloat270CCWRotationFlipYInference");
            v41 = CFSTR("convertToFloat90CCWRotationInference");
LABEL_17:
            if (v38)
              v42 = v40;
            else
              v42 = v41;
            v43 = -[NSDictionary objectForKeyedSubscript:](v39, "objectForKeyedSubscript:", v42);
            *(float *)&v68 = (float)v33 / (float)v35;
            v33 = v32;
LABEL_27:
            *((float *)&v68 + 1) = (float)v33 / (float)v36;
            v49 = (void *)objc_msgSend((id)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
            v50 = (void *)objc_msgSend(v49, "computeCommandEncoder");
            if (*MEMORY[0x1E0CA1FC0] == 1)
              kdebug_trace();
            objc_msgSend(v50, "setTexture:atIndex:", v31, 1);
            objc_msgSend(v50, "setTexture:atIndex:", a7, 0);
            objc_msgSend(v50, "setBytes:length:atIndex:", &v68, 28, 0);
            objc_msgSend(v50, "setBytes:length:atIndex:", &v74, 4, 1);
            objc_msgSend(v50, "setComputePipelineState:", v43);
            v67[0] = objc_msgSend(a7, "width");
            v67[1] = objc_msgSend(a7, "height");
            v67[2] = 1;
            v65 = xmmword_1A32B29E0;
            v66 = 1;
            objc_msgSend(v50, "dispatchThreads:threadsPerThreadgroup:", v67, &v65);
            objc_msgSend(v50, "endEncoding");
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            outputRequirements = self->_outputRequirements;
            v52 = -[NSArray countByEnumeratingWithState:objects:count:](outputRequirements, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
            if (v52)
            {
              v53 = v52;
              v54 = *(_QWORD *)v62;
              do
              {
                for (i = 0; i != v53; ++i)
                {
                  if (*(_QWORD *)v62 != v54)
                    objc_enumerationMutation(outputRequirements);
                  objc_msgSend(a4, "setPixelBuffer:forRequirement:", v14, *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i));
                }
                v53 = -[NSArray countByEnumeratingWithState:objects:count:](outputRequirements, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
              }
              while (v53);
            }
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __117__BWInferenceDepthScalingProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
            v59[3] = &unk_1E491EA20;
            v59[4] = self;
            v59[5] = v58;
            v60 = 0;
            objc_msgSend(v49, "addCompletedHandler:", v59);
            objc_msgSend(v49, "commit");
            CFRelease(v14);
            LODWORD(v56) = 0;
            goto LABEL_37;
          }
          flipX = self->_flipX;
          pipelineStates = self->_pipelineStates;
          v46 = CFSTR("convertToFloat180RotationFlipYInference");
          v47 = CFSTR("convertToFloatNoRotationInference");
        }
        if (flipX)
          v48 = v46;
        else
          v48 = v47;
        v43 = -[NSDictionary objectForKeyedSubscript:](pipelineStates, "objectForKeyedSubscript:", v48);
        *(float *)&v68 = (float)v32 / (float)v35;
        goto LABEL_27;
      }
      v38 = self->_flipX;
      v39 = self->_pipelineStates;
      v40 = CFSTR("convertToFloat90CCWRotationFlipYInference");
      v41 = CFSTR("convertToFloat270CCWRotationInference");
      goto LABEL_17;
    }
    v56 = 4294935553;
  }
  else
  {
    v56 = 4294935584;
  }
  if (a7)
  {
    (*((void (**)(id, uint64_t, BWInferenceDepthScalingProvider *))a7 + 2))(a7, v56, self);
    a7 = 0;
  }
  v31 = 0;
LABEL_37:

  return v56;
}

uint64_t __117__BWInferenceDepthScalingProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = result;
  if (*MEMORY[0x1E0CA1FC0] == 1)
    result = kdebug_trace();
  if (*(_QWORD *)(v3 + 40))
  {
    if (objc_msgSend(a2, "error"))
      v4 = 4294935556;
    else
      v4 = *(unsigned int *)(v3 + 48);
    return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v3 + 40) + 16))(*(_QWORD *)(v3 + 40), v4, *(_QWORD *)(v3 + 32));
  }
  return result;
}

- (BWInferenceSubmittable)submittable
{
  if (*((_DWORD *)self + 11) != 1)
    return 0;
  return self;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (id)newStorage
{
  NSArray *outputRequirements;
  unint64_t concurrencyWidth;
  BWInferenceProviderStorage *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  outputRequirements = self->_outputRequirements;
  if (self->_concurrencyWidth >= 2)
  {
    outputRequirements = (NSArray *)(id)-[NSArray mutableCopy](self->_outputRequirements, "mutableCopy");
    concurrencyWidth = self->_concurrencyWidth;
    if (concurrencyWidth >= 2)
    {
      do
      {
        -[NSArray addObjectsFromArray:](outputRequirements, "addObjectsFromArray:", self->_outputRequirements);
        --concurrencyWidth;
      }
      while (concurrencyWidth > 1);
    }
  }
  v5 = [BWInferenceProviderStorage alloc];
  v7[0] = self->_inputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v5, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1), outputRequirements);
}

- (int)type
{
  return 0;
}

- (NSArray)inputVideoRequirements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_inputRequirement;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (NSArray)outputVideoRequirements
{
  return self->_outputRequirements;
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (int)executionTarget
{
  return 1;
}

- (NSSet)preventionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (BOOL)allowsAsyncPropagation
{
  return self->_processingMode == 1;
}

@end
