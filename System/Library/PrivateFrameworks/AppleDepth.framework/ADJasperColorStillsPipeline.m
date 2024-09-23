@implementation ADJasperColorStillsPipeline

- (ADJasperColorStillsPipeline)init
{
  void *v3;
  ADJasperColorStillsPipeline *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ADJasperColorStillsPipeline initWithParameters:](self, "initWithParameters:", v3);

  return v4;
}

- (ADJasperColorStillsPipeline)initWithParameters:(id)a3
{
  id v4;
  ADJasperColorStillsPipeline *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  ADNetworkProvider *networkProvider;
  uint64_t v13;
  ADNetworkProvider *correctionBackendNetworkProvider;
  uint64_t v15;
  ADNetworkProvider *correctionFrontendNetworkProvider;
  ADEspressoStillImageInferenceDescriptor *v17;
  ADEspressoStillImageInferenceDescriptor *inferenceDesc;
  ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor *v19;
  ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor *correctionBackendInferenceDesc;
  ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor *v21;
  ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor *correctionFrontendInferenceDesc;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  ADImageDescriptor *processedDepthDesc;
  ADJasperColorStillsPipeline *v28;
  objc_super v30;
  int v31;
  __int128 v32;
  __int128 v33;

  v4 = a3;
  v31 = 335684784;
  v32 = 0u;
  v33 = 0u;
  kdebug_trace();
  v30.receiver = self;
  v30.super_class = (Class)ADJasperColorStillsPipeline;
  v5 = -[ADJasperColorStillsPipeline init](&v30, sel_init);
  if (v5)
  {
    if (!v4)
      v4 = (id)objc_opt_new();
    objc_storeStrong((id *)&v5->_pipelineParameters, v4);
    v5->_STDThreshold = 6.0;
    *(_OWORD *)v5->_STDWeights = xmmword_20B6D2AA0;
    -[ADPipelineParameters deviceName](v5->_pipelineParameters, "deviceName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[ADDeviceConfiguration getLidarType:](ADDeviceConfiguration, "getLidarType:", v6);

    if (v7 == 2)
    {
      v5->_STDThreshold = 10.0;
      v8 = CFSTR("SIPNetFrontend");
      v9 = CFSTR("SIPNetBackend");
      v10 = CFSTR("NMPPeridot");
    }
    else
    {
      v8 = CFSTR("SIJNetFrontend");
      v9 = CFSTR("SIJNetBackend");
      v10 = CFSTR("NMP");
    }
    +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    networkProvider = v5->_networkProvider;
    v5->_networkProvider = (ADNetworkProvider *)v11;

    +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    correctionBackendNetworkProvider = v5->_correctionBackendNetworkProvider;
    v5->_correctionBackendNetworkProvider = (ADNetworkProvider *)v13;

    +[ADNetworkProvider providerForNetwork:](ADNetworkProvider, "providerForNetwork:", v8);
    v15 = objc_claimAutoreleasedReturnValue();
    correctionFrontendNetworkProvider = v5->_correctionFrontendNetworkProvider;
    v5->_correctionFrontendNetworkProvider = (ADNetworkProvider *)v15;

    if (!v5->_networkProvider)
    {
      v28 = 0;
      goto LABEL_11;
    }
    v17 = -[ADEspressoStillImageInferenceDescriptor initWithNetworkProvider:]([ADEspressoStillImageInferenceDescriptor alloc], "initWithNetworkProvider:", v5->_networkProvider);
    inferenceDesc = v5->_inferenceDesc;
    v5->_inferenceDesc = v17;

    v19 = -[ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor initWithNetworkProvider:]([ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor alloc], "initWithNetworkProvider:", v5->_correctionBackendNetworkProvider);
    correctionBackendInferenceDesc = v5->_correctionBackendInferenceDesc;
    v5->_correctionBackendInferenceDesc = v19;

    v21 = -[ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor initWithNetworkProvider:]([ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor alloc], "initWithNetworkProvider:", v5->_correctionFrontendNetworkProvider);
    correctionFrontendInferenceDesc = v5->_correctionFrontendInferenceDesc;
    v5->_correctionFrontendInferenceDesc = v21;

    -[ADNetworkProvider bufferNameForInputType:](v5->_networkProvider, "bufferNameForInputType:", kADEspressoBufferIDDisparity);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isDisparity = v23 != 0;

    -[ADEspressoStillImageInferenceDescriptor depthOutput](v5->_inferenceDesc, "depthOutput");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "imageDescriptor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "cloneWithDifferentFormat:", 1717856627);
    v26 = objc_claimAutoreleasedReturnValue();
    processedDepthDesc = v5->_processedDepthDesc;
    v5->_processedDepthDesc = (ADImageDescriptor *)v26;

  }
  v28 = v5;
LABEL_11:
  kdebug_trace();

  return v28;
}

- (id)inferenceDescriptor
{
  return self->_inferenceDesc;
}

- (id)correctionBackendInferenceDescriptor
{
  return self->_correctionBackendInferenceDesc;
}

- (id)correctionFrontendInferenceDescriptor
{
  return self->_correctionFrontendInferenceDesc;
}

- (id)processedDepthOutputDescriptor
{
  return self->_processedDepthDesc;
}

- (int64_t)projectJasperPoints:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  int64_t v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  kdebug_trace();
  -[ADJasperColorStillsPipelineParameters pointCloudFilter](self->_pipelineParameters, "pointCloudFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "projectJasperPointsFilteredBy:croppedBy:rotatedBy:andScaledInto:", v14, a5, a6, x, y, width, height);

  kdebug_trace();
  return v15;
}

- (int64_t)projectJasperPointsForJasperToColorTransformCorrection:(id)a3 cropTo:(CGRect)a4 rotateBy:(int64_t)a5 projectedPointsBuffer:(__CVBuffer *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  int64_t v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  kdebug_trace();
  -[ADJasperColorStillsPipelineParameters pointCloudFilterForTransformCorrection](self->_pipelineParameters, "pointCloudFilterForTransformCorrection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "projectJasperPointsFilteredBy:croppedBy:rotatedBy:andScaledInto:", v14, a5, a6, x, y, width, height);

  kdebug_trace();
  return v15;
}

- (int64_t)postProcessWithDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4
{
  int64_t v6;

  kdebug_trace();
  v6 = +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", a3, a4);
  kdebug_trace();
  return v6;
}

- (int64_t)postProcessDepth:(__CVBuffer *)a3 depthOutput:(__CVBuffer *)a4 depthUnits:(unint64_t)a5
{
  int64_t v7;

  kdebug_trace();
  v7 = +[ADUtils postProcessDepth:depthOutput:](ADUtils, "postProcessDepth:depthOutput:", a3, a4);
  kdebug_trace();
  return v7;
}

- (uint64_t)postProcessJasperToColorTransformCorrection:(float32x4_t)a3 originalTransform:(float32x4_t)a4 correctedTransform:(__n128)a5
{
  id v10;
  void *v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  uint64_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;

  v10 = a7;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "std");
    v13 = vmulq_f32(v12, a1[5]);
    if ((float)(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).f32[0]/ 3.0) <= a1[6].f32[1])
    {
      objc_msgSend(v11, "rotation");
      +[ADUtils calcRotationMatrix:](ADUtils, "calcRotationMatrix:", *(double *)vmulq_n_f32(v18, a1[6].f32[0]).i64);
      v16 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a2.f32[0]), v20, *(float32x2_t *)a2.f32, 1), v21, a2, 2);
      v15 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a3.f32[0]), v20, *(float32x2_t *)a3.f32, 1), v21, a3, 2);
      v14 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, a4.f32[0]), v20, *(float32x2_t *)a4.f32, 1), v21, a4, 2);
    }
    else
    {
      v15 = a3;
      v14 = a4;
      v16 = a2;
    }
    v17 = 0;
    *(float32x4_t *)a8 = v16;
    *(float32x4_t *)(a8 + 16) = v15;
    *(float32x4_t *)(a8 + 32) = v14;
    *(__n128 *)(a8 + 48) = a5;
  }
  else
  {
    v17 = -22953;
  }

  return v17;
}

- (int64_t)processJasperToColorCorrectionIntermediateResultWithBackendEspressoFeaturesOutput:(const float *)a3 frontendEspressoFeaturesInput:(float *)a4 featuresDimensions:(id)a5
{
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  int v15;
  int v16;
  int j;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int i;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;

  v7 = a5;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntValue");

  }
  else
  {
    v9 = 1;
  }
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntValue");

  }
  if ((unint64_t)objc_msgSend(v7, "count") < 3)
    goto LABEL_10;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  if (v13)
  {
    if (v13 == 1)
    {
LABEL_10:
      memcpy(a4, a3, 4 * v11 * v9);
      goto LABEL_11;
    }
    if (v11 && v9)
    {
      v15 = v11 * v9;
      if (v9 > 0xF)
      {
        v24 = 0;
        for (i = 0; i != v13; ++i)
        {
          v26 = 0;
          v27 = 0;
          v28 = v24;
          v29 = i;
          do
          {
            v30 = v9;
            v31 = i + v13 * v26;
            v32 = v28;
            do
            {
              a4[v31] = a3[v32];
              v31 += v13;
              ++v32;
              --v30;
            }
            while (v30);
            ++v27;
            v29 += v9;
            v28 += v9;
            v26 += v9;
          }
          while (v27 != v11);
          v24 += v15;
        }
      }
      else
      {
        v16 = 0;
        for (j = 0; j != v13; ++j)
        {
          v18 = 0;
          v19 = v16;
          v20 = j;
          do
          {
            v21 = v19;
            v22 = v20;
            v23 = v9;
            do
            {
              a4[v22] = a3[v21];
              v22 += v13;
              ++v21;
              --v23;
            }
            while (v23);
            ++v18;
            v20 += v9 * v13;
            v19 += v9;
          }
          while (v18 != v11);
          v16 += v15;
        }
      }
    }
  }
LABEL_11:

  return 0;
}

- (uint64_t)postProcessJasperToColorCorrectionWithAngles:(__n128)a3 errors:(__n128)a4 originalTransform:(__n128)a5 correctedTransform:(float)a6 colorCameraCalibration:(uint64_t)a7 colorImageScale:(double *)a8 transformCorrectionResults:(double *)a9
{
  id v18;
  uint64_t v19;
  float v20;
  void *v21;

  v18 = a11;
  kdebug_trace();
  v19 = -22953;
  if (a8 && a9)
  {
    objc_msgSend(v18, "intrinsicMatrix");
    a1[24] = 500.0 / (float)(a6 * v20);
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "setRotation:", *a8);
    objc_msgSend(v21, "setStd:", *a9);
    if (a12)
      *a12 = objc_retainAutorelease(v21);
    v19 = objc_msgSend(a1, "postProcessJasperToColorTransformCorrection:originalTransform:correctedTransform:", v21, a10, a2.n128_f64[0], a3.n128_f64[0], a4.n128_f64[0], a5.n128_f64[0], *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);

  }
  kdebug_trace();

  return v19;
}

- (ADJasperColorStillsPipelineParameters)pipelineParameters
{
  return self->_pipelineParameters;
}

- (void)setPipelineParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineParameters, 0);
  objc_storeStrong((id *)&self->_processedDepthDesc, 0);
  objc_storeStrong((id *)&self->_correctionFrontendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_correctionBackendInferenceDesc, 0);
  objc_storeStrong((id *)&self->_inferenceDesc, 0);
  objc_storeStrong((id *)&self->_correctionFrontendNetworkProvider, 0);
  objc_storeStrong((id *)&self->_correctionBackendNetworkProvider, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
}

@end
