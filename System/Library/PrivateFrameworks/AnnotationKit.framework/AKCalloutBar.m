@implementation AKCalloutBar

- (AKCalloutBar)initWithFrame:(CGRect)a3
{
  AKCalloutBar *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _UIBackdropView *backgroundView;
  void *v8;
  void *v9;
  uint64_t v10;
  _UIBackdropView *separatorBackgroundView;
  void *v12;
  void *v13;
  uint64_t v14;
  UIImageView *blurMaskView;
  uint64_t v16;
  UIImageView *tintMaskView;
  uint64_t v18;
  UIImageView *separatorMaskView;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AKCalloutBar;
  v3 = -[AKCalloutBar initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKCalloutBar setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x24BDF7018]);
    -[AKCalloutBar bounds](v3, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:privateStyle:", 2050);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (_UIBackdropView *)v6;

    -[_UIBackdropView layer](v3->_backgroundView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    -[_UIBackdropView layer](v3->_backgroundView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", 0);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[_UIBackdropView performSelector:withObject:](v3->_backgroundView, "performSelector:withObject:", sel_setDisablesOccludedBackdropBlurs_, 0);
    -[AKCalloutBar bounds](v3, "bounds");
    -[_UIBackdropView setFrame:](v3->_backgroundView, "setFrame:");
    -[_UIBackdropView setAutoresizingMask:](v3->_backgroundView, "setAutoresizingMask:", 18);
    -[AKCalloutBar addSubview:](v3, "addSubview:", v3->_backgroundView);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDF7018]), "initWithPrivateStyle:", 2020);
    separatorBackgroundView = v3->_separatorBackgroundView;
    v3->_separatorBackgroundView = (_UIBackdropView *)v10;

    -[_UIBackdropView layer](v3->_separatorBackgroundView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

    -[_UIBackdropView layer](v3->_separatorBackgroundView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsGroupBlending:", 0);

    -[AKCalloutBar bounds](v3, "bounds");
    -[_UIBackdropView setFrame:](v3->_separatorBackgroundView, "setFrame:");
    -[_UIBackdropView setAutoresizingMask:](v3->_separatorBackgroundView, "setAutoresizingMask:", 18);
    -[AKCalloutBar addSubview:](v3, "addSubview:", v3->_separatorBackgroundView);
    v14 = -[AKCalloutBar newMaskView:](v3, "newMaskView:", 4);
    blurMaskView = v3->_blurMaskView;
    v3->_blurMaskView = (UIImageView *)v14;

    v16 = -[AKCalloutBar newMaskView:](v3, "newMaskView:", 3);
    tintMaskView = v3->_tintMaskView;
    v3->_tintMaskView = (UIImageView *)v16;

    v18 = -[AKCalloutBar newMaskView:](v3, "newMaskView:", 7);
    separatorMaskView = v3->_separatorMaskView;
    v3->_separatorMaskView = (UIImageView *)v18;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[AKCalloutBar setControls:](self, "setControls:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AKCalloutBar;
  -[AKCalloutBar dealloc](&v3, sel_dealloc);
}

- (id)newMaskView:(int64_t)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  objc_msgSend(v4, "_setBackdropMaskViewFlags:", a3);
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  return v4;
}

- (void)setBlurDisabled:(BOOL)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF7020], "settingsForPrivateStyle:graphicsQuality:", 2050, 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView transitionToSettings:](self->_backgroundView, "transitionToSettings:", v4);
    objc_msgSend(MEMORY[0x24BDF7020], "settingsForPrivateStyle:graphicsQuality:", 2020, 10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF7020], "settingsForPrivateStyle:", 2050);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropView transitionToSettings:](self->_backgroundView, "transitionToSettings:", v4);
    objc_msgSend(MEMORY[0x24BDF7020], "settingsForPrivateStyle:", 2020);
  }
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIBackdropView transitionToSettings:](self->_separatorBackgroundView, "transitionToSettings:", v5);
}

- (void)setHighlighted:(BOOL)a3 forControl:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MaxX;
  double MinX;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v4 = a3;
  v6 = a4;
  -[AKCalloutBar controls](self, "controls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v4)
    {
      -[AKCalloutBar dividerLineRectForControl:](self, "dividerLineRectForControl:", v8);
      v10 = v9;
      v25 = v11;
      v26 = v9;
      v12 = v11;
      v14 = v13;
      v27 = v15;
      -[AKCalloutBar dividerLineRectForControl:](self, "dividerLineRectForControl:", v8 - 1);
      x = v28.origin.x;
      y = v28.origin.y;
      width = v28.size.width;
      height = v28.size.height;
      MaxX = CGRectGetMaxX(v28);
      v29.origin.x = v10;
      v29.origin.y = v12;
      v29.size.width = v14;
      v29.size.height = v27;
      MinX = CGRectGetMinX(v29);
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      v22 = MinX - CGRectGetMaxX(v30);
      v31.origin.y = v25;
      v31.origin.x = v26;
      v31.size.width = v14;
      v31.size.height = v27;
      v23 = CGRectGetHeight(v31);
      v24 = 0.0;
    }
    else
    {
      MaxX = *MEMORY[0x24BDBF090];
      v24 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v22 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v23 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    v32.origin.x = MaxX;
    v32.origin.y = v24;
    v32.size.width = v22;
    v32.size.height = v23;
    if (!CGRectEqualToRect(v32, self->_highlightRect))
    {
      self->_highlightRect.origin.x = MaxX;
      self->_highlightRect.origin.y = v24;
      self->_highlightRect.size.width = v22;
      self->_highlightRect.size.height = v23;
      -[AKCalloutBar setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double Width;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  unint64_t v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  void *v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  void *v71;
  uint64_t v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  CGFloat v77;
  CGFloat v78;
  void *v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  void *v86;
  void *v87;
  uint64_t v88;
  unint64_t v89;
  void *v90;
  unint64_t v91;
  double v92;
  CGFloat v93;
  CGFloat v94;
  void *v95;
  objc_super v96;
  CGSize v97;
  CGSize v98;
  CGSize v99;
  CGSize v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;

  v96.receiver = self;
  v96.super_class = (Class)AKCalloutBar;
  -[AKCalloutBar layoutSubviews](&v96, sel_layoutSubviews);
  -[AKCalloutBar controls](self, "controls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCalloutBar sizeThatFitsControls:](self, "sizeThatFitsControls:", v3);
  v5 = v4;

  -[AKCalloutBar bounds](self, "bounds");
  Width = CGRectGetWidth(v101);
  -[AKCalloutBar controls](self, "controls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[AKCalloutBar controls](self, "controls");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    v12 = (Width - v5) / (double)(unint64_t)(2 * v8) + 6.0;
    v13 = v12;
    do
    {
      -[AKCalloutBar controls](self, "controls");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "frame");
      v17 = v16;
      v18 = round(v13);
      if (-[AKCalloutBar up](self, "up"))
        v19 = 14.0;
      else
        v19 = 0.0;
      objc_msgSend(v15, "setFrame:", v18, v19, v17, 38.0);
      v102.origin.x = v18;
      v102.origin.y = v19;
      v102.size.width = v17;
      v102.size.height = 38.0;
      v20 = CGRectGetWidth(v102);
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scale");
      v13 = v13 + v20 + 1.0 / v22 + v12 * 2.0;

      ++v11;
      -[AKCalloutBar controls](self, "controls");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

    }
    while (v11 < v24);
  }
  -[AKCalloutBar bounds](self, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v33 = 0.0;
  v97.width = v29;
  v97.height = v31;
  UIGraphicsBeginImageContextWithOptions(v97, 0, 0.0);
  if (-[AKCalloutBar up](self, "up"))
    v33 = 14.0;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "set");

  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", 0.0, v33, v30, 38.0, 8.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "fill");

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "set");

  if (-[AKCalloutBar up](self, "up"))
    v37 = 5.0;
  else
    v37 = 38.0;
  -[AKCalloutBar arrowX](self, "arrowX");
  v39 = v38;
  v103.origin.x = v26;
  v103.origin.y = v28;
  v103.size.width = v30;
  v103.size.height = v32;
  v40 = CGRectGetWidth(v103) + -17.0;
  if (v39 < v40)
    v40 = v39;
  v41 = fmax(v40, 17.0);
  v42 = round(v41 + -9.0);
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AKCalloutBar up](self, "up"))
  {
    objc_msgSend(v43, "moveToPoint:", v41, v37);
    v37 = v37 + 9.0;
  }
  else
  {
    objc_msgSend(v43, "moveToPoint:", v41, v37 + 9.0);
  }
  objc_msgSend(v43, "addLineToPoint:", v42, v37);
  objc_msgSend(v43, "addLineToPoint:", v42 + 18.0, v37);
  objc_msgSend(v43, "closePath");
  objc_msgSend(v43, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "set");

  -[AKCalloutBar controls](self, "controls");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "count");

  if (v47 >= 2)
  {
    v48 = 0;
    do
    {
      -[AKCalloutBar dividerLineRectForControl:](self, "dividerLineRectForControl:", v48);
      UIRectFillUsingBlendMode(v104, kCGBlendModeCopy);
      ++v48;
      -[AKCalloutBar controls](self, "controls");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count") - 1;

    }
    while (v48 < v50);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v51, "size");
  v53 = v52;
  v55 = v54;
  objc_msgSend(v51, "scale");
  v57 = v56;
  v98.width = v53;
  v98.height = v55;
  UIGraphicsBeginImageContextWithOptions(v98, 0, v57);
  v58 = *MEMORY[0x24BDBEFB0];
  v59 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v51, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x24BDBEFB0], v59, 1.0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "set");

  objc_msgSend(v51, "size");
  v62 = v61;
  objc_msgSend(v51, "size");
  v105.size.height = v63;
  v105.origin.x = 0.0;
  v105.origin.y = 0.0;
  v105.size.width = v62;
  UIRectFillUsingBlendMode(v105, kCGBlendModeSourceOut);
  UIGraphicsGetImageFromCurrentImageContext();
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_blurMaskView, "setImage:", v64);

  -[UIImageView sizeToFit](self->_blurMaskView, "sizeToFit");
  UIGraphicsEndImageContext();
  -[_UIBackdropView updateMaskViewsForView:](self->_backgroundView, "updateMaskViewsForView:", self->_blurMaskView);
  objc_msgSend(v51, "size");
  v66 = v65;
  v68 = v67;
  objc_msgSend(v51, "scale");
  v70 = v69;
  v99.width = v66;
  v99.height = v68;
  UIGraphicsBeginImageContextWithOptions(v99, 0, v70);
  objc_msgSend(v51, "drawAtPoint:blendMode:alpha:", 17, v58, v59, 1.0);
  if (!CGRectIsEmpty(self->_highlightRect))
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "_graphicsQuality");

    v73 = 0.75;
    if (v72 != 10)
      v73 = 0.4;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 0.0, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "set");

    UIRectFillUsingBlendMode(self->_highlightRect, kCGBlendModeSourceIn);
  }
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "set");

  objc_msgSend(v51, "size");
  v77 = v76;
  objc_msgSend(v51, "size");
  v106.size.height = v78;
  v106.origin.x = 0.0;
  v106.origin.y = 0.0;
  v106.size.width = v77;
  UIRectFillUsingBlendMode(v106, kCGBlendModeSourceOut);
  UIGraphicsGetImageFromCurrentImageContext();
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_tintMaskView, "setImage:", v79);

  -[UIImageView sizeToFit](self->_tintMaskView, "sizeToFit");
  UIGraphicsEndImageContext();
  -[_UIBackdropView updateMaskViewsForView:](self->_backgroundView, "updateMaskViewsForView:", self->_tintMaskView);
  objc_msgSend(v51, "size");
  v81 = v80;
  v83 = v82;
  objc_msgSend(v51, "scale");
  v85 = v84;
  v100.width = v81;
  v100.height = v83;
  UIGraphicsBeginImageContextWithOptions(v100, 0, v85);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "set");

  -[AKCalloutBar controls](self, "controls");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "count");

  if (v88 != 1)
  {
    v89 = 0;
    do
    {
      -[AKCalloutBar dividerLineRectForControl:](self, "dividerLineRectForControl:", v89);
      UIRectFillUsingBlendMode(v107, kCGBlendModeCopy);
      ++v89;
      -[AKCalloutBar controls](self, "controls");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "count") - 1;

    }
    while (v89 < v91);
  }
  objc_msgSend(v44, "drawAtPoint:blendMode:alpha:", 22, v58, v59, 1.0);
  objc_msgSend(v51, "size");
  v93 = v92;
  objc_msgSend(v51, "size");
  v108.size.height = v94;
  v108.origin.x = 0.0;
  v108.origin.y = 0.0;
  v108.size.width = v93;
  UIRectFillUsingBlendMode(v108, kCGBlendModeSourceOut);
  UIGraphicsGetImageFromCurrentImageContext();
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_separatorMaskView, "setImage:", v95);

  -[UIImageView sizeToFit](self->_separatorMaskView, "sizeToFit");
  UIGraphicsEndImageContext();
  -[_UIBackdropView updateMaskViewsForView:](self->_separatorBackgroundView, "updateMaskViewsForView:", self->_separatorMaskView);

}

- (CGRect)dividerLineRectForControl:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double MinX;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  if (a3 < 0)
  {
    v15 = 0.0;
  }
  else
  {
    -[AKCalloutBar controls](self, "controls");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;

    if (v9 <= a3)
    {
      -[AKCalloutBar bounds](self, "bounds");
      v15 = v16;
    }
    else
    {
      -[AKCalloutBar controls](self, "controls");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[AKCalloutBar controls](self, "controls");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", a3 + 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "frame");
      MinX = CGRectGetMinX(v21);
      objc_msgSend(v11, "frame");
      v15 = round((MinX + CGRectGetMaxX(v22) + -1.0) * 0.5);

    }
  }
  v17 = 1.0 / v7;
  v18 = 52.0;
  v19 = v15;
  v20 = 0.0;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[AKCalloutBar controls](self, "controls", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCalloutBar sizeThatFitsControls:](self, "sizeThatFitsControls:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setControls:(id)a3
{
  NSArray *v5;
  NSArray **p_controls;
  NSArray *controls;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = (NSArray *)a3;
  p_controls = &self->_controls;
  controls = self->_controls;
  if (controls != v5)
  {
    v23 = v5;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = controls;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v13, "removeFromSuperview");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v13, "setBar:", 0);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_controls, a3);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = *p_controls;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = v19;
            objc_msgSend(v20, "setBar:", self);
            v21 = -[NSArray indexOfObject:](*p_controls, "indexOfObject:", v20);
            if (v21)
            {
              if (v21 == -[NSArray count](*p_controls, "count") - 1)
                v22 = 2;
              else
                v22 = 1;
            }
            else
            {
              v22 = 0;
            }
            objc_msgSend(v20, "setPosition:", v22);

          }
          -[AKCalloutBar addSubview:](self, "addSubview:", v19);
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v16);
    }

    -[AKCalloutBar setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v23;
  }

}

- (CGSize)sizeThatFitsControls:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  uint64_t v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;
  CGSize result;
  CGRect v19;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = 12.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "frame");
        v7 = v7 + CGRectGetWidth(v19);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 12.0;
  }
  v9 = objc_msgSend(v3, "count");

  v10 = v7 + (double)(unint64_t)(v9 - 1) * 13.0;
  v11 = 52.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)arrowX
{
  return self->_arrowX;
}

- (void)setArrowX:(double)a3
{
  self->_arrowX = a3;
}

- (BOOL)up
{
  return self->_up;
}

- (void)setUp:(BOOL)a3
{
  self->_up = a3;
}

- (NSArray)controls
{
  return self->_controls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorMaskView, 0);
  objc_storeStrong((id *)&self->_tintMaskView, 0);
  objc_storeStrong((id *)&self->_blurMaskView, 0);
  objc_storeStrong((id *)&self->_separatorBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_controls, 0);
}

@end
