@implementation CMIStyleEngineConfiguration

- (CMIStyleEngineConfiguration)init
{
  CMIStyleEngineConfiguration *v2;
  CMIStyleEngineConfiguration *v3;
  CMIStyleEngineConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMIStyleEngineConfiguration;
  v2 = -[CMIStyleEngineConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2[1].super.isa = xmmword_1D3307600;
    *(_OWORD *)&v2[1]._targetThumbnailForLearningIsLinear = xmmword_1D3307610;
    *(_OWORD *)&v2[1]._globalLinearSystemMixFactor = xmmword_1D3304E50;
    v4 = v2;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CMIStyleEngineConfiguration *v4;
  double v5;

  v4 = -[CMIStyleEngineConfiguration init](+[CMIStyleEngineConfiguration allocWithZone:](CMIStyleEngineConfiguration, "allocWithZone:", a3), "init");
  -[CMIStyleEngineConfiguration setThumbnailSize:](v4, "setThumbnailSize:", self->_thumbnailSize.width, self->_thumbnailSize.height);
  -[CMIStyleEngineConfiguration setLinearSystemType:](v4, "setLinearSystemType:", self->_linearSystemType);
  -[CMIStyleEngineConfiguration setLinearSystemOrder:](v4, "setLinearSystemOrder:", self->_linearSystemOrder);
  -[CMIStyleEngineConfiguration setLinearSystemSolver:](v4, "setLinearSystemSolver:", self->_linearSystemSolver);
  -[CMIStyleEngineConfiguration setWeightPlaneCount:](v4, "setWeightPlaneCount:", self->_weightPlaneCount);
  -[CMIStyleEngineConfiguration setSpotlightCount:](v4, "setSpotlightCount:", *(double *)self->_spotlightCount);
  -[CMIStyleEngineConfiguration setInputIsLinear:](v4, "setInputIsLinear:", self->_inputIsLinear);
  -[CMIStyleEngineConfiguration setOutputShouldBeLinear:](v4, "setOutputShouldBeLinear:", self->_outputShouldBeLinear);
  -[CMIStyleEngineConfiguration setInputThumbnailIsLinear:](v4, "setInputThumbnailIsLinear:", self->_inputThumbnailIsLinear);
  -[CMIStyleEngineConfiguration setInputThumbnailForLearningIsLinear:](v4, "setInputThumbnailForLearningIsLinear:", self->_inputThumbnailForLearningIsLinear);
  -[CMIStyleEngineConfiguration setInputThumbnailForLearningWeightsIsLinear:](v4, "setInputThumbnailForLearningWeightsIsLinear:", self->_inputThumbnailForLearningWeightsIsLinear);
  -[CMIStyleEngineConfiguration setInputThumbnailForIntegrationIsLinear:](v4, "setInputThumbnailForIntegrationIsLinear:", self->_inputThumbnailForIntegrationIsLinear);
  -[CMIStyleEngineConfiguration setInputThumbnailForResidualCorrectionIsLinear:](v4, "setInputThumbnailForResidualCorrectionIsLinear:", self->_inputThumbnailForResidualCorrectionIsLinear);
  -[CMIStyleEngineConfiguration setTargetThumbnailIsLinear:](v4, "setTargetThumbnailIsLinear:", self->_targetThumbnailIsLinear);
  -[CMIStyleEngineConfiguration setTargetThumbnailForLearningIsLinear:](v4, "setTargetThumbnailForLearningIsLinear:", self->_targetThumbnailForLearningIsLinear);
  -[CMIStyleEngineConfiguration setTargetThumbnailForResidualCorrectionIsLinear:](v4, "setTargetThumbnailForResidualCorrectionIsLinear:", self->_targetThumbnailForResidualCorrectionIsLinear);
  -[CMIStyleEngineConfiguration setCreateAndSolveGlobalLinearSystem:](v4, "setCreateAndSolveGlobalLinearSystem:", self->_createAndSolveGlobalLinearSystem);
  *(float *)&v5 = self->_globalLinearSystemMixFactor;
  -[CMIStyleEngineConfiguration setGlobalLinearSystemMixFactor:](v4, "setGlobalLinearSystemMixFactor:", v5);
  -[CMIStyleEngineConfiguration setInputCoefficientsF16:](v4, "setInputCoefficientsF16:", self->_inputCoefficientsF16);
  -[CMIStyleEngineConfiguration setOutputCoefficientsF16:](v4, "setOutputCoefficientsF16:", self->_outputCoefficientsF16);
  -[CMIStyleEngineConfiguration setFastStyleApplication:](v4, "setFastStyleApplication:", self->_fastStyleApplication);
  -[CMIStyleEngineConfiguration setApplyDithering:](v4, "setApplyDithering:", self->_applyDithering);
  -[CMIStyleEngineConfiguration setLinearSystemPriorMatrix:](v4, "setLinearSystemPriorMatrix:", *(double *)&self[1].super.isa, *(double *)&self[1]._targetThumbnailForLearningIsLinear, *(double *)&self[1]._globalLinearSystemMixFactor);
  -[CMIStyleEngineConfiguration setUseBicubicIntegration:](v4, "setUseBicubicIntegration:", self->_useBicubicIntegration);
  -[CMIStyleEngineConfiguration setShouldFlushCVMTLTextureCacheAfterProcessing:](v4, "setShouldFlushCVMTLTextureCacheAfterProcessing:", self->_shouldFlushCVMTLTextureCacheAfterProcessing);
  -[CMIStyleEngineConfiguration setShouldFlushCVMTLBufferCacheAfterProcessing:](v4, "setShouldFlushCVMTLBufferCacheAfterProcessing:", self->_shouldFlushCVMTLBufferCacheAfterProcessing);
  -[CMIStyleEngineConfiguration setFilterForInputLearningThumbnailCreation:](v4, "setFilterForInputLearningThumbnailCreation:", self->_filterForInputLearningThumbnailCreation);
  -[CMIStyleEngineConfiguration setFilterForInputLearningWeightsThumbnailCreation:](v4, "setFilterForInputLearningWeightsThumbnailCreation:", self->_filterForInputLearningWeightsThumbnailCreation);
  -[CMIStyleEngineConfiguration setFilterForInputIntegrationThumbnailCreation:](v4, "setFilterForInputIntegrationThumbnailCreation:", self->_filterForInputIntegrationThumbnailCreation);
  -[CMIStyleEngineConfiguration setFilterForInputResidualCorrectionThumbnailCreation:](v4, "setFilterForInputResidualCorrectionThumbnailCreation:", self->_filterForInputResidualCorrectionThumbnailCreation);
  -[CMIStyleEngineConfiguration setFilterForTargetLearningThumbnailCreation:](v4, "setFilterForTargetLearningThumbnailCreation:", self->_filterForTargetLearningThumbnailCreation);
  -[CMIStyleEngineConfiguration setFilterForTargetResidualCorrectionThumbnailCreation:](v4, "setFilterForTargetResidualCorrectionThumbnailCreation:", self->_filterForTargetResidualCorrectionThumbnailCreation);
  -[CMIStyleEngineConfiguration setApplySyntheticNoise:](v4, "setApplySyntheticNoise:", self->_applySyntheticNoise);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CMIStyleEngineConfiguration *v4;
  CMIStyleEngineConfiguration *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  int32x2_t v19;
  int32x2_t v20;
  int32x2_t v21;
  uint32x2_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  float v38;
  float v39;
  float v40;
  _BOOL4 v41;
  _BOOL4 v42;
  _BOOL4 v43;
  _BOOL4 v44;
  _BOOL4 v45;
  _BOOL4 v46;
  _BOOL4 v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _BOOL4 v54;
  _BOOL4 v55;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;

  v4 = (CMIStyleEngineConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v55) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CMIStyleEngineConfiguration thumbnailSize](self, "thumbnailSize");
      v7 = v6;
      v9 = v8;
      -[CMIStyleEngineConfiguration thumbnailSize](v5, "thumbnailSize");
      if (v7 != v11 || v9 != v10)
        goto LABEL_42;
      -[CMIStyleEngineConfiguration linearSystemPriorMatrix](self, "linearSystemPriorMatrix");
      v57 = v14;
      v58 = v13;
      v59 = v15;
      -[CMIStyleEngineConfiguration linearSystemPriorMatrix](v5, "linearSystemPriorMatrix");
      if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v58, v16), (int8x16_t)vceqq_f32(v57, v17)), (int8x16_t)vceqq_f32(v59, v18))) & 0x80000000) == 0)goto LABEL_42;
      -[CMIStyleEngineConfiguration spotlightCount](self, "spotlightCount");
      v20 = v19;
      -[CMIStyleEngineConfiguration spotlightCount](v5, "spotlightCount");
      v22 = (uint32x2_t)vceq_s32(v20, v21);
      if ((vpmin_u32(v22, v22).u32[0] & 0x80000000) == 0)
        goto LABEL_42;
      v23 = -[CMIStyleEngineConfiguration linearSystemType](self, "linearSystemType");
      if (v23 != -[CMIStyleEngineConfiguration linearSystemType](v5, "linearSystemType"))
        goto LABEL_42;
      v24 = -[CMIStyleEngineConfiguration linearSystemOrder](self, "linearSystemOrder");
      if (v24 != -[CMIStyleEngineConfiguration linearSystemOrder](v5, "linearSystemOrder"))
        goto LABEL_42;
      v25 = -[CMIStyleEngineConfiguration linearSystemSolver](self, "linearSystemSolver");
      if (v25 != -[CMIStyleEngineConfiguration linearSystemSolver](v5, "linearSystemSolver"))
        goto LABEL_42;
      v26 = -[CMIStyleEngineConfiguration weightPlaneCount](self, "weightPlaneCount");
      if (v26 != -[CMIStyleEngineConfiguration weightPlaneCount](v5, "weightPlaneCount"))
        goto LABEL_42;
      v27 = -[CMIStyleEngineConfiguration inputIsLinear](self, "inputIsLinear");
      if (v27 != -[CMIStyleEngineConfiguration inputIsLinear](v5, "inputIsLinear"))
        goto LABEL_42;
      v28 = -[CMIStyleEngineConfiguration outputShouldBeLinear](self, "outputShouldBeLinear");
      if (v28 != -[CMIStyleEngineConfiguration outputShouldBeLinear](v5, "outputShouldBeLinear"))
        goto LABEL_42;
      v29 = -[CMIStyleEngineConfiguration inputThumbnailIsLinear](self, "inputThumbnailIsLinear");
      if (v29 != -[CMIStyleEngineConfiguration inputThumbnailIsLinear](v5, "inputThumbnailIsLinear"))
        goto LABEL_42;
      v30 = -[CMIStyleEngineConfiguration inputThumbnailForLearningIsLinear](self, "inputThumbnailForLearningIsLinear");
      if (v30 != -[CMIStyleEngineConfiguration inputThumbnailForLearningIsLinear](v5, "inputThumbnailForLearningIsLinear"))goto LABEL_42;
      v31 = -[CMIStyleEngineConfiguration inputThumbnailForLearningWeightsIsLinear](self, "inputThumbnailForLearningWeightsIsLinear");
      if (v31 != -[CMIStyleEngineConfiguration inputThumbnailForLearningWeightsIsLinear](v5, "inputThumbnailForLearningWeightsIsLinear"))goto LABEL_42;
      v32 = -[CMIStyleEngineConfiguration inputThumbnailForIntegrationIsLinear](self, "inputThumbnailForIntegrationIsLinear");
      if (v32 != -[CMIStyleEngineConfiguration inputThumbnailForIntegrationIsLinear](v5, "inputThumbnailForIntegrationIsLinear"))goto LABEL_42;
      v33 = -[CMIStyleEngineConfiguration inputThumbnailForResidualCorrectionIsLinear](self, "inputThumbnailForResidualCorrectionIsLinear");
      if (v33 != -[CMIStyleEngineConfiguration inputThumbnailForResidualCorrectionIsLinear](v5, "inputThumbnailForResidualCorrectionIsLinear"))goto LABEL_42;
      v34 = -[CMIStyleEngineConfiguration targetThumbnailIsLinear](self, "targetThumbnailIsLinear");
      if (v34 != -[CMIStyleEngineConfiguration targetThumbnailIsLinear](v5, "targetThumbnailIsLinear"))
        goto LABEL_42;
      v35 = -[CMIStyleEngineConfiguration targetThumbnailForLearningIsLinear](self, "targetThumbnailForLearningIsLinear");
      if (v35 != -[CMIStyleEngineConfiguration targetThumbnailForLearningIsLinear](v5, "targetThumbnailForLearningIsLinear"))goto LABEL_42;
      v36 = -[CMIStyleEngineConfiguration targetThumbnailForResidualCorrectionIsLinear](self, "targetThumbnailForResidualCorrectionIsLinear");
      if (v36 != -[CMIStyleEngineConfiguration targetThumbnailForResidualCorrectionIsLinear](v5, "targetThumbnailForResidualCorrectionIsLinear"))goto LABEL_42;
      v37 = -[CMIStyleEngineConfiguration createAndSolveGlobalLinearSystem](self, "createAndSolveGlobalLinearSystem");
      if (v37 != -[CMIStyleEngineConfiguration createAndSolveGlobalLinearSystem](v5, "createAndSolveGlobalLinearSystem"))goto LABEL_42;
      -[CMIStyleEngineConfiguration globalLinearSystemMixFactor](self, "globalLinearSystemMixFactor");
      v39 = v38;
      -[CMIStyleEngineConfiguration globalLinearSystemMixFactor](v5, "globalLinearSystemMixFactor");
      if (v39 != v40)
        goto LABEL_42;
      v41 = -[CMIStyleEngineConfiguration inputCoefficientsF16](self, "inputCoefficientsF16");
      if (v41 != -[CMIStyleEngineConfiguration inputCoefficientsF16](v5, "inputCoefficientsF16"))
        goto LABEL_42;
      v42 = -[CMIStyleEngineConfiguration outputCoefficientsF16](self, "outputCoefficientsF16");
      if (v42 != -[CMIStyleEngineConfiguration outputCoefficientsF16](v5, "outputCoefficientsF16"))
        goto LABEL_42;
      v43 = -[CMIStyleEngineConfiguration fastStyleApplication](self, "fastStyleApplication");
      if (v43 != -[CMIStyleEngineConfiguration fastStyleApplication](v5, "fastStyleApplication"))
        goto LABEL_42;
      v44 = -[CMIStyleEngineConfiguration applyDithering](self, "applyDithering");
      if (v44 != -[CMIStyleEngineConfiguration applyDithering](v5, "applyDithering"))
        goto LABEL_42;
      v45 = -[CMIStyleEngineConfiguration useBicubicIntegration](self, "useBicubicIntegration");
      if (v45 != -[CMIStyleEngineConfiguration useBicubicIntegration](v5, "useBicubicIntegration"))
        goto LABEL_42;
      v46 = -[CMIStyleEngineConfiguration shouldFlushCVMTLTextureCacheAfterProcessing](self, "shouldFlushCVMTLTextureCacheAfterProcessing");
      if (v46 != -[CMIStyleEngineConfiguration shouldFlushCVMTLTextureCacheAfterProcessing](v5, "shouldFlushCVMTLTextureCacheAfterProcessing"))goto LABEL_42;
      v47 = -[CMIStyleEngineConfiguration shouldFlushCVMTLBufferCacheAfterProcessing](self, "shouldFlushCVMTLBufferCacheAfterProcessing");
      if (v47 == -[CMIStyleEngineConfiguration shouldFlushCVMTLBufferCacheAfterProcessing](v5, "shouldFlushCVMTLBufferCacheAfterProcessing")&& (v48 = -[CMIStyleEngineConfiguration filterForInputLearningThumbnailCreation](self, "filterForInputLearningThumbnailCreation"), v48 == -[CMIStyleEngineConfiguration filterForInputLearningThumbnailCreation](v5, "filterForInputLearningThumbnailCreation"))&& (v49 = -[CMIStyleEngineConfiguration filterForInputLearningWeightsThumbnailCreation](self, "filterForInputLearningWeightsThumbnailCreation"), v49 == -[CMIStyleEngineConfiguration filterForInputLearningWeightsThumbnailCreation](v5, "filterForInputLearningWeightsThumbnailCreation"))&& (v50 = -[CMIStyleEngineConfiguration filterForInputIntegrationThumbnailCreation](self, "filterForInputIntegrationThumbnailCreation"), v50 == -[CMIStyleEngineConfiguration filterForInputIntegrationThumbnailCreation](v5,
                     "filterForInputIntegrationThumbnailCreation"))
        && (v51 = -[CMIStyleEngineConfiguration filterForInputResidualCorrectionThumbnailCreation](self, "filterForInputResidualCorrectionThumbnailCreation"), v51 == -[CMIStyleEngineConfiguration filterForInputResidualCorrectionThumbnailCreation](v5, "filterForInputResidualCorrectionThumbnailCreation"))&& (v52 = -[CMIStyleEngineConfiguration filterForTargetLearningThumbnailCreation](self, "filterForTargetLearningThumbnailCreation"), v52 == -[CMIStyleEngineConfiguration filterForTargetLearningThumbnailCreation](v5, "filterForTargetLearningThumbnailCreation"))&& (v53 = -[CMIStyleEngineConfiguration filterForTargetResidualCorrectionThumbnailCreation](self, "filterForTargetResidualCorrectionThumbnailCreation"), v53 == -[CMIStyleEngineConfiguration filterForTargetResidualCorrectionThumbnailCreation](v5, "filterForTargetResidualCorrectionThumbnailCreation")))
      {
        v54 = -[CMIStyleEngineConfiguration applySyntheticNoise](self, "applySyntheticNoise");
        v55 = v54 ^ -[CMIStyleEngineConfiguration applySyntheticNoise](v5, "applySyntheticNoise") ^ 1;
      }
      else
      {
LABEL_42:
        LOBYTE(v55) = 0;
      }

    }
    else
    {
      LOBYTE(v55) = 0;
    }
  }

  return v55;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  unsigned int v5;
  unsigned int v6;
  uint32x2_t v7;
  int64x2_t v8;
  _BOOL4 v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  __int32 v19;
  _BOOL4 v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  int8x16_t v28;
  float32x4_t v29;
  int8x16_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  int8x16_t v34;
  float32x4_t v35;
  _BOOL4 v36;
  uint64_t v37;
  _BOOL4 v38;
  unint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BOOL4 v53;
  int8x16_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  int8x16_t v63;
  int8x16_t v64;
  uint64_t v65;
  unint64_t v66;
  int8x16_t v67;
  int8x16_t v68;
  int8x16_t v69;
  __int32 v70;
  int8x16_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  int64x2_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;

  -[CMIStyleEngineConfiguration thumbnailSize](self, "thumbnailSize");
  v88 = (unint64_t)(v3 * 1000000.0);
  -[CMIStyleEngineConfiguration thumbnailSize](self, "thumbnailSize");
  v87 = (unint64_t)(v4 * 1000000.0);
  v86 = -[CMIStyleEngineConfiguration linearSystemType](self, "linearSystemType");
  v84 = 8 * -[CMIStyleEngineConfiguration linearSystemOrder](self, "linearSystemOrder");
  v83 = 16 * -[CMIStyleEngineConfiguration linearSystemSolver](self, "linearSystemSolver");
  v85 = 32 * -[CMIStyleEngineConfiguration weightPlaneCount](self, "weightPlaneCount");
  -[CMIStyleEngineConfiguration spotlightCount](self, "spotlightCount");
  v81 = v5;
  -[CMIStyleEngineConfiguration spotlightCount](self, "spotlightCount");
  v7 = vshl_u32((uint32x2_t)__PAIR64__(v6, v81), (uint32x2_t)0x700000006);
  v8.i64[0] = v7.u32[0];
  v8.i64[1] = v7.u32[1];
  v82 = v8;
  v9 = -[CMIStyleEngineConfiguration inputIsLinear](self, "inputIsLinear");
  v10 = 256;
  if (!v9)
    v10 = 0;
  v80 = v10;
  v11 = -[CMIStyleEngineConfiguration outputShouldBeLinear](self, "outputShouldBeLinear");
  v12 = 512;
  if (!v11)
    v12 = 0;
  v79 = v12;
  v13 = -[CMIStyleEngineConfiguration inputThumbnailIsLinear](self, "inputThumbnailIsLinear");
  v14 = 1024;
  if (!v13)
    v14 = 0;
  v78 = v14;
  v15 = -[CMIStyleEngineConfiguration targetThumbnailIsLinear](self, "targetThumbnailIsLinear");
  v16 = 2048;
  if (!v15)
    v16 = 0;
  v77 = v16;
  v17 = -[CMIStyleEngineConfiguration createAndSolveGlobalLinearSystem](self, "createAndSolveGlobalLinearSystem");
  v18 = 4096;
  if (!v17)
    v18 = 0;
  v76 = v18;
  -[CMIStyleEngineConfiguration globalLinearSystemMixFactor](self, "globalLinearSystemMixFactor");
  v70 = v19;
  v20 = -[CMIStyleEngineConfiguration inputCoefficientsF16](self, "inputCoefficientsF16");
  v21 = 0x4000;
  if (!v20)
    v21 = 0;
  v75 = v21;
  v22 = -[CMIStyleEngineConfiguration outputCoefficientsF16](self, "outputCoefficientsF16");
  v23 = 0x8000;
  if (!v22)
    v23 = 0;
  v74 = v23;
  v24 = -[CMIStyleEngineConfiguration fastStyleApplication](self, "fastStyleApplication");
  v25 = 0x10000;
  if (!v24)
    v25 = 0;
  v73 = v25;
  v26 = -[CMIStyleEngineConfiguration useBicubicIntegration](self, "useBicubicIntegration");
  v27 = 0x20000;
  if (!v26)
    v27 = 0;
  v72 = v27;
  -[CMIStyleEngineConfiguration linearSystemPriorMatrix](self, "linearSystemPriorMatrix");
  v29 = (float32x4_t)vuzp1q_s32((int32x4_t)vextq_s8(v28, v28, 0xCuLL), (int32x4_t)v28);
  v29.i32[0] = v70;
  v31 = (float32x4_t)vdupq_n_s32(0x49742400u);
  v32 = vmulq_f32(v29, v31);
  v33 = vmulq_f32((float32x4_t)vextq_s8(v28, v30, 0xCuLL), v31);
  v71 = (int8x16_t)vshlq_u64(vcvtq_u64_f64(vcvtq_f64_f32(*(float32x2_t *)v32.f32)), (uint64x2_t)xmmword_1D3307620);
  v69 = (int8x16_t)vshlq_u64(vcvtq_u64_f64(vcvt_hight_f64_f32(v32)), (uint64x2_t)xmmword_1D3307630);
  v68 = (int8x16_t)vshlq_u64(vcvtq_u64_f64(vcvtq_f64_f32(*(float32x2_t *)v33.f32)), (uint64x2_t)xmmword_1D3307640);
  v67 = (int8x16_t)vshlq_u64(vcvtq_u64_f64(vcvt_hight_f64_f32(v33)), (uint64x2_t)xmmword_1D3307650);
  v35 = vmulq_f32((float32x4_t)vextq_s8(v30, v34, 0xCuLL), v31);
  v64 = (int8x16_t)vshlq_u64(vcvtq_u64_f64(vcvt_hight_f64_f32(v35)), (uint64x2_t)xmmword_1D3307660);
  v63 = (int8x16_t)vshlq_u64(vcvtq_u64_f64(vcvtq_f64_f32(*(float32x2_t *)v35.f32)), (uint64x2_t)xmmword_1D3307670);
  v66 = (unint64_t)vmuls_lane_f32(1000000.0, (float32x4_t)v34, 3);
  v36 = -[CMIStyleEngineConfiguration shouldFlushCVMTLTextureCacheAfterProcessing](self, "shouldFlushCVMTLTextureCacheAfterProcessing");
  v37 = 0x40000000;
  if (!v36)
    v37 = 0;
  v65 = v37;
  v38 = -[CMIStyleEngineConfiguration shouldFlushCVMTLBufferCacheAfterProcessing](self, "shouldFlushCVMTLBufferCacheAfterProcessing");
  v39 = 0xFFFFFFFF80000000;
  if (!v38)
    v39 = 0;
  v62 = v39;
  v40 = -[CMIStyleEngineConfiguration applySyntheticNoise](self, "applySyntheticNoise");
  v41 = 0x100000000;
  if (!v40)
    v41 = 0;
  v61 = v41;
  v42 = -[CMIStyleEngineConfiguration applyDithering](self, "applyDithering");
  v43 = 0x200000000;
  if (!v42)
    v43 = 0;
  v60 = v43;
  v59 = -[CMIStyleEngineConfiguration filterForInputLearningThumbnailCreation](self, "filterForInputLearningThumbnailCreation") << 34;
  v58 = -[CMIStyleEngineConfiguration filterForInputLearningWeightsThumbnailCreation](self, "filterForInputLearningWeightsThumbnailCreation");
  v44 = -[CMIStyleEngineConfiguration filterForInputIntegrationThumbnailCreation](self, "filterForInputIntegrationThumbnailCreation") << 36;
  v45 = -[CMIStyleEngineConfiguration filterForInputResidualCorrectionThumbnailCreation](self, "filterForInputResidualCorrectionThumbnailCreation");
  v46 = -[CMIStyleEngineConfiguration filterForTargetLearningThumbnailCreation](self, "filterForTargetLearningThumbnailCreation") << 38;
  v47 = -[CMIStyleEngineConfiguration filterForTargetResidualCorrectionThumbnailCreation](self, "filterForTargetResidualCorrectionThumbnailCreation");
  if (-[CMIStyleEngineConfiguration inputThumbnailForLearningIsLinear](self, "inputThumbnailForLearningIsLinear"))
    v48 = 0x10000000000;
  else
    v48 = 0;
  if (-[CMIStyleEngineConfiguration inputThumbnailForLearningWeightsIsLinear](self, "inputThumbnailForLearningWeightsIsLinear"))
  {
    v49 = 0x20000000000;
  }
  else
  {
    v49 = 0;
  }
  if (-[CMIStyleEngineConfiguration inputThumbnailForIntegrationIsLinear](self, "inputThumbnailForIntegrationIsLinear"))
    v50 = 0x40000000000;
  else
    v50 = 0;
  if (-[CMIStyleEngineConfiguration inputThumbnailForResidualCorrectionIsLinear](self, "inputThumbnailForResidualCorrectionIsLinear"))
  {
    v51 = 0x80000000000;
  }
  else
  {
    v51 = 0;
  }
  if (-[CMIStyleEngineConfiguration targetThumbnailForLearningIsLinear](self, "targetThumbnailForLearningIsLinear"))
    v52 = 0x100000000000;
  else
    v52 = 0;
  v53 = -[CMIStyleEngineConfiguration targetThumbnailForResidualCorrectionIsLinear](self, "targetThumbnailForResidualCorrectionIsLinear");
  v54 = veorq_s8(veorq_s8(veorq_s8(v71, v68), veorq_s8(v69, v67)), veorq_s8(v63, v64));
  v55 = *(_QWORD *)&veor_s8(*(int8x8_t *)v54.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v54, v54, 8uLL)) ^ (4 * v86);
  v56 = 0x200000000000;
  if (!v53)
    v56 = 0;
  return v55 ^ v84 ^ (2 * v87) ^ v83 ^ (v66 << 29) ^ v59 ^ (v58 << 35) ^ (v44 ^ (v45 << 37) ^ v46 ^ (v47 << 39) | v80 | v79 | v78 | v77) ^ (v76 | v75 | v74 | v73 | v72 | v65 | v62 ^ v61) ^ (v60 | v48 | v49 | v50 | v51 | v52 | v56 | v85) ^ veorq_s8((int8x16_t)vdupq_laneq_s64(v82, 1), (int8x16_t)v82).u64[0] ^ v88;
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (unint64_t)linearSystemType
{
  return self->_linearSystemType;
}

- (void)setLinearSystemType:(unint64_t)a3
{
  self->_linearSystemType = a3;
}

- (unint64_t)linearSystemOrder
{
  return self->_linearSystemOrder;
}

- (void)setLinearSystemOrder:(unint64_t)a3
{
  self->_linearSystemOrder = a3;
}

- (unint64_t)linearSystemSolver
{
  return self->_linearSystemSolver;
}

- (void)setLinearSystemSolver:(unint64_t)a3
{
  self->_linearSystemSolver = a3;
}

- (unsigned)weightPlaneCount
{
  return self->_weightPlaneCount;
}

- (void)setWeightPlaneCount:(unsigned int)a3
{
  self->_weightPlaneCount = a3;
}

- (double)spotlightCount
{
  return *(double *)(a1 + 64);
}

- (void)setSpotlightCount:(CMIStyleEngineConfiguration *)self
{
  uint64_t v2;

  *(_QWORD *)self->_spotlightCount = v2;
}

- (BOOL)inputIsLinear
{
  return self->_inputIsLinear;
}

- (void)setInputIsLinear:(BOOL)a3
{
  self->_inputIsLinear = a3;
}

- (BOOL)outputShouldBeLinear
{
  return self->_outputShouldBeLinear;
}

- (void)setOutputShouldBeLinear:(BOOL)a3
{
  self->_outputShouldBeLinear = a3;
}

- (BOOL)inputThumbnailIsLinear
{
  return self->_inputThumbnailIsLinear;
}

- (void)setInputThumbnailIsLinear:(BOOL)a3
{
  self->_inputThumbnailIsLinear = a3;
}

- (BOOL)inputThumbnailForLearningIsLinear
{
  return self->_inputThumbnailForLearningIsLinear;
}

- (void)setInputThumbnailForLearningIsLinear:(BOOL)a3
{
  self->_inputThumbnailForLearningIsLinear = a3;
}

- (BOOL)inputThumbnailForLearningWeightsIsLinear
{
  return self->_inputThumbnailForLearningWeightsIsLinear;
}

- (void)setInputThumbnailForLearningWeightsIsLinear:(BOOL)a3
{
  self->_inputThumbnailForLearningWeightsIsLinear = a3;
}

- (BOOL)inputThumbnailForIntegrationIsLinear
{
  return self->_inputThumbnailForIntegrationIsLinear;
}

- (void)setInputThumbnailForIntegrationIsLinear:(BOOL)a3
{
  self->_inputThumbnailForIntegrationIsLinear = a3;
}

- (BOOL)inputThumbnailForResidualCorrectionIsLinear
{
  return self->_inputThumbnailForResidualCorrectionIsLinear;
}

- (void)setInputThumbnailForResidualCorrectionIsLinear:(BOOL)a3
{
  self->_inputThumbnailForResidualCorrectionIsLinear = a3;
}

- (BOOL)targetThumbnailIsLinear
{
  return self->_targetThumbnailIsLinear;
}

- (void)setTargetThumbnailIsLinear:(BOOL)a3
{
  self->_targetThumbnailIsLinear = a3;
}

- (BOOL)targetThumbnailForLearningIsLinear
{
  return self->_targetThumbnailForLearningIsLinear;
}

- (void)setTargetThumbnailForLearningIsLinear:(BOOL)a3
{
  self->_targetThumbnailForLearningIsLinear = a3;
}

- (BOOL)targetThumbnailForResidualCorrectionIsLinear
{
  return self->_targetThumbnailForResidualCorrectionIsLinear;
}

- (void)setTargetThumbnailForResidualCorrectionIsLinear:(BOOL)a3
{
  self->_targetThumbnailForResidualCorrectionIsLinear = a3;
}

- (BOOL)createAndSolveGlobalLinearSystem
{
  return self->_createAndSolveGlobalLinearSystem;
}

- (void)setCreateAndSolveGlobalLinearSystem:(BOOL)a3
{
  self->_createAndSolveGlobalLinearSystem = a3;
}

- (float)globalLinearSystemMixFactor
{
  return self->_globalLinearSystemMixFactor;
}

- (void)setGlobalLinearSystemMixFactor:(float)a3
{
  self->_globalLinearSystemMixFactor = a3;
}

- (BOOL)inputCoefficientsF16
{
  return self->_inputCoefficientsF16;
}

- (void)setInputCoefficientsF16:(BOOL)a3
{
  self->_inputCoefficientsF16 = a3;
}

- (BOOL)outputCoefficientsF16
{
  return self->_outputCoefficientsF16;
}

- (void)setOutputCoefficientsF16:(BOOL)a3
{
  self->_outputCoefficientsF16 = a3;
}

- (BOOL)fastStyleApplication
{
  return self->_fastStyleApplication;
}

- (void)setFastStyleApplication:(BOOL)a3
{
  self->_fastStyleApplication = a3;
}

- (BOOL)applyDithering
{
  return self->_applyDithering;
}

- (void)setApplyDithering:(BOOL)a3
{
  self->_applyDithering = a3;
}

- (__n128)linearSystemPriorMatrix
{
  return a1[9];
}

- (__n128)setLinearSystemPriorMatrix:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  return result;
}

- (BOOL)useBicubicIntegration
{
  return self->_useBicubicIntegration;
}

- (void)setUseBicubicIntegration:(BOOL)a3
{
  self->_useBicubicIntegration = a3;
}

- (BOOL)shouldFlushCVMTLTextureCacheAfterProcessing
{
  return self->_shouldFlushCVMTLTextureCacheAfterProcessing;
}

- (void)setShouldFlushCVMTLTextureCacheAfterProcessing:(BOOL)a3
{
  self->_shouldFlushCVMTLTextureCacheAfterProcessing = a3;
}

- (BOOL)shouldFlushCVMTLBufferCacheAfterProcessing
{
  return self->_shouldFlushCVMTLBufferCacheAfterProcessing;
}

- (void)setShouldFlushCVMTLBufferCacheAfterProcessing:(BOOL)a3
{
  self->_shouldFlushCVMTLBufferCacheAfterProcessing = a3;
}

- (unint64_t)filterForInputLearningThumbnailCreation
{
  return self->_filterForInputLearningThumbnailCreation;
}

- (void)setFilterForInputLearningThumbnailCreation:(unint64_t)a3
{
  self->_filterForInputLearningThumbnailCreation = a3;
}

- (unint64_t)filterForInputLearningWeightsThumbnailCreation
{
  return self->_filterForInputLearningWeightsThumbnailCreation;
}

- (void)setFilterForInputLearningWeightsThumbnailCreation:(unint64_t)a3
{
  self->_filterForInputLearningWeightsThumbnailCreation = a3;
}

- (unint64_t)filterForInputIntegrationThumbnailCreation
{
  return self->_filterForInputIntegrationThumbnailCreation;
}

- (void)setFilterForInputIntegrationThumbnailCreation:(unint64_t)a3
{
  self->_filterForInputIntegrationThumbnailCreation = a3;
}

- (unint64_t)filterForInputResidualCorrectionThumbnailCreation
{
  return self->_filterForInputResidualCorrectionThumbnailCreation;
}

- (void)setFilterForInputResidualCorrectionThumbnailCreation:(unint64_t)a3
{
  self->_filterForInputResidualCorrectionThumbnailCreation = a3;
}

- (unint64_t)filterForTargetLearningThumbnailCreation
{
  return self->_filterForTargetLearningThumbnailCreation;
}

- (void)setFilterForTargetLearningThumbnailCreation:(unint64_t)a3
{
  self->_filterForTargetLearningThumbnailCreation = a3;
}

- (unint64_t)filterForTargetResidualCorrectionThumbnailCreation
{
  return self->_filterForTargetResidualCorrectionThumbnailCreation;
}

- (void)setFilterForTargetResidualCorrectionThumbnailCreation:(unint64_t)a3
{
  self->_filterForTargetResidualCorrectionThumbnailCreation = a3;
}

- (BOOL)applySyntheticNoise
{
  return self->_applySyntheticNoise;
}

- (void)setApplySyntheticNoise:(BOOL)a3
{
  self->_applySyntheticNoise = a3;
}

@end
