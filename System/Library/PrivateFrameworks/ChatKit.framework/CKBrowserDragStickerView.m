@implementation CKBrowserDragStickerView

+ (id)meshTransform
{
  if (meshTransform_onceToken != -1)
    dispatch_once(&meshTransform_onceToken, &__block_literal_global_200);
  return (id)meshTransform___mesh;
}

void __41__CKBrowserDragStickerView_meshTransform__block_invoke()
{
  uint64_t v0;
  void *v1;
  _BYTE v2[320];
  _BYTE __dst[880];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memcpy(__dst, &unk_18E7CB8A0, sizeof(__dst));
  memcpy(v2, &unk_18E7CBC10, sizeof(v2));
  objc_msgSend(MEMORY[0x1E0CD27D8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 22, __dst, 10, v2, *MEMORY[0x1E0CD2A90]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)meshTransform___mesh;
  meshTransform___mesh = v0;

}

+ (id)springAnimationWithKeyPath:(id)a3 speed:(float)a4
{
  void *v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMass:", 2.0);
  objc_msgSend(v5, "setStiffness:", 300.0);
  objc_msgSend(v5, "setDamping:", 400.0);
  *(float *)&v6 = a4;
  objc_msgSend(v5, "setSpeed:", v6);
  objc_msgSend(v5, "setDuration:", 0.91);
  v7 = objc_alloc(MEMORY[0x1E0CD27D0]);
  LODWORD(v8) = 1041212815;
  LODWORD(v9) = 999867313;
  LODWORD(v10) = 1058228603;
  LODWORD(v11) = 1064805775;
  v12 = (void *)objc_msgSend(v7, "initWithControlPoints::::", v8, v9, v10, v11);
  objc_msgSend(v5, "setTimingFunction:", v12);

  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationTimerObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserDragStickerView;
  -[CKBrowserDragStickerView dealloc](&v4, sel_dealloc);
}

- (CKBrowserDragStickerView)initWithSourceRect:(CGRect)a3 dragImage:(id)a4
{
  id v5;
  CKBrowserDragStickerView *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  float64x2_t *v30;
  float64x2_t v31;
  double v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v41;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  objc_super v46;

  width = a3.size.width;
  height = a3.size.height;
  x = a3.origin.x;
  y = a3.origin.y;
  v5 = a4;
  v46.receiver = self;
  v46.super_class = (Class)CKBrowserDragStickerView;
  v6 = -[CKBrowserDragStickerView init](&v46, sel_init);
  if (v6)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragStickerView setDragImageFrames:](v6, "setDragImageFrames:", v8);
    objc_msgSend(v5, "size");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v5, "scale");
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    objc_msgSend(v7, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v10, v12, v14, 1.0, v16, 1.79769313e308);
    v18 = v17;
    v20 = v19;

    v21 = width / v18;
    if (v12 > v10)
      v21 = height / v20;
    v22 = fmin(v21, 1.0);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scale");
    UIRectIntegralWithScale();
    v25 = v24;
    v27 = v26;

    -[CKBrowserDragStickerView setDragViewScale:](v6, "setDragViewScale:", 1.0);
    -[CKBrowserDragStickerView setInitialScale:](v6, "setInitialScale:", v22);
    -[CKBrowserDragStickerView setInitialSize:](v6, "setInitialSize:", width, height);
    -[CKBrowserDragStickerView setRasterizedImageSize:](v6, "setRasterizedImageSize:", v25, v27);
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserDragStickerView setCurrentFrameImage:](v6, "setCurrentFrameImage:", v28);

    }
    else
    {
      -[CKBrowserDragStickerView setCurrentFrameImage:](v6, "setCurrentFrameImage:", 0);
    }
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKBrowserDragStickerView setPeelMaskImageCache:](v6, "setPeelMaskImageCache:", v29);

    v30 = (float64x2_t *)MEMORY[0x1E0C9D648];
    -[CKBrowserDragStickerView setBounds:](v6, "setBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), v25, v27);
    v31 = v30[1];
    if (CKMainScreenScale_once_82 != -1)
    {
      v41 = v30[1];
      dispatch_once(&CKMainScreenScale_once_82, &__block_literal_global_420_0);
      v31 = v41;
    }
    v32 = *(double *)&CKMainScreenScale_sMainScreenScale_82;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_82 == 0.0)
      v32 = 1.0;
    v33.f64[0] = x;
    v33.f64[1] = y;
    v34.f64[0] = width;
    v34.f64[1] = height;
    __asm { FMOV            V2.2D, #0.5 }
    -[CKBrowserDragStickerView setCenter:](v6, "setCenter:", vmulq_n_f64(vaddq_f64(vmulq_n_f64(v33, v32), vrndmq_f64(vmulq_f64(vsubq_f64(vmulq_n_f64(v34, v32), vmulq_n_f64(v31, v32)), _Q2))), 1.0 / v32), *(_OWORD *)&v41);
    -[CKBrowserDragStickerView setUpPeelLayers](v6, "setUpPeelLayers");
    -[CKBrowserDragStickerView setDragImage:](v6, "setDragImage:", v5);

  }
  return v6;
}

- (CKBrowserDragStickerView)initWithSourceRect:(CGRect)a3 draggedSticker:(id)a4
{
  id v5;
  CKBrowserDragStickerView *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  float64x2_t *v28;
  float64x2_t v29;
  double v30;
  float64x2_t v31;
  float64x2_t v32;
  void *v38;
  float64x2_t v40;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  objc_super v45;

  width = a3.size.width;
  height = a3.size.height;
  x = a3.origin.x;
  y = a3.origin.y;
  v5 = a4;
  v45.receiver = self;
  v45.super_class = (Class)CKBrowserDragStickerView;
  v6 = -[CKBrowserDragStickerView init](&v45, sel_init);
  if (v6)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animatedImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKBrowserDragStickerView setDragImageFrames:](v6, "setDragImageFrames:", v9);
    objc_msgSend(v5, "frame");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "scale");
    v15 = v14;
    objc_msgSend(v7, "stickerScreenScale");
    objc_msgSend(v7, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v11, v13, v15, 1.0, v16, 1.79769313e308);
    v19 = width / v18;
    if (v13 > v11)
      v19 = height / v17;
    v20 = fmin(v19, 1.0);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scale");
    UIRectIntegralWithScale();
    v23 = v22;
    v25 = v24;

    -[CKBrowserDragStickerView setDragViewScale:](v6, "setDragViewScale:", 1.0);
    -[CKBrowserDragStickerView setInitialScale:](v6, "setInitialScale:", v20);
    -[CKBrowserDragStickerView setInitialSize:](v6, "setInitialSize:", width, height);
    -[CKBrowserDragStickerView setRasterizedImageSize:](v6, "setRasterizedImageSize:", v23, v25);
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserDragStickerView setCurrentFrameImage:](v6, "setCurrentFrameImage:", v26);

    }
    else
    {
      -[CKBrowserDragStickerView setCurrentFrameImage:](v6, "setCurrentFrameImage:", 0);
    }
    v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKBrowserDragStickerView setPeelMaskImageCache:](v6, "setPeelMaskImageCache:", v27);

    v28 = (float64x2_t *)MEMORY[0x1E0C9D648];
    -[CKBrowserDragStickerView setBounds:](v6, "setBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), v23, v25);
    v29 = v28[1];
    if (CKMainScreenScale_once_82 != -1)
    {
      v40 = v28[1];
      dispatch_once(&CKMainScreenScale_once_82, &__block_literal_global_420_0);
      v29 = v40;
    }
    v30 = *(double *)&CKMainScreenScale_sMainScreenScale_82;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_82 == 0.0)
      v30 = 1.0;
    v31.f64[0] = x;
    v31.f64[1] = y;
    v32.f64[0] = width;
    v32.f64[1] = height;
    __asm { FMOV            V2.2D, #0.5 }
    -[CKBrowserDragStickerView setCenter:](v6, "setCenter:", vmulq_n_f64(vaddq_f64(vmulq_n_f64(v31, v30), vrndmq_f64(vmulq_f64(vsubq_f64(vmulq_n_f64(v32, v30), vmulq_n_f64(v29, v30)), _Q2))), 1.0 / v30), *(_OWORD *)&v40);
    -[CKBrowserDragStickerView setUpPeelLayers](v6, "setUpPeelLayers");
    objc_msgSend(v5, "animatedImage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragStickerView setDragImage:](v6, "setDragImage:", v38);

  }
  return v6;
}

- (void)setUpPeelLayers
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  CGFloat Width;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  id v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  _OWORD v68[5];
  uint64_t v69;
  unint64_t v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[2];
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  _QWORD v77[3];
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v77[1] = *MEMORY[0x1E0C80C00];
  -[CKBrowserDragStickerView currentFrameImage](self, "currentFrameImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragStickerView scaleImage:toSize:](self, "scaleImage:toSize:", v3, self->_rasterizedImageSize.width, self->_rasterizedImageSize.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKBrowserDragStickerView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[CKBrowserDragStickerView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anchorPoint");
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0CD28C8], "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v68[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v68[3] = v13;
  v68[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v14 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
  v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v68[0] = *MEMORY[0x1E0CD2610];
  v68[1] = v15;
  v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v71 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v72 = v16;
  v69 = v14;
  v70 = 0xBF747AE140000000;
  objc_msgSend(v12, "setSublayerTransform:", v68);
  objc_msgSend(v12, "setPosition:", v6 * 0.5, v8 * 0.5);
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v6, v8);
  -[CKBrowserDragStickerView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSublayer:", v12);

  v67 = v12;
  -[CKBrowserDragStickerView setPerspectiveLayer:](self, "setPerspectiveLayer:", v12);
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "meshTransform");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMeshTransform:", v19);

  objc_msgSend(v18, "setPosition:", v6 * v11, -v8);
  objc_msgSend(v18, "setBounds:", 0.0, 0.0, v6 + v6, v8 * 5.0);
  objc_msgSend(v18, "setRasterizationScale:", 2.8);
  objc_msgSend(v12, "addSublayer:", v18);
  -[CKBrowserDragStickerView setMeshLayer:](self, "setMeshLayer:", v18);
  objc_msgSend(v18, "position");
  -[CKBrowserDragStickerView setMeshLayerStartPosition:](self, "setMeshLayerStartPosition:");
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPosition:", (v6 + v6) * v11, v8 * 5.0 - v8);
  objc_msgSend(v20, "setBounds:", 0.0, 0.0, v6, v8);
  objc_msgSend(v18, "addSublayer:", v20);
  -[CKBrowserDragStickerView setPeelLayer:](self, "setPeelLayer:", v20);
  objc_msgSend(v20, "position");
  -[CKBrowserDragStickerView setPeelLayerStartPosition:](self, "setPeelLayerStartPosition:");
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_retainAutorelease(v4);
  objc_msgSend(v21, "setContents:", objc_msgSend(v62, "CGImage"));
  v22 = *MEMORY[0x1E0CD2F90];
  v60 = *MEMORY[0x1E0CD2F90];
  objc_msgSend(v21, "setContentsGravity:", *MEMORY[0x1E0CD2F90]);
  objc_msgSend(v20, "bounds");
  objc_msgSend(v21, "setFrame:");
  v76 = CFSTR("contents");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActions:", v24);

  -[CKBrowserDragStickerView setPeelImageLayer:](self, "setPeelImageLayer:", v21);
  objc_msgSend(v20, "addSublayer:", v21);
  -[CKBrowserDragStickerView peelMaskImageFromImage:](self, "peelMaskImageFromImage:", v62);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_retainAutorelease(v25);
  objc_msgSend(v65, "setContents:", objc_msgSend(v66, "CGImage"));
  objc_msgSend(v20, "bounds");
  objc_msgSend(v65, "setFrame:");
  objc_msgSend(v65, "setContentsGravity:", v22);
  objc_msgSend(v20, "setMask:", v65);
  -[CKBrowserDragStickerView setPeelMaskLayer:](self, "setPeelMaskLayer:", v65);
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("StickerShine"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "size");
  v28 = v27;
  objc_msgSend(v20, "bounds");
  Width = CGRectGetWidth(v78);
  v30 = Width + Width;
  if (v28 < v30)
    v28 = v30;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_retainAutorelease(v26);
  objc_msgSend(v31, "setContents:", objc_msgSend(v64, "CGImage"));
  objc_msgSend(v20, "bounds");
  v32 = round(CGRectGetWidth(v79) - v28) * 0.5;
  objc_msgSend(v64, "size");
  v34 = -v33;
  objc_msgSend(v64, "size");
  objc_msgSend(v31, "setFrame:", v32, v34, v28, v35);
  LODWORD(v36) = 1035489772;
  objc_msgSend(v31, "setOpacity:", v36);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setCompositingFilter:", v37);

  objc_msgSend(v20, "addSublayer:", v31);
  -[CKBrowserDragStickerView setShineLayer:](self, "setShineLayer:", v31);
  objc_msgSend(v31, "position");
  -[CKBrowserDragStickerView setShineLayerStartPosition:](self, "setShineLayerStartPosition:");
  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("StickerShadow"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "size");
  v40 = v39;
  objc_msgSend(v20, "bounds");
  v41 = CGRectGetWidth(v80);
  v42 = v41 + v41;
  if (v40 < v42)
    v40 = v42;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_retainAutorelease(v38);
  objc_msgSend(v43, "setContents:", objc_msgSend(v61, "CGImage"));
  objc_msgSend(v20, "bounds");
  v44 = round(CGRectGetWidth(v81) - v40) * 0.5;
  objc_msgSend(v61, "size");
  v46 = -10.0 - v45;
  objc_msgSend(v61, "size");
  objc_msgSend(v43, "setFrame:", v44, v46, v40, v47);
  LODWORD(v48) = 1043542835;
  objc_msgSend(v43, "setOpacity:", v48);
  objc_msgSend(v20, "addSublayer:", v43);
  -[CKBrowserDragStickerView setShadowLayer:](self, "setShadowLayer:", v43);
  objc_msgSend(v43, "position");
  -[CKBrowserDragStickerView setShadowLayerStartPosition:](self, "setShadowLayerStartPosition:");
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_retainAutorelease(v62);
  objc_msgSend(v49, "setContents:", objc_msgSend(v63, "CGImage"));
  objc_msgSend(v49, "setContentsGravity:", v60);
  -[CKBrowserDragStickerView layer](self, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bounds");
  objc_msgSend(v50, "convertRect:fromLayer:", v21);
  objc_msgSend(v49, "setFrame:");

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.75, 1.0);
  v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v49, "setContentsMultiplyColor:", objc_msgSend(v51, "CGColor"));

  LODWORD(v52) = 1041194025;
  objc_msgSend(v49, "setOpacity:", v52);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setCompositingFilter:", v53);

  v74 = CFSTR("contents");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v54;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setActions:", v55);

  -[CKBrowserDragStickerView layer](self, "layer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "insertSublayer:below:", v49, v67);

  -[CKBrowserDragStickerView setDropShadowLayer:](self, "setDropShadowLayer:", v49);
  objc_msgSend(v49, "position");
  -[CKBrowserDragStickerView setDropShadowLayerStartPosition:](self, "setDropShadowLayerStartPosition:");
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setValue:forKey:", &unk_1E2871560, CFSTR("inputRadius"));
  objc_msgSend(v57, "setName:", CFSTR("blurFilter"));
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setValue:forKey:", &unk_1E2871570, CFSTR("inputAmount"));
  v73[0] = v57;
  v73[1] = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFilters:", v59);

}

- (void)animatePeelWithCompletion:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  dispatch_time_t v45;
  void *v46;
  _QWORD block[4];
  id v48;

  v4 = a3;
  if (-[CKBrowserDragStickerView canPeel](self, "canPeel"))
  {
    v5 = (void *)objc_opt_class();
    LODWORD(v6) = 1053609165;
    objc_msgSend(v5, "springAnimationWithKeyPath:speed:", CFSTR("filters.blurFilter.inputRadius"), v6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setToValue:", &unk_1E2871580);
    objc_msgSend(v46, "setBeginTime:", CACurrentMediaTime() + 0.1);
    v7 = (void *)objc_opt_class();
    LODWORD(v8) = 1053609165;
    objc_msgSend(v7, "springAnimationWithKeyPath:speed:", CFSTR("position"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 23.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setByValue:", v10);

    v11 = v9;
    objc_msgSend(v9, "setBeginTime:", CACurrentMediaTime() + 0.1);
    v12 = (void *)objc_opt_class();
    LODWORD(v13) = 1061997773;
    objc_msgSend(v12, "springAnimationWithKeyPath:speed:", CFSTR("opacity"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setToValue:", &unk_1E2871590);
    objc_msgSend(v14, "setBeginTime:", CACurrentMediaTime() + 0.1);
    v15 = (void *)objc_opt_class();
    LODWORD(v16) = 1061997773;
    objc_msgSend(v15, "springAnimationWithKeyPath:speed:", CFSTR("transform.scale.xy"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setToValue:", &unk_1E28715A0);
    objc_msgSend(v17, "setBeginTime:", CACurrentMediaTime() + 0.1);
    -[CKBrowserDragStickerView bounds](self, "bounds");
    v19 = v18;
    v20 = v18 * 2.1;
    v21 = (void *)objc_opt_class();
    LODWORD(v22) = 1050253722;
    objc_msgSend(v21, "springAnimationWithKeyPath:speed:", CFSTR("position"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setByValue:", v24);

    objc_msgSend(v23, "setBeginTime:", CACurrentMediaTime() + -0.31);
    v25 = (void *)objc_opt_class();
    LODWORD(v26) = 1050253722;
    objc_msgSend(v25, "springAnimationWithKeyPath:speed:", CFSTR("position"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, -(v19 * 2.1));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setByValue:", v28);

    objc_msgSend(v27, "setBeginTime:", CACurrentMediaTime() + -0.31);
    v29 = (void *)objc_opt_class();
    LODWORD(v30) = 1053609165;
    objc_msgSend(v29, "springAnimationWithKeyPath:speed:", CFSTR("position"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 135.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setByValue:", v32);

    objc_msgSend(v31, "setBeginTime:", CACurrentMediaTime() + -0.12);
    v33 = (void *)objc_opt_class();
    LODWORD(v34) = 1061997773;
    objc_msgSend(v33, "springAnimationWithKeyPath:speed:", CFSTR("position"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 130.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setByValue:", v36);

    objc_msgSend(v35, "setBeginTime:", CACurrentMediaTime() + 0.1);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.310000002);
    -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAnimation:forKey:", v46, CFSTR("dropShadowBlurAnimation"));

    -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addAnimation:forKey:", v11, CFSTR("dropShadowPositionAnimation"));

    -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addAnimation:forKey:", v14, CFSTR("dropShadowOpacityAnimation"));

    -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addAnimation:forKey:", v17, CFSTR("dropShadowScaleAnimation"));

    -[CKBrowserDragStickerView meshLayer](self, "meshLayer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addAnimation:forKey:", v23, CFSTR("meshAnimation"));

    -[CKBrowserDragStickerView peelLayer](self, "peelLayer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addAnimation:forKey:", v27, CFSTR("peelAnimation"));

    -[CKBrowserDragStickerView shineLayer](self, "shineLayer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addAnimation:forKey:", v31, CFSTR("shineAnimation"));

    -[CKBrowserDragStickerView shadowLayer](self, "shadowLayer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addAnimation:forKey:", v35, CFSTR("shadowAnimation"));

    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    v45 = dispatch_time(0, 910000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__CKBrowserDragStickerView_animatePeelWithCompletion___block_invoke;
    block[3] = &unk_1E274AED0;
    v48 = v4;
    dispatch_after(v45, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __54__CKBrowserDragStickerView_animatePeelWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)animateScaleDown
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[5];

  v3 = (void *)objc_opt_class();
  LODWORD(v4) = 1061997773;
  objc_msgSend(v3, "springAnimationWithKeyPath:speed:", CFSTR("transform.scale.xy"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragStickerView dragViewScaleUp](self, "dragViewScaleUp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 * (self->_dragViewScale * self->_elasticScaleX));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dragViewScale * self->_elasticScaleX * 0.714285714);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToValue:", v8);

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.310000002);
  -[CKBrowserDragStickerView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAnimation:forKey:", v5, CFSTR("scaleDownAnimation"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  v10 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CKBrowserDragStickerView_animateScaleDown__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_after(v10, MEMORY[0x1E0C80D38], block);

}

void __44__CKBrowserDragStickerView_animateScaleDown__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAnimationForKey:", CFSTR("scaleDownAnimation"));

}

- (void)reversePeelAnimationToPoint:(CGPoint)a3 forPlacement:(BOOL)a4 shouldShrink:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double y;
  double x;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  dispatch_time_t v116;
  void *v117;
  id v118;
  void *v119;
  CGFloat v120;
  CGFloat width;
  CGFloat height;
  CGFloat v123;
  CGFloat v124;
  void *v125;
  id v126;
  _BOOL4 v127;
  _BOOL4 v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  _QWORD v133[4];
  void *v134;
  _QWORD v135[9];
  _QWORD block[4];
  void *v137;
  CGRect v138;
  CGRect v139;

  v6 = a5;
  v7 = a4;
  y = a3.y;
  x = a3.x;
  v11 = a6;
  v12 = (void *)objc_opt_class();
  LODWORD(v13) = 1061997773;
  objc_msgSend(v12, "springAnimationWithKeyPath:speed:", CFSTR("transform.scale.xy"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v127 = v6;
  v128 = v7;
  v132 = v14;
  v129 = v11;
  if (v6)
  {
    objc_msgSend(v14, "setToValue:", &unk_1E28715B0);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    if (v7)
      -[CKBrowserDragStickerView dragViewScale](self, "dragViewScale");
    else
      -[CKBrowserDragStickerView dragViewScaleUp](self, "dragViewScaleUp");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setToValue:", v17);

  }
  -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentationLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "position");
  v21 = v20;
  v23 = v22;
  -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPosition:", v21, v23);

  v25 = (void *)objc_opt_class();
  LODWORD(v26) = 1066192077;
  objc_msgSend(v25, "springAnimationWithKeyPath:speed:", CFSTR("position"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)MEMORY[0x1E0CB3B18];
  -[CKBrowserDragStickerView dropShadowLayerStartPosition](self, "dropShadowLayerStartPosition");
  objc_msgSend(v28, "valueWithCGPoint:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setToValue:", v29);

  v131 = v27;
  objc_msgSend(v27, "setBeginTime:", CACurrentMediaTime() + 0.18);
  -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "presentationLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "opacity");
  LODWORD(v23) = v32;
  -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = LODWORD(v23);
  objc_msgSend(v33, "setOpacity:", v34);

  v35 = (void *)objc_opt_class();
  LODWORD(v36) = 1066192077;
  objc_msgSend(v35, "springAnimationWithKeyPath:speed:", CFSTR("opacity"), v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setToValue:", &unk_1E28715C0);
  v130 = v37;
  objc_msgSend(v37, "setBeginTime:", CACurrentMediaTime() + 0.18);
  -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "presentationLayer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "valueForKey:", CFSTR("transform.scale.xy"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setValue:forKey:", v41, CFSTR("transform.scale.xy"));

  v42 = (void *)objc_opt_class();
  LODWORD(v43) = 1066192077;
  objc_msgSend(v42, "springAnimationWithKeyPath:speed:", CFSTR("transform.scale.xy"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setToValue:", &unk_1E28715D0);
  objc_msgSend(v44, "setBeginTime:", CACurrentMediaTime() + 0.18);
  -[CKBrowserDragStickerView meshLayer](self, "meshLayer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "presentationLayer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "position");
  v48 = v47;
  v50 = v49;

  v51 = (void *)objc_opt_class();
  LODWORD(v52) = 1050253722;
  objc_msgSend(v51, "springAnimationWithKeyPath:speed:", CFSTR("position"), v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v48, v50);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFromValue:", v54);

  v55 = (void *)MEMORY[0x1E0CB3B18];
  -[CKBrowserDragStickerView meshLayerStartPosition](self, "meshLayerStartPosition");
  objc_msgSend(v55, "valueWithCGPoint:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setToValue:", v56);

  -[CKBrowserDragStickerView peelLayer](self, "peelLayer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "presentationLayer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "position");
  v60 = v59;
  v62 = v61;

  v63 = (void *)objc_opt_class();
  LODWORD(v64) = 1050253722;
  objc_msgSend(v63, "springAnimationWithKeyPath:speed:", CFSTR("position"), v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v60, v62);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setFromValue:", v66);

  v67 = (void *)MEMORY[0x1E0CB3B18];
  -[CKBrowserDragStickerView peelLayerStartPosition](self, "peelLayerStartPosition");
  objc_msgSend(v67, "valueWithCGPoint:");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setToValue:", v68);

  -[CKBrowserDragStickerView shineLayer](self, "shineLayer");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "presentationLayer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "position");
  v72 = v71;
  v74 = v73;

  v75 = (void *)objc_opt_class();
  LODWORD(v76) = 1050253722;
  objc_msgSend(v75, "springAnimationWithKeyPath:speed:", CFSTR("position"), v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v72, v74);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setFromValue:", v78);

  v79 = (void *)MEMORY[0x1E0CB3B18];
  -[CKBrowserDragStickerView shineLayerStartPosition](self, "shineLayerStartPosition");
  objc_msgSend(v79, "valueWithCGPoint:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setToValue:", v80);

  -[CKBrowserDragStickerView shadowLayer](self, "shadowLayer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "presentationLayer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "position");
  v84 = v83;
  v86 = v85;

  v87 = (void *)objc_opt_class();
  LODWORD(v88) = 1066192077;
  objc_msgSend(v87, "springAnimationWithKeyPath:speed:", CFSTR("position"), v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v84, v86);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setFromValue:", v90);

  v91 = (void *)MEMORY[0x1E0CB3B18];
  -[CKBrowserDragStickerView shadowLayerStartPosition](self, "shadowLayerStartPosition");
  objc_msgSend(v91, "valueWithCGPoint:");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setToValue:", v92);

  objc_msgSend(v89, "setBeginTime:", CACurrentMediaTime() + 0.18);
  if (v127)
  {
    -[CKBrowserDragStickerView layer](self, "layer");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "position");
    v95 = v94;
    v97 = v96;

    v98 = (void *)objc_opt_class();
    LODWORD(v99) = 1066192077;
    objc_msgSend(v98, "springAnimationWithKeyPath:speed:", CFSTR("position"), v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v95, v97);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setFromValue:", v101);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setToValue:", v102);

    v103 = (void *)objc_opt_class();
    LODWORD(v104) = 1066192077;
    objc_msgSend(v103, "springAnimationWithKeyPath:speed:", CFSTR("opacity"), v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "setFromValue:", &unk_1E2871560);
    objc_msgSend(v105, "setToValue:", &unk_1E28715C0);
  }
  else
  {
    v100 = 0;
    v105 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.310000002);
  -[CKBrowserDragStickerView layer](self, "layer");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "addAnimation:forKey:", v132, CFSTR("scaleUpAnimation"));

  -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "addAnimation:forKey:", v131, CFSTR("dropShadowPositionAnimation"));

  -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "addAnimation:forKey:", v130, CFSTR("dropShadowOpacityAnimation"));

  -[CKBrowserDragStickerView dropShadowLayer](self, "dropShadowLayer");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "addAnimation:forKey:", v44, CFSTR("dropShadowScaleAnimation"));

  -[CKBrowserDragStickerView meshLayer](self, "meshLayer");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "addAnimation:forKey:", v53, CFSTR("meshAnimation"));

  -[CKBrowserDragStickerView peelLayer](self, "peelLayer");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addAnimation:forKey:", v65, CFSTR("peelAnimation"));

  -[CKBrowserDragStickerView shineLayer](self, "shineLayer");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "addAnimation:forKey:", v77, CFSTR("shineAnimation"));

  -[CKBrowserDragStickerView shadowLayer](self, "shadowLayer");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "addAnimation:forKey:", v89, CFSTR("shadowAnimation"));

  if (v100)
  {
    -[CKBrowserDragStickerView layer](self, "layer");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "addAnimation:forKey:", v100, CFSTR("moveAnimation"));

  }
  if (v105)
  {
    -[CKBrowserDragStickerView layer](self, "layer");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "addAnimation:forKey:", v105, CFSTR("opacityAnimation"));

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (v128)
  {
    v116 = dispatch_time(0, 750000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke;
    block[3] = &unk_1E274AED0;
    v117 = v129;
    v137 = v129;
    v118 = v129;
    dispatch_after(v116, MEMORY[0x1E0C80D38], block);
    v119 = v137;
  }
  else
  {
    v138.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v120 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    width = self->_rasterizedImageSize.width;
    height = self->_rasterizedImageSize.height;
    v138.origin.y = v120;
    v138.size.width = width;
    v138.size.height = height;
    v123 = x - CGRectGetWidth(v138) * 0.5;
    v139.origin.x = v123;
    v139.origin.y = v120;
    v139.size.width = width;
    v139.size.height = height;
    v124 = CGRectGetHeight(v139);
    v125 = (void *)MEMORY[0x1E0CEABB0];
    v135[0] = MEMORY[0x1E0C809B0];
    v135[1] = 3221225472;
    v135[2] = __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2;
    v135[3] = &unk_1E274B8B8;
    v135[4] = self;
    *(CGFloat *)&v135[5] = v123;
    *(double *)&v135[6] = y - v124 * 0.5;
    *(CGFloat *)&v135[7] = width;
    *(CGFloat *)&v135[8] = height;
    v133[0] = MEMORY[0x1E0C809B0];
    v133[1] = 3221225472;
    v133[2] = __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3;
    v133[3] = &unk_1E274C308;
    v117 = v129;
    v134 = v129;
    v126 = v129;
    objc_msgSend(v125, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v135, v133, 0.75, 0.0, 0.6, 0.0);
    v119 = v134;
  }

}

uint64_t __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.999);
}

uint64_t __98__CKBrowserDragStickerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)applyTransforms
{
  _BOOL4 v3;
  double v4;
  CGFloat v5;
  double dragViewScale;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v3 = -[CKBrowserDragStickerView isScaledDown](self, "isScaledDown");
  v4 = 0.714285714;
  v5 = 1.0;
  if (!v3)
    v4 = 1.0;
  dragViewScale = self->_dragViewScale;
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, v4 * dragViewScale * self->_elasticScaleX, v4 * dragViewScale * self->_elasticScaleY);
  v7 = self->_rotationAngle + self->_elasticRotationAngle;
  v13 = v15;
  CGAffineTransformRotate(&v14, &v13, v7);
  v15 = v14;
  if (!-[CKBrowserDragStickerView isScaledDown](self, "isScaledDown"))
  {
    -[CKBrowserDragStickerView dragViewScaleUp](self, "dragViewScaleUp");
    v5 = v8;
  }
  v13 = v15;
  CGAffineTransformScale(&v14, &v13, v5, v5);
  v15 = v14;
  -[CKBrowserDragStickerView dragViewCenter](self, "dragViewCenter");
  v10 = v9;
  v12 = v11;
  v14 = v15;
  -[CKBrowserDragStickerView setTransform:](self, "setTransform:", &v14);
  if (!CKIsRunningInMacCatalyst())
    -[CKBrowserDragStickerView setCenter:](self, "setCenter:", v10, v12);
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
  -[CKBrowserDragStickerView applyTransforms](self, "applyTransforms");
}

- (void)setDragViewScale:(double)a3
{
  double v3;

  v3 = fmin(a3, 2.0);
  if (v3 < 1.0)
    v3 = 1.0;
  if (self->_dragViewScale != v3)
  {
    self->_dragViewScale = v3;
    -[CKBrowserDragStickerView applyTransforms](self, "applyTransforms");
  }
}

- (void)setPlusImageViewHidden:(BOOL)a3
{
  void *v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  CKBrowserDragStickerView *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  CKBrowserDragStickerView *v30;
  CGRect v31;
  CGRect v32;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CEABB0];
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __51__CKBrowserDragStickerView_setPlusImageViewHidden___block_invoke;
    v29 = &unk_1E274A208;
    v30 = self;
    v5 = &v26;
  }
  else
  {
    -[CKBrowserDragStickerView plusImageView](self, "plusImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 38.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("plus.circle.fill"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithSymbolConfiguration:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v9);
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v11);

      v12 = objc_alloc(MEMORY[0x1E0CEABB0]);
      v13 = (void *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v14);

      -[CKBrowserDragStickerView addSubview:](self, "addSubview:", v13);
      -[CKBrowserDragStickerView addSubview:](self, "addSubview:", v10);
      -[CKBrowserDragStickerView bounds](self, "bounds");
      objc_msgSend(v10, "setCenter:", v15 + -7.0, 7.0);
      objc_msgSend(v10, "frame");
      v32 = CGRectInset(v31, 4.0, 4.0);
      objc_msgSend(v13, "setFrame:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
      objc_msgSend(v13, "bounds");
      v17 = v16 * 0.5;
      objc_msgSend(v13, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCornerRadius:", v17);

      -[CKBrowserDragStickerView setPlusImageView:](self, "setPlusImageView:", v10);
      -[CKBrowserDragStickerView setWhiteBackground:](self, "setWhiteBackground:", v13);
      -[CKBrowserDragStickerView plusImageView](self, "plusImageView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAlpha:", 0.0);

      -[CKBrowserDragStickerView whiteBackground](self, "whiteBackground");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAlpha:", 0.0);

    }
    v4 = (void *)MEMORY[0x1E0CEABB0];
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __51__CKBrowserDragStickerView_setPlusImageViewHidden___block_invoke_2;
    v24 = &unk_1E274A208;
    v25 = self;
    v5 = &v21;
  }
  objc_msgSend(v4, "animateWithDuration:animations:", v5, 0.2, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
}

void __51__CKBrowserDragStickerView_setPlusImageViewHidden___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "plusImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "whiteBackground");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __51__CKBrowserDragStickerView_setPlusImageViewHidden___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "plusImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "whiteBackground");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (CGPoint)dragViewCenter
{
  float64x2_t v2;
  float64_t v3;
  float64x2_t v4;
  float64_t v5;
  float64x2_t v6;
  double v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v15;
  double v16;
  float64x2_t v17;
  double v18;
  float64_t v19;
  double v20;
  float64_t v21;
  CGPoint result;

  -[CKBrowserDragStickerView frame](self, "frame");
  v6 = *(float64x2_t *)(MEMORY[0x1E0C9D648] + 16);
  if (CKMainScreenScale_once_82 != -1)
  {
    v20 = v5;
    v21 = v4.f64[0];
    v18 = v3;
    v19 = v2.f64[0];
    v17 = *(float64x2_t *)(MEMORY[0x1E0C9D648] + 16);
    dispatch_once(&CKMainScreenScale_once_82, &__block_literal_global_420_0);
    v6 = v17;
    v3 = v18;
    v2.f64[0] = v19;
    v5 = v20;
    v4.f64[0] = v21;
  }
  if (*(double *)&CKMainScreenScale_sMainScreenScale_82 == 0.0)
    v7 = 1.0;
  else
    v7 = *(double *)&CKMainScreenScale_sMainScreenScale_82;
  v2.f64[1] = v3;
  v8 = vmulq_n_f64(v2, v7);
  v4.f64[1] = v5;
  v9 = vsubq_f64(vmulq_n_f64(v4, v7), vmulq_n_f64(v6, v7));
  __asm { FMOV            V2.2D, #0.5 }
  v15 = vmulq_n_f64(vaddq_f64(v8, vrndmq_f64(vmulq_f64(v9, _Q2))), 1.0 / v7);
  v16 = v15.f64[1];
  result.x = v15.f64[0];
  result.y = v16;
  return result;
}

- (double)dragViewRotation
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  -[CKBrowserDragStickerView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("transform.rotation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (double)dragViewScaleUp
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;
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
  double v19;

  -[CKBrowserDragStickerView rasterizedImageSize](self, "rasterizedImageSize");
  v4 = v3;
  -[CKBrowserDragStickerView initialSize](self, "initialSize");
  if (v4 < v5
    || (-[CKBrowserDragStickerView rasterizedImageSize](self, "rasterizedImageSize"),
        v7 = v6,
        -[CKBrowserDragStickerView initialSize](self, "initialSize"),
        result = 1.0,
        v7 < v9))
  {
    -[CKBrowserDragStickerView rasterizedImageSize](self, "rasterizedImageSize");
    v11 = v10;
    -[CKBrowserDragStickerView rasterizedImageSize](self, "rasterizedImageSize");
    v13 = v12;
    -[CKBrowserDragStickerView initialSize](self, "initialSize");
    v15 = v14;
    v17 = v16;
    -[CKBrowserDragStickerView rasterizedImageSize](self, "rasterizedImageSize");
    if (v11 <= v13)
      return v15 / v18;
    else
      return v17 / v19;
  }
  return result;
}

- (id)scaleImage:(id)a3 toSize:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGSize v13;

  height = a4.height;
  width = a4.width;
  v6 = (void *)MEMORY[0x1E0CEA950];
  v7 = a3;
  objc_msgSend(v6, "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = (v9 + v9) * 1.4;
  v13.width = width;
  v13.height = height;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v10);

  objc_msgSend(v7, "drawInRect:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v11;
}

- (id)peelMaskImageFromImage:(id)a3
{
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  CGSize v16;
  CGRect v17;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v5 = a3;
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;
  v16.width = v7;
  v16.height = v9;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v12);

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFill");

  v17.origin.x = v3;
  v17.origin.y = v4;
  v17.size.width = v7;
  v17.size.height = v9;
  UIRectFillUsingBlendMode(v17, kCGBlendModeCopy);
  objc_msgSend(v5, "drawInRect:blendMode:alpha:", 22, v3, v4, v7, v9, 1.0);

  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v14;
}

- (void)attachElasticEffectsForLocation:(CGPoint)a3
{
  double y;
  double x;
  CKElasticFunction *v6;
  CKElasticFunction *elasticFunctionPositionX;
  CKElasticFunction *v8;
  CKElasticFunction *elasticFunctionPositionY;
  CKElasticFunction *v10;
  CKElasticFunction *elasticFunctionRotation;
  CKElasticFunction *v12;
  CKElasticFunction *elasticFunctionScaleX;
  CKElasticFunction *v14;
  CKElasticFunction *elasticFunctionScaleY;
  void *v16;
  CADisplayLink *v17;
  CADisplayLink *displayLink;
  CADisplayLink *v19;
  void *v20;

  y = a3.y;
  x = a3.x;
  +[CKElasticFunction functionWithTension:friction:initialValue:](CKElasticFunction, "functionWithTension:friction:initialValue:", 550.0, 20.0, a3.x);
  v6 = (CKElasticFunction *)objc_claimAutoreleasedReturnValue();
  elasticFunctionPositionX = self->_elasticFunctionPositionX;
  self->_elasticFunctionPositionX = v6;

  -[CKElasticFunction setInput:](self->_elasticFunctionPositionX, "setInput:", x);
  +[CKElasticFunction functionWithTension:friction:initialValue:](CKElasticFunction, "functionWithTension:friction:initialValue:", 550.0, 20.0, y);
  v8 = (CKElasticFunction *)objc_claimAutoreleasedReturnValue();
  elasticFunctionPositionY = self->_elasticFunctionPositionY;
  self->_elasticFunctionPositionY = v8;

  -[CKElasticFunction setInput:](self->_elasticFunctionPositionY, "setInput:", y);
  +[CKElasticFunction functionWithTension:friction:initialValue:](CKElasticFunction, "functionWithTension:friction:initialValue:", 350.0, 15.0, 0.0);
  v10 = (CKElasticFunction *)objc_claimAutoreleasedReturnValue();
  elasticFunctionRotation = self->_elasticFunctionRotation;
  self->_elasticFunctionRotation = v10;

  self->_elasticRotationAngle = 0.0;
  +[CKElasticFunction functionWithTension:friction:initialValue:](CKElasticFunction, "functionWithTension:friction:initialValue:", 350.0, 20.0, 100.0);
  v12 = (CKElasticFunction *)objc_claimAutoreleasedReturnValue();
  elasticFunctionScaleX = self->_elasticFunctionScaleX;
  self->_elasticFunctionScaleX = v12;

  -[CKElasticFunction setInput:](self->_elasticFunctionScaleX, "setInput:", 100.0);
  self->_elasticScaleX = 1.0;
  +[CKElasticFunction functionWithTension:friction:initialValue:](CKElasticFunction, "functionWithTension:friction:initialValue:", 350.0, 20.0, 100.0);
  v14 = (CKElasticFunction *)objc_claimAutoreleasedReturnValue();
  elasticFunctionScaleY = self->_elasticFunctionScaleY;
  self->_elasticFunctionScaleY = v14;

  -[CKElasticFunction setInput:](self->_elasticFunctionScaleY, "setInput:", 100.0);
  self->_elasticScaleY = 1.0;
  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayLinkWithTarget:selector:", self, sel__displayLinkCallback_);
    v17 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v17;

    v19 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v19, "addToRunLoop:forMode:", v20, *MEMORY[0x1E0C99860]);

    self->_elasticLastTime = CACurrentMediaTime();
    self->_elasticRemainingTime = 0.0;
  }
}

- (void)updateElasticEffectsForLocation:(CGPoint)a3
{
  double y;
  double x;
  CKElasticFunction *elasticFunctionRotation;
  double v7;
  CKElasticFunction *elasticFunctionScaleX;
  double v9;
  CKElasticFunction *elasticFunctionScaleY;
  double v11;

  y = a3.y;
  x = a3.x;
  if (-[CKBrowserDragStickerView isPressed](self, "isPressed"))
  {
    -[CKElasticFunction setInput:](self->_elasticFunctionPositionX, "setInput:", x);
    -[CKElasticFunction setInput:](self->_elasticFunctionPositionY, "setInput:", y);
    elasticFunctionRotation = self->_elasticFunctionRotation;
    -[CKElasticFunction velocity](self->_elasticFunctionPositionX, "velocity");
    -[CKElasticFunction setInput:](elasticFunctionRotation, "setInput:", (v7 + 1000.0) / 2000.0 * -24.0 + 12.0);
    elasticFunctionScaleX = self->_elasticFunctionScaleX;
    -[CKElasticFunction velocity](self->_elasticFunctionPositionY, "velocity");
    -[CKElasticFunction setInput:](elasticFunctionScaleX, "setInput:", v9 / 1000.0 * -4.0 + 100.0);
    elasticFunctionScaleY = self->_elasticFunctionScaleY;
    -[CKElasticFunction velocity](self->_elasticFunctionPositionY, "velocity");
    -[CKElasticFunction setInput:](elasticFunctionScaleY, "setInput:", v11 / 1000.0 * 12.0 + 100.0);
  }
}

- (void)detachElasticEffects
{
  CADisplayLink *displayLink;
  CKElasticFunction *elasticFunctionPositionX;
  CKElasticFunction *elasticFunctionPositionY;
  CKElasticFunction *elasticFunctionRotation;
  CKElasticFunction *elasticFunctionScaleX;
  CKElasticFunction *elasticFunctionScaleY;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  elasticFunctionPositionX = self->_elasticFunctionPositionX;
  self->_elasticFunctionPositionX = 0;

  elasticFunctionPositionY = self->_elasticFunctionPositionY;
  self->_elasticFunctionPositionY = 0;

  elasticFunctionRotation = self->_elasticFunctionRotation;
  self->_elasticFunctionRotation = 0;

  elasticFunctionScaleX = self->_elasticFunctionScaleX;
  self->_elasticFunctionScaleX = 0;

  elasticFunctionScaleY = self->_elasticFunctionScaleY;
  self->_elasticFunctionScaleY = 0;

}

- (void)_displayLinkCallback:(id)a3
{
  double v4;
  double elasticLastTime;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  double Height;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;

  v4 = CACurrentMediaTime();
  elasticLastTime = self->_elasticLastTime;
  self->_elasticLastTime = v4;
  v6 = v4 - elasticLastTime + self->_elasticRemainingTime;
  self->_elasticRemainingTime = v6;
  if (v6 >= 0.001)
  {
    do
    {
      -[CKElasticFunction step](self->_elasticFunctionPositionX, "step");
      -[CKElasticFunction step](self->_elasticFunctionPositionY, "step");
      -[CKElasticFunction step](self->_elasticFunctionRotation, "step");
      -[CKElasticFunction step](self->_elasticFunctionScaleX, "step");
      -[CKElasticFunction step](self->_elasticFunctionScaleY, "step");
      v7 = self->_elasticRemainingTime - 0.001;
      self->_elasticRemainingTime = v7;
    }
    while (v7 >= 0.001);
  }
  -[CKElasticFunction output](self->_elasticFunctionPositionX, "output");
  v9 = v8;
  -[CKElasticFunction output](self->_elasticFunctionPositionY, "output");
  v11 = v10;
  v12 = -[CKBrowserDragStickerView isScaledDown](self, "isScaledDown");
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  Height = CGRectGetHeight(v29);

  if (-[CKBrowserDragStickerView canPeel](self, "canPeel") && !v12)
  {
    v15 = 100.0;
    if (Height < 568.0)
      v15 = 85.0;
    if (vabdd_f64(v11, self->_initialDragStartPosition.y) >= v15)
    {
      -[CKBrowserDragStickerView setScaledDown:](self, "setScaledDown:", 1);
      -[CKBrowserDragStickerView animateScaleDown](self, "animateScaleDown");
    }
  }
  -[CKBrowserDragStickerView anchorOffset](self, "anchorOffset");
  v17 = v16;
  v19 = v18;
  if (!CKIsRunningInMacCatalyst())
    -[CKBrowserDragStickerView setCenter:](self, "setCenter:", v9 - v17, v11 - v19);
  -[CKElasticFunction output](self->_elasticFunctionRotation, "output");
  v21 = v20 * 3.14159265 / 180.0;
  v22 = fabs(v21);
  v23 = -v21;
  if (v22 <= 0.001)
    v23 = 0.0;
  self->_elasticRotationAngle = v23;
  -[CKElasticFunction output](self->_elasticFunctionScaleX, "output");
  v25 = v24 / 100.0;
  -[CKElasticFunction output](self->_elasticFunctionScaleY, "output");
  v27 = v26 / 100.0;
  if (fabs(v25 + -1.0) <= 0.001)
    v28 = 1.0;
  else
    v28 = v25;
  self->_elasticScaleX = v28;
  if (fabs(v27 + -1.0) <= 0.001)
    v27 = 1.0;
  self->_elasticScaleY = v27;
  -[CKBrowserDragStickerView applyTransforms](self, "applyTransforms");
}

- (void)updateAnimationTimerObserving
{
  void *v3;
  void *v4;
  id v5;

  -[CKBrowserDragStickerView dragImageFrames](self, "dragImageFrames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {

    goto LABEL_5;
  }
  -[CKBrowserDragStickerView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
LABEL_5:
    +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAnimationTimerObserver:", self);
    goto LABEL_6;
  }
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnimationTimerObserver:", self);
LABEL_6:

}

- (void)animationTimerFired:(double)a3
{
  void *v5;
  unint64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  -[CKBrowserDragStickerView dragImageFrames](self, "dragImageFrames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
  {
    -[CKBrowserDragStickerView dragImageFrames](self, "dragImageFrames");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v7 = -[CKAnimatedImage frameIndexForAnimationTime:](self->_dragImage, "frameIndexForAnimationTime:", a3);
    objc_msgSend(v17, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragStickerView setCurrentFrameImage:](self, "setCurrentFrameImage:", v8);
    -[CKBrowserDragStickerView peelImageLayer](self, "peelImageLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_retainAutorelease(v8);
    objc_msgSend(v9, "setContents:", objc_msgSend(v10, "CGImage"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserDragStickerView peelMaskImageCache](self, "peelMaskImageCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[CKBrowserDragStickerView peelMaskImageFromImage:](self, "peelMaskImageFromImage:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserDragStickerView peelMaskImageCache](self, "peelMaskImageCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v13, v11);

    }
    -[CKBrowserDragStickerView peelMaskLayer](self, "peelMaskLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_retainAutorelease(v13);
    objc_msgSend(v15, "setContents:", objc_msgSend(v16, "CGImage"));

  }
}

- (CKBrowserDraggedSticker)draggedSticker
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CKBrowserDraggedSticker *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  CKBrowserDraggedSticker *v25;

  -[CKBrowserDragStickerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKBrowserDragStickerView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragStickerView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = [CKBrowserDraggedSticker alloc];
  -[CKBrowserDragStickerView dragImage](self, "dragImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserDragStickerView dragViewScale](self, "dragViewScale");
  v23 = v22;
  -[CKBrowserDragStickerView rotationAngle](self, "rotationAngle");
  v25 = -[CKBrowserDraggedSticker initWithAnimatedImage:frame:scale:rotationAngle:](v20, "initWithAnimatedImage:frame:scale:rotationAngle:", v21, v13, v15, v17, v19, v23, v24);

  return v25;
}

- (CGPoint)initialDragStartPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialDragStartPosition.x;
  y = self->_initialDragStartPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialDragStartPosition:(CGPoint)a3
{
  self->_initialDragStartPosition = a3;
}

- (double)initialScale
{
  return self->_initialScale;
}

- (void)setInitialScale:(double)a3
{
  self->_initialScale = a3;
}

- (CGSize)initialSize
{
  double width;
  double height;
  CGSize result;

  width = self->_initialSize.width;
  height = self->_initialSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInitialSize:(CGSize)a3
{
  self->_initialSize = a3;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (double)dragViewScale
{
  return self->_dragViewScale;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (void)setPressed:(BOOL)a3
{
  self->_pressed = a3;
}

- (BOOL)userExplicitlyUnpausedAnimation
{
  return self->_userExplicitlyUnpausedAnimation;
}

- (void)setUserExplicitlyUnpausedAnimation:(BOOL)a3
{
  self->_userExplicitlyUnpausedAnimation = a3;
}

- (BOOL)canPeel
{
  return self->_canPeel;
}

- (void)setCanPeel:(BOOL)a3
{
  self->_canPeel = a3;
}

- (UIImage)currentFrameImage
{
  return self->_currentFrameImage;
}

- (void)setCurrentFrameImage:(id)a3
{
  objc_storeStrong((id *)&self->_currentFrameImage, a3);
}

- (CALayer)perspectiveLayer
{
  return self->_perspectiveLayer;
}

- (void)setPerspectiveLayer:(id)a3
{
  objc_storeStrong((id *)&self->_perspectiveLayer, a3);
}

- (CGSize)rasterizedImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_rasterizedImageSize.width;
  height = self->_rasterizedImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRasterizedImageSize:(CGSize)a3
{
  self->_rasterizedImageSize = a3;
}

- (CALayer)shineLayer
{
  return self->_shineLayer;
}

- (void)setShineLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shineLayer, a3);
}

- (CALayer)shadowLayer
{
  return self->_shadowLayer;
}

- (void)setShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shadowLayer, a3);
}

- (CALayer)dropShadowLayer
{
  return self->_dropShadowLayer;
}

- (void)setDropShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dropShadowLayer, a3);
}

- (CALayer)peelLayer
{
  return self->_peelLayer;
}

- (void)setPeelLayer:(id)a3
{
  objc_storeStrong((id *)&self->_peelLayer, a3);
}

- (CALayer)meshLayer
{
  return self->_meshLayer;
}

- (void)setMeshLayer:(id)a3
{
  objc_storeStrong((id *)&self->_meshLayer, a3);
}

- (CGPoint)meshLayerStartPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_meshLayerStartPosition.x;
  y = self->_meshLayerStartPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMeshLayerStartPosition:(CGPoint)a3
{
  self->_meshLayerStartPosition = a3;
}

- (CGPoint)peelLayerStartPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_peelLayerStartPosition.x;
  y = self->_peelLayerStartPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPeelLayerStartPosition:(CGPoint)a3
{
  self->_peelLayerStartPosition = a3;
}

- (CGPoint)shineLayerStartPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_shineLayerStartPosition.x;
  y = self->_shineLayerStartPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setShineLayerStartPosition:(CGPoint)a3
{
  self->_shineLayerStartPosition = a3;
}

- (CGPoint)shadowLayerStartPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_shadowLayerStartPosition.x;
  y = self->_shadowLayerStartPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setShadowLayerStartPosition:(CGPoint)a3
{
  self->_shadowLayerStartPosition = a3;
}

- (CGPoint)dropShadowLayerStartPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_dropShadowLayerStartPosition.x;
  y = self->_dropShadowLayerStartPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDropShadowLayerStartPosition:(CGPoint)a3
{
  self->_dropShadowLayerStartPosition = a3;
}

- (NSArray)dragImageFrames
{
  return self->_dragImageFrames;
}

- (void)setDragImageFrames:(id)a3
{
  objc_storeStrong((id *)&self->_dragImageFrames, a3);
}

- (UIView)plusImageView
{
  return self->_plusImageView;
}

- (void)setPlusImageView:(id)a3
{
  objc_storeStrong((id *)&self->_plusImageView, a3);
}

- (UIView)whiteBackground
{
  return self->_whiteBackground;
}

- (void)setWhiteBackground:(id)a3
{
  objc_storeStrong((id *)&self->_whiteBackground, a3);
}

- (CALayer)peelImageLayer
{
  return self->_peelImageLayer;
}

- (void)setPeelImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_peelImageLayer, a3);
}

- (CALayer)peelMaskLayer
{
  return self->_peelMaskLayer;
}

- (void)setPeelMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_peelMaskLayer, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CGPoint)anchorOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorOffset.x;
  y = self->_anchorOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnchorOffset:(CGPoint)a3
{
  self->_anchorOffset = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (double)elasticLastTime
{
  return self->_elasticLastTime;
}

- (void)setElasticLastTime:(double)a3
{
  self->_elasticLastTime = a3;
}

- (double)elasticRemainingTime
{
  return self->_elasticRemainingTime;
}

- (void)setElasticRemainingTime:(double)a3
{
  self->_elasticRemainingTime = a3;
}

- (CKElasticFunction)elasticFunctionPositionX
{
  return self->_elasticFunctionPositionX;
}

- (void)setElasticFunctionPositionX:(id)a3
{
  objc_storeStrong((id *)&self->_elasticFunctionPositionX, a3);
}

- (CKElasticFunction)elasticFunctionPositionY
{
  return self->_elasticFunctionPositionY;
}

- (void)setElasticFunctionPositionY:(id)a3
{
  objc_storeStrong((id *)&self->_elasticFunctionPositionY, a3);
}

- (CKElasticFunction)elasticFunctionRotation
{
  return self->_elasticFunctionRotation;
}

- (void)setElasticFunctionRotation:(id)a3
{
  objc_storeStrong((id *)&self->_elasticFunctionRotation, a3);
}

- (double)elasticRotationAngle
{
  return self->_elasticRotationAngle;
}

- (void)setElasticRotationAngle:(double)a3
{
  self->_elasticRotationAngle = a3;
}

- (CKElasticFunction)elasticFunctionScaleX
{
  return self->_elasticFunctionScaleX;
}

- (void)setElasticFunctionScaleX:(id)a3
{
  objc_storeStrong((id *)&self->_elasticFunctionScaleX, a3);
}

- (CKElasticFunction)elasticFunctionScaleY
{
  return self->_elasticFunctionScaleY;
}

- (void)setElasticFunctionScaleY:(id)a3
{
  objc_storeStrong((id *)&self->_elasticFunctionScaleY, a3);
}

- (double)elasticScaleX
{
  return self->_elasticScaleX;
}

- (void)setElasticScaleX:(double)a3
{
  self->_elasticScaleX = a3;
}

- (double)elasticScaleY
{
  return self->_elasticScaleY;
}

- (void)setElasticScaleY:(double)a3
{
  self->_elasticScaleY = a3;
}

- (BOOL)isScaledDown
{
  return self->_scaledDown;
}

- (void)setScaledDown:(BOOL)a3
{
  self->_scaledDown = a3;
}

- (BOOL)canRotate
{
  return self->_canRotate;
}

- (void)setCanRotate:(BOOL)a3
{
  self->_canRotate = a3;
}

- (NSMutableDictionary)peelMaskImageCache
{
  return self->_peelMaskImageCache;
}

- (void)setPeelMaskImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_peelMaskImageCache, a3);
}

- (CKAnimatedImage)dragImage
{
  return self->_dragImage;
}

- (void)setDragImage:(id)a3
{
  objc_storeStrong((id *)&self->_dragImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragImage, 0);
  objc_storeStrong((id *)&self->_peelMaskImageCache, 0);
  objc_storeStrong((id *)&self->_elasticFunctionScaleY, 0);
  objc_storeStrong((id *)&self->_elasticFunctionScaleX, 0);
  objc_storeStrong((id *)&self->_elasticFunctionRotation, 0);
  objc_storeStrong((id *)&self->_elasticFunctionPositionY, 0);
  objc_storeStrong((id *)&self->_elasticFunctionPositionX, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_peelMaskLayer, 0);
  objc_storeStrong((id *)&self->_peelImageLayer, 0);
  objc_storeStrong((id *)&self->_whiteBackground, 0);
  objc_storeStrong((id *)&self->_plusImageView, 0);
  objc_storeStrong((id *)&self->_dragImageFrames, 0);
  objc_storeStrong((id *)&self->_meshLayer, 0);
  objc_storeStrong((id *)&self->_peelLayer, 0);
  objc_storeStrong((id *)&self->_dropShadowLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_shineLayer, 0);
  objc_storeStrong((id *)&self->_perspectiveLayer, 0);
  objc_storeStrong((id *)&self->_currentFrameImage, 0);
}

@end
