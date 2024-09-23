@implementation CMISharpnessScore

- (CMISharpnessScore)initWithOptionalCommandQueue:(id)a3 kernelWeights:(id)a4
{
  id v6;
  id v7;
  CMISharpnessScore *v8;
  FigMetalContext *v9;
  void *v10;
  uint64_t v11;
  FigMetalContext *metal;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t i;
  void *v18;
  float v19;
  uint64_t v20;
  MTLComputePipelineState *v21;
  uint64_t v22;
  MTLComputePipelineState *computeClipValueWithHistogramShader;
  CMIStatistics *v24;
  CMIStatistics *statistics;
  SSCHistogram *v26;
  SSCHistogram *histogram;
  CMISharpnessScore *v28;
  CMISharpnessScore *v29;
  int v31;
  objc_super v32;
  char v33;

  v6 = a3;
  v7 = a4;
  v33 = 0;
  v32.receiver = self;
  v32.super_class = (Class)CMISharpnessScore;
  v8 = -[CMISharpnessScore init](&v32, sel_init);
  if (!v8)
    goto LABEL_18;
  v9 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v9, "initWithbundle:andOptionalCommandQueue:", v10, v6);
  metal = v8->_metal;
  v8->_metal = (FigMetalContext *)v11;

  if (!v8->_metal)
  {
LABEL_18:
    fig_log_get_emitter();
    FigDebugAssert3();
    v13 = 0;
LABEL_21:
    v28 = 0;
    goto LABEL_17;
  }
  v13 = (void *)objc_opt_new();
  if (v13)
  {
    -[FigMetalContext device](v8->_metal, "device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportsFamily:", 1008);

    if (v15)
    {
      -[FigMetalContext device](v8->_metal, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v16, "supportsFamily:", 1008);

    }
    objc_msgSend(v13, "setConstantValue:type:withName:", &v33, 53, CFSTR("SIMDTextureReaderFunctionConstants::simdShuffleFillSupported"));
    if (v7 && (unint64_t)objc_msgSend(v7, "count") >= 0x19)
    {
      for (i = 0; i != 25; ++i)
      {
        objc_msgSend(v7, "objectAtIndex:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        v8->_kernelWeight[i] = v19;

      }
    }
    else
    {
      -[CMISharpnessScore _getDefaultConvolutionWeights:](v8, "_getDefaultConvolutionWeights:", v8->_kernelWeight);
    }
    v31 = 0;
    objc_msgSend(v13, "setConstantValue:type:atIndex:", &v31, 29, 0);
    -[FigMetalContext computePipelineStateFor:constants:](v8->_metal, "computePipelineStateFor:constants:", CFSTR("CMISharpnessScore::applyConvolutionFloat"), v13);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v8->_applyConvolutionShaderFloat[0];
    v8->_applyConvolutionShaderFloat[0] = (MTLComputePipelineState *)v20;

    if (!v8->_applyConvolutionShaderFloat[0])
      goto LABEL_24;
    -[FigMetalContext computePipelineStateFor:constants:](v8->_metal, "computePipelineStateFor:constants:", CFSTR("CMISharpnessScore::computeClipValueWithHistogram"), 0);
    v22 = objc_claimAutoreleasedReturnValue();
    computeClipValueWithHistogramShader = v8->_computeClipValueWithHistogramShader;
    v8->_computeClipValueWithHistogramShader = (MTLComputePipelineState *)v22;

    if (!v8->_computeClipValueWithHistogramShader)
      goto LABEL_24;
    v24 = -[CMIStatistics initWithOptionalCommandQueue:]([CMIStatistics alloc], "initWithOptionalCommandQueue:", v6);
    statistics = v8->_statistics;
    v8->_statistics = v24;

    if (!v8->_statistics
      || (v26 = -[SSCHistogram initWithOptionalCommandQueue:]([SSCHistogram alloc], "initWithOptionalCommandQueue:", v6), histogram = v8->_histogram, v8->_histogram = v26, histogram, !v8->_histogram))
    {
LABEL_24:
      fig_log_get_emitter();
      FigDebugAssert3();
      if (FigSignalErrorAt())
        goto LABEL_21;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  v28 = v8;
LABEL_17:
  v29 = v28;

  return v29;
}

- (void)_getDefaultConvolutionWeights:(float *)a3
{
  a3[24] = -0.28319;
  *((_OWORD *)a3 + 2) = xmmword_1D33056A0;
  *((_OWORD *)a3 + 3) = unk_1D33056B0;
  *((_OWORD *)a3 + 4) = xmmword_1D33056C0;
  *((_OWORD *)a3 + 5) = unk_1D33056D0;
  *(_OWORD *)a3 = _getDefaultConvolutionWeights__defaultConvolutionWeights;
  *((_OWORD *)a3 + 1) = unk_1D3305690;
}

- (CMISharpnessScore)initWithOptionalCommandQueue:(id)a3 externalMemoryResource:(id)a4 kernelWeights:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  FigMetalAllocator *v14;
  void *v15;
  CMISharpnessScore *v16;
  void *v17;
  int v18;
  CMISharpnessScore *v19;
  CMISharpnessScore *v20;
  CMISharpnessScore *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v12 = v11;
  if (!v11)
    goto LABEL_7;
  objc_msgSend(v11, "setWireMemory:", 1);
  objc_msgSend(v12, "setLabel:", CFSTR("FigMetalAllocator_CMISharpnessScore"));
  objc_msgSend(v9, "allocatorBackend");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMemSize:", objc_msgSend(v13, "memSize"));

  v14 = [FigMetalAllocator alloc];
  -[FigMetalContext device](self->_metal, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FigMetalAllocator initWithDevice:allocatorType:](v14, "initWithDevice:allocatorType:", v15, 2);

  if (!v16)
  {
LABEL_7:
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_9:
    v21 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v9, "allocatorBackend");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CMISharpnessScore setupWithDescriptor:allocatorBackend:](v16, "setupWithDescriptor:allocatorBackend:", v12, v17);

  if (v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_9;
  }
  v19 = -[CMISharpnessScore initWithOptionalCommandQueue:kernelWeights:](self, "initWithOptionalCommandQueue:kernelWeights:", v8, v10);
  if (v19)
  {
    v20 = v19;
    -[CMISharpnessScore setAllocator:](v19, "setAllocator:", v16);
    self = v20;

    v21 = self;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v21 = 0;
    self = v16;
  }
LABEL_6:

  return v21;
}

- (void)setAllocator:(id)a3
{
  -[FigMetalContext setAllocator:](self->_metal, "setAllocator:", a3);
}

- (FigMetalAllocator)allocator
{
  return -[FigMetalContext allocator](self->_metal, "allocator");
}

+ (unint64_t)bytesRequiredForProcessingImageWith:(int)a3 height:(int)a4
{
  return ((unint64_t)(4 * a3 * (uint64_t)a4 + 1023) >> 10)
       + 4 * a3 * (uint64_t)a4
       + ((((unint64_t)(4 * a3 * (uint64_t)a4 + 1023) >> 10) + 1023) >> 10);
}

+ (id)externalMemoryDescriptorForConfiguration:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v4)
  {
    objc_msgSend(v4, "setMemSize:", +[CMISharpnessScore bytesRequiredForProcessingImageWith:height:](CMISharpnessScore, "bytesRequiredForProcessingImageWith:height:", objc_msgSend(v3, "maxInputDimensions"), (unint64_t)objc_msgSend(v3, "maxInputDimensions") >> 32));
    objc_msgSend(v4, "setAllocatorType:", 2);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v4;
}

- (int)calculateFromTexture:(id)a3 andFromRoi:(id)a4 sourceComponent:(int)a5 toResult:(id *)a6
{
  return -[CMISharpnessScore _calculateFromTexture:andFromRoi:sourceComponent:binning:firstPixel:toResult:](self, "_calculateFromTexture:andFromRoi:sourceComponent:binning:firstPixel:toResult:", a3, a4, *(_QWORD *)&a5, 1, 0, a6);
}

- (int)calculateFromRawTexture:(id)a3 andFromRoi:(id)a4 sourceComponent:(int)a5 isQuadra:(BOOL)a6 firstPixel:(int)a7 toResult:(id *)a8
{
  uint64_t v8;

  if (a6)
    v8 = 4;
  else
    v8 = 2;
  return -[CMISharpnessScore _calculateFromTexture:andFromRoi:sourceComponent:binning:firstPixel:toResult:](self, "_calculateFromTexture:andFromRoi:sourceComponent:binning:firstPixel:toResult:", a3, a4, *(_QWORD *)&a5, v8, *(_QWORD *)&a7, a8);
}

- (int)calculateFromPixelBuffer:(__CVBuffer *)a3 andFromRoi:(id)a4 sourceComponent:(int)a5 toResult:(id *)a6
{
  uint64_t v7;
  id v10;
  OSType PixelFormatType;
  void *v12;
  void *v13;
  _BOOL8 v14;
  int v15;
  int v16;
  id v18;

  v7 = *(_QWORD *)&a5;
  v10 = a4;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", a3, determineMTLPixelFormatsForCVPixelFormat(PixelFormatType), 3, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12;
  if (v12)
  {
    v13 = v12;
    v14 = isQuadra(a3);
    v15 = -[CMISharpnessScore calculateFromRawTexture:andFromRoi:sourceComponent:isQuadra:firstPixel:toResult:](self, "calculateFromRawTexture:andFromRoi:sourceComponent:isQuadra:firstPixel:toResult:", v13, v10, v7, v14, determineFirstPixel(a3), a6);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = FigSignalErrorAt();
  }
  v16 = v15;
  FigMetalDecRef(&v18);

  return v16;
}

- (int)_calculateFromTexture:(id)a3 andFromRoi:(id)a4 sourceComponent:(int)a5 binning:(int)a6 firstPixel:(int)a7 toResult:(id *)a8
{
  uint64_t v9;
  uint64_t v10;
  id v14;
  __n64 v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  CMIStatistics *statistics;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unsigned int v37;
  void *v43;
  const __CFDictionary *v44;
  double width;
  uint64_t v46;
  double height;
  uint64_t v48;
  SSCHistogram *histogram;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  CMIStatistics *v54;
  id v55;
  BOOL v56;
  void *v57;
  CMIDeferredObject *v58;
  void *v59;
  int v60;
  id *v62;
  id v63;
  unsigned int v64;
  id v65;
  unsigned int v66;
  void *v67;
  void *v68;
  uint64_t v69;
  CGPoint v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  CGRect rect;
  id v79;
  int v80;
  unsigned __int16 v81;
  unsigned __int16 v82;
  float v83;
  id v84;
  id v85;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v71 = a3;
  v14 = a4;
  v84 = 0;
  v85 = 0;
  v68 = (void *)objc_opt_new();
  v69 = v10;
  v80 = v10;
  if ((int)v10 < 2)
  {
    v15.n64_u16[0] = 0;
    v15.n64_u16[2] = 0;
  }
  else
  {
    v15.n64_u64[0] = offsetForPixelComponentWithFirstPixel(a5, v9).n64_u64[0];
  }
  v82 = v15.n64_u16[2];
  v81 = v15.n64_u16[0];
  v16 = 0.5;
  if ((_DWORD)v10 == 4)
    v16 = 1.0;
  v83 = v16;
  if (a5 >= 4)
    goto LABEL_35;
  -[FigMetalContext allocator](self->_metal, "allocator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_35;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d_inputTexture"), 0);

  -[FigMetalContext allocator](self->_metal, "allocator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "newTextureDescriptor");

  if (!v19)
    goto LABEL_34;
  v66 = a5;
  objc_msgSend(v19, "desc");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextureType:", 2);

  v21 = objc_msgSend(v71, "width") / (unint64_t)(int)v10;
  objc_msgSend(v19, "desc");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWidth:", v21);

  v23 = objc_msgSend(v71, "height") / (unint64_t)(int)v10;
  objc_msgSend(v19, "desc");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setHeight:", v23);

  objc_msgSend(v19, "desc");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUsage:", 3);

  objc_msgSend(v19, "desc");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setPixelFormat:", 55);

  objc_msgSend(v19, "setLabel:", 0);
  -[FigMetalContext allocator](self->_metal, "allocator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "newTextureWithDescriptor:", v19);
  v84 = v28;

  if (!v28
    || (objc_msgSend(v19, "setLabel:", 0),
        -[FigMetalContext allocator](self->_metal, "allocator"),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        v85 = (id)objc_msgSend(v29, "newTextureWithDescriptor:", v19),
        v29,
        (v65 = v85) == 0))
  {
LABEL_34:
    fig_log_get_emitter();
    FigDebugAssert3();
    v60 = FigSignalErrorAt();

LABEL_36:
    v59 = 0;
    v53 = 0;
    v51 = 0;
    goto LABEL_26;
  }

  if (-[CMISharpnessScore _computeSharpnessScore:outputTexture:sourceComponent:binning:firstPixel:roi:clipValueMetalBuffer:](self, "_computeSharpnessScore:outputTexture:sourceComponent:binning:firstPixel:roi:clipValueMetalBuffer:", v71, v28, v66, v10, v9, 0, 0.0, 0.0, (double)(objc_msgSend(v71, "width") / (unint64_t)(int)v10), (double)(objc_msgSend(v71, "height") / (unint64_t)(int)v10)))
  {
LABEL_35:
    fig_log_get_emitter();
    FigDebugAssert3();
    v60 = FigSignalErrorAt();
    goto LABEL_36;
  }
  v62 = a8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d_imageScore"), 1);

  v30 = (double)(unint64_t)(objc_msgSend(v28, "width") - 4);
  v31 = (double)(unint64_t)(objc_msgSend(v28, "height") - 4);
  statistics = self->_statistics;
  v79 = 0;
  -[CMIStatistics getStatisticsFromTexture:withRoi:toResult:withOptionalChannelConfig:](statistics, "getStatisticsFromTexture:withRoi:toResult:withOptionalChannelConfig:", v28, &v79, 0, 2.0, 2.0, v30, v31);
  v67 = v14;
  v63 = v79;
  if (v14 && objc_msgSend(v14, "count"))
  {
    v64 = v9;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 2;
    v37 = 1;
    __asm { FMOV            V0.2D, #2.0 }
    v70 = _Q0;
    v43 = v67;
    while (1)
    {
      objc_msgSend(v43, "objectAtIndexedSubscript:", v33);
      v44 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      memset(&rect, 0, sizeof(rect));
      if (!CGRectMakeWithDictionaryRepresentation(v44, &rect))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_31;
      }
      rect.origin = (CGPoint)vmaxnmq_f64((float64x2_t)rect.origin, (float64x2_t)v70);
      width = rect.size.width;
      v46 = objc_msgSend(v28, "width");
      height = rect.size.height;
      rect.size.width = fmin(width, (double)(unint64_t)(v46 - 2) - rect.origin.x);
      v48 = objc_msgSend(v28, "height");
      rect.size.width = (double)(int)((int)rect.size.width & 0xFFFFFFFE);
      rect.size.height = (double)(int)((int)fmin(height, (double)(unint64_t)(v48 - 2) - rect.origin.y) & 0xFFFFFFFE);
      histogram = self->_histogram;
      v77 = 0;
      -[SSCHistogram singleComponentGPUHistogramInputTexture:validRect:outputHistogram:optionalChannelConfig:](histogram, "singleComponentGPUHistogramInputTexture:validRect:outputHistogram:optionalChannelConfig:", v71, &v77, &v80, rect.origin.x);
      v50 = v77;
      objc_msgSend(v50, "getHistogramMetalBuffer");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      -[FigMetalContext device](self->_metal, "device");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend(v52, "newBufferWithLength:options:", 4, 0);

      if (!v53)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v35 = 0;
        goto LABEL_30;
      }
      if (-[CMISharpnessScore _computeClipValueWithHistogram:andRoi:toClipValue:](self, "_computeClipValueWithHistogram:andRoi:toClipValue:", v51, v53, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height))
      {
        break;
      }
      if (-[CMISharpnessScore _blurImage:toImage:sourceComponent:binning:firstPixel:roi:](self, "_blurImage:toImage:sourceComponent:binning:firstPixel:roi:", v71, v65, v66, v69, v64, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height))
      {
        break;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d_blurry"), v36);

      rect.origin.x = 0.0;
      rect.origin.y = 0.0;
      if (-[CMISharpnessScore _computeSharpnessScore:outputTexture:sourceComponent:binning:firstPixel:roi:clipValueMetalBuffer:](self, "_computeSharpnessScore:outputTexture:sourceComponent:binning:firstPixel:roi:clipValueMetalBuffer:", v65, v28, 0, 1, 0, v53, 0.0, 0.0, rect.size.width, rect.size.height))
      {
        break;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d_faceScore_%d"), (v36 + 1), v37 - 1);

      rect.origin = v70;
      rect.size.width = rect.size.width + -4.0;
      rect.size.height = rect.size.height + -4.0;
      v54 = self->_statistics;
      v76 = 0;
      -[CMIStatistics getStatisticsFromTexture:withRoi:toResult:withOptionalChannelConfig:](v54, "getStatisticsFromTexture:withRoi:toResult:withOptionalChannelConfig:", v28, &v76, 0, 2.0, 2.0);
      v55 = v76;
      objc_msgSend(v68, "addObject:", v55);

      v33 = v37;
      v43 = v67;
      v56 = objc_msgSend(v67, "count") > (unint64_t)v37++;
      v36 = (v36 + 2);
      v34 = v51;
      v35 = v53;
      if (!v56)
        goto LABEL_23;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v35 = v53;
LABEL_30:
    v34 = v51;
LABEL_31:
    v14 = v67;
    v59 = v63;
    v60 = FigSignalErrorAt();

    v53 = v35;
    v51 = v34;
  }
  else
  {
    v53 = 0;
    v51 = 0;
LABEL_23:
    -[FigMetalContext commandBuffer](self->_metal, "commandBuffer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      -[FigMetalContext commit](self->_metal, "commit");
      v58 = [CMIDeferredObject alloc];
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __98__CMISharpnessScore__calculateFromTexture_andFromRoi_sourceComponent_binning_firstPixel_toResult___block_invoke;
      v72[3] = &unk_1E94EB418;
      v73 = v57;
      v59 = v63;
      v74 = v63;
      v75 = v68;
      *v62 = -[CMIDeferredObject initWithBlock:](v58, "initWithBlock:", v72);

      v60 = 0;
      v14 = v67;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v60 = FigSignalErrorAt();
      v14 = v67;
      v59 = v63;
    }

  }
LABEL_26:
  FigMetalDecRef(&v84);
  FigMetalDecRef(&v85);

  return v60;
}

CMISharpnessScoreResult *__98__CMISharpnessScore__calculateFromTexture_andFromRoi_sourceComponent_binning_firstPixel_toResult___block_invoke(id *a1)
{
  int v2;
  int v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CMISharpnessScoreResult *v11;
  double v12;
  CMISharpnessScoreResult *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "waitUntilCompleted");
  objc_msgSend(a1[5], "mean");
  v3 = v2;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a1[6];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "variance", (_QWORD)v15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v11 = [CMISharpnessScoreResult alloc];
  LODWORD(v12) = v3;
  v13 = -[CMISharpnessScoreResult initWithFullImageScore:facesScore:](v11, "initWithFullImageScore:facesScore:", v4, v12);

  return v13;
}

- (int)_computeClipValueWithHistogram:(id)a3 andRoi:(CGRect)a4 toClipValue:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  float64x2_t v12;
  float64x2_t v13;
  int v14;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  int64x2_t v20;
  uint64_t v21;
  int64x2_t v22;
  uint64_t v23;
  float32x4_t v24;

  height = a4.size.height;
  x = a4.origin.x;
  y = a4.origin.y;
  width = a4.size.width;
  v7 = a3;
  v8 = a5;
  -[FigMetalContext commandBuffer](self->_metal, "commandBuffer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLabel:", 0);
  if (v9 && (objc_msgSend(v9, "computeCommandEncoder"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = v10;
    objc_msgSend(v10, "setComputePipelineState:", self->_computeClipValueWithHistogramShader);
    objc_msgSend(v11, "setBuffer:offset:atIndex:", v7, 0, 0);
    objc_msgSend(v11, "setBuffer:offset:atIndex:", v8, 0, 1);
    v12.f64[0] = width;
    v13.f64[0] = x;
    v12.f64[1] = height;
    v13.f64[1] = y;
    v24 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v12);
    objc_msgSend(v11, "setBytes:length:atIndex:", &v24, 16, 2);
    v22 = vdupq_n_s64(1uLL);
    v23 = 1;
    v20 = v22;
    v21 = 1;
    objc_msgSend(v11, "dispatchThreads:threadsPerThreadgroup:", &v22, &v20);
    objc_msgSend(v11, "endEncoding");
    -[FigMetalContext commit](self->_metal, "commit");

    v14 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v14 = FigSignalErrorAt();
  }

  return v14;
}

- (int)_computeSharpnessScore:(id)a3 outputTexture:(id)a4 sourceComponent:(int)a5 binning:(int)a6 firstPixel:(int)a7 roi:(CGRect)a8 clipValueMetalBuffer:(id)a9
{
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __n64 v25;
  float v26;
  void *v27;
  void *v28;
  float64x2_t v29;
  float64x2_t v30;
  int32x2_t v31;
  int32x2_t v32;
  __int128 v33;
  int v34;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  id v40;
  int64x2_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  float32x4_t v45;
  int v46;
  unsigned __int16 v47;
  unsigned __int16 v48;
  float v49;

  height = a8.size.height;
  x = a8.origin.x;
  y = a8.origin.y;
  width = a8.size.width;
  v15 = a3;
  v40 = a4;
  v16 = a9;
  if (a5 >= 4
    || (-[FigMetalContext commandBuffer](self->_metal, "commandBuffer"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v17, "setLabel:", 0),
        !v17))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v34 = FigSignalErrorAt();
LABEL_21:
    v24 = v40;
    goto LABEL_16;
  }
  v18 = objc_msgSend(v15, "pixelFormat");
  if (a6 == 1)
    v19 = a5;
  else
    v19 = 0;
  -[CMISharpnessScore computePipelineFor:sourceComponent:](self, "computePipelineFor:sourceComponent:", v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v34 = FigSignalErrorAt();
LABEL_20:

    goto LABEL_21;
  }
  v21 = (void *)v20;
  objc_msgSend(v17, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v34 = FigSignalErrorAt();

    goto LABEL_20;
  }
  v23 = v22;
  objc_msgSend(v22, "setComputePipelineState:", v21);
  objc_msgSend(v23, "setTexture:atIndex:", v15, 0);
  v24 = v40;
  objc_msgSend(v23, "setTexture:atIndex:", v40, 1);
  objc_msgSend(v23, "setBytes:length:atIndex:", self->_kernelWeight, 100, 0);
  v46 = a6;
  if (a6 < 2)
  {
    v25.n64_u16[0] = 0;
    v25.n64_u16[2] = 0;
  }
  else
  {
    v25.n64_u64[0] = offsetForPixelComponentWithFirstPixel(a5, a7).n64_u64[0];
  }
  v48 = v25.n64_u16[2];
  v47 = v25.n64_u16[0];
  v26 = 0.5;
  if (a6 == 4)
    v26 = 1.0;
  v49 = v26;
  objc_msgSend(v23, "setBytes:length:atIndex:", &v46, 12, 1);
  if (!v16)
  {
    -[FigMetalContext device](self->_metal, "device");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "newBufferWithLength:options:", 4, 0);

    v16 = objc_retainAutorelease(v28);
    *(_DWORD *)objc_msgSend(v16, "contents") = 1065353216;
  }
  objc_msgSend(v23, "setBuffer:offset:atIndex:", v16, 0, 2);
  v29.f64[0] = width;
  v30.f64[0] = x;
  v29.f64[1] = height;
  v30.f64[1] = y;
  v45 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v30), v29);
  objc_msgSend(v23, "setBytes:length:atIndex:", &v45, 16, 3);
  objc_msgSend(v23, "setImageblockWidth:height:", 32, 32);
  v31 = vadd_s32(vcvt_s32_f32(*(float32x2_t *)&v45.u32[2]), (int32x2_t)0x1F0000001FLL);
  v32 = vshr_n_s32((int32x2_t)vsra_n_u32((uint32x2_t)v31, (uint32x2_t)vcltz_s32(v31), 0x1BuLL), 5uLL);
  *(_QWORD *)&v33 = v32.i32[0];
  *((_QWORD *)&v33 + 1) = v32.i32[1];
  v43 = v33;
  v44 = 1;
  v41 = vdupq_n_s64(0x20uLL);
  v42 = 1;
  objc_msgSend(v23, "dispatchThreadgroups:threadsPerThreadgroup:", &v43, &v41);
  objc_msgSend(v23, "endEncoding");
  -[FigMetalContext commit](self->_metal, "commit");

  v34 = 0;
LABEL_16:

  return v34;
}

- (id)computePipelineFor:(unint64_t)a3 sourceComponent:(int)a4
{
  uint64_t v6;
  uint64_t v7;

  v6 = dataTypeForPixelFormat(a3);
  v7 = 136;
  if (v6 == 33)
    v7 = 168;
  return *(id *)((char *)&self->super.isa + 8 * a4 + v7);
}

- (int)_blurImage:(id)a3 toImage:(id)a4 sourceComponent:(int)a5 binning:(int)a6 firstPixel:(int)a7 roi:(CGRect)a8
{
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __n64 v21;
  float v22;
  void *v23;
  void *v24;
  id v25;
  float64x2_t v26;
  float64x2_t v27;
  int v33;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  float64x2_t v39;
  int64x2_t v40;
  uint64_t v41;
  uint64x2_t v42;
  uint64_t v43;
  float32x4_t v44;
  int v45;
  unsigned __int16 v46;
  unsigned __int16 v47;
  float v48;

  height = a8.size.height;
  width = a8.size.width;
  x = a8.origin.x;
  y = a8.origin.y;
  v13 = a3;
  v14 = a4;
  -[FigMetalContext commandBuffer](self->_metal, "commandBuffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLabel:", 0);
  if (v15)
  {
    v16 = objc_msgSend(v13, "pixelFormat");
    if (a6 == 1)
      v17 = a5;
    else
      v17 = 0;
    -[CMISharpnessScore computePipelineFor:sourceComponent:](self, "computePipelineFor:sourceComponent:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "computeCommandEncoder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = v19;
      objc_msgSend(v19, "setComputePipelineState:", v18);
      objc_msgSend(v20, "setTexture:atIndex:", v13, 0);
      objc_msgSend(v20, "setTexture:atIndex:", v14, 1);
      objc_msgSend(v20, "setBytes:length:atIndex:", &_blurImage_toImage_sourceComponent_binning_firstPixel_roi__blurKernelWeight, 100, 0);
      v45 = a6;
      if (a6 < 2)
      {
        v21.n64_u16[0] = 0;
        v21.n64_u16[2] = 0;
      }
      else
      {
        v21.n64_u64[0] = offsetForPixelComponentWithFirstPixel(a5, a7).n64_u64[0];
      }
      v47 = v21.n64_u16[2];
      v46 = v21.n64_u16[0];
      v22 = 0.5;
      if (a6 == 4)
        v22 = 1.0;
      v48 = v22;
      objc_msgSend(v20, "setBytes:length:atIndex:", &v45, 12, 1);
      -[FigMetalContext device](self->_metal, "device");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v23, "newBufferWithLength:options:", 4, 0);

      v25 = objc_retainAutorelease(v24);
      *(_DWORD *)objc_msgSend(v25, "contents") = 1065353216;
      objc_msgSend(v20, "setBuffer:offset:atIndex:", v25, 0, 2);

      v26.f64[0] = x;
      v26.f64[1] = y;
      v27.f64[0] = width;
      v27.f64[1] = height;
      v39 = v27;
      v44 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v26), v27);
      objc_msgSend(v20, "setBytes:length:atIndex:", &v44, 16, 3);
      objc_msgSend(v20, "setImageblockWidth:height:", 32, 32);
      __asm { FMOV            V1.2D, #-1.0 }
      v42 = vcvtq_u64_f64(vmulq_f64(vaddq_f64(vaddq_f64(v39, (float64x2_t)vdupq_n_s64(0x4040000000000000uLL)), _Q1), (float64x2_t)vdupq_n_s64(0x3FA0000000000000uLL)));
      v43 = 1;
      v40 = vdupq_n_s64(0x20uLL);
      v41 = 1;
      objc_msgSend(v20, "dispatchThreadgroups:threadsPerThreadgroup:", &v42, &v40);
      objc_msgSend(v20, "endEncoding");
      -[FigMetalContext commit](self->_metal, "commit");

      v33 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v33 = FigSignalErrorAt();

    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v33 = FigSignalErrorAt();
  }

  return v33;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;

  objc_storeStrong((id *)&self->_computeClipValueWithHistogramShader, 0);
  for (i = 0; i != -4; --i)
    objc_storeStrong((id *)&self->_applyConvolutionShaderUInt[i + 3], 0);
  for (j = 0; j != -4; --j)
    objc_storeStrong((id *)&self->_applyConvolutionShaderFloat[j + 3], 0);
  objc_storeStrong((id *)&self->_histogram, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

@end
