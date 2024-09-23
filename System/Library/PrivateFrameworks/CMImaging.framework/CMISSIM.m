@implementation CMISSIM

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  objc_super v4;

  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CMISSIM;
  -[CMISSIM dealloc](&v4, sel_dealloc);
}

- (CMISSIM)initWithOptionalCommandQueue:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  CMISSIM *v8;
  CMISSIM *v9;
  uint64_t v10;
  CMISSIMConfig *config;
  const __CFAllocator *v12;
  const __CFDictionary *v13;
  void *v14;
  CMISSIM *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[CMISSIM init](self, "init");
  v9 = v8;
  if (!v8)
    goto LABEL_8;
  -[CMISSIM _validateConfiguration:](v8, "_validateConfiguration:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  config = v9->_config;
  v9->_config = (CMISSIMConfig *)v10;

  if (!v9->_config)
    goto LABEL_8;
  if (-[CMISSIM _setupMetalContextWithCommandQueue:](v9, "_setupMetalContextWithCommandQueue:", v6))
    goto LABEL_8;
  if (-[CMISSIM _loadKernels](v9, "_loadKernels"))
    goto LABEL_8;
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v17 = *MEMORY[0x1E0CA8F48];
  v18[0] = &unk_1E9513960;
  v13 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  -[FigMetalContext device](v9->_metalContext, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = CVMetalTextureCacheCreate(v12, v13, v14, 0, &v9->_textureCache);

  if ((_DWORD)v12)
  {
LABEL_8:
    FigDebugAssert3();
    v15 = 0;
  }
  else
  {
    v9->_lumaOnly = 0;
    *(_OWORD *)v9->_channelWeights = xmmword_1D3304DD0;
    -[CMISSIM _calculateGaussianWeights](v9, "_calculateGaussianWeights");
    v15 = v9;
  }

  return v15;
}

- (id)_validateConfiguration:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "windowRadius") >= 6)
  {
    FigDebugAssert3();
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (int)_setupMetalContextWithCommandQueue:(id)a3
{
  id v4;
  void *v5;
  FigMetalContext *v6;
  FigMetalContext *metalContext;
  FigMetalContext *v8;
  void *v9;
  FigMetalAllocator *v10;
  void *v11;
  FigMetalAllocator *v12;
  unint64_t v13;
  uint64_t v14;
  int v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:]([FigMetalContext alloc], "initWithbundle:andOptionalCommandQueue:", v5, v4), metalContext = self->_metalContext, self->_metalContext = v6, metalContext, (v8 = self->_metalContext) != 0))
  {
    -[FigMetalContext setAllowCommandBufferCommitsOnlyByForceCommit:](v8, "setAllowCommandBufferCommitsOnlyByForceCommit:", 1);
    v9 = (void *)objc_opt_new();
    if (v9
      && (v10 = [FigMetalAllocator alloc],
          -[FigMetalContext device](self->_metalContext, "device"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = -[FigMetalAllocator initWithDevice:allocatorType:](v10, "initWithDevice:allocatorType:", v11, 2),
          v11,
          v12))
    {
      v13 = -[CMISSIMConfig allocatorCapacity](self->_config, "allocatorCapacity");
      if (v13)
        v14 = v13;
      else
        v14 = 52428800;
      objc_msgSend(v9, "setMemSize:", v14);
      objc_msgSend(v9, "setWireMemory:", 1);
      objc_msgSend(v9, "setLabel:", CFSTR("FigMetalAllocator_CMISSIM"));
      objc_msgSend(v9, "setResourceOptions:", objc_msgSend(v9, "resourceOptions") | 0x20);
      v15 = -[FigMetalAllocator setupWithDescriptor:](v12, "setupWithDescriptor:", v9);
      if (v15)
        FigDebugAssert3();
      else
        -[FigMetalContext setAllocator:](self->_metalContext, "setAllocator:", v12);

    }
    else
    {
      FigDebugAssert3();
      v15 = FigSignalErrorAt();
    }

  }
  else
  {
    FigDebugAssert3();
    v15 = -1;
  }

  return v15;
}

- (int)_loadKernels
{
  int v3;
  int v4;
  int v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  id v12;
  float v14;
  float v15;
  float v16;
  int v17;
  int v18;
  int v19;
  unsigned __int16 v20;

  v20 = -[CMISSIMConfig windowRadius](self->_config, "windowRadius");
  -[CMISSIMConfig luminanceCoefficient](self->_config, "luminanceCoefficient");
  v19 = v3;
  -[CMISSIMConfig contractCoefficient](self->_config, "contractCoefficient");
  v18 = v4;
  -[CMISSIMConfig structureCoefficient](self->_config, "structureCoefficient");
  v17 = v5;
  -[CMISSIMConfig k1](self->_config, "k1");
  v7 = v6;
  -[CMISSIMConfig dataRange](self->_config, "dataRange");
  v16 = (float)(v7 * v8) * (float)(v7 * v8);
  -[CMISSIMConfig k2](self->_config, "k2");
  v10 = v9;
  -[CMISSIMConfig dataRange](self->_config, "dataRange");
  v15 = (float)(v10 * v11) * (float)(v10 * v11);
  v14 = v15 * 0.5;
  v12 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
  objc_msgSend(v12, "setConstantValue:type:atIndex:", &v20, 41, 0);
  objc_msgSend(v12, "setConstantValue:type:atIndex:", &v19, 3, 1);
  objc_msgSend(v12, "setConstantValue:type:atIndex:", &v18, 3, 2);
  objc_msgSend(v12, "setConstantValue:type:atIndex:", &v17, 3, 3);
  objc_msgSend(v12, "setConstantValue:type:atIndex:", &v16, 3, 4);
  objc_msgSend(v12, "setConstantValue:type:atIndex:", &v15, 3, 5);
  objc_msgSend(v12, "setConstantValue:type:atIndex:", &v14, 3, 6);
  if (-[CMISSIM _loadKernel:name:functionConstants:](self, "_loadKernel:name:functionConstants:", &self->_kernelCalculateSSIM_singleChannel, CFSTR("CMISSIM::calculateSSIM_singleChannel"), v12)|| -[CMISSIM _loadKernel:name:functionConstants:](self, "_loadKernel:name:functionConstants:", &self->_kernelCalculateSSIM_multiChannel, CFSTR("CMISSIM::calculateSSIM_multiChannel"), v12)|| -[CMISSIM _loadKernel:name:functionConstants:](self, "_loadKernel:name:functionConstants:", &self->_kernelReduceSSIM, CFSTR("CMISSIM::reduceSSIM"), v12))
  {
    FigDebugAssert3();
  }

  return 0;
}

- (int)_loadKernel:(id *)a3 name:(id)a4 functionConstants:(id)a5
{
  FigMetalContext *metalContext;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int v17;

  metalContext = self->_metalContext;
  v9 = a5;
  v10 = a4;
  -[FigMetalContext library](metalContext, "library");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "newFunctionWithName:constantValues:error:", v10, v9, 0);

  if (v12
    && (-[FigMetalContext device](self->_metalContext, "device"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = (void *)objc_msgSend(v13, "newComputePipelineStateWithFunction:error:", v12, 0),
        v13,
        v14))
  {
    v15 = *a3;
    *a3 = v14;
    v16 = v14;

    v17 = 0;
  }
  else
  {
    FigDebugAssert3();
    v17 = -1;
  }

  return v17;
}

- (void)_calculateGaussianWeights
{
  float v3;
  float v4;
  int v5;
  float v6;
  float *gaussianWeights;
  uint64_t v8;
  float v9;
  uint64_t v10;
  float *v11;
  int v12;
  float v13;

  -[CMISSIMConfig sigma](self->_config, "sigma");
  v4 = v3;
  v5 = -[CMISSIMConfig windowRadius](self->_config, "windowRadius");
  v6 = fmaxf(v4, 0.00000011921);
  gaussianWeights = self->_gaussianWeights;
  v8 = (unsigned __int16)(2 * v5) | 1u;
  v9 = 0.0;
  v10 = v8;
  v11 = gaussianWeights;
  do
  {
    if (v5 >= 0)
      v12 = v5;
    else
      v12 = -v5;
    v13 = expf((float)((float)((float)v12 / v6) * (float)((float)v12 / v6)) * -0.5);
    *v11++ = v13;
    v9 = v9 + v13;
    --v5;
    --v10;
  }
  while (v10);
  do
  {
    *gaussianWeights = (float)(1.0 / v9) * *gaussianWeights;
    ++gaussianWeights;
    --v8;
  }
  while (v8);
}

- (int)encodeToCommandBuffer:(id)a3 imageA:(id)a4 imageB:(id)a5 outputSSIMMap:(id)a6 outputSSIMVal:(float *)a7
{
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  _BOOL4 multiChannel;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  id v36;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (unint64_t)a6;
  v39 = 0;
  if (!(v15 | (unint64_t)a7))
  {
    FigDebugAssert3();
    v21 = 0;
LABEL_30:
    v35 = 0;
    goto LABEL_31;
  }
  if (objc_msgSend(v13, "textureType") != 2)
    goto LABEL_29;
  if (objc_msgSend(v14, "textureType") != 2)
    goto LABEL_29;
  v16 = objc_msgSend(v13, "width");
  if (v16 != objc_msgSend(v14, "width"))
    goto LABEL_29;
  v17 = objc_msgSend(v13, "height");
  if (v17 != objc_msgSend(v14, "height"))
    goto LABEL_29;
  objc_msgSend(v13, "pixelFormat");
  MTLPixelFormatGetInfo();
  v43 = 0;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  objc_msgSend(v14, "pixelFormat");
  MTLPixelFormatGetInfo();
  if (!v15)
    goto LABEL_11;
  if (objc_msgSend((id)v15, "textureType") != 2
    || (v18 = objc_msgSend((id)v15, "width"), v18 != objc_msgSend(v13, "width"))
    || (v19 = objc_msgSend((id)v15, "height"), v19 != objc_msgSend(v13, "height")))
  {
LABEL_29:
    FigDebugAssert3();
    v21 = 0;
    v35 = -1;
    goto LABEL_31;
  }
  objc_msgSend((id)v15, "pixelFormat");
  MTLPixelFormatGetInfo();
  v43 = 0;
  v41 = 0u;
  v40 = 0u;
  objc_msgSend(v13, "pixelFormat");
  MTLPixelFormatGetInfo();
LABEL_11:
  v43 = 0;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  objc_msgSend(v13, "pixelFormat");
  MTLPixelFormatGetInfo();
  self->_multiChannel = 0;
  v20 = (id)v15;
  v39 = v20;
  v21 = v20;
  if (v15)
  {
LABEL_18:
    v34 = -[CMISSIM _encodeSSIMCalculation:imageA:imageB:outputSSIMMap:](self, "_encodeSSIMCalculation:imageA:imageB:outputSSIMMap:", v12, v13, v14, v21);
    if (v34)
    {
      v35 = v34;
LABEL_28:
      FigDebugAssert3();
      goto LABEL_31;
    }
    if (a7)
    {
      v35 = -[CMISSIM _encodeSSIMReduction:ssimMap:inPlace:outputSSIMVal:](self, "_encodeSSIMReduction:ssimMap:inPlace:outputSSIMVal:", v12, v21, v21 != v20, a7);
      if (!v35)
        goto LABEL_31;
      goto LABEL_28;
    }
    goto LABEL_30;
  }
  v38 = v12;
  multiChannel = self->_multiChannel;
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "newTextureDescriptor");

  if (v24)
  {
    if (multiChannel)
      v25 = 115;
    else
      v25 = 55;
    objc_msgSend(v24, "setLabel:", 0);
    objc_msgSend(v24, "desc");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextureType:", 2);

    v27 = objc_msgSend(v13, "width");
    objc_msgSend(v24, "desc");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWidth:", v27);

    v29 = objc_msgSend(v13, "height");
    objc_msgSend(v24, "desc");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setHeight:", v29);

    objc_msgSend(v24, "desc");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setPixelFormat:", v25);

    objc_msgSend(v24, "desc");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setUsage:", 7);

    -[FigMetalContext allocator](self->_metalContext, "allocator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v33, "newTextureWithDescriptor:", v24);
    v39 = v21;

    if (v21)
    {

      v12 = v38;
      goto LABEL_18;
    }
    FigDebugAssert3();
    v35 = -1;
  }
  else
  {
    FigDebugAssert3();
    v35 = FigSignalErrorAt();
  }

  v21 = 0;
  v12 = v38;
LABEL_31:
  v36 = (id)v15;
  if (v21 != (id)v15)
  {
    FigMetalDecRef(&v39);
    v36 = v39;
  }

  return v35;
}

- (int)calculateWithImageA:(__CVBuffer *)a3 imageB:(__CVBuffer *)a4 outputSSIMMap:(__CVBuffer *)a5 outputSSIMVal:(float *)a6
{
  __CVBuffer *v7;
  _BOOL8 lumaOnly;
  int v11;
  id v12;
  _BOOL8 v13;
  id v14;
  uint64_t v15;
  void *v16;
  int v17;
  FigMetalContext *metalContext;
  id v20;
  id v21;
  id v22;

  if ((unint64_t)a5 | (unint64_t)a6)
  {
    v7 = a5;
    lumaOnly = self->_lumaOnly;
    v22 = 0;
    v11 = -[CMISSIM _bindPixelBufferToTexture:usage:overrideFormat:planeIndex:lumaOnly:textuePtr:](self, "_bindPixelBufferToTexture:usage:overrideFormat:planeIndex:lumaOnly:textuePtr:", a3, 1, 0, 0, lumaOnly, &v22);
    v12 = v22;
    if (v11)
    {
      FigDebugAssert3();
    }
    else
    {
      v13 = self->_lumaOnly;
      v21 = 0;
      v11 = -[CMISSIM _bindPixelBufferToTexture:usage:overrideFormat:planeIndex:lumaOnly:textuePtr:](self, "_bindPixelBufferToTexture:usage:overrideFormat:planeIndex:lumaOnly:textuePtr:", a4, 1, 0, 0, v13, &v21);
      v14 = v21;
      if (v11)
      {
        FigDebugAssert3();
      }
      else
      {
        if (v7
          && (v20 = 0,
              v11 = -[CMISSIM _bindPixelBufferToTexture:usage:overrideFormat:planeIndex:lumaOnly:textuePtr:](self, "_bindPixelBufferToTexture:usage:overrideFormat:planeIndex:lumaOnly:textuePtr:", v7, 7, 0, 0, 0, &v20), v7 = (__CVBuffer *)v20, v11))
        {
          FigDebugAssert3();
        }
        else
        {
          -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            v17 = -[CMISSIM encodeToCommandBuffer:imageA:imageB:outputSSIMMap:outputSSIMVal:](self, "encodeToCommandBuffer:imageA:imageB:outputSSIMMap:outputSSIMVal:", v15, v12, v14, v7, a6);
            if (!v17)
            {
              metalContext = self->_metalContext;
              if (a6)
              {
                -[FigMetalContext forceCommit](metalContext, "forceCommit");
                -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
              }
              else
              {
                -[FigMetalContext commit](metalContext, "commit");
              }

              return 0;
            }
            v11 = v17;
            FigDebugAssert3();

          }
          else
          {
            FigDebugAssert3();
            v11 = FigSignalErrorAt();
          }
        }

      }
    }

    return v11;
  }
  FigDebugAssert3();
  return 0;
}

- (int)_encodeSSIMCalculation:(id)a3 imageA:(id)a4 imageB:(id)a5 outputSSIMMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int v25;
  _QWORD v26[3];
  _QWORD v27[3];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = 24;
    if (!self->_multiChannel)
      v14 = 16;
    v15 = *(id *)((char *)&self->super.isa + v14);
    objc_msgSend(v13, "setComputePipelineState:", v15);
    objc_msgSend(v13, "setTexture:atIndex:", v10, 0);
    objc_msgSend(v13, "setTexture:atIndex:", v11, 1);
    objc_msgSend(v13, "setTexture:atIndex:", v12, 2);
    objc_msgSend(v13, "setBytes:length:atIndex:", self->_gaussianWeights, 44, 0);
    if ((unint64_t)objc_msgSend(v15, "maxTotalThreadsPerThreadgroup") > 0x3FF)
    {
      v17 = 32;
      v16 = 32;
    }
    else
    {
      v16 = 32;
      v17 = 32;
      do
      {
        v18 = v17 < 2 * v16;
        v17 >>= v17 >= 2 * v16;
        v16 >>= v18;
      }
      while (v16 * v17 > objc_msgSend(v15, "maxTotalThreadsPerThreadgroup"));
    }
    v19 = 2 * -[CMISSIMConfig windowRadius](self->_config, "windowRadius");
    if (v17 > v19 && v16 > v19)
    {
      v21 = v16 - v19;
      v22 = (v17 - v19 + objc_msgSend(v12, "width") - 1) / (v17 - v19);
      v23 = (v21 + objc_msgSend(v12, "height") - 1) / v21;
      objc_msgSend(v13, "setImageblockWidth:height:", v17, v16);
      v27[0] = v22;
      v27[1] = v23;
      v27[2] = 1;
      v26[0] = v17;
      v26[1] = v16;
      v26[2] = 1;
      objc_msgSend(v13, "dispatchThreadgroups:threadsPerThreadgroup:", v27, v26);
      objc_msgSend(v13, "endEncoding");

      v25 = 0;
    }
    else
    {
      FigDebugAssert3();

      v25 = -1;
    }
  }
  else
  {
    FigDebugAssert3();
    v25 = FigSignalErrorAt();
  }

  return v25;
}

- (int)_encodeSSIMReduction:(id)a3 ssimMap:(id)a4 inPlace:(BOOL)a5 outputSSIMVal:(float *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  double v39;
  unsigned int v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  int v45;
  id v47;
  _QWORD v48[3];
  _QWORD v49[3];
  __int128 v50;
  id v51;

  v10 = a3;
  v11 = a4;
  v51 = 0;
  -[FigMetalContext device](self->_metalContext, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newBufferWithBytesNoCopy:length:options:deallocator:", a6, 4, 0, 0);

  if (!v13)
  {
    FigDebugAssert3();
    v45 = -1;
    goto LABEL_38;
  }
  v14 = 32;
  do
  {
    v15 = v14;
    v16 = v14 * v14;
    v17 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_kernelReduceSSIM, "maxTotalThreadsPerThreadgroup");
    v14 = v15 >> 1;
  }
  while (v16 > v17);
  v47 = v10;
  if (a5)
  {
    v18 = 0;
    goto LABEL_15;
  }
  v19 = objc_msgSend(v11, "width");
  v20 = objc_msgSend(v11, "height");
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "newTextureDescriptor");

  if (!v22)
  {
    FigDebugAssert3();
    v45 = FigSignalErrorAt();
LABEL_43:
    v10 = v47;

    goto LABEL_38;
  }
  if (v20 / v15 <= 1)
    v23 = 1;
  else
    v23 = v20 / v15;
  if (v19 / v15 <= 1)
    v24 = 1;
  else
    v24 = v19 / v15;
  objc_msgSend(v22, "setLabel:", 0);
  objc_msgSend(v22, "desc");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextureType:", 2);

  objc_msgSend(v22, "desc");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWidth:", v24);

  objc_msgSend(v22, "desc");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHeight:", v23);

  v28 = objc_msgSend(v11, "pixelFormat");
  objc_msgSend(v22, "desc");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPixelFormat:", v28);

  objc_msgSend(v22, "desc");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUsage:", 7);

  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v31, "newTextureWithDescriptor:", v22);
  v51 = v18;

  if (!v18)
  {
    FigDebugAssert3();
    v45 = -1;
    goto LABEL_43;
  }

  v10 = v47;
LABEL_15:
  objc_msgSend(v10, "computeCommandEncoder");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = v32;
    objc_msgSend(v32, "setComputePipelineState:", self->_kernelReduceSSIM);
    objc_msgSend(v33, "setBuffer:offset:atIndex:", v13, 0, 0);
    if (self->_multiChannel)
      v34 = *(_OWORD *)self->_channelWeights;
    else
      v34 = xmmword_1D3304DE0;
    v50 = v34;
    objc_msgSend(v33, "setBytes:length:atIndex:", &v50, 16, 1);
    objc_msgSend(v33, "setImageblockWidth:height:", v15, v15);
    v35 = (objc_msgSend(v11, "width") + v15 - 1) & -(uint64_t)v15;
    v36 = objc_msgSend(v11, "height") + v15 - 1;
    v37 = v36 & -(uint64_t)v15;
    if (v35 <= v37)
      v38 = v36 & -(uint64_t)v15;
    else
      v38 = v35;
    v39 = log((double)v38);
    v40 = fmax(ceil(v39 / log((double)v15)), 1.0);
    if (v40)
    {
      v41 = 0;
      v42 = v18;
      do
      {
        if (v42)
        {
          if (!v41)
          {
            objc_msgSend(v33, "setTexture:atIndex:", v11, 0);
            v44 = v18;
            v42 = v18;
            goto LABEL_30;
          }
          v43 = v42;
        }
        else
        {
          v43 = v11;
        }
        objc_msgSend(v33, "setTexture:atIndex:", v43, 0);
        v44 = 0;
LABEL_30:
        objc_msgSend(v33, "setTexture:atIndex:", v44, 1);
        if (v35 / v15 <= 1)
          v35 = 1;
        else
          v35 /= v15;
        if (v37 / v15 <= 1)
          v37 = 1;
        else
          v37 /= v15;
        v49[0] = v35;
        v49[1] = v37;
        v49[2] = 1;
        v48[0] = v15;
        v48[1] = v15;
        v48[2] = 1;
        objc_msgSend(v33, "dispatchThreadgroups:threadsPerThreadgroup:", v49, v48);
        ++v41;
      }
      while (v40 != v41);
    }
    objc_msgSend(v33, "endEncoding");

    v45 = 0;
    v10 = v47;
  }
  else
  {
    FigDebugAssert3();
    v45 = FigSignalErrorAt();
  }
LABEL_38:
  FigMetalDecRef(&v51);

  return v45;
}

- (int)_bindPixelBufferToTexture:(__CVBuffer *)a3 usage:(unint64_t)a4 overrideFormat:(unint64_t)a5 planeIndex:(int)a6 lumaOnly:(BOOL)a7 textuePtr:(id *)a8
{
  MTLPixelFormat v10;
  _BOOL4 v14;
  signed int PixelFormatType;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  unsigned __int16 v23;
  unsigned __int16 v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const __CFAllocator *v29;
  __CVMetalTextureCache *textureCache;
  void *v31;
  const __CFDictionary *v32;
  size_t Width;
  size_t Height;
  CVReturn v35;
  id v36;
  int v37;
  CVMetalTextureRef image;
  uint64_t v40;
  _QWORD v41[2];

  v10 = a5;
  v41[1] = *MEMORY[0x1E0C80C00];
  image = 0;
  if (!a5)
  {
    v14 = a7;
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType <= 875836517)
    {
      if (PixelFormatType > 759318336)
      {
        if (PixelFormatType <= 793929792)
        {
          if (PixelFormatType > 762869295)
          {
            if (PixelFormatType > 792225327)
            {
              if (PixelFormatType != 792225328 && PixelFormatType != 792229424)
              {
                v16 = 792872769;
                goto LABEL_128;
              }
              goto LABEL_90;
            }
            if (PixelFormatType != 762869296)
            {
              v24 = 30258;
LABEL_104:
              v19 = v24 | 0x2D780000;
LABEL_105:
              if (PixelFormatType != v19)
                goto LABEL_147;
              goto LABEL_106;
            }
            goto LABEL_122;
          }
          if (PixelFormatType > 762865199)
          {
            if (PixelFormatType != 762865200)
            {
              v24 = 26162;
              goto LABEL_104;
            }
LABEL_122:
            v25 = !v14;
            v26 = 508;
            goto LABEL_123;
          }
          if (PixelFormatType == 759318337)
          {
LABEL_129:
            v10 = MTLPixelFormatBGRA8Unorm;
            goto LABEL_135;
          }
          if (PixelFormatType != 760375361)
            goto LABEL_147;
LABEL_93:
          v10 = MTLPixelFormatRGBA16Float;
          goto LABEL_135;
        }
        if (PixelFormatType > 796423729)
        {
          if (PixelFormatType > 875704437)
          {
            if (PixelFormatType != 875704438)
            {
              if (PixelFormatType != 875704934)
              {
                v20 = 875704950;
                goto LABEL_70;
              }
LABEL_98:
              v25 = !v14;
              v26 = 502;
              goto LABEL_131;
            }
LABEL_90:
            v25 = !v14;
            v26 = 500;
LABEL_131:
            v27 = 10;
LABEL_132:
            if (v25)
              v10 = v26;
            else
              v10 = v27;
            goto LABEL_135;
          }
          if (PixelFormatType != 796423730)
          {
            v18 = 875704422;
            goto LABEL_89;
          }
LABEL_106:
          v25 = !v14;
          v26 = 509;
LABEL_123:
          v27 = 588;
          goto LABEL_132;
        }
        if (PixelFormatType > 796419633)
        {
          if (PixelFormatType == 796419634)
            goto LABEL_106;
          v23 = 30256;
        }
        else
        {
          if (PixelFormatType == 793929793)
            goto LABEL_93;
          v23 = 26160;
        }
        v22 = v23 | 0x2F780000;
        goto LABEL_121;
      }
      if (PixelFormatType > 642934848)
      {
        if (PixelFormatType > 645428783)
        {
          if (PixelFormatType <= 645428787)
          {
            if (PixelFormatType != 645428784)
            {
              v19 = 645428786;
              goto LABEL_105;
            }
            goto LABEL_122;
          }
          if (PixelFormatType != 645428788)
          {
            if (PixelFormatType == 758670896)
              goto LABEL_90;
            v18 = 758674992;
LABEL_89:
            if (PixelFormatType != v18)
              goto LABEL_147;
            goto LABEL_90;
          }
LABEL_117:
          v25 = !v14;
          v26 = 510;
          goto LABEL_123;
        }
        if (PixelFormatType <= 645424689)
        {
          if (PixelFormatType == 642934849)
            goto LABEL_93;
          v22 = 645424688;
          goto LABEL_121;
        }
        if (PixelFormatType == 645424690)
          goto LABEL_106;
        v28 = 645424692;
        goto LABEL_116;
      }
      if (PixelFormatType <= 641234479)
      {
        if (PixelFormatType <= 641230385)
        {
          if (PixelFormatType == 32)
          {
            v10 = MTLPixelFormatBGRA8Unorm|0x4;
            goto LABEL_135;
          }
          v18 = 641230384;
          goto LABEL_89;
        }
        if (PixelFormatType == 641230386)
          goto LABEL_98;
        v21 = 641230388;
LABEL_96:
        if (PixelFormatType != v21)
          goto LABEL_147;
        goto LABEL_130;
      }
      if (PixelFormatType <= 641234483)
      {
        if (PixelFormatType != 641234480)
        {
          v20 = 641234482;
LABEL_70:
          if (PixelFormatType != v20)
            goto LABEL_147;
          goto LABEL_98;
        }
        goto LABEL_90;
      }
      if (PixelFormatType == 641234484)
      {
LABEL_130:
        v25 = !v14;
        v26 = 503;
        goto LABEL_131;
      }
      v16 = 641877825;
LABEL_128:
      if (PixelFormatType != v16)
        goto LABEL_147;
      goto LABEL_129;
    }
    if (PixelFormatType > 1886860339)
    {
      if (PixelFormatType > 2021078067)
      {
        if (PixelFormatType > 2085775424)
        {
          if (PixelFormatType > 2088265265)
          {
            if (PixelFormatType != 2088265266)
            {
              if (PixelFormatType != 2088269360)
              {
                v19 = 2088269362;
                goto LABEL_105;
              }
              goto LABEL_122;
            }
            goto LABEL_106;
          }
          if (PixelFormatType == 2085775425)
            goto LABEL_93;
          v22 = 2088265264;
LABEL_121:
          if (PixelFormatType != v22)
            goto LABEL_147;
          goto LABEL_122;
        }
        if (PixelFormatType > 2084075055)
        {
          if (PixelFormatType == 2084075056)
            goto LABEL_90;
          v16 = 2084718401;
          goto LABEL_128;
        }
        if (PixelFormatType != 2021078068)
        {
          v18 = 2084070960;
          goto LABEL_89;
        }
      }
      else if (PixelFormatType <= 2019963439)
      {
        if (PixelFormatType <= 2016686641)
        {
          if (PixelFormatType == 1886860340)
            goto LABEL_117;
          if (PixelFormatType != 2016686640)
            goto LABEL_147;
LABEL_82:
          v25 = !v14;
          v26 = 505;
LABEL_111:
          v27 = 576;
          goto LABEL_132;
        }
        if (PixelFormatType == 2016686642)
        {
LABEL_110:
          v25 = !v14;
          v26 = 506;
          goto LABEL_111;
        }
        if (PixelFormatType != 2016687156)
          goto LABEL_147;
      }
      else
      {
        if (PixelFormatType <= 2019963955)
        {
          if (PixelFormatType != 2019963440)
          {
            v17 = 2019963442;
LABEL_80:
            if (PixelFormatType != v17)
              goto LABEL_147;
            goto LABEL_110;
          }
          goto LABEL_82;
        }
        if (PixelFormatType != 2019963956)
        {
          if (PixelFormatType != 2021077552)
          {
            v17 = 2021077554;
            goto LABEL_80;
          }
          goto LABEL_82;
        }
      }
      v25 = !v14;
      v26 = 507;
      goto LABEL_111;
    }
    if (PixelFormatType > 1380411456)
    {
      if (PixelFormatType > 1885745711)
      {
        if (PixelFormatType <= 1885746227)
        {
          if (PixelFormatType != 1885745712)
          {
            v19 = 1885745714;
            goto LABEL_105;
          }
          goto LABEL_122;
        }
        if (PixelFormatType != 1885746228)
        {
          if (PixelFormatType != 1886859824)
          {
            v19 = 1886859826;
            goto LABEL_105;
          }
          goto LABEL_122;
        }
        goto LABEL_117;
      }
      if (PixelFormatType <= 1882468913)
      {
        if (PixelFormatType == 1380411457)
          goto LABEL_93;
        v22 = 1882468912;
        goto LABEL_121;
      }
      if (PixelFormatType == 1882468914)
        goto LABEL_106;
      v28 = 1882469428;
LABEL_116:
      if (PixelFormatType != v28)
        goto LABEL_147;
      goto LABEL_117;
    }
    if (PixelFormatType <= 1278226533)
    {
      if (PixelFormatType > 1111970368)
      {
        if (PixelFormatType != 1111970369)
        {
          if (PixelFormatType != 1278226488)
            goto LABEL_147;
          v10 = MTLPixelFormatR8Unorm;
          goto LABEL_135;
        }
        goto LABEL_129;
      }
      if (PixelFormatType == 875836518)
        goto LABEL_130;
      v21 = 875836534;
      goto LABEL_96;
    }
    if (PixelFormatType > 1380401728)
    {
      if (PixelFormatType == 1380401729)
      {
        v10 = MTLPixelFormatRGBA8Unorm;
      }
      else
      {
        if (PixelFormatType != 1380410945)
          goto LABEL_147;
        v10 = MTLPixelFormatRGBA32Float;
      }
    }
    else if (PixelFormatType == 1278226534)
    {
      v10 = MTLPixelFormatR32Float;
    }
    else
    {
      if (PixelFormatType != 1278226536)
        goto LABEL_147;
      v10 = MTLPixelFormatR16Float;
    }
  }
LABEL_135:
  v29 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  textureCache = self->_textureCache;
  v40 = *MEMORY[0x1E0CA8F58];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v31;
  v32 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v35 = CVMetalTextureCacheCreateTextureFromImage(v29, textureCache, a3, v32, v10, Width, Height, a6, &image);

  if (!v35)
  {
    CVMetalTextureGetTexture(image);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    *a8 = v36;
    if (v36)
    {
      v37 = 0;
      goto LABEL_138;
    }
  }
LABEL_147:
  FigDebugAssert3();
  v37 = -1;
LABEL_138:
  if (image)
    CFRelease(image);
  return v37;
}

- (CMISSIMConfig)config
{
  return self->_config;
}

- (BOOL)lumaOnly
{
  return self->_lumaOnly;
}

- (void)setLumaOnly:(BOOL)a3
{
  self->_lumaOnly = a3;
}

- (__n128)channelWeights
{
  return a1[7];
}

- (void)setChannelWeights:(CMISSIM *)self
{
  __int128 v2;

  *(_OWORD *)self->_channelWeights = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_kernelReduceSSIM, 0);
  objc_storeStrong((id *)&self->_kernelCalculateSSIM_multiChannel, 0);
  objc_storeStrong((id *)&self->_kernelCalculateSSIM_singleChannel, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
