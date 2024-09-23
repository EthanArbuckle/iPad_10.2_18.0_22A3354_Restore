@implementation CMIStyleEngineIntegrateCoefficients

- (CMIStyleEngineIntegrateCoefficients)initWithMetalContext:(id)a3
{
  id v4;
  CMIStyleEngineIntegrateCoefficients *v5;
  CMIStyleEngineIntegrateCoefficients *v6;
  void *v7;
  int v8;
  CMIStyleEngineIntegrateCoefficients *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMIStyleEngineIntegrateCoefficients;
  v5 = -[CMIStyleEngineIntegrateCoefficients init](&v11, sel_init);
  v6 = v5;
  if (!v5
    || -[CMIStyleEngineIntegrateCoefficients _compileShaders:](v5, "_compileShaders:", v4)
    || (objc_msgSend(v4, "device"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[CMIStyleEngineIntegrateCoefficients _createSamplers:](v6, "_createSamplers:", v7),
        v7,
        v8))
  {
    FigDebugAssert3();
    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (int)_compileShaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTLComputePipelineState *v7;
  MTLComputePipelineState *v8;
  MTLComputePipelineState *v9;
  MTLComputePipelineState *v10;
  int v11;

  v4 = a3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  styleEngineSharedFunctionConstants(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_6;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::Integrate"), v6);
  v7 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v8 = self->_computePipelineState[0];
  self->_computePipelineState[0] = v7;

  if (!self->_computePipelineState[0])
    goto LABEL_6;
  objc_msgSend(v4, "computePipelineStateFor:constants:", CFSTR("StyleEngine::FillCoefficientTexture"), v6);
  v9 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  v10 = self->_computePipelineState[1];
  self->_computePipelineState[1] = v9;

  if (self->_computePipelineState[1])
  {
    v11 = 0;
  }
  else
  {
LABEL_6:
    FigDebugAssert3();
    v11 = FigSignalErrorAt();
  }

  return v11;
}

- (int)_createSamplers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTLSamplerState *v7;
  MTLSamplerState *v8;
  MTLSamplerState *v9;
  MTLSamplerState *v10;
  int v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v5, "setMinFilter:", 1);
  objc_msgSend(v6, "setMagFilter:", 1);
  objc_msgSend(v6, "setSAddressMode:", 0);
  objc_msgSend(v6, "setTAddressMode:", 0);
  objc_msgSend(v6, "setNormalizedCoordinates:", 1);
  v7 = (MTLSamplerState *)objc_msgSend(v4, "newSamplerStateWithDescriptor:", v6);
  v8 = self->_sampler[0];
  self->_sampler[0] = v7;

  if (!self->_sampler[0])
    goto LABEL_6;
  objc_msgSend(v6, "setMinFilter:", 2);
  objc_msgSend(v6, "setMagFilter:", 2);
  objc_msgSend(v6, "setSAddressMode:", 0);
  objc_msgSend(v6, "setTAddressMode:", 0);
  objc_msgSend(v6, "setNormalizedCoordinates:", 1);
  v9 = (MTLSamplerState *)objc_msgSend(v4, "newSamplerStateWithDescriptor:", v6);
  v10 = self->_sampler[1];
  self->_sampler[1] = v9;

  if (self->_sampler[1])
  {
    v11 = 0;
  }
  else
  {
LABEL_6:
    FigDebugAssert3();
    v11 = FigSignalErrorAt();
  }

  return v11;
}

- (int)enqueueToCommandBuffer:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  double width;
  id v13;
  double height;
  CGFloat x;
  CGFloat y;
  id v17;
  CGFloat v18;
  id v19;
  CGFloat v20;
  BOOL v21;
  double v22;
  float64_t v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  CGFloat v32;
  float64x2_t v33;
  float64x2_t v34;
  CGFloat v35;
  float64x2_t v36;
  CGFloat v37;
  double v38;
  double v39;
  CGFloat v40;
  float64x2_t v41;
  MTLComputePipelineState *v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  MTLComputePipelineState *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  int v60;
  CGFloat v62;
  CGFloat MinY;
  CGFloat v64;
  CGFloat MinX;
  CGFloat v66;
  int32x2_t v67;
  id *location;
  id v69;
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  float32x4_t v74;
  int v75;
  uint64_t v76;
  int16x4_t v77[2];
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v69 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_outputIntegratedCoefficientsTexture);
  if (!WeakRetained)
    goto LABEL_16;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained((id *)&self->_inputWeightPlanesTexture);
  if (!v6)
  {
LABEL_15:

LABEL_16:
    FigDebugAssert3();
    v60 = FigSignalErrorAt();
    goto LABEL_17;
  }
  v7 = v6;
  v8 = objc_loadWeakRetained((id *)&self->_inputCoefficientsBuffer);
  if (!v8)
  {

    goto LABEL_15;
  }
  v9 = v8;
  v10 = objc_loadWeakRetained((id *)&self->_inputCoefficientsTexture);

  if (!v10)
    goto LABEL_16;
  if (CGRectIsEmpty(self->_spotlightROI))
  {
    v11 = objc_loadWeakRetained((id *)&self->_outputIntegratedCoefficientsTexture);
    width = (double)(unint64_t)objc_msgSend(v11, "width");
    v13 = objc_loadWeakRetained((id *)&self->_outputIntegratedCoefficientsTexture);
    height = (double)(unint64_t)objc_msgSend(v13, "height");

    x = 0.0;
    y = 0.0;
  }
  else
  {
    x = self->_spotlightROI.origin.x;
    y = self->_spotlightROI.origin.y;
    width = self->_spotlightROI.size.width;
    height = self->_spotlightROI.size.height;
  }
  v17 = objc_loadWeakRetained((id *)&self->_outputIntegratedCoefficientsTexture);
  v18 = (double)(unint64_t)objc_msgSend(v17, "width");
  v19 = objc_loadWeakRetained((id *)&self->_outputIntegratedCoefficientsTexture);
  v78.size.height = (double)(unint64_t)objc_msgSend(v19, "height");
  v20 = 0.0;
  v78.origin.x = 0.0;
  v78.origin.y = 0.0;
  v78.size.width = v18;
  v87.origin.x = x;
  v87.origin.y = y;
  v87.size.width = width;
  v87.size.height = height;
  v21 = CGRectContainsRect(v78, v87);

  if (!v21)
    goto LABEL_16;
  v22 = 1.0;
  v23 = 0.0;
  v24 = 1.0;
  if (!CGRectIsEmpty(self->_spotlightZoomROI))
  {
    v20 = self->_spotlightZoomROI.origin.x;
    v23 = self->_spotlightZoomROI.origin.y;
    v22 = self->_spotlightZoomROI.size.width;
    v24 = self->_spotlightZoomROI.size.height;
  }
  v79.origin.x = 0.0;
  v79.origin.y = 0.0;
  v79.size.width = 1.0;
  v79.size.height = 1.0;
  v88.origin.x = v20;
  v88.origin.y = v23;
  v88.size.width = v22;
  v88.size.height = v24;
  if (!CGRectContainsRect(v79, v88))
    goto LABEL_16;
  objc_msgSend(v69, "computeCommandEncoder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
    goto LABEL_16;
  v26 = v25;
  objc_msgSend(v25, "setSamplerState:atIndex:", self->_sampler[self->_useBicubicSampling], 0);
  location = (id *)&self->_outputIntegratedCoefficientsTexture;
  v27 = objc_loadWeakRetained((id *)&self->_outputIntegratedCoefficientsTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v27, 0);

  v28 = objc_loadWeakRetained((id *)&self->_inputWeightPlanesTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v28, 1);

  v29 = objc_loadWeakRetained((id *)&self->_inputCoefficientsTexture);
  objc_msgSend(v26, "setTexture:atIndex:", v29, 2);

  v30 = objc_loadWeakRetained((id *)&self->_inputCoefficientsBuffer);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", v30, 0, 0);

  v31 = objc_loadWeakRetained((id *)&self->_linearSystemStatus);
  objc_msgSend(v26, "setBuffer:offset:atIndex:", v31, 0, 1);

  objc_msgSend(v26, "setBytes:length:atIndex:", &self->_globalLinearSystemMixFactor, 4, 2);
  v80.origin.x = x;
  v80.origin.y = y;
  v80.size.width = width;
  v80.size.height = height;
  MinX = CGRectGetMinX(v80);
  v81.origin.x = x;
  v81.origin.y = y;
  v81.size.width = width;
  v81.size.height = height;
  MinY = CGRectGetMinY(v81);
  v82.origin.x = x;
  v82.origin.y = y;
  v82.size.width = width;
  v82.size.height = height;
  v62 = CGRectGetWidth(v82);
  v83.origin.x = x;
  v83.origin.y = y;
  v83.size.width = width;
  v83.size.height = height;
  v32 = CGRectGetHeight(v83);
  v33.f64[0] = v62;
  v33.f64[1] = v32;
  v34.f64[0] = MinX;
  v34.f64[1] = MinY;
  v77[0] = vuzp1_s16((int16x4_t)vmovn_s64(vcvtq_s64_f64(v34)), (int16x4_t)vmovn_s64(vcvtq_s64_f64(v33)));
  objc_msgSend(v26, "setBytes:length:atIndex:", v77, 8, 3);
  objc_msgSend(v26, "setBytes:length:atIndex:", &self[1], 48, 5);
  v75 = 0;
  LOBYTE(v75) = self->_globalSpatialExtrapolation;
  v76 = *(_QWORD *)&self->_maxGlobalMixFactor;
  objc_msgSend(v26, "setBytes:length:atIndex:", &v75, 12, 6);
  v84.origin.x = v20;
  v84.origin.y = v23;
  v84.size.width = v22;
  v84.size.height = v24;
  v66 = CGRectGetMinX(v84);
  v85.origin.x = v20;
  v85.origin.y = v23;
  v85.size.width = v22;
  v85.size.height = v24;
  v35 = CGRectGetMinY(v85);
  v36.f64[0] = v66;
  v36.f64[1] = v35;
  v67 = (int32x2_t)vcvt_f32_f64(v36);
  v37 = v20;
  v36.f64[0] = v23;
  v38 = v22;
  v39 = v24;
  v64 = CGRectGetWidth(*(CGRect *)((char *)&v36 - 8));
  v86.origin.x = v20;
  v86.origin.y = v23;
  v86.size.width = v22;
  v86.size.height = v24;
  v40 = CGRectGetHeight(v86);
  v41.f64[0] = v64;
  v41.f64[1] = v40;
  v74 = vcvt_hight_f32_f64(v67, v41);
  objc_msgSend(v26, "setBytes:length:atIndex:", &v74, 16, 4);
  v42 = self->_computePipelineState[1];
  objc_msgSend(v26, "setComputePipelineState:", v42);
  v43 = -[MTLComputePipelineState threadExecutionWidth](v42, "threadExecutionWidth");
  v44 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v42, "maxTotalThreadsPerThreadgroup");
  v45 = v44 / -[MTLComputePipelineState threadExecutionWidth](v42, "threadExecutionWidth");
  objc_msgSend(v26, "setImageblockWidth:height:", v43, v45);
  v46 = objc_loadWeakRetained((id *)&self->_inputCoefficientsTexture);
  v47 = objc_msgSend(v46, "width");
  v48 = objc_loadWeakRetained((id *)&self->_inputCoefficientsTexture);
  v49 = objc_msgSend(v48, "height");
  v50 = objc_loadWeakRetained((id *)&self->_inputCoefficientsTexture);
  v73[0] = v47;
  v73[1] = v49;
  v73[2] = objc_msgSend(v50, "arrayLength");
  v72[0] = v43;
  v72[1] = v45;
  v72[2] = 1;
  objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v73, v72);

  v51 = self->_computePipelineState[0];
  objc_msgSend(v26, "setComputePipelineState:", v51);
  v52 = -[MTLComputePipelineState threadExecutionWidth](v51, "threadExecutionWidth");
  v53 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](v51, "maxTotalThreadsPerThreadgroup");
  v54 = v53 / -[MTLComputePipelineState threadExecutionWidth](v51, "threadExecutionWidth");
  objc_msgSend(v26, "setImageblockWidth:height:", v52, v54);
  v55 = objc_loadWeakRetained(location);
  v56 = objc_msgSend(v55, "width");
  v57 = objc_loadWeakRetained(location);
  v58 = objc_msgSend(v57, "height");
  v59 = objc_loadWeakRetained(location);
  v71[0] = v56;
  v71[1] = v58;
  v71[2] = objc_msgSend(v59, "arrayLength");
  v70[0] = v52;
  v70[1] = v54;
  v70[2] = 1;
  objc_msgSend(v26, "dispatchThreads:threadsPerThreadgroup:", v71, v70);

  objc_msgSend(v26, "endEncoding");
  v60 = 0;
LABEL_17:

  return v60;
}

- (float)globalLinearSystemMixFactor
{
  return self->_globalLinearSystemMixFactor;
}

- (void)setGlobalLinearSystemMixFactor:(float)a3
{
  self->_globalLinearSystemMixFactor = a3;
}

- (MTLBuffer)inputCoefficientsBuffer
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_inputCoefficientsBuffer);
}

- (void)setInputCoefficientsBuffer:(id)a3
{
  objc_storeWeak((id *)&self->_inputCoefficientsBuffer, a3);
}

- (MTLTexture)inputCoefficientsTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputCoefficientsTexture);
}

- (void)setInputCoefficientsTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputCoefficientsTexture, a3);
}

- (MTLTexture)inputWeightPlanesTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_inputWeightPlanesTexture);
}

- (void)setInputWeightPlanesTexture:(id)a3
{
  objc_storeWeak((id *)&self->_inputWeightPlanesTexture, a3);
}

- (MTLTexture)outputIntegratedCoefficientsTexture
{
  return (MTLTexture *)objc_loadWeakRetained((id *)&self->_outputIntegratedCoefficientsTexture);
}

- (void)setOutputIntegratedCoefficientsTexture:(id)a3
{
  objc_storeWeak((id *)&self->_outputIntegratedCoefficientsTexture, a3);
}

- (MTLBuffer)linearSystemStatus
{
  return (MTLBuffer *)objc_loadWeakRetained((id *)&self->_linearSystemStatus);
}

- (void)setLinearSystemStatus:(id)a3
{
  objc_storeWeak((id *)&self->_linearSystemStatus, a3);
}

- (CGRect)spotlightROI
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_spotlightROI.origin.x;
  y = self->_spotlightROI.origin.y;
  width = self->_spotlightROI.size.width;
  height = self->_spotlightROI.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSpotlightROI:(CGRect)a3
{
  self->_spotlightROI = a3;
}

- (__n128)spotlightAffineTransform
{
  return a1[10];
}

- (__n128)setSpotlightAffineTransform:(__n128)a3
{
  result[10] = a2;
  result[11] = a3;
  result[12] = a4;
  return result;
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

- (BOOL)globalSpatialExtrapolation
{
  return self->_globalSpatialExtrapolation;
}

- (void)setGlobalSpatialExtrapolation:(BOOL)a3
{
  self->_globalSpatialExtrapolation = a3;
}

- (float)maxGlobalMixFactor
{
  return self->_maxGlobalMixFactor;
}

- (void)setMaxGlobalMixFactor:(float)a3
{
  self->_maxGlobalMixFactor = a3;
}

- (float)globalSpatialExtrapolationRampFactor
{
  return self->_globalSpatialExtrapolationRampFactor;
}

- (void)setGlobalSpatialExtrapolationRampFactor:(float)a3
{
  self->_globalSpatialExtrapolationRampFactor = a3;
}

- (BOOL)useBicubicSampling
{
  return self->_useBicubicSampling;
}

- (void)setUseBicubicSampling:(BOOL)a3
{
  self->_useBicubicSampling = a3;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_destroyWeak((id *)&self->_linearSystemStatus);
  objc_destroyWeak((id *)&self->_outputIntegratedCoefficientsTexture);
  objc_destroyWeak((id *)&self->_inputWeightPlanesTexture);
  objc_destroyWeak((id *)&self->_inputCoefficientsTexture);
  objc_destroyWeak((id *)&self->_inputCoefficientsBuffer);
  for (i = 32; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end
