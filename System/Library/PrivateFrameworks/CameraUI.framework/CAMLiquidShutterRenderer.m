@implementation CAMLiquidShutterRenderer

- (CAMLiquidShutterRenderer)initWithDevice:(id)a3 commandQueue:(id)a4 pixelFormat:(unint64_t)a5
{
  id v9;
  id v10;
  CAMLiquidShutterRenderer *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  MTLRenderPipelineState *v40;
  id v41;
  void *v42;
  id v43;
  CAMLiquidShutterRenderer *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  MTLRenderPipelineState *renderPipelineState;
  NSObject *v60;
  void *v61;
  void *v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  uint8_t buf[8];
  id v79;
  objc_super v80;
  _QWORD v81[2];

  v81[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v80.receiver = self;
  v80.super_class = (Class)CAMLiquidShutterRenderer;
  v11 = -[CAMLiquidShutterRenderer init](&v80, sel_init);
  if (v11)
  {
    CAMCameraUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    objc_msgSend(v12, "URLForResource:withExtension:", CFSTR("ShutterLiquid"), CFSTR("metallib"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUrl:", v14);

    v79 = 0;
    v15 = objc_msgSend(v9, "newBinaryArchiveWithDescriptor:error:", v13, &v79);
    v72 = v79;
    v74 = (void *)v15;
    if (!v15)
    {
      v16 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't load pre-compiled metal library file: ShutterLiquid.metallib", buf, 2u);
      }

    }
    v77 = 0;
    v73 = v12;
    v17 = (void *)objc_msgSend(v9, "newDefaultLibraryWithBundle:error:", v12, &v77);
    v18 = v77;
    v19 = v18;
    if (!v17)
    {
      v20 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[CAMLiquidShutterRenderer initWithDevice:commandQueue:pixelFormat:].cold.1((uint64_t)v19, v20, v45, v46, v47, v48, v49, v50);
      v44 = 0;
      v51 = v72;
      goto LABEL_18;
    }
    v70 = v18;
    v71 = v10;
    v20 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
    -[NSObject colorAttachments](v20, "colorAttachments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPixelFormat:", a5);

    -[NSObject colorAttachments](v20, "colorAttachments");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBlendingEnabled:", 1);

    -[NSObject colorAttachments](v20, "colorAttachments");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRgbBlendOperation:", 0);

    -[NSObject colorAttachments](v20, "colorAttachments");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAlphaBlendOperation:", 0);

    -[NSObject colorAttachments](v20, "colorAttachments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSourceRGBBlendFactor:", 4);

    -[NSObject colorAttachments](v20, "colorAttachments");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setSourceAlphaBlendFactor:", 4);

    -[NSObject colorAttachments](v20, "colorAttachments");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDestinationRGBBlendFactor:", 5);

    -[NSObject colorAttachments](v20, "colorAttachments");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setDestinationAlphaBlendFactor:", 5);

    v37 = (void *)objc_msgSend(v17, "newFunctionWithName:", CFSTR("ShutterLiquidVertex"));
    -[NSObject setVertexFunction:](v20, "setVertexFunction:", v37);

    v38 = (void *)objc_msgSend(v17, "newFunctionWithName:", CFSTR("ShutterLiquidFragment"));
    -[NSObject setFragmentFunction:](v20, "setFragmentFunction:", v38);

    v81[0] = v74;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setBinaryArchives:](v20, "setBinaryArchives:", v39);

    v76 = 0;
    v40 = (MTLRenderPipelineState *)objc_msgSend(v9, "newRenderPipelineStateWithDescriptor:options:reflection:error:", v20, 4, 0, &v76);
    v41 = v76;
    v42 = v41;
    if (v40)
    {
      v43 = v41;
    }
    else
    {
      v52 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        -[CAMLiquidShutterRenderer initWithDevice:commandQueue:pixelFormat:].cold.3((uint64_t)v42, v52, v53, v54, v55, v56, v57, v58);

      -[NSObject setBinaryArchives:](v20, "setBinaryArchives:", MEMORY[0x1E0C9AA60]);
      v75 = v42;
      v40 = (MTLRenderPipelineState *)objc_msgSend(v9, "newRenderPipelineStateWithDescriptor:error:", v20, &v75);
      v43 = v75;

      if (!v40)
      {
        v60 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          -[CAMLiquidShutterRenderer initWithDevice:commandQueue:pixelFormat:].cold.2((uint64_t)v43, v60, v64, v65, v66, v67, v68, v69);
        v44 = 0;
        goto LABEL_17;
      }
    }
    objc_storeStrong((id *)&v11->__device, a3);
    objc_storeStrong((id *)&v11->__commandQueue, a4);
    renderPipelineState = v11->__renderPipelineState;
    v11->__renderPipelineState = v40;
    v60 = v40;

    v11->_showDragHandle = 1;
    *(_OWORD *)&v11->_blurRadius = xmmword_1DB9A7E30;
    v11->_shadowColor.r = 0.0;
    v11->_shadowColor.g = 0.0;
    v11->_shadowColor.b = 0.0;
    v11->_shadowColor.a = 0.2;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObserver:selector:name:object:", v11, sel__applicationWillEnterForeground, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addObserver:selector:name:object:", v11, sel__applicationDidEnterBackground, *MEMORY[0x1E0DC4768], 0);

    v44 = v11;
LABEL_17:
    v51 = v72;
    v19 = v70;

    v10 = v71;
LABEL_18:

    goto LABEL_19;
  }
  v44 = 0;
LABEL_19:

  return v44;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CAMLiquidShutterRenderer;
  -[CAMLiquidShutterRenderer dealloc](&v4, sel_dealloc);
}

- (void)setCenterShape:(id *)a3
{
  BOOL v5;
  CGPoint var0;
  __int128 v7;
  __int128 v8;

  v5 = self->_centerShape.position.x == a3->var0.x
    && self->_centerShape.position.y == a3->var0.y
    && self->_centerShape.size == a3->var1
    && self->_centerShape.power == a3->var3;
  if (!v5
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_centerShape.color.r, *(float64x2_t *)&a3->var2.var0), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_centerShape.color.b, *(float64x2_t *)&a3->var2.var2))), 0xFuLL))) & 1) == 0)
  {
    var0 = a3->var0;
    v7 = *(_OWORD *)&a3->var1;
    v8 = *(_OWORD *)&a3->var2.var3;
    *(_OWORD *)&self->_centerShape.color.g = *(_OWORD *)&a3->var2.var1;
    *(_OWORD *)&self->_centerShape.color.a = v8;
    self->_centerShape.position = var0;
    *(_OWORD *)&self->_centerShape.size = v7;
    -[CAMLiquidShutterRenderer markNeedsRender](self, "markNeedsRender");
  }
}

- (void)setDragHandleShape:(id *)a3
{
  BOOL v5;
  CGPoint var0;
  __int128 v7;
  __int128 v8;

  v5 = self->_dragHandleShape.position.x == a3->var0.x
    && self->_dragHandleShape.position.y == a3->var0.y
    && self->_dragHandleShape.size == a3->var1
    && self->_dragHandleShape.power == a3->var3;
  if (!v5
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dragHandleShape.color.r, *(float64x2_t *)&a3->var2.var0), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_dragHandleShape.color.b, *(float64x2_t *)&a3->var2.var2))), 0xFuLL))) & 1) == 0)
  {
    var0 = a3->var0;
    v7 = *(_OWORD *)&a3->var1;
    v8 = *(_OWORD *)&a3->var2.var3;
    *(_OWORD *)&self->_dragHandleShape.color.g = *(_OWORD *)&a3->var2.var1;
    *(_OWORD *)&self->_dragHandleShape.color.a = v8;
    self->_dragHandleShape.position = var0;
    *(_OWORD *)&self->_dragHandleShape.size = v7;
    -[CAMLiquidShutterRenderer markNeedsRender](self, "markNeedsRender");
  }
}

- (void)setShowDragHandle:(BOOL)a3
{
  if (-[CAMLiquidShutterRenderer showDragHandle](self, "showDragHandle") != a3)
  {
    self->_showDragHandle = a3;
    -[CAMLiquidShutterRenderer markNeedsRender](self, "markNeedsRender");
  }
}

- (void)setBlurRadius:(double)a3
{
  if (self->_blurRadius != a3)
  {
    self->_blurRadius = a3;
    -[CAMLiquidShutterRenderer markNeedsRender](self, "markNeedsRender");
  }
}

- (void)setShadowSize:(double)a3
{
  if (self->_shadowSize != a3)
  {
    self->_shadowSize = a3;
    -[CAMLiquidShutterRenderer markNeedsRender](self, "markNeedsRender");
  }
}

- (void)setShadowColor:(id)a3
{
  if (self->_shadowColor.r != a3.var0
    || self->_shadowColor.g != a3.var1
    || self->_shadowColor.b != a3.var2
    || self->_shadowColor.a != a3.var3)
  {
    self->_shadowColor = ($59EB6295AEC70A1E4031341B6A0DE1A8)a3;
    -[CAMLiquidShutterRenderer markNeedsRender](self, "markNeedsRender");
  }
}

- (void)markNeedsRender
{
  -[CAMLiquidShutterRenderer set_neededRenderID:](self, "set_neededRenderID:", -[CAMLiquidShutterRenderer _neededRenderID](self, "_neededRenderID") + 1);
}

- (void)_applicationWillEnterForeground
{
  -[CAMLiquidShutterRenderer _setBackgrounded:](self, "_setBackgrounded:", 0);
  -[CAMLiquidShutterRenderer renderIfNecessary](self, "renderIfNecessary");
}

- (void)_applicationDidEnterBackground
{
  -[CAMLiquidShutterRenderer _setBackgrounded:](self, "_setBackgrounded:", 1);
}

- (void)renderIfNecessary
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double v27;
  double v28;
  float64x2_t v29;
  float64_t v30;
  double v31;
  float64x2_t v32;
  float64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  unint64_t v52;
  float64_t v53;
  void *v54;
  float64_t v55;
  int32x2_t v56;
  _QWORD v57[7];
  _QWORD v58[4];
  id v59;
  _OWORD v60[6];
  int v61;
  int v62;
  int v63;
  int v64;
  float32x4_t v65;
  _OWORD v66[8];
  _BYTE v67[64];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[64];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  float v76;
  uint64_t v77;
  float v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = -[CAMLiquidShutterRenderer _neededRenderID](self, "_neededRenderID");
  v4 = -[CAMLiquidShutterRenderer _lastRenderedID](self, "_lastRenderedID");
  -[CAMLiquidShutterRenderer metalLayer](self, "metalLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v3 > v4)
  {
    v54 = v5;
    v6 = -[CAMLiquidShutterRenderer _backgrounded](self, "_backgrounded");

    if (!v6)
    {
      -[CAMLiquidShutterRenderer metalLayer](self, "metalLayer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "drawableSize");
      v9 = v8;
      v11 = v10;

      -[CAMLiquidShutterRenderer metalLayer](self, "metalLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentsScale");
      v14 = v13;

      v73 = 0u;
      v74 = 0u;
      v72 = 0u;
      -[CAMLiquidShutterRenderer centerShape](self, "centerShape");
      -[CAMLiquidShutterRenderer _fragmentForShape:scale:](self, "_fragmentForShape:scale:", v71, v14);
      v69 = 0u;
      v70 = 0u;
      v68 = 0u;
      -[CAMLiquidShutterRenderer dragHandleShape](self, "dragHandleShape");
      -[CAMLiquidShutterRenderer _fragmentForShape:scale:](self, "_fragmentForShape:scale:", v67, v14);
      *(float *)&v15 = v9;
      *(float *)&v16 = v11;
      LODWORD(v17) = 1120403456;
      LODWORD(v18) = 0;
      LODWORD(v19) = 0;
      LODWORD(v20) = 0;
      -[CAMLiquidShutterRenderer _orthographicMatrixWithLeft:right:bottom:top:near:far:](self, "_orthographicMatrixWithLeft:right:bottom:top:near:far:", v18, v15, v16, v19, v20, v17);
      v21 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
      v66[0] = *MEMORY[0x1E0C83FF0];
      v66[1] = v21;
      v22 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
      v66[2] = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32);
      v66[3] = v22;
      v66[4] = v23;
      v66[5] = v24;
      v66[6] = v25;
      v66[7] = v26;
      v75 = v72;
      v76 = *((float *)&v72 + 2) + (float)(*((float *)&v74 + 1) * 2.0);
      v77 = v68;
      v78 = *((float *)&v68 + 2) + (float)(*((float *)&v70 + 1) * 2.0);
      v60[0] = v72;
      v60[1] = v73;
      v63 = 0;
      v60[2] = v74;
      v60[3] = v68;
      v60[4] = v69;
      v60[5] = v70;
      v61 = -[CAMLiquidShutterRenderer showDragHandle](self, "showDragHandle");
      v62 = 1056964608;
      -[CAMLiquidShutterRenderer shadowSize](self, "shadowSize");
      *(float *)&v27 = v27;
      v64 = LODWORD(v27);
      -[CAMLiquidShutterRenderer shadowColor](self, "shadowColor");
      v55 = v28;
      -[CAMLiquidShutterRenderer shadowColor](self, "shadowColor");
      v29.f64[0] = v55;
      v29.f64[1] = v30;
      v56 = (int32x2_t)vcvt_f32_f64(v29);
      -[CAMLiquidShutterRenderer shadowColor](self, "shadowColor");
      v53 = v31;
      -[CAMLiquidShutterRenderer shadowColor](self, "shadowColor");
      v32.f64[0] = v53;
      v32.f64[1] = v33;
      v65 = vcvt_hight_f32_f64(v56, v32);
      -[CAMLiquidShutterRenderer metalLayer](self, "metalLayer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "nextDrawable");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_alloc_init(MEMORY[0x1E0CC6B50]);
      objc_msgSend(v36, "colorAttachments");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

      objc_msgSend(v36, "colorAttachments");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setLoadAction:", 2);

      objc_msgSend(v36, "colorAttachments");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectAtIndexedSubscript:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setStoreAction:", 1);

      objc_msgSend(v35, "texture");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "colorAttachments");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setTexture:", v43);

      -[CAMLiquidShutterRenderer _commandQueue](self, "_commandQueue");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "commandBuffer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "renderCommandEncoderWithDescriptor:", v36);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMLiquidShutterRenderer _renderPipelineState](self, "_renderPipelineState");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setRenderPipelineState:", v49);

      objc_msgSend(v48, "setVertexBytes:length:atIndex:", v66, 128, 0);
      objc_msgSend(v48, "setVertexBytes:length:atIndex:", &v75, 32, 1);
      objc_msgSend(v48, "setFragmentBytes:length:atIndex:", v60, 128, 0);
      objc_msgSend(v48, "drawPrimitives:vertexStart:vertexCount:", 0, 0, 2);
      objc_msgSend(v48, "endEncoding");
      v50 = MEMORY[0x1E0C809B0];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke;
      v58[3] = &unk_1EA32F428;
      v59 = v35;
      v51 = v35;
      objc_msgSend(v47, "addScheduledHandler:", v58);
      v52 = -[CAMLiquidShutterRenderer _neededRenderID](self, "_neededRenderID");
      v57[0] = v50;
      v57[1] = 3221225472;
      v57[2] = __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_2;
      v57[3] = &unk_1EA32F450;
      v57[5] = CFAbsoluteTimeGetCurrent();
      v57[4] = self;
      v57[6] = v52;
      objc_msgSend(v47, "addCompletedHandler:", v57);
      objc_msgSend(v47, "commit");

    }
  }
  else
  {

  }
}

uint64_t __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "present");
}

void __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[6];
  uint8_t buf[4];
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = 0;
  switch(objc_msgSend(v3, "status"))
  {
    case 0:
      v4 = CFSTR("NotEnqueued");
      break;
    case 1:
      v4 = CFSTR("Enqueued");
      break;
    case 2:
      v4 = CFSTR("Committed");
      break;
    case 3:
      v4 = CFSTR("Scheduled");
      break;
    case 5:
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Error: %@"), v7);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }
  v8 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
  if (v4)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_2_cold_1((uint64_t)v4, v9, v8);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_29;
    v11[3] = &unk_1EA328B18;
    v10 = *(_QWORD *)(a1 + 48);
    v11[4] = *(_QWORD *)(a1 + 32);
    v11[5] = v10;
    cam_perform_on_main_asap(v11);
    if (v8 <= 0.25)
      goto LABEL_11;
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = v8;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Dynamic shutter render took %.4f seconds", buf, 0xCu);
    }
  }

LABEL_11:
}

unint64_t __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_29(uint64_t a1)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_lastRenderedID");
  if (result < *(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "set_lastRenderedID:");
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)_fragmentForShape:(id *)a3 scale:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  float32x4_t v6;
  float32x2_t v7;
  float v8;
  float var3;
  float v10;
  float v11;
  double v12;
  float v13;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v5 = v4;
  v6 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var2.var0), *(float64x2_t *)&a3->var2.var2);
  v7 = vcvt_f32_f64(vmulq_n_f64((float64x2_t)a3->var0, a4));
  *(_OWORD *)v4 = 0u;
  *(float32x2_t *)v4 = v7;
  v8 = a3->var1 * a4;
  *(float *)(v4 + 8) = v8;
  *(float32x4_t *)(v4 + 16) = v6;
  *(_OWORD *)(v4 + 32) = 0u;
  var3 = a3->var3;
  *(float *)(v4 + 32) = var3;
  -[CAMLiquidShutterRenderer blurRadius](self, "blurRadius");
  v11 = *(float *)&a4;
  v13 = v12 * a4;
  *(float *)(v5 + 36) = v13;
  result.var2 = v10;
  result.var1 = v11;
  result.var0 = v13;
  return result;
}

- (float)_orthographicMatrixWithLeft:(float)a1 right:(float)a2 bottom:top:near:far:
{
  __asm { FMOV            V3.4S, #1.0 }
  return 2.0 / (float)(a2 - a1);
}

- ($879D98F28FE294FA2180E401ED55428F)centerShape
{
  CGPoint var0;
  __int128 v4;

  var0 = self[2].var0;
  retstr->var0 = *(CGPoint *)&self[1].var2.var3;
  *(CGPoint *)&retstr->var1 = var0;
  v4 = *(_OWORD *)&self[2].var2.var1;
  *(_OWORD *)&retstr->var2.var1 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var2.var3 = v4;
  return self;
}

- ($879D98F28FE294FA2180E401ED55428F)dragHandleShape
{
  CGPoint var0;
  __int128 v4;

  var0 = self[3].var0;
  retstr->var0 = *(CGPoint *)&self[2].var2.var3;
  *(CGPoint *)&retstr->var1 = var0;
  v4 = *(_OWORD *)&self[3].var2.var1;
  *(_OWORD *)&retstr->var2.var1 = *(_OWORD *)&self[3].var1;
  *(_OWORD *)&retstr->var2.var3 = v4;
  return self;
}

- (BOOL)showDragHandle
{
  return self->_showDragHandle;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)shadowSize
{
  return self->_shadowSize;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)shadowColor
{
  double r;
  double g;
  double b;
  double a;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  r = self->_shadowColor.r;
  g = self->_shadowColor.g;
  b = self->_shadowColor.b;
  a = self->_shadowColor.a;
  result.var3 = a;
  result.var2 = b;
  result.var1 = g;
  result.var0 = r;
  return result;
}

- (CAMetalLayer)metalLayer
{
  return (CAMetalLayer *)objc_loadWeakRetained((id *)&self->_metalLayer);
}

- (void)setMetalLayer:(id)a3
{
  objc_storeWeak((id *)&self->_metalLayer, a3);
}

- (MTLDevice)_device
{
  return self->__device;
}

- (MTLCommandQueue)_commandQueue
{
  return self->__commandQueue;
}

- (MTLRenderPipelineState)_renderPipelineState
{
  return self->__renderPipelineState;
}

- (BOOL)_backgrounded
{
  return self->__backgrounded;
}

- (void)_setBackgrounded:(BOOL)a3
{
  self->__backgrounded = a3;
}

- (unint64_t)_neededRenderID
{
  return self->__neededRenderID;
}

- (void)set_neededRenderID:(unint64_t)a3
{
  self->__neededRenderID = a3;
}

- (unint64_t)_lastRenderedID
{
  return self->__lastRenderedID;
}

- (void)set_lastRenderedID:(unint64_t)a3
{
  self->__lastRenderedID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__renderPipelineState, 0);
  objc_storeStrong((id *)&self->__commandQueue, 0);
  objc_storeStrong((id *)&self->__device, 0);
  objc_destroyWeak((id *)&self->_metalLayer);
}

- (void)initWithDevice:(uint64_t)a3 commandQueue:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Failed to create Metal library: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDevice:(uint64_t)a3 commandQueue:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Failed to create Metal render pipeline state: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDevice:(uint64_t)a3 commandQueue:(uint64_t)a4 pixelFormat:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Failed to create Metal render pipeline using cache, falling back to run-time compilation: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __45__CAMLiquidShutterRenderer_renderIfNecessary__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a3;
  v5 = 2114;
  v6 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Dynamic shutter render did not complete successfully. Time: %.4f Command buffer status: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
