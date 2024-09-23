@implementation CKQuickActionButton

- (CKQuickActionButton)initWithInitialState:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CKQuickActionButton *v8;
  uint64_t v9;
  UIView *backgroundView;
  CAShapeLayer *v11;
  CAShapeLayer *borderLayer;
  void *v13;
  uint64_t v14;
  UIButton *button;
  UIImageView *v16;
  UIImageView *imageView;
  NSMutableArray *v18;
  NSMutableArray *deferredAnimationIdentifiers;
  NSMutableDictionary *v20;
  NSMutableDictionary *deferredConfigurationStates;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKQuickActionButton;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = -[CKQuickActionButton initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, v6, v7);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v4, v5, v6, v7);
    backgroundView = v8->_backgroundView;
    v8->_backgroundView = (UIView *)v9;

    -[CKQuickActionButton addSubview:](v8, "addSubview:", v8->_backgroundView);
    v11 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    borderLayer = v8->_borderLayer;
    v8->_borderLayer = v11;

    -[UIView layer](v8->_backgroundView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v8->_borderLayer);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v14 = objc_claimAutoreleasedReturnValue();
    button = v8->_button;
    v8->_button = (UIButton *)v14;

    -[UIButton addTarget:action:forControlEvents:](v8->_button, "addTarget:action:forControlEvents:", v8, sel__buttonTouchUpInside, 64);
    -[UIButton addTarget:action:forControlEvents:](v8->_button, "addTarget:action:forControlEvents:", v8, sel__buttonTouchDown, 1);
    -[UIButton addTarget:action:forControlEvents:](v8->_button, "addTarget:action:forControlEvents:", v8, sel__buttonTouchCanceled, 256);
    -[UIButton addTarget:action:forControlEvents:](v8->_button, "addTarget:action:forControlEvents:", v8, sel__buttonTouchCanceled, 128);
    -[CKQuickActionButton addSubview:](v8, "addSubview:", v8->_button);
    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    imageView = v8->_imageView;
    v8->_imageView = v16;

    -[UIImageView setContentMode:](v8->_imageView, "setContentMode:", 4);
    -[CKQuickActionButton addSubview:](v8, "addSubview:", v8->_imageView);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deferredAnimationIdentifiers = v8->_deferredAnimationIdentifiers;
    v8->_deferredAnimationIdentifiers = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deferredConfigurationStates = v8->_deferredConfigurationStates;
    v8->_deferredConfigurationStates = v20;

    v8->_state = a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKQuickActionButton configureForState:animated:identifier:wasDeferred:](v8, "configureForState:animated:identifier:wasDeferred:", a3, 0, v22, 0);

  }
  return v8;
}

- (CKQuickActionButton)init
{
  return -[CKQuickActionButton initWithInitialState:](self, "initWithInitialState:", 0);
}

- (CKQuickActionButton)initWithCoder:(id)a3
{
  return -[CKQuickActionButton initWithInitialState:](self, "initWithInitialState:", 0);
}

- (CKQuickActionButton)initWithFrame:(CGRect)a3
{
  return -[CKQuickActionButton initWithInitialState:](self, "initWithInitialState:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKQuickActionButton;
  -[CKQuickActionButton layoutSubviews](&v20, sel_layoutSubviews);
  -[CKQuickActionButton updateImageViewFrameForContentEdgeInsets](self, "updateImageViewFrameForContentEdgeInsets");
  -[CKQuickActionButton bounds](self, "bounds");
  -[UIButton setFrame:](self->_button, "setFrame:");
  -[CKQuickActionButton bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[UIView layer](self->_backgroundView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  -[CKQuickActionButton bounds](self, "bounds");
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  v6 = (void *)MEMORY[0x1E0CEA390];
  -[CKQuickActionButton backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CKQuickActionButton backgroundView](self, "backgroundView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cornerRadius");
  objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v18);
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](self->_borderLayer, "setPath:", objc_msgSend(v19, "CGPath"));

}

- (void)updateImageViewFrameForContentEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  double v20;
  double v21;

  -[CKQuickActionButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKQuickActionButton contentEdgeInsets](self, "contentEdgeInsets");
  v12 = v4 + v11;
  -[CKQuickActionButton contentEdgeInsets](self, "contentEdgeInsets");
  v14 = v13;
  -[CKQuickActionButton contentEdgeInsets](self, "contentEdgeInsets");
  v16 = v8 - (v14 + v15);
  -[CKQuickActionButton contentEdgeInsets](self, "contentEdgeInsets");
  v18 = v6 + v17;
  -[CKQuickActionButton contentEdgeInsets](self, "contentEdgeInsets");
  v20 = v19;
  -[CKQuickActionButton contentEdgeInsets](self, "contentEdgeInsets");
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v12, v18, v16, v10 - (v20 + v21));
}

- (double)animationDurationForState:(unint64_t)a3
{
  return 0.0;
}

- (double)delayForFinalizingAnimation
{
  return 0.0;
}

- (double)delayForImageSwapAnimation
{
  return 0.0;
}

- (id)buttonImageForState:(unint64_t)a3
{
  return 0;
}

- (UIEdgeInsets)contentEdgeInsetsForState:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)configureForState:(unint64_t)a3 animated:(BOOL)a4 identifier:(id)a5 wasDeferred:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  void (**v17)(_QWORD);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  id v50;
  double v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  int64_t v60;
  double v61;
  dispatch_time_t v62;
  _QWORD v63[5];
  void (**v64)(_QWORD);
  void (**v65)(_QWORD);
  unint64_t v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  void (**v70)(_QWORD);
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  uint64_t v75;
  _QWORD v76[4];
  id v77;
  void (**v78)(_QWORD);
  _QWORD v79[5];
  id v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  _QWORD v83[5];
  _QWORD aBlock[6];
  void *v85;
  uint8_t buf[4];
  unint64_t v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v6 = a6;
  v7 = a4;
  v90 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  if (v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v87 = a3;
      v88 = 2112;
      v89 = v10;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Performing deferred state config for state %lu. identifier: %@", buf, 0x16u);
    }

  }
  -[CKQuickActionButton currentAnimationIdentifier](self, "currentAnimationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12
    || (-[CKQuickActionButton currentAnimationIdentifier](self, "currentAnimationIdentifier"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", v10),
        v13,
        v12,
        (v14 & 1) != 0))
  {
    -[CKQuickActionButton setCurrentAnimationIdentifier:](self, "setCurrentAnimationIdentifier:", v10);
    v15 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke;
    aBlock[3] = &unk_1E274C9C0;
    aBlock[4] = self;
    aBlock[5] = a3;
    v16 = (void (**)(_QWORD))_Block_copy(aBlock);
    v83[0] = v15;
    v83[1] = 3221225472;
    v83[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_2;
    v83[3] = &unk_1E274A208;
    v83[4] = self;
    v17 = (void (**)(_QWORD))_Block_copy(v83);
    if (v7)
    {
      -[CKQuickActionButton setAnimating:](self, "setAnimating:", 1);
      if (a3 < 2)
      {
        v60 = 0;
      }
      else
      {
        if (a3 != 3)
        {
          if (a3 == 2)
          {
            -[CKQuickActionButton imageView](self, "imageView");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "layer");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v20;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setFilters:", v21);

            -[CKQuickActionButton imageView](self, "imageView");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setAlpha:", 1.0);

            v23 = objc_alloc(MEMORY[0x1E0CEABB0]);
            -[CKQuickActionButton backgroundView](self, "backgroundView");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "frame");
            v25 = (void *)objc_msgSend(v23, "initWithFrame:");

            CGAffineTransformMakeScale(&v82, 0.0, 0.0);
            objc_msgSend(v25, "setTransform:", &v82);
            +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "theme");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "quickActionButtonBurstColor");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setBackgroundColor:", v28);

            objc_msgSend(v25, "layer");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKQuickActionButton backgroundView](self, "backgroundView");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "layer");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "cornerRadius");
            objc_msgSend(v29, "setCornerRadius:");

            objc_msgSend(v25, "layer");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
            v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v32, "setBorderColor:", objc_msgSend(v33, "CGColor"));

            objc_msgSend(v25, "layer");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setBorderWidth:", 1.0);

            -[CKQuickActionButton backgroundView](self, "backgroundView");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKQuickActionButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v25, v35);

            objc_msgSend(v25, "bounds");
            v37 = v36;
            v38 = objc_alloc(MEMORY[0x1E0CEABB0]);
            -[CKQuickActionButton backgroundView](self, "backgroundView");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "frame");
            v40 = (void *)objc_msgSend(v38, "initWithFrame:");

            CGAffineTransformMakeScale(&v81, 0.0, 0.0);
            objc_msgSend(v40, "setTransform:", &v81);
            +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "theme");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "quickActionButtonBurstColor");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setBackgroundColor:", v43);

            objc_msgSend(v40, "layer");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKQuickActionButton backgroundView](self, "backgroundView");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "layer");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "cornerRadius");
            objc_msgSend(v44, "setCornerRadius:");

            -[CKQuickActionButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v40, v25);
            -[CKQuickActionButton animationDurationForState:](self, "animationDurationForState:", 2);
            v48 = v47;
            v49 = (void *)MEMORY[0x1E0CEABB0];
            v79[0] = v15;
            v79[1] = 3221225472;
            v79[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_3;
            v79[3] = &unk_1E274A108;
            v79[4] = self;
            v80 = v25;
            v76[0] = v15;
            v76[1] = 3221225472;
            v76[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_4;
            v76[3] = &unk_1E2756CC8;
            v77 = v80;
            v78 = v16;
            v50 = v80;
            objc_msgSend(v49, "animateWithDuration:animations:completion:", v79, v76, v48);
            v51 = v37 * 1.5 * (v48 / v37);
            v52 = (void *)MEMORY[0x1E0CEABB0];
            v73[0] = v15;
            v73[1] = 3221225472;
            v73[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_5;
            v73[3] = &unk_1E274C9C0;
            v53 = v40;
            v74 = v53;
            v75 = 0x3FF8000000000000;
            objc_msgSend(v52, "animateWithDuration:animations:completion:", v73, 0, v51);
            v54 = (void *)MEMORY[0x1E0CEABB0];
            v71[0] = v15;
            v71[1] = 3221225472;
            v71[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_6;
            v71[3] = &unk_1E274A208;
            v72 = v53;
            v68[0] = v15;
            v68[1] = 3221225472;
            v68[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_7;
            v68[3] = &unk_1E274C780;
            v69 = v72;
            v70 = v17;
            v55 = v72;
            objc_msgSend(v54, "animateWithDuration:delay:options:animations:completion:", 196608, v71, v68, v51 - v48, v48);

          }
          goto LABEL_22;
        }
        -[CKQuickActionButton delayForImageSwapAnimation](self, "delayForImageSwapAnimation");
        v60 = (uint64_t)(v61 * 1000000000.0);
      }
      v62 = dispatch_time(0, v60);
      v63[0] = v15;
      v63[1] = 3221225472;
      v63[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_8;
      v63[3] = &unk_1E27579E8;
      v63[4] = self;
      v66 = a3;
      v67 = 0x3FD3333333333333;
      v64 = v16;
      v65 = v17;
      dispatch_after(v62, MEMORY[0x1E0C80D38], v63);

    }
    else
    {
      v16[2](v16);
      v17[2](v17);
    }
LABEL_22:

    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v87 = a3;
      v88 = 2112;
      v89 = v10;
      _os_log_impl(&dword_18DFCD000, v56, OS_LOG_TYPE_INFO, "Deferring state config for state %lu. identifier: %@", buf, 0x16u);
    }

  }
  -[CKQuickActionButton deferredAnimationIdentifiers](self, "deferredAnimationIdentifiers");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addObject:", v10);

  -[CKQuickActionButton deferredConfigurationStates](self, "deferredConfigurationStates");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKey:", v59, v10);

LABEL_23:
}

void __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
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
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buttonImageForState:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "contentEdgeInsetsForState:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setContentEdgeInsets:");
  objc_msgSend(*(id *)(a1 + 32), "updateImageViewFrameForContentEdgeInsets");
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "theme");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "quickActionButtonGlyphColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTintColor:", v8);

      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFilters:", v12);

      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlpha:", 1.0);

      objc_msgSend(*(id *)(a1 + 32), "backgroundView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "theme");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "transcriptBackgroundColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBackgroundColor:", v17);

      objc_msgSend(*(id *)(a1 + 32), "backgroundView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAlpha:", 1.0);

      objc_msgSend(*(id *)(a1 + 32), "borderLayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v19, "setFillColor:", objc_msgSend(v20, "CGColor"));

      objc_msgSend(*(id *)(a1 + 32), "borderLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "theme");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "quickActionButtonStrokeColor");
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

      goto LABEL_5;
    case 1:
      v69 = 0.0;
      v70 = 0.0;
      v67 = 0.0;
      v68 = 0.0;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "theme");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "quickActionButtonGlyphColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "getRed:green:blue:alpha:", &v70, &v69, &v68, &v67);

      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", fmin(v70 + 0.2, 1.0), fmin(v69 + 0.2, 1.0), fmin(v68 + 0.2, 1.0), v67);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTintColor:", v28);

      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setFilters:", v33);

      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAlpha:", 1.0);

      objc_msgSend(*(id *)(a1 + 32), "backgroundView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "theme");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "transcriptBackgroundColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setBackgroundColor:", v38);

      objc_msgSend(*(id *)(a1 + 32), "backgroundView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setAlpha:", 1.0);

      objc_msgSend(*(id *)(a1 + 32), "borderLayer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v40, "setFillColor:", objc_msgSend(v41, "CGColor"));

      objc_msgSend(*(id *)(a1 + 32), "borderLayer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "theme");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "quickActionButtonStrokeColor");
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v42, "setStrokeColor:", objc_msgSend(v45, "CGColor"));

      objc_msgSend(*(id *)(a1 + 32), "borderLayer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setLineWidth:", 1.0);

      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setTintColor:", v48);

      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "layer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setFilters:", v52);

      objc_msgSend(*(id *)(a1 + 32), "imageView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setAlpha:", 1.0);

      objc_msgSend(*(id *)(a1 + 32), "backgroundView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "theme");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "quickActionButtonBurstColor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setBackgroundColor:", v57);

      objc_msgSend(*(id *)(a1 + 32), "backgroundView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "layer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v59, "setBorderColor:", objc_msgSend(v60, "CGColor"));

      objc_msgSend(*(id *)(a1 + 32), "backgroundView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "layer");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setBorderWidth:", 1.0);

      objc_msgSend(*(id *)(a1 + 32), "backgroundView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setAlpha:", 1.0);

      objc_msgSend(*(id *)(a1 + 32), "borderLayer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v64, "setFillColor:", objc_msgSend(v65, "CGColor"));

      objc_msgSend(*(id *)(a1 + 32), "borderLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v21, "setStrokeColor:", objc_msgSend(v22, "CGColor"));
LABEL_5:

      objc_msgSend(*(id *)(a1 + 32), "borderLayer");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setLineWidth:", 1.0);

      break;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
      break;
    default:
      return;
  }
}

void __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentAnimationIdentifier:", 0);
  objc_msgSend(*(id *)(a1 + 32), "deferredAnimationIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "deferredAnimationIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "deferredAnimationIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFirstObject");

    objc_msgSend(*(id *)(a1 + 32), "deferredConfigurationStates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(*(id *)(a1 + 32), "deferredConfigurationStates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

    objc_msgSend(*(id *)(a1 + 32), "configureForState:animated:identifier:wasDeferred:", v9, 1, v11, 1);
  }
  else
  {
    objc_msgSend(v4, "setAnimating:", 0);
  }
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  _OWORD v8[3];

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", v3);

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  v5 = *(void **)(a1 + 40);
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v5, "setTransform:", v8);
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_5(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return objc_msgSend(v1, "setTransform:", &v3);
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buttonImageForState:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "contentEdgeInsetsForState:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setContentEdgeInsets:");
  objc_msgSend(*(id *)(a1 + 32), "updateImageViewFrameForContentEdgeInsets");
  v5 = 0.0;
  if (*(_QWORD *)(a1 + 56) == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delayForFinalizingAnimation");
    v5 = v6;
  }
  v7 = (void *)MEMORY[0x1E0CEABB0];
  v8 = MEMORY[0x1E0C809B0];
  v9 = *(double *)(a1 + 64);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_9;
  v12[3] = &unk_1E274AED0;
  v13 = *(id *)(a1 + 40);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_10;
  v10[3] = &unk_1E274C308;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v12, v10, v9, v5);

}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__CKQuickActionButton_configureForState_animated_identifier_wasDeferred___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAnimating:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[CKQuickActionButton isAnimating](self, "isAnimating") != a3)
  {
    self->_animating = v3;
    -[CKQuickActionButton animationDelegate](self, "animationDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "quickActionButtonAnimationDidBegin:", self);
    else
      objc_msgSend(v5, "quickActionButtonAnimationDidEnd:", self);

  }
}

- (void)setState:(unint64_t)a3
{
  -[CKQuickActionButton setState:animated:](self, "setState:animated:", a3, 0);
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;

  v4 = a4;
  if (-[CKQuickActionButton state](self, "state") != a3)
  {
    self->_state = a3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CKQuickActionButton configureForState:animated:identifier:wasDeferred:](self, "configureForState:animated:identifier:wasDeferred:", a3, v4, v7, 0);

  }
}

- (void)_buttonTouchCanceled
{
  -[CKQuickActionButton setState:animated:](self, "setState:animated:", 0, 1);
}

- (void)_buttonTouchDown
{
  -[CKQuickActionButton setState:animated:](self, "setState:animated:", 1, 0);
}

- (void)_buttonTouchUpInside
{
  id v3;

  -[CKQuickActionButton delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quickActionButtonWasTapped:", self);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CKQuickActionButton button](self, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v14.x = x;
  v14.y = y;
  v9 = CGRectContainsPoint(v15, v14);

  if (v9)
  {
    -[CKQuickActionButton button](self, "button");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CKQuickActionButton;
    -[CKQuickActionButton hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (CKQuickActionButtonDelegate)delegate
{
  return (CKQuickActionButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKQuickActionButtonAnimationDelegate)animationDelegate
{
  return (CKQuickActionButtonAnimationDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void)setAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_animationDelegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (UIButton)button
{
  return self->_button;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (CAShapeLayer)borderLayer
{
  return self->_borderLayer;
}

- (NSString)currentAnimationIdentifier
{
  return self->_currentAnimationIdentifier;
}

- (void)setCurrentAnimationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentAnimationIdentifier, a3);
}

- (NSMutableArray)deferredAnimationIdentifiers
{
  return self->_deferredAnimationIdentifiers;
}

- (void)setDeferredAnimationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_deferredAnimationIdentifiers, a3);
}

- (NSMutableDictionary)deferredConfigurationStates
{
  return self->_deferredConfigurationStates;
}

- (void)setDeferredConfigurationStates:(id)a3
{
  objc_storeStrong((id *)&self->_deferredConfigurationStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredConfigurationStates, 0);
  objc_storeStrong((id *)&self->_deferredAnimationIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentAnimationIdentifier, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
