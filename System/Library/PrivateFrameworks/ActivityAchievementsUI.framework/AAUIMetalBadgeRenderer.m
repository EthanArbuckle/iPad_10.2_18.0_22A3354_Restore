@implementation AAUIMetalBadgeRenderer

- (void)setStateUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (AAUIMetalBadgeRenderer)initWithCAMetalLayer:(id)a3 useEarnedShader:(BOOL)a4
{
  id v7;
  AAUIMetalBadgeRenderer *v8;
  AAUIMetalBadgeRenderer *v9;
  uint64_t v10;
  MTLDevice *device;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  float v20;
  AAUICommandQueueTransaction *v21;
  AAUICommandQueueTransaction *transaction;
  CADisplayLink *displayLink;
  objc_super v25;

  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)AAUIMetalBadgeRenderer;
  v8 = -[AAUIMetalBadgeRenderer init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_useEarnedShader = a4;
    +[AAUICommandQueueTransaction sharedDevice](AAUICommandQueueTransaction, "sharedDevice");
    v10 = objc_claimAutoreleasedReturnValue();
    device = v9->_device;
    v9->_device = (MTLDevice *)v10;

    objc_storeStrong((id *)&v9->_metalLayer, a3);
    -[CAMetalLayer setDevice:](v9->_metalLayer, "setDevice:", v9->_device);
    -[CAMetalLayer setPixelFormat:](v9->_metalLayer, "setPixelFormat:", 80);
    -[CAMetalLayer setFramebufferOnly:](v9->_metalLayer, "setFramebufferOnly:", 1);
    -[CAMetalLayer setFenceEnabled:](v9->_metalLayer, "setFenceEnabled:", 1);
    -[CAMetalLayer setPresentsWithTransaction:](v9->_metalLayer, "setPresentsWithTransaction:", 0);
    -[CAMetalLayer setDrawsAsynchronously:](v9->_metalLayer, "setDrawsAsynchronously:", 1);
    -[CAMetalLayer setOpaque:](v9->_metalLayer, "setOpaque:", 0);
    objc_msgSend((id)objc_opt_class(), "screenScaleMultiple");
    v13 = v12;
    objc_msgSend((id)objc_opt_class(), "screenScaleMaximum");
    v15 = v14;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v13 * v17;

    if (v18 >= v15)
      v19 = v15;
    else
      v19 = v18;
    v20 = v19;
    v9->_rasterScaleFactor = v20;
    v21 = objc_alloc_init(AAUICommandQueueTransaction);
    transaction = v9->_transaction;
    v9->_transaction = v21;

    -[AAUIMetalBadgeRenderer resizeBadgeForCurrentViewSize](v9, "resizeBadgeForCurrentViewSize");
    -[AAUIMetalBadgeRenderer _setupAttributes](v9, "_setupAttributes");
    -[AAUIMetalBadgeRenderer _setupTextures](v9, "_setupTextures");
    -[AAUIMetalBadgeRenderer _setupRenderPipeline](v9, "_setupRenderPipeline");
    displayLink = v9->_displayLink;
    v9->_displayLink = 0;

  }
  return v9;
}

- (void)resizeBadgeForCurrentViewSize
{
  double v3;
  double v4;
  double rasterScaleFactor;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  double v9;
  double v10;
  float v12;
  float v13;
  float v14;
  uint64_t v15;
  float32x4_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  MTLTexture *v21;
  MTLTexture *depthAttachmentMSAA;
  MTLTexture *v23;
  MTLTexture *colorAttachmentMSAA;
  MTLRenderPassDescriptor *v25;
  MTLRenderPassDescriptor *renderPassDesc;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _OWORD v31[4];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  -[CAMetalLayer bounds](self->_metalLayer, "bounds");
  rasterScaleFactor = self->_rasterScaleFactor;
  v6 = vcvtpd_u64_f64(v3 * rasterScaleFactor);
  v7 = vcvtpd_u64_f64(v4 * rasterScaleFactor);
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = v3;
    v10 = v4;
    -[CAMetalLayer setDrawableSize:](self->_metalLayer, "setDrawableSize:", (double)v6, (double)v7);
    if (*(_QWORD *)self->_attachmentRasterSize != v6
      || HIDWORD(*(_QWORD *)self->_attachmentRasterSize) != v7)
    {
      *(_QWORD *)self->_attachmentRasterSize = __PAIR64__(v7, v6);
      if (v10 == 0.0)
        v12 = 1.0;
      else
        v12 = v9 / v10;
      if (v9 == 0.0)
      {
        v14 = -25.0;
      }
      else
      {
        v13 = v10 / v9;
        v14 = v13 * -25.0;
      }
      v15 = 0;
      v16.i32[1] = 0;
      v16.i64[1] = 0;
      v16.f32[0] = 6.3138 / v12;
      *(_QWORD *)&v17 = 0;
      *((_QWORD *)&v17 + 1) = __PAIR64__(1.0, LODWORD(v14));
      v31[0] = xmmword_21CC41C50;
      v31[1] = xmmword_21CC41C60;
      v31[2] = xmmword_21CC41C90;
      v31[3] = v17;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      do
      {
        *(__int128 *)((char *)&v32 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, COERCE_FLOAT(v31[v15])), (float32x4_t)xmmword_21CC41CA0, *(float32x2_t *)&v31[v15], 1), (float32x4_t)xmmword_21CC41CB0, (float32x4_t)v31[v15], 2), (float32x4_t)xmmword_21CC41CC0, (float32x4_t)v31[v15], 3);
        ++v15;
      }
      while (v15 != 4);
      v18 = v33;
      v19 = v34;
      v20 = v35;
      *(_OWORD *)self->_anon_60 = v32;
      *(_OWORD *)&self->_anon_60[16] = v18;
      *(_OWORD *)&self->_anon_60[32] = v19;
      *(_OWORD *)&self->_anon_60[48] = v20;
      v30 = objc_alloc_init(MEMORY[0x24BDDD740]);
      objc_msgSend(v30, "setWidth:", *(_QWORD *)self->_attachmentRasterSize);
      objc_msgSend(v30, "setHeight:", *(unsigned int *)&self->_attachmentRasterSize[4]);
      objc_msgSend(v30, "setMipmapLevelCount:", 1);
      objc_msgSend(v30, "setUsage:", 4);
      objc_msgSend(v30, "setStorageMode:", 3);
      objc_msgSend(v30, "setTextureType:", 4);
      objc_msgSend(v30, "setSampleCount:", 4);
      objc_msgSend(v30, "setPixelFormat:", 252);
      v21 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v30);
      depthAttachmentMSAA = self->_depthAttachmentMSAA;
      self->_depthAttachmentMSAA = v21;

      objc_msgSend(v30, "setPixelFormat:", -[CAMetalLayer pixelFormat](self->_metalLayer, "pixelFormat"));
      v23 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v30);
      colorAttachmentMSAA = self->_colorAttachmentMSAA;
      self->_colorAttachmentMSAA = v23;

      objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
      v25 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
      renderPassDesc = self->_renderPassDesc;
      self->_renderPassDesc = v25;

      -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDesc, "colorAttachments");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setLoadAction:", 2);
      objc_msgSend(v28, "setStoreAction:", 2);
      objc_msgSend(v28, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      objc_msgSend(v28, "setTexture:", self->_colorAttachmentMSAA);
      -[MTLRenderPassDescriptor depthAttachment](self->_renderPassDesc, "depthAttachment");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setLoadAction:", 2);
      objc_msgSend(v29, "setStoreAction:", 0);
      objc_msgSend(v29, "setTexture:", self->_depthAttachmentMSAA);
      objc_msgSend(v29, "setResolveTexture:", 0);

    }
  }
}

- (void)_setupTextures
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  MTLTexture *v10;
  id v11;
  MTLTexture *fleckNormalTexture;
  uint64_t v13;
  void *v14;
  MTLTexture *v15;
  id v16;
  MTLTexture *environmentTexture;
  MTLTexture *v18;
  MTLTexture *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[2];
  uint64_t v28;
  _QWORD v29[5];

  v29[3] = *MEMORY[0x24BDAC8D0];
  if (self->_useEarnedShader)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLForResource:withExtension:", CFSTR("cubes_combined"), CFSTR("png"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLForResource:withExtension:", CFSTR("flecks"), CFSTR("png"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDDB48]), "initWithDevice:", self->_device);
    v5 = *MEMORY[0x24BDDDB08];
    v27[0] = *MEMORY[0x24BDDDB00];
    v4 = v27[0];
    v27[1] = v5;
    v6 = *MEMORY[0x24BDDDB28];
    v29[0] = MEMORY[0x24BDBD1C8];
    v29[1] = v6;
    v28 = *MEMORY[0x24BDDDB10];
    v7 = v28;
    v8 = MEMORY[0x24BDBD1C0];
    v29[2] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v27, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v10 = (MTLTexture *)objc_msgSend(v3, "newTextureWithContentsOfURL:options:error:", v20, v9, &v24);
    v11 = v24;
    fleckNormalTexture = self->_fleckNormalTexture;
    self->_fleckNormalTexture = v10;

    v13 = *MEMORY[0x24BDDDAF0];
    v25[0] = *MEMORY[0x24BDDDAF8];
    v25[1] = v4;
    v26[0] = v13;
    v26[1] = v8;
    v25[2] = v7;
    v25[3] = v5;
    v26[2] = v8;
    v26[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v11;
    v15 = (MTLTexture *)objc_msgSend(v3, "newTextureWithContentsOfURL:options:error:", v21, v14, &v23);
    v16 = v23;

    environmentTexture = self->_environmentTexture;
    self->_environmentTexture = v15;

  }
  else
  {
    v18 = self->_fleckNormalTexture;
    self->_fleckNormalTexture = 0;

    v19 = self->_environmentTexture;
    self->_environmentTexture = 0;

  }
}

- (void)_setupRenderPipeline
{
  void *v3;
  MTLDepthStencilState *v4;
  MTLDepthStencilState *depthStencilState;
  id v6;
  uint64_t v7;
  MTLDevice *device;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  MTLPixelFormat v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  MTLDevice *v47;
  MTLRenderPipelineState *v48;
  id v49;
  MTLRenderPipelineState *shaderRenderPipeline;
  MTLDevice *v51;
  MTLRenderPipelineState *v52;
  id v53;
  MTLRenderPipelineState *shaderFaceRenderPipeline;
  MTLDevice *v55;
  MTLRenderPipelineState *v56;
  id v57;
  MTLRenderPipelineState *shaderFaceInlayRenderPipeline;
  MTLDevice *v59;
  MTLRenderPipelineState *v60;
  id v61;
  MTLRenderPipelineState *shaderFaceTriColorRenderPipeline;
  MTLDevice *v63;
  MTLRenderPipelineState *v64;
  id v65;
  MTLRenderPipelineState *shaderFaceInlayTriColorsPipeline;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76[2];

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDepthCompareFunction:", 1);
  objc_msgSend(v3, "setDepthWriteEnabled:", 1);
  v71 = v3;
  v4 = (MTLDepthStencilState *)-[MTLDevice newDepthStencilStateWithDescriptor:](self->_device, "newDepthStencilStateWithDescriptor:", v3);
  depthStencilState = self->_depthStencilState;
  self->_depthStencilState = v4;

  v6 = objc_alloc_init(MEMORY[0x24BDDD6B8]);
  objc_msgSend(v6, "setLabel:", CFSTR("Metal Badge Pipeline"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = objc_claimAutoreleasedReturnValue();
  device = self->_device;
  v76[1] = 0;
  v70 = (void *)v7;
  v9 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](device, "newDefaultLibraryWithBundle:error:");
  v10 = 0;
  v11 = objc_alloc_init(MEMORY[0x24BDDD770]);
  objc_msgSend(v11, "attributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFormat:", 30);

  objc_msgSend(v11, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setOffset:", 0);

  objc_msgSend(v11, "attributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBufferIndex:", 5);

  objc_msgSend(v11, "attributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFormat:", 30);

  objc_msgSend(v11, "attributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setOffset:", 12);

  objc_msgSend(v11, "attributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBufferIndex:", 5);

  objc_msgSend(v11, "attributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFormat:", 29);

  objc_msgSend(v11, "attributes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setOffset:", 24);

  objc_msgSend(v11, "attributes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBufferIndex:", 5);

  objc_msgSend(v11, "layouts");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectAtIndexedSubscript:", 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setStride:", 32);

  objc_msgSend(v11, "layouts");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setStepRate:", 1);

  objc_msgSend(v11, "layouts");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", 5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setStepFunction:", 1);

  objc_msgSend(v6, "setVertexDescriptor:", v11);
  v36 = -[CAMetalLayer pixelFormat](self->_metalLayer, "pixelFormat");
  objc_msgSend(v6, "colorAttachments");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setPixelFormat:", v36);

  objc_msgSend(v6, "setDepthAttachmentPixelFormat:", 252);
  objc_msgSend(v6, "setRasterSampleCount:", 4);
  v69 = v9;
  if (self->_useEarnedShader)
  {
    v39 = objc_msgSend(v9, "newFunctionWithName:", CFSTR("earnedBadgeVertexShader"));
    v40 = objc_msgSend(v9, "newFunctionWithName:", CFSTR("earnedBadgeFragmentShader"));
    v41 = (void *)objc_msgSend(v9, "newFunctionWithName:", CFSTR("earnedBadgeFaceFragmentShader"));
    v42 = (void *)objc_msgSend(v9, "newFunctionWithName:", CFSTR("earnedBadgeFaceInlayFragmentShader"));
    v43 = (void *)objc_msgSend(v9, "newFunctionWithName:", CFSTR("earnedBadgeFaceTriColorFragmentShader"));
    v44 = v9;
    v45 = v40;
    v46 = (void *)objc_msgSend(v44, "newFunctionWithName:", CFSTR("earnedBadgeFaceInlayTriColorFragmentShader"));
  }
  else
  {
    v39 = objc_msgSend(v9, "newFunctionWithName:", CFSTR("unearnedBadgeVertexShader"));
    v45 = objc_msgSend(v9, "newFunctionWithName:", CFSTR("unearnedBadgeFragmentShader"));
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v46 = 0;
  }
  v68 = (void *)v39;
  objc_msgSend(v6, "setVertexFunction:", v39);
  v67 = (void *)v45;
  objc_msgSend(v6, "setFragmentFunction:", v45);
  v47 = self->_device;
  v76[0] = v10;
  v48 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v47, "newRenderPipelineStateWithDescriptor:error:", v6, v76);
  v49 = v76[0];

  shaderRenderPipeline = self->_shaderRenderPipeline;
  self->_shaderRenderPipeline = v48;

  if (v41)
  {
    objc_msgSend(v6, "setFragmentFunction:", v41);
    v51 = self->_device;
    v75 = v49;
    v52 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v51, "newRenderPipelineStateWithDescriptor:error:", v6, &v75);
    v53 = v75;

    shaderFaceRenderPipeline = self->_shaderFaceRenderPipeline;
    self->_shaderFaceRenderPipeline = v52;

    v49 = v53;
  }
  if (v42)
  {
    objc_msgSend(v6, "setFragmentFunction:", v42);
    v55 = self->_device;
    v74 = v49;
    v56 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v55, "newRenderPipelineStateWithDescriptor:error:", v6, &v74);
    v57 = v74;

    shaderFaceInlayRenderPipeline = self->_shaderFaceInlayRenderPipeline;
    self->_shaderFaceInlayRenderPipeline = v56;

    v49 = v57;
  }
  if (v43)
  {
    objc_msgSend(v6, "setFragmentFunction:", v43);
    v59 = self->_device;
    v73 = v49;
    v60 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v59, "newRenderPipelineStateWithDescriptor:error:", v6, &v73);
    v61 = v73;

    shaderFaceTriColorRenderPipeline = self->_shaderFaceTriColorRenderPipeline;
    self->_shaderFaceTriColorRenderPipeline = v60;

    v49 = v61;
  }
  if (v46)
  {
    objc_msgSend(v6, "setFragmentFunction:", v46);
    v63 = self->_device;
    v72 = v49;
    v64 = (MTLRenderPipelineState *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v63, "newRenderPipelineStateWithDescriptor:error:", v6, &v72);
    v65 = v72;

    shaderFaceInlayTriColorsPipeline = self->_shaderFaceInlayTriColorsPipeline;
    self->_shaderFaceInlayTriColorsPipeline = v64;

    v49 = v65;
  }

}

- (void)_setupAttributes
{
  float32x4_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  _OWORD v19[4];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if (self->_useEarnedShader)
  {
    *(double *)v3.i64 = _matrix4x4_rotation(-1.4137, (float32x4_t)xmmword_21CC41C50);
    v17 = v4;
    v18 = v3;
    v15 = v6;
    v16 = v5;
    *(double *)&v7 = _matrix4x4_rotation(-3.1416, (float32x4_t)xmmword_21CC41C60);
    v8 = 0;
    v19[0] = v7;
    v19[1] = v9;
    v19[2] = v10;
    v19[3] = v11;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    do
    {
      *(__int128 *)((char *)&v20 + v8 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(v19[v8])), v17, *(float32x2_t *)&v19[v8], 1), v16, (float32x4_t)v19[v8], 2), v15, (float32x4_t)v19[v8], 3);
      ++v8;
    }
    while (v8 != 4);
    v12 = v21;
    v13 = v22;
    v14 = v23;
    *(_OWORD *)self->_anon_e0 = v20;
    *(_OWORD *)&self->_anon_e0[16] = v12;
    *(_OWORD *)&self->_anon_e0[32] = v13;
    *(_OWORD *)&self->_anon_e0[48] = v14;
    *(_OWORD *)self->_cameraPosition = xmmword_21CC41C70;
  }
}

+ (double)screenScaleMultiple
{
  return 2.0;
}

+ (double)screenScaleMaximum
{
  return 4.0;
}

- (void)cleanupAfterSnapshot
{
  MTLTexture *colorTexture;
  void *v4;
  id v5;

  -[AAUIMetalBadgeRenderer _cleanupConfiguration](self, "_cleanupConfiguration");
  colorTexture = self->_colorTexture;
  self->_colorTexture = 0;

  -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDesc, "colorAttachments");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResolveTexture:", 0);

}

- (void)_loadBadgeModelWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  double width;
  double height;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGContext *CurrentContext;
  id v50;
  void *v51;
  id v52;
  MTLTexture *v53;
  NSObject *v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  id v62;
  MTLTexture *v63;
  MTLTexture *colorTexture;
  NSObject *v65;
  void *v66;
  NSArray *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  uint64_t v73;
  AAUIBadgeModel *v74;
  NSObject *v75;
  NSArray *badgeModels;
  void *v77;
  NSObject *v78;
  AAUIMetalBadgeRenderer *v79;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  id v87;
  uint8_t buf[4];
  uint64_t v89;
  _BYTE v90[128];
  _QWORD v91[2];
  _QWORD v92[4];
  CGSize v93;
  CGSize v94;
  CGRect v95;

  v92[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "badgeTexturePaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    ACHLogDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[AAUIMetalBadgeRenderer _loadBadgeModelWithConfiguration:].cold.1(v4);
    goto LABEL_50;
  }
  objc_msgSend(v4, "badgeModelPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "metalColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(__n128 *)self->_anon_130 = AAUIColorVectorFromColor(v7);

    v8 = objc_msgSend(v4, "useFullColorEnamel");
    self->_anon_130[90] = v8;
    if ((v8 & 1) == 0)
    {
      objc_msgSend(v4, "modelEnamelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(__n128 *)&self->_anon_130[16] = AAUIColorVectorFromColor(v9);

    }
    objc_msgSend(v4, "enamelTriColors");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      -[NSObject objectAtIndexedSubscript:](v10, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(__n128 *)&self->_anon_130[32] = AAUIColorVectorFromColor(v12);

      -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(__n128 *)&self->_anon_130[48] = AAUIColorVectorFromColor(v13);

      -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(__n128 *)&self->_anon_130[64] = AAUIColorVectorFromColor(v14);

    }
    if (!self->_useEarnedShader)
    {
      self->_anon_130[88] = objc_msgSend(v4, "unearnedUsesTwoToneEnamel");
      self->_anon_130[89] = v8;
      *(_DWORD *)&self->_anon_130[80] = 0;
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDDB48]), "initWithDevice:", self->_device);
    v16 = *MEMORY[0x24BDDDB10];
    v91[0] = *MEMORY[0x24BDDDB00];
    v91[1] = v16;
    v92[0] = MEMORY[0x24BDBD1C8];
    v92[1] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "badgeTexturePaths");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v19 = objc_alloc(MEMORY[0x24BEBD640]);
      objc_msgSend(v4, "badgeTexturePaths");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithContentsOfFile:", v21);

    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v4, "badgeTexturePaths");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    v78 = v11;
    if (v25 >= 2)
    {
      objc_msgSend(v4, "badgeTexturePaths");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27 >= 2)
      {
        v28 = 1;
        do
        {
          objc_msgSend(v4, "badgeTexturePaths");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectAtIndexedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithContentsOfFile:", v30);
          if (v31)
          {
            objc_msgSend(v22, "size");
            width = v93.width;
            height = v93.height;
            UIGraphicsBeginImageContext(v93);
            objc_msgSend(v22, "drawInRect:", 0.0, 0.0, width, height);
            objc_msgSend(v31, "drawInRect:blendMode:alpha:", 2, 0.0, 0.0, width, height, 1.0);
            UIGraphicsGetImageFromCurrentImageContext();
            v34 = objc_claimAutoreleasedReturnValue();

            UIGraphicsEndImageContext();
            v22 = (void *)v34;
          }

          ++v28;
          objc_msgSend(v4, "badgeTexturePaths");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "count");

        }
        while (v36 > v28);
      }
    }
    self->_anon_130[92] = objc_msgSend(v4, "faceHasMetalInlay");
    v80 = v22;
    if (v22)
    {
      objc_msgSend(v4, "glyphTexturePath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        self->_anon_130[91] = 1;
        v38 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v4, "glyphTexturePath");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "fileURLWithPath:", v39);
        v40 = v22;
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = objc_alloc(MEMORY[0x24BEBD640]);
        objc_msgSend(v41, "path");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(v42, "initWithContentsOfFile:", v43);

        objc_msgSend(v40, "size");
        v47 = v45;
        v48 = v46;
        if (v44)
        {
          UIGraphicsBeginImageContext(*(CGSize *)&v45);
          CurrentContext = UIGraphicsGetCurrentContext();
          objc_msgSend(MEMORY[0x24BEBD4B8], "blueColor");
          v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v50, "CGColor"));

          v95.origin.x = 0.0;
          v95.origin.y = 0.0;
          v95.size.width = v47;
          v95.size.height = v48;
          CGContextFillRect(CurrentContext, v95);
          objc_msgSend(v44, "drawInRect:blendMode:alpha:", 1, 0.0, 0.0, v47, v48, 1.0);
          UIGraphicsGetImageFromCurrentImageContext();
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          UIGraphicsEndImageContext();
        }
        else
        {
          ACHLogDefault();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            -[AAUIMetalBadgeRenderer _loadBadgeModelWithConfiguration:].cold.3((uint64_t)v41, v54, v55);

          v51 = 0;
        }
        v94.width = v47;
        v94.height = v48;
        UIGraphicsBeginImageContext(v94);
        objc_msgSend(v80, "drawInRect:", 0.0, 0.0, v47, v48);
        if (v51)
        {
          objc_msgSend(v4, "glyphPositionOffset");
          v57 = v56;
          v59 = v58;
          objc_msgSend(v4, "glyphTextureScale");
          objc_msgSend(v51, "drawInRect:blendMode:alpha:", 2, v57, v59, v47 * v60, v48 * v60, 1.0);
        }
        UIGraphicsGetImageFromCurrentImageContext();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        v62 = objc_retainAutorelease(v61);
        v87 = 0;
        v63 = (MTLTexture *)objc_msgSend(v15, "newTextureWithCGImage:options:error:", objc_msgSend(v62, "CGImage"), v81, &v87);
        v52 = v87;
        colorTexture = self->_colorTexture;
        self->_colorTexture = v63;

      }
      else
      {
        self->_anon_130[91] = 0;
        v86 = 0;
        v53 = (MTLTexture *)objc_msgSend(v15, "newTextureWithCGImage:options:error:", objc_msgSend(objc_retainAutorelease(v22), "CGImage"), v81, &v86);
        v52 = v86;
        v41 = self->_colorTexture;
        self->_colorTexture = v53;
      }

    }
    else
    {
      v52 = 0;
    }
    v77 = v15;
    if (!self->_colorTexture)
    {
      ACHLogDefault();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
        -[AAUIMetalBadgeRenderer _loadBadgeModelWithConfiguration:].cold.2(v4);

    }
    v79 = self;
    -[AAUIMetalBadgeRenderer _cleanupConfiguration](self, "_cleanupConfiguration");
    objc_msgSend(v4, "badgeModelPaths");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v68 = v66;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v83 != v71)
            objc_enumerationMutation(v68);
          v73 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
          v74 = -[AAUIBadgeModel initWithPath:]([AAUIBadgeModel alloc], "initWithPath:", v73);
          if (-[AAUIBadgeModel groupCount](v74, "groupCount"))
          {
            -[NSArray addObject:](v67, "addObject:", v74);
          }
          else
          {
            ACHLogUI();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v89 = v73;
              _os_log_impl(&dword_21CC08000, v75, OS_LOG_TYPE_DEFAULT, "Failed to load ‘%@’ from path", buf, 0xCu);
            }

          }
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      }
      while (v70);
    }

    badgeModels = v79->_badgeModels;
    v79->_badgeModels = v67;

    v23 = v78;
LABEL_50:

  }
}

- (void)_cleanupConfiguration
{
  NSArray *badgeModels;

  badgeModels = self->_badgeModels;
  self->_badgeModels = 0;

}

- (void)setConfiguration:(id)a3
{
  AAUIBadgeModelConfiguration *v5;
  AAUIBadgeModelConfiguration *v6;

  v5 = (AAUIBadgeModelConfiguration *)a3;
  if (self->_configuration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_configuration, a3);
    -[AAUIMetalBadgeRenderer _loadBadgeModelWithConfiguration:](self, "_loadBadgeModelWithConfiguration:", self->_configuration);
    v5 = v6;
  }

}

- (void)_drawBadgeModel:(id)a3 intoRenderEncoder:(id)a4 withBackTexture:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  size_t v10;
  id v11;
  size_t v12;
  id v13;
  uint64_t v14;
  const void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  MTLRenderPipelineState *v24;
  int v25;
  double v26;
  MTLTexture **p_colorTexture;
  MTLTexture *v28;
  MTLTexture *v29;
  void *v30;
  void *v31;
  MTLRenderPipelineState **p_shaderFaceInlayRenderPipeline;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  MTLRenderPipelineState *v38;
  MTLTexture *v39;
  MTLRenderPipelineState **p_shaderFaceInlayTriColorsPipeline;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  MTLTexture **v46;
  _OWORD v47[5];
  __int128 v48;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = 32 * (int)objc_msgSend(v8, "vertexCount");
  v11 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", v10, 0));
  memcpy((void *)objc_msgSend(v11, "contents"), (const void *)objc_msgSend(v8, "vertices"), v10);
  v12 = 4 * (int)objc_msgSend(v8, "indexCount");
  v13 = objc_retainAutorelease((id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", v12, 0));
  v14 = objc_msgSend(v13, "contents");
  v15 = (const void *)objc_msgSend(v8, "indices");
  v16 = (void *)v14;
  v17 = v13;
  memcpy(v16, v15, v12);
  if ((int)objc_msgSend(v8, "groupCount") >= 1)
  {
    v18 = 0;
    v19 = 0;
    p_shaderFaceInlayTriColorsPipeline = &self->_shaderFaceInlayTriColorsPipeline;
    v20 = 432;
    if (v5)
      v20 = 424;
    v46 = (Class *)((char *)&self->super.isa + v20);
    v44 = v17;
    v45 = v11;
    do
    {
      v21 = *(_OWORD *)&self->_anon_130[48];
      v47[2] = *(_OWORD *)&self->_anon_130[32];
      v47[3] = v21;
      v22 = *(_OWORD *)&self->_anon_130[80];
      v47[4] = *(_OWORD *)&self->_anon_130[64];
      v48 = v22;
      v23 = *(_OWORD *)&self->_anon_130[16];
      v47[0] = *(_OWORD *)self->_anon_130;
      v47[1] = v23;
      v24 = self->_shaderRenderPipeline;
      v25 = *(_DWORD *)(objc_msgSend(v8, "materials") + 4 * v18);
      if (v25)
      {
        if (v25 == 1)
        {
          LODWORD(v26) = 0;
          p_colorTexture = &self->_colorTexture;
        }
        else
        {
          LODWORD(v26) = 1.0;
          p_colorTexture = v46;
          if (v25 != 2)
          {
            -[AAUIMetalBadgeRenderer _setupCommonBindingsForRenderEncoder:pipelineState:verticesBuffer:](self, "_setupCommonBindingsForRenderEncoder:pipelineState:verticesBuffer:", v9, v24, v11, v26);
LABEL_13:
            v28 = 0;
            LODWORD(v48) = 0;
            goto LABEL_27;
          }
        }
        LODWORD(v48) = LODWORD(v26);
        DWORD1(v48) = LODWORD(v26);
        v28 = *p_colorTexture;
      }
      else
      {
        *(_QWORD *)&v48 = 1065353216;
        v29 = self->_colorTexture;
        v28 = v29;
        if (self->_useEarnedShader && v29)
        {
          -[AAUIMetalBadgeRenderer configuration](self, "configuration");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v30, "faceHasMetalInlay") & 1) != 0)
          {
            -[AAUIMetalBadgeRenderer configuration](self, "configuration");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "enamelTriColors");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v31, "count");

            p_shaderFaceInlayRenderPipeline = p_shaderFaceInlayTriColorsPipeline;
            if (!v41)
              goto LABEL_20;
          }
          else
          {

LABEL_20:
            -[AAUIMetalBadgeRenderer configuration](self, "configuration", p_shaderFaceInlayTriColorsPipeline);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "faceHasMetalInlay");

            p_shaderFaceInlayRenderPipeline = &self->_shaderFaceInlayRenderPipeline;
            if ((v34 & 1) == 0)
            {
              -[AAUIMetalBadgeRenderer configuration](self, "configuration");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "enamelTriColors");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v36, "count");

              v37 = 80;
              if (!v43)
                v37 = 56;
              p_shaderFaceInlayRenderPipeline = (Class *)((char *)&self->super.isa + v37);
            }
          }
          v38 = *p_shaderFaceInlayRenderPipeline;

          v39 = self->_fleckNormalTexture;
          v11 = v45;
          -[AAUIMetalBadgeRenderer _setupCommonBindingsForRenderEncoder:pipelineState:verticesBuffer:](self, "_setupCommonBindingsForRenderEncoder:pipelineState:verticesBuffer:", v9, v38, v45);
          objc_msgSend(v9, "setFragmentTexture:atIndex:", v28, 1);
          if (v39)
          {
            objc_msgSend(v9, "setFragmentTexture:atIndex:", v39, 2);

          }
          v24 = v38;
          v17 = v44;
          goto LABEL_27;
        }
      }
      -[AAUIMetalBadgeRenderer _setupCommonBindingsForRenderEncoder:pipelineState:verticesBuffer:](self, "_setupCommonBindingsForRenderEncoder:pipelineState:verticesBuffer:", v9, v24, v11, p_shaderFaceInlayTriColorsPipeline);
      if (!v28)
        goto LABEL_13;
      objc_msgSend(v9, "setFragmentTexture:atIndex:", v28, 1);
LABEL_27:
      objc_msgSend(v9, "setFragmentBytes:length:atIndex:", v47, 96, 4, p_shaderFaceInlayTriColorsPipeline);
      objc_msgSend(v9, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, 3 * *(int *)(objc_msgSend(v8, "groups") + 4 * v18), 1, v17, 4 * v19);
      v19 += 3 * *(_DWORD *)(objc_msgSend(v8, "groups") + 4 * v18);

      ++v18;
    }
    while (v18 < (int)objc_msgSend(v8, "groupCount"));
  }

}

- (void)_setupCommonBindingsForRenderEncoder:(id)a3 pipelineState:(id)a4 verticesBuffer:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  objc_msgSend(v9, "setRenderPipelineState:", a4);
  objc_msgSend(v9, "setDepthStencilState:", self->_depthStencilState);
  objc_msgSend(v9, "setCullMode:", 1);
  objc_msgSend(v9, "setVertexBuffer:offset:atIndex:", v8, 0, 5);

  objc_msgSend(v9, "setVertexBytes:length:atIndex:", self->_anon_60, 64, 0);
  objc_msgSend(v9, "setVertexBytes:length:atIndex:", self->_anon_a0, 64, 1);
  if (self->_useEarnedShader)
  {
    objc_msgSend(v9, "setVertexBytes:length:atIndex:", self->_anon_e0, 64, 2);
    objc_msgSend(v9, "setVertexBytes:length:atIndex:", self->_cameraPosition, 16, 3);
    objc_msgSend(v9, "setFragmentTexture:atIndex:", self->_environmentTexture, 0);
  }

}

- (id)snapshot
{
  uint64_t v2;
  size_t v3;
  size_t v4;
  BOOL v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  size_t v12;
  void *v13;
  CGColorSpace *DeviceRGB;
  CGDataProvider *v15;
  CGImageRef v16;
  CGImage *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[6];

  v2 = *(_QWORD *)self->_attachmentRasterSize;
  v3 = v2;
  v4 = HIDWORD(v2);
  if ((_DWORD)v2)
    v5 = HIDWORD(v2) == 0;
  else
    v5 = 1;
  if (v5)
    return 0;
  v8 = objc_alloc_init(MEMORY[0x24BDDD740]);
  objc_msgSend(v8, "setTextureType:", 2);
  objc_msgSend(v8, "setPixelFormat:", 80);
  objc_msgSend(v8, "setWidth:", v3);
  objc_msgSend(v8, "setHeight:", v4);
  objc_msgSend(v8, "setMipmapLevelCount:", 1);
  objc_msgSend(v8, "setUsage:", 4);
  objc_msgSend(v8, "setStorageMode:", 0);
  v9 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v8);
  -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDesc, "colorAttachments");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setResolveTexture:", v9);

  -[AAUIMetalBadgeRenderer _drawFrameWithDrawable:](self, "_drawFrameWithDrawable:", 0);
  v12 = 4 * v3;
  v13 = malloc_type_malloc(v12 * v4, 0x92439D30uLL);
  memset(v24, 0, 24);
  v24[3] = v3;
  v24[4] = v4;
  v24[5] = 1;
  objc_msgSend(v9, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v13, v12, v24, 0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v15 = CGDataProviderCreateWithData(0, v13, v12 * v4, (CGDataProviderReleaseDataCallback)freeData);
  v16 = CGImageCreate(v3, v4, 8uLL, 0x20uLL, v12, DeviceRGB, 0x2002u, v15, 0, 0, kCGRenderingIntentDefault);
  if (v16)
  {
    v17 = v16;
    v18 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v17, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    CGImageRelease(v17);
  }
  else
  {
    ACHLogDefault();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[AAUIMetalBadgeRenderer snapshot].cold.1(v21, v22, v23);

    v20 = 0;
  }
  CGDataProviderRelease(v15);
  CGColorSpaceRelease(DeviceRGB);

  return v20;
}

- (void)_drawFrameWithDrawable:(id)a3
{
  id v4;
  void (**v5)(void);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  -[AAUIMetalBadgeRenderer stateUpdateBlock](self, "stateUpdateBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIMetalBadgeRenderer _updateModelTransformForBadge:](self, "_updateModelTransformForBadge:", v6);
  -[AAUICommandQueueTransaction commandQueue](self->_transaction, "commandQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commandBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLabel:", CFSTR("Activity Badge Command Buffer"));
  objc_msgSend(v8, "renderCommandEncoderWithDescriptor:", self->_renderPassDesc);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLabel:", CFSTR("Activity Badge Render Encoder"));
  -[AAUIMetalBadgeRenderer _drawIntoRenderEncoder:](self, "_drawIntoRenderEncoder:", v9);
  objc_msgSend(v9, "endEncoding");
  if (v4)
  {
    objc_msgSend(v8, "presentDrawable:", v4);
    objc_msgSend(v8, "commit");
  }
  else
  {
    objc_msgSend(v8, "commit");
    objc_msgSend(v8, "waitUntilCompleted");
  }
  objc_msgSend(v8, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    ACHLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AAUIMetalBadgeRenderer _drawFrameWithDrawable:].cold.1(v8, v11);

  }
}

- (id)stateUpdateBlock
{
  return self->_stateUpdateBlock;
}

- (void)_updateModelTransformForBadge:(id)a3
{
  uint64_t v4;
  double v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  uint64_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;

  v37 = a3;
  v4 = 0;
  v40 = xmmword_21CC41C90;
  v41 = xmmword_21CC41CD0;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v38 = xmmword_21CC41C50;
  v39 = xmmword_21CC41C60;
  do
  {
    *(float32x4_t *)((char *)&v42 + v4) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_21CC41CE0, COERCE_FLOAT(*(__int128 *)((char *)&v38 + v4))), (float32x4_t)xmmword_21CC41CF0, *(float32x2_t *)((char *)&v38 + v4), 1), (float32x4_t)xmmword_21CC41D00, *(float32x4_t *)((char *)&v38 + v4), 2), (float32x4_t)xmmword_21CC41C80, *(float32x4_t *)((char *)&v38 + v4), 3);
    v4 += 16;
  }
  while (v4 != 64);
  v35 = v43;
  v36 = v42;
  v33 = v45;
  v34 = v44;
  objc_msgSend(v37, "rotationY");
  *(float *)&v5 = v5;
  *(double *)&v6 = _matrix4x4_rotation(*(float *)&v5, (float32x4_t)xmmword_21CC41C60);
  v31 = v7;
  v32 = v6;
  v29 = v9;
  v30 = v8;
  objc_msgSend(v37, "rotationX");
  *(float *)&v10 = v10;
  *(double *)&v11 = _matrix4x4_rotation(*(float *)&v10, (float32x4_t)xmmword_21CC41C50);
  v15 = 0;
  v38 = v32;
  v39 = v31;
  v40 = v30;
  v41 = v29;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v42 + v15) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v36, COERCE_FLOAT(*(__int128 *)((char *)&v38 + v15))), v35, *(float32x2_t *)((char *)&v38 + v15), 1), v34, *(float32x4_t *)((char *)&v38 + v15), 2), v33, *(float32x4_t *)((char *)&v38 + v15), 3);
    v15 += 16;
  }
  while (v15 != 64);
  v16 = 0;
  v17 = v42;
  v18 = v43;
  v19 = v44;
  v20 = v45;
  v38 = v11;
  v39 = v12;
  v40 = v13;
  v41 = v14;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v42 + v16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(__int128 *)((char *)&v38 + v16))), v18, *(float32x2_t *)((char *)&v38 + v16), 1), v19, *(float32x4_t *)((char *)&v38 + v16), 2), v20, *(float32x4_t *)((char *)&v38 + v16), 3);
    v16 += 16;
  }
  while (v16 != 64);
  v21 = 0;
  v22 = v42;
  v23 = v43;
  v24 = v44;
  v25 = v45;
  v38 = xmmword_21CC41C50;
  v39 = xmmword_21CC41C60;
  v40 = xmmword_21CC41C90;
  v41 = xmmword_21CC41D10;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v42 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(*(__int128 *)((char *)&v38 + v21))), v23, *(float32x2_t *)((char *)&v38 + v21), 1), v24, *(float32x4_t *)((char *)&v38 + v21), 2), v25, *(float32x4_t *)((char *)&v38 + v21), 3);
    v21 += 16;
  }
  while (v21 != 64);
  v26 = v43;
  v27 = v44;
  v28 = v45;
  *(float32x4_t *)self->_anon_a0 = v42;
  *(float32x4_t *)&self->_anon_a0[16] = v26;
  *(float32x4_t *)&self->_anon_a0[32] = v27;
  *(float32x4_t *)&self->_anon_a0[48] = v28;

}

- (void)_drawIntoRenderEncoder:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_badgeModels;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[AAUIMetalBadgeRenderer _drawBadgeModel:intoRenderEncoder:withBackTexture:](self, "_drawBadgeModel:intoRenderEncoder:withBackTexture:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10), v4, v9 & 1, (_QWORD)v11);
        v9 = 0;
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
    }
    while (v7);
  }

}

- (BOOL)isPaused
{
  return self->_displayLink == 0;
}

- (void)setPaused:(BOOL)a3
{
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  CADisplayLink *v6;
  CADisplayLink *v7;
  CADisplayLink *v8;
  void *v9;
  id v10;

  displayLink = self->_displayLink;
  if (a3)
  {
    -[CADisplayLink setPaused:](displayLink, "setPaused:", 1);
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    v5 = self->_displayLink;
    self->_displayLink = 0;

  }
  else if (!displayLink)
  {
    v10 = -[AAUIMetalBadgeRendererDisplayLinkTarget _initWithTarget:]([AAUIMetalBadgeRendererDisplayLinkTarget alloc], "_initWithTarget:", self);
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", v10, sel__drawBadgeFrameCallback);
    v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    v7 = self->_displayLink;
    self->_displayLink = v6;

    v8 = self->_displayLink;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x24BDBCB80]);

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 60);
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0);

  }
}

- (void)dealloc
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;
  AAUICommandQueueTransaction *transaction;
  objc_super v6;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
  -[AAUIMetalBadgeRenderer _cleanupConfiguration](self, "_cleanupConfiguration");
  transaction = self->_transaction;
  self->_transaction = 0;

  v6.receiver = self;
  v6.super_class = (Class)AAUIMetalBadgeRenderer;
  -[AAUIMetalBadgeRenderer dealloc](&v6, sel_dealloc);
}

- (void)setBackTextureImage:(id)a3
{
  UIImage *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CGImage *v10;
  MTLTexture *v11;
  id v12;
  MTLTexture *backTexture;
  CGContext *CurrentContext;
  double v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  MTLTexture *v19;
  id v20;
  MTLTexture *emptyBackTexture;
  MTLTexture *v22;
  id v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[4];
  CGSize v27;
  CGRect v28;

  v26[3] = *MEMORY[0x24BDAC8D0];
  v5 = (UIImage *)a3;
  if (self->_backTextureImage != v5)
  {
    objc_storeStrong((id *)&self->_backTextureImage, a3);
    if (self->_backTextureImage)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDDB48]), "initWithDevice:", self->_device);
      v7 = *MEMORY[0x24BDDDB08];
      v25[0] = *MEMORY[0x24BDDDB00];
      v25[1] = v7;
      v8 = *MEMORY[0x24BDDDB38];
      v26[0] = MEMORY[0x24BDBD1C8];
      v26[1] = v8;
      v25[2] = *MEMORY[0x24BDDDB10];
      v26[2] = MEMORY[0x24BDBD1C0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[UIImage CGImage](self->_backTextureImage, "CGImage");
      v24 = 0;
      v11 = (MTLTexture *)objc_msgSend(v6, "newTextureWithCGImage:options:error:", v10, v9, &v24);
      v12 = v24;
      backTexture = self->_backTexture;
      self->_backTexture = v11;

      if (-[NSArray count](self->_badgeModels, "count") >= 2)
      {
        -[UIImage size](self->_backTextureImage, "size");
        UIGraphicsBeginImageContextWithOptions(v27, 0, 0.0);
        CurrentContext = UIGraphicsGetCurrentContext();
        -[UIImage size](self->_backTextureImage, "size");
        v16 = v15;
        -[UIImage size](self->_backTextureImage, "size");
        v28.size.height = v17;
        v28.origin.x = 0.0;
        v28.origin.y = 0.0;
        v28.size.width = v16;
        CGContextClearRect(CurrentContext, v28);
        UIGraphicsGetImageFromCurrentImageContext();
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v23 = v12;
        v19 = (MTLTexture *)objc_msgSend(v6, "newTextureWithCGImage:options:error:", objc_msgSend(v18, "CGImage"), v9, &v23);
        v20 = v23;

        emptyBackTexture = self->_emptyBackTexture;
        self->_emptyBackTexture = v19;

        UIGraphicsEndImageContext();
        v12 = v20;
      }

    }
    else
    {
      v22 = self->_backTexture;
      self->_backTexture = 0;

    }
  }

}

- (void)_drawBadgeFrameCallback
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21CC08000, log, OS_LOG_TYPE_ERROR, "AAUIMetalBadgeRenderer: skipping render because no drawable available", v1, 2u);
}

- (AAUIBadgeModelConfiguration)configuration
{
  return self->_configuration;
}

- (UIImage)backTextureImage
{
  return self->_backTextureImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backTextureImage, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_stateUpdateBlock, 0);
  objc_storeStrong((id *)&self->_depthAttachmentMSAA, 0);
  objc_storeStrong((id *)&self->_colorAttachmentMSAA, 0);
  objc_storeStrong((id *)&self->_renderPassDesc, 0);
  objc_storeStrong((id *)&self->_colorTexture, 0);
  objc_storeStrong((id *)&self->_emptyBackTexture, 0);
  objc_storeStrong((id *)&self->_backTexture, 0);
  objc_storeStrong((id *)&self->_environmentTexture, 0);
  objc_storeStrong((id *)&self->_fleckNormalTexture, 0);
  objc_storeStrong((id *)&self->_badgeModels, 0);
  objc_storeStrong((id *)&self->_depthStencilState, 0);
  objc_storeStrong((id *)&self->_shaderFaceTriColorRenderPipeline, 0);
  objc_storeStrong((id *)&self->_shaderFaceInlayRenderPipeline, 0);
  objc_storeStrong((id *)&self->_shaderFaceInlayTriColorsPipeline, 0);
  objc_storeStrong((id *)&self->_shaderFaceRenderPipeline, 0);
  objc_storeStrong((id *)&self->_shaderRenderPipeline, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
}

- (void)_loadBadgeModelWithConfiguration:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "badgeModelPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shapeName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_21CC08000, v3, v4, "Failed to load badge texture path for configuration badgeModelPath:%{public}@ shapeName:%{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_loadBadgeModelWithConfiguration:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "badgeTexturePaths");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_21CC08000, v2, v3, "Failed to load color texture image from URL:%{public}@ error:%{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_loadBadgeModelWithConfiguration:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_21CC08000, a2, a3, "Failed to load glyph texture image from URL:%{public}@", (uint8_t *)&v3);
}

- (void)_drawFrameWithDrawable:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0(&dword_21CC08000, a2, v4, "Failed to draw into command buffer. Error:%{public}@", (uint8_t *)&v5);

}

- (void)snapshot
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_0(&dword_21CC08000, a1, a3, "Failed to generate snapshot (imageRef: %@)", (uint8_t *)&v3);
}

@end
