@implementation _MSStickerDragPreviewContainerView

- (_MSStickerDragPreviewContainerView)initWithIsDropAnimation:(BOOL)a3
{
  _MSStickerDragPreviewContainerView *v4;
  _MSStickerDragPreviewContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_MSStickerDragPreviewContainerView;
  v4 = -[_MSStickerDragPreviewContainerView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_isDropAnimation = a3;
    -[_MSStickerDragPreviewContainerView setClipsToBounds:](v4, "setClipsToBounds:", 0);
  }
  return v5;
}

+ (id)meshTransformWithContentScale:(double)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68___MSStickerDragPreviewContainerView_meshTransformWithContentScale___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&block[4] = a3;
  if (meshTransformWithContentScale__onceToken != -1)
    dispatch_once(&meshTransformWithContentScale__onceToken, block);
  return (id)meshTransformWithContentScale____mesh;
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

+ (id)shadowPropertiesForDrag
{
  objc_class *v2;
  id v3;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  v2 = (objc_class *)MEMORY[0x1DF0A9E4C](CFSTR("_UIDragPreviewShadowProperties"), CFSTR("UIKit"));
  if (v2)
  {
    v3 = objc_alloc_init(v2);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "setShadowType:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      memset(&v7, 0, sizeof(v7));
      CGAffineTransformMakeTranslation(&v7, 0.0, 23.0);
      v5 = v7;
      CGAffineTransformScale(&v6, &v5, 1.12, 1.12);
      v7 = v6;
      objc_msgSend(v3, "setLiftedTransform:", &v6);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "setLiftedAlpha:", 0.23);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (CGAffineTransform)targetPreviewTransform
{
  return CGAffineTransformMakeScale(retstr, 1.25, 1.25);
}

- (CGSize)initialSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_MSStickerDragPreviewContainerView bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGSize)rasterizedImageSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[_MSStickerDragPreviewContainerView bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
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

  -[_MSStickerDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize");
  v4 = v3;
  -[_MSStickerDragPreviewContainerView initialSize](self, "initialSize");
  if (v4 < v5
    || (-[_MSStickerDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize"),
        v7 = v6,
        -[_MSStickerDragPreviewContainerView initialSize](self, "initialSize"),
        result = 1.0,
        v7 < v9))
  {
    -[_MSStickerDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize");
    v11 = v10;
    -[_MSStickerDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize");
    v13 = v12;
    -[_MSStickerDragPreviewContainerView initialSize](self, "initialSize");
    v15 = v14;
    v17 = v16;
    -[_MSStickerDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize");
    if (v11 <= v13)
      return v15 / v18;
    else
      return v17 / v19;
  }
  return result;
}

- (double)dragViewScale
{
  return 1.0;
}

- (void)finalizeDropIfNecessary
{
  void *v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void);
  void *v20;
  void (**v21)(void);
  int v22;
  _MSStickerDragPreviewContainerView *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (-[_MSStickerDragPreviewContainerView dropAnimationIsComplete](self, "dropAnimationIsComplete"))
  {
    -[_MSStickerDragPreviewContainerView clientDropCompletion](self, "clientDropCompletion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

LABEL_14:
      ms_defaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if (-[_MSStickerDragPreviewContainerView dropAnimationIsComplete](self, "dropAnimationIsComplete"))
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        -[_MSStickerDragPreviewContainerView clientDropCompletion](self, "clientDropCompletion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1DF0AA1E8]();
        if (-[_MSStickerDragPreviewContainerView defersFinalDropAnimationCompletion](self, "defersFinalDropAnimationCompletion"))
        {
          v15 = CFSTR("YES");
        }
        else
        {
          v15 = CFSTR("NO");
        }
        -[_MSStickerDragPreviewContainerView finalUIKitDropCompletion](self, "finalUIKitDropCompletion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1DF0AA1E8]();
        v22 = 134219010;
        v23 = self;
        v24 = 2112;
        v25 = v12;
        v26 = 2112;
        v27 = v14;
        v28 = 2112;
        v29 = v15;
        v30 = 2112;
        v31 = v17;
        _os_log_impl(&dword_1DB1A9000, v11, OS_LOG_TYPE_DEFAULT, "<_MSStickerDragPreviewContainerView: %p> finalizeDropIfNecessary finalizing drop. dropAnimationIsComplete: %@, clientDropCompletion: %@, defersFinalDropAnimationCompletion: %@, finalUIKitDropCompletion: %@", (uint8_t *)&v22, 0x34u);

      }
      -[_MSStickerDragPreviewContainerView clientDropCompletion](self, "clientDropCompletion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[_MSStickerDragPreviewContainerView clientDropCompletion](self, "clientDropCompletion");
        v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v19[2]();

        -[_MSStickerDragPreviewContainerView setClientDropCompletion:](self, "setClientDropCompletion:", 0);
      }
      -[_MSStickerDragPreviewContainerView finalUIKitDropCompletion](self, "finalUIKitDropCompletion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[_MSStickerDragPreviewContainerView finalUIKitDropCompletion](self, "finalUIKitDropCompletion");
        v21 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v21[2]();

        -[_MSStickerDragPreviewContainerView setFinalUIKitDropCompletion:](self, "setFinalUIKitDropCompletion:", 0);
      }
      return;
    }
    if (!-[_MSStickerDragPreviewContainerView defersFinalDropAnimationCompletion](self, "defersFinalDropAnimationCompletion"))goto LABEL_14;
  }
  ms_defaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (-[_MSStickerDragPreviewContainerView dropAnimationIsComplete](self, "dropAnimationIsComplete"))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    -[_MSStickerDragPreviewContainerView clientDropCompletion](self, "clientDropCompletion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1DF0AA1E8]();
    if (-[_MSStickerDragPreviewContainerView defersFinalDropAnimationCompletion](self, "defersFinalDropAnimationCompletion"))
    {
      v8 = CFSTR("YES");
    }
    else
    {
      v8 = CFSTR("NO");
    }
    -[_MSStickerDragPreviewContainerView finalUIKitDropCompletion](self, "finalUIKitDropCompletion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1DF0AA1E8]();
    v22 = 134219010;
    v23 = self;
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v8;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_1DB1A9000, v4, OS_LOG_TYPE_DEFAULT, "<_MSStickerDragPreviewContainerView: %p> finalizeDropIfNecessary not finalizing yet. dropAnimationIsComplete: %@, clientDropCompletion: %@, defersFinalDropAnimationCompletion: %@, finalUIKitDropCompletion: %@", (uint8_t *)&v22, 0x34u);

  }
}

- (void)performAfterDropAnimation:(id)a3
{
  -[_MSStickerDragPreviewContainerView setClientDropCompletion:](self, "setClientDropCompletion:", a3);
  -[_MSStickerDragPreviewContainerView finalizeDropIfNecessary](self, "finalizeDropIfNecessary");
}

- (void)setDefersFinalDropAnimationCompletion:(BOOL)a3
{
  if (self->_defersFinalDropAnimationCompletion != a3)
  {
    self->_defersFinalDropAnimationCompletion = a3;
    -[_MSStickerDragPreviewContainerView finalizeDropIfNecessary](self, "finalizeDropIfNecessary");
  }
}

- (void)setDropAnimationIsComplete:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  _MSStickerDragPreviewContainerView *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_dropAnimationIsComplete != a3)
  {
    v3 = a3;
    ms_defaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v7 = 134218242;
      v8 = self;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1DB1A9000, v5, OS_LOG_TYPE_DEFAULT, "<_MSStickerDragPreviewContainerView: %p> setDropAnimationIsComplete: %@", (uint8_t *)&v7, 0x16u);
    }

    self->_dropAnimationIsComplete = v3;
    -[_MSStickerDragPreviewContainerView finalizeDropIfNecessary](self, "finalizeDropIfNecessary");
  }
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
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  dispatch_time_t v86;
  id v87;
  void *v88;
  CGFloat v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat Height;
  void *v97;
  id v98;
  _BOOL4 v99;
  void *v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[9];
  _QWORD block[4];
  id v105;
  CGRect v106;
  CGRect v107;

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
  v100 = v14;
  v99 = v7;
  if (v6)
  {
    objc_msgSend(v14, "setToValue:", &unk_1EA267A90);
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB37E8];
    if (v7)
      -[_MSStickerDragPreviewContainerView dragViewScale](self, "dragViewScale");
    else
      -[_MSStickerDragPreviewContainerView dragViewScaleUp](self, "dragViewScaleUp");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setToValue:", v17);

  }
  -[_MSStickerDragPreviewContainerView meshLayer](self, "meshLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentationLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "position");
  v21 = v20;
  v23 = v22;

  v24 = (void *)objc_opt_class();
  LODWORD(v25) = 1050253722;
  objc_msgSend(v24, "springAnimationWithKeyPath:speed:", CFSTR("position"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v21, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFromValue:", v27);

  v28 = (void *)MEMORY[0x1E0CB3B18];
  -[_MSStickerDragPreviewContainerView meshLayerStartPosition](self, "meshLayerStartPosition");
  objc_msgSend(v28, "valueWithCGPoint:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setToValue:", v29);

  -[_MSStickerDragPreviewContainerView peelLayer](self, "peelLayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "presentationLayer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "position");
  v33 = v32;
  v35 = v34;

  v36 = (void *)objc_opt_class();
  LODWORD(v37) = 1050253722;
  objc_msgSend(v36, "springAnimationWithKeyPath:speed:", CFSTR("position"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v33, v35);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFromValue:", v39);

  v40 = (void *)MEMORY[0x1E0CB3B18];
  -[_MSStickerDragPreviewContainerView peelLayerStartPosition](self, "peelLayerStartPosition");
  objc_msgSend(v40, "valueWithCGPoint:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setToValue:", v41);

  -[_MSStickerDragPreviewContainerView shineLayer](self, "shineLayer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "presentationLayer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "position");
  v45 = v44;
  v47 = v46;

  v48 = (void *)objc_opt_class();
  LODWORD(v49) = 1050253722;
  objc_msgSend(v48, "springAnimationWithKeyPath:speed:", CFSTR("position"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v45, v47);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFromValue:", v51);

  v52 = (void *)MEMORY[0x1E0CB3B18];
  -[_MSStickerDragPreviewContainerView shineLayerStartPosition](self, "shineLayerStartPosition");
  objc_msgSend(v52, "valueWithCGPoint:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setToValue:", v53);

  -[_MSStickerDragPreviewContainerView shadowLayer](self, "shadowLayer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "presentationLayer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "position");
  v57 = v56;
  v59 = v58;

  v60 = (void *)objc_opt_class();
  LODWORD(v61) = 1066192077;
  objc_msgSend(v60, "springAnimationWithKeyPath:speed:", CFSTR("position"), v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v57, v59);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFromValue:", v63);

  v64 = (void *)MEMORY[0x1E0CB3B18];
  -[_MSStickerDragPreviewContainerView shadowLayerStartPosition](self, "shadowLayerStartPosition");
  objc_msgSend(v64, "valueWithCGPoint:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setToValue:", v65);

  objc_msgSend(v62, "setBeginTime:", CACurrentMediaTime() + 0.18);
  if (v6)
  {
    -[_MSStickerDragPreviewContainerView layer](self, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "position");
    v68 = v67;
    v70 = v69;

    v71 = (void *)objc_opt_class();
    LODWORD(v72) = 1066192077;
    objc_msgSend(v71, "springAnimationWithKeyPath:speed:", CFSTR("position"), v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v68, v70);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setFromValue:", v74);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", x, y);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setToValue:", v75);

    v76 = (void *)objc_opt_class();
    LODWORD(v77) = 1066192077;
    objc_msgSend(v76, "springAnimationWithKeyPath:speed:", CFSTR("opacity"), v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setFromValue:", &unk_1EA267AA0);
    objc_msgSend(v78, "setToValue:", &unk_1EA267AB0);
  }
  else
  {
    v73 = 0;
    v78 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.310000002);
  -[_MSStickerDragPreviewContainerView layer](self, "layer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addAnimation:forKey:", v100, CFSTR("scaleUpAnimation"));

  -[_MSStickerDragPreviewContainerView meshLayer](self, "meshLayer");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addAnimation:forKey:", v26, CFSTR("meshAnimation"));

  -[_MSStickerDragPreviewContainerView peelLayer](self, "peelLayer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "addAnimation:forKey:", v38, CFSTR("peelAnimation"));

  -[_MSStickerDragPreviewContainerView shineLayer](self, "shineLayer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addAnimation:forKey:", v50, CFSTR("shineAnimation"));

  -[_MSStickerDragPreviewContainerView shadowLayer](self, "shadowLayer");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "addAnimation:forKey:", v62, CFSTR("shadowAnimation"));

  if (v73)
  {
    -[_MSStickerDragPreviewContainerView layer](self, "layer");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addAnimation:forKey:", v73, CFSTR("moveAnimation"));

  }
  if (v78)
  {
    -[_MSStickerDragPreviewContainerView layer](self, "layer");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addAnimation:forKey:", v78, CFSTR("opacityAnimation"));

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  if (v99)
  {
    v86 = dispatch_time(0, 750000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108___MSStickerDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke;
    block[3] = &unk_1EA25C810;
    v105 = v11;
    v87 = v11;
    dispatch_after(v86, MEMORY[0x1E0C80D38], block);
    v88 = v105;
  }
  else
  {
    v89 = *MEMORY[0x1E0C9D538];
    v90 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[_MSStickerDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize");
    v92 = v91;
    v94 = v93;
    v106.origin.x = v89;
    v106.origin.y = v90;
    v106.size.width = v92;
    v106.size.height = v94;
    v95 = x - CGRectGetWidth(v106) * 0.5;
    v107.origin.x = v95;
    v107.origin.y = v90;
    v107.size.width = v92;
    v107.size.height = v94;
    Height = CGRectGetHeight(v107);
    v97 = (void *)MEMORY[0x1E0CEABB0];
    v103[0] = MEMORY[0x1E0C809B0];
    v103[1] = 3221225472;
    v103[2] = __108___MSStickerDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2;
    v103[3] = &unk_1EA25CBA8;
    v103[4] = self;
    *(CGFloat *)&v103[5] = v95;
    *(double *)&v103[6] = y - Height * 0.5;
    *(CGFloat *)&v103[7] = v92;
    *(CGFloat *)&v103[8] = v94;
    v101[0] = MEMORY[0x1E0C809B0];
    v101[1] = 3221225472;
    v101[2] = __108___MSStickerDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3;
    v101[3] = &unk_1EA25C730;
    v102 = v11;
    v98 = v11;
    objc_msgSend(v97, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v103, v101, 0.75, 0.0, 0.6, 0.0);
    v88 = v102;
  }

}

- (void)_preparePreviewContainerWithPreview:(id)a3 source:(id)a4 initialTransform:(CGAffineTransform *)a5
{
  id v7;
  double v8;
  double width;
  double v10;
  double height;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  _BOOL4 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double x;
  double y;
  double v30;
  double v31;
  void *v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  double MidX;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  uint64_t v74;
  void *v75;
  double v76;
  double v77;
  CGFloat v78;
  double v79;
  void *v80;
  id v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  CGFloat v91;
  double v92;
  void *v93;
  id v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  id v100;
  id v101;
  void *v102;
  uint64_t v103;
  void *v104;
  id v105;
  void *v106;
  uint64_t v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  id v127;
  double v128;
  void *v129;
  id v130;
  CATransform3D v131;
  CATransform3D v132;
  _OWORD v133[8];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _OWORD v142[5];
  uint64_t v143;
  unint64_t v144;
  __int128 v145;
  __int128 v146;
  CGAffineTransform m;
  CGAffineTransform v148;
  CGAffineTransform v149;
  const __CFString *v150;
  _QWORD v151[3];
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;

  v151[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v130 = a4;
  -[_MSStickerDragPreviewContainerView bounds](self, "bounds");
  width = v8;
  height = v10;
  -[_MSStickerDragPreviewContainerView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anchorPoint");
  v14 = v13;
  v16 = v15;

  memset(&v149, 0, sizeof(v149));
  v17 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v148.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v148.c = v17;
  *(_OWORD *)&v148.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v149, &v148, 1.25, 1.25);
  m = v149;
  memset(&v148, 0, sizeof(v148));
  CGAffineTransformInvert(&v148, &m);
  if (-[_MSStickerDragPreviewContainerView isDropAnimation](self, "isDropAnimation"))
  {
    objc_msgSend(v7, "convertSize:fromView:", self, width, height);
    v19 = v18;
    v21 = v20;
    objc_msgSend(v7, "convertPoint:fromView:", self, v14, v16);
    v14 = v22;
    m = v148;
    v152.origin.x = 0.0;
    v152.origin.y = 0.0;
    v152.size.width = v19;
    v152.size.height = v21;
    v153 = CGRectApplyAffineTransform(v152, &m);
    width = v153.size.width;
    height = v153.size.height;
  }
  v23 = -[_MSStickerDragPreviewContainerView isDropAnimation](self, "isDropAnimation");
  -[_MSStickerDragPreviewContainerView bounds](self, "bounds");
  x = v24;
  y = v25;
  v30 = v26;
  v31 = v27;
  if (v23)
  {
    v154 = CGRectInset(*(CGRect *)&v24, width * 0.125, height * 0.125);
    x = v154.origin.x;
    y = v154.origin.y;
    v30 = v154.size.width;
    v31 = v154.size.height;
  }
  objc_msgSend(MEMORY[0x1E0CD28C8], "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v142[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v142[3] = v33;
  v142[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v34 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 80);
  v35 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v142[0] = *MEMORY[0x1E0CD2610];
  v142[1] = v35;
  v36 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v145 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v146 = v36;
  v143 = v34;
  v144 = 0xBF6B4E81C0000000;
  objc_msgSend(v32, "setSublayerTransform:", v142);
  objc_msgSend(v32, "setFrame:", x, y, v30, v31);
  -[_MSStickerDragPreviewContainerView layer](self, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addSublayer:", v32);

  -[_MSStickerDragPreviewContainerView setPerspectiveLayer:](self, "setPerspectiveLayer:", v32);
  v128 = width;
  v38 = height * 1.1;
  v39 = width * 1.25;
  v40 = v14 * width;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_MSStickerDragPreviewContainerView isDropAnimation](self, "isDropAnimation"))
    v42 = 1.2;
  else
    v42 = 1.0;
  objc_msgSend((id)objc_opt_class(), "meshTransformWithContentScale:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setMeshTransform:", v43);

  objc_msgSend(v41, "setPosition:", v40, -(height * 1.1 - height * v14));
  objc_msgSend(v41, "setBounds:", 0.0, 0.0, v39, v38 + v38 + height * 1.25);
  objc_msgSend(v41, "setRasterizationScale:", 2.8);
  objc_msgSend(v32, "addSublayer:", v41);
  -[_MSStickerDragPreviewContainerView setMeshLayer:](self, "setMeshLayer:", v41);
  objc_msgSend(v41, "position");
  -[_MSStickerDragPreviewContainerView setMeshLayerStartPosition:](self, "setMeshLayerStartPosition:");
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPosition:", v14 * v39, v38 + (v38 + v38 + height * 1.25) * 0.5);
  objc_msgSend(v44, "setBounds:", 0.0, 0.0, v128, height);
  objc_msgSend(v41, "addSublayer:", v44);
  -[_MSStickerDragPreviewContainerView setPeelLayer:](self, "setPeelLayer:", v44);
  objc_msgSend(v44, "position");
  -[_MSStickerDragPreviewContainerView setPeelLayerStartPosition:](self, "setPeelLayerStartPosition:");
  -[_MSStickerDragPreviewContainerView addSubview:](self, "addSubview:", v7);
  -[_MSStickerDragPreviewContainerView setPreviewView:](self, "setPreviewView:", v7);
  objc_msgSend(v7, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *MEMORY[0x1E0CD2F90];
  objc_msgSend(v45, "setContentsGravity:", *MEMORY[0x1E0CD2F90]);
  objc_msgSend(v44, "bounds");
  MidX = CGRectGetMidX(v155);
  objc_msgSend(v44, "bounds");
  objc_msgSend(v45, "setPosition:", MidX, CGRectGetMidY(v156));
  v150 = CFSTR("contents");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, &v150, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActions:", v49);

  -[_MSStickerDragPreviewContainerView setPeelImageLayer:](self, "setPeelImageLayer:", v45);
  objc_msgSend(v44, "addSublayer:", v45);
  -[_MSStickerDragPreviewContainerView image](self, "image");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[_MSStickerDragPreviewContainerView image](self, "image");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MSStickerDragPreviewContainerView peelMaskImageFromImage:](self, "peelMaskImageFromImage:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_retainAutorelease(v52);
    objc_msgSend(v53, "CGImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v130, "layer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "contents");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      objc_msgSend(v130, "layer");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "contents");
      v58 = objc_claimAutoreleasedReturnValue();

      v59 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
      -[_MSStickerDragPreviewContainerView setCurrentDropPreviewSnapshot:](self, "setCurrentDropPreviewSnapshot:", v59);

      objc_msgSend(v130, "frame");
      v61 = v60;
      v63 = v62;
      v65 = v64;
      v67 = v66;
      -[_MSStickerDragPreviewContainerView currentDropPreviewSnapshot](self, "currentDropPreviewSnapshot");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setFrame:", v61, v63, v65, v67);

      -[_MSStickerDragPreviewContainerView currentDropPreviewSnapshot](self, "currentDropPreviewSnapshot");
      v53 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "layer");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setContents:", v58);

      v54 = (void *)v58;
    }
    else
    {
      objc_msgSend(v130, "snapshotViewAfterScreenUpdates:", 1);
      v53 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "layer");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "contents");
      v71 = objc_claimAutoreleasedReturnValue();

      v54 = (void *)v71;
      -[_MSStickerDragPreviewContainerView setCurrentDropPreviewSnapshot:](self, "setCurrentDropPreviewSnapshot:", v53);
    }
  }

  if (v54)
  {
    v129 = v32;
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setContents:", v54);
    objc_msgSend(v7, "bounds");
    objc_msgSend(v72, "setFrame:");
    objc_msgSend(v72, "setContentsGravity:", v46);
    -[_MSStickerDragPreviewContainerView setPeelMaskLayer:](self, "setPeelMaskLayer:", v72);
    v73 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
    objc_msgSend(v45, "bounds");
    objc_msgSend(v73, "setBounds:");
    objc_msgSend(v45, "position");
    objc_msgSend(v73, "setPosition:");
    v126 = v54;
    v127 = v7;
    if (v45)
    {
      objc_msgSend(v45, "transform");
    }
    else
    {
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
    }
    v133[4] = v138;
    v133[5] = v139;
    v133[6] = v140;
    v133[7] = v141;
    v133[0] = v134;
    v133[1] = v135;
    v133[2] = v136;
    v133[3] = v137;
    objc_msgSend(v73, "setTransform:", v133);
    objc_msgSend(v73, "setMask:", v72);
    objc_msgSend(v44, "addSublayer:", v73);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v74 = objc_claimAutoreleasedReturnValue();
    v125 = (void *)v74;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("StickerShine"), v74, 0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "size");
    v77 = v76;
    objc_msgSend(v73, "bounds");
    v78 = CGRectGetWidth(v157);
    v79 = v78 + v78;
    if (v77 < v79)
      v77 = v79;
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_retainAutorelease(v75);
    objc_msgSend(v80, "setContents:", objc_msgSend(v81, "CGImage"));
    objc_msgSend(v73, "bounds");
    v82 = round(CGRectGetWidth(v158) - v77) * 0.5;
    objc_msgSend(v81, "size");
    v84 = -v83;
    objc_msgSend(v81, "size");
    objc_msgSend(v80, "setFrame:", v82, v84, v77, v85);
    LODWORD(v86) = 1035489772;
    objc_msgSend(v80, "setOpacity:", v86);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2EA0]);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setCompositingFilter:", v87);

    objc_msgSend(v73, "addSublayer:", v80);
    -[_MSStickerDragPreviewContainerView setShineLayer:](self, "setShineLayer:", v80);
    objc_msgSend(v80, "position");
    -[_MSStickerDragPreviewContainerView setShineLayerStartPosition:](self, "setShineLayerStartPosition:");
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("StickerShadow"), v74, 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "size");
    v90 = v89;
    objc_msgSend(v73, "bounds");
    v91 = CGRectGetWidth(v159);
    v92 = v91 + v91;
    if (v90 < v92)
      v90 = v92;
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_retainAutorelease(v88);
    objc_msgSend(v93, "setContents:", objc_msgSend(v94, "CGImage"));
    objc_msgSend(v73, "bounds");
    v95 = round(CGRectGetWidth(v160) - v90) * 0.5;
    objc_msgSend(v94, "size");
    v97 = -10.0 - v96;
    objc_msgSend(v94, "size");
    objc_msgSend(v93, "setFrame:", v95, v97, v90, v98);
    LODWORD(v99) = 1043542835;
    objc_msgSend(v93, "setOpacity:", v99);
    objc_msgSend(v73, "addSublayer:", v93);
    -[_MSStickerDragPreviewContainerView setShadowLayer:](self, "setShadowLayer:", v93);
    objc_msgSend(v93, "position");
    -[_MSStickerDragPreviewContainerView setShadowLayerStartPosition:](self, "setShadowLayerStartPosition:");

    v54 = v126;
    v7 = v127;
    v32 = v129;
  }
  if (-[_MSStickerDragPreviewContainerView showDebugBorders](self, "showDebugBorders"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
    v100 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v41, "setBorderColor:", objc_msgSend(v100, "CGColor"));

    objc_msgSend(v41, "setBorderWidth:", 1.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v101 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v102 = v54;
    v103 = objc_msgSend(v101, "CGColor");
    -[_MSStickerDragPreviewContainerView layer](self, "layer");
    v104 = v32;
    v105 = v7;
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v103;
    v54 = v102;
    objc_msgSend(v106, "setBorderColor:", v107);

    v7 = v105;
    v32 = v104;

    -[_MSStickerDragPreviewContainerView layer](self, "layer");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
    v109 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v44, "setBorderColor:", objc_msgSend(v109, "CGColor"));

    objc_msgSend(v44, "setBorderWidth:", 1.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "yellowColor");
    v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v104, "setBorderColor:", objc_msgSend(v110, "CGColor"));

    objc_msgSend(v104, "setBorderWidth:", 1.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemPurpleColor");
    v111 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v45, "setBorderColor:", objc_msgSend(v111, "CGColor"));

    objc_msgSend(v45, "setBorderWidth:", 1.0);
  }
  if (-[_MSStickerDragPreviewContainerView isDropAnimation](self, "isDropAnimation"))
  {
    v112 = -(height * 1.1);
    m = v148;
    CATransform3DMakeAffineTransform(&v132, &m);
    v131 = v132;
    objc_msgSend(v32, "setTransform:", &v131);
    objc_msgSend(v41, "position");
    v114 = v113;
    objc_msgSend(v41, "position");
    objc_msgSend(v41, "setPosition:", v114, v115 + v38 * 2.0);
    objc_msgSend(v44, "position");
    v117 = v116;
    objc_msgSend(v44, "position");
    objc_msgSend(v44, "setPosition:", v117, v118 + v112 * 2.0);
    -[CALayer position](self->_shineLayer, "position");
    v120 = v119;
    -[CALayer position](self->_shineLayer, "position");
    -[CALayer setPosition:](self->_shineLayer, "setPosition:", v120, v121 + 135.0);
    -[CALayer position](self->_shadowLayer, "position");
    v123 = v122;
    -[CALayer position](self->_shadowLayer, "position");
    -[CALayer setPosition:](self->_shadowLayer, "setPosition:", v123, v124 + 130.0);
  }

}

- (BOOL)showDebugBorders
{
  return IMGetCachedDomainBoolForKey();
}

- (void)_animateLiftAlongsideAnimator:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79___MSStickerDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke;
  v8[3] = &unk_1EA25C5C8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "addAnimations:", v8);

}

- (void)_animateLiftCancellationAlongsideAnimator:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91___MSStickerDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke;
    v20[3] = &unk_1EA25C5A0;
    v20[4] = self;
    objc_msgSend(v6, "addAnimations:", v20);
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __91___MSStickerDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_3;
    v18[3] = &unk_1EA25CBD0;
    v19 = v7;
    v9 = v7;
    objc_msgSend(v6, "addCompletion:", v18);
    v10 = v19;
  }
  else
  {
    -[_MSStickerDragPreviewContainerView originalCenter](self, "originalCenter");
    v12 = v11;
    v14 = v13;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91___MSStickerDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_4;
    v16[3] = &unk_1EA25C810;
    v17 = v7;
    v15 = v7;
    -[_MSStickerDragPreviewContainerView reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:](self, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", 0, 0, v16, v12, v14);
    v10 = v17;
  }

}

- (void)_animateDropAlongsideAnimator:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  _MSStickerDragPreviewContainerView *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ms_defaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1DB1A9000, v8, OS_LOG_TYPE_DEFAULT, "<_MSStickerDragPreviewContainerView: %p> _animateDropAlongsideAnimator animator: %@", buf, 0x16u);
  }

  -[_MSStickerDragPreviewContainerView setFinalUIKitDropCompletion:](self, "setFinalUIKitDropCompletion:", v7);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79___MSStickerDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke;
  v9[3] = &unk_1EA25C5A0;
  v9[4] = self;
  objc_msgSend(v6, "addAnimations:", v9);

}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)useEmojiKeyboardMeshTransform
{
  return self->_useEmojiKeyboardMeshTransform;
}

- (void)setUseEmojiKeyboardMeshTransform:(BOOL)a3
{
  self->_useEmojiKeyboardMeshTransform = a3;
}

- (BOOL)isDropAnimation
{
  return self->_isDropAnimation;
}

- (void)setIsDropAnimation:(BOOL)a3
{
  self->_isDropAnimation = a3;
}

- (BOOL)dropAnimationIsComplete
{
  return self->_dropAnimationIsComplete;
}

- (id)clientDropCompletion
{
  return self->_clientDropCompletion;
}

- (void)setClientDropCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (id)finalUIKitDropCompletion
{
  return self->_finalUIKitDropCompletion;
}

- (void)setFinalUIKitDropCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (UIView)currentDropPreviewSnapshot
{
  return self->_currentDropPreviewSnapshot;
}

- (void)setCurrentDropPreviewSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_currentDropPreviewSnapshot, a3);
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

- (CALayer)perspectiveLayer
{
  return self->_perspectiveLayer;
}

- (void)setPerspectiveLayer:(id)a3
{
  objc_storeStrong((id *)&self->_perspectiveLayer, a3);
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

- (CGPoint)originalCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_originalCenter.x;
  y = self->_originalCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOriginalCenter:(CGPoint)a3
{
  self->_originalCenter = a3;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
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

- (BOOL)defersFinalDropAnimationCompletion
{
  return self->_defersFinalDropAnimationCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_peelMaskLayer, 0);
  objc_storeStrong((id *)&self->_peelImageLayer, 0);
  objc_storeStrong((id *)&self->_perspectiveLayer, 0);
  objc_storeStrong((id *)&self->_meshLayer, 0);
  objc_storeStrong((id *)&self->_peelLayer, 0);
  objc_storeStrong((id *)&self->_dropShadowLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_shineLayer, 0);
  objc_storeStrong((id *)&self->_currentDropPreviewSnapshot, 0);
  objc_storeStrong(&self->_finalUIKitDropCompletion, 0);
  objc_storeStrong(&self->_clientDropCompletion, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
