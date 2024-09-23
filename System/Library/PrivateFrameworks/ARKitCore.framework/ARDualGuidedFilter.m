@implementation ARDualGuidedFilter

- (ARDualGuidedFilter)initWithDevice:(id)a3 useSmoothing:(BOOL)a4
{
  id v7;
  ARDualGuidedFilter *v8;
  ARDualGuidedFilter *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  MTLLibrary *mattingLibrary;
  BOOL v14;
  _BOOL4 v15;
  char v16;
  uint64_t v17;
  MPSImageGuidedFilter *guidedFilter;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  MTLComputePipelineState *invertPSO;
  void *v24;
  uint64_t v25;
  MTLComputePipelineState *boxblurVPSO;
  void *v27;
  uint64_t v28;
  MTLComputePipelineState *boxblurHPSO;
  void *v30;
  uint64_t v31;
  MTLComputePipelineState *erodeVPSO;
  void *v33;
  uint64_t v34;
  MTLComputePipelineState *erodeHPSO;
  void *v36;
  uint64_t v37;
  MTLComputePipelineState *smoothCoeficients;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  MTLComputePipelineState *getConfidence;
  void *v44;
  void *v45;
  uint64_t v46;
  MTLComputePipelineState *combineFGBGStencil;
  void *v49;
  objc_super v50;

  v7 = a3;
  v50.receiver = self;
  v50.super_class = (Class)ARDualGuidedFilter;
  v8 = -[ARDualGuidedFilter init](&v50, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    ARKitCoreBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[MTLDevice newLibraryWithURL:error:](v9->_device, "newLibraryWithURL:error:", v11, 0);
    mattingLibrary = v9->_mattingLibrary;
    v9->_mattingLibrary = (MTLLibrary *)v12;

    v14 = a4
       || +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.matting.useTemporalSmoothing"));
    v9->_usingSmoothing = v14;
    v9->_useSoftGuidedFilter = !+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.matting.disableSoftEdges"));
    v15 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.matting.doubleMLResolutionForIPad"));
    v9->_enableDoubleMLResolutionMatting = v15;
    if (v15)
      v16 = ARDeviceIsiPad();
    else
      v16 = 0;
    v9->_enableDoubleMLResolutionMatting = v16;
    v9->_uncertaintyRadius = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.matting.uncertaintyRadius")) << v16;
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E58]), "initWithDevice:kernelDiameter:", v9->_device, (2 * v9->_uncertaintyRadius) | 1);
    guidedFilter = v9->_guidedFilter;
    v9->_guidedFilter = (MPSImageGuidedFilter *)v17;

    +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.matting.epsilon"));
    -[MPSImageGuidedFilter setEpsilon:](v9->_guidedFilter, "setEpsilon:");
    LODWORD(v19) = 1.0;
    -[MPSImageGuidedFilter setReconstructScale:](v9->_guidedFilter, "setReconstructScale:", v19);
    LODWORD(v20) = 0;
    -[MPSImageGuidedFilter setReconstructOffset:](v9->_guidedFilter, "setReconstructOffset:", v20);
    -[MPSImageGuidedFilter setLabel:](v9->_guidedFilter, "setLabel:", CFSTR("com.apple.arkit.guidedfilter"));
    v9->_erodeRadius = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.matting.erosionRadius")) << v16;
    v21 = (void *)-[MTLLibrary newFunctionWithName:](v9->_mattingLibrary, "newFunctionWithName:", CFSTR("invert_k"));
    v22 = -[MTLDevice newComputePipelineStateWithFunction:error:](v9->_device, "newComputePipelineStateWithFunction:error:", v21, 0);
    invertPSO = v9->_invertPSO;
    v9->_invertPSO = (MTLComputePipelineState *)v22;

    v24 = (void *)-[MTLLibrary newFunctionWithName:](v9->_mattingLibrary, "newFunctionWithName:", CFSTR("boxblur_vertical_k"));
    v25 = -[MTLDevice newComputePipelineStateWithFunction:error:](v9->_device, "newComputePipelineStateWithFunction:error:", v24, 0);
    boxblurVPSO = v9->_boxblurVPSO;
    v9->_boxblurVPSO = (MTLComputePipelineState *)v25;

    v27 = (void *)-[MTLLibrary newFunctionWithName:](v9->_mattingLibrary, "newFunctionWithName:", CFSTR("boxblur_horizontal_k"));
    v28 = -[MTLDevice newComputePipelineStateWithFunction:error:](v9->_device, "newComputePipelineStateWithFunction:error:", v27, 0);
    boxblurHPSO = v9->_boxblurHPSO;
    v9->_boxblurHPSO = (MTLComputePipelineState *)v28;

    v30 = (void *)-[MTLLibrary newFunctionWithName:](v9->_mattingLibrary, "newFunctionWithName:", CFSTR("erode_binary_vertical_k"));
    v31 = -[MTLDevice newComputePipelineStateWithFunction:error:](v9->_device, "newComputePipelineStateWithFunction:error:", v30, 0);
    erodeVPSO = v9->_erodeVPSO;
    v9->_erodeVPSO = (MTLComputePipelineState *)v31;

    v33 = (void *)-[MTLLibrary newFunctionWithName:](v9->_mattingLibrary, "newFunctionWithName:", CFSTR("erode_binary_horizontal_k"));
    v34 = -[MTLDevice newComputePipelineStateWithFunction:error:](v9->_device, "newComputePipelineStateWithFunction:error:", v33, 0);
    erodeHPSO = v9->_erodeHPSO;
    v9->_erodeHPSO = (MTLComputePipelineState *)v34;

    v36 = (void *)-[MTLLibrary newFunctionWithName:](v9->_mattingLibrary, "newFunctionWithName:", CFSTR("coeficients_smooth_k"));
    v37 = -[MTLDevice newComputePipelineStateWithFunction:error:](v9->_device, "newComputePipelineStateWithFunction:error:", v36, 0);
    smoothCoeficients = v9->_smoothCoeficients;
    v9->_smoothCoeficients = (MTLComputePipelineState *)v37;

    if (v9->_useSoftGuidedFilter)
    {
      v49 = v24;
      v39 = v11;
      v40 = v7;
      v41 = (void *)-[MTLLibrary newFunctionWithName:](v9->_mattingLibrary, "newFunctionWithName:", CFSTR("confidence_k"));
      v42 = -[MTLDevice newComputePipelineStateWithFunction:error:](v9->_device, "newComputePipelineStateWithFunction:error:", v41, 0);
      getConfidence = v9->_getConfidence;
      v9->_getConfidence = (MTLComputePipelineState *)v42;

      v44 = v21;
      v45 = (void *)-[MTLLibrary newFunctionWithName:](v9->_mattingLibrary, "newFunctionWithName:", CFSTR("combineFGBG_k"));
      v46 = -[MTLDevice newComputePipelineStateWithFunction:error:](v9->_device, "newComputePipelineStateWithFunction:error:", v45, 0);
      combineFGBGStencil = v9->_combineFGBGStencil;
      v9->_combineFGBGStencil = (MTLComputePipelineState *)v46;

      v21 = v44;
      v7 = v40;
      v11 = v39;
      v24 = v49;
    }

  }
  return v9;
}

- (void)setUncertaintyRadius:(unint64_t)a3
{
  unint64_t v4;
  MPSImageGuidedFilter *v5;
  MPSImageGuidedFilter *guidedFilter;
  double v7;
  double v8;

  if (a3 <= 1)
    v4 = 1;
  else
    v4 = a3;
  self->_uncertaintyRadius = v4;
  v5 = (MPSImageGuidedFilter *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E58]), "initWithDevice:kernelDiameter:", self->_device, (2 * self->_uncertaintyRadius) | 1);
  guidedFilter = self->_guidedFilter;
  self->_guidedFilter = v5;

  +[ARKitUserDefaults floatForKey:](ARKitUserDefaults, "floatForKey:", CFSTR("com.apple.arkit.matting.epsilon"));
  -[MPSImageGuidedFilter setEpsilon:](self->_guidedFilter, "setEpsilon:");
  LODWORD(v7) = 1.0;
  -[MPSImageGuidedFilter setReconstructScale:](self->_guidedFilter, "setReconstructScale:", v7);
  LODWORD(v8) = 0;
  -[MPSImageGuidedFilter setReconstructOffset:](self->_guidedFilter, "setReconstructOffset:", v8);
  -[MPSImageGuidedFilter setLabel:](self->_guidedFilter, "setLabel:", CFSTR("com.apple.arkit.guidedfilter"));
}

- (void)setErosionRadius:(unint64_t)a3
{
  self->_erodeRadius = a3;
}

- (void)setEpsilon:(double)a3
{
  *(float *)&a3 = a3;
  -[MPSImageGuidedFilter setEpsilon:](self->_guidedFilter, "setEpsilon:", a3);
}

- (id)encodeBoxBlurToCommandBuffer:(id)a3 input:(id)a4 intermediate:(id)a5 output:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  id v17;
  id v18;
  unint64_t uncertaintyRadius;
  id v25;
  id v26;
  uint64_t i;
  uint64_t j;
  id v30;
  int64x2_t v31;
  int64x2_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _DWORD v37[2];
  float32x2_t v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v30 = v10;
  objc_msgSend(v10, "computeCommandEncoder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLabel:", CFSTR("Compute box blur"));
  v15 = objc_msgSend(v11, "width");
  v16 = objc_msgSend(v11, "height");
  v17 = v11;
  v40[0] = v17;
  v18 = v12;
  uncertaintyRadius = self->_uncertaintyRadius;
  v40[1] = v18;
  v37[0] = uncertaintyRadius;
  *(float *)&v37[1] = 1.0 / (float)((2 * uncertaintyRadius) | 1);
  __asm { FMOV            V1.2S, #1.0 }
  v38 = vdiv_f32(_D1, vcvt_f32_u32((uint32x2_t)__PAIR64__(v16, v15)));
  objc_msgSend(v14, "setComputePipelineState:", self->_boxblurVPSO);
  objc_msgSend(v14, "setTextures:withRange:", v40, 0, 2);
  objc_msgSend(v14, "setBytes:length:atIndex:", v37, 16, 0);
  v34 = ((unint64_t)v15 + 15) >> 4;
  v35 = ((unint64_t)v16 + 15) >> 4;
  v36 = 1;
  v31 = vdupq_n_s64(0x10uLL);
  v32 = v31;
  v33 = 1;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", &v34, &v32);
  v25 = v18;
  v39[0] = v25;
  v26 = v13;
  v39[1] = v26;
  objc_msgSend(v14, "setComputePipelineState:", self->_boxblurHPSO);
  objc_msgSend(v14, "setTextures:withRange:", v39, 0, 2);
  objc_msgSend(v14, "setBytes:length:atIndex:", v37, 16, 0);
  v34 = ((unint64_t)v15 + 15) >> 4;
  v35 = ((unint64_t)v16 + 15) >> 4;
  v36 = 1;
  v32 = v31;
  v33 = 1;
  objc_msgSend(v14, "dispatchThreadgroups:threadsPerThreadgroup:", &v34, &v32);
  objc_msgSend(v14, "endEncoding");
  for (i = 1; i != -1; --i)

  for (j = 1; j != -1; --j)
  return v30;
}

- (void)setupBuffersWithWidth:(unsigned int)a3 andHeight:(unsigned int)a4
{
  MTLTexture *v5;
  MTLTexture *erodeIntermediate;
  MTLTexture *v7;
  MTLTexture *overlayStencilDownsampled;
  MTLTexture *v9;
  MTLTexture *overlayStencilDownsampledBG;
  MTLTexture *v11;
  MTLTexture *confidenceMap;
  uint64_t v13;
  MTLTexture *v14;
  MTLTexture *combinedFGBG;
  MTLTexture *v16;
  MTLTexture *blurIntermediate;
  MTLTexture *v18;
  MTLTexture *overlayCoefficentsNonBlurred;
  MTLTexture *v20;
  MTLTexture *overlayCoefficentsNonBlurredBG;
  MTLTexture *v22;
  MTLTexture *smoothedCoefficientsTextureFG;
  MTLTexture *v24;
  MTLTexture *smoothedCoefficientsTextureBG;
  id v26;

  if (self->_width != a3 || self->_height != a4)
  {
    self->_width = a3;
    self->_height = a4;
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, a3, a4, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setUsage:", 3);
    objc_msgSend(v26, "setStorageMode:", 0);
    v5 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
    erodeIntermediate = self->_erodeIntermediate;
    self->_erodeIntermediate = v5;

    objc_msgSend(v26, "setUsage:", 7);
    v7 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
    overlayStencilDownsampled = self->_overlayStencilDownsampled;
    self->_overlayStencilDownsampled = v7;

    v9 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
    overlayStencilDownsampledBG = self->_overlayStencilDownsampledBG;
    self->_overlayStencilDownsampledBG = v9;

    if (self->_useSoftGuidedFilter)
    {
      v11 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
      confidenceMap = self->_confidenceMap;
      self->_confidenceMap = v11;

      v13 = objc_msgSend(v26, "pixelFormat");
      objc_msgSend(v26, "setPixelFormat:", 12);
      v14 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
      combinedFGBG = self->_combinedFGBG;
      self->_combinedFGBG = v14;

      objc_msgSend(v26, "setPixelFormat:", v13);
    }
    objc_msgSend(v26, "setUsage:", 3);
    objc_msgSend(v26, "setPixelFormat:", 115);
    v16 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
    blurIntermediate = self->_blurIntermediate;
    self->_blurIntermediate = v16;

    v18 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
    overlayCoefficentsNonBlurred = self->_overlayCoefficentsNonBlurred;
    self->_overlayCoefficentsNonBlurred = v18;

    v20 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
    overlayCoefficentsNonBlurredBG = self->_overlayCoefficentsNonBlurredBG;
    self->_overlayCoefficentsNonBlurredBG = v20;

    if (self->_usingSmoothing)
    {
      v22 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
      smoothedCoefficientsTextureFG = self->_smoothedCoefficientsTextureFG;
      self->_smoothedCoefficientsTextureFG = v22;

      v24 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v26);
      smoothedCoefficientsTextureBG = self->_smoothedCoefficientsTextureBG;
      self->_smoothedCoefficientsTextureBG = v24;

    }
  }
}

- (void)encodeDualCoefficients:(id)a3 guide:(id)a4 stencil:(id)a5 coefficientsTextureFG:(id)a6 coefficientsTextureBG:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  MTLTexture **p_overlayStencilDownsampledBG;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  MTLTexture *smoothedCoefficientsTextureFG;
  void *v37;
  void *v38;
  MTLTexture *smoothedCoefficientsTextureBG;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  int v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _DWORD v60[3];

  v12 = a3;
  v13 = a4;
  v45 = a6;
  v44 = a7;
  v14 = a5;
  -[ARDualGuidedFilter setupBuffersWithWidth:andHeight:](self, "setupBuffersWithWidth:andHeight:", objc_msgSend(v13, "width"), objc_msgSend(v13, "height"));
  v15 = v12;
  objc_msgSend(v12, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = self->_erodeRadius;
  v17 = objc_msgSend(v13, "width");
  v18 = objc_msgSend(v13, "height");
  objc_msgSend(v16, "setComputePipelineState:", self->_erodeVPSO);
  objc_msgSend(v16, "setTexture:atIndex:", v14, 0);
  objc_msgSend(v16, "setTexture:atIndex:", self->_erodeIntermediate, 1);
  objc_msgSend(v16, "setBytes:length:atIndex:", v60, 4, 0);
  v19 = -[MTLComputePipelineState threadExecutionWidth](self->_erodeVPSO, "threadExecutionWidth");
  v20 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_erodeVPSO, "maxTotalThreadsPerThreadgroup");
  v21 = v20 / -[MTLComputePipelineState threadExecutionWidth](self->_erodeVPSO, "threadExecutionWidth");
  v42 = v17;
  v41 = v17 - 1;
  v43 = v18;
  v40 = v18 - 1;
  v57 = (v41 + v19) / v19;
  v58 = (v40 + v21) / v21;
  v59 = 1;
  v54 = v19;
  v55 = v21;
  v56 = 1;
  objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", &v57, &v54);
  objc_msgSend(v16, "setComputePipelineState:", self->_erodeHPSO);
  objc_msgSend(v16, "setTexture:atIndex:", self->_erodeIntermediate, 0);
  objc_msgSend(v16, "setTexture:atIndex:", self->_overlayStencilDownsampled, 1);
  objc_msgSend(v16, "setBytes:length:atIndex:", v60, 4, 0);
  v57 = (v41 + v19) / v19;
  v58 = (v40 + v21) / v21;
  v59 = 1;
  v54 = v19;
  v55 = v21;
  v56 = 1;
  objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", &v57, &v54);
  objc_msgSend(v16, "endEncoding");
  objc_msgSend(v15, "computeCommandEncoder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setComputePipelineState:", self->_invertPSO);
  objc_msgSend(v22, "setTexture:atIndex:", v14, 0);

  p_overlayStencilDownsampledBG = &self->_overlayStencilDownsampledBG;
  objc_msgSend(v22, "setTexture:atIndex:", self->_overlayStencilDownsampledBG, 1);
  v57 = (v41 + v19) / v19;
  v58 = (v40 + v21) / v21;
  v59 = 1;
  v54 = v19;
  v55 = v21;
  v56 = 1;
  objc_msgSend(v22, "dispatchThreadgroups:threadsPerThreadgroup:", &v57, &v54);
  objc_msgSend(v22, "endEncoding");
  v46 = v15;
  objc_msgSend(v15, "computeCommandEncoder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setComputePipelineState:", self->_erodeVPSO);
  objc_msgSend(v24, "setTexture:atIndex:", self->_overlayStencilDownsampledBG, 0);
  objc_msgSend(v24, "setTexture:atIndex:", self->_erodeIntermediate, 1);
  objc_msgSend(v24, "setBytes:length:atIndex:", v60, 4, 0);
  v57 = (v41 + v19) / v19;
  v58 = (v40 + v21) / v21;
  v59 = 1;
  v54 = v19;
  v55 = v21;
  v56 = 1;
  objc_msgSend(v24, "dispatchThreadgroups:threadsPerThreadgroup:", &v57, &v54);
  objc_msgSend(v24, "setComputePipelineState:", self->_erodeHPSO);
  objc_msgSend(v24, "setTexture:atIndex:", self->_erodeIntermediate, 0);
  objc_msgSend(v24, "setTexture:atIndex:", self->_overlayStencilDownsampledBG, 1);
  objc_msgSend(v24, "setBytes:length:atIndex:", v60, 4, 0);
  v57 = (v41 + v19) / v19;
  v58 = (v40 + v21) / v21;
  v59 = 1;
  v54 = v19;
  v55 = v21;
  v56 = 1;
  objc_msgSend(v24, "dispatchThreadgroups:threadsPerThreadgroup:", &v57, &v54);
  objc_msgSend(v24, "endEncoding");
  if (self->_useSoftGuidedFilter)
  {
    objc_msgSend(v46, "computeCommandEncoder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setComputePipelineState:", self->_getConfidence);
    objc_msgSend(v25, "setTexture:atIndex:", self->_overlayStencilDownsampled, 0);
    objc_msgSend(v25, "setTexture:atIndex:", self->_overlayStencilDownsampledBG, 1);
    p_overlayStencilDownsampledBG = &self->_confidenceMap;
    objc_msgSend(v25, "setTexture:atIndex:", self->_confidenceMap, 2);
    v57 = (v41 + v19) / v19;
    v58 = (v40 + v21) / v21;
    v59 = 1;
    v54 = v19;
    v55 = v21;
    v56 = 1;
    objc_msgSend(v25, "dispatchThreadgroups:threadsPerThreadgroup:", &v57, &v54);
    objc_msgSend(v25, "setComputePipelineState:", self->_combineFGBGStencil);
    objc_msgSend(v25, "setTexture:atIndex:", self->_overlayStencilDownsampled, 0);
    objc_msgSend(v25, "setTexture:atIndex:", self->_overlayStencilDownsampledBG, 1);
    objc_msgSend(v25, "setTexture:atIndex:", self->_combinedFGBG, 2);
    v57 = (v41 + v19) / v19;
    v58 = (v40 + v21) / v21;
    v26 = v46;
    v59 = 1;
    v54 = v19;
    v55 = v21;
    v56 = 1;
    objc_msgSend(v25, "dispatchThreadgroups:threadsPerThreadgroup:", &v57, &v54);
    objc_msgSend(v25, "endEncoding");
    -[MPSImageGuidedFilter encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:](self->_guidedFilter, "encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:", v46, self->_combinedFGBG, v13, 0, self->_overlayCoefficentsNonBlurred);
    v24 = v25;
  }
  else
  {
    v26 = v46;
    -[MPSImageGuidedFilter encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:](self->_guidedFilter, "encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:", v46, self->_overlayStencilDownsampled, v13, 0, self->_overlayCoefficentsNonBlurred);
  }
  v27 = v45;
  v28 = -[ARDualGuidedFilter encodeBoxBlurToCommandBuffer:input:intermediate:output:](self, "encodeBoxBlurToCommandBuffer:input:intermediate:output:", v26, self->_overlayCoefficentsNonBlurred, self->_blurIntermediate, v45);
  -[MPSImageGuidedFilter encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:](self->_guidedFilter, "encodeRegressionToCommandBuffer:sourceTexture:guidanceTexture:weightsTexture:destinationCoefficientsTexture:", v26, *p_overlayStencilDownsampledBG, v13, 0, self->_overlayCoefficentsNonBlurred);
  v29 = v44;
  v30 = -[ARDualGuidedFilter encodeBoxBlurToCommandBuffer:input:intermediate:output:](self, "encodeBoxBlurToCommandBuffer:input:intermediate:output:", v26, self->_overlayCoefficentsNonBlurred, self->_blurIntermediate, v44);
  if (self->_usingSmoothing)
  {
    v53 = 1045220557;
    objc_msgSend(v26, "computeCommandEncoder");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setComputePipelineState:", self->_smoothCoeficients);
    objc_msgSend(v31, "setTexture:atIndex:", v45, 0);
    objc_msgSend(v31, "setTexture:atIndex:", self->_smoothedCoefficientsTextureFG, 1);
    objc_msgSend(v31, "setBytes:length:atIndex:", &v53, 4, 0);
    v32 = -[MTLComputePipelineState threadExecutionWidth](self->_erodeVPSO, "threadExecutionWidth");
    v33 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_erodeVPSO, "maxTotalThreadsPerThreadgroup");
    v34 = v33 / -[MTLComputePipelineState threadExecutionWidth](self->_erodeVPSO, "threadExecutionWidth");
    v57 = (v41 + v32) / v32;
    v58 = (v40 + v34) / v34;
    v59 = 1;
    v54 = v32;
    v55 = v34;
    v56 = 1;
    objc_msgSend(v31, "dispatchThreadgroups:threadsPerThreadgroup:", &v57, &v54);
    objc_msgSend(v31, "endEncoding");
    objc_msgSend(v46, "blitCommandEncoder");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    smoothedCoefficientsTextureFG = self->_smoothedCoefficientsTextureFG;
    memset(v52, 0, sizeof(v52));
    v51[0] = v42;
    v51[1] = v43;
    v51[2] = 1;
    memset(v50, 0, sizeof(v50));
    objc_msgSend(v35, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", smoothedCoefficientsTextureFG, 0, 0, v52, v51, v45, 0, 0, v50);
    objc_msgSend(v35, "endEncoding");
    objc_msgSend(v46, "computeCommandEncoder");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v44;
    objc_msgSend(v37, "setComputePipelineState:", self->_smoothCoeficients);
    objc_msgSend(v37, "setTexture:atIndex:", v44, 0);
    objc_msgSend(v37, "setTexture:atIndex:", self->_smoothedCoefficientsTextureBG, 1);
    objc_msgSend(v37, "setBytes:length:atIndex:", &v53, 4, 0);
    v57 = (v41 + v32) / v32;
    v58 = (v40 + v34) / v34;
    v26 = v46;
    v59 = 1;
    v54 = v32;
    v55 = v34;
    v56 = 1;
    objc_msgSend(v37, "dispatchThreadgroups:threadsPerThreadgroup:", &v57, &v54);
    objc_msgSend(v37, "endEncoding");
    objc_msgSend(v46, "blitCommandEncoder");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    smoothedCoefficientsTextureBG = self->_smoothedCoefficientsTextureBG;
    v48[2] = 1;
    memset(v49, 0, sizeof(v49));
    v48[0] = v42;
    v48[1] = v43;
    memset(v47, 0, sizeof(v47));
    objc_msgSend(v38, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", smoothedCoefficientsTextureBG, 0, 0, v49, v48, v44, 0, 0, v47);
    objc_msgSend(v38, "endEncoding");

    v27 = v45;
  }

}

- (unint64_t)uncertaintyRadius
{
  return self->_uncertaintyRadius;
}

- (unint64_t)erosionRadius
{
  return self->_erodeRadius;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedFGBG, 0);
  objc_storeStrong((id *)&self->_confidenceMap, 0);
  objc_storeStrong((id *)&self->_blurIntermediate, 0);
  objc_storeStrong((id *)&self->_erodeIntermediate, 0);
  objc_storeStrong((id *)&self->_smoothedCoefficientsTextureBG, 0);
  objc_storeStrong((id *)&self->_smoothedCoefficientsTextureFG, 0);
  objc_storeStrong((id *)&self->_overlayStencilDownsampledBG, 0);
  objc_storeStrong((id *)&self->_overlayStencilDownsampled, 0);
  objc_storeStrong((id *)&self->_overlayCoefficentsNonBlurred, 0);
  objc_storeStrong((id *)&self->_overlayCoefficentsNonBlurredBG, 0);
  objc_storeStrong((id *)&self->_combineFGBGStencil, 0);
  objc_storeStrong((id *)&self->_getConfidence, 0);
  objc_storeStrong((id *)&self->_smoothCoeficients, 0);
  objc_storeStrong((id *)&self->_invertPSO, 0);
  objc_storeStrong((id *)&self->_erodeHPSO, 0);
  objc_storeStrong((id *)&self->_erodeVPSO, 0);
  objc_storeStrong((id *)&self->_boxblurHPSO, 0);
  objc_storeStrong((id *)&self->_boxblurVPSO, 0);
  objc_storeStrong((id *)&self->_mattingLibrary, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
