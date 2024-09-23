@implementation CKPaddleOverlayView

- (CKPaddleOverlayView)initWithOverlayView:(id)a3 atAnchorRect:(CGRect)a4 inView:(id)a5 delegate:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CKPaddleOverlayView *v22;
  CKPaddleOverlayView *v23;
  double v24;
  double v25;
  id *p_viewToShow;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double *p_x;
  float v38;
  float v39;
  double v40;
  double v41;
  float v42;
  uint64_t v43;
  UIView *contentView;
  id v45;
  void *v46;
  uint64_t v47;
  UIVisualEffectView *visualEffectView;
  UIVisualEffectView *v49;
  UIVisualEffectView *v50;
  void *v51;
  void *v52;
  UIImageView *v53;
  UIImageView *shadowView;
  UIImageView *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  CGColorSpace *DeviceGray;
  uint32_t v66;
  char v67;
  CGContext *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  CGColor *v80;
  id v81;
  void *v82;
  void *v83;
  int v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGFloat v91;
  CGFloat v92;
  id v93;
  CGImage *Image;
  void *v95;
  id v96;
  uint64_t v97;
  UIView *paddleView;
  void *v99;
  double v101;
  CGColorSpace *space;
  id v103;
  id v104;
  void *v105;
  void *v106;
  UIImageView *v107;
  void *v108;
  CGSize v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a3;
  v15 = a5;
  -[CKPaddleOverlayView setDelegate:](self, "setDelegate:", a6);
  -[CKPaddleOverlayView setOpaque:](self, "setOpaque:", 0);
  -[CKPaddleOverlayView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAllowsGroupBlending:", 0);

  v17 = v15;
  objc_msgSend(v17, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v17;
  if (v18)
  {
    v20 = v17;
    do
    {
      objc_msgSend(v20, "superview");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "superview");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v19;
    }
    while (v21);
  }
  objc_msgSend(v19, "convertRect:fromView:", v17, x, y, width, height);
  -[CKPaddleOverlayView setAnchorRect:](self, "setAnchorRect:");
  objc_msgSend(v19, "bounds");
  v22 = -[CKPaddleOverlayView initWithFrame:](self, "initWithFrame:");
  v23 = v22;
  if (v22)
  {
    -[CKPaddleOverlayView bounds](v22, "bounds");
    v25 = v24;
    p_viewToShow = (id *)&v23->_viewToShow;
    objc_storeStrong((id *)&v23->_viewToShow, a3);
    -[UIView bounds](v23->_viewToShow, "bounds");
    v28 = v27;
    v30 = v29;
    -[UIView setFrame:](v23->_viewToShow, "setFrame:", v27);
    -[UIView layoutIfNeeded](v23->_viewToShow, "layoutIfNeeded");
    -[UIView intrinsicContentSize](v23->_viewToShow, "intrinsicContentSize");
    v33 = v31;
    v34 = v32;
    if (v31 >= v25 + -16.0)
      v35 = v25 + -16.0;
    else
      v35 = v31;
    if (v32 >= 94.0)
      v36 = v32;
    else
      v36 = 94.0;
    objc_msgSend(*p_viewToShow, "setFrame:", v28, v30, v35, v36);
    p_x = &v23->_overlayRect.origin.x;
    v38 = v23->_anchorRect.origin.x + v23->_anchorRect.size.width * 0.5 - v33 * 0.5;
    v39 = ceilf(v38);
    if (v33 + 16.0 <= v25)
      v40 = v33;
    else
      v40 = v25 + -16.0;
    v41 = 8.0;
    if (v39 >= 8.0)
    {
      v41 = v39;
      if (v40 + v39 + 8.0 > v25)
        v41 = v25 - v40 + -8.0;
    }
    v42 = v23->_anchorRect.origin.y - v34 + -8.0;
    *p_x = v41;
    v23->_overlayRect.origin.y = ceilf(v42);
    v23->_overlayRect.size.width = v40;
    v23->_overlayRect.size.height = v34;
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", *p_x, v23->_overlayRect.origin.y, v23->_overlayRect.size.width, v23->_overlayRect.size.height);
    contentView = v23->_contentView;
    v23->_contentView = (UIView *)v43;

    -[CKPaddleOverlayView addSubview:](v23, "addSubview:", v23->_contentView);
    v45 = objc_alloc(MEMORY[0x1E0CEABE8]);
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "initWithEffect:", v46);
    visualEffectView = v23->_visualEffectView;
    v23->_visualEffectView = (UIVisualEffectView *)v47;

    v49 = v23->_visualEffectView;
    -[UIView bounds](v23->_contentView, "bounds");
    -[UIVisualEffectView setFrame:](v49, "setFrame:");
    v50 = v23->_visualEffectView;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "paddleOverlayRadius");
    -[UIVisualEffectView _setContinuousCornerRadius:](v50, "_setContinuousCornerRadius:");

    -[UIVisualEffectView layer](v23->_visualEffectView, "layer");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setMasksToBounds:", 1);

    v53 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    shadowView = v23->_shadowView;
    v23->_shadowView = v53;

    v55 = v23->_shadowView;
    -[UIView bounds](v23->_contentView, "bounds");
    -[UIImageView setFrame:](v55, "setFrame:", v56 + -150.0, v57 + -150.0, v58 + 300.0, v59 + 300.0);
    v107 = v23->_shadowView;
    -[CKPaddleOverlayView traitCollection](v23, "traitCollection");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "displayScale");
    v61 = v60;
    if (CKShadowImageCreateWithShadowProperties_onceToken != -1)
      dispatch_once(&CKShadowImageCreateWithShadowProperties_onceToken, &__block_literal_global_180);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)CKShadowImageCreateWithShadowProperties_shadowImages, "objectForKey:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v63)
    {
      v104 = v14;
      v105 = v62;
      v103 = v17;
      v64 = v61 * 400.0;
      DeviceGray = CGColorSpaceCreateDeviceGray();
      if (CKIsRunningInMacCatalyst())
        v66 = 1;
      else
        v66 = 7;
      v67 = CKIsRunningInMacCatalyst() != 0;
      space = DeviceGray;
      v68 = CGBitmapContextCreate(0, (uint64_t)(v61 * 400.0), (uint64_t)(v61 * 400.0), 8uLL, (uint64_t)(v61 * 400.0) << v67, DeviceGray, v66);
      v110.origin.x = 0.0;
      v110.origin.y = 0.0;
      v110.size.width = (double)(uint64_t)v64;
      v110.size.height = v110.size.width;
      CGContextClearRect(v68, v110);
      CGContextTranslateCTM(v68, 0.0, (double)(uint64_t)v64);
      CGContextScaleCTM(v68, v61, -v61);
      UIGraphicsPushContext(v68);
      v69 = (void *)MEMORY[0x1E0CEA390];
      v111.origin.x = 0.0;
      v111.origin.y = 0.0;
      v111.size.width = 400.0;
      v111.size.height = 400.0;
      v112 = CGRectInset(v111, 150.0, 150.0);
      v70 = v112.origin.x;
      v71 = v112.origin.y;
      v72 = v112.size.width;
      v73 = v112.size.height;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "paddleOverlayRadius");
      objc_msgSend(v69, "bezierPathWithRoundedRect:cornerRadius:", v70, v71, v72, v73, v75);
      v76 = objc_claimAutoreleasedReturnValue();

      v106 = (void *)v76;
      if (CKIsRunningInMacCatalyst())
      {
        CGContextSaveGState(v68);
        CGContextSetBlendMode(v68, kCGBlendModeMultiply);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "theme");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "paddleShadow");
        v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v80 = (CGColor *)objc_msgSend(v79, "CGColor");
        v109.width = 0.0;
        v109.height = -4.0;
        CGContextSetShadowWithColor(v68, v109, 16.0, v80);

        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v81 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(v68, (CGColorRef)objc_msgSend(v81, "CGColor"));

        v82 = v106;
        objc_msgSend(v106, "fill");
        CGContextRestoreGState(v68);
      }
      else
      {
        v101 = v61;
        objc_msgSend(MEMORY[0x1E0CEA638], "kitImageNamed:", CFSTR("_UIPopoverShadow"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0;
        v85 = *MEMORY[0x1E0C9D820];
        v86 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v87 = *MEMORY[0x1E0C9D538];
        v88 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        do
        {
          CGContextSaveGState(v68);
          switch(v84)
          {
            case 1:
              v90 = 0.0;
              v91 = 400.0;
              v92 = 1.57079633;
              break;
            case 3:
              v91 = 0.0;
              v90 = 400.0;
              v92 = 4.71238898;
              break;
            case 2:
              objc_msgSend(v83, "size");
              v90 = v89 + v89;
              v91 = 400.0;
              v92 = 3.14159265;
              break;
            default:
              v92 = 0.0;
              v91 = v85;
              v90 = v86;
              break;
          }
          CGContextTranslateCTM(v68, v91, v90);
          CGContextRotateCTM(v68, v92);
          objc_msgSend(v83, "drawAtPoint:", v87, v88);
          CGContextRestoreGState(v68);
          ++v84;
        }
        while (v84 != 4);

        v61 = v101;
        v82 = v106;
      }
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v93 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(v68, (CGColorRef)objc_msgSend(v93, "CGColor"));

      CGContextSetBlendMode(v68, kCGBlendModeClear);
      objc_msgSend(v82, "fill");
      UIGraphicsPopContext();
      Image = CGBitmapContextCreateImage(v68);
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", Image, 0, v61);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "resizableImageWithCapInsets:", 170.0, 170.0, 170.0, 170.0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      if (v63)
        objc_msgSend((id)CKShadowImageCreateWithShadowProperties_shadowImages, "setObject:forKey:", v63, v105);
      CGImageRelease(Image);
      CGContextRelease(v68);
      CGColorSpaceRelease(space);

      v17 = v103;
      v14 = v104;
      v62 = v105;
    }

    -[UIImageView setImage:](v107, "setImage:", v63);
    -[CKPaddleOverlayView updateShadowVisualStyling](v23, "updateShadowVisualStyling");
    -[UIView addSubview:](v23->_contentView, "addSubview:", v23->_shadowView);
    v96 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[UIVisualEffectView bounds](v23->_visualEffectView, "bounds");
    v97 = objc_msgSend(v96, "initWithFrame:");
    paddleView = v23->_paddleView;
    v23->_paddleView = (UIView *)v97;

    -[UIView addSubview:](v23->_paddleView, "addSubview:", *p_viewToShow);
    -[UIVisualEffectView contentView](v23->_visualEffectView, "contentView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "addSubview:", v23->_paddleView);

    -[UIView addSubview:](v23->_contentView, "addSubview:", v23->_visualEffectView);
    objc_msgSend(v19, "addSubview:", v23);
    objc_msgSend(v19, "bringSubviewToFront:", v23);
  }

  return v23;
}

- (void)updateShadowVisualStyling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!CKIsRunningInMacCatalyst())
  {
    v8[0] = xmmword_18E7CB660;
    v8[1] = xmmword_18E7CB670;
    v8[2] = xmmword_18E7CB680;
    v8[3] = xmmword_18E7CB690;
    v8[4] = xmmword_18E7CB6A0;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("inputColorMatrix"));
    -[CKPaddleOverlayView shadowView](self, "shadowView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", v7);

  }
}

- (void)showPaddleAnimated:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  CATransform3D v31;
  CATransform3D v32;
  CATransform3D v33;

  v6 = a4;
  if (a3)
  {
    -[CKPaddleOverlayView contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAnchorPoint:", 0.5, 1.0);

    -[CKPaddleOverlayView overlayRect](self, "overlayRect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[CKPaddleOverlayView contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    -[CKPaddleOverlayView contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "transform3D");
    else
      memset(&v32, 0, sizeof(v32));
    v22 = 1.0;
    CATransform3DScale(&v33, &v32, 0.2, 0.2, 1.0);
    -[CKPaddleOverlayView contentView](self, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v33;
    objc_msgSend(v23, "setTransform3D:", &v31);

    -[CKPaddleOverlayView shadowView](self, "shadowView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlpha:", 0.0);

    -[CKPaddleOverlayView visualEffectView](self, "visualEffectView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAlpha:", 0.0);

    if (UIAccessibilityIsReduceMotionEnabled())
    {
      v26 = 0.4;
    }
    else
    {
      v22 = 0.8;
      v26 = 0.32;
    }
    v27 = (void *)MEMORY[0x1E0CEABB0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __53__CKPaddleOverlayView_showPaddleAnimated_completion___block_invoke;
    v30[3] = &unk_1E274A208;
    v30[4] = self;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __53__CKPaddleOverlayView_showPaddleAnimated_completion___block_invoke_2;
    v28[3] = &unk_1E27578B0;
    v29 = v6;
    objc_msgSend(v27, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v30, v28, v22, v26, 0.0, 0.0, 0.0, 0.0);

  }
  else
  {
    -[CKPaddleOverlayView shadowView](self, "shadowView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", 1.0);

    -[CKPaddleOverlayView visualEffectView](self, "visualEffectView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAlpha:", 1.0);

    if (v6)
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

void __53__CKPaddleOverlayView_showPaddleAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  _OWORD v9[8];

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v9[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v9[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v9[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v9[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v9[0] = *MEMORY[0x1E0CD2610];
  v9[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v9[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v9[3] = v6;
  objc_msgSend(v2, "setTransform3D:", v9);

  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "visualEffectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", 1.0);

}

uint64_t __53__CKPaddleOverlayView_showPaddleAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)dismiss
{
  _BOOL4 IsReduceMotionEnabled;
  double v4;
  double v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  if (CKIsRunningInMacCatalyst())
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__CKPaddleOverlayView_dismiss__block_invoke;
    v9[3] = &unk_1E274A208;
    v9[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__CKPaddleOverlayView_dismiss__block_invoke_2;
    v8[3] = &unk_1E274A1B8;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v9, v8, 0.2);
  }
  else
  {
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    v4 = 0.85;
    v5 = 0.35;
    if (IsReduceMotionEnabled)
    {
      v4 = 1.0;
      v5 = 0.4;
    }
    v6[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__CKPaddleOverlayView_dismiss__block_invoke_3;
    v7[3] = &unk_1E274A208;
    v7[4] = self;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __30__CKPaddleOverlayView_dismiss__block_invoke_4;
    v6[3] = &unk_1E27578D8;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v7, v6, v4, v5, 0.0, 0.0, 0.0, 0.0);
  }
}

void __30__CKPaddleOverlayView_dismiss__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "darkOuterGlowView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "visualEffectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

}

void __30__CKPaddleOverlayView_dismiss__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDismissPaddleOverlayView:", *(_QWORD *)(a1 + 32));

}

void __30__CKPaddleOverlayView_dismiss__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;
  CATransform3D v9;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "transform3D");
  else
    memset(&v8, 0, sizeof(v8));
  CATransform3DScale(&v9, &v8, 0.2, 0.2, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  objc_msgSend(v4, "setTransform3D:", &v7);

  objc_msgSend(*(id *)(a1 + 32), "shadowView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "visualEffectView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

}

void __30__CKPaddleOverlayView_dismiss__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDismissPaddleOverlayView:", *(_QWORD *)(a1 + 32));

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKPaddleOverlayView;
  -[CKPaddleOverlayView traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, a3);
}

- (CKPaddleOverlayViewDelegate)delegate
{
  return (CKPaddleOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIImageView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (UIView)darkOuterGlowView
{
  return self->_darkOuterGlowView;
}

- (void)setDarkOuterGlowView:(id)a3
{
  objc_storeStrong((id *)&self->_darkOuterGlowView, a3);
}

- (UIView)innerGlowView
{
  return self->_innerGlowView;
}

- (void)setInnerGlowView:(id)a3
{
  objc_storeStrong((id *)&self->_innerGlowView, a3);
}

- (UIView)paddleView
{
  return self->_paddleView;
}

- (void)setPaddleView:(id)a3
{
  objc_storeStrong((id *)&self->_paddleView, a3);
}

- (UIView)viewToShow
{
  return self->_viewToShow;
}

- (void)setViewToShow:(id)a3
{
  objc_storeStrong((id *)&self->_viewToShow, a3);
}

- (CGRect)overlayRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_overlayRect.origin.x;
  y = self->_overlayRect.origin.y;
  width = self->_overlayRect.size.width;
  height = self->_overlayRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOverlayRect:(CGRect)a3
{
  self->_overlayRect = a3;
}

- (CGRect)anchorRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_anchorRect.origin.x;
  y = self->_anchorRect.origin.y;
  width = self->_anchorRect.size.width;
  height = self->_anchorRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAnchorRect:(CGRect)a3
{
  self->_anchorRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewToShow, 0);
  objc_storeStrong((id *)&self->_paddleView, 0);
  objc_storeStrong((id *)&self->_innerGlowView, 0);
  objc_storeStrong((id *)&self->_darkOuterGlowView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
