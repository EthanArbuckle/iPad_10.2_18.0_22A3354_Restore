@implementation _MFXTemporalScalingEffectDebug

- (_MFXTemporalScalingEffectDebug)initWithDevice:(id)a3 descriptor:(id)a4 mode:(unint64_t)a5 enableJitterViz:(BOOL)a6
{
  id v10;
  _MFXTemporalScalingEffectDebug *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t outputWidth;
  unint64_t inputWidth;
  unint64_t inputHeight;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  void *v25;
  uint64_t v26;
  MTLTexture *v27;
  uint64_t v28;
  MTLTexture *v29;
  uint64_t v30;
  MTLTexture *dilatedFlow;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  MTLComputePipelineState *dilateFlowPSO;
  uint64_t v39;
  MTLComputePipelineState *blendUnjitterCurrAndPrev;
  uint64_t v41;
  MTLComputePipelineState *unjitterCurrent;
  uint64_t v43;
  MTLComputePipelineState *copyHistoryToCurrent;
  uint64_t v45;
  MTLComputePipelineState *jitterViz;
  _MFXTemporalScalingEffectDebug *v47;
  id v49;
  id v50;
  objc_super v51;
  int v52;

  v49 = a3;
  v10 = a4;
  v51.receiver = self;
  v51.super_class = (Class)_MFXTemporalScalingEffectDebug;
  v11 = -[_MTLFXEffect init](&v51, sel_init);
  v11->_mode = a5;
  v11->_jitterVizEnabled = a6;
  *((_DWORD *)&v11->_preExposure + 1) = 1065353216;
  v52 = 0;
  findEnvVarNum<int>("MTLFX_JITTER_VIZ_DEBUG_OFFSET_X", &v52, 0, 0);
  *(_WORD *)&v11->_jitterVizOffset[3] = v52;
  v52 = 0;
  findEnvVarNum<int>("MTLFX_JITTER_VIZ_DEBUG_OFFSET_Y", &v52, 0, 0);
  *(_WORD *)&v11->_reversedDepth = v52;
  v11->_colorTextureUsage = 1;
  v11->_depthTextureUsage = 1;
  v11->_motionTextureUsage = 1;
  v11->_reactiveTextureUsage = 1;
  v11->_outputTextureUsage = 2;
  v11->_colorTextureFormat = objc_msgSend(v10, "colorTextureFormat");
  v11->_depthTextureFormat = objc_msgSend(v10, "depthTextureFormat");
  v11->_motionTextureFormat = objc_msgSend(v10, "motionTextureFormat");
  v12 = objc_msgSend(v10, "outputTextureFormat");
  v13 = 115;
  if (v12)
    v13 = v12;
  v11->_outputTextureFormat = v13;
  v14 = objc_msgSend(v10, "inputWidth");
  v11->_inputWidth = v14;
  v11->_inputContentWidth = v14;
  v15 = objc_msgSend(v10, "inputHeight");
  v11->_inputHeight = v15;
  v11->_inputContentHeight = v15;
  v11->_outputWidth = objc_msgSend(v10, "outputWidth");
  v16 = objc_msgSend(v10, "outputHeight");
  v11->_outputHeight = v16;
  outputWidth = v11->_outputWidth;
  inputWidth = v11->_inputWidth;
  inputHeight = v11->_inputHeight;
  if ((objc_msgSend(v10, "isInputContentPropertiesEnabled") & 1) != 0)
  {
    objc_msgSend(v10, "inputContentMinScale");
    v11->_inputContentMaxScale = v20;
    objc_msgSend(v10, "inputContentMaxScale");
  }
  else
  {
    v22 = (float)outputWidth / (float)inputWidth;
    v23 = (float)v16 / (float)inputHeight;
    v24 = fminf(v22, v23);
    v21 = fmaxf(v22, v23);
    v11->_inputContentMaxScale = v24;
  }
  v11->_preExposure = v21;
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, v11->_outputWidth, v11->_outputHeight, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUsage:", 3);
  objc_msgSend(v25, "setStorageMode:", 2);
  v26 = objc_msgSend(v49, "newTextureWithDescriptor:", v25);
  v27 = v11->_history[0];
  v11->_history[0] = (MTLTexture *)v26;

  v28 = objc_msgSend(v49, "newTextureWithDescriptor:", v25);
  v29 = v11->_history[1];
  v11->_history[1] = (MTLTexture *)v28;

  objc_msgSend(v25, "setPixelFormat:", 65);
  objc_msgSend(v25, "setWidth:", v11->_inputWidth);
  objc_msgSend(v25, "setHeight:", v11->_inputHeight);
  v30 = objc_msgSend(v49, "newTextureWithDescriptor:", v25);
  dilatedFlow = v11->_dilatedFlow;
  v11->_dilatedFlow = (MTLTexture *)v30;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v35 = (void *)objc_msgSend(v49, "newLibraryWithURL:error:", v34, &v50);
  v36 = v50;

  computeKernel(v35, v49, CFSTR("dilateFlow"), 0, 0, 0, 1);
  v37 = objc_claimAutoreleasedReturnValue();
  dilateFlowPSO = v11->_dilateFlowPSO;
  v11->_dilateFlowPSO = (MTLComputePipelineState *)v37;

  computeKernel(v35, v49, CFSTR("blendUnjitterCurrAndPrev"), 0, 0, 0, 1);
  v39 = objc_claimAutoreleasedReturnValue();
  blendUnjitterCurrAndPrev = v11->_blendUnjitterCurrAndPrev;
  v11->_blendUnjitterCurrAndPrev = (MTLComputePipelineState *)v39;

  computeKernel(v35, v49, CFSTR("unjitterCurr"), 0, 0, 0, 1);
  v41 = objc_claimAutoreleasedReturnValue();
  unjitterCurrent = v11->_unjitterCurrent;
  v11->_unjitterCurrent = (MTLComputePipelineState *)v41;

  computeKernel(v35, v49, CFSTR("copyHistoryToOutput"), 0, 0, 0, 1);
  v43 = objc_claimAutoreleasedReturnValue();
  copyHistoryToCurrent = v11->_copyHistoryToCurrent;
  v11->_copyHistoryToCurrent = (MTLComputePipelineState *)v43;

  computeKernel(v35, v49, CFSTR("jitterViz"), 0, 0, 0, 1);
  v45 = objc_claimAutoreleasedReturnValue();
  jitterViz = v11->_jitterViz;
  v11->_jitterViz = (MTLComputePipelineState *)v45;

  v11->_currHistoryIdx = 0;
  LOBYTE(v11->_inputContentMinScale) = 1;
  v47 = v11;

  return v47;
}

- (void)setJitterOffsetX:(float)a3
{
  *(float *)self->_jitterOffset = a3;
}

- (float)jitterOffsetX
{
  uint64_t v2;
  float result;

  v2 = *(_QWORD *)self->_jitterOffset;
  LODWORD(result) = v2;
  return result;
}

- (void)setJitterOffsetY:(float)a3
{
  *(float *)&self->_jitterOffset[4] = a3;
}

- (float)jitterOffsetY
{
  return *(float *)&self->_jitterOffset[4];
}

- (void)setMotionVectorScaleX:(float)a3
{
  *(float *)self->_motionVectorScale = a3;
}

- (float)motionVectorScaleX
{
  uint64_t v2;
  float result;

  v2 = *(_QWORD *)self->_motionVectorScale;
  LODWORD(result) = v2;
  return result;
}

- (void)setMotionVectorScaleY:(float)a3
{
  *(float *)&self->_motionVectorScale[4] = a3;
}

- (float)motionVectorScaleY
{
  return *(float *)&self->_motionVectorScale[4];
}

- (void)setReversedDepth:(BOOL)a3
{
  BYTE1(self->_inputContentMinScale) = a3;
}

- (BOOL)reversedDepth
{
  return BYTE1(self->_inputContentMinScale);
}

- (void)setJitterOffset:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  *(float32x2_t *)self->_jitterOffset = vcvt_f32_f64((float64x2_t)a3);
}

- (CGPoint)jitterOffset
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)self->_jitterOffset);
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setMotionVectorScale:(CGPoint)a3
{
  CGFloat y;

  y = a3.y;
  *(float32x2_t *)self->_motionVectorScale = vcvt_f32_f64((float64x2_t)a3);
}

- (CGPoint)motionVectorScale
{
  float64x2_t v2;
  double v3;
  CGPoint result;

  v2 = vcvtq_f64_f32(*(float32x2_t *)self->_motionVectorScale);
  v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)encodeToCommandBuffer:(id)a3
{
  unint64_t inputContentWidth;
  unint64_t inputContentHeight;
  float inputContentMaxScale;
  float preExposure;
  float outputWidth;
  float outputHeight;
  float v10;
  float v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MTLTexture *outputTexture;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int16 inputWidth;
  float32x2_t v24;
  uint64x2_t v25;
  float v26;
  unint64_t v27;
  unsigned __int16 v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unsigned int v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  int64x2_t v39;
  uint64_t v40;
  _QWORD v41[3];
  int64x2_t v42;
  uint64_t v43;
  _QWORD v44[3];
  int64x2_t v45;
  uint64_t v46;
  _QWORD v47[3];
  int64x2_t v48;
  uint64_t v49;
  _QWORD v50[3];
  char inputContentMinScale_low;
  int64x2_t v52;
  uint64_t v53;
  _QWORD v54[3];
  float v55;
  uint64_t v56;
  float32x2_t v57;
  unsigned __int16 v58;
  unsigned __int16 inputHeight;
  _BYTE v60[48];

  v38 = a3;
  -[_MTLFXEffect _beginEncode](self, "_beginEncode");
  if (MTLReportFailureTypeEnabled())
  {
    checkInputOutputTextures(self->_colorTexture, self->_depthTexture, self->_motionTexture, self->_outputTexture, self->_inputWidth, self->_inputHeight, self->_colorTextureFormat, self->_inputContentWidth, self->_inputContentHeight, self->_outputWidth, self->_outputHeight, self->_outputTextureFormat);
    inputContentWidth = self->_inputContentWidth;
    inputContentHeight = self->_inputContentHeight;
    inputContentMaxScale = self->_inputContentMaxScale;
    preExposure = self->_preExposure;
    outputWidth = (float)self->_outputWidth;
    outputHeight = (float)self->_outputHeight;
    v10 = fminf(outputWidth / (float)inputContentWidth, outputHeight / (float)inputContentHeight);
    if (v10 < inputContentMaxScale)
    {
      v35 = v10;
      v36 = inputContentMaxScale;
      MTLReportFailure();
    }
    v11 = fmaxf(outputWidth / (float)(inputContentWidth + 1), outputHeight / (float)(inputContentHeight + 1));
    if (v11 > preExposure)
    {
      v35 = v11;
      v36 = preExposure;
      MTLReportFailure();
    }
    if (-[MTLTexture storageMode](self->_outputTexture, "storageMode", *(_QWORD *)&v35, *(_QWORD *)&v36) != 2)
      MTLReportFailure();
  }
  MetalFxScopedSignpost::MetalFxScopedSignpost((MetalFxScopedSignpost *)v60, 0, (uint64_t)self, 0, 0, 0);
  if (MTLTraceEnabled())
  {
    objc_msgSend(v38, "globalTraceObjectID");
    kdebug_trace();
  }
  v12 = objc_alloc_init(MEMORY[0x24BDDD690]);
  objc_msgSend(v12, "colorAttachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLoadAction:", 2);

  objc_msgSend(v12, "colorAttachments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v12, "colorAttachments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStoreAction:", 1);

  outputTexture = self->_outputTexture;
  objc_msgSend(v12, "colorAttachments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTexture:", outputTexture);

  objc_msgSend(v38, "renderCommandEncoderWithDescriptor:", v12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "endEncoding");
  objc_msgSend(v38, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MTLFXEffect _didCreateComputeCommandEncoder:forEncode:](self, "_didCreateComputeCommandEncoder:forEncode:", v22, self->super.super._encodeID);
  if (self->_fence)
    objc_msgSend(v22, "waitForFence:");
  inputWidth = self->_inputWidth;
  inputHeight = self->_inputHeight;
  v58 = inputWidth;
  v24 = vmul_f32(*(float32x2_t *)self->_motionVectorScale, vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)&self->_outputWidth)));
  v25 = *(uint64x2_t *)&self->_inputContentWidth;
  v56 = *(_QWORD *)self->_jitterOffset;
  v57 = vdiv_f32(v24, vcvt_f32_f64(vcvtq_f64_u64(v25)));
  v26 = 1.0;
  if (!BYTE1(self->_inputContentMinScale))
    v26 = -1.0;
  v55 = v26;
  objc_msgSend(v22, "setComputePipelineState:", self->_dilateFlowPSO);
  objc_msgSend(v22, "setTexture:atIndex:", self->_depthTexture, 0);
  objc_msgSend(v22, "setTexture:atIndex:", self->_motionTexture, 1);
  objc_msgSend(v22, "setTexture:atIndex:", self->_dilatedFlow, 2);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v55, 4, 0);
  objc_msgSend(v22, "setBytes:length:atIndex:", &v58, 4, 1);
  v54[0] = v58 + 2;
  v54[1] = inputHeight + 2;
  v54[2] = 1;
  v52 = vdupq_n_s64(8uLL);
  v53 = 1;
  objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v54, &v52);
  inputContentMinScale_low = LOBYTE(self->_inputContentMinScale);
  if (self->_mode == 2)
  {
    objc_msgSend(v22, "setComputePipelineState:", self->_copyHistoryToCurrent);
    objc_msgSend(v22, "setTexture:atIndex:", self->_outputTexture, 0);
    objc_msgSend(v22, "setTexture:atIndex:", self->_history[0], 1);
    objc_msgSend(v22, "setBytes:length:atIndex:", &v56, 8, 0);
    v27 = self->_outputHeight;
    v50[0] = self->_outputWidth;
    v50[1] = v27;
    v50[2] = 1;
    v48 = vdupq_n_s64(8uLL);
    v49 = 1;
    objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v50, &v48);
    v28 = self->_outputWidth;
    inputHeight = self->_outputHeight;
    v58 = v28;
    objc_msgSend(v22, "setComputePipelineState:", self->_unjitterCurrent);
    objc_msgSend(v22, "setTexture:atIndex:", self->_colorTexture, 0);
    objc_msgSend(v22, "setTexture:atIndex:", self->_outputTexture, 1);
    objc_msgSend(v22, "setTexture:atIndex:", self->_history[0], 2);
    objc_msgSend(v22, "setBytes:length:atIndex:", &v56, 8, 0);
    objc_msgSend(v22, "setBytes:length:atIndex:", &v58, 4, 1);
    v29 = self->_inputHeight;
    v47[0] = self->_inputWidth;
    v47[1] = v29;
    v47[2] = 1;
    v45 = vdupq_n_s64(8uLL);
    v46 = 1;
    objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v47, &v45);
  }
  else
  {
    objc_msgSend(v22, "setComputePipelineState:", self->_blendUnjitterCurrAndPrev);
    objc_msgSend(v22, "setTexture:atIndex:", self->_dilatedFlow, 0);
    objc_msgSend(v22, "setTexture:atIndex:", self->_history[self->_currHistoryIdx == 0], 1);
    objc_msgSend(v22, "setTexture:atIndex:", self->_colorTexture, 2);
    objc_msgSend(v22, "setTexture:atIndex:", self->_outputTexture, 3);
    objc_msgSend(v22, "setTexture:atIndex:", self->_history[self->_currHistoryIdx], 4);
    objc_msgSend(v22, "setBytes:length:atIndex:", &v56, 8, 0);
    objc_msgSend(v22, "setBytes:length:atIndex:", &v58, 4, 1);
    objc_msgSend(v22, "setBytes:length:atIndex:", &v57, 8, 2);
    objc_msgSend(v22, "setBytes:length:atIndex:", &inputContentMinScale_low, 1, 3);
    v30 = self->_outputHeight;
    v44[0] = self->_outputWidth;
    v44[1] = v30;
    v44[2] = 1;
    v42 = vdupq_n_s64(8uLL);
    v43 = 1;
    objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v44, &v42);
  }
  if (self->_jitterVizEnabled)
  {
    objc_msgSend(v22, "setComputePipelineState:", self->_jitterViz);
    objc_msgSend(v22, "setTexture:atIndex:", self->_history[self->_currHistoryIdx == 0], 0);
    objc_msgSend(v22, "setTexture:atIndex:", self->_outputTexture, 1);
    objc_msgSend(v22, "setTexture:atIndex:", self->_history[self->_currHistoryIdx], 2);
    objc_msgSend(v22, "setBytes:length:atIndex:", &v56, 8, 0);
    objc_msgSend(v22, "setBytes:length:atIndex:", &self->_jitterVizOffset[3], 4, 1);
    objc_msgSend(v22, "setBytes:length:atIndex:", &self->_preExposure + 1, 4, 2);
    LOWORD(v31) = v58;
    *(double *)&v32 = (double)v31 * 0.2;
    LODWORD(v33) = *(double *)&v32;
    LOWORD(v32) = inputHeight;
    v34 = ((double)v32 * 0.2);
    if (v33 >= v34)
      v33 = v34;
    else
      v33 = v33;
    v41[0] = v33;
    v41[1] = v33;
    v41[2] = 1;
    v39 = vdupq_n_s64(8uLL);
    v40 = 1;
    objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v41, &v39);
  }
  if (self->_fence)
    objc_msgSend(v22, "updateFence:");
  objc_msgSend(v22, "endEncoding");

  self->_currHistoryIdx = self->_currHistoryIdx == 0;
  LOBYTE(self->_inputContentMinScale) = 0;

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)v60);
}

- (void)encodeToCommandQueue:(id)a3
{
  id v4;

  objc_msgSend(a3, "commandBuffer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MFXTemporalScalingEffectDebug encodeToCommandBuffer:](self, "encodeToCommandBuffer:");
  objc_msgSend(v4, "commit");

}

- (unint64_t)colorTextureUsage
{
  return self->_colorTextureUsage;
}

- (unint64_t)depthTextureUsage
{
  return self->_depthTextureUsage;
}

- (unint64_t)motionTextureUsage
{
  return self->_motionTextureUsage;
}

- (unint64_t)reactiveTextureUsage
{
  return self->_reactiveTextureUsage;
}

- (unint64_t)outputTextureUsage
{
  return self->_outputTextureUsage;
}

- (unint64_t)inputContentWidth
{
  return self->_inputContentWidth;
}

- (void)setInputContentWidth:(unint64_t)a3
{
  self->_inputContentWidth = a3;
}

- (unint64_t)inputContentHeight
{
  return self->_inputContentHeight;
}

- (void)setInputContentHeight:(unint64_t)a3
{
  self->_inputContentHeight = a3;
}

- (MTLTexture)colorTexture
{
  return self->_colorTexture;
}

- (void)setColorTexture:(id)a3
{
  objc_storeStrong((id *)&self->_colorTexture, a3);
}

- (MTLTexture)depthTexture
{
  return self->_depthTexture;
}

- (void)setDepthTexture:(id)a3
{
  objc_storeStrong((id *)&self->_depthTexture, a3);
}

- (MTLTexture)motionTexture
{
  return self->_motionTexture;
}

- (void)setMotionTexture:(id)a3
{
  objc_storeStrong((id *)&self->_motionTexture, a3);
}

- (MTLTexture)outputTexture
{
  return self->_outputTexture;
}

- (void)setOutputTexture:(id)a3
{
  objc_storeStrong((id *)&self->_outputTexture, a3);
}

- (BOOL)reset
{
  return LOBYTE(self->_inputContentMinScale);
}

- (void)setReset:(BOOL)a3
{
  LOBYTE(self->_inputContentMinScale) = a3;
}

- (BOOL)isDepthReversed
{
  return BYTE1(self->_inputContentMinScale);
}

- (void)setDepthReversed:(BOOL)a3
{
  BYTE1(self->_inputContentMinScale) = a3;
}

- (unint64_t)colorTextureFormat
{
  return self->_colorTextureFormat;
}

- (unint64_t)depthTextureFormat
{
  return self->_depthTextureFormat;
}

- (unint64_t)motionTextureFormat
{
  return self->_motionTextureFormat;
}

- (unint64_t)outputTextureFormat
{
  return self->_outputTextureFormat;
}

- (unint64_t)inputWidth
{
  return self->_inputWidth;
}

- (unint64_t)inputHeight
{
  return self->_inputHeight;
}

- (unint64_t)outputWidth
{
  return self->_outputWidth;
}

- (unint64_t)outputHeight
{
  return self->_outputHeight;
}

- (float)inputContentMinScale
{
  return self->_inputContentMaxScale;
}

- (float)inputContentMaxScale
{
  return self->_preExposure;
}

- (MTLFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
  objc_storeStrong((id *)&self->_fence, a3);
}

- (CGPoint)previousJitterOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousJitterOffset.x;
  y = self->_previousJitterOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousJitterOffset:(CGPoint)a3
{
  self->_previousJitterOffset = a3;
}

- (MTLTexture)exposureTexture
{
  return self->_exposureTexture;
}

- (void)setExposureTexture:(id)a3
{
  objc_storeStrong((id *)&self->_exposureTexture, a3);
}

- (float)preExposure
{
  return *(&self->_preExposure + 1);
}

- (void)setPreExposure:(float)a3
{
  *(&self->_preExposure + 1) = a3;
}

- (__n128)currentWorldToViewMatrix
{
  return a1[22];
}

- (__n128)setCurrentWorldToViewMatrix:(__n128)a3
{
  result[22] = a2;
  result[23] = a3;
  result[24] = a4;
  result[25] = a5;
  return result;
}

- (__n128)currentViewToClipMatrix
{
  return a1[26];
}

- (__n128)setCurrentViewToClipMatrix:(__n128)a3
{
  result[26] = a2;
  result[27] = a3;
  result[28] = a4;
  result[29] = a5;
  return result;
}

- (__n128)previousWorldToViewMatrix
{
  return a1[30];
}

- (__n128)setPreviousWorldToViewMatrix:(__n128)a3
{
  result[30] = a2;
  result[31] = a3;
  result[32] = a4;
  result[33] = a5;
  return result;
}

- (__n128)previousViewToClipMatrix
{
  return a1[34];
}

- (__n128)setPreviousViewToClipMatrix:(__n128)a3
{
  result[34] = a2;
  result[35] = a3;
  result[36] = a4;
  result[37] = a5;
  return result;
}

- (MTLTexture)debugTexture
{
  return self->_debugTexture;
}

- (void)setDebugTexture:(id)a3
{
  objc_storeStrong((id *)&self->_debugTexture, a3);
}

- (MTLTexture)reactiveMaskTexture
{
  return self->_reactiveMaskTexture;
}

- (void)setReactiveMaskTexture:(id)a3
{
  objc_storeStrong((id *)&self->_reactiveMaskTexture, a3);
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_reactiveMaskTexture, 0);
  objc_storeStrong((id *)&self->_debugTexture, 0);
  objc_storeStrong((id *)&self->_exposureTexture, 0);
  objc_storeStrong((id *)&self->_fence, 0);
  objc_storeStrong((id *)&self->_outputTexture, 0);
  objc_storeStrong((id *)&self->_motionTexture, 0);
  objc_storeStrong((id *)&self->_depthTexture, 0);
  objc_storeStrong((id *)&self->_colorTexture, 0);
  objc_storeStrong((id *)&self->_jitterViz, 0);
  objc_storeStrong((id *)&self->_copyHistoryToCurrent, 0);
  objc_storeStrong((id *)&self->_unjitterCurrent, 0);
  objc_storeStrong((id *)&self->_blendUnjitterCurrAndPrev, 0);
  objc_storeStrong((id *)&self->_dilateFlowPSO, 0);
  for (i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_history[i], 0);
  objc_storeStrong((id *)&self->_dilatedFlow, 0);
}

@end
