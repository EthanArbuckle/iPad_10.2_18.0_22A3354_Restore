@implementation STKDragPreviewContainerView

- (STKDragPreviewContainerView)initWithIsDropAnimation:(BOOL)a3
{
  STKDragPreviewContainerView *v4;
  STKDragPreviewContainerView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STKDragPreviewContainerView;
  v4 = -[STKDragPreviewContainerView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_isDropAnimation = a3;
    -[STKDragPreviewContainerView setClipsToBounds:](v4, "setClipsToBounds:", 0);
  }
  return v5;
}

+ (id)meshTransformWithContentScale:(double)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__STKDragPreviewContainerView_meshTransformWithContentScale___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  *(double *)&block[4] = a3;
  if (meshTransformWithContentScale__onceToken != -1)
    dispatch_once(&meshTransformWithContentScale__onceToken, block);
  return (id)meshTransformWithContentScale____mesh;
}

void __61__STKDragPreviewContainerView_meshTransformWithContentScale___block_invoke(uint64_t a1)
{
  double v1;
  uint64_t v2;
  void *v3;
  _BYTE __dst[320];
  double v5[3];
  __int128 v6;
  double v7;
  uint64_t v8;
  double v9;
  __int128 v10;
  double v11;
  uint64_t v12;
  double v13;
  __int128 v14;
  double v15;
  uint64_t v16;
  double v17;
  __int128 v18;
  double v19;
  uint64_t v20;
  double v21;
  __int128 v22;
  double v23;
  uint64_t v24;
  double v25;
  __int128 v26;
  double v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  double v34;
  __int128 v35;
  double v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  double v43;
  __int128 v44;
  double v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  double v52;
  __int128 v53;
  double v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  double v61;
  __int128 v62;
  double v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double v70;
  __int128 v71;
  double v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  uint64_t v78;
  double v79;
  __int128 v80;
  double v81;
  uint64_t v82;
  double v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  uint64_t v87;
  double v88;
  __int128 v89;
  double v90;
  uint64_t v91;
  double v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  uint64_t v96;
  double v97;
  __int128 v98;
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v1 = *(double *)(a1 + 32) + -1.0;
  v5[0] = 0.0 - v1;
  v5[1] = 0.0;
  v6 = xmmword_23471CD90;
  v5[2] = 0.0 - v1;
  v7 = v1 + 1.0;
  v8 = 0;
  v9 = v1 + 1.0;
  v10 = xmmword_23471CD90;
  v11 = 0.0 - v1;
  v12 = 0x3FB999999999999ALL;
  v14 = xmmword_23471CDA0;
  v13 = 0.0 - v1;
  v15 = v1 + 1.0;
  v16 = 0x3FB999999999999ALL;
  v17 = v1 + 1.0;
  v18 = xmmword_23471CDA0;
  v19 = 0.0 - v1;
  v20 = 0x3FC999999999999ALL;
  v22 = xmmword_23471CDB0;
  v21 = 0.0 - v1;
  v23 = v1 + 1.0;
  v24 = 0x3FC999999999999ALL;
  v25 = v1 + 1.0;
  v26 = xmmword_23471CDB0;
  v27 = 0.0 - v1;
  v28 = 0x3FD3333333333333;
  v29 = 0.0 - v1;
  v30 = 0x3FD3333333333333;
  v31 = 0x405E000000000000;
  v32 = v1 + 1.0;
  v33 = 0x3FD3333333333333;
  v34 = v1 + 1.0;
  v35 = xmmword_23471CDC0;
  v36 = 0.0 - v1;
  v37 = 0x3FD999999999999ALL;
  v38 = 0.0 - v1;
  v39 = 0x3FD999999999999ALL;
  v40 = 0x405E000000000000;
  v41 = v1 + 1.0;
  v42 = 0x3FD999999999999ALL;
  v43 = v1 + 1.0;
  v44 = xmmword_23471CDD0;
  v45 = 0.0 - v1;
  v46 = 0x3FE0000000000000;
  v47 = 0.0 - v1;
  v48 = 0x3FE0000000000000;
  v49 = 0x405E000000000000;
  v50 = v1 + 1.0;
  v51 = 0x3FE0000000000000;
  v52 = v1 + 1.0;
  v53 = xmmword_23471CDE0;
  v54 = 0.0 - v1;
  v55 = 0x3FE3333333333333;
  v56 = 0.0 - v1;
  v57 = 0x3FE3333333333333;
  v58 = 0;
  v59 = v1 + 1.0;
  v60 = 0x3FE3333333333333;
  v61 = v1 + 1.0;
  v62 = xmmword_23471CDF0;
  v63 = 0.0 - v1;
  v64 = 0x3FE6666666666666;
  v65 = 0.0 - v1;
  v66 = 0x3FE6666666666666;
  v67 = 0;
  v68 = v1 + 1.0;
  v69 = 0x3FE6666666666666;
  v70 = v1 + 1.0;
  v71 = xmmword_23471CE00;
  v72 = 0.0 - v1;
  v73 = 0x3FE999999999999ALL;
  v74 = 0.0 - v1;
  v75 = 0x3FE999999999999ALL;
  v76 = 0;
  v77 = v1 + 1.0;
  v78 = 0x3FE999999999999ALL;
  v79 = v1 + 1.0;
  v80 = xmmword_23471CE10;
  v81 = 0.0 - v1;
  v82 = 0x3FECCCCCCCCCCCCDLL;
  v83 = 0.0 - v1;
  v84 = 0x3FECCCCCCCCCCCCDLL;
  v85 = 0;
  v86 = v1 + 1.0;
  v87 = 0x3FECCCCCCCCCCCCDLL;
  v88 = v1 + 1.0;
  v89 = xmmword_23471CE20;
  v90 = 0.0 - v1;
  v91 = 0x3FF0000000000000;
  v92 = 0.0 - v1;
  v93 = 0x3FF0000000000000;
  v94 = 0;
  v95 = v1 + 1.0;
  v96 = 0x3FF0000000000000;
  v97 = v1 + 1.0;
  v98 = xmmword_23471CE30;
  memcpy(__dst, &unk_23471CE68, sizeof(__dst));
  objc_msgSend(MEMORY[0x24BDE56F8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 22, v5, 10, __dst, *MEMORY[0x24BDE58F0]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)meshTransformWithContentScale____mesh;
  meshTransformWithContentScale____mesh = v2;

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

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMass:", 2.0);
  objc_msgSend(v5, "setStiffness:", 300.0);
  objc_msgSend(v5, "setDamping:", 400.0);
  *(float *)&v6 = a4;
  objc_msgSend(v5, "setSpeed:", v6);
  objc_msgSend(v5, "setDuration:", 0.91);
  v7 = objc_alloc(MEMORY[0x24BDE56F0]);
  LODWORD(v8) = 1041212815;
  LODWORD(v9) = 999867313;
  LODWORD(v10) = 1058228603;
  LODWORD(v11) = 1064805775;
  v12 = (void *)objc_msgSend(v7, "initWithControlPoints::::", v8, v9, v10, v11);
  objc_msgSend(v5, "setTimingFunction:", v12);

  objc_msgSend(v5, "setFillMode:", *MEMORY[0x24BDE5978]);
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

  v2 = (objc_class *)MEMORY[0x234943FF8](CFSTR("_UIDragPreviewShadowProperties"), CFSTR("UIKit"));
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

  -[STKDragPreviewContainerView bounds](self, "bounds");
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

  -[STKDragPreviewContainerView bounds](self, "bounds");
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

  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v5 = a3;
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  v12 = v11;
  v16.width = v7;
  v16.height = v9;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v12);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
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

  -[STKDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize");
  v4 = v3;
  -[STKDragPreviewContainerView initialSize](self, "initialSize");
  if (v4 < v5
    || (-[STKDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize"),
        v7 = v6,
        -[STKDragPreviewContainerView initialSize](self, "initialSize"),
        result = 1.0,
        v7 < v9))
  {
    -[STKDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize");
    v11 = v10;
    -[STKDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize");
    v13 = v12;
    -[STKDragPreviewContainerView initialSize](self, "initialSize");
    v15 = v14;
    v17 = v16;
    -[STKDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize");
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
  STKDragPreviewContainerView *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (-[STKDragPreviewContainerView dropAnimationIsComplete](self, "dropAnimationIsComplete"))
  {
    -[STKDragPreviewContainerView clientDropCompletion](self, "clientDropCompletion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

LABEL_14:
      v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        if (-[STKDragPreviewContainerView dropAnimationIsComplete](self, "dropAnimationIsComplete"))
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        -[STKDragPreviewContainerView clientDropCompletion](self, "clientDropCompletion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = _Block_copy(v13);
        if (-[STKDragPreviewContainerView defersFinalDropAnimationCompletion](self, "defersFinalDropAnimationCompletion"))
        {
          v15 = CFSTR("YES");
        }
        else
        {
          v15 = CFSTR("NO");
        }
        -[STKDragPreviewContainerView finalUIKitDropCompletion](self, "finalUIKitDropCompletion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = _Block_copy(v16);
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
        _os_log_impl(&dword_23459E000, v11, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> finalizeDropIfNecessary finalizing drop. dropAnimationIsComplete: %@, clientDropCompletion: %@, defersFinalDropAnimationCompletion: %@, finalUIKitDropCompletion: %@", (uint8_t *)&v22, 0x34u);

      }
      -[STKDragPreviewContainerView clientDropCompletion](self, "clientDropCompletion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[STKDragPreviewContainerView clientDropCompletion](self, "clientDropCompletion");
        v19 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v19[2]();

        -[STKDragPreviewContainerView setClientDropCompletion:](self, "setClientDropCompletion:", 0);
      }
      -[STKDragPreviewContainerView finalUIKitDropCompletion](self, "finalUIKitDropCompletion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[STKDragPreviewContainerView finalUIKitDropCompletion](self, "finalUIKitDropCompletion");
        v21 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v21[2]();

        -[STKDragPreviewContainerView setFinalUIKitDropCompletion:](self, "setFinalUIKitDropCompletion:", 0);
      }
      return;
    }
    if (!-[STKDragPreviewContainerView defersFinalDropAnimationCompletion](self, "defersFinalDropAnimationCompletion"))
      goto LABEL_14;
  }
  v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (-[STKDragPreviewContainerView dropAnimationIsComplete](self, "dropAnimationIsComplete"))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    -[STKDragPreviewContainerView clientDropCompletion](self, "clientDropCompletion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = _Block_copy(v6);
    if (-[STKDragPreviewContainerView defersFinalDropAnimationCompletion](self, "defersFinalDropAnimationCompletion"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    -[STKDragPreviewContainerView finalUIKitDropCompletion](self, "finalUIKitDropCompletion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _Block_copy(v9);
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
    _os_log_impl(&dword_23459E000, v4, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> finalizeDropIfNecessary not finalizing yet. dropAnimationIsComplete: %@, clientDropCompletion: %@, defersFinalDropAnimationCompletion: %@, finalUIKitDropCompletion: %@", (uint8_t *)&v22, 0x34u);

  }
}

- (void)performAfterDropAnimation:(id)a3
{
  -[STKDragPreviewContainerView setClientDropCompletion:](self, "setClientDropCompletion:", a3);
  -[STKDragPreviewContainerView finalizeDropIfNecessary](self, "finalizeDropIfNecessary");
}

- (void)setDefersFinalDropAnimationCompletion:(BOOL)a3
{
  if (self->_defersFinalDropAnimationCompletion != a3)
  {
    self->_defersFinalDropAnimationCompletion = a3;
    -[STKDragPreviewContainerView finalizeDropIfNecessary](self, "finalizeDropIfNecessary");
  }
}

- (void)setDropAnimationIsComplete:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  STKDragPreviewContainerView *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_dropAnimationIsComplete != a3)
  {
    v3 = a3;
    v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v7 = 134218242;
      v8 = self;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_23459E000, v5, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> setDropAnimationIsComplete: %@", (uint8_t *)&v7, 0x16u);
    }

    self->_dropAnimationIsComplete = v3;
    -[STKDragPreviewContainerView finalizeDropIfNecessary](self, "finalizeDropIfNecessary");
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
    objc_msgSend(v14, "setToValue:", &unk_2505F99E8);
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    if (v7)
      -[STKDragPreviewContainerView dragViewScale](self, "dragViewScale");
    else
      -[STKDragPreviewContainerView dragViewScaleUp](self, "dragViewScaleUp");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setToValue:", v17);

  }
  -[STKDragPreviewContainerView meshLayer](self, "meshLayer");
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
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v21, v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFromValue:", v27);

  v28 = (void *)MEMORY[0x24BDD1968];
  -[STKDragPreviewContainerView meshLayerStartPosition](self, "meshLayerStartPosition");
  objc_msgSend(v28, "valueWithCGPoint:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setToValue:", v29);

  -[STKDragPreviewContainerView peelLayer](self, "peelLayer");
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
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v33, v35);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFromValue:", v39);

  v40 = (void *)MEMORY[0x24BDD1968];
  -[STKDragPreviewContainerView peelLayerStartPosition](self, "peelLayerStartPosition");
  objc_msgSend(v40, "valueWithCGPoint:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setToValue:", v41);

  -[STKDragPreviewContainerView shineLayer](self, "shineLayer");
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
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v45, v47);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFromValue:", v51);

  v52 = (void *)MEMORY[0x24BDD1968];
  -[STKDragPreviewContainerView shineLayerStartPosition](self, "shineLayerStartPosition");
  objc_msgSend(v52, "valueWithCGPoint:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setToValue:", v53);

  -[STKDragPreviewContainerView shadowLayer](self, "shadowLayer");
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
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v57, v59);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFromValue:", v63);

  v64 = (void *)MEMORY[0x24BDD1968];
  -[STKDragPreviewContainerView shadowLayerStartPosition](self, "shadowLayerStartPosition");
  objc_msgSend(v64, "valueWithCGPoint:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setToValue:", v65);

  objc_msgSend(v62, "setBeginTime:", CACurrentMediaTime() + 0.18);
  if (v6)
  {
    -[STKDragPreviewContainerView layer](self, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "position");
    v68 = v67;
    v70 = v69;

    v71 = (void *)objc_opt_class();
    LODWORD(v72) = 1066192077;
    objc_msgSend(v71, "springAnimationWithKeyPath:speed:", CFSTR("position"), v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v68, v70);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setFromValue:", v74);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setToValue:", v75);

    v76 = (void *)objc_opt_class();
    LODWORD(v77) = 1066192077;
    objc_msgSend(v76, "springAnimationWithKeyPath:speed:", CFSTR("opacity"), v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setFromValue:", &unk_2505F99F8);
    objc_msgSend(v78, "setToValue:", &unk_2505F9A08);
  }
  else
  {
    v73 = 0;
    v78 = 0;
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.310000002);
  -[STKDragPreviewContainerView layer](self, "layer");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "addAnimation:forKey:", v100, CFSTR("scaleUpAnimation"));

  -[STKDragPreviewContainerView meshLayer](self, "meshLayer");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "addAnimation:forKey:", v26, CFSTR("meshAnimation"));

  -[STKDragPreviewContainerView peelLayer](self, "peelLayer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "addAnimation:forKey:", v38, CFSTR("peelAnimation"));

  -[STKDragPreviewContainerView shineLayer](self, "shineLayer");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addAnimation:forKey:", v50, CFSTR("shineAnimation"));

  -[STKDragPreviewContainerView shadowLayer](self, "shadowLayer");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "addAnimation:forKey:", v62, CFSTR("shadowAnimation"));

  if (v73)
  {
    -[STKDragPreviewContainerView layer](self, "layer");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "addAnimation:forKey:", v73, CFSTR("moveAnimation"));

  }
  if (v78)
  {
    -[STKDragPreviewContainerView layer](self, "layer");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addAnimation:forKey:", v78, CFSTR("opacityAnimation"));

  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  if (v99)
  {
    v86 = dispatch_time(0, 750000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke;
    block[3] = &unk_2505BD4A8;
    v105 = v11;
    v87 = v11;
    dispatch_after(v86, MEMORY[0x24BDAC9B8], block);
    v88 = v105;
  }
  else
  {
    v89 = *MEMORY[0x24BDBEFB0];
    v90 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    -[STKDragPreviewContainerView rasterizedImageSize](self, "rasterizedImageSize");
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
    v97 = (void *)MEMORY[0x24BEBDB00];
    v103[0] = MEMORY[0x24BDAC760];
    v103[1] = 3221225472;
    v103[2] = __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2;
    v103[3] = &unk_2505BD4D0;
    v103[4] = self;
    *(CGFloat *)&v103[5] = v95;
    *(double *)&v103[6] = y - Height * 0.5;
    *(CGFloat *)&v103[7] = v92;
    *(CGFloat *)&v103[8] = v94;
    v101[0] = MEMORY[0x24BDAC760];
    v101[1] = 3221225472;
    v101[2] = __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3;
    v101[3] = &unk_2505BD4F8;
    v102 = v11;
    v98 = v11;
    objc_msgSend(v97, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v103, v101, 0.75, 0.0, 0.6, 0.0);
    v88 = v102;
  }

}

uint64_t __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.999);
}

uint64_t __101__STKDragPreviewContainerView_reversePeelAnimationToPoint_forPlacement_shouldShrink_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  id v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  void *v78;
  id v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  CGFloat v90;
  double v91;
  void *v92;
  id v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  id v99;
  id v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  void *v121;
  id v122;
  void *v123;
  double v124;
  void *v125;
  id v126;
  CATransform3D v127;
  CATransform3D v128;
  _OWORD v129[5];
  uint64_t v130;
  unint64_t v131;
  __int128 v132;
  __int128 v133;
  CGAffineTransform m;
  CGAffineTransform v135;
  CGAffineTransform v136;
  const __CFString *v137;
  _QWORD v138[3];
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;

  v138[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v126 = a4;
  -[STKDragPreviewContainerView bounds](self, "bounds");
  width = v8;
  height = v10;
  -[STKDragPreviewContainerView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anchorPoint");
  v14 = v13;
  v16 = v15;

  memset(&v136, 0, sizeof(v136));
  v17 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v135.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v135.c = v17;
  *(_OWORD *)&v135.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformScale(&v136, &v135, 1.25, 1.25);
  m = v136;
  memset(&v135, 0, sizeof(v135));
  CGAffineTransformInvert(&v135, &m);
  if (-[STKDragPreviewContainerView isDropAnimation](self, "isDropAnimation"))
  {
    objc_msgSend(v7, "convertSize:fromView:", self, width, height);
    v19 = v18;
    v21 = v20;
    objc_msgSend(v7, "convertPoint:fromView:", self, v14, v16);
    v14 = v22;
    m = v135;
    v139.origin.x = 0.0;
    v139.origin.y = 0.0;
    v139.size.width = v19;
    v139.size.height = v21;
    v140 = CGRectApplyAffineTransform(v139, &m);
    width = v140.size.width;
    height = v140.size.height;
  }
  v23 = -[STKDragPreviewContainerView isDropAnimation](self, "isDropAnimation");
  -[STKDragPreviewContainerView bounds](self, "bounds");
  x = v24;
  y = v25;
  v30 = v26;
  v31 = v27;
  if (v23)
  {
    v141 = CGRectInset(*(CGRect *)&v24, width * 0.125, height * 0.125);
    x = v141.origin.x;
    y = v141.origin.y;
    v30 = v141.size.width;
    v31 = v141.size.height;
  }
  objc_msgSend(MEMORY[0x24BDE57E0], "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v129[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v129[3] = v33;
  v129[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v34 = *(_QWORD *)(MEMORY[0x24BDE5598] + 80);
  v35 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v129[0] = *MEMORY[0x24BDE5598];
  v129[1] = v35;
  v36 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v132 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v133 = v36;
  v130 = v34;
  v131 = 0xBF6B4E81C0000000;
  objc_msgSend(v32, "setSublayerTransform:", v129);
  objc_msgSend(v32, "setFrame:", x, y, v30, v31);
  -[STKDragPreviewContainerView layer](self, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addSublayer:", v32);

  -[STKDragPreviewContainerView setPerspectiveLayer:](self, "setPerspectiveLayer:", v32);
  v38 = height * 1.1;
  v39 = width * 1.25;
  v124 = width;
  v40 = v14 * width;
  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STKDragPreviewContainerView isDropAnimation](self, "isDropAnimation"))
    v42 = 1.2;
  else
    v42 = 1.0;
  objc_msgSend((id)objc_opt_class(), "meshTransformWithContentScale:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setMeshTransform:", v43);

  objc_msgSend(v41, "setPosition:", v40, -(height * 1.1 - height * v14));
  objc_msgSend(v41, "setBounds:", 0.0, 0.0, v39, v38 + v38 + height * 1.25);
  objc_msgSend(v41, "setRasterizationScale:", 2.8);
  v123 = v32;
  objc_msgSend(v32, "addSublayer:", v41);
  -[STKDragPreviewContainerView setMeshLayer:](self, "setMeshLayer:", v41);
  objc_msgSend(v41, "position");
  -[STKDragPreviewContainerView setMeshLayerStartPosition:](self, "setMeshLayerStartPosition:");
  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPosition:", v14 * v39, v38 + (v38 + v38 + height * 1.25) * 0.5);
  objc_msgSend(v44, "setBounds:", 0.0, 0.0, v124, height);
  objc_msgSend(v41, "addSublayer:", v44);
  -[STKDragPreviewContainerView setPeelLayer:](self, "setPeelLayer:", v44);
  objc_msgSend(v44, "position");
  -[STKDragPreviewContainerView setPeelLayerStartPosition:](self, "setPeelLayerStartPosition:");
  -[STKDragPreviewContainerView addSubview:](self, "addSubview:", v7);
  -[STKDragPreviewContainerView setPreviewView:](self, "setPreviewView:", v7);
  objc_msgSend(v7, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *MEMORY[0x24BDE5C90];
  objc_msgSend(v45, "setContentsGravity:", *MEMORY[0x24BDE5C90]);
  objc_msgSend(v44, "bounds");
  MidX = CGRectGetMidX(v142);
  objc_msgSend(v44, "bounds");
  objc_msgSend(v45, "setPosition:", MidX, CGRectGetMidY(v143));
  v137 = CFSTR("contents");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v48;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v138, &v137, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setActions:", v49);

  -[STKDragPreviewContainerView setPeelImageLayer:](self, "setPeelImageLayer:", v45);
  objc_msgSend(v44, "addSublayer:", v45);
  -[STKDragPreviewContainerView image](self, "image");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[STKDragPreviewContainerView image](self, "image");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[STKDragPreviewContainerView peelMaskImageFromImage:](self, "peelMaskImageFromImage:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_retainAutorelease(v52);
    objc_msgSend(v53, "CGImage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v126, "layer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "contents");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      objc_msgSend(v126, "layer");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "contents");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = objc_alloc_init(MEMORY[0x24BEBDB00]);
      -[STKDragPreviewContainerView setCurrentDropPreviewSnapshot:](self, "setCurrentDropPreviewSnapshot:", v58);

      objc_msgSend(v126, "frame");
      v60 = v59;
      v62 = v61;
      v64 = v63;
      v66 = v65;
      -[STKDragPreviewContainerView currentDropPreviewSnapshot](self, "currentDropPreviewSnapshot");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "setFrame:", v60, v62, v64, v66);

      -[STKDragPreviewContainerView currentDropPreviewSnapshot](self, "currentDropPreviewSnapshot");
      v53 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "layer");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setContents:", v54);

    }
    else
    {
      objc_msgSend(v126, "snapshotViewAfterScreenUpdates:", 1);
      v53 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "layer");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "contents");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      -[STKDragPreviewContainerView setCurrentDropPreviewSnapshot:](self, "setCurrentDropPreviewSnapshot:", v53);
    }
  }

  v125 = v54;
  if (v54)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setContents:", v54);
    objc_msgSend(v7, "bounds");
    objc_msgSend(v70, "setFrame:");
    objc_msgSend(v70, "setContentsGravity:", v46);
    -[STKDragPreviewContainerView setPeelMaskLayer:](self, "setPeelMaskLayer:", v70);
    v71 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    objc_msgSend(v7, "frame");
    objc_msgSend(v71, "setFrame:");
    objc_msgSend(v71, "setMask:", v70);
    objc_msgSend(v44, "addSublayer:", v71);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v72 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("StickerShine"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "size");
    v75 = v74;
    objc_msgSend(v71, "bounds");
    v76 = CGRectGetWidth(v144);
    v77 = v76 + v76;
    if (v75 < v77)
      v75 = v77;
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v122 = v7;
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_retainAutorelease(v73);
    objc_msgSend(v78, "setContents:", objc_msgSend(v79, "CGImage"));
    objc_msgSend(v71, "bounds");
    v80 = round(CGRectGetWidth(v145) - v75) * 0.5;
    objc_msgSend(v79, "size");
    v82 = -v81;
    objc_msgSend(v79, "size");
    objc_msgSend(v78, "setFrame:", v80, v82, v75, v83);
    LODWORD(v84) = 1035489772;
    objc_msgSend(v78, "setOpacity:", v84);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v121 = v45;
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setCompositingFilter:", v85);

    objc_msgSend(v71, "addSublayer:", v78);
    -[STKDragPreviewContainerView setShineLayer:](self, "setShineLayer:", v78);
    objc_msgSend(v78, "position");
    -[STKDragPreviewContainerView setShineLayerStartPosition:](self, "setShineLayerStartPosition:");
    v86 = (void *)v72;
    objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("StickerShadow"), v72, 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "size");
    v89 = v88;
    objc_msgSend(v71, "bounds");
    v90 = CGRectGetWidth(v146);
    v91 = v90 + v90;
    if (v89 < v91)
      v89 = v91;
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_retainAutorelease(v87);
    objc_msgSend(v92, "setContents:", objc_msgSend(v93, "CGImage"));
    objc_msgSend(v71, "bounds");
    v94 = round(CGRectGetWidth(v147) - v89) * 0.5;
    objc_msgSend(v93, "size");
    v96 = -10.0 - v95;
    objc_msgSend(v93, "size");
    objc_msgSend(v92, "setFrame:", v94, v96, v89, v97);
    LODWORD(v98) = 1043542835;
    objc_msgSend(v92, "setOpacity:", v98);
    objc_msgSend(v71, "addSublayer:", v92);
    -[STKDragPreviewContainerView setShadowLayer:](self, "setShadowLayer:", v92);
    objc_msgSend(v92, "position");
    -[STKDragPreviewContainerView setShadowLayerStartPosition:](self, "setShadowLayerStartPosition:");

    v45 = v121;
    v54 = v125;

    v7 = v122;
  }
  if (-[STKDragPreviewContainerView showDebugBorders](self, "showDebugBorders"))
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blueColor");
    v99 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v41, "setBorderColor:", objc_msgSend(v99, "CGColor"));

    objc_msgSend(v41, "setBorderWidth:", 1.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "redColor");
    v100 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v101 = objc_msgSend(v100, "CGColor");
    -[STKDragPreviewContainerView layer](self, "layer");
    v102 = v45;
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setBorderColor:", v101);

    v45 = v102;
    -[STKDragPreviewContainerView layer](self, "layer");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "setBorderWidth:", 1.0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "greenColor");
    v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v44, "setBorderColor:", objc_msgSend(v105, "CGColor"));

    objc_msgSend(v44, "setBorderWidth:", 1.0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "yellowColor");
    v106 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v123, "setBorderColor:", objc_msgSend(v106, "CGColor"));

    objc_msgSend(v123, "setBorderWidth:", 1.0);
    v54 = v125;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemPurpleColor");
    v107 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v102, "setBorderColor:", objc_msgSend(v107, "CGColor"));

    objc_msgSend(v102, "setBorderWidth:", 1.0);
  }
  if (-[STKDragPreviewContainerView isDropAnimation](self, "isDropAnimation"))
  {
    v108 = -(height * 1.1);
    m = v135;
    CATransform3DMakeAffineTransform(&v128, &m);
    v127 = v128;
    objc_msgSend(v123, "setTransform:", &v127);
    objc_msgSend(v41, "position");
    v110 = v109;
    objc_msgSend(v41, "position");
    objc_msgSend(v41, "setPosition:", v110, v111 + v38 * 2.0);
    objc_msgSend(v44, "position");
    v113 = v112;
    objc_msgSend(v44, "position");
    objc_msgSend(v44, "setPosition:", v113, v114 + v108 * 2.0);
    -[CALayer position](self->_shineLayer, "position");
    v116 = v115;
    -[CALayer position](self->_shineLayer, "position");
    -[CALayer setPosition:](self->_shineLayer, "setPosition:", v116, v117 + 135.0);
    -[CALayer position](self->_shadowLayer, "position");
    v119 = v118;
    -[CALayer position](self->_shadowLayer, "position");
    -[CALayer setPosition:](self->_shadowLayer, "setPosition:", v119, v120 + 130.0);
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
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__STKDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke;
  v8[3] = &unk_2505BD520;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "addAnimations:", v8);

}

void __72__STKDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_time_t v24;
  _QWORD block[4];
  id v26;

  objc_msgSend(*(id *)(a1 + 32), "center");
  objc_msgSend(*(id *)(a1 + 32), "setOriginalCenter:");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = v2 * 1.1 + v2 * 1.1;
  v4 = (void *)objc_opt_class();
  LODWORD(v5) = 1050253722;
  objc_msgSend(v4, "springAnimationWithKeyPath:speed:", CFSTR("position"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.0, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByValue:", v7);

  objc_msgSend(v6, "setBeginTime:", CACurrentMediaTime() + -0.31);
  v8 = (void *)objc_opt_class();
  LODWORD(v9) = 1050253722;
  objc_msgSend(v8, "springAnimationWithKeyPath:speed:", CFSTR("position"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.0, -v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByValue:", v11);

  objc_msgSend(v10, "setBeginTime:", CACurrentMediaTime() + -0.31);
  v12 = (void *)objc_opt_class();
  LODWORD(v13) = 1053609165;
  objc_msgSend(v12, "springAnimationWithKeyPath:speed:", CFSTR("position"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.0, 135.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByValue:", v15);

  objc_msgSend(v14, "setBeginTime:", CACurrentMediaTime() + -0.12);
  v16 = (void *)objc_opt_class();
  LODWORD(v17) = 1061997773;
  objc_msgSend(v16, "springAnimationWithKeyPath:speed:", CFSTR("position"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", 0.0, 130.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setByValue:", v19);

  objc_msgSend(v18, "setBeginTime:", CACurrentMediaTime() + 0.1);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.310000002);
  objc_msgSend(*(id *)(a1 + 32), "meshLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addAnimation:forKey:", v6, CFSTR("meshAnimation"));

  objc_msgSend(*(id *)(a1 + 32), "peelLayer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAnimation:forKey:", v10, CFSTR("peelAnimation"));

  objc_msgSend(*(id *)(a1 + 32), "shineLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAnimation:forKey:", v14, CFSTR("shineAnimation"));

  objc_msgSend(*(id *)(a1 + 32), "shadowLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAnimation:forKey:", v18, CFSTR("shadowAnimation"));

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  v24 = dispatch_time(0, 910000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__STKDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke_2;
  block[3] = &unk_2505BD4A8;
  v26 = *(id *)(a1 + 40);
  dispatch_after(v24, MEMORY[0x24BDAC9B8], block);

}

uint64_t __72__STKDragPreviewContainerView__animateLiftAlongsideAnimator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_animateLiftCancellationAlongsideAnimator:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke;
    v15[3] = &unk_2505BD520;
    v15[4] = self;
    v16 = v6;
    objc_msgSend(a3, "addAnimations:", v15);
    v8 = v16;
  }
  else
  {
    -[STKDragPreviewContainerView originalCenter](self, "originalCenter");
    v10 = v9;
    v12 = v11;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_3;
    v13[3] = &unk_2505BD4A8;
    v14 = v7;
    -[STKDragPreviewContainerView reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:](self, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", 0, 0, v13, v10, v12);
    v8 = v14;
  }

}

void __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "originalCenter");
  v4 = v3;
  v6 = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_2;
  v7[3] = &unk_2505BD4A8;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", 0, 0, v7, v4, v6);

}

uint64_t __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __84__STKDragPreviewContainerView__animateLiftCancellationAlongsideAnimator_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_animateDropAlongsideAnimator:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  STKDragPreviewContainerView *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_23459E000, v8, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> _animateDropAlongsideAnimator animator: %@", buf, 0x16u);
  }

  -[STKDragPreviewContainerView setFinalUIKitDropCompletion:](self, "setFinalUIKitDropCompletion:", v7);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__STKDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke;
  v9[3] = &unk_2505BD548;
  v9[4] = self;
  objc_msgSend(v6, "addAnimations:", v9);

}

uint64_t __72__STKDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    v8 = v3;
    _os_log_impl(&dword_23459E000, v2, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> _animateDropAlongsideAnimator animator callback.", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "center");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__STKDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke_63;
  v6[3] = &unk_2505BD548;
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v4, "reversePeelAnimationToPoint:forPlacement:shouldShrink:completionBlock:", 1, 0, v6);
}

uint64_t __72__STKDragPreviewContainerView__animateDropAlongsideAnimator_completion___block_invoke_63(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_23459E000, v2, OS_LOG_TYPE_DEFAULT, "<STKDragPreviewContainerView: %p> _animateDropAlongsideAnimator reversePeelAnimationToPoint callback", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setDropAnimationIsComplete:", 1);
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
