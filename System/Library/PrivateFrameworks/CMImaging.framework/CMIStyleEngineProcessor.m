@implementation CMIStyleEngineProcessor

+ (unint64_t)APIVersion
{
  return 20240629;
}

- (MTLCommandQueue)metalCommandQueue
{
  return -[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
}

- (void)setMetalCommandQueue:(id)a3
{
  -[FigMetalContext setCommandQueue:](self->_metalContext, "setCommandQueue:", a3);
}

- (CMIStyleEngineProcessor)initWithOptionalMetalCommandQueue:(id)a3
{
  return -[CMIStyleEngineProcessor initWithOptionalMetalCommandQueue:withCoefficientSynchronization:](self, "initWithOptionalMetalCommandQueue:withCoefficientSynchronization:", a3, 0);
}

- (CMIStyleEngineProcessor)initWithOptionalMetalCommandQueue:(id)a3 withCoefficientSynchronization:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CMIStyleEngineProcessor *v7;
  FigMetalContext *v8;
  void *v9;
  uint64_t v10;
  FigMetalContext *metalContext;
  FigMetalContext *v12;
  CMIMetalResourceCache *v13;
  void *v14;
  uint64_t v15;
  CMIMetalResourceCache *textureCache;
  void *v17;
  int v18;
  uint64_t v19;
  CMIMetalEventSynchronizer *metalSynchronizer;
  CMIStyleEngineProcessor *v21;
  objc_super v23;
  uint64_t v24;
  _QWORD v25[2];

  v4 = a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CMIStyleEngineProcessor;
  v7 = -[CMIStyleEngineProcessor init](&v23, sel_init);
  if (!v7)
    goto LABEL_9;
  v8 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v8, "initWithbundle:andOptionalCommandQueue:", v9, v6);
  metalContext = v7->_metalContext;
  v7->_metalContext = (FigMetalContext *)v10;

  v12 = v7->_metalContext;
  if (!v12)
    goto LABEL_9;
  -[FigMetalContext setAllowCommandBufferCommitsOnlyByForceCommit:](v12, "setAllowCommandBufferCommitsOnlyByForceCommit:", 1);
  v13 = [CMIMetalResourceCache alloc];
  -[FigMetalContext device](v7->_metalContext, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CMIMetalResourceCache initWithMetalDevice:](v13, "initWithMetalDevice:", v14);
  textureCache = v7->_textureCache;
  v7->_textureCache = (CMIMetalResourceCache *)v15;

  if (!v7->_textureCache)
    goto LABEL_9;
  v24 = *MEMORY[0x1E0CA8F38];
  v25[0] = &unk_1E9513F18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  -[FigMetalContext device](v7->_metalContext, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CVMetalBufferCacheCreate();

  if (v18)
    goto LABEL_9;
  v7->_memoryAllocationType = 0;
  if (!v4
    || (+[CMIMetalEventSynchronizer getSharedInstance](CMIMetalEventSynchronizer, "getSharedInstance"),
        v19 = objc_claimAutoreleasedReturnValue(),
        metalSynchronizer = v7->_metalSynchronizer,
        v7->_metalSynchronizer = (CMIMetalEventSynchronizer *)v19,
        metalSynchronizer,
        v7->_metalSynchronizer))
  {
    LODWORD(v7[1].super.isa) = 1065353216;
    HIDWORD(v7[1]._imageSize.width) = 1065353216;
    v21 = v7;
  }
  else
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
  }

  return v21;
}

- (unsigned)_linearSystemNumberOfPolynomials
{
  unint64_t v2;
  unsigned int v3;

  v2 = -[CMIStyleEngineConfiguration linearSystemOrder](self->_configuration, "linearSystemOrder");
  if (v2 == 2)
    v3 = 7;
  else
    v3 = 4;
  if (v2 == 1)
    return 10;
  else
    return v3;
}

- (unsigned)_linearSystemNumberOfExpansionTerms
{
  if (-[CMIStyleEngineConfiguration linearSystemOrder](self->_configuration, "linearSystemOrder") - 1 >= 2)
    return 2;
  else
    return 3;
}

- (unsigned)_linearSystemCount
{
  unint64_t v3;

  v3 = -[CMIStyleEngineConfiguration linearSystemType](self->_configuration, "linearSystemType");
  if (v3 == 2)
    return vmul_lane_s32(*(int32x2_t *)self->_spotlightCount, *(int32x2_t *)self->_spotlightCount, 1).u32[0]
         * self->_weightPlaneCount;
  if (v3 == 1)
    return vmul_lane_s32(*(int32x2_t *)self->_spotlightCount, *(int32x2_t *)self->_spotlightCount, 1).u32[0];
  return v3 == 0;
}

- (unsigned)_spatialAverageLinearSystemCount
{
  return -[CMIStyleEngineProcessor _linearSystemCount](self, "_linearSystemCount")
       / vmul_lane_s32(*(int32x2_t *)self->_spotlightCount, *(int32x2_t *)self->_spotlightCount, 1).u32[0];
}

- (unsigned)_independentPlusSpatialAverageLinearSystemCount
{
  unsigned int v3;
  unsigned int v4;

  v3 = -[CMIStyleEngineProcessor _linearSystemCount](self, "_linearSystemCount");
  v4 = -[CMIStyleEngineConfiguration createAndSolveGlobalLinearSystem](self->_configuration, "createAndSolveGlobalLinearSystem");
  if (v4)
    v4 = -[CMIStyleEngineProcessor _spatialAverageLinearSystemCount](self, "_spatialAverageLinearSystemCount");
  return v4 + v3;
}

- (unsigned)_linearSystemSize
{
  unint64_t v3;
  unsigned int weightPlaneCount;

  v3 = -[CMIStyleEngineConfiguration linearSystemType](self->_configuration, "linearSystemType");
  if (v3 == 2)
  {
    weightPlaneCount = 1;
  }
  else if (v3 == 1)
  {
    weightPlaneCount = self->_weightPlaneCount;
  }
  else if (v3)
  {
    weightPlaneCount = 0;
  }
  else
  {
    weightPlaneCount = *(_QWORD *)self->_spotlightCount
                     * self->_weightPlaneCount
                     * HIDWORD(*(_QWORD *)self->_spotlightCount);
  }
  return -[CMIStyleEngineProcessor _linearSystemNumberOfPolynomials](self, "_linearSystemNumberOfPolynomials")
       * weightPlaneCount;
}

- (int)_createMetalStages
{
  CMIStyleEngineDownScaler *v3;
  CMIStyleEngineDownScaler *downScale;
  CMIStyleEngineIdentityCoefficientCreator *v5;
  CMIStyleEngineIdentityCoefficientCreator *identityCoefficientCreator;
  CMIStyleEngineCreateWeightPlanes *v7;
  CMIStyleEngineCreateWeightPlanes *createWeightPlanes;
  CMIStyleEngineCreateSpotlights *v9;
  CMIStyleEngineCreateSpotlights *createSpotlights;
  CMIStyleEngineCreateLinearSystem *v11;
  CMIStyleEngineCreateLinearSystem *createLinearSystem;
  CMIStyleEngineSolveLinearSystem *v13;
  CMIStyleEngineSolveLinearSystem *solveLinearSystem;
  CMIStyleEngineCoefficientConverterF16ToF32 *v15;
  CMIStyleEngineCoefficientConverterF16ToF32 *coefficientConverterF16ToF32;
  CMIStyleEngineCoefficientConverterF32ToF16 *v17;
  CMIStyleEngineCoefficientConverterF32ToF16 *coefficientConverterF32ToF16;
  CMIStyleEngineIntegrateCoefficients *v19;
  CMIStyleEngineIntegrateCoefficients *integrateCoefficients;
  CMIStyleEngineApplyStyle *v21;
  CMIStyleEngineApplyStyle *applyStyle;

  v3 = -[CMIStyleEngineDownScaler initWithMetalContext:]([CMIStyleEngineDownScaler alloc], "initWithMetalContext:", self->_metalContext);
  downScale = self->_downScale;
  self->_downScale = v3;

  if (self->_downScale)
  {
    v5 = -[CMIStyleEngineIdentityCoefficientCreator initWithMetalContext:]([CMIStyleEngineIdentityCoefficientCreator alloc], "initWithMetalContext:", self->_metalContext);
    identityCoefficientCreator = self->_identityCoefficientCreator;
    self->_identityCoefficientCreator = v5;

    if (self->_identityCoefficientCreator)
    {
      v7 = -[CMIStyleEngineCreateWeightPlanes initWithMetalContext:]([CMIStyleEngineCreateWeightPlanes alloc], "initWithMetalContext:", self->_metalContext);
      createWeightPlanes = self->_createWeightPlanes;
      self->_createWeightPlanes = v7;

      if (self->_createWeightPlanes)
      {
        v9 = -[CMIStyleEngineCreateSpotlights initWithMetalContext:spotlightCount:]([CMIStyleEngineCreateSpotlights alloc], "initWithMetalContext:spotlightCount:", self->_metalContext, *(double *)self->_spotlightCount);
        createSpotlights = self->_createSpotlights;
        self->_createSpotlights = v9;

        if (self->_createSpotlights)
        {
          v11 = -[CMIStyleEngineCreateLinearSystem initWithMetalContext:polynomialCount:systemCount:systemSize:weightPlaneCount:spotlightCount:]([CMIStyleEngineCreateLinearSystem alloc], "initWithMetalContext:polynomialCount:systemCount:systemSize:weightPlaneCount:spotlightCount:", self->_metalContext, -[CMIStyleEngineProcessor _linearSystemNumberOfPolynomials](self, "_linearSystemNumberOfPolynomials"), -[CMIStyleEngineProcessor _linearSystemCount](self, "_linearSystemCount"), -[CMIStyleEngineProcessor _linearSystemSize](self, "_linearSystemSize")/ -[CMIStyleEngineProcessor _linearSystemNumberOfPolynomials](self, "_linearSystemNumberOfPolynomials"), self->_weightPlaneCount, *(double *)self->_spotlightCount);
          createLinearSystem = self->_createLinearSystem;
          self->_createLinearSystem = v11;

          if (self->_createLinearSystem)
          {
            +[CMIStyleEngineSolveLinearSystem createWithMetalContext:systemCount:lhsSize:rhsSize:solverType:](CMIStyleEngineSolveLinearSystem, "createWithMetalContext:systemCount:lhsSize:rhsSize:solverType:", self->_metalContext, -[CMIStyleEngineProcessor _independentPlusSpatialAverageLinearSystemCount](self, "_independentPlusSpatialAverageLinearSystemCount"), -[CMIStyleEngineProcessor _linearSystemSize](self, "_linearSystemSize"), 3, -[CMIStyleEngineConfiguration linearSystemSolver](self->_configuration, "linearSystemSolver"));
            v13 = (CMIStyleEngineSolveLinearSystem *)objc_claimAutoreleasedReturnValue();
            solveLinearSystem = self->_solveLinearSystem;
            self->_solveLinearSystem = v13;

            if (self->_solveLinearSystem)
            {
              v15 = -[CMIStyleEngineCoefficientConverter initWithMetalContext:]([CMIStyleEngineCoefficientConverterF16ToF32 alloc], "initWithMetalContext:", self->_metalContext);
              coefficientConverterF16ToF32 = self->_coefficientConverterF16ToF32;
              self->_coefficientConverterF16ToF32 = v15;

              if (self->_coefficientConverterF16ToF32)
              {
                v17 = -[CMIStyleEngineCoefficientConverter initWithMetalContext:]([CMIStyleEngineCoefficientConverterF32ToF16 alloc], "initWithMetalContext:", self->_metalContext);
                coefficientConverterF32ToF16 = self->_coefficientConverterF32ToF16;
                self->_coefficientConverterF32ToF16 = v17;

                if (self->_coefficientConverterF32ToF16)
                {
                  v19 = -[CMIStyleEngineIntegrateCoefficients initWithMetalContext:]([CMIStyleEngineIntegrateCoefficients alloc], "initWithMetalContext:", self->_metalContext);
                  integrateCoefficients = self->_integrateCoefficients;
                  self->_integrateCoefficients = v19;

                  if (self->_integrateCoefficients)
                  {
                    v21 = -[CMIStyleEngineApplyStyle initWithMetalContext:]([CMIStyleEngineApplyStyle alloc], "initWithMetalContext:", self->_metalContext);
                    applyStyle = self->_applyStyle;
                    self->_applyStyle = v21;

                    if (self->_applyStyle)
                      return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_bindPixelBufferToTexture:(__CVBuffer *)a3 usage:(unint64_t)a4 texturePtr:(id *)a5
{
  return -[CMIStyleEngineProcessor _bindPixelBufferToTexture:usage:texturePtr:plane:](self, "_bindPixelBufferToTexture:usage:texturePtr:plane:", a3, a4, a5, 0);
}

- (int)_bindPixelBufferToTexture:(__CVBuffer *)a3 usage:(unint64_t)a4 texturePtr:(id *)a5 plane:(unsigned int)a6
{
  uint64_t v6;
  unint64_t v11;
  void *v12;
  id v13;

  v6 = *(_QWORD *)&a6;
  v11 = +[CMIStyleEngineProcessorUtilities getMTLPixelFormatForCVPixelBuffer:plane:](CMIStyleEngineProcessorUtilities, "getMTLPixelFormatForCVPixelBuffer:plane:", a3, *(_QWORD *)&a6);
  if (v11)
  {
    -[CMIMetalResourceCache getTextureFromPixelBuffer:planeIndex:pixelFormat:usage:](self->_textureCache, "getTextureFromPixelBuffer:planeIndex:pixelFormat:usage:", a3, v6, v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *a5;
    *a5 = v12;

    if (*a5)
      return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_bindYUV420PixelBufferToTextures:(__CVBuffer *)a3 usage:(unint64_t)a4 lumaTexturePtr:(id *)a5 chromaTexturePtr:(id *)a6
{
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  void **v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v11 = +[CMIStyleEngineProcessorUtilities getMTLPixelFormatsForDualPlaneYUV420CVPixelBuffer:](CMIStyleEngineProcessorUtilities, "getMTLPixelFormatsForDualPlaneYUV420CVPixelBuffer:");
  if (v11)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    v14 = 0;
    v22[0] = a5;
    v22[1] = a6;
    v15 = 1;
    v21[0] = v11;
    v21[1] = v12;
    while (1)
    {
      v16 = v15;
      -[CMIMetalResourceCache getTextureFromPixelBuffer:planeIndex:pixelFormat:usage:](self->_textureCache, "getTextureFromPixelBuffer:planeIndex:pixelFormat:usage:", a3, v14, v21[v14], a4);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void **)v22[v14];
      v19 = *v18;
      *v18 = (void *)v17;

      if (!*v18)
        break;
      v15 = 0;
      v14 = 1;
      if ((v16 & 1) == 0)
        return 0;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return FigSignalErrorAt();
}

- (InternalIOTextures)_bindAllInternalIOTextures:(SEL)a3
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  uint64_t i;
  InternalIOTextures *result;
  _QWORD v14[72];

  v14[70] = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var16 = 0u;
  *(_OWORD *)&retstr->var18 = 0u;
  *(_OWORD *)&retstr->var20 = 0u;
  *(_OWORD *)&retstr->var14 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *a4 = 0;
  v14[0] = objc_loadWeakRetained((id *)&self->_apiInputTexture);
  v14[1] = &retstr->var4;
  v14[2] = self->_inputPixelBuffer;
  v14[3] = 1;
  v14[4] = "input";
  v14[5] = objc_loadWeakRetained((id *)&self->_apiOutputTexture);
  v14[6] = &retstr->var5;
  v14[7] = self->_outputPixelBuffer;
  v14[8] = 65543;
  v14[9] = "output";
  v14[10] = objc_loadWeakRetained((id *)&self->_apiInputThumbnailTexture);
  v14[11] = &retstr->var6;
  v14[12] = self->_inputThumbnailPixelBuffer;
  v14[13] = 1;
  v14[14] = "input thumbnail";
  v14[15] = objc_loadWeakRetained((id *)&self->_apiInputThumbnailTextureForLearning);
  v14[16] = &retstr->var7;
  v14[17] = self->_inputThumbnailPixelBufferForLearning;
  v14[18] = 1;
  v14[19] = "input thumbnail for learning";
  v14[20] = objc_loadWeakRetained((id *)&self->_apiInputThumbnailTextureForLearningWeights);
  v14[21] = &retstr->var8;
  v14[22] = self->_inputThumbnailPixelBufferForLearningWeights;
  v14[23] = 1;
  v14[24] = "input thumbnail for learning weights";
  v14[25] = objc_loadWeakRetained((id *)&self->_apiInputThumbnailTextureForIntegration);
  v14[26] = &retstr->var9;
  v14[27] = self->_inputThumbnailPixelBufferForIntegration;
  v14[28] = 1;
  v14[29] = "input thumbnail for integration";
  v14[30] = objc_loadWeakRetained((id *)&self->_apiInputThumbnailTextureForResidualCorrection);
  v14[31] = &retstr->var10;
  v14[32] = self->_inputThumbnailPixelBufferForResidualCorrection;
  v14[33] = 1;
  v14[34] = "input thumbnail for residual correction";
  v14[35] = objc_loadWeakRetained((id *)&self->_apiTargetThumbnailTexture);
  v14[36] = &retstr->var11;
  v14[37] = self->_targetThumbnailPixelBuffer;
  v14[38] = 1;
  v14[39] = "target thumbnail";
  v14[40] = objc_loadWeakRetained((id *)&self->_apiTargetThumbnailTextureForLearning);
  v14[41] = &retstr->var12;
  v14[42] = self->_targetThumbnailPixelBufferForLearning;
  v14[43] = 1;
  v14[44] = "target thumbnail for learning";
  v14[45] = objc_loadWeakRetained((id *)&self->_apiTargetThumbnailTextureForResidualCorrection);
  v14[46] = &retstr->var13;
  v14[47] = self->_targetThumbnailPixelBufferForResidualCorrection;
  v14[48] = 1;
  v14[49] = "target thumbnail for residual correction";
  v14[50] = objc_loadWeakRetained((id *)&self->_apiInputOriginalTexture);
  v14[51] = &retstr->var14;
  v14[52] = self->_inputOriginalPixelBuffer;
  v14[53] = 1;
  v14[54] = "input original";
  v14[55] = objc_loadWeakRetained((id *)&self->_apiInputDeltaMapTexture);
  v14[56] = &retstr->var17;
  v14[57] = self->_inputDeltaMapPixelBuffer;
  v14[58] = 1;
  v14[59] = "input delta map";
  v14[60] = objc_loadWeakRetained((id *)&self->_apiOutputDeltaMapTexture);
  v14[61] = &retstr->var20;
  v14[62] = self->_outputDeltaMapPixelBuffer;
  v14[63] = 65543;
  v14[64] = "output delta map";
  v7 = 0;
  v14[65] = objc_loadWeakRetained((id *)&self->_apiOutputLumaGradientTexture);
  v14[66] = &retstr->var21;
  v14[67] = self->_outputLumaGradientPixelBuffer;
  v14[68] = 65543;
  v14[69] = "output luma gradient";
  while (1)
  {
    v8 = (void *)v14[v7];
    v9 = v8;
    v10 = v9;
    if (!v14[v7 + 2])
    {
      objc_storeStrong((id *)v14[v7 + 1], v8);
      goto LABEL_7;
    }
    if (v9)
      break;
    v11 = -[CMIStyleEngineProcessor _bindPixelBufferToTexture:usage:texturePtr:](self, "_bindPixelBufferToTexture:usage:texturePtr:");
    *a4 = v11;
    if (v11)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_10;
    }
LABEL_7:
    v7 += 5;

    if (v7 == 70)
      goto LABEL_11;
  }
  *a4 = 4;
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_10:

LABEL_11:
  for (i = 65; i != -5; i -= 5)

  return result;
}

- (int)_bindAllInternalYUVTextures:(InternalIOTextures *)a3
{
  __CVBuffer *inputPixelBuffer;
  IOSurfaceRef IOSurface;
  IOSurfaceRef v7;
  __CVBuffer *v8;
  _BOOL4 v9;
  int v10;
  uint64_t v11;
  CGSize size;
  CGSize v13;
  CGPoint v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  int result;
  int v25;
  _QWORD v26[5];
  CGPoint origin;
  CGSize v28;
  id *p_var18;
  id *p_var19;
  __CVBuffer *inputDeltaMapPixelBuffer;
  uint64_t v32;
  CGPoint v33;
  CGSize v34;
  id *p_var15;
  id *p_var16;
  __CVBuffer *inputOriginalPixelBuffer;
  uint64_t v38;
  CGPoint v39;
  CGSize v40;
  uint64_t v41;
  CGRect v42;

  v41 = *MEMORY[0x1E0C80C00];
  inputPixelBuffer = self->_inputPixelBuffer;
  if (inputPixelBuffer)
  {
    IOSurface = CVPixelBufferGetIOSurface(inputPixelBuffer);
    v7 = CVPixelBufferGetIOSurface(self->_outputPixelBuffer);
    v8 = self->_inputPixelBuffer;
    if (IOSurface == v7)
    {
      v9 = +[CMIStyleEngineProcessorUtilities isPixelBufferYUV420:](CMIStyleEngineProcessorUtilities, "isPixelBufferYUV420:", v8);
      v8 = self->_inputPixelBuffer;
      if (v9)
      {
        v10 = -[CMIStyleEngineProcessor _bindYUV420PixelBufferToTextures:usage:lumaTexturePtr:chromaTexturePtr:](self, "_bindYUV420PixelBufferToTextures:usage:lumaTexturePtr:chromaTexturePtr:", v8, 65543, a3, &a3->var1);
        if (v10)
        {
          v25 = v10;
          fig_log_get_emitter();
          FigDebugAssert3();
          return v25;
        }
        objc_storeStrong(&a3->var2, a3->var0);
        objc_storeStrong(&a3->var3, a3->var1);
        v8 = self->_inputPixelBuffer;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  v11 = 0;
  size = self->_inputImageRect.size;
  origin = self->_inputImageRect.origin;
  v28 = size;
  v13 = self->_optionalInputImageRect.size;
  v33 = self->_optionalInputImageRect.origin;
  v34 = v13;
  v14 = self->_optionalInputImageRect.origin;
  v40 = self->_optionalInputImageRect.size;
  v26[0] = a3;
  v26[1] = &a3->var1;
  v26[2] = v8;
  v26[3] = 1;
  p_var18 = &a3->var18;
  p_var19 = &a3->var19;
  inputDeltaMapPixelBuffer = self->_inputDeltaMapPixelBuffer;
  v32 = 1;
  p_var15 = &a3->var15;
  p_var16 = &a3->var16;
  inputOriginalPixelBuffer = self->_inputOriginalPixelBuffer;
  v38 = 1;
  v39 = v14;
  while (1)
  {
    v15 = (double *)&v26[v11];
    v16 = v26[v11 + 2];
    if (v16)
    {
      v18 = *v15;
      v17 = *((_QWORD *)v15 + 1);
      v19 = *((_QWORD *)v15 + 3);
      v21 = v15[5];
      v20 = v15[6];
      v23 = v15[7];
      v22 = v15[8];
      if (+[CMIStyleEngineProcessorUtilities isPixelBufferYUV420:](CMIStyleEngineProcessorUtilities, "isPixelBufferYUV420:", v26[v11 + 2]))
      {
        v42.origin.x = v21;
        v42.origin.y = v20;
        v42.size.width = v23;
        v42.size.height = v22;
        if (!CGRectEqualToRect(self->_regionToRender, v42))
        {
          result = -[CMIStyleEngineProcessor _bindYUV420PixelBufferToTextures:usage:lumaTexturePtr:chromaTexturePtr:](self, "_bindYUV420PixelBufferToTextures:usage:lumaTexturePtr:chromaTexturePtr:", v16, v19, *(_QWORD *)&v18, v17);
          if (result)
            break;
        }
      }
    }
    v11 += 9;
    if (v11 == 27)
      return 0;
  }
  return result;
}

- (int)_bindTexture:(id)a3 toBuffer:(id *)a4
{
  FigMetalContext *metalContext;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;

  metalContext = self->_metalContext;
  v6 = a3;
  -[FigMetalContext device](metalContext, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "iosurface");

  v9 = (void *)objc_msgSend(v7, "newBufferWithIOSurface:", v8);
  if (!v9 || (IOSurfaceGetBytesPerRow((IOSurfaceRef)objc_msgSend(v9, "iosurface")) & 0x3F) != 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = FigSignalErrorAt();
  }
  else
  {
    objc_storeStrong(a4, v9);
    v10 = 0;
  }

  return v10;
}

- (int)_bindPixelBuffer:(__CVBuffer *)a3 toBuffer:(id *)a4
{
  void *v5;
  id v6;

  if (!CVMetalBufferCacheCreateBufferFromImage())
  {
    CVMetalBufferGetBuffer();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *a4;
    *a4 = v5;

    if (*a4)
    {
      if ((IOSurfaceGetBytesPerRow((IOSurfaceRef)objc_msgSend(*a4, "iosurface")) & 0x3F) == 0)
        return 0;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (InternalIOBuffers)_bindAllInternalIOBuffers:(int *)a3
{
  id WeakRetained;
  uint64_t v6;
  char v7;
  char v8;
  id *v9;
  id v10;
  id v11;
  id *v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[11];
  InternalIOBuffers result;

  v22[10] = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = 0;
  *a3 = 0;
  v22[0] = objc_loadWeakRetained((id *)&self->_apiInputLinearSystemCoefficientsBuffer);
  v22[1] = &v20;
  v22[2] = objc_loadWeakRetained((id *)&self->_inputLinearSystemCoefficientsTexture);
  v22[3] = self->_inputLinearSystemCoefficientsPixelBuffer;
  v22[4] = "input coefficients";
  v22[5] = objc_loadWeakRetained((id *)&self->_apiOutputLinearSystemCoefficientsBuffer);
  v22[6] = &v21;
  WeakRetained = objc_loadWeakRetained((id *)&self->_outputLinearSystemCoefficientsTexture);
  v6 = 0;
  v22[7] = WeakRetained;
  v22[8] = self->_outputLinearSystemCoefficientsPixelBuffer;
  v22[9] = "output coefficients";
  v7 = 1;
  while (1)
  {
    v8 = v7;
    v9 = (id *)&v22[5 * v6];
    v10 = *v9;
    v11 = *v9;
    v12 = (id *)v9[1];
    v13 = v9[2];
    v14 = v13;
    if (!v9[3])
      break;
    if (v11)
      goto LABEL_16;
    if (v13)
    {
      *a3 = 4;
      fig_log_get_emitter();
      FigDebugAssert3();
      v11 = 0;
      goto LABEL_17;
    }
    v15 = -[CMIStyleEngineProcessor _bindPixelBuffer:toBuffer:](self, "_bindPixelBuffer:toBuffer:");
    *a3 = v15;
    if (v15)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v11 = 0;
      v14 = 0;
      goto LABEL_17;
    }
LABEL_12:

    v7 = 0;
    v6 = 1;
    if ((v8 & 1) == 0)
      goto LABEL_18;
  }
  if (!v13)
  {
    objc_storeStrong(v12, v10);
    goto LABEL_12;
  }
  if (!v11)
  {
    v16 = -[CMIStyleEngineProcessor _bindTexture:toBuffer:](self, "_bindTexture:toBuffer:", v13, v12);
    *a3 = v16;
    if (v16)
    {
      fig_log_get_emitter();
      v11 = 0;
      FigDebugAssert3();
      goto LABEL_17;
    }
    goto LABEL_12;
  }
LABEL_16:
  *a3 = 4;
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_17:

LABEL_18:
  for (i = 0; i != -10; i -= 5)
  {

  }
  v18 = v20;
  v19 = v21;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

- (int)_checkIOTexturePair:(InternalIOTextures *)a3
{
  id var5;
  id var20;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  if (!a3->var4)
    goto LABEL_13;
  var5 = a3->var5;
  var20 = a3->var20;
  if ((var20 != 0) != (var5 == 0))
    goto LABEL_13;
  if (!a3->var14)
  {
    if (!var20)
      goto LABEL_5;
LABEL_13:
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  if (a3->var17)
    goto LABEL_13;
LABEL_5:
  if (!a3->var21)
    return 0;
  if (!var5)
    var5 = a3->var20;
  v6 = var5;
  v7 = objc_msgSend(a3->var21, "width");
  if (v7 == objc_msgSend(v6, "width") && (v8 = objc_msgSend(a3->var21, "height"), v8 == objc_msgSend(v6, "height")))
  {
    v9 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v9 = FigSignalErrorAt();
  }

  return v9;
}

- (int)_checkLearningThumbnailTexturePair:(InternalIOTextures *)a3
{
  id var7;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  var7 = a3->var7;
  if (var7)
  {
    if (a3->var12)
    {
      v6 = (double)(unint64_t)objc_msgSend(var7, "width");
      -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
      if (v7 <= v6)
      {
        v8 = (double)(unint64_t)objc_msgSend(a3->var7, "height");
        -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
        if (v9 <= v8)
        {
          v10 = (double)(unint64_t)objc_msgSend(a3->var12, "width");
          -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
          if (v11 <= v10)
          {
            v12 = (double)(unint64_t)objc_msgSend(a3->var12, "height");
            -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
            if (v13 <= v12)
              return 0;
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_checkLearningWeightThumbnailTexture:(InternalIOTextures *)a3
{
  MTLTexture **p_inputWeightPlaneTexture;
  id WeakRetained;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t weightPlaneCount;

  p_inputWeightPlaneTexture = &self->_inputWeightPlaneTexture;
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputWeightPlaneTexture);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_inputWeightPlaneTexture);
    v8 = objc_msgSend(v7, "width");
    if (v8 == objc_msgSend(a3->var7, "width"))
    {
      v9 = objc_loadWeakRetained((id *)p_inputWeightPlaneTexture);
      v10 = objc_msgSend(v9, "height");
      v11 = objc_msgSend(a3->var7, "height");

      if (v10 != v11)
        goto LABEL_9;
      v12 = objc_loadWeakRetained((id *)p_inputWeightPlaneTexture);
      v13 = objc_msgSend(v12, "arrayLength");
      weightPlaneCount = self->_weightPlaneCount;

      if (v13 != weightPlaneCount)
        goto LABEL_9;
      return 0;
    }

  }
  else if (a3->var8)
  {
    return 0;
  }
LABEL_9:
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_checkIntegrationThumbnailTexture:(InternalIOTextures *)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_inputWeightPlaneTexture);

  if (WeakRetained || a3->var9)
    return 0;
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_checkResidualCorrectionThumbnailTexturePair:(InternalIOTextures *)a3
{
  id var10;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  var10 = a3->var10;
  if (var10)
  {
    if (a3->var13)
    {
      v6 = (double)(unint64_t)objc_msgSend(var10, "width");
      -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
      if (v7 <= v6)
      {
        v8 = (double)(unint64_t)objc_msgSend(a3->var10, "height");
        -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
        if (v9 <= v8)
        {
          v10 = (double)(unint64_t)objc_msgSend(a3->var13, "width");
          -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
          if (v11 <= v10)
          {
            v12 = (double)(unint64_t)objc_msgSend(a3->var13, "height");
            -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
            if (v13 <= v12)
              return 0;
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_checkROISpecification:(InternalIOTextures *)a3
{
  double width;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  CGRect *p_inputImageRect;
  double v13;
  CGFloat v14;
  CGSize size;
  double height;
  id var14;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  CGRect *p_outputImageRect;
  double v29;
  CGFloat v30;
  CGSize v31;
  double v32;
  CGFloat x;
  CGFloat y;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGSize v41;
  int v42;
  CGSize v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  if (self->_apiImageSize.width == *MEMORY[0x1E0C9D820]
    && self->_apiImageSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v7 = objc_msgSend(a3->var4, "width");
    if (v7 <= objc_msgSend(a3->var5, "width"))
      v8 = 40;
    else
      v8 = 32;
    width = (double)(unint64_t)objc_msgSend(*(id *)((char *)&a3->var0 + v8), "width");
    v9 = objc_msgSend(a3->var4, "height");
    if (v9 <= objc_msgSend(a3->var5, "height"))
      v10 = 40;
    else
      v10 = 32;
    v11 = objc_msgSend(*(id *)((char *)&a3->var0 + v10), "height");
    self->_imageSize.width = width;
    self->_imageSize.height = (double)v11;
  }
  else
  {
    self->_imageSize = self->_apiImageSize;
    width = self->_imageSize.width;
  }
  if (width <= 0.0 || self->_imageSize.height <= 0.0)
    goto LABEL_48;
  p_inputImageRect = &self->_inputImageRect;
  if (CGRectIsEmpty(self->_apiInputImageRect))
  {
    v13 = (double)(unint64_t)objc_msgSend(a3->var4, "width");
    v14 = (double)(unint64_t)objc_msgSend(a3->var4, "height");
    p_inputImageRect->origin.x = 0.0;
    self->_inputImageRect.origin.y = 0.0;
    self->_inputImageRect.size.width = v13;
    self->_inputImageRect.size.height = v14;
  }
  else
  {
    size = self->_apiInputImageRect.size;
    p_inputImageRect->origin = self->_apiInputImageRect.origin;
    self->_inputImageRect.size = size;
    v13 = self->_inputImageRect.size.width;
  }
  if (v13 != (double)(unint64_t)objc_msgSend(a3->var4, "width")
    || (height = self->_inputImageRect.size.height, height != (double)(unint64_t)objc_msgSend(a3->var4, "height")))
  {
LABEL_48:
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
LABEL_50:
    v42 = FigSignalErrorAt();
    goto LABEL_46;
  }
  var14 = a3->var14;
  if (var14)
  {
    v18 = var14;
  }
  else
  {
    v18 = a3->var17;
    if (!v18)
    {
      v44 = self->_inputImageRect.size;
      self->_optionalInputImageRect.origin = p_inputImageRect->origin;
      self->_optionalInputImageRect.size = v44;
      goto LABEL_35;
    }
  }
  v19 = 808;
  if (!a3->var14)
    v19 = 776;
  v20 = 816;
  if (!a3->var14)
    v20 = 784;
  v21 = 824;
  if (!a3->var14)
    v21 = 792;
  v22 = 832;
  if (!a3->var14)
    v22 = 800;
  v23 = *(double *)((char *)&self->super.isa + v19);
  v24 = *(double *)((char *)&self->super.isa + v20);
  v25 = *(double *)((char *)&self->super.isa + v21);
  v26 = *(double *)((char *)&self->super.isa + v22);
  v45.origin.x = v23;
  v45.origin.y = v24;
  v45.size.width = v25;
  v45.size.height = v26;
  if (CGRectIsEmpty(v45))
  {
    v25 = (double)(unint64_t)objc_msgSend(v18, "width");
    v26 = (double)(unint64_t)objc_msgSend(v18, "height");
    v23 = 0.0;
    v24 = 0.0;
  }
  self->_optionalInputImageRect.origin.x = v23;
  self->_optionalInputImageRect.origin.y = v24;
  self->_optionalInputImageRect.size.width = v25;
  self->_optionalInputImageRect.size.height = v26;
  if (v25 != (double)(unint64_t)objc_msgSend(v18, "width"))
    goto LABEL_49;
  v27 = self->_optionalInputImageRect.size.height;
  if (v27 != (double)(unint64_t)objc_msgSend(v18, "height"))
    goto LABEL_49;
LABEL_35:
  p_outputImageRect = &self->_outputImageRect;
  if (CGRectIsEmpty(self->_apiOutputImageRect))
  {
    v29 = (double)(unint64_t)objc_msgSend(a3->var5, "width");
    v30 = (double)(unint64_t)objc_msgSend(a3->var5, "height");
    p_outputImageRect->origin.x = 0.0;
    self->_outputImageRect.origin.y = 0.0;
    self->_outputImageRect.size.width = v29;
    self->_outputImageRect.size.height = v30;
  }
  else
  {
    v31 = self->_apiOutputImageRect.size;
    p_outputImageRect->origin = self->_apiOutputImageRect.origin;
    self->_outputImageRect.size = v31;
    v29 = self->_outputImageRect.size.width;
  }
  if (v29 != (double)(unint64_t)objc_msgSend(a3->var5, "width"))
    goto LABEL_49;
  v32 = self->_outputImageRect.size.height;
  if (v32 != (double)(unint64_t)objc_msgSend(a3->var5, "height"))
    goto LABEL_49;
  v46 = CGRectIntersection(self->_inputImageRect, self->_optionalInputImageRect);
  v47 = CGRectIntersection(v46, self->_outputImageRect);
  v50.size.width = self->_imageSize.width;
  v50.size.height = self->_imageSize.height;
  v50.origin.x = 0.0;
  v50.origin.y = 0.0;
  v48 = CGRectIntersection(v47, v50);
  x = v48.origin.x;
  y = v48.origin.y;
  v35 = v48.size.width;
  v36 = v48.size.height;
  if (CGRectIsEmpty(v48))
    goto LABEL_49;
  if (CGRectIsEmpty(self->_apiRegionToRender))
  {
    self->_regionToRender.origin.x = x;
    self->_regionToRender.origin.y = y;
    v37 = x;
    v38 = y;
    v39 = v35;
    v40 = v36;
    self->_regionToRender.size.width = v35;
    self->_regionToRender.size.height = v36;
  }
  else
  {
    v41 = self->_apiRegionToRender.size;
    self->_regionToRender.origin = self->_apiRegionToRender.origin;
    self->_regionToRender.size = v41;
    v37 = self->_regionToRender.origin.x;
    v38 = self->_regionToRender.origin.y;
    v39 = self->_regionToRender.size.width;
    v40 = self->_regionToRender.size.height;
  }
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = v35;
  v49.size.height = v36;
  if (!CGRectContainsRect(v49, *(CGRect *)&v37))
  {
LABEL_49:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_50;
  }
  v42 = 0;
LABEL_46:

  return v42;
}

- (BOOL)_applyResidualCorrection
{
  float v3;

  -[CMIStyleEngineApplyStyle residualScaleFactor](self->_applyStyle, "residualScaleFactor");
  return v3 > 0.0 && !self->_residualsCalculationDisabled;
}

- (int)_checkConfigurationForTexture:(InternalIOTextures *)a3 buffers:(InternalIOBuffers *)a4
{
  __CVBuffer *inputLinearSystemCoefficientsPixelBuffer;
  id WeakRetained;
  id v9;
  __CVBuffer *outputLinearSystemCoefficientsPixelBuffer;
  id v11;
  id v12;
  id var6;
  id *p_var6;
  id var7;
  id *p_var7;
  id var8;
  id var9;
  id var10;
  id var12;
  id var13;
  int v22;
  id var5;
  int v24;

  if (-[CMIStyleEngineConfiguration inputCoefficientsF16](self->_configuration, "inputCoefficientsF16")
    || (inputLinearSystemCoefficientsPixelBuffer = self->_inputLinearSystemCoefficientsPixelBuffer) != 0
    && CVPixelBufferGetPixelFormatType(inputLinearSystemCoefficientsPixelBuffer) == 1278226536)
  {
    self->_inputCoefficientsF16 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_inputLinearSystemCoefficientsTexture);
    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained((id *)&self->_inputLinearSystemCoefficientsTexture);
      self->_inputCoefficientsF16 = objc_msgSend(v9, "pixelFormat") == 25;

    }
    else
    {
      self->_inputCoefficientsF16 = 0;
    }

  }
  if (-[CMIStyleEngineConfiguration outputCoefficientsF16](self->_configuration, "outputCoefficientsF16")
    || (outputLinearSystemCoefficientsPixelBuffer = self->_outputLinearSystemCoefficientsPixelBuffer) != 0
    && CVPixelBufferGetPixelFormatType(outputLinearSystemCoefficientsPixelBuffer) == 1278226536)
  {
    self->_outputCoefficientsF16 = 1;
  }
  else
  {
    v11 = objc_loadWeakRetained((id *)&self->_outputLinearSystemCoefficientsTexture);
    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)&self->_outputLinearSystemCoefficientsTexture);
      self->_outputCoefficientsF16 = objc_msgSend(v12, "pixelFormat") == 25;

    }
    else
    {
      self->_outputCoefficientsF16 = 0;
    }

  }
  p_var6 = &a3->var6;
  var6 = a3->var6;
  if (!var6)
    var6 = a3->var4;
  objc_storeStrong(&a3->var6, var6);
  p_var7 = &a3->var7;
  var7 = a3->var7;
  if (!var7)
    var7 = *p_var6;
  objc_storeStrong(&a3->var7, var7);
  var8 = a3->var8;
  if (!var8)
  {
    var8 = *p_var7;
    if (!*p_var7)
      var8 = *p_var6;
  }
  objc_storeStrong(&a3->var8, var8);
  var9 = a3->var9;
  if (!var9)
    var9 = *p_var6;
  objc_storeStrong(&a3->var9, var9);
  var10 = a3->var10;
  if (!var10)
    var10 = *p_var6;
  objc_storeStrong(&a3->var10, var10);
  var12 = a3->var12;
  if (!var12)
    var12 = a3->var11;
  objc_storeStrong(&a3->var12, var12);
  var13 = a3->var13;
  if (!var13)
    var13 = a3->var11;
  objc_storeStrong(&a3->var13, var13);
  if (self->_performLearning)
  {
    v22 = -[CMIStyleEngineProcessor _checkLearningThumbnailTexturePair:](self, "_checkLearningThumbnailTexturePair:", a3);
    if (v22)
      goto LABEL_50;
    v22 = -[CMIStyleEngineProcessor _checkLearningWeightThumbnailTexture:](self, "_checkLearningWeightThumbnailTexture:", a3);
    if (v22)
      goto LABEL_50;
    goto LABEL_38;
  }
  if (a4->var0 || self->_inputLinearSystemCoefficients)
  {
LABEL_38:
    if (!self->_performIntegration
      || (v22 = -[CMIStyleEngineProcessor _checkIntegrationThumbnailTexture:](self, "_checkIntegrationThumbnailTexture:", a3)) == 0)
    {
      if (!self->_performApplication)
        return 0;
      v22 = -[CMIStyleEngineProcessor _checkIOTexturePair:](self, "_checkIOTexturePair:", a3);
      if (v22)
        goto LABEL_50;
      var5 = a3->var5;
      if (!var5)
        var5 = a3->var20;
      objc_storeStrong(&a3->var5, var5);
      v22 = -[CMIStyleEngineProcessor _checkROISpecification:](self, "_checkROISpecification:", a3);
      if (v22)
        goto LABEL_50;
      if (!-[CMIStyleEngineProcessor _applyResidualCorrection](self, "_applyResidualCorrection"))
        return 0;
      v24 = -[CMIStyleEngineProcessor _checkResidualCorrectionThumbnailTexturePair:](self, "_checkResidualCorrectionThumbnailTexturePair:", a3);
      if (v24)
      {
        fig_log_get_emitter();
LABEL_51:
        FigDebugAssert3();
      }
      return v24;
    }
LABEL_50:
    v24 = v22;
    fig_log_get_emitter();
    goto LABEL_51;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (BOOL)supportsExternalMemoryResource
{
  return 1;
}

- (unint64_t)_requiredMetalHeapMemory:(unsigned int)a3
{
  CMIStyleEngineConfiguration *configuration;
  double v6;
  double v7;
  unsigned int v8;
  unsigned int v9;
  _BOOL4 v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  BOOL v14;
  BOOL v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t result;

  configuration = self->_configuration;
  if (!configuration)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  -[CMIStyleEngineConfiguration thumbnailSize](configuration, "thumbnailSize");
  v10 = v6 <= 128.0
     && (-[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize"), v7 <= 96.0)
     && (-[CMIStyleEngineConfiguration spotlightCount](self->_configuration, "spotlightCount"), v8 <= 8)
     && (-[CMIStyleEngineConfiguration spotlightCount](self->_configuration, "spotlightCount"), v9 <= 6)
     && -[CMIStyleEngineConfiguration weightPlaneCount](self->_configuration, "weightPlaneCount") <= 8
     && -[CMIStyleEngineConfiguration linearSystemOrder](self->_configuration, "linearSystemOrder") == 0;
  if (self->_useLiveMetalAllocations)
  {
    if (v10)
    {
      v11 = 471040;
      if ((a3 & 4) == 0)
        v11 = 361472;
      v12 = (a3 & 1) == 0;
      v13 = 3750912;
    }
    else
    {
      v11 = 1703936;
      if ((a3 & 4) == 0)
        v11 = 1180672;
      v12 = (a3 & 1) == 0;
      v13 = 30195712;
    }
    if (v12)
      result = v11;
    else
      result = v13;
    if ((a3 & 7) == 0)
      return 0;
  }
  else
  {
    v14 = (a3 & 7) != 0;
    v15 = (~a3 & 3) == 0 || (a3 & 5) == 5;
    v16 = v15;
    if (v15)
      v14 = 1;
    if (v10)
    {
      v17 = 785408;
      if ((a3 & 1) != 0)
        v17 = 3770368;
      if ((a3 & 5) == 0)
        v17 = 674816;
      v18 = 4065280;
    }
    else
    {
      v17 = 4954112;
      if ((a3 & 1) != 0)
        v17 = 30300160;
      if ((a3 & 5) == 0)
        v17 = 4429824;
      v18 = 33445888;
    }
    if (v16)
      result = v18;
    else
      result = v17;
    if (!v14)
      return 0;
  }
  return result;
}

- (id)externalMemoryDescriptorForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "processorSpecificOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProcessingType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  if (!(_DWORD)v8)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_5;
  }
  v9 = -[CMIStyleEngineProcessor _requiredMetalHeapMemory:](self, "_requiredMetalHeapMemory:", v8);
  if (!v9)
  {
LABEL_6:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_7;
  }
  objc_msgSend(v5, "setMemSize:", v9);
  objc_msgSend(v5, "setAllocatorType:", 2);
  v10 = v5;
LABEL_5:

  return v10;
}

- (int)setup
{
  FigMetalAllocator *v3;
  void *v4;
  FigMetalAllocator *v5;
  void *v6;
  void *v7;
  FigMetalTextureDescriptor *v8;
  FigMetalTextureDescriptor *textureDescriptor;
  void *v10;
  FigMetalBufferDescriptor *v11;
  FigMetalBufferDescriptor *bufferDescriptor;
  CMIStyleEngineConfiguration *configuration;
  unsigned int v14;
  int32x2_t v15;
  uint32x2_t v16;
  int v17;

  v3 = [FigMetalAllocator alloc];
  -[FigMetalContext device](self->_metalContext, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FigMetalAllocator initWithDevice:allocatorType:](v3, "initWithDevice:allocatorType:", v4, 2);
  -[FigMetalContext setAllocator:](self->_metalContext, "setAllocator:", v5);

  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_10;
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (FigMetalTextureDescriptor *)objc_msgSend(v7, "newTextureDescriptor");
  textureDescriptor = self->_textureDescriptor;
  self->_textureDescriptor = v8;

  if (!self->_textureDescriptor)
    goto LABEL_10;
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (FigMetalBufferDescriptor *)objc_msgSend(v10, "newBufferDescriptor");
  bufferDescriptor = self->_bufferDescriptor;
  self->_bufferDescriptor = v11;

  if (!self->_bufferDescriptor)
    goto LABEL_10;
  self->_memoryAllocationType = 0;
  configuration = self->_configuration;
  if (configuration
    && (v14 = -[CMIStyleEngineConfiguration weightPlaneCount](configuration, "weightPlaneCount"),
        (self->_weightPlaneCount = v14) != 0)
    && (-[CMIStyleEngineConfiguration spotlightCount](self->_configuration, "spotlightCount"),
        *(int32x2_t *)self->_spotlightCount = v15,
        v16 = (uint32x2_t)vtst_s32(v15, v15),
        (vpmin_u32(v16, v16).u32[0] & 0x80000000) != 0))
  {
    v17 = -[CMIStyleEngineProcessor _createMetalStages](self, "_createMetalStages");
    if (v17)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    return v17;
  }
  else
  {
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (int)prewarm
{
  int v2;

  v2 = -[CMIStyleEngineProcessor _createMetalStages](self, "_createMetalStages");
  if (v2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v2;
}

- (void)_allocateTexture:(id *)a3 withDescriptor:(id)a4 useFigMetalAllocator:(BOOL)a5
{
  id v8;
  FigMetalContext *metalContext;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v8 = a4;
  if (!*a3)
  {
    v15 = v8;
    metalContext = self->_metalContext;
    if (a5)
    {
      -[FigMetalContext allocator](metalContext, "allocator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "newTextureWithDescriptor:", v15);
      v12 = *a3;
      *a3 = v11;
    }
    else
    {
      -[FigMetalContext device](metalContext, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "desc");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "newTextureWithDescriptor:", v12);
      v14 = *a3;
      *a3 = v13;

    }
    v8 = v15;
  }

}

- (void)_allocateBuffer:(id *)a3 withDescriptor:(id)a4 useFigMetalAllocator:(BOOL)a5
{
  id v8;
  FigMetalContext *metalContext;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v8 = a4;
  if (!*a3)
  {
    v13 = v8;
    metalContext = self->_metalContext;
    if (a5)
    {
      -[FigMetalContext allocator](metalContext, "allocator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "newBufferWithDescriptor:", v13);
    }
    else
    {
      -[FigMetalContext device](metalContext, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "newBufferWithLength:options:", objc_msgSend(v13, "length"), 0);
    }
    v12 = *a3;
    *a3 = v11;

    v8 = v13;
  }

}

- (int)prepareToProcess:(unsigned int)a3
{
  uint64_t v3;
  double v5;
  double v6;
  void *v7;
  void *v8;
  CMIExternalMemoryResource *externalMemoryResource;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;

  v3 = *(_QWORD *)&a3;
  self->_outputCoefficientsReady = 0;
  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  if (v5 > 0.0)
  {
    -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
    if (v6 > 0.0)
    {
      self->_performLearning = v3 & 1;
      self->_performIntegration = (v3 & 6) != 0;
      self->_performApplication = (v3 & 4) != 0;
      if ((v3 & 1) != 0 || (v3 & 4) != 0 || (v3 & 6) != 0)
      {
        if (self->_memoryAllocationType)
          goto LABEL_13;
        v7 = (void *)objc_opt_new();
        objc_msgSend(v7, "setWireMemory:", 1);
        objc_msgSend(v7, "setMemSize:", -[CMIStyleEngineProcessor _requiredMetalHeapMemory:](self, "_requiredMetalHeapMemory:", v3));
        objc_msgSend(v7, "setResourceOptions:", 512);
        -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_FigMetalAllocator"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLabel:", v8);

        externalMemoryResource = self->_externalMemoryResource;
        if (externalMemoryResource)
        {
          -[CMIExternalMemoryResource allocatorBackend](externalMemoryResource, "allocatorBackend");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "memSize");
          v12 = objc_msgSend(v7, "memSize");

          if (v11 < v12)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            v16 = FigSignalErrorAt();
            goto LABEL_19;
          }
          -[CMIExternalMemoryResource allocatorBackend](self->_externalMemoryResource, "allocatorBackend");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setMemSize:", objc_msgSend(v13, "memSize"));

          -[FigMetalContext allocator](self->_metalContext, "allocator");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CMIExternalMemoryResource allocatorBackend](self->_externalMemoryResource, "allocatorBackend");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "setupWithDescriptor:allocatorBackend:", v7, v15);

          v17 = 2;
        }
        else
        {
          -[FigMetalContext allocator](self->_metalContext, "allocator");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "setupWithDescriptor:", v7);
          v17 = 1;
        }

        if (!v16)
        {
          self->_memoryAllocationType = v17;

LABEL_13:
          v16 = -[CMIStyleEngineProcessor _allocatePermanentResources](self, "_allocatePermanentResources");
          if (v16)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
          }
          return v16;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
LABEL_19:

        return v16;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)_allocatePermanentResources
{
  MTLBuffer *rhsBuffer;
  void *v4;
  void *v5;
  double v6;
  unint64_t v7;
  void *v8;
  double v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 1);
  -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", &self->_linSysStatusFlagBuffer, self->_bufferDescriptor, !self->_useLiveMetalAllocations);
  if (!self->_linSysStatusFlagBuffer)
    goto LABEL_12;
  if (self->_performLearning)
  {
    if (self->_createLinearSystem)
    {
      -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
      -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 12* -[CMIStyleEngineProcessor _linearSystemSize](self, "_linearSystemSize")* -[CMIStyleEngineProcessor _independentPlusSpatialAverageLinearSystemCount](self, "_independentPlusSpatialAverageLinearSystemCount"));
      -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", &self->_rhsBuffer, self->_bufferDescriptor, !self->_useLiveMetalAllocations);
      if (!self->_rhsBuffer)
        goto LABEL_12;
    }
  }
  rhsBuffer = self->_rhsBuffer;
  if (rhsBuffer)
  {
    objc_storeStrong((id *)&self->_coefficientsBuffer, rhsBuffer);
  }
  else
  {
    -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 12* -[CMIStyleEngineProcessor _independentPlusSpatialAverageLinearSystemCount](self, "_independentPlusSpatialAverageLinearSystemCount")* -[CMIStyleEngineProcessor _linearSystemSize](self, "_linearSystemSize"));
    -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
    -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", &self->_coefficientsBuffer, self->_bufferDescriptor, !self->_useLiveMetalAllocations);
    if (!self->_coefficientsBuffer)
      goto LABEL_12;
  }
  if (!self->_performIntegration)
    return 0;
  if (!self->_integrateCoefficients)
    return 0;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextureType:", 3);

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPixelFormat:", 115);

  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  v7 = (unint64_t)v6;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWidth:", v7);

  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  v10 = (unint64_t)v9;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHeight:", v10);

  v12 = (3 * -[CMIStyleEngineProcessor _linearSystemNumberOfPolynomials](self, "_linearSystemNumberOfPolynomials") + 3) >> 2;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setArrayLength:", v12);

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:", &self->_integratedCoefficientsTexture, self->_textureDescriptor, !self->_useLiveMetalAllocations);
  if (self->_integratedCoefficientsTexture)
    return 0;
LABEL_12:
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (void)_freePermanentResources
{
  FigMetalDecRef((id *)&self->_linSysStatusFlagBuffer);
  FigMetalDecRef((id *)&self->_rhsBuffer);
  FigMetalDecRef((id *)&self->_coefficientsBuffer);
  FigMetalDecRef((id *)&self->_integratedCoefficientsTexture);
}

- (int)_setTuningParameters
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  float v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  float v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  float v28;
  void *v29;
  uint64_t v30;
  void *v31;
  float v32;
  float v33;
  double v34;
  void *v35;
  unsigned int v36;
  unint64_t weightPlaneCount;
  unint64_t v38;
  CMIStyleEngineCreateLinearSystem *createLinearSystem;
  void *v40;
  void *v41;
  unsigned int i;
  unint64_t v43;
  unint64_t v44;
  CMIStyleEngineCreateLinearSystem *v45;
  void *v46;
  int v47;
  unsigned int v48;
  unint64_t v49;
  unint64_t v50;
  CMIStyleEngineCreateLinearSystem *v51;
  void *v52;
  void *v54;
  void *v55;
  float v56;
  float v57;
  void *v58;
  float v59;
  float v60;
  void *v61;
  float v62;
  float v63;
  void *v64;
  float v65;
  float v66;
  void *v67;
  float v68;
  float v69;
  void *v70;
  float v71;
  float v72;
  void *v73;
  float v74;
  float v75;
  double v76;
  void *v77;
  uint64_t v78;
  void *v79;
  int v80;
  void *v81;
  int v82;
  int v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  _BOOL4 v93;
  double v94;
  void *v95;
  _BOOL8 v96;
  double v97;
  double v98;
  void *v99;
  float v100;
  float v101;
  double v102;
  _BOOL8 v103;
  void *v104;
  float v105;
  float v106;
  void *v107;
  float v108;
  float v109;
  void *v110;
  float v111;
  float v112;
  double v113;
  double v114;
  double v115;
  int v116;

  -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneStandardDeviation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneStandardDeviation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v6 = v5;

    if (v6 <= 0.0)
      goto LABEL_66;
  }
  else
  {
    v6 = 0.0;
  }
  self->_weightPlaneStandardDeviationForLearn = v6;
  -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneStandardDeviationForLearn"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneStandardDeviationForLearn"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    self->_weightPlaneStandardDeviationForLearn = v9;

  }
  if (self->_weightPlaneStandardDeviationForLearn <= 0.0)
    goto LABEL_66;
  self->_weightPlaneStandardDeviationForIntegrate = v6;
  -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneStandardDeviationForIntegrate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneStandardDeviationForIntegrate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    self->_weightPlaneStandardDeviationForIntegrate = v12;

  }
  if (self->_weightPlaneStandardDeviationForIntegrate <= 0.0)
    goto LABEL_66;
  -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneApplySpatialFilter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  self->_weightPlaneApplySpatialFilterForLearn = v14;
  -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneApplySpatialFilterForLearn"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneApplySpatialFilterForLearn"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_weightPlaneApplySpatialFilterForLearn = objc_msgSend(v16, "BOOLValue");

  }
  self->_weightPlaneApplySpatialFilterForIntegrate = v14;
  -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneApplySpatialFilterForIntegrate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneApplySpatialFilterForIntegrate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    self->_weightPlaneApplySpatialFilterForIntegrate = objc_msgSend(v18, "BOOLValue");

  }
  -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneSpatialFilterWeight"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneSpatialFilterWeight"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v22 = v21;

    if (v22 < 0.0)
      goto LABEL_66;
  }
  else
  {
    v22 = 0.0;
  }
  self->_weightPlaneSpatialFilterWeightForLearn = v22;
  -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneSpatialFilterWeightForLearn"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23
    || (-[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneSpatialFilterWeightForLearn")), v24 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v24, "floatValue"), self->_weightPlaneSpatialFilterWeightForLearn = v25, v24, self->_weightPlaneSpatialFilterWeightForLearn >= 0.0))
  {
    self->_weightPlaneSpatialFilterWeightForIntegrate = v22;
    -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneSpatialFilterWeightForIntegrate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26
      || (-[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneSpatialFilterWeightForIntegrate")), v27 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v27, "floatValue"), self->_weightPlaneSpatialFilterWeightForIntegrate = v28, v27, self->_weightPlaneSpatialFilterWeightForIntegrate >= 0.0))
    {
      -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneDoColorSplit"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "BOOLValue");

      if (!(_DWORD)v30 || (self->_weightPlaneCount & 1) == 0)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneColorSplitStrength"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "floatValue");
        v33 = v32;

        if (v33 >= 0.0)
        {
          -[CMIStyleEngineCreateWeightPlanes setDoColorSplit:](self->_createWeightPlanes, "setDoColorSplit:", v30);
          *(float *)&v34 = v33;
          -[CMIStyleEngineCreateWeightPlanes setColorSplitStrength:](self->_createWeightPlanes, "setColorSplitStrength:", v34);
          -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneConstantPriorScaleFactors"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0;
          while (1)
          {
            weightPlaneCount = self->_weightPlaneCount;
            v38 = objc_msgSend(v35, "count") <= weightPlaneCount ? objc_msgSend(v35, "count") : self->_weightPlaneCount;
            if (v38 <= v36)
              break;
            createLinearSystem = self->_createLinearSystem;
            objc_msgSend(v35, "objectAtIndexedSubscript:", v36);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "floatValue");
            LOBYTE(createLinearSystem) = -[CMIStyleEngineCreateLinearSystem setConstantPriorScaleFactor:forWeightPlane:](createLinearSystem, "setConstantPriorScaleFactor:forWeightPlane:", v36);

            ++v36;
            if ((createLinearSystem & 1) == 0)
            {
LABEL_46:
              fig_log_get_emitter();
              FigDebugAssert3();
              v47 = FigSignalErrorAt();

              return v47;
            }
          }
          -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneLinearPriorScaleFactors"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          for (i = 0; ; ++i)
          {
            v43 = self->_weightPlaneCount;
            v44 = objc_msgSend(v41, "count") <= v43 ? objc_msgSend(v41, "count") : self->_weightPlaneCount;
            if (v44 <= i)
              break;
            v45 = self->_createLinearSystem;
            objc_msgSend(v41, "objectAtIndexedSubscript:", i);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "floatValue");
            LOBYTE(v45) = -[CMIStyleEngineCreateLinearSystem setLinearPriorScaleFactor:forWeightPlane:](v45, "setLinearPriorScaleFactor:forWeightPlane:", i);

            if ((v45 & 1) == 0)
            {
              fig_log_get_emitter();
              FigDebugAssert3();
              v47 = FigSignalErrorAt();

              return v47;
            }
          }
          -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("WeightPlaneQuadraticPriorScaleFactors"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v48 = 0;
          while (1)
          {
            v49 = self->_weightPlaneCount;
            v50 = objc_msgSend(v35, "count") <= v49 ? objc_msgSend(v35, "count") : self->_weightPlaneCount;
            if (v50 <= v48)
              break;
            v51 = self->_createLinearSystem;
            objc_msgSend(v35, "objectAtIndexedSubscript:", v48);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "floatValue");
            LOBYTE(v51) = -[CMIStyleEngineCreateLinearSystem setQuadraticPriorScaleFactor:forWeightPlane:](v51, "setQuadraticPriorScaleFactor:forWeightPlane:", v48);

            ++v48;
            if ((v51 & 1) == 0)
              goto LABEL_46;
          }

          -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("SpotlightScaleFactor"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "floatValue");
          -[CMIStyleEngineCreateSpotlights setScaleFactor:](self->_createSpotlights, "setScaleFactor:");

          -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("ExtLambda"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "floatValue");
          v57 = v56;

          if (v57 >= 0.0)
          {
            -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("TikLambdaConstant"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "floatValue");
            v60 = v59;

            if (v60 >= 0.0)
            {
              -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("TikLambdaLinear"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "floatValue");
              v63 = v62;

              if (v63 >= 0.0)
              {
                -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("TikLambdaQuadratic"));
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "floatValue");
                v66 = v65;

                if (v66 >= 0.0)
                {
                  -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("EndLambda"));
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "floatValue");
                  v69 = v68;

                  if (v69 >= 0.0)
                  {
                    -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("LearningModulationStrength"));
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "floatValue");
                    v72 = v71;

                    if (v72 >= 0.0)
                    {
                      -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("LearningModulationOffset"));
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v73, "floatValue");
                      v75 = v74;

                      if (v75 >= 0.0 && (float)(v72 * v75) <= 1.0)
                      {
                        *(float *)&v76 = v72 * v75;
                        -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("ApplyLearningDifferenceModulation"), v76);
                        v77 = (void *)objc_claimAutoreleasedReturnValue();
                        v78 = objc_msgSend(v77, "BOOLValue");

                        -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("LearningModulationDifferenceStrength"));
                        v79 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v79, "floatValue");
                        v116 = v80;

                        -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("LearningModulationDifferenceOffset"));
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v81, "floatValue");
                        v83 = v82;

                        *(float *)&v84 = v57;
                        -[CMIStyleEngineCreateLinearSystem setExtLambda:](self->_createLinearSystem, "setExtLambda:", v84);
                        *(float *)&v85 = v60;
                        -[CMIStyleEngineCreateLinearSystem setTikLambdaConstant:](self->_createLinearSystem, "setTikLambdaConstant:", v85);
                        *(float *)&v86 = v63;
                        -[CMIStyleEngineCreateLinearSystem setTikLambdaLinear:](self->_createLinearSystem, "setTikLambdaLinear:", v86);
                        *(float *)&v87 = v66;
                        -[CMIStyleEngineCreateLinearSystem setTikLambdaQuadratic:](self->_createLinearSystem, "setTikLambdaQuadratic:", v87);
                        *(float *)&v88 = v69;
                        -[CMIStyleEngineCreateLinearSystem setEndLambda:](self->_createLinearSystem, "setEndLambda:", v88);
                        *(float *)&v89 = v72;
                        -[CMIStyleEngineCreateLinearSystem setModulationMaskStrength:](self->_createLinearSystem, "setModulationMaskStrength:", v89);
                        *(float *)&v90 = v75;
                        -[CMIStyleEngineCreateLinearSystem setModulationMaskOffset:](self->_createLinearSystem, "setModulationMaskOffset:", v90);
                        -[CMIStyleEngineCreateLinearSystem setApplyDifferenceModulation:](self->_createLinearSystem, "setApplyDifferenceModulation:", v78);
                        LODWORD(v91) = v116;
                        -[CMIStyleEngineCreateLinearSystem setModulationDifferenceStrength:](self->_createLinearSystem, "setModulationDifferenceStrength:", v91);
                        LODWORD(v92) = v83;
                        -[CMIStyleEngineCreateLinearSystem setModulationDifferenceOffset:](self->_createLinearSystem, "setModulationDifferenceOffset:", v92);
                        -[CMIStyleEngineCreateLinearSystem setSpatialAverageSystems:](self->_createLinearSystem, "setSpatialAverageSystems:", -[CMIStyleEngineConfiguration createAndSolveGlobalLinearSystem](self->_configuration, "createAndSolveGlobalLinearSystem"));
                        -[CMIStyleEngineConfiguration linearSystemPriorMatrix](self->_configuration, "linearSystemPriorMatrix");
                        -[CMIStyleEngineCreateLinearSystem setPriorMatrix:](self->_createLinearSystem, "setPriorMatrix:");
                        -[CMIStyleEngineIntegrateCoefficients setUseBicubicSampling:](self->_integrateCoefficients, "setUseBicubicSampling:", -[CMIStyleEngineConfiguration useBicubicIntegration](self->_configuration, "useBicubicIntegration"));
                        v93 = -[CMIStyleEngineConfiguration createAndSolveGlobalLinearSystem](self->_configuration, "createAndSolveGlobalLinearSystem");
                        LODWORD(v94) = 0;
                        if (v93)
                          -[CMIStyleEngineConfiguration globalLinearSystemMixFactor](self->_configuration, "globalLinearSystemMixFactor", v94);
                        -[CMIStyleEngineIntegrateCoefficients setGlobalLinearSystemMixFactor:](self->_integrateCoefficients, "setGlobalLinearSystemMixFactor:", v94);
                        -[CMIStyleEngineIntegrateCoefficients setSpotlightAffineTransform:](self->_integrateCoefficients, "setSpotlightAffineTransform:", *(double *)&self[1].super.isa, self[1]._imageSize.width, self[1]._inputImageRect.origin.x);
                        -[CMIStyleEngineIntegrateCoefficients setSpotlightZoomROI:](self->_integrateCoefficients, "setSpotlightZoomROI:", self->_spotlightZoomROI.origin.x, self->_spotlightZoomROI.origin.y, self->_spotlightZoomROI.size.width, self->_spotlightZoomROI.size.height);
                        -[CMIStyleEngineIntegrateCoefficients setSpotlightROI:](self->_integrateCoefficients, "setSpotlightROI:", self->_spotlightIntegrationROI.origin.x, self->_spotlightIntegrationROI.origin.y, self->_spotlightIntegrationROI.size.width, self->_spotlightIntegrationROI.size.height);
                        -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("GlobalBlendOutsideLearningROI"));
                        v95 = (void *)objc_claimAutoreleasedReturnValue();
                        v96 = objc_msgSend(v95, "BOOLValue")
                           && -[CMIStyleEngineConfiguration createAndSolveGlobalLinearSystem](self->_configuration, "createAndSolveGlobalLinearSystem");
                        -[CMIStyleEngineIntegrateCoefficients setGlobalSpatialExtrapolation:](self->_integrateCoefficients, "setGlobalSpatialExtrapolation:", v96);

                        LODWORD(v97) = 1.0;
                        -[NSDictionary cmi_floatValueForKey:defaultValue:found:](self->_tuningParameters, "cmi_floatValueForKey:defaultValue:found:", CFSTR("GlobalBlendMaxGlobalMix"), 0, v97);
                        -[CMIStyleEngineIntegrateCoefficients setMaxGlobalMixFactor:](self->_integrateCoefficients, "setMaxGlobalMixFactor:");
                        LODWORD(v98) = 20.0;
                        -[NSDictionary cmi_floatValueForKey:defaultValue:found:](self->_tuningParameters, "cmi_floatValueForKey:defaultValue:found:", CFSTR("GlobalBlendRampParameter"), 0, v98);
                        -[CMIStyleEngineIntegrateCoefficients setGlobalSpatialExtrapolationRampFactor:](self->_integrateCoefficients, "setGlobalSpatialExtrapolationRampFactor:");
                        -[NSDictionary objectForKeyedSubscript:](self->_tuningParameters, "objectForKeyedSubscript:", CFSTR("ResidualScaleFactor"));
                        v99 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v99, "floatValue");
                        v101 = v100;

                        if (v101 >= 0.0)
                        {
                          *(float *)&v102 = v101;
                          -[CMIStyleEngineApplyStyle setResidualScaleFactor:](self->_applyStyle, "setResidualScaleFactor:", v102);
                          -[CMIStyleEngineApplyStyle setFastCoeffSampling:](self->_applyStyle, "setFastCoeffSampling:", -[CMIStyleEngineConfiguration fastStyleApplication](self->_configuration, "fastStyleApplication"));
                          v103 = self->_applyDither
                              || -[CMIStyleEngineConfiguration applyDithering](self->_configuration, "applyDithering");
                          -[CMIStyleEngineApplyStyle setApplyDithering:](self->_applyStyle, "setApplyDithering:", v103);
                          -[NSDictionary objectForKeyedSubscript:](self->_inputNoiseModel, "objectForKeyedSubscript:", *MEMORY[0x1E0D06000]);
                          v104 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v104, "floatValue");
                          v106 = v105;

                          -[NSDictionary objectForKeyedSubscript:](self->_inputNoiseModel, "objectForKeyedSubscript:", *MEMORY[0x1E0D06008]);
                          v107 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v107, "floatValue");
                          v109 = v108;

                          -[NSDictionary objectForKeyedSubscript:](self->_inputNoiseModel, "objectForKeyedSubscript:", *MEMORY[0x1E0D06018]);
                          v110 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v110, "floatValue");
                          v112 = v111;

                          *(float *)&v113 = v106 * v106;
                          -[CMIStyleEngineApplyStyle setInputReadNoiseVar:](self->_applyStyle, "setInputReadNoiseVar:", v113);
                          *(float *)&v114 = v109 * v109;
                          -[CMIStyleEngineApplyStyle setInputShotNoiseVar:](self->_applyStyle, "setInputShotNoiseVar:", v114);
                          *(float *)&v115 = v112 * v112;
                          -[CMIStyleEngineApplyStyle setInputSquaredNoiseVar:](self->_applyStyle, "setInputSquaredNoiseVar:", v115);
                          return 0;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_66:
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)process
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  __CVBuffer *inputPixelBuffer;
  __CVBuffer *outputPixelBuffer;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  CMIMetalEventSynchronizer *metalSynchronizer;
  void *v19;
  CMIMetalResourceCache *textureCache;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  _BOOL4 v25;
  unint64_t v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  uint64_t weightPlaneCount;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  CMIStyleEngineCreateWeightPlanes *createWeightPlanes;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  int32x2_t v74;
  int32x2_t v75;
  uint32x2_t v76;
  double (**v77)(__n128);
  __n128 v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  CMIStyleEngineCreateSpotlights *createSpotlights;
  void *v100;
  int v101;
  double v102;
  double v103;
  double v104;
  double v105;
  unsigned int v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  double v115;
  void *v116;
  void *v117;
  unsigned int v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  CMIStyleEngineCreateLinearSystem *createLinearSystem;
  void *v124;
  int v125;
  void *v126;
  void *v127;
  CMIStyleEngineSolveLinearSystem *solveLinearSystem;
  void *v129;
  int v130;
  __CVBuffer *inputLinearSystemCoefficientsPixelBuffer;
  size_t Width;
  size_t Height;
  uint64_t v134;
  unint64_t v135;
  _BOOL4 inputCoefficientsF16;
  unint64_t v137;
  char v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  CMIMetalEventSynchronizer *v143;
  void *v144;
  CMIStyleEngineCoefficientConverterF16ToF32 *coefficientConverterF16ToF32;
  void *v146;
  int v147;
  void *v148;
  void *v149;
  unint64_t v150;
  _BOOL4 outputCoefficientsF16;
  unint64_t v152;
  char v153;
  void *v154;
  void *v155;
  MTLBuffer *coefficientsBuffer;
  CMIStyleEngineCoefficientConverterF32ToF16 *coefficientConverterF32ToF16;
  void *v158;
  int v159;
  void *v160;
  void *v161;
  CMIMetalEventSynchronizer *v162;
  void *v163;
  _BOOL4 v164;
  double v165;
  double v166;
  void *v167;
  void *v168;
  CMIStyleEngineCreateWeightPlanes *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  CMIStyleEngineIntegrateCoefficients *integrateCoefficients;
  void *v181;
  __CVBuffer *v182;
  int v183;
  __CVBuffer *v184;
  void *v185;
  void *v186;
  double v187;
  double v188;
  void *v189;
  double v190;
  double v191;
  void *v192;
  void *v193;
  __CVBuffer *inputDeltaMapPixelBuffer;
  __CVBuffer *inputOriginalPixelBuffer;
  void *v196;
  void *v197;
  CMIStyleEngineApplyStyle *applyStyle;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  uint64_t v203;
  int v204;
  int v206;
  int v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  double v211;
  _BOOL4 v212;
  _BOOL4 v213;
  _BOOL4 v214;
  _BOOL4 v215;
  double v216;
  double v217;
  double v218;
  uint64_t v219;
  id v220;
  _BOOL4 v221;
  _BOOL4 v222;
  id WeakRetained;
  unsigned int v224;
  unsigned int v225;
  void (**v226)(_QWORD, _QWORD, _QWORD, _QWORD);
  _BOOL4 v227;
  _QWORD v228[7];
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 obj;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  id v249;
  id v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  _QWORD v262[4];
  id v263;
  id v264;
  id location;
  _DWORD v266[5];
  CGRect v267;
  CGRect v268;

  v266[0] = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v262[0] = MEMORY[0x1E0C809B0];
  v262[1] = 3221225472;
  v262[2] = __34__CMIStyleEngineProcessor_process__block_invoke;
  v262[3] = &unk_1E94EB600;
  objc_copyWeak(&v264, &location);
  v220 = v3;
  v263 = v220;
  v226 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D824D3C0](v262);
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = objc_msgSend(v5, "usedSizeAll");

  v260 = 0u;
  v261 = 0u;
  v258 = 0u;
  v259 = 0u;
  v256 = 0u;
  v257 = 0u;
  v254 = 0u;
  v255 = 0u;
  v252 = 0u;
  v253 = 0u;
  v251 = 0u;
  v250 = 0;
  v249 = 0;
  v247 = 0u;
  v248 = 0u;
  v245 = 0u;
  v246 = 0u;
  v243 = 0u;
  v244 = 0u;
  v241 = 0u;
  v242 = 0u;
  v239 = 0u;
  v240 = 0u;
  v237 = 0u;
  v238 = 0u;
  v235 = 0u;
  v236 = 0u;
  obj = 0u;
  v234 = 0u;
  v267.origin.x = 0.0;
  v267.origin.y = 0.0;
  v267.size.width = 1.0;
  v267.size.height = 1.0;
  if (!CGRectContainsRect(v267, self->_spotlightZoomROI)
    || (-[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize"),
        v7 = v6,
        -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize"),
        v268.size.height = v8,
        v268.origin.x = 0.0,
        v268.origin.y = 0.0,
        v268.size.width = v7,
        !CGRectContainsRect(v268, self->_spotlightIntegrationROI)))
  {
    fig_log_get_emitter();
    v209 = v210;
    LODWORD(v208) = 0;
    FigDebugAssert3();
    v206 = FigSignalErrorAt();
LABEL_266:
    v266[0] = v206;
    goto LABEL_210;
  }
  inputPixelBuffer = self->_inputPixelBuffer;
  if (inputPixelBuffer)
  {
    outputPixelBuffer = self->_outputPixelBuffer;
    if (outputPixelBuffer)
      CVBufferPropagateAttachments(inputPixelBuffer, outputPixelBuffer);
  }
  v11 = -[CMIStyleEngineProcessor _setTuningParameters](self, "_setTuningParameters");
  v266[0] = v11;
  if (v11)
  {
    fig_log_get_emitter();
    v209 = v210;
    LODWORD(v208) = v11;
    FigDebugAssert3();
    goto LABEL_210;
  }
  -[CMIStyleEngineProcessor _bindAllInternalIOTextures:](self, "_bindAllInternalIOTextures:", v266);
  __move_assignment_8_8_s0_s8_s16_s24_s32_s40_s48_s56_s64_s72_s80_s88_s96_s104_s112_s120_s128_s136_s144_s152_s160_s168((uint64_t)&v251, (uint64_t *)&v229);
  v12 = v266[0];
  if (v266[0])
    goto LABEL_222;
  v13 = (void *)-[CMIStyleEngineProcessor _bindAllInternalIOBuffers:](self, "_bindAllInternalIOBuffers:", v266);
  v15 = v14;
  v16 = v249;
  v249 = v13;

  v17 = v250;
  v250 = v15;

  v12 = v266[0];
  if (v266[0])
    goto LABEL_222;
  v12 = -[CMIStyleEngineProcessor _checkConfigurationForTexture:buffers:](self, "_checkConfigurationForTexture:buffers:", &v251, &v249);
  v266[0] = v12;
  if (v12)
    goto LABEL_222;
  v12 = -[CMIStyleEngineProcessor _bindAllInternalYUVTextures:](self, "_bindAllInternalYUVTextures:", &v251);
  v266[0] = v12;
  if (v12)
    goto LABEL_222;
  metalSynchronizer = self->_metalSynchronizer;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIMetalEventSynchronizer waitForEventOnCommandBuffer:forResource:](metalSynchronizer, "waitForEventOnCommandBuffer:forResource:", v19, (_QWORD)v254);

  textureCache = self->_textureCache;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIMetalResourceCache makeResidentOnCommandBuffer:](textureCache, "makeResidentOnCommandBuffer:", v21);

  if (-[CMIStyleEngineConfiguration inputIsLinear](self->_configuration, "inputIsLinear"))
  {
    v213 = 1;
  }
  else if ((_QWORD)v253)
  {
    v213 = +[CMIStyleEngineProcessorUtilities textureIsLinearSRGB:](CMIStyleEngineProcessorUtilities, "textureIsLinearSRGB:");
  }
  else
  {
    v213 = 0;
  }
  if (-[CMIStyleEngineConfiguration outputShouldBeLinear](self->_configuration, "outputShouldBeLinear"))
  {
    v212 = 1;
  }
  else if (*((_QWORD *)&v253 + 1))
  {
    v212 = +[CMIStyleEngineProcessorUtilities textureIsLinearSRGB:](CMIStyleEngineProcessorUtilities, "textureIsLinearSRGB:");
  }
  else
  {
    v212 = 0;
  }
  if (-[CMIStyleEngineConfiguration inputThumbnailIsLinear](self->_configuration, "inputThumbnailIsLinear"))
  {
    v227 = 1;
  }
  else if ((_QWORD)v254)
  {
    v227 = +[CMIStyleEngineProcessorUtilities textureIsLinearSRGB:](CMIStyleEngineProcessorUtilities, "textureIsLinearSRGB:");
  }
  else
  {
    v227 = 0;
  }
  if (-[CMIStyleEngineConfiguration targetThumbnailIsLinear](self->_configuration, "targetThumbnailIsLinear"))
  {
    v222 = 1;
  }
  else if (*((_QWORD *)&v256 + 1))
  {
    v222 = +[CMIStyleEngineProcessorUtilities textureIsLinearSRGB:](CMIStyleEngineProcessorUtilities, "textureIsLinearSRGB:");
  }
  else
  {
    v222 = 0;
  }
  v22 = v227;
  if (!cmisep_texturesAreIdentical((void *)v254, *((void **)&v254 + 1)))
  {
    if (-[CMIStyleEngineConfiguration inputThumbnailForLearningIsLinear](self->_configuration, "inputThumbnailForLearningIsLinear"))
    {
      v22 = 1;
    }
    else if (*((_QWORD *)&v254 + 1))
    {
      v22 = +[CMIStyleEngineProcessorUtilities textureIsLinearSRGB:](CMIStyleEngineProcessorUtilities, "textureIsLinearSRGB:");
    }
    else
    {
      v22 = 0;
    }
  }
  v23 = v227;
  if (!cmisep_texturesAreIdentical((void *)v254, (void *)v255))
  {
    if (-[CMIStyleEngineConfiguration inputThumbnailForLearningWeightsIsLinear](self->_configuration, "inputThumbnailForLearningWeightsIsLinear"))
    {
      v23 = 1;
    }
    else if ((_QWORD)v255)
    {
      v23 = +[CMIStyleEngineProcessorUtilities textureIsLinearSRGB:](CMIStyleEngineProcessorUtilities, "textureIsLinearSRGB:");
    }
    else
    {
      v23 = 0;
    }
  }
  v215 = v227;
  if (!cmisep_texturesAreIdentical((void *)v254, *((void **)&v255 + 1)))
  {
    if (-[CMIStyleEngineConfiguration inputThumbnailForIntegrationIsLinear](self->_configuration, "inputThumbnailForIntegrationIsLinear"))
    {
      v215 = 1;
    }
    else if (*((_QWORD *)&v255 + 1))
    {
      v215 = +[CMIStyleEngineProcessorUtilities textureIsLinearSRGB:](CMIStyleEngineProcessorUtilities, "textureIsLinearSRGB:");
    }
    else
    {
      v215 = 0;
    }
  }
  if (!cmisep_texturesAreIdentical((void *)v254, (void *)v256))
  {
    if (-[CMIStyleEngineConfiguration inputThumbnailForResidualCorrectionIsLinear](self->_configuration, "inputThumbnailForResidualCorrectionIsLinear"))
    {
      v227 = 1;
    }
    else if ((_QWORD)v256)
    {
      v227 = +[CMIStyleEngineProcessorUtilities textureIsLinearSRGB:](CMIStyleEngineProcessorUtilities, "textureIsLinearSRGB:");
    }
    else
    {
      v227 = 0;
    }
  }
  v24 = cmisep_texturesAreIdentical(*((void **)&v256 + 1), (void *)v257);
  v25 = v222;
  if (!v24)
  {
    if (-[CMIStyleEngineConfiguration targetThumbnailForLearningIsLinear](self->_configuration, "targetThumbnailForLearningIsLinear"))
    {
      v25 = 1;
    }
    else if ((_QWORD)v257)
    {
      v25 = +[CMIStyleEngineProcessorUtilities textureIsLinearSRGB:](CMIStyleEngineProcessorUtilities, "textureIsLinearSRGB:");
    }
    else
    {
      v25 = 0;
    }
  }
  v214 = v25;
  if (!cmisep_texturesAreIdentical(*((void **)&v256 + 1), *((void **)&v257 + 1)))
  {
    if (-[CMIStyleEngineConfiguration targetThumbnailForResidualCorrectionIsLinear](self->_configuration, "targetThumbnailForResidualCorrectionIsLinear"))
    {
      v222 = 1;
    }
    else if (*((_QWORD *)&v257 + 1))
    {
      v222 = +[CMIStyleEngineProcessorUtilities textureIsLinearSRGB:](CMIStyleEngineProcessorUtilities, "textureIsLinearSRGB:");
    }
    else
    {
      v222 = 0;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_inputWeightPlaneTexture);

  if (self->_performLearning
    && vabds_f32(self->_weightPlaneStandardDeviationForLearn, self->_weightPlaneStandardDeviationForIntegrate) <= 0.00000011921
    && vabds_f32(self->_weightPlaneSpatialFilterWeightForLearn, self->_weightPlaneSpatialFilterWeightForIntegrate) <= 0.00000011921
    && self->_weightPlaneApplySpatialFilterForLearn == self->_weightPlaneApplySpatialFilterForIntegrate
    && cmisep_texturesAreIdentical((void *)v255, *((void **)&v255 + 1)))
  {
    v26 = -[CMIStyleEngineConfiguration filterForInputLearningWeightsThumbnailCreation](self->_configuration, "filterForInputLearningWeightsThumbnailCreation");
    v27 = v26 != -[CMIStyleEngineConfiguration filterForInputIntegrationThumbnailCreation](self->_configuration, "filterForInputIntegrationThumbnailCreation");
  }
  else
  {
    v27 = 1;
  }
  v221 = v27;
  if (!self->_linSysStatusFlagBuffer)
    goto LABEL_265;
  -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_BlitlLinSysStatusFlag"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLabel:", v28);

  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "blitCommandEncoder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
    goto LABEL_265;
  objc_msgSend(v31, "fillBuffer:range:value:", self->_linSysStatusFlagBuffer, 0, -[MTLBuffer length](self->_linSysStatusFlagBuffer, "length"), 0);
  objc_msgSend(v31, "endEncoding");
  -[FigMetalContext commit](self->_metalContext, "commit");

  if (self->_performLearning)
  {
    v32 = objc_loadWeakRetained((id *)&self->_inputWeightPlaneTexture);

    if (!v32)
    {
      ((void (**)(_QWORD, _QWORD, unint64_t, const __CFString *))v226)[2](v226, v255, -[CMIStyleEngineConfiguration filterForInputLearningWeightsThumbnailCreation](self->_configuration, "filterForInputLearningWeightsThumbnailCreation"), CFSTR("InputThumbnailForLearningWeights"));
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)*((_QWORD *)&obj + 1);
      *((_QWORD *)&obj + 1) = v33;

      if (!*((_QWORD *)&obj + 1))
        goto LABEL_265;
    }
    if (self->_performLearning)
    {
      ((void (**)(_QWORD, _QWORD, unint64_t, const __CFString *))v226)[2](v226, *((_QWORD *)&v254 + 1), -[CMIStyleEngineConfiguration filterForInputLearningThumbnailCreation](self->_configuration, "filterForInputLearningThumbnailCreation"), CFSTR("InputThumbnailForLearning"));
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)*((_QWORD *)&v234 + 1);
      *((_QWORD *)&v234 + 1) = v35;

      if (!*((_QWORD *)&v234 + 1))
        goto LABEL_265;
    }
  }
  if (self->_performIntegration)
  {
    v37 = objc_loadWeakRetained((id *)&self->_inputWeightPlaneTexture);
    v38 = !v37 && v221;

    if (v38)
    {
      ((void (**)(_QWORD, _QWORD, unint64_t, const __CFString *))v226)[2](v226, *((_QWORD *)&v255 + 1), -[CMIStyleEngineConfiguration filterForInputIntegrationThumbnailCreation](self->_configuration, "filterForInputIntegrationThumbnailCreation"), CFSTR("InputThumbnailForIntegration"));
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v234;
      *(_QWORD *)&v234 = v39;

      if (!(_QWORD)v234)
        goto LABEL_265;
    }
  }
  if (self->_performApplication)
  {
    if (-[CMIStyleEngineProcessor _applyResidualCorrection](self, "_applyResidualCorrection"))
    {
      ((void (**)(_QWORD, _QWORD, unint64_t, const __CFString *))v226)[2](v226, v256, -[CMIStyleEngineConfiguration filterForInputResidualCorrectionThumbnailCreation](self->_configuration, "filterForInputResidualCorrectionThumbnailCreation"), CFSTR("InputThumbnailForResidualCorrection"));
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v235;
      *(_QWORD *)&v235 = v41;

      if (!(_QWORD)v235)
        goto LABEL_265;
    }
  }
  if (self->_performLearning)
  {
    ((void (**)(_QWORD, _QWORD, unint64_t, const __CFString *))v226)[2](v226, v257, -[CMIStyleEngineConfiguration filterForTargetLearningThumbnailCreation](self->_configuration, "filterForTargetLearningThumbnailCreation"), CFSTR("TargetThumbnailForLearning"));
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = (void *)*((_QWORD *)&v235 + 1);
    *((_QWORD *)&v235 + 1) = v43;

    if (!*((_QWORD *)&v235 + 1))
      goto LABEL_265;
  }
  if (self->_performApplication)
  {
    if (-[CMIStyleEngineProcessor _applyResidualCorrection](self, "_applyResidualCorrection"))
    {
      ((void (**)(_QWORD, _QWORD, unint64_t, const __CFString *))v226)[2](v226, *((_QWORD *)&v257 + 1), -[CMIStyleEngineConfiguration filterForTargetResidualCorrectionThumbnailCreation](self->_configuration, "filterForTargetResidualCorrectionThumbnailCreation"), CFSTR("TargetThumbnailForResidualCorrection"));
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)v236;
      *(_QWORD *)&v236 = v45;

      if (!(_QWORD)v236)
        goto LABEL_265;
    }
  }
  if (WeakRetained)
  {
    v47 = objc_loadWeakRetained((id *)&self->_inputWeightPlaneTexture);
    v48 = (void *)obj;
    *(_QWORD *)&obj = v47;

    FigMetalIncRef((void *)obj);
  }
  else
  {
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setTextureType:", 3);

    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setPixelFormat:", 25);

    -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
    v52 = v51;
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setWidth:", (unint64_t)v52);

    -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
    v55 = v54;
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setHeight:", (unint64_t)v55);

    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setDepth:", 1);

    weightPlaneCount = self->_weightPlaneCount;
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setArrayLength:", weightPlaneCount);

    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setUsage:", 7);

    -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
    -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:", &obj, self->_textureDescriptor, 1);
    if (!(_QWORD)obj)
      goto LABEL_265;
    -[CMIStyleEngineCreateWeightPlanes setOutputWeightPlanesTexture:](self->_createWeightPlanes, "setOutputWeightPlanesTexture:");
  }
  if (self->_performLearning)
  {
    objc_storeStrong((id *)&v236 + 1, (id)obj);
    FigMetalIncRef(*((void **)&v236 + 1));
  }
  if (self->_performIntegration)
  {
    objc_storeStrong((id *)&v237, (id)obj);
    FigMetalIncRef((void *)v237);
  }
  FigMetalDecRef((id *)&obj);
  if (!self->_performLearning)
  {
    inputLinearSystemCoefficientsPixelBuffer = self->_inputLinearSystemCoefficientsPixelBuffer;
    if (inputLinearSystemCoefficientsPixelBuffer)
    {
      Width = CVPixelBufferGetWidth(inputLinearSystemCoefficientsPixelBuffer);
      Height = CVPixelBufferGetHeight(self->_inputLinearSystemCoefficientsPixelBuffer);
      if (Height * Width < (unint64_t)-[MTLBuffer length](self->_coefficientsBuffer, "length") >> 2)
        goto LABEL_265;
    }
    if (v249)
      v134 = objc_msgSend(v249, "length");
    else
      v134 = -[NSData length](self->_inputLinearSystemCoefficients, "length");
    v135 = v134;
    inputCoefficientsF16 = self->_inputCoefficientsF16;
    v137 = -[MTLBuffer length](self->_coefficientsBuffer, "length");
    v138 = 1;
    if (!inputCoefficientsF16)
      v138 = 2;
    if (v135 >> v138 < v137 >> 2)
      goto LABEL_265;
    if (v249)
    {
      v139 = v249;
    }
    else
    {
      -[FigMetalContext device](self->_metalContext, "device");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = (id)objc_msgSend(v140, "newBufferWithBytes:length:options:", -[NSData bytes](self->_inputLinearSystemCoefficients, "bytes"), -[MTLBuffer length](self->_coefficientsBuffer, "length"), 0);

      if (!v139)
      {
        fig_log_get_emitter();
        v209 = v210;
        LODWORD(v208) = 0;
        FigDebugAssert3();
        v207 = FigSignalErrorAt();
        v139 = 0;
        goto LABEL_263;
      }
    }
    -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_InputCoefficients"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "setLabel:", v141);

    v143 = self->_metalSynchronizer;
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMIMetalEventSynchronizer waitForEventOnCommandBuffer:forResource:](v143, "waitForEventOnCommandBuffer:forResource:", v144, v139);

    if (self->_inputCoefficientsF16)
    {
      -[CMIStyleEngineCoefficientConverter setInputBuffer:](self->_coefficientConverterF16ToF32, "setInputBuffer:", v139);
      -[CMIStyleEngineCoefficientConverter setOutputBuffer:](self->_coefficientConverterF16ToF32, "setOutputBuffer:", self->_coefficientsBuffer);
      coefficientConverterF16ToF32 = self->_coefficientConverterF16ToF32;
      -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v266[0] = -[CMIStyleEngineCoefficientConverter enqueueToCommandBuffer:](coefficientConverterF16ToF32, "enqueueToCommandBuffer:", v146);

      v147 = v266[0];
      if (v266[0])
      {
        fig_log_get_emitter();
        v209 = v210;
        LODWORD(v208) = v147;
        FigDebugAssert3();
LABEL_264:

        goto LABEL_210;
      }
LABEL_148:
      -[FigMetalContext commit](self->_metalContext, "commit");

      goto LABEL_149;
    }
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "blitCommandEncoder");
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    if (v149)
    {
      objc_msgSend(v149, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v139, 0, self->_coefficientsBuffer, 0, -[MTLBuffer length](self->_coefficientsBuffer, "length"));
      objc_msgSend(v149, "endEncoding");

      goto LABEL_148;
    }
    fig_log_get_emitter();
    v209 = v210;
    LODWORD(v208) = 0;
    FigDebugAssert3();
    v207 = FigSignalErrorAt();
LABEL_263:
    v266[0] = v207;
    goto LABEL_264;
  }
  if (!WeakRetained)
  {
    -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 4* (self->_weightPlaneCount >> -[CMIStyleEngineCreateWeightPlanes doColorSplit](self->_createWeightPlanes, "doColorSplit")));
    -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
    -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", (char *)&v237 + 8, self->_bufferDescriptor, 1);
    if (*((_QWORD *)&v237 + 1))
    {
      -[CMIStyleEngineCreateWeightPlanes setInputPlaneNormalisationBuffer:](self->_createWeightPlanes, "setInputPlaneNormalisationBuffer:");
      if (!-[CMIStyleEngineCreateWeightPlanes doColorSplit](self->_createWeightPlanes, "doColorSplit"))
        goto LABEL_109;
      -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 4100);
      -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
      -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", &v238, self->_bufferDescriptor, 1);
      if ((_QWORD)v238)
      {
        -[CMIStyleEngineCreateWeightPlanes setInputThresholdCalculationBuffer:](self->_createWeightPlanes, "setInputThresholdCalculationBuffer:");
LABEL_109:
        -[CMIStyleEngineCreateWeightPlanes setInputTexture:](self->_createWeightPlanes, "setInputTexture:", *((_QWORD *)&obj + 1));
        -[CMIStyleEngineCreateWeightPlanes setInputIsLinear:](self->_createWeightPlanes, "setInputIsLinear:", v23);
        *(float *)&v61 = self->_weightPlaneStandardDeviationForLearn;
        -[CMIStyleEngineCreateWeightPlanes setWeightPlanesStandardDeviation:](self->_createWeightPlanes, "setWeightPlanesStandardDeviation:", v61);
        -[CMIStyleEngineCreateWeightPlanes setApplySpatialFilter:](self->_createWeightPlanes, "setApplySpatialFilter:", self->_weightPlaneApplySpatialFilterForLearn);
        *(float *)&v62 = self->_weightPlaneSpatialFilterWeightForLearn;
        -[CMIStyleEngineCreateWeightPlanes setSpatialFilterWeight:](self->_createWeightPlanes, "setSpatialFilterWeight:", v62);
        -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_CreateWeightPlanes"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setLabel:", v63);

        createWeightPlanes = self->_createWeightPlanes;
        -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v266[0] = -[CMIStyleEngineCreateWeightPlanes enqueueToCommandBuffer:](createWeightPlanes, "enqueueToCommandBuffer:", v66);

        v12 = v266[0];
        if (!v266[0])
        {
          -[FigMetalContext commit](self->_metalContext, "commit");
          FigMetalDecRef((id *)&obj + 1);
          FigMetalDecRef((id *)&v237 + 1);
          FigMetalDecRef((id *)&v238);
          goto LABEL_111;
        }
LABEL_222:
        fig_log_get_emitter();
        v209 = v210;
        LODWORD(v208) = v12;
        FigDebugAssert3();
        goto LABEL_210;
      }
    }
LABEL_265:
    fig_log_get_emitter();
    v209 = v210;
    LODWORD(v208) = 0;
    FigDebugAssert3();
    v206 = FigSignalErrorAt();
    goto LABEL_266;
  }
LABEL_111:
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setTextureType:", 2);

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setPixelFormat:", 55);

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setArrayLength:", 1);

  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  v71 = v70;
  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  LODWORD(v72) = v71;
  HIDWORD(v72) = v73;
  v74 = vadd_s32(*(int32x2_t *)&v72, vadd_s32(*(int32x2_t *)self->_spotlightCount, (int32x2_t)-1));
  v75.i32[0] = v74.i32[0] / *(_QWORD *)self->_spotlightCount;
  v75.i32[1] = v74.i32[1] / HIDWORD(*(_QWORD *)self->_spotlightCount);
  v228[0] = v4;
  v76 = (uint32x2_t)vadd_s32(v75, (int32x2_t)0x100000001);
  v228[1] = 3221225472;
  v228[2] = __34__CMIStyleEngineProcessor_process__block_invoke_453;
  v228[3] = &__block_descriptor_56_e6_16__08l;
  v228[4] = *(_QWORD *)&v76 & 0xFFFFFFFEFFFFFFFELL;
  v228[5] = vshr_n_u32(v76, 1uLL);
  v211 = v72;
  *(double *)&v228[6] = v72;
  v77 = (double (**)(__n128))MEMORY[0x1D824D3C0](v228);
  v218 = v77[2]((__n128)0);
  v78.n128_u64[0] = 0x100000001;
  v217 = ((double (*)(double (**)(__n128), __n128))v77[2])(v77, v78);
  v216 = ((double (*)(double (**)(__n128), double))v77[2])(v77, COERCE_DOUBLE(vadd_s32(*(int32x2_t *)self->_spotlightCount, (int32x2_t)-1)));
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setWidth:", LODWORD(v218));

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setHeight:", HIDWORD(v218));

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:", (char *)&v238 + 8, self->_textureDescriptor, 1);
  if (!*((_QWORD *)&v238 + 1))
    goto LABEL_225;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setWidth:", LODWORD(v217));

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setHeight:", HIDWORD(v218));

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:", &v239, self->_textureDescriptor, 1);
  if (!(_QWORD)v239)
    goto LABEL_225;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setWidth:", LODWORD(v216));

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setHeight:", HIDWORD(v218));

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:");
  if (!*((_QWORD *)&v239 + 1))
    goto LABEL_225;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setWidth:", LODWORD(v218));

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setHeight:", HIDWORD(v217));

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:");
  if (!(_QWORD)v240)
    goto LABEL_225;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setWidth:", LODWORD(v217));

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setHeight:", HIDWORD(v217));

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:");
  if (!*((_QWORD *)&v242 + 1))
    goto LABEL_225;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setWidth:", LODWORD(v216));

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setHeight:", HIDWORD(v217));

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:", (char *)&v240 + 8, self->_textureDescriptor, 1);
  if (!*((_QWORD *)&v240 + 1))
    goto LABEL_225;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setWidth:", LODWORD(v218));

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setHeight:", HIDWORD(v216));

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:");
  if (!(_QWORD)v241)
    goto LABEL_225;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "setWidth:", LODWORD(v217));

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setHeight:", HIDWORD(v216));

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:");
  if (!*((_QWORD *)&v241 + 1))
    goto LABEL_225;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setWidth:", LODWORD(v216));

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setHeight:", HIDWORD(v216));

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:", &v242, self->_textureDescriptor, 1);
  if (!(_QWORD)v242)
  {
LABEL_225:
    fig_log_get_emitter();
    v209 = v210;
    LODWORD(v208) = 0;
    FigDebugAssert3();
    v266[0] = FigSignalErrorAt();
LABEL_226:

    goto LABEL_210;
  }
  -[CMIStyleEngineCreateSpotlights setInputImageSize:](self->_createSpotlights, "setInputImageSize:", v211);
  -[CMIStyleEngineCreateSpotlights setOutputSpotlightTextureTopLeft:](self->_createSpotlights, "setOutputSpotlightTextureTopLeft:", *((_QWORD *)&v238 + 1));
  -[CMIStyleEngineCreateSpotlights setOutputSpotlightTextureTopEdge:](self->_createSpotlights, "setOutputSpotlightTextureTopEdge:", (_QWORD)v239);
  -[CMIStyleEngineCreateSpotlights setOutputSpotlightTextureTopRight:](self->_createSpotlights, "setOutputSpotlightTextureTopRight:", *((_QWORD *)&v239 + 1));
  -[CMIStyleEngineCreateSpotlights setOutputSpotlightTextureLeftEdge:](self->_createSpotlights, "setOutputSpotlightTextureLeftEdge:", (_QWORD)v240);
  -[CMIStyleEngineCreateSpotlights setOutputSpotlightTextureRightEdge:](self->_createSpotlights, "setOutputSpotlightTextureRightEdge:", *((_QWORD *)&v240 + 1));
  -[CMIStyleEngineCreateSpotlights setOutputSpotlightTextureBottomLeft:](self->_createSpotlights, "setOutputSpotlightTextureBottomLeft:", (_QWORD)v241);
  -[CMIStyleEngineCreateSpotlights setOutputSpotlightTextureBottomEdge:](self->_createSpotlights, "setOutputSpotlightTextureBottomEdge:", *((_QWORD *)&v241 + 1));
  -[CMIStyleEngineCreateSpotlights setOutputSpotlightTextureBottomRight:](self->_createSpotlights, "setOutputSpotlightTextureBottomRight:", (_QWORD)v242);
  -[CMIStyleEngineCreateSpotlights setOutputSpotlightTextureCentral:](self->_createSpotlights, "setOutputSpotlightTextureCentral:", *((_QWORD *)&v242 + 1));
  -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_CreateSpotlights"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setLabel:", v97);

  createSpotlights = self->_createSpotlights;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v266[0] = -[CMIStyleEngineCreateSpotlights enqueueToCommandBuffer:](createSpotlights, "enqueueToCommandBuffer:", v100);

  v101 = v266[0];
  if (v266[0])
  {
    fig_log_get_emitter();
    v209 = v210;
    LODWORD(v208) = v101;
    FigDebugAssert3();
    goto LABEL_226;
  }
  -[FigMetalContext commit](self->_metalContext, "commit");

  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  v103 = v102;
  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  v105 = v104;
  v106 = -[CMIStyleEngineProcessor _linearSystemNumberOfPolynomials](self, "_linearSystemNumberOfPolynomials");
  -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", vcvtd_n_u64_f64(v103* v105* (double)((v106+ v106* -[CMIStyleEngineProcessor _linearSystemNumberOfPolynomials](self, "_linearSystemNumberOfPolynomials")) >> 1), 2uLL));
  -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", (char *)&v243 + 8, self->_bufferDescriptor, 1);
  if (!*((_QWORD *)&v243 + 1))
    goto LABEL_238;
  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  v108 = v107;
  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", vcvtd_n_u64_f64(v108 * v109 * (double)((self->_weightPlaneCount + self->_weightPlaneCount * self->_weightPlaneCount) >> 1), 2uLL));
  -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", &v244, self->_bufferDescriptor, 1);
  if (!(_QWORD)v244)
    goto LABEL_238;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setTextureType:", 3);

  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  v112 = v111;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setWidth:", (unint64_t)v112);

  -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
  v115 = v114;
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "setHeight:", (unint64_t)v115);

  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setPixelFormat:", 125);

  v118 = -[CMIStyleEngineProcessor _linearSystemNumberOfPolynomials](self, "_linearSystemNumberOfPolynomials");
  -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setArrayLength:", v118);

  -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
  -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:", &v243, self->_textureDescriptor, 1);
  if (!(_QWORD)v243)
    goto LABEL_238;
  -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
  -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 4* -[CMIStyleEngineProcessor _linearSystemSize](self, "_linearSystemSize")* -[CMIStyleEngineProcessor _independentPlusSpatialAverageLinearSystemCount](self, "_independentPlusSpatialAverageLinearSystemCount")* -[CMIStyleEngineProcessor _linearSystemSize](self, "_linearSystemSize"));
  -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", (char *)&v244 + 8, self->_bufferDescriptor, 1);
  if (!*((_QWORD *)&v244 + 1))
    goto LABEL_238;
  -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
  -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 4* -[CMIStyleEngineProcessor _linearSystemSize](self, "_linearSystemSize")* -[CMIStyleEngineProcessor _linearSystemCount](self, "_linearSystemCount"));
  -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", &v245, self->_bufferDescriptor, 1);
  if (!(_QWORD)v245)
    goto LABEL_238;
  -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
  -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 4* -[CMIStyleEngineProcessor _linearSystemNumberOfExpansionTerms](self, "_linearSystemNumberOfExpansionTerms")* -[CMIStyleEngineProcessor _linearSystemCount](self, "_linearSystemCount"));
  -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", (char *)&v245 + 8, self->_bufferDescriptor, 1);
  if (!*((_QWORD *)&v245 + 1))
    goto LABEL_238;
  -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
  -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 8 * -[CMIStyleEngineProcessor _linearSystemCount](self, "_linearSystemCount"));
  -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", &v246, self->_bufferDescriptor, 1);
  if (!(_QWORD)v246)
    goto LABEL_238;
  -[CMIStyleEngineCreateLinearSystem setInputPairExpandedWeightsBuffer:](self->_createLinearSystem, "setInputPairExpandedWeightsBuffer:", (_QWORD)v244);
  -[CMIStyleEngineCreateLinearSystem setInputPolyExpandedInputBuffer:](self->_createLinearSystem, "setInputPolyExpandedInputBuffer:", *((_QWORD *)&v243 + 1));
  -[CMIStyleEngineCreateLinearSystem setInputPolyExpandedTargetTexture:](self->_createLinearSystem, "setInputPolyExpandedTargetTexture:", (_QWORD)v243);
  -[CMIStyleEngineCreateLinearSystem setOutputLHSBuffer:](self->_createLinearSystem, "setOutputLHSBuffer:", *((_QWORD *)&v244 + 1));
  -[CMIStyleEngineCreateLinearSystem setInputLHSDiagSumsBuffer:](self->_createLinearSystem, "setInputLHSDiagSumsBuffer:", (_QWORD)v245);
  -[CMIStyleEngineCreateLinearSystem setOutputRHSBuffer:](self->_createLinearSystem, "setOutputRHSBuffer:", self->_rhsBuffer);
  -[CMIStyleEngineCreateLinearSystem setInputPriorFactorForLHSBuffer:](self->_createLinearSystem, "setInputPriorFactorForLHSBuffer:", *((_QWORD *)&v245 + 1));
  -[CMIStyleEngineCreateLinearSystem setInputPriorFactorForRHSBuffer:](self->_createLinearSystem, "setInputPriorFactorForRHSBuffer:", (_QWORD)v246);
  -[CMIStyleEngineCreateLinearSystem setInputThumbnailTexture:](self->_createLinearSystem, "setInputThumbnailTexture:", *((_QWORD *)&v234 + 1));
  -[CMIStyleEngineCreateLinearSystem setInputIsLinear:](self->_createLinearSystem, "setInputIsLinear:", v22);
  -[CMIStyleEngineCreateLinearSystem setTargetThumbnailTexture:](self->_createLinearSystem, "setTargetThumbnailTexture:", *((_QWORD *)&v235 + 1));
  -[CMIStyleEngineCreateLinearSystem setTargetIsLinear:](self->_createLinearSystem, "setTargetIsLinear:", v214);
  -[CMIStyleEngineCreateLinearSystem setInputWeightPlanesTexture:](self->_createLinearSystem, "setInputWeightPlanesTexture:", *((_QWORD *)&v236 + 1));
  v120 = objc_loadWeakRetained((id *)&self->_inputLearningModulationMaskTexture);
  -[CMIStyleEngineCreateLinearSystem setInputLearningModulationMaskTexture:](self->_createLinearSystem, "setInputLearningModulationMaskTexture:", v120);

  -[CMIStyleEngineCreateLinearSystem setInputSpotlightTextureTopLeft:](self->_createLinearSystem, "setInputSpotlightTextureTopLeft:", *((_QWORD *)&v238 + 1));
  -[CMIStyleEngineCreateLinearSystem setInputSpotlightTextureTopEdge:](self->_createLinearSystem, "setInputSpotlightTextureTopEdge:", (_QWORD)v239);
  -[CMIStyleEngineCreateLinearSystem setInputSpotlightTextureTopRight:](self->_createLinearSystem, "setInputSpotlightTextureTopRight:", *((_QWORD *)&v239 + 1));
  -[CMIStyleEngineCreateLinearSystem setInputSpotlightTextureLeftEdge:](self->_createLinearSystem, "setInputSpotlightTextureLeftEdge:", (_QWORD)v240);
  -[CMIStyleEngineCreateLinearSystem setInputSpotlightTextureCentral:](self->_createLinearSystem, "setInputSpotlightTextureCentral:", *((_QWORD *)&v242 + 1));
  -[CMIStyleEngineCreateLinearSystem setInputSpotlightTextureRightEdge:](self->_createLinearSystem, "setInputSpotlightTextureRightEdge:", *((_QWORD *)&v240 + 1));
  -[CMIStyleEngineCreateLinearSystem setInputSpotlightTextureBottomLeft:](self->_createLinearSystem, "setInputSpotlightTextureBottomLeft:", (_QWORD)v241);
  -[CMIStyleEngineCreateLinearSystem setInputSpotlightTextureBottomEdge:](self->_createLinearSystem, "setInputSpotlightTextureBottomEdge:", *((_QWORD *)&v241 + 1));
  -[CMIStyleEngineCreateLinearSystem setInputSpotlightTextureBottomRight:](self->_createLinearSystem, "setInputSpotlightTextureBottomRight:", (_QWORD)v242);
  -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_CreateLinearSystem"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "setLabel:", v121);

  createLinearSystem = self->_createLinearSystem;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v266[0] = -[CMIStyleEngineCreateLinearSystem enqueueToCommandBuffer:](createLinearSystem, "enqueueToCommandBuffer:", v124);

  v125 = v266[0];
  if (v266[0])
  {
    fig_log_get_emitter();
    v209 = v210;
    LODWORD(v208) = v125;
    FigDebugAssert3();
    goto LABEL_210;
  }
  -[FigMetalContext commit](self->_metalContext, "commit");
  FigMetalDecRef((id *)&v234 + 1);
  FigMetalDecRef((id *)&v235 + 1);
  FigMetalDecRef((id *)&v236 + 1);
  FigMetalDecRef((id *)&v238 + 1);
  FigMetalDecRef((id *)&v239);
  FigMetalDecRef((id *)&v239 + 1);
  FigMetalDecRef((id *)&v240);
  FigMetalDecRef((id *)&v242 + 1);
  FigMetalDecRef((id *)&v240 + 1);
  FigMetalDecRef((id *)&v241);
  FigMetalDecRef((id *)&v241 + 1);
  FigMetalDecRef((id *)&v242);
  FigMetalDecRef((id *)&v243 + 1);
  FigMetalDecRef((id *)&v243);
  FigMetalDecRef((id *)&v244);
  FigMetalDecRef((id *)&v245);
  FigMetalDecRef((id *)&v245 + 1);
  FigMetalDecRef((id *)&v246);
  -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
  -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 4* -[CMIStyleEngineProcessor _independentPlusSpatialAverageLinearSystemCount](self, "_independentPlusSpatialAverageLinearSystemCount"));
  -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", (char *)&v246 + 8, self->_bufferDescriptor, 1);
  if (!*((_QWORD *)&v246 + 1))
    goto LABEL_238;
  -[CMIStyleEngineSolveLinearSystem setInputLHSBuffer:](self->_solveLinearSystem, "setInputLHSBuffer:", *((_QWORD *)&v244 + 1));
  -[CMIStyleEngineSolveLinearSystem setInputRHSBuffer:](self->_solveLinearSystem, "setInputRHSBuffer:", self->_rhsBuffer);
  -[CMIStyleEngineSolveLinearSystem setInputStatusBuffer:](self->_solveLinearSystem, "setInputStatusBuffer:", *((_QWORD *)&v246 + 1));
  -[CMIStyleEngineSolveLinearSystem setOutputStatus:](self->_solveLinearSystem, "setOutputStatus:", self->_linSysStatusFlagBuffer);
  -[CMIStyleEngineSolveLinearSystem setOutputCoefficients:](self->_solveLinearSystem, "setOutputCoefficients:", self->_coefficientsBuffer);
  -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_SolveLinearSystem"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setLabel:", v126);

  solveLinearSystem = self->_solveLinearSystem;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v266[0] = -[CMIStyleEngineSolveLinearSystem enqueueToCommandBuffer:](solveLinearSystem, "enqueueToCommandBuffer:", v129);

  v130 = v266[0];
  if (v266[0])
    goto LABEL_249;
  -[FigMetalContext commit](self->_metalContext, "commit");
  FigMetalDecRef((id *)&v244 + 1);
  FigMetalDecRef((id *)&v246 + 1);
LABEL_149:
  if (v250)
  {
    v150 = objc_msgSend(v250, "length");
    outputCoefficientsF16 = self->_outputCoefficientsF16;
    v152 = -[MTLBuffer length](self->_coefficientsBuffer, "length");
    v153 = 1;
    if (!outputCoefficientsF16)
      v153 = 2;
    if (v150 >> v153 < v152 >> 2)
      goto LABEL_238;
    -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_OutputCoefficients"));
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "setLabel:", v154);

    coefficientsBuffer = self->_coefficientsBuffer;
    if (self->_outputCoefficientsF16)
    {
      -[CMIStyleEngineCoefficientConverter setInputBuffer:](self->_coefficientConverterF32ToF16, "setInputBuffer:", coefficientsBuffer);
      -[CMIStyleEngineCoefficientConverter setOutputBuffer:](self->_coefficientConverterF32ToF16, "setOutputBuffer:", v250);
      coefficientConverterF32ToF16 = self->_coefficientConverterF32ToF16;
      -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v266[0] = -[CMIStyleEngineCoefficientConverter enqueueToCommandBuffer:](coefficientConverterF32ToF16, "enqueueToCommandBuffer:", v158);

      v159 = v266[0];
      if (v266[0])
      {
LABEL_155:
        fig_log_get_emitter();
        v209 = v210;
        LODWORD(v208) = v159;
        FigDebugAssert3();
        goto LABEL_210;
      }
    }
    else if (coefficientsBuffer)
    {
      -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "blitCommandEncoder");
      v161 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v161)
        goto LABEL_238;
      objc_msgSend(v161, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", self->_coefficientsBuffer, 0, v250, 0, -[MTLBuffer length](self->_coefficientsBuffer, "length"));
      objc_msgSend(v161, "endEncoding");

    }
    v162 = self->_metalSynchronizer;
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMIMetalEventSynchronizer signalEventOnCommandBuffer:forResource:](v162, "signalEventOnCommandBuffer:forResource:", v163, v250);

    -[FigMetalContext commit](self->_metalContext, "commit");
  }
  if (self->_performIntegration)
  {
    if (WeakRetained)
      v164 = 0;
    else
      v164 = v221;
    if (v164)
    {
      -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 4* (self->_weightPlaneCount >> -[CMIStyleEngineCreateWeightPlanes doColorSplit](self->_createWeightPlanes, "doColorSplit")));
      -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
      -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", (char *)&v237 + 8, self->_bufferDescriptor, 1);
      if (!*((_QWORD *)&v237 + 1))
        goto LABEL_238;
      -[CMIStyleEngineCreateWeightPlanes setInputPlaneNormalisationBuffer:](self->_createWeightPlanes, "setInputPlaneNormalisationBuffer:");
      if (-[CMIStyleEngineCreateWeightPlanes doColorSplit](self->_createWeightPlanes, "doColorSplit"))
      {
        -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 4100);
        -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
        -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", &v238, self->_bufferDescriptor, 1);
        if (!(_QWORD)v238)
          goto LABEL_238;
        -[CMIStyleEngineCreateWeightPlanes setInputThresholdCalculationBuffer:](self->_createWeightPlanes, "setInputThresholdCalculationBuffer:");
      }
      -[CMIStyleEngineCreateWeightPlanes setInputTexture:](self->_createWeightPlanes, "setInputTexture:", (_QWORD)v234);
      -[CMIStyleEngineCreateWeightPlanes setInputIsLinear:](self->_createWeightPlanes, "setInputIsLinear:", v215);
      *(float *)&v165 = self->_weightPlaneStandardDeviationForIntegrate;
      -[CMIStyleEngineCreateWeightPlanes setWeightPlanesStandardDeviation:](self->_createWeightPlanes, "setWeightPlanesStandardDeviation:", v165);
      -[CMIStyleEngineCreateWeightPlanes setApplySpatialFilter:](self->_createWeightPlanes, "setApplySpatialFilter:", self->_weightPlaneApplySpatialFilterForIntegrate);
      *(float *)&v166 = self->_weightPlaneSpatialFilterWeightForIntegrate;
      -[CMIStyleEngineCreateWeightPlanes setSpatialFilterWeight:](self->_createWeightPlanes, "setSpatialFilterWeight:", v166);
      -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_CreateWeightPlanes"));
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v168, "setLabel:", v167);

      v169 = self->_createWeightPlanes;
      -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      v266[0] = -[CMIStyleEngineCreateWeightPlanes enqueueToCommandBuffer:](v169, "enqueueToCommandBuffer:", v170);

      v130 = v266[0];
      if (v266[0])
        goto LABEL_249;
      -[FigMetalContext commit](self->_metalContext, "commit");
      FigMetalDecRef((id *)&v234);
      FigMetalDecRef((id *)&v237 + 1);
      FigMetalDecRef((id *)&v238);
    }
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "setTextureType:", 3);

    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "setPixelFormat:", 115);

    v224 = *(_QWORD *)self->_spotlightCount;
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "setWidth:", v224);

    v225 = HIDWORD(*(_QWORD *)self->_spotlightCount);
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "setHeight:", v225);

    v175 = self->_weightPlaneCount;
    v176 = -[MTLTexture arrayLength](self->_integratedCoefficientsTexture, "arrayLength");
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "setArrayLength:", v176 * v175);

    -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
    -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:", &v247, self->_textureDescriptor, 1);
    if (!(_QWORD)v247)
      goto LABEL_238;
    -[CMIStyleEngineIntegrateCoefficients setInputCoefficientsBuffer:](self->_integrateCoefficients, "setInputCoefficientsBuffer:", self->_coefficientsBuffer);
    -[CMIStyleEngineIntegrateCoefficients setInputCoefficientsTexture:](self->_integrateCoefficients, "setInputCoefficientsTexture:", (_QWORD)v247);
    -[CMIStyleEngineIntegrateCoefficients setOutputIntegratedCoefficientsTexture:](self->_integrateCoefficients, "setOutputIntegratedCoefficientsTexture:", self->_integratedCoefficientsTexture);
    -[CMIStyleEngineIntegrateCoefficients setLinearSystemStatus:](self->_integrateCoefficients, "setLinearSystemStatus:", self->_linSysStatusFlagBuffer);
    -[CMIStyleEngineIntegrateCoefficients setInputWeightPlanesTexture:](self->_integrateCoefficients, "setInputWeightPlanesTexture:", (_QWORD)v237);
    -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_IntegrateCoefficients"));
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "setLabel:", v178);

    integrateCoefficients = self->_integrateCoefficients;
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v266[0] = -[CMIStyleEngineIntegrateCoefficients enqueueToCommandBuffer:](integrateCoefficients, "enqueueToCommandBuffer:", v181);

    v130 = v266[0];
    if (!v266[0])
    {
      -[FigMetalContext commit](self->_metalContext, "commit");
      FigMetalDecRef((id *)&v237);
      FigMetalDecRef((id *)&v247);
      goto LABEL_174;
    }
LABEL_249:
    fig_log_get_emitter();
    v209 = v210;
    LODWORD(v208) = v130;
    FigDebugAssert3();
    goto LABEL_210;
  }
LABEL_174:
  if (self->_performApplication)
  {
    v182 = self->_inputPixelBuffer;
    if (v182 && (_QWORD)v251 && *((_QWORD *)&v251 + 1))
    {
      v231 = 0u;
      v232 = 0u;
      v229 = 0u;
      v230 = 0u;
      v183 = CMIGetRGBFromYCCConversionMatrixForPixelBuffer(v182, (uint64_t)&v229);
      if (v183)
        goto LABEL_253;
      -[CMIStyleEngineApplyStyle setInputLumaTexture:](self->_applyStyle, "setInputLumaTexture:", (_QWORD)v251);
      -[CMIStyleEngineApplyStyle setInputChromaTexture:](self->_applyStyle, "setInputChromaTexture:", *((_QWORD *)&v251 + 1));
      -[CMIStyleEngineApplyStyle setCcmYUVToRGB:](self->_applyStyle, "setCcmYUVToRGB:", *(double *)&v229, *(double *)&v230, *(double *)&v231, *(double *)&v232);
      -[CMIStyleEngineApplyStyle setInputTexture:](self->_applyStyle, "setInputTexture:", 0);
    }
    else
    {
      -[CMIStyleEngineApplyStyle setInputTexture:](self->_applyStyle, "setInputTexture:", (_QWORD)v253);
      -[CMIStyleEngineApplyStyle setInputChromaTexture:](self->_applyStyle, "setInputChromaTexture:", 0);
      -[CMIStyleEngineApplyStyle setInputLumaTexture:](self->_applyStyle, "setInputLumaTexture:", 0);
    }
    v184 = self->_outputPixelBuffer;
    if (v184 && (_QWORD)v252 && *((_QWORD *)&v252 + 1))
    {
      v231 = 0u;
      v232 = 0u;
      v229 = 0u;
      v230 = 0u;
      v183 = CMIGetYCCFromRGBConversionMatrixForPixelBuffer(v184, (uint64_t)&v229);
      if (v183)
        goto LABEL_253;
      -[CMIStyleEngineApplyStyle setOutputLumaTexture:](self->_applyStyle, "setOutputLumaTexture:", (_QWORD)v252);
      -[CMIStyleEngineApplyStyle setOutputChromaTexture:](self->_applyStyle, "setOutputChromaTexture:", *((_QWORD *)&v252 + 1));
      -[CMIStyleEngineApplyStyle setCcmRGBToYUV:](self->_applyStyle, "setCcmRGBToYUV:", *(double *)&v229, *(double *)&v230, *(double *)&v231, *(double *)&v232);
      -[CMIStyleEngineApplyStyle setOutputTexture:](self->_applyStyle, "setOutputTexture:", 0);
    }
    else
    {
      -[CMIStyleEngineApplyStyle setOutputTexture:](self->_applyStyle, "setOutputTexture:", *((_QWORD *)&v253 + 1));
      -[CMIStyleEngineApplyStyle setOutputChromaTexture:](self->_applyStyle, "setOutputChromaTexture:", 0);
      -[CMIStyleEngineApplyStyle setOutputLumaTexture:](self->_applyStyle, "setOutputLumaTexture:", 0);
    }
    -[CMIStyleEngineApplyStyle setInputIntegratedCoefficientsTexture:](self->_applyStyle, "setInputIntegratedCoefficientsTexture:", self->_integratedCoefficientsTexture);
    -[CMIStyleEngineApplyStyle setLinearSystemStatus:](self->_applyStyle, "setLinearSystemStatus:", self->_linSysStatusFlagBuffer);
    -[CMIStyleEngineApplyStyle setInputIsLinear:](self->_applyStyle, "setInputIsLinear:", v213);
    -[CMIStyleEngineApplyStyle setOutputShouldBeLinear:](self->_applyStyle, "setOutputShouldBeLinear:", v212);
    -[CMIStyleEngineApplyStyle setImageSize:](self->_applyStyle, "setImageSize:", self->_imageSize.width, self->_imageSize.height);
    -[CMIStyleEngineApplyStyle setInputImageRect:](self->_applyStyle, "setInputImageRect:", self->_inputImageRect.origin.x, self->_inputImageRect.origin.y, self->_inputImageRect.size.width, self->_inputImageRect.size.height);
    -[CMIStyleEngineApplyStyle setOutputImageRect:](self->_applyStyle, "setOutputImageRect:", self->_outputImageRect.origin.x, self->_outputImageRect.origin.y, self->_outputImageRect.size.width, self->_outputImageRect.size.height);
    -[CMIStyleEngineApplyStyle setRegionToRender:](self->_applyStyle, "setRegionToRender:", self->_regionToRender.origin.x, self->_regionToRender.origin.y, self->_regionToRender.size.width, self->_regionToRender.size.height);
    if (!-[CMIStyleEngineProcessor _applyResidualCorrection](self, "_applyResidualCorrection"))
    {
LABEL_190:
      inputDeltaMapPixelBuffer = self->_inputDeltaMapPixelBuffer;
      if (inputDeltaMapPixelBuffer && (_QWORD)v260 && *((_QWORD *)&v260 + 1))
      {
        v231 = 0u;
        v232 = 0u;
        v229 = 0u;
        v230 = 0u;
        v183 = CMIGetRGBFromYCCConversionMatrixForPixelBuffer(inputDeltaMapPixelBuffer, (uint64_t)&v229);
        if (v183)
          goto LABEL_253;
        -[CMIStyleEngineApplyStyle setInputDeltaLumaTexture:](self->_applyStyle, "setInputDeltaLumaTexture:", (_QWORD)v260);
        -[CMIStyleEngineApplyStyle setInputDeltaChromaTexture:](self->_applyStyle, "setInputDeltaChromaTexture:", *((_QWORD *)&v260 + 1));
        -[CMIStyleEngineApplyStyle setCcmYUVToRGBDelta:](self->_applyStyle, "setCcmYUVToRGBDelta:", *(double *)&v229, *(double *)&v230, *(double *)&v231, *(double *)&v232);
        -[CMIStyleEngineApplyStyle setInputDeltaTexture:](self->_applyStyle, "setInputDeltaTexture:", 0);
      }
      else
      {
        -[CMIStyleEngineApplyStyle setInputDeltaTexture:](self->_applyStyle, "setInputDeltaTexture:", *((_QWORD *)&v259 + 1));
        -[CMIStyleEngineApplyStyle setInputDeltaChromaTexture:](self->_applyStyle, "setInputDeltaChromaTexture:", 0);
        -[CMIStyleEngineApplyStyle setInputDeltaLumaTexture:](self->_applyStyle, "setInputDeltaLumaTexture:", 0);
      }
      inputOriginalPixelBuffer = self->_inputOriginalPixelBuffer;
      if (!inputOriginalPixelBuffer || !*((_QWORD *)&v258 + 1) || !(_QWORD)v259)
      {
        -[CMIStyleEngineApplyStyle setInputOriginalTexture:](self->_applyStyle, "setInputOriginalTexture:", (_QWORD)v258);
        -[CMIStyleEngineApplyStyle setInputOriginalChromaTexture:](self->_applyStyle, "setInputOriginalChromaTexture:", 0);
        -[CMIStyleEngineApplyStyle setInputOriginalLumaTexture:](self->_applyStyle, "setInputOriginalLumaTexture:", 0);
        goto LABEL_202;
      }
      v231 = 0u;
      v232 = 0u;
      v229 = 0u;
      v230 = 0u;
      v183 = CMIGetRGBFromYCCConversionMatrixForPixelBuffer(inputOriginalPixelBuffer, (uint64_t)&v229);
      if (!v183)
      {
        -[CMIStyleEngineApplyStyle setInputOriginalLumaTexture:](self->_applyStyle, "setInputOriginalLumaTexture:", *((_QWORD *)&v258 + 1));
        -[CMIStyleEngineApplyStyle setInputOriginalChromaTexture:](self->_applyStyle, "setInputOriginalChromaTexture:", (_QWORD)v259);
        -[CMIStyleEngineApplyStyle setCcmYUVToRGBOriginal:](self->_applyStyle, "setCcmYUVToRGBOriginal:", *(double *)&v229, *(double *)&v230, *(double *)&v231, *(double *)&v232);
        -[CMIStyleEngineApplyStyle setInputOriginalTexture:](self->_applyStyle, "setInputOriginalTexture:", 0);
LABEL_202:
        -[CMIStyleEngineApplyStyle setDeltaImageRect:](self->_applyStyle, "setDeltaImageRect:", self->_optionalInputImageRect.origin.x, self->_optionalInputImageRect.origin.y, self->_optionalInputImageRect.size.width, self->_optionalInputImageRect.size.height);
        -[CMIStyleEngineApplyStyle setOutputLumaGradientTexture:](self->_applyStyle, "setOutputLumaGradientTexture:", *((_QWORD *)&v261 + 1));
        if (!-[CMIStyleEngineConfiguration applySyntheticNoise](self->_configuration, "applySyntheticNoise"))
        {
LABEL_206:
          -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_ApplyStyle"));
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "setLabel:", v196);

          applyStyle = self->_applyStyle;
          -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          v266[0] = -[CMIStyleEngineApplyStyle enqueueToCommandBuffer:](applyStyle, "enqueueToCommandBuffer:", v199);

          v159 = v266[0];
          if (v266[0])
            goto LABEL_155;
          -[FigMetalContext commit](self->_metalContext, "commit");
          -[CMIStyleEngineApplyStyle setInputLumaTexture:](self->_applyStyle, "setInputLumaTexture:", 0);
          -[CMIStyleEngineApplyStyle setInputChromaTexture:](self->_applyStyle, "setInputChromaTexture:", 0);
          -[CMIStyleEngineApplyStyle setOutputLumaTexture:](self->_applyStyle, "setOutputLumaTexture:", 0);
          -[CMIStyleEngineApplyStyle setOutputChromaTexture:](self->_applyStyle, "setOutputChromaTexture:", 0);
          -[CMIStyleEngineApplyStyle setInputTexture:](self->_applyStyle, "setInputTexture:", 0);
          -[CMIStyleEngineApplyStyle setInputIntegratedCoefficientsTexture:](self->_applyStyle, "setInputIntegratedCoefficientsTexture:", 0);
          -[CMIStyleEngineApplyStyle setOutputTexture:](self->_applyStyle, "setOutputTexture:", 0);
          -[CMIStyleEngineApplyStyle setInputThumbnailTexture:](self->_applyStyle, "setInputThumbnailTexture:", 0);
          -[CMIStyleEngineApplyStyle setTargetThumbnailTexture:](self->_applyStyle, "setTargetThumbnailTexture:", 0);
          -[CMIStyleEngineApplyStyle setResidualTexture:](self->_applyStyle, "setResidualTexture:", 0);
          -[CMIStyleEngineApplyStyle setLinearSystemStatus:](self->_applyStyle, "setLinearSystemStatus:", 0);
          -[CMIStyleEngineApplyStyle setInputDeltaTexture:](self->_applyStyle, "setInputDeltaTexture:", 0);
          -[CMIStyleEngineApplyStyle setInputDeltaLumaTexture:](self->_applyStyle, "setInputDeltaLumaTexture:", 0);
          -[CMIStyleEngineApplyStyle setInputDeltaChromaTexture:](self->_applyStyle, "setInputDeltaChromaTexture:", 0);
          -[CMIStyleEngineApplyStyle setInputOriginalTexture:](self->_applyStyle, "setInputOriginalTexture:", 0);
          -[CMIStyleEngineApplyStyle setInputOriginalLumaTexture:](self->_applyStyle, "setInputOriginalLumaTexture:", 0);
          -[CMIStyleEngineApplyStyle setInputOriginalChromaTexture:](self->_applyStyle, "setInputOriginalChromaTexture:", 0);
          -[CMIStyleEngineApplyStyle setOutputLumaGradientTexture:](self->_applyStyle, "setOutputLumaGradientTexture:", 0);
          -[CMIStyleEngineApplyStyle setLumaGradientHistogramBuffer:](self->_applyStyle, "setLumaGradientHistogramBuffer:", 0);
          -[CMIStyleEngineApplyStyle setMaxLumaGradient90thPercentileBuffer:](self->_applyStyle, "setMaxLumaGradient90thPercentileBuffer:", 0);
          FigMetalDecRef((id *)&v235);
          FigMetalDecRef((id *)&v236);
          FigMetalDecRef((id *)&v247 + 1);
          FigMetalDecRef((id *)&v248);
          FigMetalDecRef((id *)&v248 + 1);
          goto LABEL_208;
        }
        -[CMIStyleEngineApplyStyle setInputTexture:](self->_applyStyle, "setInputTexture:", (_QWORD)v253);
        -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 1024);
        -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
        -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", &v248, self->_bufferDescriptor, 1);
        if ((_QWORD)v248)
        {
          -[CMIStyleEngineApplyStyle setLumaGradientHistogramBuffer:](self->_applyStyle, "setLumaGradientHistogramBuffer:");
          -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", 4);
          -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
          -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", (char *)&v248 + 8, self->_bufferDescriptor, 1);
          if (*((_QWORD *)&v248 + 1))
          {
            -[CMIStyleEngineApplyStyle setMaxLumaGradient90thPercentileBuffer:](self->_applyStyle, "setMaxLumaGradient90thPercentileBuffer:");
            goto LABEL_206;
          }
        }
        goto LABEL_238;
      }
LABEL_253:
      fig_log_get_emitter();
      v209 = v210;
      LODWORD(v208) = v183;
      FigDebugAssert3();
      v206 = FigSignalErrorAt();
      goto LABEL_266;
    }
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "setTextureType:", 2);

    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "setPixelFormat:", 115);

    -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
    v188 = v187;
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "setWidth:", (unint64_t)v188);

    -[CMIStyleEngineConfiguration thumbnailSize](self->_configuration, "thumbnailSize");
    v191 = v190;
    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "setHeight:", (unint64_t)v191);

    -[FigMetalTextureDescriptor desc](self->_textureDescriptor, "desc");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "setArrayLength:", 1);

    -[FigMetalTextureDescriptor setLabel:](self->_textureDescriptor, "setLabel:", 0);
    -[CMIStyleEngineProcessor _allocateTexture:withDescriptor:useFigMetalAllocator:](self, "_allocateTexture:withDescriptor:useFigMetalAllocator:", (char *)&v247 + 8, self->_textureDescriptor, 1);
    if (*((_QWORD *)&v247 + 1))
    {
      -[CMIStyleEngineApplyStyle setResidualTexture:](self->_applyStyle, "setResidualTexture:");
      -[CMIStyleEngineApplyStyle setInputThumbnailTexture:](self->_applyStyle, "setInputThumbnailTexture:", (_QWORD)v235);
      -[CMIStyleEngineApplyStyle setInputThumbnailIsLinear:](self->_applyStyle, "setInputThumbnailIsLinear:", v227);
      -[CMIStyleEngineApplyStyle setTargetThumbnailTexture:](self->_applyStyle, "setTargetThumbnailTexture:", (_QWORD)v236);
      -[CMIStyleEngineApplyStyle setTargetThumbnailIsLinear:](self->_applyStyle, "setTargetThumbnailIsLinear:", v222);
      goto LABEL_190;
    }
LABEL_238:
    fig_log_get_emitter();
    v209 = v210;
    LODWORD(v208) = 0;
    FigDebugAssert3();
    v206 = FigSignalErrorAt();
    goto LABEL_266;
  }
LABEL_208:
  if (-[FigMetalContext allowCommandBufferCommitsOnlyByForceCommit](self->_metalContext, "allowCommandBufferCommitsOnlyByForceCommit"))
  {
    -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine"));
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v201, "setLabel:", v200);

    -[FigMetalContext forceCommit](self->_metalContext, "forceCommit");
  }
LABEL_210:
  if (-[CMIStyleEngineConfiguration shouldFlushCVMTLTextureCacheAfterProcessing](self->_configuration, "shouldFlushCVMTLTextureCacheAfterProcessing", v208, v209))
  {
    -[CMIMetalResourceCache flush](self->_textureCache, "flush");
  }
  if (-[CMIStyleEngineConfiguration shouldFlushCVMTLBufferCacheAfterProcessing](self->_configuration, "shouldFlushCVMTLBufferCacheAfterProcessing"))
  {
    CVMetalBufferCacheFlush();
  }
  FigMetalDecRef((id *)&obj);
  FigMetalDecRef((id *)&obj + 1);
  FigMetalDecRef((id *)&v234 + 1);
  FigMetalDecRef((id *)&v234);
  FigMetalDecRef((id *)&v235);
  FigMetalDecRef((id *)&v235 + 1);
  FigMetalDecRef((id *)&v236);
  FigMetalDecRef((id *)&v236 + 1);
  FigMetalDecRef((id *)&v237);
  FigMetalDecRef((id *)&v237 + 1);
  FigMetalDecRef((id *)&v238);
  FigMetalDecRef((id *)&v238 + 1);
  FigMetalDecRef((id *)&v242);
  FigMetalDecRef((id *)&v241 + 1);
  FigMetalDecRef((id *)&v241);
  FigMetalDecRef((id *)&v240 + 1);
  FigMetalDecRef((id *)&v239);
  FigMetalDecRef((id *)&v239 + 1);
  FigMetalDecRef((id *)&v240);
  FigMetalDecRef((id *)&v242 + 1);
  FigMetalDecRef((id *)&v246);
  FigMetalDecRef((id *)&v245 + 1);
  FigMetalDecRef((id *)&v245);
  FigMetalDecRef((id *)&v244 + 1);
  FigMetalDecRef((id *)&v243);
  FigMetalDecRef((id *)&v244);
  FigMetalDecRef((id *)&v243 + 1);
  FigMetalDecRef((id *)&v246 + 1);
  FigMetalDecRef((id *)&v247);
  FigMetalDecRef((id *)&v247 + 1);
  FigMetalDecRef((id *)&v248);
  FigMetalDecRef((id *)&v248 + 1);
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = objc_msgSend(v202, "usedSizeAll");

  v204 = v266[0];
  if (v203 != v219)
  {
    if (!v266[0])
      v204 = 2;
    v266[0] = v204;
  }
  __destructor_8_S_s0_S_s8_s16_s24_s32_S_s40_s48_S_s56_s64_s72_s80_S_s88_s96_s104_s112_s120_s128_s136_s144_s152_S_s160_s168_s176_s184_s192_s200_s208_S_s216_S_s224_S_s232_s240_s248((id *)&obj);

  __destructor_8_s0_s8_s16_s24_s32_s40_s48_s56_s64_s72_s80_s88_s96_s104_s112_s120_s128_s136_s144_s152_s160_s168((id *)&v251);
  objc_destroyWeak(&v264);
  objc_destroyWeak(&location);

  return v204;
}

id __34__CMIStyleEngineProcessor_process__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id *WeakRetained;
  CMIStyleEngineDownscaledTextureSource *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  unint64_t v22;
  void *v23;
  double v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v41;

  v7 = a2;
  v8 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v41 = 0;
  v10 = -[CMIStyleEngineDownscaledTextureSource initWithSourceTexture:filter:]([CMIStyleEngineDownscaledTextureSource alloc], "initWithSourceTexture:filter:", v7, a3);
  if (!v10 || (v11 = *(void **)(a1 + 32)) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_14;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v12;
  if (!v12)
  {
    v15 = (double)(unint64_t)objc_msgSend(v7, "width");
    objc_msgSend(WeakRetained[90], "thumbnailSize");
    if (v16 == v15)
    {
      v17 = (double)(unint64_t)objc_msgSend(v7, "height");
      objc_msgSend(WeakRetained[90], "thumbnailSize");
      if (v18 == v17)
      {
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v10);
        FigMetalIncRef(v7);
        v14 = v7;
        goto LABEL_11;
      }
    }
    objc_msgSend(WeakRetained[25], "desc");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextureType:", 2);

    objc_msgSend(WeakRetained[25], "desc");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPixelFormat:", 115);

    objc_msgSend(WeakRetained[90], "thumbnailSize");
    v22 = (unint64_t)v21;
    objc_msgSend(WeakRetained[25], "desc");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWidth:", v22);

    objc_msgSend(WeakRetained[90], "thumbnailSize");
    v25 = (unint64_t)v24;
    objc_msgSend(WeakRetained[25], "desc");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHeight:", v25);

    objc_msgSend(WeakRetained[25], "desc");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDepth:", 1);

    objc_msgSend(WeakRetained[25], "desc");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setArrayLength:", 1);

    objc_msgSend(WeakRetained[25], "desc");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setUsage:", 7);

    objc_msgSend(WeakRetained[25], "setLabel:", 0);
    objc_msgSend(WeakRetained, "_allocateTexture:withDescriptor:useFigMetalAllocator:", &v41, WeakRetained[25], 1);
    if (v41)
    {
      objc_msgSend(WeakRetained[27], "setInputTexture:", v7);
      objc_msgSend(WeakRetained[27], "setOutputTexture:", v41);
      v30 = *MEMORY[0x1E0C9D628];
      v31 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v32 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v33 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      objc_msgSend(WeakRetained[27], "setInputCropRect:", *MEMORY[0x1E0C9D628], v31, v32, v33);
      objc_msgSend(WeakRetained[27], "setFilter:", a3);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("StyleEngine_Downsample_%@"), v8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_instanceLabel:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained[22], "commandBuffer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setLabel:", v35);

      v37 = WeakRetained[27];
      objc_msgSend(WeakRetained[22], "commandBuffer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v37) = objc_msgSend(v37, "enqueueToCommandBuffer:", v38);

      if (!(_DWORD)v37)
      {
        objc_msgSend(WeakRetained[22], "commit");
        objc_msgSend(WeakRetained[27], "setInputTexture:", 0);
        objc_msgSend(WeakRetained[27], "setOutputTexture:", 0);
        objc_msgSend(WeakRetained[27], "setInputCropRect:", v30, v31, v32, v33);
        objc_msgSend(WeakRetained[27], "setFilter:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v41, v10);
        v14 = v41;
        goto LABEL_11;
      }
    }
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
    FigMetalDecRef(&v41);
    v39 = 0;
    goto LABEL_12;
  }
  v13 = v12;
  FigMetalIncRef(v12);
  v14 = v13;
LABEL_11:
  v39 = v14;
LABEL_12:

  return v39;
}

int32x2_t __34__CMIStyleEngineProcessor_process__block_invoke_453(uint32x2_t *a1, int32x2_t a2)
{
  int32x2_t v2;
  int32x2_t v3;
  int32x2_t v4;

  v2 = (int32x2_t)a1[4];
  v3 = (int32x2_t)a1[5];
  v4 = (int32x2_t)vqsub_u32((uint32x2_t)vmul_s32(v2, a2), (uint32x2_t)v3);
  return vsub_s32((int32x2_t)vmax_u32(vmin_u32((uint32x2_t)vadd_s32(vmla_s32(v3, v2, vadd_s32(a2, (int32x2_t)0x100000001)), (int32x2_t)-1), a1[6]), (uint32x2_t)vadd_s32(v4, (int32x2_t)0x100000001)), v4);
}

- (int)downScaleInputTexture:(id)a3 toOutputTexture:(id)a4
{
  return -[CMIStyleEngineProcessor downScaleInputTexture:withInputCropRect:toOutputTexture:](self, "downScaleInputTexture:withInputCropRect:toOutputTexture:", a3, a4, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (int)downScaleInputTexture:(id)a3 withInputCropRect:(CGRect)a4 toOutputTexture:(id)a5
{
  return -[CMIStyleEngineProcessor downScaleInputTexture:withInputCropRect:usingBoxSize:toOutputTexture:](self, "downScaleInputTexture:withInputCropRect:usingBoxSize:toOutputTexture:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (int)downScaleInputTexture:(id)a3 withInputCropRect:(CGRect)a4 usingBoxSize:(CGSize)a5 toOutputTexture:(id)a6
{
  return -[CMIStyleEngineProcessor downScaleInputTexture:withInputCropRect:usingBoxSize:toOutputTexture:filter:gdcParams:](self, "downScaleInputTexture:withInputCropRect:usingBoxSize:toOutputTexture:filter:gdcParams:", a3, a6, 0, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
}

- (int)downScaleInputTexture:(id)a3 withInputCropRect:(CGRect)a4 usingBoxSize:(CGSize)a5 toOutputTexture:(id)a6 filter:(unint64_t)a7 gdcParams:(id *)a8
{
  uint64_t v8;
  double height;
  double width;
  double v14;
  double v15;
  double y;
  double x;
  id v19;
  id v20;
  CMIStyleEngineDownScaler *downScale;
  void *v22;
  void *v23;
  CMIStyleEngineDownScaler *v24;
  void *v25;
  int v26;
  CMIMetalEventSynchronizer *metalSynchronizer;
  void *v28;
  uint64_t v30;
  uint64_t v31;

  height = a5.height;
  width = a5.width;
  v14 = a4.size.height;
  v15 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a3;
  v20 = a6;
  downScale = self->_downScale;
  if (downScale)
  {
    -[CMIStyleEngineDownScaler setInputTexture:](downScale, "setInputTexture:", v19);
    -[CMIStyleEngineDownScaler setOutputTexture:](self->_downScale, "setOutputTexture:", v20);
    -[CMIStyleEngineDownScaler setInputCropRect:](self->_downScale, "setInputCropRect:", x, y, v15, v14);
    -[CMIStyleEngineDownScaler setBoxSize:](self->_downScale, "setBoxSize:", width, height);
    -[CMIStyleEngineDownScaler setFilter:](self->_downScale, "setFilter:", a7);
    -[CMIStyleEngineDownScaler setGdcParams:](self->_downScale, "setGdcParams:", a8);
    -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_Downscale"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLabel:", v22);

    v24 = self->_downScale;
    -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[CMIStyleEngineDownScaler enqueueToCommandBuffer:](v24, "enqueueToCommandBuffer:", v25);

    if (v26)
    {
      fig_log_get_emitter();
      v31 = v8;
      LODWORD(v30) = v26;
      FigDebugAssert3();
    }
    else
    {
      -[CMIStyleEngineDownScaler setInputCropRect:](self->_downScale, "setInputCropRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      -[CMIStyleEngineDownScaler setBoxSize:](self->_downScale, "setBoxSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      -[CMIStyleEngineDownScaler setFilter:](self->_downScale, "setFilter:", 0);
      -[CMIStyleEngineDownScaler setGdcParams:](self->_downScale, "setGdcParams:", 0);
      metalSynchronizer = self->_metalSynchronizer;
      -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CMIMetalEventSynchronizer signalEventOnCommandBuffer:forResource:](metalSynchronizer, "signalEventOnCommandBuffer:forResource:", v28, v20);

      -[FigMetalContext forceCommit](self->_metalContext, "forceCommit");
      v26 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    v31 = v8;
    LODWORD(v30) = 0;
    FigDebugAssert3();
    v26 = FigSignalErrorAt();
  }
  if (-[CMIStyleEngineConfiguration shouldFlushCVMTLTextureCacheAfterProcessing](self->_configuration, "shouldFlushCVMTLTextureCacheAfterProcessing", v30, v31))
  {
    -[CMIMetalResourceCache flush](self->_textureCache, "flush");
  }

  return v26;
}

- (int)downScaleInputPixelBuffer:(__CVBuffer *)a3 toOutputPixelBuffer:(__CVBuffer *)a4
{
  return -[CMIStyleEngineProcessor downScaleInputPixelBuffer:toOutputPixelBuffer:copyAttachments:](self, "downScaleInputPixelBuffer:toOutputPixelBuffer:copyAttachments:", a3, a4, 0);
}

- (int)downScaleInputPixelBuffer:(__CVBuffer *)a3 toOutputPixelBuffer:(__CVBuffer *)a4 copyAttachments:(BOOL)a5
{
  return -[CMIStyleEngineProcessor downScaleInputPixelBuffer:withInputCropRect:toOutputPixelBuffer:copyAttachments:](self, "downScaleInputPixelBuffer:withInputCropRect:toOutputPixelBuffer:copyAttachments:", a3, a4, a5, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (int)downScaleInputPixelBuffer:(__CVBuffer *)a3 toOutputPixelBuffer:(__CVBuffer *)a4 copyAttachments:(BOOL)a5 gdcParams:(id *)a6
{
  return -[CMIStyleEngineProcessor downScaleInputPixelBuffer:withInputCropRect:usingBoxSize:toOutputPixelBuffer:filter:copyAttachments:gdcParams:](self, "downScaleInputPixelBuffer:withInputCropRect:usingBoxSize:toOutputPixelBuffer:filter:copyAttachments:gdcParams:", a3, a4, 0, a5, a6, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (int)downScaleInputPixelBuffer:(__CVBuffer *)a3 withInputCropRect:(CGRect)a4 toOutputPixelBuffer:(__CVBuffer *)a5 copyAttachments:(BOOL)a6
{
  return -[CMIStyleEngineProcessor downScaleInputPixelBuffer:withInputCropRect:usingBoxSize:toOutputPixelBuffer:copyAttachments:](self, "downScaleInputPixelBuffer:withInputCropRect:usingBoxSize:toOutputPixelBuffer:copyAttachments:", a3, a5, a6, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (int)downScaleInputPixelBuffer:(__CVBuffer *)a3 withInputCropRect:(CGRect)a4 usingBoxSize:(CGSize)a5 toOutputPixelBuffer:(__CVBuffer *)a6 copyAttachments:(BOOL)a7
{
  return -[CMIStyleEngineProcessor downScaleInputPixelBuffer:withInputCropRect:usingBoxSize:toOutputPixelBuffer:filter:copyAttachments:gdcParams:](self, "downScaleInputPixelBuffer:withInputCropRect:usingBoxSize:toOutputPixelBuffer:filter:copyAttachments:gdcParams:", a3, a6, 0, a7, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
}

- (int)downScaleInputPixelBuffer:(__CVBuffer *)a3 withInputCropRect:(CGRect)a4 usingBoxSize:(CGSize)a5 toOutputPixelBuffer:(__CVBuffer *)a6 filter:(unint64_t)a7 copyAttachments:(BOOL)a8 gdcParams:(id *)a9
{
  uint64_t v9;
  _BOOL4 v11;
  double height;
  double width;
  CGFloat v16;
  CGFloat v17;
  CGFloat y;
  CGFloat x;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  double v31;
  double v32;
  int v33;
  int v34;
  BOOL v35;
  uint64_t v37;
  uint64_t v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  id v41;
  id v42[2];
  CGRect v43;
  CGRect v44;

  v11 = a8;
  height = a5.height;
  width = a5.width;
  v16 = a4.size.height;
  v17 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v22 = +[CMIStyleEngineProcessorUtilities numberOfPixelBufferPlanesThatNeedToBeBoundToMTLTextures:](CMIStyleEngineProcessorUtilities, "numberOfPixelBufferPlanesThatNeedToBeBoundToMTLTextures:");
  if (v22)
  {
    v23 = v22;
    v24 = +[CMIStyleEngineProcessorUtilities numberOfPixelBufferPlanesThatNeedToBeBoundToMTLTextures:](CMIStyleEngineProcessorUtilities, "numberOfPixelBufferPlanesThatNeedToBeBoundToMTLTextures:", a6);
    if (v24)
    {
      if (v23 == v24)
      {
        if (v11 && a3 && a6)
          CVBufferPropagateAttachments(a3, a6);
        v25 = cmisep_pixelBufferSize(a3, 0);
        v27 = v26;
        v28 = 0;
        v29 = v23 - 1;
        while (1)
        {
          v41 = 0;
          v42[0] = 0;
          v30 = -[CMIStyleEngineProcessor _bindPixelBufferToTexture:usage:texturePtr:plane:](self, "_bindPixelBufferToTexture:usage:texturePtr:plane:", a3, 1, v42, v28, v37, v38);
          if (v30
            || (v30 = -[CMIStyleEngineProcessor _bindPixelBufferToTexture:usage:texturePtr:plane:](self, "_bindPixelBufferToTexture:usage:texturePtr:plane:", a6, 65543, &v41, v28)) != 0)
          {
            v33 = v30;
            fig_log_get_emitter();
            v38 = v9;
            LODWORD(v37) = v33;
          }
          else
          {
            v31 = cmisep_pixelBufferSize(a3, v28);
            memset(&v40, 0, sizeof(v40));
            CGAffineTransformMakeScale(&v40, v31 / v25, v32 / v27);
            v39 = v40;
            v43.origin.x = x;
            v43.origin.y = y;
            v43.size.width = v17;
            v43.size.height = v16;
            v44 = CGRectApplyAffineTransform(v43, &v39);
            v33 = -[CMIStyleEngineProcessor downScaleInputTexture:withInputCropRect:usingBoxSize:toOutputTexture:filter:gdcParams:](self, "downScaleInputTexture:withInputCropRect:usingBoxSize:toOutputTexture:filter:gdcParams:", v42[0], v41, a7, a9, v44.origin.x, v44.origin.y, v44.size.width, v44.size.height, width, height);
            if (!v33)
            {
              v34 = 0;
              goto LABEL_13;
            }
            fig_log_get_emitter();
            v38 = v9;
            LODWORD(v37) = v33;
          }
          FigDebugAssert3();
          v34 = 4;
LABEL_13:

          if (!v34)
          {
            v35 = v29 == (_DWORD)v28;
            v28 = (v28 + 1);
            if (!v35)
              continue;
          }
          return v33;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)finishProcessing
{
  MTLBuffer *linSysStatusFlagBuffer;

  -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
  linSysStatusFlagBuffer = self->_linSysStatusFlagBuffer;
  if (linSysStatusFlagBuffer && *(_BYTE *)-[MTLBuffer contents](linSysStatusFlagBuffer, "contents"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  else
  {
    if (self->_performLearning)
      self->_outputCoefficientsReady = 1;
    return 0;
  }
}

- (void)forceMetalCachesFlush
{
  -[CMIMetalResourceCache flush](self->_textureCache, "flush");
  CVMetalBufferCacheFlush();
}

- (int)purgeResources
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  int v8;

  -[CMIStyleEngineProcessor _freePermanentResources](self, "_freePermanentResources");
  -[CMIMetalResourceCache flush](self->_textureCache, "flush");
  CVMetalBufferCacheFlush();
  -[FigMetalContext allocator](self->_metalContext, "allocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usedSizeAll");

  if (v4 && (v5 = FigSignalErrorAt()) != 0)
  {
    v8 = v5;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    if (self->_memoryAllocationType == 1)
    {
      -[FigMetalContext allocator](self->_metalContext, "allocator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reset");

      -[FigMetalContext allocator](self->_metalContext, "allocator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "purgeResources");

    }
    v8 = 0;
    self->_memoryAllocationType = 0;
    self->_outputCoefficientsReady = 0;
  }
  return v8;
}

- (void)dealloc
{
  __CVMetalBufferCache *bufferCache;
  objc_super v4;

  -[CMIStyleEngineProcessor purgeResources](self, "purgeResources");
  bufferCache = self->_bufferCache;
  if (bufferCache)
  {
    CFRelease(bufferCache);
    self->_bufferCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CMIStyleEngineProcessor;
  -[CMIStyleEngineProcessor dealloc](&v4, sel_dealloc);
}

- (int)resetState
{
  NSData *inputLinearSystemCoefficients;
  CGPoint v4;
  CGSize v5;

  objc_storeWeak((id *)&self->_apiInputThumbnailTexture, 0);
  self->_inputThumbnailPixelBuffer = 0;
  objc_storeWeak((id *)&self->_apiInputThumbnailTextureForLearning, 0);
  self->_inputThumbnailPixelBufferForLearning = 0;
  objc_storeWeak((id *)&self->_apiInputThumbnailTextureForLearningWeights, 0);
  self->_inputThumbnailPixelBufferForLearningWeights = 0;
  objc_storeWeak((id *)&self->_apiInputThumbnailTextureForIntegration, 0);
  self->_inputThumbnailPixelBufferForIntegration = 0;
  objc_storeWeak((id *)&self->_apiInputThumbnailTextureForResidualCorrection, 0);
  self->_inputThumbnailPixelBufferForResidualCorrection = 0;
  objc_storeWeak((id *)&self->_apiInputTexture, 0);
  self->_inputPixelBuffer = 0;
  objc_storeWeak((id *)&self->_apiOutputTexture, 0);
  self->_outputPixelBuffer = 0;
  objc_storeWeak((id *)&self->_apiTargetThumbnailTexture, 0);
  self->_targetThumbnailPixelBuffer = 0;
  objc_storeWeak((id *)&self->_apiTargetThumbnailTextureForLearning, 0);
  self->_targetThumbnailPixelBufferForLearning = 0;
  objc_storeWeak((id *)&self->_apiTargetThumbnailTextureForResidualCorrection, 0);
  self->_targetThumbnailPixelBufferForResidualCorrection = 0;
  objc_storeWeak((id *)&self->_inputWeightPlaneTexture, 0);
  objc_storeWeak((id *)&self->_inputLearningModulationMaskTexture, 0);
  inputLinearSystemCoefficients = self->_inputLinearSystemCoefficients;
  self->_inputLinearSystemCoefficients = 0;

  objc_storeWeak((id *)&self->_apiInputLinearSystemCoefficientsBuffer, 0);
  objc_storeWeak((id *)&self->_inputLinearSystemCoefficientsTexture, 0);
  self->_inputLinearSystemCoefficientsPixelBuffer = 0;
  objc_storeWeak((id *)&self->_apiOutputLinearSystemCoefficientsBuffer, 0);
  objc_storeWeak((id *)&self->_outputLinearSystemCoefficientsTexture, 0);
  self->_outputLinearSystemCoefficientsPixelBuffer = 0;
  objc_storeWeak((id *)&self->_apiInputOriginalTexture, 0);
  self->_inputOriginalPixelBuffer = 0;
  objc_storeWeak((id *)&self->_apiInputDeltaMapTexture, 0);
  self->_inputDeltaMapPixelBuffer = 0;
  objc_storeWeak((id *)&self->_apiOutputDeltaMapTexture, 0);
  self->_outputDeltaMapPixelBuffer = 0;
  self->_apiImageSize = (CGSize)*MEMORY[0x1E0C9D820];
  v4 = (CGPoint)*MEMORY[0x1E0C9D628];
  v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_apiInputImageRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_apiInputImageRect.size = v5;
  self->_apiInputDeltaMapImageRect.origin = v4;
  self->_apiInputDeltaMapImageRect.size = v5;
  self->_apiInputOriginalImageRect.origin = v4;
  self->_apiInputOriginalImageRect.size = v5;
  self->_apiOutputImageRect.origin = v4;
  self->_apiOutputImageRect.size = v5;
  self->_apiRegionToRender.origin = v4;
  self->_apiRegionToRender.size = v5;
  return 0;
}

- (NSData)outputLinearSystemCoefficients
{
  MTLBuffer *v3;
  CMIStyleEngineCoefficientConverterF32ToF16 *coefficientConverterF32ToF16;
  void *v5;
  void *v6;
  void *v7;
  MTLBuffer *v8;
  void *v9;
  MTLBuffer *v10;
  void *v11;
  id v13;

  if (!self->_outputCoefficientsReady)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return (NSData *)0;
  }
  v3 = self->_coefficientsBuffer;
  if (-[CMIStyleEngineConfiguration outputCoefficientsF16](self->_configuration, "outputCoefficientsF16"))
  {
    -[FigMetalBufferDescriptor setLength:](self->_bufferDescriptor, "setLength:", ((unint64_t)-[MTLBuffer length](self->_coefficientsBuffer, "length") >> 1) & 0x7FFFFFFFFFFFFFFELL);
    -[FigMetalBufferDescriptor setLabel:](self->_bufferDescriptor, "setLabel:", 0);
    v13 = 0;
    -[CMIStyleEngineProcessor _allocateBuffer:withDescriptor:useFigMetalAllocator:](self, "_allocateBuffer:withDescriptor:useFigMetalAllocator:", &v13, self->_bufferDescriptor, 1);
    if (v13)
    {
      -[CMIStyleEngineCoefficientConverter setInputBuffer:](self->_coefficientConverterF32ToF16, "setInputBuffer:", self->_coefficientsBuffer);
      -[CMIStyleEngineCoefficientConverter setOutputBuffer:](self->_coefficientConverterF32ToF16, "setOutputBuffer:", v13);
      coefficientConverterF32ToF16 = self->_coefficientConverterF32ToF16;
      -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(coefficientConverterF32ToF16) = -[CMIStyleEngineCoefficientConverter enqueueToCommandBuffer:](coefficientConverterF32ToF16, "enqueueToCommandBuffer:", v5);

      if (!(_DWORD)coefficientConverterF32ToF16)
      {
        -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_OutputLinearSystemCoefficients"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLabel:", v6);

        -[FigMetalContext commit](self->_metalContext, "commit");
        -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
        v8 = (MTLBuffer *)v13;

        FigMetalDecRef(&v13);
        v3 = v8;
        goto LABEL_6;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
    }

    return (NSData *)0;
  }
LABEL_6:
  v9 = (void *)MEMORY[0x1E0C99D50];
  v10 = objc_retainAutorelease(v3);
  objc_msgSend(v9, "dataWithBytes:length:", -[MTLBuffer contents](v10, "contents"), -[MTLBuffer length](v10, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v11;
}

- (MTLTexture)outputIntegratedCoefficients
{
  return self->_integratedCoefficientsTexture;
}

- (MTLBuffer)outputLinearSystemStatusFlag
{
  return self->_linSysStatusFlagBuffer;
}

- (int)createIdentityTransformCoefficients:(__CVBuffer *)a3
{
  int v5;
  _BOOL8 v6;
  CMIStyleEngineIdentityCoefficientCreator *identityCoefficientCreator;
  void *v8;
  int v9;
  CMIMetalEventSynchronizer *metalSynchronizer;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v15 = 0;
  v5 = -[CMIStyleEngineProcessor _bindPixelBuffer:toBuffer:](self, "_bindPixelBuffer:toBuffer:", a3, &v15);
  if (v5)
  {
    v9 = v5;
    fig_log_get_emitter();
LABEL_9:
    FigDebugAssert3();
    goto LABEL_6;
  }
  v6 = CVPixelBufferGetPixelFormatType(a3) == 1278226536;
  -[CMIStyleEngineIdentityCoefficientCreator setOutputBuffer:](self->_identityCoefficientCreator, "setOutputBuffer:", v15);
  -[CMIStyleEngineIdentityCoefficientCreator setIsF16:](self->_identityCoefficientCreator, "setIsF16:", v6);
  -[CMIStyleEngineIdentityCoefficientCreator setPolynomialCount:](self->_identityCoefficientCreator, "setPolynomialCount:", -[CMIStyleEngineProcessor _linearSystemNumberOfPolynomials](self, "_linearSystemNumberOfPolynomials"));
  identityCoefficientCreator = self->_identityCoefficientCreator;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CMIStyleEngineIdentityCoefficientCreator enqueueToCommandBuffer:](identityCoefficientCreator, "enqueueToCommandBuffer:", v8);

  if (v9)
  {
    fig_log_get_emitter();
    goto LABEL_9;
  }
  metalSynchronizer = self->_metalSynchronizer;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIMetalEventSynchronizer signalEventOnCommandBuffer:forResource:](metalSynchronizer, "signalEventOnCommandBuffer:forResource:", v11, v15);

  -[CMIStyleEngineProcessor _instanceLabel:](self, "_instanceLabel:", CFSTR("StyleEngine_CreateIdentityCoeffs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", v12);

  -[FigMetalContext forceCommit](self->_metalContext, "forceCommit");
  if (-[CMIStyleEngineConfiguration shouldFlushCVMTLBufferCacheAfterProcessing](self->_configuration, "shouldFlushCVMTLBufferCacheAfterProcessing"))
  {
    CVMetalBufferCacheFlush();
  }
  v9 = 0;
LABEL_6:

  return v9;
}

+ (unint64_t)coefficientCountForConfiguration:(id)a3
{
  id v3;
  uint64_t v4;
  int32x2_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int32x2_t v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "linearSystemOrder");
  objc_msgSend(v3, "spotlightCount");
  v11 = v5;
  v6 = objc_msgSend(v3, "weightPlaneCount");
  v7 = objc_msgSend(v3, "createAndSolveGlobalLinearSystem");

  v8 = vmul_lane_s32(v11, v11, 1).u32[0] + v7;
  if (v4 == 2)
    v9 = 7;
  else
    v9 = 4;
  if (v4 == 1)
    v9 = 10;
  return (3 * v6 * v9 * v8);
}

+ (CGSize)coefficientPixelBufferSizeForConfiguration:(id)a3 float16:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  CGSize result;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "coefficientCountForConfiguration:", v6);

  objc_msgSend(a1, "coefficientPixelBufferSizeForTotalSize:float16:", v7, v4);
  result.height = v9;
  result.width = v8;
  return result;
}

+ (CGSize)coefficientPixelBufferSizeForTotalSize:(unint64_t)a3 float16:(BOOL)a4
{
  float v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  CGSize result;

  v4 = sqrtf((float)a3);
  v5 = 15;
  if (a4)
    v5 = 31;
  v6 = v5 + (unint64_t)v4;
  v7 = -16;
  if (a4)
    v7 = -32;
  v8 = v6 & v7;
  v9 = (double)v8;
  v10 = (double)((a3 + v8 - 1) / v8);
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_instanceLabel:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%p_"), a3, self);
}

- (MTLTexture)inputTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiInputTexture);
}

- (void)setInputTexture:(id)a3
{
  objc_storeWeak((id *)&self->_apiInputTexture, a3);
}

- (MTLTexture)outputTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiOutputTexture);
}

- (void)setOutputTexture:(id)a3
{
  objc_storeWeak((id *)&self->_apiOutputTexture, a3);
}

- (MTLTexture)inputThumbnailTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiInputThumbnailTexture);
}

- (void)setInputThumbnailTexture:(id)a3
{
  objc_storeWeak((id *)&self->_apiInputThumbnailTexture, a3);
}

- (MTLTexture)inputThumbnailTextureForLearning
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiInputThumbnailTextureForLearning);
}

- (void)setInputThumbnailTextureForLearning:(id)a3
{
  objc_storeWeak((id *)&self->_apiInputThumbnailTextureForLearning, a3);
}

- (MTLTexture)inputThumbnailTextureForLearningWeights
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiInputThumbnailTextureForLearningWeights);
}

- (void)setInputThumbnailTextureForLearningWeights:(id)a3
{
  objc_storeWeak((id *)&self->_apiInputThumbnailTextureForLearningWeights, a3);
}

- (MTLTexture)inputThumbnailTextureForIntegration
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiInputThumbnailTextureForIntegration);
}

- (void)setInputThumbnailTextureForIntegration:(id)a3
{
  objc_storeWeak((id *)&self->_apiInputThumbnailTextureForIntegration, a3);
}

- (MTLTexture)inputThumbnailTextureForResidualCorrection
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiInputThumbnailTextureForResidualCorrection);
}

- (void)setInputThumbnailTextureForResidualCorrection:(id)a3
{
  objc_storeWeak((id *)&self->_apiInputThumbnailTextureForResidualCorrection, a3);
}

- (MTLTexture)targetThumbnailTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiTargetThumbnailTexture);
}

- (void)setTargetThumbnailTexture:(id)a3
{
  objc_storeWeak((id *)&self->_apiTargetThumbnailTexture, a3);
}

- (MTLTexture)targetThumbnailTextureForLearning
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiTargetThumbnailTextureForLearning);
}

- (void)setTargetThumbnailTextureForLearning:(id)a3
{
  objc_storeWeak((id *)&self->_apiTargetThumbnailTextureForLearning, a3);
}

- (MTLTexture)targetThumbnailTextureForResidualCorrection
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiTargetThumbnailTextureForResidualCorrection);
}

- (void)setTargetThumbnailTextureForResidualCorrection:(id)a3
{
  objc_storeWeak((id *)&self->_apiTargetThumbnailTextureForResidualCorrection, a3);
}

- (MTLTexture)inputOriginalTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiInputOriginalTexture);
}

- (void)setInputOriginalTexture:(id)a3
{
  objc_storeWeak((id *)&self->_apiInputOriginalTexture, a3);
}

- (MTLTexture)inputDeltaMapTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiInputDeltaMapTexture);
}

- (void)setInputDeltaMapTexture:(id)a3
{
  objc_storeWeak((id *)&self->_apiInputDeltaMapTexture, a3);
}

- (MTLTexture)outputDeltaMapTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiOutputDeltaMapTexture);
}

- (void)setOutputDeltaMapTexture:(id)a3
{
  objc_storeWeak((id *)&self->_apiOutputDeltaMapTexture, a3);
}

- (MTLTexture)outputLumaGradientTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_apiOutputLumaGradientTexture);
}

- (void)setOutputLumaGradientTexture:(id)a3
{
  objc_storeWeak((id *)&self->_apiOutputLumaGradientTexture, a3);
}

- (MTLBuffer)inputLinearSystemCoefficientsBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_apiInputLinearSystemCoefficientsBuffer);
}

- (void)setInputLinearSystemCoefficientsBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_apiInputLinearSystemCoefficientsBuffer, a3);
}

- (MTLBuffer)outputLinearSystemCoefficientsBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_apiOutputLinearSystemCoefficientsBuffer);
}

- (void)setOutputLinearSystemCoefficientsBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_apiOutputLinearSystemCoefficientsBuffer, a3);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_apiImageSize.width;
  height = self->_apiImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_apiImageSize = a3;
}

- (CGRect)inputImageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_apiInputImageRect.origin.x;
  y = self->_apiInputImageRect.origin.y;
  width = self->_apiInputImageRect.size.width;
  height = self->_apiInputImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputImageRect:(CGRect)a3
{
  self->_apiInputImageRect = a3;
}

- (CGRect)inputDeltaMapImageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_apiInputDeltaMapImageRect.origin.x;
  y = self->_apiInputDeltaMapImageRect.origin.y;
  width = self->_apiInputDeltaMapImageRect.size.width;
  height = self->_apiInputDeltaMapImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputDeltaMapImageRect:(CGRect)a3
{
  self->_apiInputDeltaMapImageRect = a3;
}

- (CGRect)inputOriginalImageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_apiInputOriginalImageRect.origin.x;
  y = self->_apiInputOriginalImageRect.origin.y;
  width = self->_apiInputOriginalImageRect.size.width;
  height = self->_apiInputOriginalImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputOriginalImageRect:(CGRect)a3
{
  self->_apiInputOriginalImageRect = a3;
}

- (CGRect)outputImageRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_apiOutputImageRect.origin.x;
  y = self->_apiOutputImageRect.origin.y;
  width = self->_apiOutputImageRect.size.width;
  height = self->_apiOutputImageRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOutputImageRect:(CGRect)a3
{
  self->_apiOutputImageRect = a3;
}

- (CGRect)regionToRender
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_apiRegionToRender.origin.x;
  y = self->_apiRegionToRender.origin.y;
  width = self->_apiRegionToRender.size.width;
  height = self->_apiRegionToRender.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRegionToRender:(CGRect)a3
{
  self->_apiRegionToRender = a3;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, a3);
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
  objc_storeStrong((id *)&self->_tuningParameters, a3);
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  return self->_externalMemoryResource;
}

- (void)setExternalMemoryResource:(id)a3
{
  objc_storeStrong((id *)&self->_externalMemoryResource, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NSDictionary)inputNoiseModel
{
  return self->_inputNoiseModel;
}

- (void)setInputNoiseModel:(id)a3
{
  objc_storeStrong((id *)&self->_inputNoiseModel, a3);
}

- (__CVBuffer)inputThumbnailPixelBuffer
{
  return self->_inputThumbnailPixelBuffer;
}

- (void)setInputThumbnailPixelBuffer:(__CVBuffer *)a3
{
  self->_inputThumbnailPixelBuffer = a3;
}

- (__CVBuffer)inputThumbnailPixelBufferForLearning
{
  return self->_inputThumbnailPixelBufferForLearning;
}

- (void)setInputThumbnailPixelBufferForLearning:(__CVBuffer *)a3
{
  self->_inputThumbnailPixelBufferForLearning = a3;
}

- (__CVBuffer)inputThumbnailPixelBufferForLearningWeights
{
  return self->_inputThumbnailPixelBufferForLearningWeights;
}

- (void)setInputThumbnailPixelBufferForLearningWeights:(__CVBuffer *)a3
{
  self->_inputThumbnailPixelBufferForLearningWeights = a3;
}

- (__CVBuffer)inputThumbnailPixelBufferForIntegration
{
  return self->_inputThumbnailPixelBufferForIntegration;
}

- (void)setInputThumbnailPixelBufferForIntegration:(__CVBuffer *)a3
{
  self->_inputThumbnailPixelBufferForIntegration = a3;
}

- (__CVBuffer)inputThumbnailPixelBufferForResidualCorrection
{
  return self->_inputThumbnailPixelBufferForResidualCorrection;
}

- (void)setInputThumbnailPixelBufferForResidualCorrection:(__CVBuffer *)a3
{
  self->_inputThumbnailPixelBufferForResidualCorrection = a3;
}

- (__CVBuffer)inputPixelBuffer
{
  return self->_inputPixelBuffer;
}

- (void)setInputPixelBuffer:(__CVBuffer *)a3
{
  self->_inputPixelBuffer = a3;
}

- (__CVBuffer)outputPixelBuffer
{
  return self->_outputPixelBuffer;
}

- (void)setOutputPixelBuffer:(__CVBuffer *)a3
{
  self->_outputPixelBuffer = a3;
}

- (__CVBuffer)inputDeltaMapPixelBuffer
{
  return self->_inputDeltaMapPixelBuffer;
}

- (void)setInputDeltaMapPixelBuffer:(__CVBuffer *)a3
{
  self->_inputDeltaMapPixelBuffer = a3;
}

- (__CVBuffer)inputOriginalPixelBuffer
{
  return self->_inputOriginalPixelBuffer;
}

- (void)setInputOriginalPixelBuffer:(__CVBuffer *)a3
{
  self->_inputOriginalPixelBuffer = a3;
}

- (__CVBuffer)outputDeltaMapPixelBuffer
{
  return self->_outputDeltaMapPixelBuffer;
}

- (void)setOutputDeltaMapPixelBuffer:(__CVBuffer *)a3
{
  self->_outputDeltaMapPixelBuffer = a3;
}

- (__CVBuffer)targetThumbnailPixelBuffer
{
  return self->_targetThumbnailPixelBuffer;
}

- (void)setTargetThumbnailPixelBuffer:(__CVBuffer *)a3
{
  self->_targetThumbnailPixelBuffer = a3;
}

- (__CVBuffer)targetThumbnailPixelBufferForLearning
{
  return self->_targetThumbnailPixelBufferForLearning;
}

- (void)setTargetThumbnailPixelBufferForLearning:(__CVBuffer *)a3
{
  self->_targetThumbnailPixelBufferForLearning = a3;
}

- (__CVBuffer)targetThumbnailPixelBufferForResidualCorrection
{
  return self->_targetThumbnailPixelBufferForResidualCorrection;
}

- (void)setTargetThumbnailPixelBufferForResidualCorrection:(__CVBuffer *)a3
{
  self->_targetThumbnailPixelBufferForResidualCorrection = a3;
}

- (MTLTexture)inputWeightPlaneTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputWeightPlaneTexture);
}

- (void)setInputWeightPlaneTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputWeightPlaneTexture, a3);
}

- (MTLTexture)inputLearningModulationMaskTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputLearningModulationMaskTexture);
}

- (void)setInputLearningModulationMaskTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputLearningModulationMaskTexture, a3);
}

- (NSData)inputLinearSystemCoefficients
{
  return self->_inputLinearSystemCoefficients;
}

- (void)setInputLinearSystemCoefficients:(id)a3
{
  objc_storeStrong((id *)&self->_inputLinearSystemCoefficients, a3);
}

- (MTLTexture)inputLinearSystemCoefficientsTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputLinearSystemCoefficientsTexture);
}

- (void)setInputLinearSystemCoefficientsTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputLinearSystemCoefficientsTexture, a3);
}

- (__CVBuffer)inputLinearSystemCoefficientsPixelBuffer
{
  return self->_inputLinearSystemCoefficientsPixelBuffer;
}

- (void)setInputLinearSystemCoefficientsPixelBuffer:(__CVBuffer *)a3
{
  self->_inputLinearSystemCoefficientsPixelBuffer = a3;
}

- (MTLTexture)outputLinearSystemCoefficientsTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputLinearSystemCoefficientsTexture);
}

- (void)setOutputLinearSystemCoefficientsTexture:(id)a3
{
  objc_storeWeak((id *)&self->_outputLinearSystemCoefficientsTexture, a3);
}

- (__CVBuffer)outputLinearSystemCoefficientsPixelBuffer
{
  return self->_outputLinearSystemCoefficientsPixelBuffer;
}

- (void)setOutputLinearSystemCoefficientsPixelBuffer:(__CVBuffer *)a3
{
  self->_outputLinearSystemCoefficientsPixelBuffer = a3;
}

- (__CVBuffer)outputLumaGradientPixelBuffer
{
  return self->_outputLumaGradientPixelBuffer;
}

- (void)setOutputLumaGradientPixelBuffer:(__CVBuffer *)a3
{
  self->_outputLumaGradientPixelBuffer = a3;
}

- (CMIStyleEngineConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)residualsCalculationDisabled
{
  return self->_residualsCalculationDisabled;
}

- (void)setResidualsCalculationDisabled:(BOOL)a3
{
  self->_residualsCalculationDisabled = a3;
}

- (CGRect)spotlightIntegrationROI
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_spotlightIntegrationROI.origin.x;
  y = self->_spotlightIntegrationROI.origin.y;
  width = self->_spotlightIntegrationROI.size.width;
  height = self->_spotlightIntegrationROI.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSpotlightIntegrationROI:(CGRect)a3
{
  self->_spotlightIntegrationROI = a3;
}

- (CGRect)spotlightZoomROI
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_spotlightZoomROI.origin.x;
  y = self->_spotlightZoomROI.origin.y;
  width = self->_spotlightZoomROI.size.width;
  height = self->_spotlightZoomROI.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSpotlightZoomROI:(CGRect)a3
{
  self->_spotlightZoomROI = a3;
}

- (__n128)spotlightAffineTransform
{
  return a1[61];
}

- (__n128)setSpotlightAffineTransform:(__n128)a3
{
  result[61] = a2;
  result[62] = a3;
  result[63] = a4;
  return result;
}

- (BOOL)useLiveMetalAllocations
{
  return self->_useLiveMetalAllocations;
}

- (void)setUseLiveMetalAllocations:(BOOL)a3
{
  self->_useLiveMetalAllocations = a3;
}

- (BOOL)applyDither
{
  return self->_applyDither;
}

- (void)setApplyDither:(BOOL)a3
{
  self->_applyDither = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_outputLinearSystemCoefficientsTexture);
  objc_destroyWeak((id *)&self->_inputLinearSystemCoefficientsTexture);
  objc_storeStrong((id *)&self->_inputLinearSystemCoefficients, 0);
  objc_destroyWeak((id *)&self->_inputLearningModulationMaskTexture);
  objc_destroyWeak((id *)&self->_inputWeightPlaneTexture);
  objc_storeStrong((id *)&self->_inputNoiseModel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_externalMemoryResource, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_destroyWeak((id *)&self->_apiOutputLinearSystemCoefficientsBuffer);
  objc_destroyWeak((id *)&self->_apiInputLinearSystemCoefficientsBuffer);
  objc_destroyWeak((id *)&self->_apiOutputLumaGradientTexture);
  objc_destroyWeak((id *)&self->_apiOutputDeltaMapTexture);
  objc_destroyWeak((id *)&self->_apiInputDeltaMapTexture);
  objc_destroyWeak((id *)&self->_apiInputOriginalTexture);
  objc_destroyWeak((id *)&self->_apiTargetThumbnailTextureForResidualCorrection);
  objc_destroyWeak((id *)&self->_apiTargetThumbnailTextureForLearning);
  objc_destroyWeak((id *)&self->_apiTargetThumbnailTexture);
  objc_destroyWeak((id *)&self->_apiInputThumbnailTextureForResidualCorrection);
  objc_destroyWeak((id *)&self->_apiInputThumbnailTextureForIntegration);
  objc_destroyWeak((id *)&self->_apiInputThumbnailTextureForLearningWeights);
  objc_destroyWeak((id *)&self->_apiInputThumbnailTextureForLearning);
  objc_destroyWeak((id *)&self->_apiInputThumbnailTexture);
  objc_destroyWeak((id *)&self->_apiOutputTexture);
  objc_destroyWeak((id *)&self->_apiInputTexture);
  objc_storeStrong((id *)&self->_applyStyle, 0);
  objc_storeStrong((id *)&self->_integrateCoefficients, 0);
  objc_storeStrong((id *)&self->_integratedCoefficientsTexture, 0);
  objc_storeStrong((id *)&self->_coefficientConverterF32ToF16, 0);
  objc_storeStrong((id *)&self->_coefficientConverterF16ToF32, 0);
  objc_storeStrong((id *)&self->_solveLinearSystem, 0);
  objc_storeStrong((id *)&self->_linSysStatusFlagBuffer, 0);
  objc_storeStrong((id *)&self->_linSysStatusBuffer, 0);
  objc_storeStrong((id *)&self->_coefficientsBuffer, 0);
  objc_storeStrong((id *)&self->_createLinearSystem, 0);
  objc_storeStrong((id *)&self->_rhsBuffer, 0);
  objc_storeStrong((id *)&self->_createSpotlights, 0);
  objc_storeStrong((id *)&self->_createWeightPlanes, 0);
  objc_storeStrong((id *)&self->_identityCoefficientCreator, 0);
  objc_storeStrong((id *)&self->_downScale, 0);
  objc_storeStrong((id *)&self->_bufferDescriptor, 0);
  objc_storeStrong((id *)&self->_textureDescriptor, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_textureCache, 0);
  objc_storeStrong((id *)&self->_metalSynchronizer, 0);
}

@end
