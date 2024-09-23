@implementation ADAdaptiveCorrectionPipeline

- (AdaptiveCorrectionConfig)getConfigFromPipelineParams
{
  AdaptiveCorrectionConfig *result;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;

  *(_OWORD *)&retstr->errorVal_BetweenIntermediate_ExtremeMacro = 0u;
  *(_OWORD *)&retstr->spgEpsilon = 0u;
  *(_OWORD *)&retstr->extremeMacroDistMM = 0u;
  *(_OWORD *)&retstr->errorVal_GreaterThanInf = 0u;
  *(_OWORD *)&retstr->rangeOCxT = 0u;
  *(_OWORD *)&retstr->rangeOCyW = 0u;
  *(_OWORD *)&retstr->epErrorLimitWidePix_FirstPass = 0u;
  *(_OWORD *)&retstr->rangePFL_T = 0u;
  result = (AdaptiveCorrectionConfig *)self->_pipelineParameters;
  if (result)
  {
    -[AdaptiveCorrectionConfig epErrorLimitWidePix_FirstPass](result, "epErrorLimitWidePix_FirstPass");
    retstr->epErrorLimitWidePix_FirstPass = v6;
    -[ADAdaptiveCorrectionPipelineParameters epErrorLimitWidePix_SecondPass](self->_pipelineParameters, "epErrorLimitWidePix_SecondPass");
    retstr->epErrorLimitWidePix_SecondPass = v7;
    -[ADAdaptiveCorrectionPipelineParameters rangePFL_T](self->_pipelineParameters, "rangePFL_T");
    retstr->rangePFL_T = v8;
    -[ADAdaptiveCorrectionPipelineParameters rangePFL_W](self->_pipelineParameters, "rangePFL_W");
    retstr->rangePFL_W = v9;
    -[ADAdaptiveCorrectionPipelineParameters rangeOCxT](self->_pipelineParameters, "rangeOCxT");
    retstr->rangeOCxT = v10;
    -[ADAdaptiveCorrectionPipelineParameters rangeOCxW](self->_pipelineParameters, "rangeOCxW");
    retstr->rangeOCxW = v11;
    -[ADAdaptiveCorrectionPipelineParameters rangeOCyW](self->_pipelineParameters, "rangeOCyW");
    retstr->rangeOCyW = v12;
    -[ADAdaptiveCorrectionPipelineParameters intermediateMacroDistMM](self->_pipelineParameters, "intermediateMacroDistMM");
    retstr->intermediateMacroDistMM = v13;
    -[ADAdaptiveCorrectionPipelineParameters extremeMacroDistMM](self->_pipelineParameters, "extremeMacroDistMM");
    retstr->extremeMacroDistMM = v14;
    retstr->minPointsForAdjustment = -[ADAdaptiveCorrectionPipelineParameters minPointsForAdjustment](self->_pipelineParameters, "minPointsForAdjustment");
    -[ADAdaptiveCorrectionPipelineParameters errorVal_GreaterThanInf](self->_pipelineParameters, "errorVal_GreaterThanInf");
    retstr->errorVal_GreaterThanInf = v15;
    -[ADAdaptiveCorrectionPipelineParameters errorVal_LessThanExtremeMacro](self->_pipelineParameters, "errorVal_LessThanExtremeMacro");
    retstr->errorVal_LessThanExtremeMacro = v16;
    -[ADAdaptiveCorrectionPipelineParameters errorVal_BetweenIntermediate_ExtremeMacro](self->_pipelineParameters, "errorVal_BetweenIntermediate_ExtremeMacro");
    retstr->errorVal_BetweenIntermediate_ExtremeMacro = v17;
    retstr->runAnalyticalPreconditioning = -[ADAdaptiveCorrectionPipelineParameters runAnalyticalPreconditioning](self->_pipelineParameters, "runAnalyticalPreconditioning");
    -[ADAdaptiveCorrectionPipelineParameters spgEpsilon](self->_pipelineParameters, "spgEpsilon");
    retstr->spgEpsilon = v18;
    result = (AdaptiveCorrectionConfig *)-[ADAdaptiveCorrectionPipelineParameters temporalFilteringStrength](self->_pipelineParameters, "temporalFilteringStrength");
    retstr->temporalFilteringStrength = v19;
  }
  return result;
}

- (ADAdaptiveCorrectionPipeline)initWithMaxNumPoints:(int)a3
{
  return -[ADAdaptiveCorrectionPipeline initWithMaxNumPoints:andParameters:](self, "initWithMaxNumPoints:andParameters:", *(_QWORD *)&a3, 0);
}

- (ADAdaptiveCorrectionPipeline)initWithMaxNumPoints:(int)a3 andParameters:(id)a4
{
  id v7;
  ADAdaptiveCorrectionPipeline *v8;
  ADAdaptiveCorrectionPipeline *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  NSObject *v16;
  const char *v17;
  ADAdaptiveCorrectionPipeline *v18;
  _OWORD v20[8];
  objc_super v21;

  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ADAdaptiveCorrectionPipeline;
  v8 = -[ADAdaptiveCorrectionPipeline init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3 <= 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        v16 = MEMORY[0x24BDACB70];
        v17 = "maxNumPoints must be positive integer";
        goto LABEL_11;
      }
    }
    else
    {
      objc_storeStrong((id *)&v8->_pipelineParameters, a4);
      -[ADAdaptiveCorrectionPipeline getConfigFromPipelineParams](v9, "getConfigFromPipelineParams");
      v10 = v20[0];
      v11 = v20[1];
      v12 = v20[2];
      *(_OWORD *)&v9->_config.rangeOCyW = v20[3];
      *(_OWORD *)&v9->_config.rangeOCxT = v12;
      *(_OWORD *)&v9->_config.rangePFL_T = v11;
      *(_OWORD *)&v9->_config.epErrorLimitWidePix_FirstPass = v10;
      v13 = v20[4];
      v14 = v20[5];
      v15 = v20[6];
      *(_OWORD *)&v9->_config.spgEpsilon = v20[7];
      *(_OWORD *)&v9->_config.errorVal_BetweenIntermediate_ExtremeMacro = v15;
      *(_OWORD *)&v9->_config.errorVal_GreaterThanInf = v14;
      *(_OWORD *)&v9->_config.extremeMacroDistMM = v13;
      if (!AdaptiveCorrection_createWithConfig(a3, (__int128 *)&v9->_config, &v9->_adc))
      {
        v18 = v9;
        goto LABEL_8;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        v16 = MEMORY[0x24BDACB70];
        v17 = "Failed create Adaptive Correction with config";
LABEL_11:
        _os_log_error_impl(&dword_20B62B000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)v20, 2u);
        v18 = 0;
        goto LABEL_8;
      }
    }
  }
  v18 = 0;
LABEL_8:

  return v18;
}

- (AdaptiveCorrectionStatus)getStatus
{
  AdaptiveCorrection *adc;
  AdaptiveCorrectionStatus *result;

  adc = self->_adc;
  bzero(retstr, 0x1E48uLL);
  if (adc)
    return (AdaptiveCorrectionStatus *)memcpy(retstr, (char *)adc + 136, sizeof(AdaptiveCorrectionStatus));
  return result;
}

- (int64_t)fullTemporalCorrectionWithCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 xyPointsTele:(const double *)a5 xyPointsWide:(const double *)a6 numPoints:(int)a7
{
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int32x4_t v18;
  int32x4_t v19;
  double v20;
  int32x4_t v21;
  int64_t v22;
  uint8_t v24[16];
  float64x2_t v25[9];
  float64x2_t v26[10];
  float64x2_t v27[10];

  v12 = a3;
  v13 = a4;
  +[ADAdaptiveCorrectionPipeline convertCameraCalibrationTele:cameraCalibrationWide:toDistortionModelTele:toDistortionModelWide:toCalModel:](ADAdaptiveCorrectionPipeline, "convertCameraCalibrationTele:cameraCalibrationWide:toDistortionModelTele:toDistortionModelWide:toCalModel:", v12, v13, v27, v26, v25);
  v22 = +[ADUtils ADReturnFromOSStatus:](ADUtils, "ADReturnFromOSStatus:", AdaptiveCorrection_fullTemporalCorrectionWithDistortion((uint64_t)self->_adc, (uint64_t)a5, (uint64_t)a6, a7, v27, v26, v25, v14, v15, v16, v17, v18, v19, v20, v21));
  if (v22)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed full Temporal Correction With Distortion.", v24, 2u);
    }
  }
  else
  {
    +[ADAdaptiveCorrectionPipeline updateCameraCalibrationTele:cameraCalibrationWide:withDistortionModelTele:withDistortionModelWide:withCalModel:](ADAdaptiveCorrectionPipeline, "updateCameraCalibrationTele:cameraCalibrationWide:withDistortionModelTele:withDistortionModelWide:withCalModel:", v12, v13, v27, v26, v25);
  }

  return v22;
}

- (int64_t)fullCorrectionWithCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 xyPointsTele:(const double *)a5 xyPointsWide:(const double *)a6 numPoints:(int)a7
{
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int32x4_t v18;
  int32x4_t v19;
  double v20;
  int32x4_t v21;
  int64_t v22;
  uint8_t v24[16];
  double v25[18];
  double v26[20];
  double v27[20];

  v12 = a3;
  v13 = a4;
  +[ADAdaptiveCorrectionPipeline convertCameraCalibrationTele:cameraCalibrationWide:toDistortionModelTele:toDistortionModelWide:toCalModel:](ADAdaptiveCorrectionPipeline, "convertCameraCalibrationTele:cameraCalibrationWide:toDistortionModelTele:toDistortionModelWide:toCalModel:", v12, v13, v27, v26, v25);
  v22 = +[ADUtils ADReturnFromOSStatus:](ADUtils, "ADReturnFromOSStatus:", AdaptiveCorrection_fullCorrectionWithDistortion((uint64_t)self->_adc, (uint64_t)a5, (uint64_t)a6, a7, v27, v26, v25, v14, v15, v16, v17, v18, v19, v20, v21));
  if (v22 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v24 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed full Correction With Distortion.", v24, 2u);
  }
  +[ADAdaptiveCorrectionPipeline updateCameraCalibrationTele:cameraCalibrationWide:withDistortionModelTele:withDistortionModelWide:withCalModel:](ADAdaptiveCorrectionPipeline, "updateCameraCalibrationTele:cameraCalibrationWide:withDistortionModelTele:withDistortionModelWide:withCalModel:", v12, v13, v27, v26, v25);

  return v22;
}

- (int64_t)fullCorrectionWithPointsTele:(const double *)a3 xyPointsWide:(const double *)a4 numPoints:(int)a5 calModel:(id)a6
{
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v7 = a6;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  +[ADAdaptiveCorrectionPipeline convertToInternalCalModel:](ADAdaptiveCorrectionPipeline, "convertToInternalCalModel:", v7);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ADAdaptiveCorrectionPipeline getStatus](self, "getStatus");
  AdaptiveCorrection_fullCorrection();
  v24 = v15;
  v25 = v16;
  v26 = v17;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v18 = v9;
  v19 = v10;
  +[ADAdaptiveCorrectionPipeline updateADCalModel:fromInternalCalModel:](ADAdaptiveCorrectionPipeline, "updateADCalModel:fromInternalCalModel:", v7, &v18);

  return 0;
}

- (int)maxNumPoints
{
  return self->_maxNumPoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
}

+ (void)fillDistortionModel:(DistortionModel *)a3 andUpdateCalModel:(CalModel *)a4 forCamera:(int)a5 fromCalib:(id)a6
{
  float v9;
  float v10;
  double *v11;
  float v12;
  void *v13;
  float v14;
  float v15;
  double v16;
  double v17;
  id v18;

  v18 = a6;
  objc_msgSend(v18, "intrinsicMatrix");
  a4->var0[a5] = v9;
  objc_msgSend(v18, "intrinsicMatrix");
  v11 = &a4->var0[a5];
  v11[2] = v10;
  objc_msgSend(v18, "intrinsicMatrix");
  v11[4] = v12;
  objc_msgSend(v18, "distortionModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pixelSize");
  a3->var0 = v14;
  objc_msgSend(v13, "focalLength");
  a3->var1 = v15;
  objc_msgSend(v13, "distortionCenter");
  a3->var2 = v16;
  objc_msgSend(v13, "distortionCenter");
  a3->var3 = v17;
  a3->var4[0] = *(float *)objc_msgSend(v13, "distortionPolynomialsBase");
  a3->var5[0] = *(float *)objc_msgSend(v13, "distortionPolynomialsDynamic");
  a3->var4[1] = *(float *)(objc_msgSend(v13, "distortionPolynomialsBase") + 4);
  a3->var5[1] = *(float *)(objc_msgSend(v13, "distortionPolynomialsDynamic") + 4);
  a3->var4[2] = *(float *)(objc_msgSend(v13, "distortionPolynomialsBase") + 8);
  a3->var5[2] = *(float *)(objc_msgSend(v13, "distortionPolynomialsDynamic") + 8);
  a3->var4[3] = *(float *)(objc_msgSend(v13, "distortionPolynomialsBase") + 12);
  a3->var5[3] = *(float *)(objc_msgSend(v13, "distortionPolynomialsDynamic") + 12);
  a3->var4[4] = *(float *)(objc_msgSend(v13, "distortionPolynomialsBase") + 16);
  a3->var5[4] = *(float *)(objc_msgSend(v13, "distortionPolynomialsDynamic") + 16);
  a3->var4[5] = *(float *)(objc_msgSend(v13, "distortionPolynomialsBase") + 20);
  a3->var5[5] = *(float *)(objc_msgSend(v13, "distortionPolynomialsDynamic") + 20);
  a3->var4[6] = *(float *)(objc_msgSend(v13, "distortionPolynomialsBase") + 24);
  a3->var5[6] = *(float *)(objc_msgSend(v13, "distortionPolynomialsDynamic") + 24);
  a3->var4[7] = *(float *)(objc_msgSend(v13, "distortionPolynomialsBase") + 28);
  a3->var5[7] = *(float *)(objc_msgSend(v13, "distortionPolynomialsDynamic") + 28);

}

+ (void)updateADCameraCalib:(id)a3 fromDistortionModel:(const DistortionModel *)a4 andCalModel:(const CalModel *)a5 forCamera:(int)a6
{
  double *v9;
  unsigned int v10;
  unsigned int v11;
  double v12;
  unsigned int v13;
  double v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  double var0;
  double var1;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "intrinsicMatrix");
  v9 = &a5->var0[a6];
  *(float *)&v10 = *v9;
  v12 = COERCE_DOUBLE(__PAIR64__(v10, v11));
  v14 = COERCE_DOUBLE(__PAIR64__(v13, v10));
  *(float *)&v15 = v9[2];
  *(float *)&v16 = v9[4];
  objc_msgSend(v20, "setIntrinsicMatrix:", v14, v12, COERCE_DOUBLE(__PAIR64__(v16, v15)));
  objc_msgSend(v20, "distortionModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = a4->var0;
  *(float *)&var0 = a4->var0;
  objc_msgSend(v17, "setPixelSize:", var0);
  var1 = a4->var1;
  *(float *)&var1 = var1;
  objc_msgSend(v17, "setFocalLength:", var1);
  objc_msgSend(v17, "setDistortionCenter:", a4->var2, a4->var3);

}

+ (double)convertExtrinsics:(int8x16_t)a3 toInternalFormat:(__n128)a4
{
  float32x2_t v7;
  double result;

  *(double *)a7 = *(float *)a1.i32;
  *(double *)(a7 + 8) = *(float *)a2.i32;
  *(double *)(a7 + 16) = *(float *)a3.i32;
  v7 = (float32x2_t)vext_s8((int8x8_t)a4.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL), 4uLL);
  a4.n128_u32[1] = a1.u32[1];
  *(float64x2_t *)(a7 + 24) = vcvtq_f64_f32((float32x2_t)a4.n128_u64[0]);
  *(float64x2_t *)(a7 + 40) = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)a2.i8, *(int32x2_t *)a3.i8));
  *(float64x2_t *)(a7 + 56) = vcvtq_f64_f32(v7);
  *(float64x2_t *)(a7 + 72) = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a3, a3, 8uLL)));
  result = a4.n128_f32[2];
  *(double *)(a7 + 88) = a4.n128_f32[2];
  return result;
}

+ (void)convertInternalExtrinsics:(double)a3[12] toMatrix:(id *)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;

  v4 = *a3;
  *(float *)a4 = v4;
  v5 = a3[1];
  *((float *)a4 + 4) = v5;
  v6 = a3[2];
  *((float *)a4 + 8) = v6;
  v7 = a3[3];
  *((float *)a4 + 12) = v7;
  v8 = a3[4];
  *((float *)a4 + 1) = v8;
  v9 = a3[5];
  *((float *)a4 + 5) = v9;
  v10 = a3[6];
  *((float *)a4 + 9) = v10;
  v11 = a3[7];
  *((float *)a4 + 13) = v11;
  v12 = a3[8];
  *((float *)a4 + 2) = v12;
  v13 = a3[9];
  *((float *)a4 + 6) = v13;
  v14 = a3[10];
  *((float *)a4 + 10) = v14;
  v15 = a3[11];
  *((float *)a4 + 14) = v15;
}

+ (void)convertCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 toDistortionModelTele:(DistortionModel *)a5 toDistortionModelWide:(DistortionModel *)a6 toCalModel:(CalModel *)a7
{
  id v12;
  id v13;

  v13 = a3;
  v12 = a4;
  objc_msgSend(a1, "fillDistortionModel:andUpdateCalModel:forCamera:fromCalib:", a5, a7, 0, v13);
  objc_msgSend(a1, "fillDistortionModel:andUpdateCalModel:forCamera:fromCalib:", a6, a7, 1, v12);
  objc_msgSend(v13, "getTransformationTo:", v12);
  objc_msgSend(a1, "convertExtrinsics:toInternalFormat:", a7->var3);

}

+ (void)updateCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 withDistortionModelTele:(const DistortionModel *)a5 withDistortionModelWide:(const DistortionModel *)a6 withCalModel:(const CalModel *)a7
{
  id v12;
  id v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;

  v12 = a3;
  v13 = a4;
  objc_msgSend(a1, "updateADCameraCalib:fromDistortionModel:andCalModel:forCamera:", v12, a5, a7, 0);
  objc_msgSend(a1, "updateADCameraCalib:fromDistortionModel:andCalModel:forCamera:", v13, a6, a7, 1);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(a1, "convertInternalExtrinsics:toMatrix:", a7->var3, &v26);
  v22 = v26;
  v23 = v27;
  v24 = v28;
  v25 = v29;
  objc_msgSend(v13, "cameraToPlatformTransform");
  v15 = v24;
  v14 = v25;
  v14.i32[3] = 1.0;
  v15.i32[3] = 0;
  v17 = v22;
  v16 = v23;
  v16.i32[3] = 0;
  v17.i32[3] = 0;
  objc_msgSend(v12, "setCameraToPlatformTransform:", *(double *)vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, v18.f32[0]), v16, *(float32x2_t *)v18.f32, 1), v15, v18, 2), (float32x4_t)0, v14).i64, *(double *)vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, v19.f32[0]), v16, *(float32x2_t *)v19.f32, 1), v15, v19, 2), (float32x4_t)0, v14).i64, *(double *)vmlaq_f32(
                 vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, v20.f32[0]), v16, *(float32x2_t *)v20.f32, 1), v15, v20, 2), (float32x4_t)0, v14).i64, *(double *)vaddq_f32(v14, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, v21.f32[0]), v16, *(float32x2_t *)v21.f32, 1), v15, v21, 2)).i64);

}

+ (CalModel)convertToInternalCalModel:(SEL)a3
{
  float v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CalModel *result;
  id v13;

  v13 = a4;
  objc_msgSend(v13, "focalLengthPixRef");
  retstr->var0[0] = v6;
  objc_msgSend(v13, "focalLengthPixAux");
  retstr->var0[1] = v7;
  objc_msgSend(v13, "opticalCenterRef");
  retstr->var1[0] = v8;
  objc_msgSend(v13, "opticalCenterRef");
  retstr->var2[0] = v9;
  objc_msgSend(v13, "opticalCenterAux");
  retstr->var1[1] = v10;
  objc_msgSend(v13, "opticalCenterAux");
  retstr->var2[1] = v11;
  objc_msgSend(v13, "refToAuxExtrinsic");
  objc_msgSend(a2, "convertExtrinsics:toInternalFormat:", retstr->var3);

  return result;
}

+ (void)updateADCalModel:(id)a3 fromInternalCalModel:(const CalModel *)a4
{
  id v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v6 = a3;
  v7 = a4->var0[0];
  *(float *)&v7 = a4->var0[0];
  objc_msgSend(v6, "setFocalLengthPixRef:", v7);
  v8 = a4->var0[1];
  *(float *)&v8 = v8;
  objc_msgSend(v6, "setFocalLengthPixAux:", v8);
  objc_msgSend(v6, "setOpticalCenterRef:", a4->var1[0], a4->var2[0]);
  objc_msgSend(v6, "setOpticalCenterAux:", a4->var1[1], a4->var2[1]);
  objc_msgSend(a1, "convertInternalExtrinsics:toMatrix:", a4->var3, &v9);
  objc_msgSend(v6, "setRefToAuxExtrinsic:", *(double *)&v9, *(double *)&v10, *(double *)&v11, *(double *)&v12);

}

+ (int64_t)approximateCorrectionWithPointsTele:(const double *)a3 xyPointsWide:(const double *)a4 numPoints:(int)a5 calModel:(id)a6
{
  id v10;
  _OWORD v12[9];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v10 = a6;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "convertToInternalCalModel:", v10);
  AdaptiveCorrection_approximateCorrection((uint64_t)a3, (uint64_t)a4, a5, (uint64_t)&v13, (uint64_t)v12);
  v19 = v12[6];
  v20 = v12[7];
  v21 = v12[8];
  v15 = v12[2];
  v16 = v12[3];
  v17 = v12[4];
  v18 = v12[5];
  v13 = v12[0];
  v14 = v12[1];
  objc_msgSend(a1, "updateADCalModel:fromInternalCalModel:", v10, &v13);

  return 0;
}

+ (int64_t)computeVerticalBaselineTransform:(uint64_t)a3 extrinsicRefToAuxPrime:(uint64_t)a4 rotationRefToRefPrime:(uint64_t)a5 rotationAuxToAuxPrime:(_QWORD *)a6
{
  int64_t v7;
  uint8_t v9[16];

  v7 = +[ADUtils ADReturnFromOSStatus:](ADUtils, "ADReturnFromOSStatus:", AdaptiveCorrection_computeVerticalBaselineTransform(a5, a6, a7, a1, a2));
  if (v7 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed compute vertical baseline transform.", v9, 2u);
  }
  return v7;
}

+ (int64_t)rotateCalModel:(int8x16_t)a3 extrinsicRefToAuxRotated:(__n128)a4 rotationRef:(float32x2_t)a5 rotationAux:(float32x2_t)a6 calRotated:(float32x2_t)a7
{
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  float v20;
  int32x2_t v21;
  float v22;
  int32x2_t v23;
  int64_t v24;
  uint8_t v26[16];

  v13 = 4294954516;
  if (a11 && a12)
  {
    v13 = 0;
    *(_OWORD *)a12 = *(_OWORD *)a11;
    v14 = *(_OWORD *)(a11 + 16);
    v15 = *(_OWORD *)(a11 + 32);
    v16 = *(_OWORD *)(a11 + 64);
    *(_OWORD *)(a12 + 48) = *(_OWORD *)(a11 + 48);
    *(_OWORD *)(a12 + 64) = v16;
    *(_OWORD *)(a12 + 16) = v14;
    *(_OWORD *)(a12 + 32) = v15;
    v17 = *(_OWORD *)(a11 + 80);
    v18 = *(_OWORD *)(a11 + 96);
    v19 = *(_OWORD *)(a11 + 128);
    *(_OWORD *)(a12 + 112) = *(_OWORD *)(a11 + 112);
    *(_OWORD *)(a12 + 128) = v19;
    *(_OWORD *)(a12 + 80) = v17;
    *(_OWORD *)(a12 + 96) = v18;
    *(float *)&v17 = *(double *)(a11 + 16);
    v20 = *(double *)(a11 + 32);
    v21 = (int32x2_t)vmla_n_f32(vmul_n_f32(a5, *(float *)&v17), a6, v20);
    v22 = *(double *)(a11 + 24);
    *(float *)&v17 = *(double *)(a11 + 40);
    v23 = (int32x2_t)vmla_n_f32(vmul_n_f32(a7, v22), a8, *(float *)&v17);
    *(float64x2_t *)(a12 + 16) = vcvtq_f64_f32((float32x2_t)vzip1_s32(v21, v23));
    *(float64x2_t *)(a12 + 32) = vcvtq_f64_f32((float32x2_t)vzip2_s32(v21, v23));
    *(double *)(a12 + 48) = *(float *)a1.i32;
    *(double *)(a12 + 56) = *(float *)a2.i32;
    *(double *)(a12 + 64) = *(float *)a3.i32;
    *(float64x2_t *)(a12 + 72) = vcvtq_f64_f32((float32x2_t)__PAIR64__(a1.u32[1], a4.n128_u32[0]));
    *(float64x2_t *)(a12 + 88) = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)a2.i8, *(int32x2_t *)a3.i8));
    *(float64x2_t *)(a12 + 104) = vcvtq_f64_f32((float32x2_t)vext_s8((int8x8_t)a4.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL), 4uLL));
    *(float64x2_t *)(a12 + 120) = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a3, a3, 8uLL)));
    *(double *)(a12 + 136) = a4.n128_f32[2];
  }
  v24 = +[ADUtils ADReturnFromOSStatus:](ADUtils, "ADReturnFromOSStatus:", v13);
  if (v24 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v26 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed rotate calmodel.", v26, 2u);
  }
  return v24;
}

+ (int64_t)rotateDistortionModel:(uint64_t)a3 rotation:(uint64_t)a4 distRotated:(uint64_t)a5
{
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  int64_t v15;
  uint8_t v17[16];

  v7 = 4294954516;
  if (a5 && a6)
  {
    v7 = 0;
    v8 = *(_OWORD *)(a5 + 16);
    *a6 = *(_OWORD *)a5;
    a6[1] = v8;
    v9 = *(_OWORD *)(a5 + 32);
    v10 = *(_OWORD *)(a5 + 48);
    v11 = *(_OWORD *)(a5 + 80);
    a6[4] = *(_OWORD *)(a5 + 64);
    a6[5] = v11;
    a6[2] = v9;
    a6[3] = v10;
    v12 = *(_OWORD *)(a5 + 96);
    v13 = *(_OWORD *)(a5 + 112);
    v14 = *(_OWORD *)(a5 + 144);
    a6[8] = *(_OWORD *)(a5 + 128);
    a6[9] = v14;
    a6[6] = v12;
    a6[7] = v13;
    *(float *)&v12 = *(double *)(a5 + 16);
    *(float *)&v13 = *(double *)(a5 + 24);
    a6[1] = vcvtq_f64_f32(vmla_n_f32(vmul_n_f32(a1, *(float *)&v12), a2, *(float *)&v13));
  }
  v15 = +[ADUtils ADReturnFromOSStatus:](ADUtils, "ADReturnFromOSStatus:", v7);
  if (v15 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed rotate distortion model.", v17, 2u);
  }
  return v15;
}

+ (int64_t)transformPointsWithMatrix:(uint64_t)a3 numPoints:(uint64_t)a4 transformMatrix:(uint64_t)a5 xyPointsTransformed:(int)a6
{
  uint64_t v8;
  uint64_t v9;
  double *v10;
  float v11;
  float v12;
  int64_t v13;
  uint8_t v15[16];

  v8 = 4294954516;
  if (a5 && a7)
  {
    if (a6 >= 1)
    {
      v9 = a6;
      v10 = (double *)(a5 + 8);
      do
      {
        v11 = *(v10 - 1);
        v12 = *v10;
        *a7++ = vcvtq_f64_f32(vmla_n_f32(vmul_n_f32(a1, v11), a2, v12));
        v10 += 2;
        --v9;
      }
      while (v9);
    }
    v8 = 0;
  }
  v13 = +[ADUtils ADReturnFromOSStatus:](ADUtils, "ADReturnFromOSStatus:", v8);
  if (v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v15 = 0;
    _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed transform points with matrix.", v15, 2u);
  }
  return v13;
}

+ (double)meanFundamentalEpipolarErrorForCalModel:(const CalModel *)a3 xyPointsTele:(const double *)a4 xyPointsWide:(const double *)a5 numPoints:(int)a6
{
  double v7;

  v7 = 0.0;
  FundamentalEpipolarError_MeanVal((uint64_t)a4, (uint64_t)a5, a6, a3->var0, &v7);
  return v7;
}

@end
