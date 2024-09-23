@implementation _MFXSpatialScalingEffectEFFECT_NAME_V1

- (_MFXSpatialScalingEffectEFFECT_NAME_V1)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v7;
  _MFXSpatialScalingEffectEFFECT_NAME_V1 *v8;
  id *p_device;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  MTLRenderPassDescriptor *mfxPassDescriptor;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int outputSRGB;
  uint64_t v22;
  uint64_t v23;
  _MFXSpatialScalingEffectEFFECT_NAME_V1 *v24;
  id v25;
  void *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  _BOOL4 use3DPipeline;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  MTLTextureDescriptor *texDesc;
  uint64_t v38;
  uint64_t v39;
  MTLTexture *mfxUpscaledTex;
  id v41;
  unint64_t intermediatePixelFormat;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  id v47;
  MTLRenderPipelineState *mfxNormPerceptPSO;
  id v49;
  unint64_t v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  MTLRenderPipelineState *mfxUpscalePSO;
  id v56;
  unint64_t v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  id v62;
  MTLRenderPipelineState *mfxSharpenPSO;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  MTLComputePipelineState *mfxUpscaleKernel;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  MTLComputePipelineState *mfxSharpenKernel;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  objc_super v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;

  v88 = a3;
  v7 = a4;
  v95.receiver = self;
  v95.super_class = (Class)_MFXSpatialScalingEffectEFFECT_NAME_V1;
  v8 = -[_MTLFXEffect init](&v95, sel_init);
  p_device = (id *)&v8->_device;
  objc_storeStrong((id *)&v8->_device, a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "pathForResource:ofType:", CFSTR("default"), CFSTR("metallib"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v85);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0;
  v87 = (void *)objc_msgSend(v88, "newLibraryWithURL:error:", v10, &v94);
  v11 = v94;

  v8->_inputLinear = 0;
  v8->_inputOutputNormalized = 1;
  v8->_colorTextureFormat = objc_msgSend(v7, "colorTextureFormat");
  v8->_outputTextureFormat = objc_msgSend(v7, "outputTextureFormat");
  v8->_inputWidth = objc_msgSend(v7, "inputWidth");
  v8->_inputHeight = objc_msgSend(v7, "inputHeight");
  v8->_outputWidth = objc_msgSend(v7, "outputWidth");
  v8->_outputHeight = objc_msgSend(v7, "outputHeight");
  v12 = objc_msgSend(v7, "colorProcessingMode");
  v8->_colorProcessingMode = v12;
  if (v12 >= 3)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v13 = objc_claimAutoreleasedReturnValue();
  mfxPassDescriptor = v8->_mfxPassDescriptor;
  v8->_mfxPassDescriptor = (MTLRenderPassDescriptor *)v13;

  -[MTLRenderPassDescriptor colorAttachments](v8->_mfxPassDescriptor, "colorAttachments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLoadAction:", 0);

  -[MTLRenderPassDescriptor colorAttachments](v8->_mfxPassDescriptor, "colorAttachments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  -[MTLRenderPassDescriptor colorAttachments](v8->_mfxPassDescriptor, "colorAttachments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStoreAction:", 1);

  objc_msgSend(v7, "colorTextureFormat");
  v99 = 0;
  v97 = 0u;
  v98 = 0u;
  v96 = 0u;
  MTLPixelFormatGetInfoForDevice();
  v8->_inputSRGB = (WORD4(v96) & 0x800) != 0;
  objc_msgSend(v7, "outputTextureFormat");
  v99 = 0;
  v97 = 0u;
  v98 = 0u;
  v96 = 0u;
  MTLPixelFormatGetInfoForDevice();
  outputSRGB = (DWORD2(v96) >> 11) & 1;
  v8->_outputSRGB = (WORD4(v96) & 0x800) != 0;
  if (v8->_inputSRGB)
  {
    v22 = objc_msgSend(v7, "colorTextureFormat");
    if (((unint64_t)(v22 - 31) > 0x32 || ((1 << (v22 - 31)) & 0x4010000000001) == 0)
      && v22 != 11)
    {
      goto LABEL_16;
    }
    outputSRGB = v8->_outputSRGB;
  }
  if (outputSRGB)
  {
    v23 = objc_msgSend(v7, "outputTextureFormat");
    if (((unint64_t)(v23 - 31) > 0x32 || ((1 << (v23 - 31)) & 0x4010000000001) == 0)
      && v23 != 11)
    {
      goto LABEL_16;
    }
  }
  if (v8->_inputSRGB != v8->_outputSRGB)
  {
    NSLog(CFSTR("%s: mixed sRGB inputs and outputs is not supported"), "-[_MFXSpatialScalingEffectEFFECT_NAME_V1 initWithDevice:descriptor:]");
LABEL_17:
    v24 = 0;
    v25 = v11;
    goto LABEL_18;
  }
  if (v8->_inputSRGB && v8->_colorProcessingMode >= 1)
  {
LABEL_16:
    MTLReportFailure();
    goto LABEL_17;
  }
  v8->_inputContentWidth = objc_msgSend(v7, "inputWidth");
  v8->_inputContentHeight = objc_msgSend(v7, "inputHeight");
  v8->_use3DPipeline = 1;
  if ((objc_msgSend(*p_device, "supportsFamily:", 1001) & 1) != 0)
  {
    v76 = CFSTR("MFX_SHARPEN_SHADER_V1_FRAG");
    v77 = CFSTR("MFX_SCALE_SHADER_V1_FRAG");
    v74 = CFSTR("MFX_Sharpen");
    v75 = CFSTR("MFX_Scale");
  }
  else
  {
    objc_msgSend(*p_device, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v27, "containsString:", CFSTR("Intel")) & 1) != 0)
    {
      v76 = CFSTR("MFX_SHARPEN_SHADER_V1_FRAG");
      v77 = CFSTR("MFX_SCALE_SHADER_V1_FRAG");
      v74 = CFSTR("MFX_Sharpen");
      v75 = CFSTR("MFX_Scale");
    }
    else
    {
      v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", CFSTR("\\s\\d{3}\\D+"), 0, 0);
      objc_msgSend(v81, "matchesInString:options:range:", v27, 0, 0, objc_msgSend(v27, "length"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "count");

      if (v29 == 1)
      {
        v8->_use3DPipeline = 0;
        v75 = CFSTR("MFX_SCALE_SHADER_V1_FP32");
        v76 = CFSTR("MFX_SHARPEN_SHADER_V1_FRAG_FP32");
        v77 = CFSTR("MFX_SCALE_SHADER_V1_FRAG_FP32");
        v30 = CFSTR("MFX_SHARPEN_SHADER_V1_FP32");
      }
      else
      {
        v75 = CFSTR("MFX_Scale");
        v76 = CFSTR("MFX_SHARPEN_SHADER_V1_FRAG");
        v77 = CFSTR("MFX_SCALE_SHADER_V1_FRAG");
        v30 = CFSTR("MFX_Sharpen");
      }
      v74 = v30;

    }
  }
  use3DPipeline = v8->_use3DPipeline;
  v8->_colorTextureUsage = 1;
  v32 = !use3DPipeline;
  v33 = 5;
  if (v32)
    v33 = 7;
  v8->_outputTextureUsage = v33;
  v8->_inputFormat = objc_msgSend(v7, "colorTextureFormat");
  v8->_outputFormat = objc_msgSend(v7, "outputTextureFormat");
  if (!v8->_outputSRGB)
  {
    v35 = objc_msgSend(v7, "outputTextureFormat");
    goto LABEL_42;
  }
  v34 = objc_msgSend(v7, "outputTextureFormat");
  if (v34 > 70)
  {
    if (v34 == 71)
    {
      v35 = 70;
      goto LABEL_42;
    }
    if (v34 == 81)
    {
      v35 = 80;
      goto LABEL_42;
    }
LABEL_39:
    v35 = 0;
    goto LABEL_42;
  }
  if (v34 == 11)
  {
    v35 = 10;
    goto LABEL_42;
  }
  if (v34 != 31)
    goto LABEL_39;
  v35 = 30;
LABEL_42:
  v8->_intermediatePixelFormat = v35;
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v35, objc_msgSend(v7, "outputWidth"), objc_msgSend(v7, "outputHeight"), 0);
  v36 = objc_claimAutoreleasedReturnValue();
  texDesc = v8->_texDesc;
  v8->_texDesc = (MTLTextureDescriptor *)v36;

  -[MTLTextureDescriptor setStorageMode:](v8->_texDesc, "setStorageMode:", 2);
  if (v8->_use3DPipeline)
    v38 = 5;
  else
    v38 = 7;
  -[MTLTextureDescriptor setUsage:](v8->_texDesc, "setUsage:", v38);
  v39 = objc_msgSend(*p_device, "newTextureWithDescriptor:", v8->_texDesc);
  mfxUpscaledTex = v8->_mfxUpscaledTex;
  v8->_mfxUpscaledTex = (MTLTexture *)v39;

  -[MTLTexture setLabel:](v8->_mfxUpscaledTex, "setLabel:", CFSTR("MetalFX_Upscaled"));
  v80 = (void *)objc_msgSend(v87, "newFunctionWithName:", CFSTR("FSQuadVertexShader"));
  v78 = (void *)objc_msgSend(v87, "newFunctionWithName:", CFSTR("MFX_NORMALIZE_SHADER_V1_FRAG"));
  v41 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  objc_msgSend(v41, "setLabel:", CFSTR("MFX_NPRenderPipelineState"));
  objc_msgSend(v41, "setRasterSampleCount:", 1);
  objc_msgSend(v41, "setVertexFunction:", v80);
  objc_msgSend(v41, "setFragmentFunction:", v78);
  intermediatePixelFormat = v8->_intermediatePixelFormat;
  objc_msgSend(v41, "colorAttachments");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPixelFormat:", intermediatePixelFormat);

  v45 = *p_device;
  v93 = v11;
  v46 = objc_msgSend(v45, "newRenderPipelineStateWithDescriptor:error:", v41, &v93);
  v47 = v93;

  mfxNormPerceptPSO = v8->_mfxNormPerceptPSO;
  v8->_mfxNormPerceptPSO = (MTLRenderPipelineState *)v46;

  v79 = (void *)objc_msgSend(v87, "newFunctionWithName:", v77);
  v49 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  objc_msgSend(v49, "setLabel:", CFSTR("MFX_ScaleRenderPipelineStateV1"));
  objc_msgSend(v49, "setRasterSampleCount:", 1);
  objc_msgSend(v49, "setVertexFunction:", v80);
  objc_msgSend(v49, "setFragmentFunction:", v79);
  v50 = v8->_intermediatePixelFormat;
  objc_msgSend(v49, "colorAttachments");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPixelFormat:", v50);

  v53 = *p_device;
  v92 = v47;
  v54 = objc_msgSend(v53, "newRenderPipelineStateWithDescriptor:error:", v49, &v92);
  v83 = v92;

  mfxUpscalePSO = v8->_mfxUpscalePSO;
  v8->_mfxUpscalePSO = (MTLRenderPipelineState *)v54;

  v82 = (void *)objc_msgSend(v87, "newFunctionWithName:", v76);
  v56 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  objc_msgSend(v56, "setLabel:", CFSTR("MFX_SharpenRenderPipelineStateV1"));
  objc_msgSend(v56, "setRasterSampleCount:", 1);
  objc_msgSend(v56, "setVertexFunction:", v80);
  objc_msgSend(v56, "setFragmentFunction:", v82);
  v57 = v8->_intermediatePixelFormat;
  objc_msgSend(v56, "colorAttachments");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setPixelFormat:", v57);

  v60 = *p_device;
  v91 = v83;
  v61 = objc_msgSend(v60, "newRenderPipelineStateWithDescriptor:error:", v56, &v91);
  v62 = v91;

  mfxSharpenPSO = v8->_mfxSharpenPSO;
  v8->_mfxSharpenPSO = (MTLRenderPipelineState *)v61;

  v64 = (void *)objc_msgSend(v87, "newFunctionWithName:", v75);
  v65 = objc_alloc_init(MEMORY[0x24BDDD550]);
  objc_msgSend(v65, "setLabel:", CFSTR("MFX_ScaleComputePipelineState"));
  objc_msgSend(v65, "setComputeFunction:", v64);
  objc_msgSend(v65, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", 1);
  v66 = *p_device;
  v90 = v62;
  v67 = objc_msgSend(v66, "newComputePipelineStateWithDescriptor:error:", v65, &v90);
  v84 = v90;

  mfxUpscaleKernel = v8->_mfxUpscaleKernel;
  v8->_mfxUpscaleKernel = (MTLComputePipelineState *)v67;

  v69 = (void *)objc_msgSend(v87, "newFunctionWithName:", v74);
  v70 = objc_alloc_init(MEMORY[0x24BDDD550]);
  objc_msgSend(v70, "setLabel:", CFSTR("MFX_SharpenComputePipelineState"));
  objc_msgSend(v70, "setComputeFunction:", v69);
  objc_msgSend(v70, "setThreadGroupSizeIsMultipleOfThreadExecutionWidth:", 1);
  v71 = *p_device;
  v89 = v84;
  v72 = objc_msgSend(v71, "newComputePipelineStateWithDescriptor:error:", v70, &v89);
  v25 = v89;

  mfxSharpenKernel = v8->_mfxSharpenKernel;
  v8->_mfxSharpenKernel = (MTLComputePipelineState *)v72;

  if (!v25
    && v8->_mfxPassDescriptor
    && v8->_mfxUpscaledTex
    && v8->_mfxUpscalePSO
    && v8->_mfxSharpenPSO
    && v8->_mfxNormPerceptPSO
    && v8->_mfxUpscaleKernel
    && v8->_mfxSharpenKernel
    && v80
    && v78
    && v79
    && v82)
  {
    -[_MTLFXSpatialScaler _emitTelemetry:forDevice:](v8, "_emitTelemetry:forDevice:", v7, *p_device);
    v24 = v8;
  }
  else
  {
    MTLReportFailure();
    v24 = 0;
  }

LABEL_18:
  return v24;
}

- (void)encodeToCommandQueue:(id)a3
{
  id v4;

  objc_msgSend(a3, "commandBuffer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_MFXSpatialScalingEffectEFFECT_NAME_V1 encodeToCommandBuffer:](self, "encodeToCommandBuffer:");
  objc_msgSend(v4, "commit");

}

- (void)encodeToCommandBuffer:(id)a3
{
  int64_t colorProcessingMode;
  int v5;
  MTLTexture *v6;
  MTLTexture *mfxNormPerceptTex;
  unint64_t inputContentWidth;
  unint64_t inputContentHeight;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  float v14;
  float v15;
  MTLTexture *inputTexture;
  uint64_t v17;
  uint64_t v18;
  MTLTexture *outputTexture;
  MTLTexture *v20;
  void *v21;
  void *v22;
  void *v23;
  MTLFence *fence;
  MTLTexture *mfxUpscaledTex;
  void *v26;
  void *v27;
  void *v28;
  MTLFence *v29;
  MTLTexture *v30;
  void *v31;
  void *v32;
  void *v33;
  MTLFence *v34;
  MTLTexture *v35;
  uint64_t v36;
  unint64_t v37;
  int64_t v38;
  MTLTexture *v39;
  MTLTexture *v40;
  id v41;
  __int128 v42;
  uint64_t v43;
  _QWORD v44[3];
  __int128 v45;
  uint64_t v46;
  _QWORD v47[3];
  int v48;
  _OWORD v49[4];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[48];

  v41 = a3;
  -[_MTLFXEffect _beginEncode](self, "_beginEncode");
  if (MTLReportFailureTypeEnabled())
  {
    checkInputOutputTextures(self->_inputTexture, 0, 0, self->_outputTexture, self->_inputWidth, self->_inputHeight, self->_colorTextureFormat, self->_inputContentWidth, self->_inputContentHeight, self->_outputWidth, self->_outputHeight, self->_outputTextureFormat);
    if (-[MTLTexture storageMode](self->_outputTexture, "storageMode") != 2)
      MTLReportFailure();
  }
  MetalFxScopedSignpost::MetalFxScopedSignpost((MetalFxScopedSignpost *)v54, 0, (uint64_t)self, 4, 0, 0);
  if (MTLTraceEnabled())
  {
    objc_msgSend(v41, "globalTraceObjectID");
    kdebug_trace();
  }
  colorProcessingMode = self->_colorProcessingMode;
  if (colorProcessingMode)
  {
    if (colorProcessingMode < 1)
    {
      v38 = self->_colorProcessingMode;
      v5 = 0;
      goto LABEL_16;
    }
  }
  else if (self->_inputOutputNormalized)
  {
    if (!self->_inputLinear)
    {
      v5 = 0;
      v38 = 0;
      goto LABEL_16;
    }
    colorProcessingMode = 1;
  }
  else
  {
    colorProcessingMode = 2;
  }
  v38 = colorProcessingMode;
  if (!self->_mfxNormPerceptTex)
  {
    -[MTLTextureDescriptor setWidth:](self->_texDesc, "setWidth:", -[MTLTexture width](self->_inputTexture, "width"));
    -[MTLTextureDescriptor setHeight:](self->_texDesc, "setHeight:", -[MTLTexture height](self->_inputTexture, "height"));
    v6 = (MTLTexture *)-[MTLDeviceSPI newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", self->_texDesc);
    mfxNormPerceptTex = self->_mfxNormPerceptTex;
    self->_mfxNormPerceptTex = v6;

    -[MTLTexture setLabel:](self->_mfxNormPerceptTex, "setLabel:", CFSTR("MetalFX_NormalizePerceptual"));
  }
  v5 = 1;
LABEL_16:
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  memset(v49, 0, sizeof(v49));
  inputContentWidth = self->_inputContentWidth;
  inputContentHeight = self->_inputContentHeight;
  v10 = -[MTLTexture width](self->_inputTexture, "width");
  v11 = -[MTLTexture height](self->_inputTexture, "height");
  v12 = -[MTLTexture width](self->_outputTexture, "width");
  v13 = -[MTLTexture height](self->_outputTexture, "height");
  v14 = 1.0 / (float)v12;
  v15 = 1.0 / (float)v13;
  *(float *)&v50 = v14 * (float)inputContentWidth;
  *((float *)&v50 + 1) = v15 * (float)inputContentHeight;
  *((float *)&v50 + 2) = (float)((float)((float)inputContentWidth * 0.5) * v14) + -0.5;
  *((float *)&v50 + 3) = (float)((float)((float)inputContentHeight * 0.5) * v15) + -0.5;
  *(float *)&v51 = 1.0 / (float)v10;
  *((float *)&v51 + 1) = 1.0 / (float)v11;
  DWORD2(v51) = v51;
  *((float *)&v51 + 3) = -*((float *)&v51 + 1);
  *(float *)&v52 = -*(float *)&v51;
  *((float *)&v52 + 1) = *((float *)&v51 + 1) + *((float *)&v51 + 1);
  *((float *)&v52 + 2) = *(float *)&v51;
  *((float *)&v52 + 3) = *((float *)&v51 + 1) + *((float *)&v51 + 1);
  *(float *)&v53 = *(float *)&v51 * 0.0;
  *((float *)&v53 + 1) = *((float *)&v51 + 1) * 4.0;
  *((_QWORD *)&v53 + 1) = 0;
  v49[0] = xmmword_23455AA00;
  v48 = 0;
  inputTexture = self->_inputTexture;
  if (!self->_inputSRGB)
  {
    v40 = inputTexture;
    goto LABEL_29;
  }
  v17 = -[MTLTexture pixelFormat](self->_inputTexture, "pixelFormat");
  if (v17 > 70)
  {
    if (v17 == 71)
    {
      v18 = 70;
      goto LABEL_28;
    }
    if (v17 == 81)
    {
      v18 = 80;
      goto LABEL_28;
    }
LABEL_27:
    v18 = 0;
    goto LABEL_28;
  }
  if (v17 == 11)
  {
    v18 = 10;
    goto LABEL_28;
  }
  if (v17 != 31)
    goto LABEL_27;
  v18 = 30;
LABEL_28:
  v40 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:](inputTexture, "newTextureViewWithPixelFormat:", v18);
LABEL_29:
  outputTexture = self->_outputTexture;
  if (self->_outputSRGB)
    v39 = (MTLTexture *)-[MTLTexture newTextureViewWithPixelFormat:](outputTexture, "newTextureViewWithPixelFormat:", self->_intermediatePixelFormat);
  else
    v39 = outputTexture;
  if (v5)
  {
    v20 = self->_mfxNormPerceptTex;
    -[MTLRenderPassDescriptor colorAttachments](self->_mfxPassDescriptor, "colorAttachments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTexture:", v20);

    objc_msgSend(v41, "renderCommandEncoderWithDescriptor:", self->_mfxPassDescriptor);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MTLFXEffect _didCreateRenderCommandEncoder:forEncode:](self, "_didCreateRenderCommandEncoder:forEncode:", v23, self->super.super._encodeID);
    fence = self->_fence;
    if (fence)
      objc_msgSend(v23, "waitForFence:beforeStages:", fence, 2);
    objc_msgSend(v23, "setLabel:", CFSTR("MetalFX_Normalize"));
    LOBYTE(v48) = v38 == 2;
    *(_WORD *)((char *)&v48 + 1) = 1;
    HIBYTE(v48) = 0;
    objc_msgSend(v23, "setFragmentBytes:length:atIndex:", &v48, 4, 0);
    objc_msgSend(v23, "setRenderPipelineState:", self->_mfxNormPerceptPSO);
    objc_msgSend(v23, "setFragmentTexture:atIndex:", v40, 0);
    objc_msgSend(v23, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
    objc_msgSend(v23, "endEncoding");

  }
  if (self->_use3DPipeline)
  {
    mfxUpscaledTex = self->_mfxUpscaledTex;
    -[MTLRenderPassDescriptor colorAttachments](self->_mfxPassDescriptor, "colorAttachments");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTexture:", mfxUpscaledTex);

    objc_msgSend(v41, "renderCommandEncoderWithDescriptor:", self->_mfxPassDescriptor);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setLabel:", CFSTR("MetalFX_Scale"));
    -[_MTLFXEffect _didCreateRenderCommandEncoder:forEncode:](self, "_didCreateRenderCommandEncoder:forEncode:", v28, self->super.super._encodeID);
    v29 = self->_fence;
    if (v29)
      objc_msgSend(v28, "waitForFence:beforeStages:", v29, 2);
    objc_msgSend(v28, "setFragmentBytes:length:atIndex:", &v50, 64, 0);
    v48 = 0;
    objc_msgSend(v28, "setFragmentBytes:length:atIndex:", &v48, 4, 1);
    objc_msgSend(v28, "setRenderPipelineState:", self->_mfxUpscalePSO);
    v30 = v40;
    if (v5)
      v30 = self->_mfxNormPerceptTex;
    objc_msgSend(v28, "setFragmentTexture:atIndex:", v30, 0);
    objc_msgSend(v28, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
    objc_msgSend(v28, "endEncoding");
    -[MTLRenderPassDescriptor colorAttachments](self->_mfxPassDescriptor, "colorAttachments");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTexture:", v39);

    objc_msgSend(v41, "renderCommandEncoderWithDescriptor:", self->_mfxPassDescriptor);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "setLabel:", CFSTR("MetalFX_Sharpen"));
    -[_MTLFXEffect _didCreateRenderCommandEncoder:forEncode:](self, "_didCreateRenderCommandEncoder:forEncode:", v33, self->super.super._encodeID);
    objc_msgSend(v33, "setFragmentBytes:length:atIndex:", v49, 64, 0);
    LOWORD(v48) = 0;
    BYTE2(v48) = v5;
    HIBYTE(v48) = v38 == 2;
    objc_msgSend(v33, "setFragmentBytes:length:atIndex:", &v48, 4, 1);
    objc_msgSend(v33, "setRenderPipelineState:", self->_mfxSharpenPSO);
    objc_msgSend(v33, "setFragmentTexture:atIndex:", self->_mfxUpscaledTex, 0);
    objc_msgSend(v33, "drawPrimitives:vertexStart:vertexCount:", 3, 0, 3);
    v34 = self->_fence;
    if (v34)
      objc_msgSend(v33, "updateFence:afterStages:", v34, 2);
    objc_msgSend(v33, "endEncoding");
  }
  else
  {
    objc_msgSend(v41, "computeCommandEncoder");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MTLFXEffect _didCreateComputeCommandEncoder:forEncode:](self, "_didCreateComputeCommandEncoder:forEncode:", v33, self->super.super._encodeID);
    objc_msgSend(v33, "setLabel:", CFSTR("MetalFX_SpatialScaleSharpen"));
    if (self->_fence)
      objc_msgSend(v33, "waitForFence:");
    objc_msgSend(v33, "setComputePipelineState:", self->_mfxUpscaleKernel);
    objc_msgSend(v33, "setBytes:length:atIndex:", &v50, 64, 0);
    v48 = 0;
    objc_msgSend(v33, "setBytes:length:atIndex:", &v48, 4, 1);
    v35 = v40;
    if (v5)
      v35 = self->_mfxNormPerceptTex;
    objc_msgSend(v33, "setTexture:atIndex:", v35, 0);
    objc_msgSend(v33, "setTexture:atIndex:", self->_mfxUpscaledTex, 1);
    v36 = -[MTLTexture width](self->_outputTexture, "width");
    v37 = (unint64_t)(-[MTLTexture height](self->_outputTexture, "height") + 15) >> 4;
    v47[0] = (unint64_t)(v36 + 15) >> 4;
    v47[1] = v37;
    v47[2] = 1;
    v45 = xmmword_23455AA10;
    v46 = 1;
    objc_msgSend(v33, "dispatchThreadgroups:threadsPerThreadgroup:", v47, &v45);
    objc_msgSend(v33, "setBytes:length:atIndex:", v49, 64, 0);
    LOWORD(v48) = 0;
    BYTE2(v48) = v5;
    HIBYTE(v48) = v38 == 2;
    objc_msgSend(v33, "setBytes:length:atIndex:", &v48, 4, 1);
    objc_msgSend(v33, "setTexture:atIndex:", self->_mfxUpscaledTex, 0);
    objc_msgSend(v33, "setTexture:atIndex:", v39, 1);
    objc_msgSend(v33, "setComputePipelineState:", self->_mfxSharpenKernel);
    v44[0] = (unint64_t)(v36 + 15) >> 4;
    v44[1] = v37;
    v44[2] = 1;
    v42 = xmmword_23455AA10;
    v43 = 1;
    objc_msgSend(v33, "dispatchThreadgroups:threadsPerThreadgroup:", v44, &v42);
    if (self->_fence)
      objc_msgSend(v33, "updateFence:");
    objc_msgSend(v33, "endEncoding");
  }

  MetalFxScopedSignpost::~MetalFxScopedSignpost((MetalFxScopedSignpost *)v54);
}

- (MTLTexture)colorTexture
{
  return self->_inputTexture;
}

- (void)setColorTexture:(id)a3
{
  objc_storeStrong((id *)&self->_inputTexture, a3);
}

- (MTLTexture)outputTexture
{
  return self->_outputTexture;
}

- (void)setOutputTexture:(id)a3
{
  objc_storeStrong((id *)&self->_outputTexture, a3);
}

- (MTLTexture)debugTexture
{
  return self->_debugTexture;
}

- (void)setDebugTexture:(id)a3
{
  objc_storeStrong((id *)&self->_debugTexture, a3);
}

- (unint64_t)colorTextureFormat
{
  return self->_colorTextureFormat;
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

- (int64_t)colorProcessingMode
{
  return self->_colorProcessingMode;
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

- (unint64_t)colorTextureUsage
{
  return self->_colorTextureUsage;
}

- (unint64_t)outputTextureUsage
{
  return self->_outputTextureUsage;
}

- (MTLFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
  objc_storeStrong((id *)&self->_fence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fence, 0);
  objc_storeStrong((id *)&self->_texDesc, 0);
  objc_storeStrong((id *)&self->_mfxUpscaledTex, 0);
  objc_storeStrong((id *)&self->_mfxNormPerceptTex, 0);
  objc_storeStrong((id *)&self->_mfxPassDescriptor, 0);
  objc_storeStrong((id *)&self->_mfxSharpenKernel, 0);
  objc_storeStrong((id *)&self->_mfxUpscaleKernel, 0);
  objc_storeStrong((id *)&self->_mfxSharpenPSO, 0);
  objc_storeStrong((id *)&self->_mfxUpscalePSO, 0);
  objc_storeStrong((id *)&self->_mfxNormPerceptPSO, 0);
  objc_storeStrong((id *)&self->_debugTexture, 0);
  objc_storeStrong((id *)&self->_outputTexture, 0);
  objc_storeStrong((id *)&self->_inputTexture, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
