@implementation ARSCNCompositor

- (ARSCNCompositor)initWithView:(id)a3 mode:(int64_t)a4 algorithm:(int64_t)a5
{
  id v8;
  ARSCNCompositor *v9;
  uint64_t v10;
  ARSCNCompositor *v11;
  id v12;
  int64_t compositorAlgorithm;
  id v14;
  void *v15;
  uint64_t v16;
  ARMatteGenerator *matteGenerator;
  int64_t mode;
  uint64_t v19;
  SCNTechnique *technique;
  SCNTechnique *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float workingScaleFactor;
  void *v30;
  id v31;
  uint64_t v32;
  MTLDevice *device;
  void *v34;
  void *v35;
  uint64_t v36;
  MTLLibrary *mattingLibrary;
  SCNTechnique *v38;
  id WeakRetained;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  MTLRenderPipelineState *resampleML;
  void *v47;
  void *v48;
  uint64_t v49;
  MTLRenderPipelineState *resampleDepthML;
  NSObject *v51;
  objc_class *v52;
  void *v53;
  ARSCNCompositor *v54;
  id *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD block[4];
  ARSCNCompositor *v65;
  id v66;
  objc_super v67;
  _BYTE location[12];
  __int16 v69;
  ARSCNCompositor *v70;
  __int16 v71;
  int64_t v72;
  __int16 v73;
  int64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v67.receiver = self;
  v67.super_class = (Class)ARSCNCompositor;
  v9 = -[ARSCNCompositor init](&v67, sel_init);
  -[ARSCNCompositor setCompositorAlgorithm:](v9, "setCompositorAlgorithm:", a5);
  if (!v9)
    goto LABEL_19;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke;
  block[3] = &unk_1EA586818;
  v11 = v9;
  v65 = v11;
  v12 = v8;
  v66 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v11->_mode = a4;
  objc_msgSend(v12, "session");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "configuration");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  compositorAlgorithm = v11->_compositorAlgorithm;
  v14 = objc_alloc(MEMORY[0x1E0CF2128]);
  objc_msgSend(v12, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "initWithDevice:matteResolution:useSmoothing:", v15, 0, compositorAlgorithm == 1);
  matteGenerator = v11->_matteGenerator;
  v11->_matteGenerator = (ARMatteGenerator *)v16;

  mode = v11->_mode;
  if (mode)
  {
    if (mode != 1)
      goto LABEL_8;
    +[ARSCNCompositor mattingTechniqueDual](ARSCNCompositor, "mattingTechniqueDual");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[ARSCNCompositor mattingWithDepthAndDualTechnique](ARSCNCompositor, "mattingWithDepthAndDualTechnique");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  technique = v11->_technique;
  v11->_technique = (SCNTechnique *)v19;

  if (!v11->_mode)
  {
    v11->_disableReverseZ = objc_msgSend(v12, "usesReverseZ") ^ 1;
    v21 = v11->_technique;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNTechnique setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v22, CFSTR("disableReverseZ_sym"));

  }
LABEL_8:
  objc_msgSend(v59, "videoFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "imageResolution");
  }
  else
  {
    v26 = 1440.0;
    v25 = 1920.0;
  }
  v11->_workingResolution.width = v25 * 0.25;
  v11->_workingResolution.height = v26 * 0.25;
  objc_msgSend(v12, "currentViewport");
  -[ARSCNCompositor setCurrentSize:](v11, "setCurrentSize:", v27, v28);
  workingScaleFactor = v11->_workingScaleFactor;
  if (workingScaleFactor == 0.0)
  {
    _ARLogGeneral();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = (objc_class *)objc_opt_class();
      NSStringFromClass(v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138544130;
      *(_QWORD *)&location[4] = v53;
      v69 = 2048;
      v70 = v11;
      v71 = 2048;
      v72 = a4;
      v73 = 2048;
      v74 = a5;
      _os_log_impl(&dword_1DCC73000, v51, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: ARSCNCompositor (%li, %li) initialization failed. Matting is not set up properly.", location, 0x2Au);

    }
  }
  else
  {
    objc_initWeak((id *)location, v11);
    -[SCNTechnique passForName:](v11->_technique, "passForName:", CFSTR("ComputeCoefficientsPassDual"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v10;
    v62[1] = 3221225472;
    v62[2] = __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke_29;
    v62[3] = &unk_1EA586840;
    v56 = &v63;
    objc_copyWeak(&v63, (id *)location);
    objc_msgSend(v57, "setExecutionHandler:", v62);
    if (!v11->_mode)
    {
      -[SCNTechnique passForName:](v11->_technique, "passForName:", CFSTR("ComputeDepthStencilPass"), &v63);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v10;
      v60[1] = 3221225472;
      v60[2] = __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke_2;
      v60[3] = &unk_1EA586840;
      objc_copyWeak(&v61, (id *)location);
      objc_msgSend(v30, "setExecutionHandler:", v60);
      objc_destroyWeak(&v61);

    }
    v31 = objc_storeWeak((id *)&v11->_view, v12);
    objc_msgSend(v12, "device");
    v32 = objc_claimAutoreleasedReturnValue();
    device = v11->_device;
    v11->_device = (MTLDevice *)v32;

    ARKitUIBundle();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = -[MTLDevice newLibraryWithURL:error:](v11->_device, "newLibraryWithURL:error:", v35, 0);
    mattingLibrary = v11->_mattingLibrary;
    v11->_mattingLibrary = (MTLLibrary *)v36;

    -[SCNTechnique setLibrary:](v11->_technique, "setLibrary:", v11->_mattingLibrary);
    v38 = v11->_technique;
    WeakRetained = objc_loadWeakRetained((id *)&v11->_view);
    objc_msgSend(WeakRetained, "setTechnique:", v38);

    v40 = (void *)-[MTLLibrary newFunctionWithName:](v11->_mattingLibrary, "newFunctionWithName:", CFSTR("resample_v"));
    v41 = (void *)-[MTLLibrary newFunctionWithName:](v11->_mattingLibrary, "newFunctionWithName:", CFSTR("resample_f"));
    v42 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
    objc_msgSend(v42, "setVertexFunction:", v40);
    objc_msgSend(v42, "setFragmentFunction:", v41);
    objc_msgSend(v42, "colorAttachments");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setPixelFormat:", 10);

    v45 = -[MTLDevice newRenderPipelineStateWithDescriptor:error:](v11->_device, "newRenderPipelineStateWithDescriptor:error:", v42, 0);
    resampleML = v11->_resampleML;
    v11->_resampleML = (MTLRenderPipelineState *)v45;

    objc_msgSend(v42, "colorAttachments");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setPixelFormat:", 25);

    objc_msgSend(v42, "setFragmentFunction:", v41);
    v49 = -[MTLDevice newRenderPipelineStateWithDescriptor:error:](v11->_device, "newRenderPipelineStateWithDescriptor:error:", v42, 0);
    resampleDepthML = v11->_resampleDepthML;
    v11->_resampleDepthML = (MTLRenderPipelineState *)v49;

    objc_destroyWeak(v56);
    objc_destroyWeak((id *)location);
  }

  if (workingScaleFactor == 0.0)
  {
    v54 = 0;
    goto LABEL_21;
  }
LABEL_19:
  v54 = v9;
LABEL_21:

  return v54;
}

void __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = objc_msgSend(v2, "interfaceOrientation");

}

void __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke_29(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "executeOverlayMatteCallbackDual:", v3);

}

void __47__ARSCNCompositor_initWithView_mode_algorithm___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "executeOcclusionDepthStencilCallback:", v3);

}

- (void)dealloc
{
  ARSCNView **p_view;
  id WeakRetained;
  SCNTechnique *v5;
  SCNTechnique *technique;
  id v7;
  objc_super v8;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "technique");
  v5 = (SCNTechnique *)objc_claimAutoreleasedReturnValue();
  technique = self->_technique;

  if (v5 == technique)
  {
    v7 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v7, "setTechnique:", 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)ARSCNCompositor;
  -[ARSCNCompositor dealloc](&v8, sel_dealloc);
}

- (void)setForegroundBitMask:(unint64_t)a3
{
  self->_foregroundBitMask = a3;
}

- (void)setUncertaintyRadius:(unint64_t)a3
{
  ARMatteGenerator *matteGenerator;

  if (a3 <= 1)
    a3 = 1;
  self->_uncertaintyRadius = a3;
  matteGenerator = self->_matteGenerator;
  if (matteGenerator)
    -[ARMatteGenerator setUncertaintyRadius:](matteGenerator, "setUncertaintyRadius:");
}

- (void)setErosionRadius:(unint64_t)a3
{
  ARMatteGenerator *matteGenerator;

  self->_erodeRadius = a3;
  matteGenerator = self->_matteGenerator;
  if (matteGenerator)
    -[ARMatteGenerator setErosionRadius:](matteGenerator, "setErosionRadius:");
}

- (void)setFilterEpsilon:(double)a3
{
  self->_filterEpsilon = a3;
}

- (void)setFilterScale:(double)a3
{
  SCNTechnique *technique;
  id v4;

  self->_filterScale = a3;
  technique = self->_technique;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCNTechnique setObject:forKeyedSubscript:](technique, "setObject:forKeyedSubscript:");

}

- (void)setFilterOffset:(double)a3
{
  SCNTechnique *technique;
  id v4;

  self->_filterOffset = a3;
  technique = self->_technique;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCNTechnique setObject:forKeyedSubscript:](technique, "setObject:forKeyedSubscript:");

}

- (void)setCurrentSize:(CGSize)a3
{
  double width;
  float v5;
  double height;
  float v7;
  void *v8;
  void *v9;
  id v10;

  if (a3.width * a3.height > 0.0)
  {
    if (a3.width <= a3.height)
      width = a3.width;
    else
      width = a3.height;
    if (a3.width <= a3.height)
      a3.width = a3.height;
    self->_currentSize.width = width;
    self->_currentSize.height = a3.width;
    v5 = a3.width;
    height = self->_workingResolution.width;
    if (height <= self->_workingResolution.height)
      height = self->_workingResolution.height;
    v7 = height / v5;
    self->_workingScaleFactor = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_mode)
    {
      v10 = v8;
      -[SCNTechnique passForName:](self->_technique, "passForName:", CFSTR("ComputeDepthStencilPass"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forPassPropertyKey:", v10, 1);

      v8 = v10;
    }

  }
}

- (void)encodeAlphaResampleToCommandBuffer:(id)a3 resolution:(CGSize)a4 input:(id)a5 output:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[ARSCNCompositor orientedVerticesWithResolution:](self, "orientedVerticesWithResolution:", width, height);
  v32 = v14;
  __asm { FMOV            V0.2S, #1.0 }
  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor", 1065353216, 0, _D0, 0x3F80000000000000, v32, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "colorAttachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTexture:", v13);

  objc_msgSend(v23, "colorAttachments");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLoadAction:", 2);

  objc_msgSend(v23, "colorAttachments");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setStoreAction:", 1);

  objc_msgSend(v11, "renderCommandEncoderWithDescriptor:", v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLabel:", CFSTR("ML stencil resample"));
  objc_msgSend(v30, "setRenderPipelineState:", self->_resampleML);
  objc_msgSend(v30, "setVertexBytes:length:atIndex:", &v32, 32, 0);
  objc_msgSend(v30, "setVertexBytes:length:atIndex:", &v31, 32, 1);
  objc_msgSend(v30, "setFragmentTexture:atIndex:", v12, 0);
  objc_msgSend(v30, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v30, "endEncoding");

}

- (void)encodeDepthResampleToCommandBuffer:(id)a3 resolution:(CGSize)a4 input:(id)a5 output:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;

  height = a4.height;
  width = a4.width;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[ARSCNCompositor orientedVerticesWithResolution:](self, "orientedVerticesWithResolution:", width, height);
  v32 = v14;
  __asm { FMOV            V0.2S, #1.0 }
  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor", 1065353216, 0, _D0, 0x3F80000000000000, v32, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "colorAttachments");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTexture:", v13);

  objc_msgSend(v23, "colorAttachments");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLoadAction:", 2);

  objc_msgSend(v23, "colorAttachments");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setStoreAction:", 1);

  objc_msgSend(v11, "renderCommandEncoderWithDescriptor:", v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setLabel:", CFSTR("ML estimated depth resample"));
  objc_msgSend(v30, "setRenderPipelineState:", self->_resampleDepthML);
  objc_msgSend(v30, "setVertexBytes:length:atIndex:", &v32, 32, 0);
  objc_msgSend(v30, "setVertexBytes:length:atIndex:", &v31, 32, 1);
  objc_msgSend(v30, "setFragmentTexture:atIndex:", v12, 0);
  objc_msgSend(v30, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v30, "endEncoding");

}

- (float32x2_t)orientedVerticesWithResolution:(double)a3
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  __int128 v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v17;
  float64x2_t v19;
  float64x2_t *v20;
  CGAffineTransform v22;
  float64x2_t v23[2];
  _QWORD v24[6];
  float64x2x2_t v25;
  float64x2x2_t v26;

  v24[5] = *MEMORY[0x1E0C80C00];
  v3 = a1[25];
  v4 = a1[26];
  v5 = *((_QWORD *)a1 + 18);
  if (v5 == 3)
  {
    v5 = 4;
  }
  else
  {
    if (v5 != 4)
    {
      v6 = v3;
      v3 = v4;
      goto LABEL_7;
    }
    v5 = 3;
  }
  v6 = v4;
LABEL_7:
  memset(&v22, 0, sizeof(v22));
  ARCameraImageToViewTransform(v5, 0, &v22, a2, a3, v6, v3);
  v7 = 0;
  v23[0] = 0uLL;
  v24[0] = 0;
  v23[1] = (float64x2_t)0x3FF0000000000000uLL;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&v24[1] = _Q0;
  v24[3] = 0x3FF0000000000000;
  v13 = *(_OWORD *)&v22.c;
  v14 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22.a, 0);
  v15 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22.tx, 0);
  __asm { FMOV            V4.2D, #2.0 }
  v17 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22.b, 0);
  __asm { FMOV            V6.2D, #-1.0 }
  v19 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v22.ty, 0);
  do
  {
    v20 = &v23[v7];
    v25 = vld2q_f64(v20->f64);
    v26.val[0] = vmlaq_f64(_Q6, _Q4, vaddq_f64(v15, vmlaq_f64(vmulq_n_f64(v25.val[1], *(double *)&v13), v25.val[0], v14)));
    v26.val[1] = vmlaq_f64(_Q6, _Q4, vaddq_f64(v19, vmlaq_f64(vmulq_n_f64(v25.val[1], *((double *)&v13 + 1)), v25.val[0], v17)));
    vst2q_f64(v20->f64, v26);
    v7 += 2;
  }
  while (v7 != 4);
  return vcvt_f32_f64(v23[0]);
}

- (void)executeOverlayMatteCallbackDual:(id)a3
{
  void *v4;
  void *v5;
  ARFrame *currentFrame;
  MTLTexture *v7;
  MTLTexture *alphaTexture;
  id v9;

  v9 = a3;
  kdebug_trace();
  objc_msgSend(v9, "commandBuffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputTextureWithName:", CFSTR("alpha_target"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentFrame = self->_currentFrame;
  if (currentFrame)
  {
    -[ARMatteGenerator generateMatteFromFrame:commandBuffer:](self->_matteGenerator, "generateMatteFromFrame:commandBuffer:", currentFrame, v4);
    v7 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
    alphaTexture = self->_alphaTexture;
    self->_alphaTexture = v7;

    -[ARSCNCompositor encodeAlphaResampleToCommandBuffer:resolution:input:output:](self, "encodeAlphaResampleToCommandBuffer:resolution:input:output:", v4, self->_alphaTexture, v5, (double)(unint64_t)-[MTLTexture width](self->_alphaTexture, "width"), (double)(unint64_t)-[MTLTexture height](self->_alphaTexture, "height"));
    kdebug_trace();
  }

}

- (void)executeOcclusionDepthStencilCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  int8x16_t v11;
  void *v12;
  int8x16_t v13;
  __int128 v14;
  __int32 v15;
  __int32 v16;
  int8x16_t v17;
  __int32 v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  __int128 v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  void *v27;
  __int128 v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16_t v31;
  _OWORD v32[4];
  int8x16_t v33;
  int64x2_t v34;
  int32x4_t v35;
  int8x16_t v36;

  v4 = a3;
  objc_msgSend(v4, "commandBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputTextureWithName:", CFSTR("occluderDepthStencilDilated_target"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARMatteGenerator generateDilatedDepthFromFrame:commandBuffer:](self->_matteGenerator, "generateDilatedDepthFromFrame:commandBuffer:", self->_currentFrame, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ARSCNCompositor encodeDepthResampleToCommandBuffer:resolution:input:output:](self, "encodeDepthResampleToCommandBuffer:resolution:input:output:", v5, v7, v6, (double)(unint64_t)objc_msgSend(v7, "width"), (double)(unint64_t)objc_msgSend(v7, "height"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "pointOfView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "camera");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v10)
  {
    objc_msgSend(v10, "projectionTransform");
    v13 = v33;
    LODWORD(v14) = v34.i32[0];
    v15 = v33.i32[3];
    v16 = v34.i32[1];
    v18 = v35.i32[0];
    v17 = v36;
    v19 = vextq_s8(v36, (int8x16_t)vtrn2q_s32(v35, (int32x4_t)v36), 4uLL);
    v20 = (int8x16_t)vzip2q_s64((int64x2_t)v35, v34);
    v11 = vextq_s8(v13, v13, 8uLL);
    *(int8x8_t *)v11.i8 = vext_s8(*(int8x8_t *)v33.i8, *(int8x8_t *)v11.i8, 4uLL);
  }
  else
  {
    v17 = 0uLL;
    v11.i64[0] = 0;
    v16 = 0;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = 0;
    LODWORD(v14) = 0;
    v15 = 0;
    v13 = 0uLL;
    v19 = 0uLL;
    v20 = 0uLL;
  }
  v21 = vextq_s8(vextq_s8(v13, v13, 4uLL), v11, 0xCuLL);
  v21.i32[3] = v15;
  DWORD1(v14) = v16;
  *((_QWORD *)&v14 + 1) = v20.i64[1];
  v22 = vextq_s8(v19, v20, 8uLL);
  v22.i32[0] = v18;
  v30 = v22;
  v31 = v21;
  v28 = v14;
  v29 = vextq_s8(vextq_s8(v17, v17, 4uLL), v19, 0xCuLL);

  if (self->_disableReverseZ)
  {
    v23 = v28;
    v24 = v29;
    v26 = v30;
    v25 = v31;
  }
  else
  {
    ARMatrixPerspectiveFlipZ();
  }
  v32[0] = v25;
  v32[1] = v23;
  v32[2] = v26;
  v32[3] = v24;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSCNMatrix4:", v32, v28, *(_OWORD *)&v29, *(_OWORD *)&v30, *(_OWORD *)&v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCNTechnique setValue:forKey:](self->_technique, "setValue:forKey:", v27, CFSTR("projection_sym"));

}

+ (id)techniqueDictionaryWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v3 = a3;
  ARKitCoreBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:subdirectory:", v3, CFSTR("json"), CFSTR("Matting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)mattingWithDepthAndDualTechnique
{
  void *v2;
  void *v3;

  +[ARSCNCompositor techniqueDictionaryWithName:](ARSCNCompositor, "techniqueDictionaryWithName:", CFSTR("mattingWithDepthAndDualTechnique"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD5A30], "techniqueWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)mattingTechniqueDual
{
  void *v2;
  void *v3;

  +[ARSCNCompositor techniqueDictionaryWithName:](ARSCNCompositor, "techniqueDictionaryWithName:", CFSTR("mattingTechniqueDual"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD5A30], "techniqueWithDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)uncertaintyRadius
{
  return self->_uncertaintyRadius;
}

- (unint64_t)erosionRadius
{
  return self->_erodeRadius;
}

- (int64_t)compositorAlgorithm
{
  return self->_compositorAlgorithm;
}

- (void)setCompositorAlgorithm:(int64_t)a3
{
  self->_compositorAlgorithm = a3;
}

- (ARFrame)currentFrame
{
  return self->_currentFrame;
}

- (void)setCurrentFrame:(id)a3
{
  objc_storeStrong((id *)&self->_currentFrame, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (unint64_t)foregroundBitMask
{
  return self->_foregroundBitMask;
}

- (int64_t)currentOrientation
{
  return self->_currentOrientation;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
}

- (CGSize)currentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentSize.width;
  height = self->_currentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)showOcclusionGeometry
{
  return self->_showOcclusionGeometry;
}

- (void)setShowOcclusionGeometry:(BOOL)a3
{
  self->_showOcclusionGeometry = a3;
}

- (double)depthScale
{
  return self->_depthScale;
}

- (void)setDepthScale:(double)a3
{
  self->_depthScale = a3;
}

- (unint64_t)dilationRadius
{
  return self->_dilationRadius;
}

- (void)setDilationRadius:(unint64_t)a3
{
  self->_dilationRadius = a3;
}

- (double)filterEpsilon
{
  return self->_filterEpsilon;
}

- (double)filterScale
{
  return self->_filterScale;
}

- (double)filterOffset
{
  return self->_filterOffset;
}

- (MTLTexture)alphaTexture
{
  return self->_alphaTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaTexture, 0);
  objc_storeStrong((id *)&self->_currentFrame, 0);
  objc_storeStrong((id *)&self->_resampleDepthML, 0);
  objc_storeStrong((id *)&self->_resampleML, 0);
  objc_storeStrong((id *)&self->_mattingLibrary, 0);
  objc_storeStrong((id *)&self->_matteGenerator, 0);
  objc_storeStrong((id *)&self->_technique, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
