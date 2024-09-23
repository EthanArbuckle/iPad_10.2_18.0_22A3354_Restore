@implementation LAUIPhysicalButtonView

- (LAUIPhysicalButtonView)init
{

  return 0;
}

- (LAUIPhysicalButtonView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (LAUIPhysicalButtonView)initWithStyle:(int64_t)a3
{
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  LAUIPhysicalButtonView *v9;
  void *v10;
  uint64_t v11;
  UIView *containerView;
  UIView *v13;
  UIView *buttonView;
  UILabel *v15;
  UILabel *instructionLabel;
  UILabel *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  void *v33;
  objc_super v34;

  v4 = (double *)MEMORY[0x24BDBF090];
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v34.receiver = self;
  v34.super_class = (Class)LAUIPhysicalButtonView;
  v9 = -[LAUIPhysicalButtonView initWithFrame:](&v34, sel_initWithFrame_, v5, v6, v7, v8);
  if (v9)
  {
    v9->_export = SBSUIHardwareButtonHintViewsSupported();
    v9->_style = a3;
    -[LAUIPhysicalButtonView _colorForStyle:](v9, "_colorForStyle:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", *v4, v4[1], v4[2], v4[3]);
    containerView = v9->_containerView;
    v9->_containerView = (UIView *)v11;

    -[LAUIPhysicalButtonView addSubview:](v9, "addSubview:", v9->_containerView);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    buttonView = v9->_buttonView;
    v9->_buttonView = v13;

    -[UIView setBackgroundColor:](v9->_buttonView, "setBackgroundColor:", v10);
    -[UIView layer](v9->_buttonView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCornerCurve:", *MEMORY[0x24BDE58E8]);
    -[UIView addSubview:](v9->_containerView, "addSubview:", v9->_buttonView);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    instructionLabel = v9->_instructionLabel;
    v9->_instructionLabel = v15;

    -[UILabel setLineBreakMode:](v9->_instructionLabel, "setLineBreakMode:", 4);
    -[UILabel setMinimumScaleFactor:](v9->_instructionLabel, "setMinimumScaleFactor:", 0.75);
    -[UILabel setAdjustsFontSizeToFitWidth:](v9->_instructionLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v17 = v9->_instructionLabel;
    v18 = (void *)MEMORY[0x24BDF6A70];
    v19 = (id)*MEMORY[0x24BDF7658];
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "preferredContentSizeCategory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19
      && (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDF76C0]) & 1) == 0
      && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v21, (UIContentSizeCategory)v19) == NSOrderedDescending)
    {
      v22 = v19;

      v21 = v22;
    }

    v23 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithPreferredContentSizeCategory:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x24BDF77B0], v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "_scaledValueForValue:", 19.0);
    v27 = v26;

    objc_msgSend(v18, "systemFontOfSize:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v28);

    -[UILabel setTextColor:](v9->_instructionLabel, "setTextColor:", v10);
    v29 = v9->_instructionLabel;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v29, "setBackgroundColor:", v30);

    -[UILabel setAlpha:](v9->_instructionLabel, "setAlpha:", 0.0);
    -[UILabel setNumberOfLines:](v9->_instructionLabel, "setNumberOfLines:", 0);
    -[UIView addSubview:](v9->_containerView, "addSubview:", v9->_instructionLabel);
    -[LAUIPhysicalButtonView setAnimationStyle:](v9, "setAnimationStyle:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v9, sel_interfaceOrientationDidChange_, *MEMORY[0x24BDF76D8], 0);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSHardwareButtonHintViewContentVisibilityControlling invalidate](self->_exportedHandle, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)LAUIPhysicalButtonView;
  -[LAUIPhysicalButtonView dealloc](&v3, sel_dealloc);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  UICoordinateSpace *v6;
  UICoordinateSpace *fixedCoordinateSpace;
  UICoordinateSpace *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LAUIPhysicalButtonView;
  -[LAUIPhysicalButtonView didMoveToWindow](&v9, sel_didMoveToWindow);
  -[LAUIPhysicalButtonView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastInterfaceOrientation = objc_msgSend(v4, "interfaceOrientation");

  if (v3)
  {
    objc_msgSend(v3, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fixedCoordinateSpace");
    v6 = (UICoordinateSpace *)objc_claimAutoreleasedReturnValue();
    fixedCoordinateSpace = self->_fixedCoordinateSpace;
    self->_fixedCoordinateSpace = v6;

    -[LAUIPhysicalButtonView setNeedsLayout](self, "setNeedsLayout");
    -[LAUIPhysicalButtonView updateFrame](self, "updateFrame");

  }
  else
  {
    v8 = self->_fixedCoordinateSpace;
    self->_fixedCoordinateSpace = 0;

    -[LAUIPhysicalButtonViewAnimation endImmediately](self->_animation, "endImmediately");
  }
  -[LAUIPhysicalButtonView _updateOnScreen](self, "_updateOnScreen");

}

- (void)interfaceOrientationDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  unint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  double v14;
  _QWORD v15[5];
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_workaroundsDisabled)
  {
    if (self->_lastInterfaceOrientation)
    {
      -[LAUIPhysicalButtonView window](self, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[LAUIPhysicalButtonView window](self, "window");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "windowScene");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "interfaceOrientation");

        LA_LOG_LAUIPhysicalButtonView();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = self->_lastInterfaceOrientation - 1;
          if (v10 > 3)
            v11 = CFSTR("Unknown");
          else
            v11 = off_24C27E9C8[v10];
          if ((unint64_t)(v8 - 1) > 3)
            v12 = CFSTR("Unknown");
          else
            v12 = off_24C27E9C8[v8 - 1];
          *(_DWORD *)buf = 138412546;
          v17 = v11;
          v18 = 2112;
          v19 = v12;
          _os_log_impl(&dword_209E00000, v9, OS_LOG_TYPE_DEFAULT, "Interface orientation did change notification triggered _lastInterfaceOrientation: %@ currentInterfaceOrientation: %@", buf, 0x16u);
        }

        if (v8 != self->_lastInterfaceOrientation)
        {
          -[LAUIPhysicalButtonView layer](self, "layer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v14) = 0;
          objc_msgSend(v13, "setOpacity:", v14);

          self->_lastInterfaceOrientation = v8;
          v15[0] = MEMORY[0x24BDAC760];
          v15[1] = 3221225472;
          v15[2] = __56__LAUIPhysicalButtonView_interfaceOrientationDidChange___block_invoke;
          v15[3] = &unk_24C27E930;
          v15[4] = self;
          objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0, v15, 0, 0.1, 0.4);
        }
      }
    }
  }

}

void __56__LAUIPhysicalButtonView_interfaceOrientationDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = 1.0;
  v3 = v1;
  objc_msgSend(v1, "setOpacity:", v2);

}

- (void)updateFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UICoordinateSpace *v8;
  UICoordinateSpace *coordinateSpace;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  const __CFString *v20;
  NSObject *v21;
  __CFString *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  UICoordinateSpace *v31;
  uint64_t v32;
  unsigned int v36;
  unsigned int edge;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  NSObject *v46;
  __CFString *v47;
  double v48;
  double v49;
  NSObject *v50;
  const char *v51;
  double rect;
  uint8_t buf[4];
  const __CFString *v54;
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v55 = *MEMORY[0x24BDAC8D0];
  if (self->_fixedCoordinateSpace)
  {
    -[LAUIPhysicalButtonView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
LABEL_39:

      return;
    }
    -[LAUIPhysicalButtonView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
LABEL_38:

      goto LABEL_39;
    }
    objc_msgSend(v4, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    objc_msgSend(v7, "coordinateSpace");
    v8 = (UICoordinateSpace *)objc_claimAutoreleasedReturnValue();
    coordinateSpace = self->_coordinateSpace;
    self->_coordinateSpace = v8;

    -[UICoordinateSpace bounds](self->_fixedCoordinateSpace, "bounds");
    -[LAUIPhysicalButtonView _physicalButtonNormalizedFrame](self, "_physicalButtonNormalizedFrame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    LA_LOG_LAUIPhysicalButtonView();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v6, "interfaceOrientation");
      if ((unint64_t)(v19 - 1) > 3)
        v20 = CFSTR("Unknown");
      else
        v20 = off_24C27E9C8[v19 - 1];
      *(_DWORD *)buf = 138412290;
      v54 = v20;
      _os_log_impl(&dword_209E00000, v18, OS_LOG_TYPE_DEFAULT, "LA: current orientation: %@", buf, 0xCu);
    }

    LA_LOG_LAUIPhysicalButtonView();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{ x:%.3f, y:%.3f, w:%.3f, h:%.3f }"), v11, v13, v15, v17);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v54 = v22;
      _os_log_impl(&dword_209E00000, v21, OS_LOG_TYPE_DEFAULT, "MG: physical button normalized frame: %@", buf, 0xCu);

    }
    -[UICoordinateSpace convertRect:fromCoordinateSpace:](self->_coordinateSpace, "convertRect:fromCoordinateSpace:", self->_fixedCoordinateSpace);
    rect = v23;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    if (self->_export)
      v30 = 5.0;
    else
      v30 = 6.0;
    v31 = self->_coordinateSpace;
    -[UICoordinateSpace bounds](self->_fixedCoordinateSpace, "bounds");
    -[UICoordinateSpace convertRect:fromCoordinateSpace:](v31, "convertRect:fromCoordinateSpace:", self->_fixedCoordinateSpace);
    if (v29 <= 0.0)
    {
      if (v27 >= CGRectGetMidY(*(CGRect *)&v32))
      {
        v27 = v27 - v30;
        v36 = 3u;
      }
      else
      {
        v36 = 1u;
      }
      v29 = v30;
    }
    else
    {
      if (v25 >= CGRectGetMidX(*(CGRect *)&v32))
      {
        v25 = v25 - v30;
        v36 = 2u;
      }
      else
      {
        v36 = 0;
      }
      rect = v30;
    }
    edge = self->_edge;
    if (edge != v36)
    {
      self->_edge = v36;
      __asm { BR              X10 ; loc_209E027F0 loc_209E02838 loc_209E0284C }
    }
    objc_msgSend(v3, "convertRect:fromCoordinateSpace:", self->_coordinateSpace, v25, v27, rect, v29);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    LA_LOG_LAUIPhysicalButtonView();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{ x:%.3f, y:%.3f, w:%.3f, h:%.3f }"), *(_QWORD *)&v39, *(_QWORD *)&v41, *(_QWORD *)&v43, *(_QWORD *)&v45);
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v54 = v47;
      _os_log_impl(&dword_209E00000, v46, OS_LOG_TYPE_DEFAULT, "LA: physical button view frame: %@", buf, 0xCu);

    }
    if (self->_exportedHandle || self->_exporting)
    {
      v48 = *MEMORY[0x24BDBEFB0];
      v49 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      -[LAUIPhysicalButtonView bounds](self, "bounds");
      v58.origin.x = v48;
      v58.origin.y = v49;
      v58.size.width = v43;
      v58.size.height = v45;
      if (CGRectEqualToRect(v56, v58))
      {
LABEL_34:
        if (edge != v36)
        {
          if (-[LAUIPhysicalButtonViewAnimation isRunning](self->_animation, "isRunning"))
          {
            -[LAUIPhysicalButtonViewAnimation endImmediately](self->_animation, "endImmediately");
            -[LAUIPhysicalButtonViewAnimation begin](self->_animation, "begin");
          }
        }

        goto LABEL_38;
      }
      -[LAUIPhysicalButtonView setBounds:](self, "setBounds:", v48, v49, v43, v45);
      LA_LOG_LAUIPhysicalButtonView();
      v50 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
LABEL_33:

        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      v51 = "LA: physical button view bounds updated - exported view was incorrectly sized";
    }
    else
    {
      -[LAUIPhysicalButtonView frame](self, "frame");
      v59.origin.x = v39;
      v59.origin.y = v41;
      v59.size.width = v43;
      v59.size.height = v45;
      if (CGRectEqualToRect(v57, v59))
        goto LABEL_34;
      -[LAUIPhysicalButtonView setFrame:](self, "setFrame:", v39, v41, v43, v45);
      LA_LOG_LAUIPhysicalButtonView();
      v50 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      *(_WORD *)buf = 0;
      v51 = "LA: physical button view frame updated";
    }
    _os_log_impl(&dword_209E00000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 2u);
    goto LABEL_33;
  }
}

- (void)disableWorkarounds
{
  id v3;

  if (!self->_workaroundsDisabled)
  {
    self->_workaroundsDisabled = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF76D8], 0);

  }
}

- (void)setStyle:(int64_t)a3
{
  id v4;

  if (self->_style != a3)
  {
    self->_style = a3;
    -[LAUIPhysicalButtonView _colorForStyle:](self, "_colorForStyle:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_buttonView, "setBackgroundColor:");
    -[UILabel setTextColor:](self->_instructionLabel, "setTextColor:", v4);

  }
}

- (void)setAnimationStyle:(int64_t)a3
{
  LAUIPhysicalButtonViewAnimation *animation;
  LAUIPhysicalButtonViewAnimation *v6;
  void *v7;
  LAUIPhysicalButtonViewBounceAnimation *v8;
  LAUIPhysicalButtonViewAnimation *v9;
  LAUIPhysicalButtonViewShimmerAnimation *v10;
  LAUIPhysicalButtonViewAnimation *v11;

  if (self->_animationStyle != a3)
  {
    self->_animationStyle = a3;
    animation = self->_animation;
    if (animation)
    {
      -[LAUIPhysicalButtonViewAnimation endImmediately](animation, "endImmediately");
      v6 = self->_animation;
      self->_animation = 0;

    }
    if (a3 == 2)
    {
      v10 = [LAUIPhysicalButtonViewShimmerAnimation alloc];
      -[UILabel layer](self->_instructionLabel, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[LAUIPhysicalButtonViewAnimation initWith:layer:](v10, "initWith:layer:", self, v7);
    }
    else
    {
      if (a3 != 1)
      {
        if (a3)
          goto LABEL_12;
        v7 = self->_animation;
        self->_animation = 0;
LABEL_11:

LABEL_12:
        if (self->_onScreen)
          -[LAUIPhysicalButtonViewAnimation begin](self->_animation, "begin");
        return;
      }
      v8 = [LAUIPhysicalButtonViewBounceAnimation alloc];
      -[UIView layer](self->_containerView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[LAUIPhysicalButtonViewAnimation initWith:layer:](v8, "initWith:layer:", self, v7);
    }
    v11 = self->_animation;
    self->_animation = v9;

    goto LABEL_11;
  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  unsigned int edge;
  double v7;
  unsigned int v8;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
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
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double height;
  double y;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat amount;
  double v64;
  double v65;
  double v66;
  double v67;
  CGRect slice;
  CGRect remainder;
  objc_super v70;
  CGRect v71;
  CGRect v72;

  v70.receiver = self;
  v70.super_class = (Class)LAUIPhysicalButtonView;
  -[LAUIPhysicalButtonView layoutSubviews](&v70, sel_layoutSubviews);
  -[LAUIPhysicalButtonView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v64 = v5;
  edge = self->_edge;
  if (self->_export)
    v7 = 44.0;
  else
    v7 = 8.0;
  v8 = edge & 0xFFFFFFFD;
  if ((edge & 0xFFFFFFFD) != 0)
    v9 = 20.0;
  else
    v9 = 8.0;
  -[LAUIPhysicalButtonView bounds](self, "bounds");
  v65 = v11;
  v66 = v10;
  v13 = v12;
  v15 = v14;
  v62 = v7;
  -[UICoordinateSpace bounds](self->_coordinateSpace, "bounds");
  -[LAUIPhysicalButtonView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", self->_coordinateSpace);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if (v8)
    v24 = 40.0;
  else
    v24 = 16.0;
  -[LAUIPhysicalButtonViewAnimation update](self->_animation, "update");
  v59 = v23;
  v60 = v19;
  v25 = v13;
  if ((edge | 2) == 2)
  {
    if (self->_export)
      v25 = v13;
    else
      v25 = v13 * 4.0;
  }
  v61 = v17;
  v26 = v25;
  v27 = v15;
  if ((edge | 2) != 2)
  {
    v26 = v15 * 4.0;
    if (self->_export)
      v26 = v15;
    v27 = v26;
  }
  amount = v26;
  -[UILabel sizeThatFits:](self->_instructionLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v67 = v28;
  v30 = v29;
  v56 = v21 - v24;
  if (self->_coordinateSpace)
  {
    v31 = 0.0;
    if (!v8)
      v31 = v13;
    v32 = v21 - v24 - v31;
    v33 = fmin(v30, v32);
    if (v32 > 0.0)
      v30 = v33;
  }
  v34 = v13;
  if ((edge | 2) == 2)
    v34 = v25 + v30 + 8.0;
  v35 = v15;
  if ((edge | 2) == 2)
  {
    v36 = v25 - v13;
  }
  else
  {
    v35 = v27 + v67 + 8.0;
    v36 = v27 - v15;
  }
  v37 = v34;
  if ((edge | 2) != 2)
    v37 = v35;
  v58 = v9;
  v38 = v37 - v36;
  switch(self->_edge)
  {
    case 0u:
      if (!self->_onScreen)
        v36 = v62 + v34;
      v39 = v66 - v36;
      goto LABEL_43;
    case 1u:
      if (!self->_onScreen)
        v36 = v62 + v35;
      v40 = v65 - v36;
      goto LABEL_45;
    case 2u:
      v42 = v65;
      v41 = v66;
      v43 = v13;
      v44 = v15;
      if (self->_onScreen)
        v39 = CGRectGetMaxX(*(CGRect *)&v41) - v38;
      else
        v39 = v62 + CGRectGetMaxX(*(CGRect *)&v41);
LABEL_43:
      v40 = v65;
      break;
    case 3u:
      v46 = v65;
      v45 = v66;
      v47 = v13;
      v48 = v15;
      if (self->_onScreen)
        v40 = CGRectGetMaxY(*(CGRect *)&v45) - v38;
      else
        v40 = v62 + CGRectGetMaxY(*(CGRect *)&v45);
LABEL_45:
      v39 = v66;
      break;
    default:
      v39 = *MEMORY[0x24BDBEFB0];
      v40 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      break;
  }
  -[UIView setFrame:](self->_containerView, "setFrame:", v39, v40, v34, v35, *(_QWORD *)&v56);
  -[UIView bounds](self->_containerView, "bounds");
  remainder = v71;
  CGRectDivide(v71, &slice, &remainder, amount, (CGRectEdge)self->_edge);
  v49 = fmax(v64, 1.0);
  -[UIView setFrame:](self->_buttonView, "setFrame:", round(v49 * (slice.origin.x + (slice.size.width - v25) * 0.5)) / v49, round(v49 * (slice.origin.y + (slice.size.height - v27) * 0.5)) / v49, v25, v27);
  -[UIView layer](self->_buttonView, "layer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  if (self->_export)
    v52 = round(v49 * fmin(v25 * 0.5, v27 * 0.5)) / v49;
  else
    v52 = 5.0;
  objc_msgSend(v50, "setCornerRadius:", v52);

  CGRectDivide(remainder, &slice, &remainder, 8.0, (CGRectEdge)self->_edge);
  height = remainder.size.height;
  y = remainder.origin.y;
  v55 = round(v49 * (remainder.origin.x + (remainder.size.width - v30) * 0.5)) / v49;
  if ((edge | 2) != 2 && self->_coordinateSpace)
  {
    -[UIView convertRect:fromView:](self->_containerView, "convertRect:fromView:", self, v58 + v61, v60 + 8.0, v57, v59 + -16.0);
    v55 = fmin(CGRectGetMaxX(v72) - v30, fmax(v72.origin.x, v55));
  }
  -[UILabel setFrame:](self->_instructionLabel, "setFrame:", v55, round(v49 * (y + (height - v67) * 0.5)) / v49, v30);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self->_containerView, "frame", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  LAUIPhysicalButtonView *v6;
  LAUIPhysicalButtonView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LAUIPhysicalButtonView;
  -[LAUIPhysicalButtonView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = self;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)_colorForStyle:(int64_t)a3
{
  int64_t style;
  void *v4;

  style = self->_style;
  if (style == 2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_6:
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.56, 0.56, 0.58, 1.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (style != 1)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", a3, 0.9803922, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_6;
  }
  return v4;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    -[LAUIPhysicalButtonView _updateOnScreen](self, "_updateOnScreen");
  }
}

- (void)_updateOnScreen
{
  uint64_t v3;
  void *v4;
  SBSHardwareButtonHintViewContentVisibilityControlling *exportedHandle;
  SBSHardwareButtonHintViewContentVisibilityControlling *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  SBSHardwareButtonHintViewContentVisibilityControlling *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  CAAnimation *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  CALayer *v40;
  id v41;
  LAUIPhysicalButtonViewAnimation *animation;
  SBSHardwareButtonHintViewContentVisibilityControlling *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void *v47;
  id v48;
  _QWORD v49[9];
  id v50;
  id location;

  -[LAUIPhysicalButtonView window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!self->_animating || v3 == 0)
  {
    if (!v3)
    {
      exportedHandle = self->_exportedHandle;
      if (exportedHandle)
      {
        -[SBSHardwareButtonHintViewContentVisibilityControlling invalidate](exportedHandle, "invalidate");
        v7 = self->_exportedHandle;
        self->_exportedHandle = 0;

        -[LAUIPhysicalButtonView updateFrame](self, "updateFrame");
      }
    }
    v9 = 0;
    v8 = 0;
  }
  else
  {
    v8 = !self->_isInstructionHidden;
    v9 = !self->_isInstructionHidden;
  }
  if (self->_onScreen != v9)
  {
    -[LAUIPhysicalButtonView layoutIfNeeded](self, "layoutIfNeeded");
    self->_onScreen = v9;
    v10 = MEMORY[0x24BDAC760];
    if (v8 && self->_export && !self->_exportedHandle && !self->_exporting)
    {
      self->_exporting = 1;
      objc_initWeak(&location, self);
      v49[5] = v10;
      v49[6] = 3221225472;
      v49[7] = __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke;
      v49[8] = &unk_24C27E980;
      objc_copyWeak(&v50, &location);
      SBSUIRegisterHardwareButtonHintViewAsync();
      objc_destroyWeak(&v50);
      objc_destroyWeak(&location);
    }
    -[UIView frame](self->_containerView, "frame");
    v12 = v11;
    v14 = v13;
    -[LAUIPhysicalButtonView setNeedsLayout](self, "setNeedsLayout");
    v49[0] = v10;
    v49[1] = 3221225472;
    v49[2] = __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_3;
    v49[3] = &unk_24C27E930;
    v49[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v49);
    -[UIView frame](self->_containerView, "frame");
    v17 = v16;
    v18 = v15;
    if (v12 == v16 && v14 == v15)
    {
      if (self->_onScreen)
      {
        v27 = self->_exportedHandle;
        v28 = 1;
      }
      else
      {
        v27 = self->_exportedHandle;
        if (!self->_visibilityAnimationCount)
        {
          v39 = 0.0;
          if (v27)
          {
            -[SBSHardwareButtonHintViewContentVisibilityControlling invalidate](v27, "invalidate");
            v43 = self->_exportedHandle;
            self->_exportedHandle = 0;

            -[LAUIPhysicalButtonView updateFrame](self, "updateFrame");
          }
          goto LABEL_29;
        }
        v28 = 0;
      }
      v39 = 0.0;
      -[SBSHardwareButtonHintViewContentVisibilityControlling setContentVisibility:animationSettings:](v27, "setContentVisibility:animationSettings:", v28, 0);
    }
    else
    {
      if (self->_onScreen)
      {
        objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("position"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setMass:", 1.0);
        objc_msgSend(v20, "setStiffness:", 109.6623);
        objc_msgSend(v20, "setDamping:", 14.6608);
        objc_msgSend(v20, "setVelocity:", 0.0);
        LODWORD(v21) = 1036831949;
        LODWORD(v22) = 0.25;
        LODWORD(v23) = 0.25;
        LODWORD(v24) = 1.0;
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v22, v21, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setTimingFunction:", v25);

        objc_msgSend(v20, "durationForEpsilon:", 0.001);
        objc_msgSend(v20, "setDuration:");
        v26 = v20;
        -[SBSHardwareButtonHintViewContentVisibilityControlling setContentVisibility:animationSettings:](self->_exportedHandle, "setContentVisibility:animationSettings:", 1, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v30) = 1036831949;
        LODWORD(v31) = 0.25;
        LODWORD(v32) = 0.25;
        LODWORD(v33) = 1.0;
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v31, v30, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setTimingFunction:", v34);

        objc_msgSend(v29, "setDuration:", 0.25);
        v26 = v29;
        -[SBSHardwareButtonHintViewContentVisibilityControlling setContentVisibility:animationSettings:](self->_exportedHandle, "setContentVisibility:animationSettings:", 0, 0);
      }

      ++self->_visibilityAnimationCount;
      objc_initWeak(&location, self);
      v44 = v10;
      v45 = 3221225472;
      v46 = __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_4;
      v47 = &unk_24C27E9A8;
      objc_copyWeak(&v48, &location);
      objc_msgSend(v26, "laui_setDidStopHandler:", &v44);
      objc_msgSend(v26, "setAdditive:", 1, v44, v45, v46, v47);
      objc_msgSend(v26, "setFillMode:", *MEMORY[0x24BDE5980]);
      v35 = (CAAnimation *)v26;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", v12 - v17, v14 - v18);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAAnimation setFromValue:](v35, "setFromValue:", v36);

      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAAnimation setToValue:](v35, "setToValue:", v37);

      -[CAAnimation duration](v35, "duration");
      v39 = v38;
      -[UIView layer](self->_containerView, "layer");
      v40 = (CALayer *)objc_claimAutoreleasedReturnValue();
      v41 = LAUILayerAddAdditiveAnimation(v40, 0, v35);

      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);

    }
LABEL_29:
    animation = self->_animation;
    if (self->_onScreen)
      -[LAUIPhysicalButtonViewAnimation beginWithDelay:](animation, "beginWithDelay:", v39);
    else
      -[LAUIPhysicalButtonViewAnimation end](animation, "end");
  }

}

void __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_2;
  v5[3] = &unk_24C27E958;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_BYTE *)WeakRetained + 417) = 0;
    if (*((_BYTE *)WeakRetained + 460))
    {
      objc_storeStrong(WeakRetained + 53, *(id *)(a1 + 32));
      objc_msgSend(v3[53], "setContentVisibility:animationSettings:", 1, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      objc_msgSend(v3, "updateFrame");
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

uint64_t __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __41__LAUIPhysicalButtonView__updateOnScreen__block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = WeakRetained[54] - 1;
    WeakRetained[54] = v1;
    if (!v1 && !*((_BYTE *)WeakRetained + 460))
    {
      v2 = (void *)WeakRetained[53];
      if (v2)
      {
        objc_msgSend(v2, "invalidate");
        v3 = (void *)WeakRetained[53];
        WeakRetained[53] = 0;

        objc_msgSend(WeakRetained, "updateFrame");
      }
    }
  }

}

- (void)setInstruction:(id)a3
{
  NSString *v4;
  NSString *instruction;
  NSString *v6;
  NSString *v7;
  double v8;
  NSString *v9;
  NSString *v10;

  v9 = (NSString *)a3;
  if (-[NSString length](v9, "length"))
  {
    v4 = v9;
  }
  else
  {

    v4 = 0;
  }
  instruction = self->_instruction;
  v10 = v4;
  if (instruction != v4 && (!v4 || !instruction || (-[NSString isEqual:](instruction, "isEqual:", v4) & 1) == 0))
  {
    v6 = (NSString *)-[NSString copy](v10, "copy");
    v7 = self->_instruction;
    self->_instruction = v6;

    -[UILabel setText:](self->_instructionLabel, "setText:", self->_instruction);
    v8 = 0.0;
    if (self->_instruction)
      v8 = 1.0;
    -[UILabel setAlpha:](self->_instructionLabel, "setAlpha:", v8);
    -[LAUIPhysicalButtonView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setIsInstructionHidden:(BOOL)a3
{
  if (self->_isInstructionHidden != a3)
  {
    self->_isInstructionHidden = a3;
    -[LAUIPhysicalButtonView _updateOnScreen](self, "_updateOnScreen");
  }
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)animationStyle
{
  return self->_animationStyle;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (unsigned)edge
{
  return self->_edge;
}

- (NSString)instruction
{
  return self->_instruction;
}

- (BOOL)isInstructionHidden
{
  return self->_isInstructionHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instruction, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_fixedCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_exportedHandle, 0);
}

@end
