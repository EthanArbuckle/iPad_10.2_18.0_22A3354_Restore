@implementation CMISmartStyleUtilitiesV1

+ (id)defaultStyleForCastType:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CMISmartStyleUtilitiesV1_defaultStyleForCastType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultStyleForCastType__onceToken != -1)
    dispatch_once(&defaultStyleForCastType__onceToken, block);
  objc_msgSend((id)defaultStyleForCastType__defaultUserBiasByCastType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    FigDebugAssert3();

  return v5;
}

void __52__CMISmartStyleUtilitiesV1_defaultStyleForCastType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99D80];
  v9 = v0;
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("RendererTuning"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    cmissv1_RendererTuning();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "readPlist:", v3);
  objc_msgSend(v5, "defaultTuning");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "defaultUserBiasByCastType");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)defaultStyleForCastType__defaultUserBiasByCastType;
  defaultStyleForCastType__defaultUserBiasByCastType = v7;

}

- (CMISmartStyleUtilitiesV1)initWithMetalContext:(id)a3 useCase:(unint64_t)a4 processingType:(unint64_t)a5 optionalExternalMemoryResource:(id)a6
{
  id v11;
  id v12;
  CMISmartStyleUtilitiesV1 *v13;
  CMISmartStyleUtilitiesV1 *v14;
  CMIStyleEngineProcessor *v15;
  void *v16;
  uint64_t v17;
  CMIStyleEngineProcessor *styleEngineProcessor;
  CMISmartStyleUtilitiesV1 *v19;
  objc_super v21;

  v11 = a3;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CMISmartStyleUtilitiesV1;
  v13 = -[CMISmartStyleUtilitiesV1 init](&v21, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  objc_storeStrong((id *)&v13->_metalContext, a3);
  if (!v14->_metalContext)
    goto LABEL_7;
  objc_storeStrong((id *)&v14->_externalMemoryResource, a6);
  v15 = [CMIStyleEngineProcessor alloc];
  objc_msgSend(v11, "commandQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[CMIStyleEngineProcessor initWithOptionalMetalCommandQueue:withCoefficientSynchronization:](v15, "initWithOptionalMetalCommandQueue:withCoefficientSynchronization:", v16, 1);
  styleEngineProcessor = v14->_styleEngineProcessor;
  v14->_styleEngineProcessor = (CMIStyleEngineProcessor *)v17;

  if (!v14->_styleEngineProcessor)
    goto LABEL_7;
  v14->_coefficientsPixelBufferPixelFormat = 1278226534;
  v14->_useCase = a4;
  v14->_processingType = a5;
  if (!-[CMISmartStyleUtilitiesV1 _setupStyleEngineForUseCase:useFloat16Coefficients:](v14, "_setupStyleEngineForUseCase:useFloat16Coefficients:", a4, 0))
  {
    v19 = v14;
  }
  else
  {
LABEL_7:
    FigDebugAssert3();
    v19 = 0;
  }

  return v19;
}

- (CMISmartStyleUtilitiesV1)initWithOptionalMetalCommandQueue:(id)a3 useCase:(unint64_t)a4 processingType:(unint64_t)a5 optionalExternalMemoryResource:(id)a6
{
  id v10;
  id v11;
  FigMetalContext *v12;
  void *v13;
  FigMetalContext *v14;
  CMISmartStyleUtilitiesV1 *v15;

  v10 = a6;
  v11 = a3;
  v12 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v12, "initWithbundle:andOptionalCommandQueue:", v13, v11);

  v15 = -[CMISmartStyleUtilitiesV1 initWithMetalContext:useCase:processingType:optionalExternalMemoryResource:](self, "initWithMetalContext:useCase:processingType:optionalExternalMemoryResource:", v14, a4, a5, v10);
  return v15;
}

- (CMISmartStyleUtilitiesV1)initWithMetalContext:(id)a3 useCase:(unint64_t)a4
{
  return -[CMISmartStyleUtilitiesV1 initWithMetalContext:useCase:processingType:optionalExternalMemoryResource:](self, "initWithMetalContext:useCase:processingType:optionalExternalMemoryResource:", a3, a4, 0, 0);
}

- (CMISmartStyleUtilitiesV1)initWithOptionalMetalCommandQueue:(id)a3 useCase:(unint64_t)a4
{
  return -[CMISmartStyleUtilitiesV1 initWithOptionalMetalCommandQueue:useCase:processingType:optionalExternalMemoryResource:](self, "initWithOptionalMetalCommandQueue:useCase:processingType:optionalExternalMemoryResource:", a3, a4, 0, 0);
}

- (void)dealloc
{
  __CVBuffer *intermediateStyleRendererPixelBuffer;
  __CVBuffer *coefficientsPixelBuffer;
  objc_super v5;

  intermediateStyleRendererPixelBuffer = self->_intermediateStyleRendererPixelBuffer;
  if (intermediateStyleRendererPixelBuffer)
    CFRelease(intermediateStyleRendererPixelBuffer);
  coefficientsPixelBuffer = self->_coefficientsPixelBuffer;
  if (coefficientsPixelBuffer)
    CFRelease(coefficientsPixelBuffer);
  v5.receiver = self;
  v5.super_class = (Class)CMISmartStyleUtilitiesV1;
  -[CMISmartStyleUtilitiesV1 dealloc](&v5, sel_dealloc);
}

- (int)computeOriginalUnstyledPixelBufferFrom:(__CVBuffer *)a3 inputDeltaMapPixelBuffer:(__CVBuffer *)a4 inputCoefficientsPixelBuffer:(__CVBuffer *)a5 outputUnstyledPixelBuffer:(__CVBuffer *)a6
{
  uint64_t width;
  uint64_t height;
  uint64_t PixelFormatType;
  __CVBuffer *PixelBuffer;
  int v15;
  int v16;

  if (self->_processingType)
    goto LABEL_15;
  if (!a6
    || !a3
    || !a4
    || !a5
    || !self->_intermediateStyleRendererPixelBuffer
    && (width = (int)self->_intermediateStyleRendererThumbnailSize.width,
        height = (int)self->_intermediateStyleRendererThumbnailSize.height,
        PixelFormatType = CVPixelBufferGetPixelFormatType(a6),
        PixelBuffer = CreatePixelBuffer(width, height, PixelFormatType),
        (self->_intermediateStyleRendererPixelBuffer = PixelBuffer) == 0))
  {
    FigDebugAssert3();
    return -12780;
  }
  -[CMIStyleEngineProcessor resetState](self->_styleEngineProcessor, "resetState");
  -[CMIStyleEngineProcessor setInputPixelBuffer:](self->_styleEngineProcessor, "setInputPixelBuffer:", a3);
  -[CMIStyleEngineProcessor setOutputPixelBuffer:](self->_styleEngineProcessor, "setOutputPixelBuffer:", a6);
  -[CMIStyleEngineProcessor setInputDeltaMapPixelBuffer:](self->_styleEngineProcessor, "setInputDeltaMapPixelBuffer:", a4);
  -[CMIStyleEngineProcessor setInputLinearSystemCoefficientsPixelBuffer:](self->_styleEngineProcessor, "setInputLinearSystemCoefficientsPixelBuffer:", a5);
  v15 = -[CMIStyleEngineProcessor process](self->_styleEngineProcessor, "process");
  if (v15)
  {
    v16 = v15;
    FigDebugAssert3();
    return v16;
  }
  if (-[CMIStyleEngineProcessor finishProcessing](self->_styleEngineProcessor, "finishProcessing"))
  {
LABEL_15:
    FigDebugAssert3();
    return -12782;
  }
  -[CMIStyleEngineProcessor forceMetalCachesFlush](self->_styleEngineProcessor, "forceMetalCachesFlush");
  return 0;
}

- (int)computeOriginalUnstyledPixelBufferFrom:(__CVBuffer *)a3 inputDeltaMapPixelBuffer:(__CVBuffer *)a4 inputMetadataDict:(id)a5 outputUnstyledPixelBuffer:(__CVBuffer *)a6
{
  id v10;
  void *v11;
  unsigned int coefficientsPixelBufferWidth;
  unsigned int coefficientsPixelBufferHeight;
  unsigned int coefficientsPixelBufferBytesPerPixel;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  int v42;
  __CVBuffer *v44;
  __CVBuffer *v45;
  __CVBuffer *v46;

  v10 = a5;
  v11 = v10;
  if (self->_processingType)
  {
    FigDebugAssert3();
    v15 = 0;
LABEL_35:
    v42 = -12782;
    goto LABEL_28;
  }
  if (!a6 || !a3 || !a4 || !self->_coefficientsPixelBuffer || !v10)
  {
    FigDebugAssert3();
    v15 = 0;
LABEL_33:
    v42 = -12780;
    goto LABEL_28;
  }
  coefficientsPixelBufferWidth = self->_coefficientsPixelBufferWidth;
  coefficientsPixelBufferHeight = self->_coefficientsPixelBufferHeight;
  coefficientsPixelBufferBytesPerPixel = self->_coefficientsPixelBufferBytesPerPixel;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("1"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("smartStyleLearnedCoefficients"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_34;
  }
  v45 = a3;
  v16 = coefficientsPixelBufferHeight * coefficientsPixelBufferWidth * coefficientsPixelBufferBytesPerPixel;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("2"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = a4;
  if (!v17)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("smartStyleLearnedCoefficientsUseFloat16"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_15;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("smartStyleLearnedCoefficientsUseFloat16"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if (!v22)
      goto LABEL_15;
LABEL_14:
    v23 = 2;
    v24 = 1;
    goto LABEL_16;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("2"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if ((v19 & 1) != 0)
    goto LABEL_14;
LABEL_15:
  v24 = 0;
  v23 = 4;
LABEL_16:
  if (objc_msgSend(v15, "length") != v16)
  {
    v44 = a6;
    +[CMIStyleEngineCommonSettings configurationForUseCase:](CMIStyleEngineCommonSettings, "configurationForUseCase:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 2;
    +[CMIStyleEngineCommonSettings configurationForUseCase:](CMIStyleEngineCommonSettings, "configurationForUseCase:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMIStyleEngineCommonSettings configurationForUseCase:](CMIStyleEngineCommonSettings, "configurationForUseCase:", 7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[CMIStyleEngineProcessor coefficientPixelBufferSizeForConfiguration:float16:](CMIStyleEngineProcessor, "coefficientPixelBufferSizeForConfiguration:float16:", v25, v24);
    v30 = v29;
    v32 = v31;
    +[CMIStyleEngineProcessor coefficientPixelBufferSizeForConfiguration:float16:](CMIStyleEngineProcessor, "coefficientPixelBufferSizeForConfiguration:float16:", v27, v24);
    v34 = v33;
    v36 = v35;
    +[CMIStyleEngineProcessor coefficientPixelBufferSizeForConfiguration:float16:](CMIStyleEngineProcessor, "coefficientPixelBufferSizeForConfiguration:float16:", v28, v24);
    v38 = v37;
    v40 = v39;
    v41 = (double)v23;
    if (objc_msgSend(v15, "length") != (unint64_t)(v32 * (v30 * (double)v23)))
    {
      if (objc_msgSend(v15, "length") == (unint64_t)(v36 * (v34 * v41)))
      {
        v26 = 0;
      }
      else
      {
        if (objc_msgSend(v15, "length") != (unint64_t)(v40 * (v38 * v41)))
        {
LABEL_23:
          v16 = self->_coefficientsPixelBufferHeight
              * self->_coefficientsPixelBufferWidth
              * self->_coefficientsPixelBufferBytesPerPixel;

          a6 = v44;
          goto LABEL_24;
        }
        v26 = 3;
      }
    }
    -[CMIStyleEngineProcessor purgeResources](self->_styleEngineProcessor, "purgeResources");
    -[CMISmartStyleUtilitiesV1 _setupStyleEngineForUseCase:useFloat16Coefficients:](self, "_setupStyleEngineForUseCase:useFloat16Coefficients:", v26, v24);
    goto LABEL_23;
  }
LABEL_24:
  if (v23 != self->_coefficientsPixelBufferBytesPerPixel || objc_msgSend(v15, "length") != v16)
  {
    FigDebugAssert3();
    goto LABEL_33;
  }
  _fillPixelBufferWithCoefficients(self->_coefficientsPixelBuffer, v15);
  if (-[CMISmartStyleUtilitiesV1 computeOriginalUnstyledPixelBufferFrom:inputDeltaMapPixelBuffer:inputCoefficientsPixelBuffer:outputUnstyledPixelBuffer:](self, "computeOriginalUnstyledPixelBufferFrom:inputDeltaMapPixelBuffer:inputCoefficientsPixelBuffer:outputUnstyledPixelBuffer:", v45, v46, self->_coefficientsPixelBuffer, a6))
  {
LABEL_34:
    FigDebugAssert3();
    goto LABEL_35;
  }
  v42 = 0;
LABEL_28:

  return v42;
}

- (int)learnTransformFrom:(__CVBuffer *)a3 to:(__CVBuffer *)a4 outputCoefficients:(__CVBuffer *)a5 outputIntegratedCoefficients:(id *)a6
{
  void *v11;
  id v12;
  int v13;

  if (self->_processingType == 1)
  {
    if (a3 && a4 && a5)
    {
      -[CMIStyleEngineProcessor resetState](self->_styleEngineProcessor, "resetState");
      -[CMIStyleEngineProcessor setInputPixelBuffer:](self->_styleEngineProcessor, "setInputPixelBuffer:", a3);
      -[CMIStyleEngineProcessor setTargetThumbnailPixelBuffer:](self->_styleEngineProcessor, "setTargetThumbnailPixelBuffer:", a4);
      -[CMIStyleEngineProcessor setOutputLinearSystemCoefficientsPixelBuffer:](self->_styleEngineProcessor, "setOutputLinearSystemCoefficientsPixelBuffer:", a5);
      if (a6)
      {
        -[CMIStyleEngineProcessor outputIntegratedCoefficients](self->_styleEngineProcessor, "outputIntegratedCoefficients");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *a6;
        *a6 = v11;

      }
      v13 = -[CMIStyleEngineProcessor process](self->_styleEngineProcessor, "process");
      if (v13)
        FigDebugAssert3();
    }
    else
    {
      FigDebugAssert3();
      return -12780;
    }
  }
  else
  {
    FigDebugAssert3();
    return -12782;
  }
  return v13;
}

- (id)interpolateCoefficientsFromStartFrameMetadataDict:(id)a3 startFrameTime:(id *)a4 endFrameMetadataDict:(id)a5 endFrameTime:(id *)a6 frameTimesToInterpolate:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  char *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unsigned int coefficientsPixelBufferBytesPerPixel;
  void *v26;
  uint64_t v27;
  _WORD *v28;
  void *v29;
  char *v30;
  uint64_t v31;
  _WORD *v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  double v37;
  void *v38;
  void *v39;
  float v40;
  float v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  double v46;
  CMISmartStyleUtilitiesV1 *v47;
  void *v48;
  void *v49;
  float v50;
  float v51;
  unint64_t v52;
  int v53;
  char *v54;
  id v55;
  _WORD *v56;
  char *v57;
  void *v58;
  void *v59;
  float v60;
  double v61;
  double v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  float v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  unsigned int v77;
  unint64_t v87;
  unint64_t v88;
  double v89;
  float v90;
  double v91;
  void *v92;
  void *v93;
  double v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  unint64_t v104;
  id v105;
  id v107;
  void *v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  _WORD *v115;
  id v117;
  int v118;
  _WORD *v119;
  char *v120;
  CMTime *v121;
  id v122;
  CMTime v123;
  CMTime v124;
  CMTime rhs;
  CMTime lhs;
  CMTime v127;
  CMTime v128;
  _QWORD v129[2];
  _QWORD v130[4];

  v130[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a7;
  v13 = 0;
  memset(&v128, 0, sizeof(v128));
  v14 = v10;
  v108 = v11;
  if (!v10)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    goto LABEL_61;
  }
  v121 = (CMTime *)a6;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  if (v11)
  {
    v21 = (void *)objc_msgSend(v12, "count");
    if (!v21)
    {
      v13 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      goto LABEL_61;
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("1"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("1"));
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        v24 = objc_msgSend(v17, "length");
        if (v24 == objc_msgSend(v23, "length"))
        {
          coefficientsPixelBufferBytesPerPixel = self->_coefficientsPixelBufferBytesPerPixel;
          if (coefficientsPixelBufferBytesPerPixel == 2 || coefficientsPixelBufferBytesPerPixel == 4)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              v18 = objc_retainAutorelease(v26);
              v27 = objc_msgSend(v18, "bytes");
              if (v27)
              {
                v28 = (_WORD *)v27;
                objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("3"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                {
                  v19 = objc_retainAutorelease(v29);
                  v30 = (char *)objc_msgSend(v19, "bytes");
                  v20 = v30;
                  if (!v30)
                  {
                    FigDebugAssert3();
                    v13 = 0;
                    v16 = v23;
                    v15 = v17;
                    v17 = 0;
                    goto LABEL_22;
                  }
                  v31 = (unsigned __int16)*v28;
                  if ((_DWORD)v31 == *(unsigned __int16 *)v30)
                  {
                    v32 = malloc_type_malloc(2 * v31 + 2, 0xB50371D3uLL);
                    if (v32)
                    {
                      v107 = v18;
                      v115 = v32;
                      *v32 = *v28;
                      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("4"));
                      v33 = (void *)objc_claimAutoreleasedReturnValue();

                      v117 = v17;
                      if (v33)
                      {
                        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("4"));
                        v34 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "floatValue");
                        v36 = v35;

                        v37 = v36;
                      }
                      else
                      {
                        v37 = 1.0;
                      }
                      objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("4"));
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      v119 = v28;
                      if (v38)
                      {
                        objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("4"));
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v39, "floatValue");
                        v41 = v40;

                      }
                      else
                      {
                        v41 = 1.0;
                      }
                      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("h"));
                      v42 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v42)
                      {
                        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("h"));
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v43, "floatValue");
                        v45 = v44;

                        v46 = v45;
                      }
                      else
                      {
                        v46 = 1.0;
                      }
                      v47 = self;
                      objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("h"));
                      v48 = (void *)objc_claimAutoreleasedReturnValue();

                      v109 = v23;
                      if (v48)
                      {
                        objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("h"));
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v49, "floatValue");
                        v51 = v50;

                      }
                      else
                      {
                        v51 = 1.0;
                      }
                      v18 = v107;
                      memset(&v127, 0, sizeof(v127));
                      lhs = *v121;
                      rhs = (CMTime)*a4;
                      CMTimeSubtract(&v127, &lhs, &rhs);
                      v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
                      if (objc_msgSend(v12, "count"))
                      {
                        v52 = 0;
                        v53 = 0;
                        v54 = 0;
                        v55 = 0;
                        v56 = v119 + 1;
                        v57 = v20 + 2;
                        v111 = v12;
                        v112 = v14;
                        v110 = v19;
                        while (1)
                        {
                          v120 = v54;
                          v118 = v53;
                          v58 = v55;
                          objc_msgSend(v12, "objectAtIndexedSubscript:", v52);
                          v59 = (void *)objc_claimAutoreleasedReturnValue();

                          CMTimeMakeFromDictionary(&v128, (CFDictionaryRef)v59);
                          memset(&lhs, 0, sizeof(lhs));
                          memset(&rhs, 0, sizeof(rhs));
                          v124 = v128;
                          v123 = (CMTime)*a4;
                          CMTimeSubtract(&rhs, &v124, &v123);
                          v124 = rhs;
                          v123 = v127;
                          v60 = (float)((float)((float)lhs.value * (float)v127.timescale)
                                      / (float)((float)v127.value * (float)lhs.timescale))
                              + (float)CMTimeDivide();
                          v122 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", objc_msgSend(v117, "length"));

                          v63 = v47->_coefficientsPixelBufferBytesPerPixel;
                          if (v63 == 2)
                          {
                            v72 = objc_msgSend(objc_retainAutorelease(v117), "bytes");
                            v73 = objc_msgSend(objc_retainAutorelease(v109), "bytes");
                            v74 = objc_retainAutorelease(v122);
                            v75 = objc_msgSend(v74, "mutableBytes");
                            if (objc_msgSend(v74, "length") >= (unint64_t)v47->_coefficientsPixelBufferBytesPerPixel)
                            {
                              v76 = 0;
                              v77 = 1;
                              do
                              {
                                _H0 = *(_WORD *)(v72 + 2 * v76);
                                __asm { FCVT            D0, H0 }
                                _H1 = *(_WORD *)(v73 + 2 * v76);
                                __asm { FCVT            S1, H1 }
                                _D0 = (float)(v60 * _S1) + (1.0 - v60) * _D0;
                                __asm { FCVT            H0, D0 }
                                *(_WORD *)(v75 + 2 * v76) = LOWORD(_D0);
                                v76 = v77;
                                v71 = objc_msgSend(v74, "length")
                                    / (unint64_t)v47->_coefficientsPixelBufferBytesPerPixel > v77++;
                              }
                              while (v71);
                            }
                          }
                          else if (v63 == 4)
                          {
                            v64 = objc_msgSend(objc_retainAutorelease(v117), "bytes");
                            v65 = objc_msgSend(objc_retainAutorelease(v109), "bytes");
                            v66 = objc_retainAutorelease(v122);
                            v67 = objc_msgSend(v66, "bytes");
                            if (objc_msgSend(v66, "length") >= (unint64_t)v47->_coefficientsPixelBufferBytesPerPixel)
                            {
                              v68 = 0;
                              v69 = 1;
                              do
                              {
                                v70 = (float)(v60 * *(float *)(v65 + 4 * v68)) + (1.0 - v60) * *(float *)(v64 + 4 * v68);
                                *(float *)(v67 + 4 * v68) = v70;
                                v68 = v69;
                                v71 = objc_msgSend(v66, "length")
                                    / (unint64_t)v47->_coefficientsPixelBufferBytesPerPixel > v69++;
                              }
                              while (v71);
                            }
                          }
                          v87 = (unsigned __int16)*v115;
                          if (*v115)
                          {
                            v88 = 0;
                            do
                            {
                              LOWORD(v61) = v56[v88];
                              LOWORD(v62) = *(_WORD *)&v57[2 * v88];
                              v62 = (float)(v60 * (float)LODWORD(v62));
                              v61 = v62 + (1.0 - v60) * (double)*(unint64_t *)&v61;
                              v115[++v88] = (int)v61;
                            }
                            while (v88 < v87);
                          }
                          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
                          v20 = (char *)objc_claimAutoreleasedReturnValue();

                          if (!v20)
                            break;
                          v89 = 1.0 - v60;
                          v90 = round((float)(v51 * v60) + v89 * v46);
                          v91 = round((float)(v41 * v60) + v89 * v37);
                          *(float *)&v91 = v91;
                          v92 = (void *)MEMORY[0x1E0C99E08];
                          v129[0] = CFSTR("4");
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v91);
                          v93 = (void *)objc_claimAutoreleasedReturnValue();
                          v129[1] = CFSTR("h");
                          v130[0] = v93;
                          *(float *)&v94 = v90;
                          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v94);
                          v95 = (void *)objc_claimAutoreleasedReturnValue();
                          v130[1] = v95;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
                          v96 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v92, "dictionaryWithDictionary:", v96);
                          v97 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v97)
                            break;
                          v12 = v111;
                          if (v122)
                            objc_msgSend(v97, "setObject:forKeyedSubscript:", v122, CFSTR("1"));
                          objc_msgSend(v97, "setObject:forKeyedSubscript:", v20, CFSTR("3"));
                          objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("2"));
                          v98 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v98)
                          {
                            objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("2"));
                            v99 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v97, "setObject:forKeyedSubscript:", v99, CFSTR("2"));

                          }
                          objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("0"));
                          v100 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v100)
                          {
                            objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("0"));
                            v101 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v97, "setObject:forKeyedSubscript:", v101, CFSTR("0"));

                          }
                          objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("5"));
                          v102 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v102)
                          {
                            objc_msgSend(v112, "objectForKeyedSubscript:", CFSTR("5"));
                            v103 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v97, "setObject:forKeyedSubscript:", v103, CFSTR("5"));

                          }
                          v14 = v112;
                          objc_msgSend(v113, "addObject:", v97);

                          v52 = (v118 + 1);
                          v104 = objc_msgSend(v111, "count");
                          v53 = v118 + 1;
                          v54 = v20;
                          v55 = v122;
                          v47 = self;
                          if (v104 <= v52)
                          {
                            v19 = v110;
                            v17 = v122;
                            v15 = v117;
                            v16 = v109;
                            v18 = v107;
                            goto LABEL_60;
                          }
                        }
                        FigDebugAssert3();
                        v12 = v111;
                        v14 = v112;
                        v15 = v117;
                        v16 = v109;
                        v18 = v107;
                        v19 = v110;
                        v21 = v115;
                        v13 = v113;
                        v17 = v122;
                      }
                      else
                      {
                        v17 = 0;
                        v20 = 0;
                        v15 = v117;
                        v16 = v23;
LABEL_60:
                        v21 = v115;
                        v13 = v113;
                      }
                      goto LABEL_61;
                    }
                  }
                  FigDebugAssert3();
                  v13 = 0;
                  v16 = v23;
                  v15 = v17;
                  v17 = 0;
LABEL_21:
                  v20 = 0;
LABEL_22:
                  v21 = 0;
                  goto LABEL_61;
                }
              }
              FigDebugAssert3();
              v13 = 0;
              v16 = v23;
              v15 = v17;
              v17 = 0;
LABEL_20:
              v19 = 0;
              goto LABEL_21;
            }
          }
        }
        FigDebugAssert3();
        v13 = 0;
        v16 = v23;
      }
      else
      {
        FigDebugAssert3();
        v13 = 0;
        v16 = 0;
      }
      v15 = v17;
      v17 = 0;
    }
    else
    {
      FigDebugAssert3();
      v13 = 0;
      v15 = 0;
      v16 = 0;
    }
    v18 = 0;
    goto LABEL_20;
  }
LABEL_61:
  free(v21);
  v105 = v13;

  return v105;
}

- (int)computeDeltaMapForSourcePixelBuffer:(__CVBuffer *)a3 targetPixelBuffer:(__CVBuffer *)a4 coefficientsDict:(id)a5 outputDeltaMapPixelBuffer:(__CVBuffer *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t coefficientsPixelBufferWidth;
  uint64_t coefficientsPixelBufferHeight;
  __CVBuffer *PixelBuffer;
  __CVBuffer *v17;
  int v18;
  int v19;

  v10 = a5;
  v11 = v10;
  if (self->_processingType)
  {
    FigDebugAssert3();
    v19 = -12782;
    goto LABEL_14;
  }
  if (!a3 || !a4 || !a6 || !v10)
  {
    FigDebugAssert3();
LABEL_18:
    v19 = -12780;
    goto LABEL_14;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("1"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("smartStyleLearnedCoefficients"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(v12, "length");
  coefficientsPixelBufferWidth = self->_coefficientsPixelBufferWidth;
  coefficientsPixelBufferHeight = self->_coefficientsPixelBufferHeight;
  if (v13 != (_DWORD)coefficientsPixelBufferHeight
            * (_DWORD)coefficientsPixelBufferWidth
            * self->_coefficientsPixelBufferBytesPerPixel
    || (PixelBuffer = CreatePixelBuffer(coefficientsPixelBufferWidth, coefficientsPixelBufferHeight, self->_coefficientsPixelBufferPixelFormat)) == 0)
  {
    FigDebugAssert3();

    goto LABEL_18;
  }
  v17 = PixelBuffer;
  _fillPixelBufferWithCoefficients(PixelBuffer, v12);
  -[CMIStyleEngineProcessor resetState](self->_styleEngineProcessor, "resetState");
  -[CMIStyleEngineProcessor setInputLinearSystemCoefficientsPixelBuffer:](self->_styleEngineProcessor, "setInputLinearSystemCoefficientsPixelBuffer:", v17);
  -[CMIStyleEngineProcessor setOutputDeltaMapPixelBuffer:](self->_styleEngineProcessor, "setOutputDeltaMapPixelBuffer:", a6);
  -[CMIStyleEngineProcessor setInputPixelBuffer:](self->_styleEngineProcessor, "setInputPixelBuffer:", a4);
  -[CMIStyleEngineProcessor setInputOriginalPixelBuffer:](self->_styleEngineProcessor, "setInputOriginalPixelBuffer:", a3);
  v18 = -[CMIStyleEngineProcessor process](self->_styleEngineProcessor, "process");
  if (v18)
  {
    v19 = v18;
    FigDebugAssert3();
  }
  else if (-[CMIStyleEngineProcessor finishProcessing](self->_styleEngineProcessor, "finishProcessing"))
  {
    FigDebugAssert3();
    v19 = -12782;
  }
  else
  {
    v19 = 0;
  }
  CFRelease(v17);

LABEL_14:
  return v19;
}

- (int)computeDeltaMapForSourcePixelBuffer:(__CVBuffer *)a3 targetPixelBuffer:(__CVBuffer *)a4 coefficients:(__CVBuffer *)a5 outputDeltaMapPixelBuffer:(__CVBuffer *)a6
{
  int v11;
  int v12;

  if (self->_processingType)
    goto LABEL_13;
  if (!a3 || !a4 || !a6 || !a5)
  {
    FigDebugAssert3();
    return -12780;
  }
  -[CMIStyleEngineProcessor resetState](self->_styleEngineProcessor, "resetState");
  -[CMIStyleEngineProcessor setInputLinearSystemCoefficientsPixelBuffer:](self->_styleEngineProcessor, "setInputLinearSystemCoefficientsPixelBuffer:", a5);
  -[CMIStyleEngineProcessor setOutputDeltaMapPixelBuffer:](self->_styleEngineProcessor, "setOutputDeltaMapPixelBuffer:", a6);
  -[CMIStyleEngineProcessor setInputPixelBuffer:](self->_styleEngineProcessor, "setInputPixelBuffer:", a4);
  -[CMIStyleEngineProcessor setInputOriginalPixelBuffer:](self->_styleEngineProcessor, "setInputOriginalPixelBuffer:", a3);
  v11 = -[CMIStyleEngineProcessor process](self->_styleEngineProcessor, "process");
  if (v11)
  {
    v12 = v11;
    FigDebugAssert3();
    return v12;
  }
  if (-[CMIStyleEngineProcessor finishProcessing](self->_styleEngineProcessor, "finishProcessing"))
  {
LABEL_13:
    FigDebugAssert3();
    return -12782;
  }
  return 0;
}

- (void)setCoefficientsPixelBufferPixelFormat:(unsigned int)a3
{
  if (self->_coefficientsPixelBufferPixelFormat != a3)
  {
    self->_coefficientsPixelBufferPixelFormat = a3;
    if (-[CMISmartStyleUtilitiesV1 _setupStyleEngineForUseCase:useFloat16Coefficients:](self, "_setupStyleEngineForUseCase:useFloat16Coefficients:", self->_useCase, a3 == 1278226536))
    {
      FigDebugAssert3();
    }
  }
}

- (unsigned)coefficientsPixelBufferPixelFormat
{
  return self->_coefficientsPixelBufferPixelFormat;
}

- (int)_setupStyleEngineForUseCase:(unint64_t)a3 useFloat16Coefficients:(BOOL)a4
{
  _BOOL8 v4;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  double v21;
  uint64_t coefficientsPixelBufferWidth;
  double v23;
  uint64_t coefficientsPixelBufferHeight;
  __CVBuffer *PixelBuffer;
  CGFloat v26;
  CGFloat v27;
  int v28;
  unint64_t processingType;
  uint64_t v30;
  int v31;

  v4 = a4;
  +[CMISmartStyleUtilitiesV1 intermediateStyleRendererThumbnailSizeForUseCase:](CMISmartStyleUtilitiesV1, "intermediateStyleRendererThumbnailSizeForUseCase:");
  self->_intermediateStyleRendererThumbnailSize.width = v7;
  self->_intermediateStyleRendererThumbnailSize.height = v8;
  switch(a3)
  {
    case 0uLL:
      +[CMIStyleEngineCommonSettings configurationForUseCase:](CMIStyleEngineCommonSettings, "configurationForUseCase:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      v11 = 2;
      goto LABEL_6;
    case 1uLL:
      +[CMIStyleEngineCommonSettings configurationForUseCase:](CMIStyleEngineCommonSettings, "configurationForUseCase:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v13, "copy");

      v14 = 0;
      goto LABEL_8;
    case 2uLL:
      +[CMIStyleEngineCommonSettings configurationForUseCase:](CMIStyleEngineCommonSettings, "configurationForUseCase:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v15, "copy");

      v11 = 3;
LABEL_6:
      +[CMIStyleEngineCommonSettings tuningParametersForUseCase:](CMIStyleEngineCommonSettings, "tuningParametersForUseCase:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v10;
      v17 = 1;
      goto LABEL_9;
    case 3uLL:
      +[CMIStyleEngineCommonSettings configurationForUseCase:](CMIStyleEngineCommonSettings, "configurationForUseCase:", 7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v18, "copy");

      v14 = 7;
LABEL_8:
      +[CMIStyleEngineCommonSettings tuningParametersForUseCase:](CMIStyleEngineCommonSettings, "tuningParametersForUseCase:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v10;
      v17 = 0;
LABEL_9:
      objc_msgSend(v16, "setFastStyleApplication:", v17);
      objc_msgSend(v10, "setOutputCoefficientsF16:", v4);
      objc_msgSend(v10, "setInputCoefficientsF16:", v4);
      if (v4)
        v19 = 1278226536;
      else
        v19 = 1278226534;
      self->_coefficientsPixelBufferPixelFormat = v19;
      if (v4)
        v20 = 2;
      else
        v20 = 4;
      +[CMIStyleEngineProcessor coefficientPixelBufferSizeForConfiguration:float16:](CMIStyleEngineProcessor, "coefficientPixelBufferSizeForConfiguration:float16:", v10, v4);
      coefficientsPixelBufferWidth = v21;
      coefficientsPixelBufferHeight = v23;
      self->_coefficientsPixelBufferWidth = coefficientsPixelBufferWidth;
      self->_coefficientsPixelBufferHeight = coefficientsPixelBufferHeight;
      self->_coefficientsPixelBufferBytesPerPixel = v20;
      if (self->_coefficientsPixelBuffer)
      {
        CFRelease(self->_coefficientsPixelBuffer);
        coefficientsPixelBufferWidth = self->_coefficientsPixelBufferWidth;
        coefficientsPixelBufferHeight = self->_coefficientsPixelBufferHeight;
      }
      PixelBuffer = CreatePixelBuffer(coefficientsPixelBufferWidth, coefficientsPixelBufferHeight, self->_coefficientsPixelBufferPixelFormat);
      self->_coefficientsPixelBuffer = PixelBuffer;
      if (!PixelBuffer)
      {
        FigDebugAssert3();
        goto LABEL_26;
      }
      objc_msgSend(v10, "thumbnailSize");
      self->_intermediateStyleRendererThumbnailSize.width = v26;
      self->_intermediateStyleRendererThumbnailSize.height = v27;
      -[CMIStyleEngineProcessor setTuningParameters:](self->_styleEngineProcessor, "setTuningParameters:", v12);
      -[CMIStyleEngineProcessor setConfiguration:](self->_styleEngineProcessor, "setConfiguration:", v10);
      v28 = -[CMIStyleEngineProcessor setup](self->_styleEngineProcessor, "setup");
      if (!v28)
      {
        processingType = self->_processingType;
        if (!processingType)
        {
          v30 = 4;
LABEL_23:
          -[CMIStyleEngineProcessor setExternalMemoryResource:](self->_styleEngineProcessor, "setExternalMemoryResource:", self->_externalMemoryResource);
          v31 = -[CMIStyleEngineProcessor prepareToProcess:](self->_styleEngineProcessor, "prepareToProcess:", v30);
          if (!v31)
            goto LABEL_27;
          goto LABEL_29;
        }
        if (processingType == 1)
        {
          v30 = 3;
          goto LABEL_23;
        }
LABEL_26:
        v31 = 0;
        goto LABEL_27;
      }
      v31 = v28;
LABEL_29:
      FigDebugAssert3();
LABEL_27:

      return v31;
    default:
      v10 = 0;
      v12 = 0;
      goto LABEL_26;
  }
}

+ (unint64_t)makerNoteTagForSmartStyleCastType:(id)a3 smartStyleVersion:(unsigned int)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v5 = a3;
  smartStyleCastTypesForVersion(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "containsObject:", v5))
    v8 = objc_msgSend(v7, "indexOfObject:", v5) + 1;
  else
    v8 = 0;

  return v8;
}

+ (id)smartStyleCastForMakerNoteTag:(unint64_t)a3 smartStyleVersion:(unsigned int)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  smartStyleCastTypesForVersion(a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (v7 = a3 - 1, v7 < objc_msgSend(v5, "count")))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (CGSize)intermediateStyleRendererThumbnailSizeForUseCase:(unint64_t)a3
{
  double *v3;
  double *v4;
  double v5;
  double v6;
  CGSize result;

  v3 = (double *)((char *)&unk_1D33053B8 + 8 * a3);
  v4 = (double *)((char *)&unk_1D33053D8 + 8 * a3);
  if (a3 >= 4)
  {
    v3 = (double *)(MEMORY[0x1E0C9D820] + 8);
    v4 = (double *)MEMORY[0x1E0C9D820];
  }
  v5 = *v4;
  v6 = *v3;
  result.height = v6;
  result.width = v5;
  return result;
}

+ (unint64_t)makerNoteTagForSmartStyleTuningType:(id)a3 smartStyleVersion:(unsigned int)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v5 = a3;
  smartStyleTuningTypesForVersion(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "containsObject:", v5))
    v8 = objc_msgSend(v7, "indexOfObject:", v5) + 1;
  else
    v8 = 0;

  return v8;
}

+ (id)smartStyleTuningForMakerNoteTag:(unint64_t)a3 smartStyleVersion:(unsigned int)a4
{
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;

  smartStyleTuningTypesForVersion(a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (v7 = a3 - 1, v7 < objc_msgSend(v5, "count")))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("DefaultParameters");
  }
  v9 = v8;

  return v9;
}

+ (int)computeLinearImageExposureWithMetadata:(id)a3 outputBaseGain:(float *)a4 outputBaselineExposure:(float *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  float v18;
  void *v19;
  unsigned int v20;
  float v21;
  float v22;
  float v23;

  v7 = a3;
  v8 = v7;
  if (a4 && v7 && a5)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D05FA0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 1.0;
    v12 = 1.0;
    if (v9)
    {
      objc_msgSend(v9, "floatValue");
      v12 = 1.0 / v13;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v11 = (float)objc_msgSend(v14, "unsignedShortValue") * 0.00024414;
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F88]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "floatValue");
LABEL_13:
      v22 = (float)(v12 * v11) * v16;
      v23 = (float)(v12 * v11) * 0.25;
      v18 = v22 / v23;

      LODWORD(v15) = 0;
LABEL_14:
      *a4 = v23;
      goto LABEL_15;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D05B98]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 1.0;
    if (v17)
    {
      v19 = v17;
      v20 = objc_msgSend(v17, "unsignedShortValue");
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F68]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v15, "floatValue");
        v16 = (float)((float)v20 * 0.0039062) / v21;
        goto LABEL_13;
      }
    }
    else
    {
      LODWORD(v15) = 0;
    }
    v23 = 1.0;
    goto LABEL_14;
  }
  FigDebugAssert3();
  LODWORD(v15) = FigSignalErrorAt();
  v18 = 1.0;
  v23 = 1.0;
  if (a4)
    goto LABEL_14;
LABEL_15:
  if (a5)
    *a5 = v18;

  return (int)v15;
}

+ (float)computeLinearImageEncodingGainWithMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  float v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05FA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1.0;
    v8 = 1.0;
    if (v5)
    {
      objc_msgSend(v5, "floatValue");
      v8 = 1.0 / v9;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v7 = (float)objc_msgSend(v10, "unsignedShortValue") * 0.00024414;
    v11 = v8 * v7;

  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v11 = 1.0;
  }

  return v11;
}

+ (float)adjustedGainMapHeadroomForStyle:(id)a3 originalHeadroom:(float)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;

  v5 = a3;
  objc_msgSend(v5, "castType");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6 == CFSTR("LongGray"))
  {
    a4 = 1.0;
  }
  else
  {
    objc_msgSend(v5, "castType");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v7 == CFSTR("StarkBW"))
      a4 = a4 * 0.5;
  }

  return a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleEngineProcessor, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end
