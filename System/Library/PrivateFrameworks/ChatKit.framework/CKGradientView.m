@implementation CKGradientView

- (CKGradientView)initWithFrame:(CGRect)a3
{
  CKGradientView *v3;
  void *v4;
  void *v5;
  void *v6;
  CATransform3D v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKGradientView;
  v3 = -[CKGradientView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CKBaseLayer layer](CKBaseLayer, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCkLayerDelegate:", v3);
    objc_msgSend(v4, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKGradientView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CATransform3DMakeScale(&v8, -1.0, -1.0, 1.0);
    objc_msgSend(v5, "setSublayerTransform:", &v8);
    -[CKGradientView setTrackingLayer:](v3, "setTrackingLayer:", v5);
    objc_msgSend(v6, "addSublayer:", v5);
    -[CKGradientView setGradientLayer:](v3, "setGradientLayer:", v4);
    objc_msgSend(v5, "addSublayer:", v4);

  }
  return v3;
}

- (void)setTrackingLayer:(id)a3
{
  objc_storeStrong((id *)&self->_trackingLayer, a3);
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (void)setReferenceView:(id)a3
{
  id WeakRetained;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  id obj;
  CGRect v20;
  CGRect v21;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_referenceView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_referenceView, obj);
    -[CKGradientView updateGradientImage](self, "updateGradientImage");
    -[CKGradientView updateAnimation](self, "updateAnimation");
    v5 = obj;
    if (obj)
    {
      objc_msgSend(obj, "gradientFrame");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[CKGradientView gradientFrame](self, "gradientFrame");
      v21.origin.x = v14;
      v21.origin.y = v15;
      v21.size.width = v16;
      v21.size.height = v17;
      v20.origin.x = v7;
      v20.origin.y = v9;
      v20.size.width = v11;
      v20.size.height = v13;
      v18 = CGRectEqualToRect(v20, v21);
      v5 = obj;
      if (!v18)
      {
        -[CKGradientView setNeedsLayout](self, "setNeedsLayout");
        v5 = obj;
      }
    }
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKGradientView;
  -[CKGradientView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGradientView referenceView](self, "referenceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ referenceView:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double MidX;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CATransform3D v46;
  CATransform3D v47;
  CATransform3D v48;
  objc_super v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v49.receiver = self;
  v49.super_class = (Class)CKGradientView;
  -[CKGradientView layoutSubviews](&v49, sel_layoutSubviews);
  -[CKGradientView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGradientView referenceView](self, "referenceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGradientView window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || !v3)
    goto LABEL_8;

  if (v4)
  {
    -[CKGradientView bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v4, "gradientFrame");
    v16 = v15;
    v18 = v17;
    v44 = v20;
    v45 = v19;
    objc_msgSend(v4, "gradientFrame");
    v42 = v21;
    v43 = v22;
    v24 = v23;
    v26 = v25;
    v50.origin.x = v8;
    v50.origin.y = v10;
    v50.size.width = v12;
    v50.size.height = v14;
    if (!CGRectIsEmpty(v50))
    {
      v51.origin.x = v16;
      v51.origin.y = v18;
      v51.size.height = v44;
      v51.size.width = v45;
      if (!CGRectIsEmpty(v51))
      {
        v52.origin.x = v42;
        v52.origin.y = v43;
        v52.size.width = v24;
        v52.size.height = v26;
        if (!CGRectIsEmpty(v52))
        {
          -[CKGradientView setGradientFrame:](self, "setGradientFrame:", v42, v43, v24, v26);
          v37 = v12 / v45 * (v24 / v45);
          v27 = (void *)MEMORY[0x1E0CD27A8];
          -[CKGradientView maskImage](self, "maskImage");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "extraInsetsForImage:", v28);
          v38 = v30;
          v39 = v29;
          v40 = v32;
          v41 = v31;

          objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
          objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
          -[CKGradientView trackingLayer](self, "trackingLayer");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setBounds:", 0.0, 0.0, v37, v14 / v44 * (v26 / v44));
          v53.origin.x = v8;
          v53.origin.y = v10;
          v53.size.width = v12;
          v53.size.height = v14;
          MidX = CGRectGetMidX(v53);
          v54.origin.x = v8;
          v54.origin.y = v10;
          v54.size.width = v12;
          v54.size.height = v14;
          objc_msgSend(v6, "setPosition:", MidX, CGRectGetMidY(v54));
          CATransform3DMakeScale(&v48, -v45, -v44, 1.0);
          objc_msgSend(v6, "setTransform:", &v48);
          -[CKGradientView gradientLayer](self, "gradientLayer");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setContentsRect:", -v42 / v45 - v37 * (v38 / v12 + 1.0), -v43 / v44 - v14 / v44 * (v26 / v44) * (v39 / v14 + 1.0), v37 * (1.0 - (v38 + v40) / v12), v14 / v44 * (v26 / v44) * (1.0 - (v39 + v41) / v14));
          v35 = (void *)MEMORY[0x1E0CD27A8];
          -[CKGradientView maskImage](self, "maskImage");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "boundsForMaskImage:withOriginalSize:", v36, v12, v14);
          objc_msgSend(v34, "setBounds:");

          CATransform3DMakeScale(&v46, 1.0 / v45, 1.0 / v44, 1.0);
          CATransform3DTranslate(&v47, &v46, v38, v39, 0.0);
          objc_msgSend(v34, "setTransform:", &v47);
          objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

LABEL_8:
        }
      }
    }
  }
  -[CKGradientView _checkForInvalidLayoutIfNeeded](self, "_checkForInvalidLayoutIfNeeded");

}

- (void)_checkForInvalidLayoutIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  void *v23;
  CGFloat Width;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  double v40;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  CGFloat rect;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  id v52;
  id v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  CGFloat v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  uint64_t v68;
  CGSize v69;
  CGSize v70;
  CGSize v71;
  CGSize v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v52, "isInternalInstall") & 1) != 0)
  {
    -[CKGradientView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0CD27A8];
      -[CKGradientView maskImage](self, "maskImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKGradientView bounds](self, "bounds");
      objc_msgSend(v4, "boundsForMaskImage:withOriginalSize:", v5, v6, v7);
      v9 = v8;
      v11 = v10;

      -[CKGradientView gradientLayer](self, "gradientLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;

      if (v14 != *MEMORY[0x1E0C9D820] || v16 != *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = vabdd_f64(v11, v16);
        objc_msgSend(v18, "textBalloonMinHeight");
        v21 = v20 * 0.5;
        v22 = v19 < v20 * 0.5;
        -[CKGradientView superview](self, "superview");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bounds");
        Width = CGRectGetWidth(v73);

        -[CKGradientView bounds](self, "bounds");
        v51 = v26;
        v53 = v25;
        v49 = v28;
        v50 = v27;
        -[CKGradientView referenceView](self, "referenceView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "bounds");
        v47 = v31;
        v48 = v30;
        rect = v32;
        v34 = v33;

        if (!v22 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            v69.width = v14;
            v69.height = v16;
            NSStringFromCGSize(v69);
            v36 = (id)objc_claimAutoreleasedReturnValue();
            v70.width = v9;
            v70.height = v11;
            NSStringFromCGSize(v70);
            v37 = (id)objc_claimAutoreleasedReturnValue();
            v74.origin.y = v51;
            *(_QWORD *)&v74.origin.x = v53;
            v74.size.height = v49;
            v74.size.width = v50;
            NSStringFromCGRect(v74);
            v38 = (id)objc_claimAutoreleasedReturnValue();
            v75.origin.y = v47;
            v75.origin.x = v48;
            v75.size.width = rect;
            v75.size.height = v34;
            NSStringFromCGRect(v75);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413826;
            v55 = v36;
            v56 = 2112;
            v57 = v37;
            v58 = 2048;
            v59 = v19;
            v60 = 2048;
            v61 = v21;
            v62 = 2048;
            v63 = Width;
            v64 = 2112;
            v65 = v38;
            v66 = 2112;
            v67 = v39;
            _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "height incorrect – actualSize: %@, expectedSize: %@, diff: %f sig-diff: %f, maxWidth: %f - gradientViewBounds: %@ – gradientReferenceViewBounds: %@", buf, 0x48u);

          }
        }
        v40 = vabdd_f64(v9, v14);
        if (v40 >= v21 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v71.width = v14;
            v71.height = v16;
            NSStringFromCGSize(v71);
            v42 = (id)objc_claimAutoreleasedReturnValue();
            v72.width = v9;
            v72.height = v11;
            NSStringFromCGSize(v72);
            v43 = (id)objc_claimAutoreleasedReturnValue();
            v76.origin.y = v51;
            *(_QWORD *)&v76.origin.x = v53;
            v76.size.height = v49;
            v76.size.width = v50;
            NSStringFromCGRect(v76);
            v44 = (id)objc_claimAutoreleasedReturnValue();
            v77.origin.y = v47;
            v77.origin.x = v48;
            v77.size.width = rect;
            v77.size.height = v34;
            NSStringFromCGRect(v77);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413570;
            v55 = v42;
            v56 = 2112;
            v57 = v43;
            v58 = 2048;
            v59 = v40;
            v60 = 2048;
            v61 = v21;
            v62 = 2112;
            v63 = *(double *)&v44;
            v64 = 2112;
            v65 = v45;
            _os_log_impl(&dword_18DFCD000, v41, OS_LOG_TYPE_INFO, "width incorrect – actualSize: %@, expectedSize: %@, diff: %f sig-diff: %f - gradientViewBounds: %@ – gradientReferenceViewBounds: %@", buf, 0x3Eu);

          }
        }

      }
    }
  }
  else
  {

  }
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  id v5;

  -[CKGradientView updateAnimation](self, "updateAnimation");
  -[CKGradientView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKGradientView gradientViews](CKGradientView, "gradientViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "addObject:", self);

    -[CKGradientView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    objc_msgSend(v4, "removeObject:", self);

  }
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  id v5;

  -[CKGradientView updateAnimation](self, "updateAnimation");
  -[CKGradientView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKGradientView gradientViews](CKGradientView, "gradientViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "addObject:", self);

    -[CKGradientView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    objc_msgSend(v4, "removeObject:", self);

  }
}

- (void)_removeAllAnimations:(BOOL)a3
{
  id v3;

  -[CKGradientView layer](self, "layer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

}

- (void)setColors:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[NSArray isEqualToArray:](self->_colors, "isEqualToArray:"))
  {
    v4 = v6;
  }
  else
  {
    v5 = (void *)objc_msgSend(v6, "copy");

    objc_storeStrong((id *)&self->_colors, v5);
    -[CKGradientView updateGradientImage](self, "updateGradientImage");
    v4 = v5;
  }

}

- (void)setMaskImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_maskImage != v6)
  {
    objc_storeStrong((id *)&self->_maskImage, a3);
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[CKGradientView gradientLayer](self, "gradientLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaskImage:", v6);

    -[CKGradientView setNeedsLayout](self, "setNeedsLayout");
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }

}

+ (id)gradientViews
{
  if (gradientViews_once != -1)
    dispatch_once(&gradientViews_once, &__block_literal_global_168);
  return (id)gradientViews_sGradientViews;
}

void __31__CKGradientView_gradientViews__block_invoke()
{
  __int128 v0;
  CFMutableSetRef v1;
  void *v2;
  CFSetCallBacks v3;

  v0 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
  *(_OWORD *)&v3.version = *MEMORY[0x1E0C9B3B0];
  *(_OWORD *)&v3.release = v0;
  *(_OWORD *)&v3.equal = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 32);
  v3.retain = 0;
  v3.release = 0;
  v1 = CFSetCreateMutable(0, 0, &v3);
  v2 = (void *)gradientViews_sGradientViews;
  gradientViews_sGradientViews = (uint64_t)v1;

}

- (void)updateAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[CKGradientView gradientLayer](self, "gradientLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnimationForKey:", CFSTR("matchmove"));
  -[CKGradientView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGradientView referenceView](self, "referenceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGradientView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v4)
  {

    if (v5)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CD27C0]);
      objc_msgSend(v7, "setKeyPath:", CFSTR("contentsRect.origin"));
      objc_msgSend(v5, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSourceLayer:", v8);

      objc_msgSend(v7, "setDuration:", INFINITY);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", 0.0, 0.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSourcePoints:", v10);

      objc_msgSend(v7, "setBeginTimeMode:", CFSTR("absolute"));
      objc_msgSend(v7, "setBeginTime:", 0.0);
      objc_msgSend(v7, "setAdditive:", 1);
      objc_msgSend(v7, "setTargetsSuperlayer:", 1);
      objc_msgSend(v3, "addAnimation:forKey:", v7, CFSTR("matchmove"));

    }
  }
  else
  {

  }
}

- (void)updateGradientImage
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CKGradientView gradientLayer](self, "gradientLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGradientView gradient](self, "gradient");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setContents:", objc_msgSend(v4, "CGImage"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (UIImage)gradient
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CFIndex v17;
  __CFArray *Mutable;
  uint64_t v19;
  const CGFloat *v20;
  size_t v21;
  uint64_t i;
  id v23;
  CGContextRef CurrentContext;
  CGContext *v25;
  CGFloat v26;
  CGFloat v27;
  CGGradient *v28;
  _QWORD v30[2];
  CGSize v31;
  CGPoint v32;
  CGPoint v33;

  v30[1] = *MEMORY[0x1E0C80C00];
  -[CKGradientView colors](self, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKGradientView referenceView](self, "referenceView");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    if (gradient_once != -1)
      dispatch_once(&gradient_once, &__block_literal_global_42_0);
    objc_msgSend(v5, "gradientFrame");
    v8 = v7;
    if (CKMainScreenScale_once_66 != -1)
      dispatch_once(&CKMainScreenScale_once_66, &__block_literal_global_154_0);
    v9 = *(double *)&CKMainScreenScale_sMainScreenScale_66;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_66 == 0.0)
      v9 = 1.0;
    v10 = floor(v8 * v9) / v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)gradient_sGradients, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)gradient_sGradients, "setObject:forKey:", v12, v11);
    }
    objc_msgSend(v12, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_20;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = v10 * v14;

    v16 = fmax(v15, 1.0);
    v17 = objc_msgSend(v3, "count");
    Mutable = CFArrayCreateMutable(0, v17, MEMORY[0x1E0C9B378]);
    MEMORY[0x1E0C80A78](Mutable);
    v20 = (const CGFloat *)((char *)v30 - v19);
    bzero((char *)v30 - v19, v21);
    if (v17 >= 1)
    {
      for (i = 0; i != v17; ++i)
      {
        objc_msgSend(v3, "objectAtIndex:", i);
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CFArrayAppendValue(Mutable, (const void *)objc_msgSend(v23, "CGColor"));

        v20[i] = (double)i / (double)(v17 - 1);
      }
    }
    v31.width = 1.0;
    v31.height = v16;
    UIGraphicsBeginImageContextWithOptions(v31, 0, 1.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    if (CurrentContext)
    {
      v25 = CurrentContext;
      v26 = *MEMORY[0x1E0C9D538];
      v27 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v28 = CGGradientCreateWithColors(0, Mutable, v20);
      v33.x = 0.0;
      v32.x = v26;
      v32.y = v27;
      v33.y = v16;
      CGContextDrawLinearGradient(v25, v28, v32, v33, 0);
      UIGraphicsGetImageFromCurrentImageContext();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CGGradientRelease(v28);
      UIGraphicsEndImageContext();
      if (v6)
        objc_msgSend(v12, "setObject:forKey:", v6, v3);
      if (!Mutable)
        goto LABEL_20;
    }
    else
    {
      NSLog(CFSTR("nil context. failed to created gradient image."));
      UIGraphicsEndImageContext();
      v6 = 0;
      if (!Mutable)
        goto LABEL_20;
    }
    CFRelease(Mutable);
LABEL_20:

  }
  return (UIImage *)v6;
}

void __26__CKGradientView_gradient__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v0 = CKDefaultCacheLimit();
  CKCreateCache(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)gradient_sGradients;
  gradient_sGradients = v1;

}

- (CKGradientReferenceView)referenceView
{
  return (CKGradientReferenceView *)objc_loadWeakRetained((id *)&self->_referenceView);
}

- (NSArray)colors
{
  return self->_colors;
}

- (UIImage)maskImage
{
  return self->_maskImage;
}

- (CKBaseLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (CGRect)gradientFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_gradientFrame.origin.x;
  y = self->_gradientFrame.origin.y;
  width = self->_gradientFrame.size.width;
  height = self->_gradientFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setGradientFrame:(CGRect)a3
{
  self->_gradientFrame = a3;
}

- (CALayer)trackingLayer
{
  return self->_trackingLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_maskImage, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_destroyWeak((id *)&self->_referenceView);
}

@end
