@implementation CKTypingIndicatorLayer

- (CKTypingIndicatorLayer)init
{
  CKTypingIndicatorLayer *v2;
  CKTypingIndicatorLayer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKTypingIndicatorLayer;
  v2 = -[CKTypingIndicatorLayer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKTypingIndicatorLayer _setup](v2, "_setup");
  return v3;
}

- (id)initHighlighted:(BOOL)a3
{
  CKTypingIndicatorLayer *v4;
  CKTypingIndicatorLayer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTypingIndicatorLayer;
  v4 = -[CKTypingIndicatorLayer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_highlighted = a3;
    -[CKTypingIndicatorLayer _setup](v4, "_setup");
  }
  return v5;
}

- (double)convertedCurrentMediaTime
{
  double result;

  -[CKTypingIndicatorLayer convertTime:fromLayer:](self, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  return result;
}

- (void)setBubbleColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_bubbleColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_bubbleColor, a3);
    -[CKTypingIndicatorLayer _updateBubbleColors](self, "_updateBubbleColors");
    v5 = v6;
  }

}

- (void)setBubbleOpacity:(double)a3
{
  if (self->_bubbleOpacity != a3)
  {
    self->_bubbleOpacity = a3;
    -[CKTypingIndicatorLayer _updateBubbleOpacity](self, "_updateBubbleOpacity");
  }
}

- (id)resolvedColor:(id)a3 forTraitCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(v5, "resolvedColorWithTraitCollection:", a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (void)setTraitCollection:(id)a3
{
  UITraitCollection *v5;
  UITraitCollection **p_traitCollection;
  void *v7;
  UIColor *v8;
  UIColor *thinkingDotColor;
  void *v10;
  UIColor *v11;
  UIColor *bubbleColor;
  CALayer *thinkingDot;
  id v14;
  UITraitCollection *v15;

  v5 = (UITraitCollection *)a3;
  p_traitCollection = &self->_traitCollection;
  if (self->_traitCollection != v5)
  {
    v15 = v5;
    objc_storeStrong((id *)&self->_traitCollection, a3);
    -[CKTypingIndicatorLayer defaultThinkingDotColor](self, "defaultThinkingDotColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTypingIndicatorLayer resolvedColor:forTraitCollection:](self, "resolvedColor:forTraitCollection:", v7, *p_traitCollection);
    v8 = (UIColor *)objc_claimAutoreleasedReturnValue();
    thinkingDotColor = self->_thinkingDotColor;
    self->_thinkingDotColor = v8;

    -[CKTypingIndicatorLayer defaultBubbleColor](self, "defaultBubbleColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTypingIndicatorLayer resolvedColor:forTraitCollection:](self, "resolvedColor:forTraitCollection:", v10, *p_traitCollection);
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
    bubbleColor = self->_bubbleColor;
    self->_bubbleColor = v11;

    -[CKTypingIndicatorLayer _updateBubbleColors](self, "_updateBubbleColors");
    thinkingDot = self->_thinkingDot;
    -[CKTypingIndicatorLayer thinkingDotColor](self, "thinkingDotColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](thinkingDot, "setBackgroundColor:", objc_msgSend(v14, "CGColor"));

    v5 = v15;
  }

}

- (void)setIconImage:(id)a3
{
  id v5;
  id iconImage;
  char v7;
  id v8;

  v5 = a3;
  iconImage = self->_iconImage;
  if (iconImage != v5)
  {
    v8 = v5;
    v7 = objc_msgSend(iconImage, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong(&self->_iconImage, a3);
      -[CKTypingIndicatorLayer _updateForImage](self, "_updateForImage");
      v5 = v8;
    }
  }

}

- (void)_setup
{
  UIColor *v3;
  UIColor *thinkingDotColor;
  void *v5;
  UIColor *v6;
  UIColor *bubbleColor;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CALayer *v16;
  CALayer *bubbleContainer;
  CALayer *v18;
  CALayer *v19;
  CALayer *smallBubble;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CALayer *v29;
  CALayer *mediumBubble;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CALayer *v39;
  CALayer *largeBubble;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CALayer *v49;
  CALayer *thinkingDotContainer;
  CALayer *v51;
  void *v52;
  id v53;

  -[CKTypingIndicatorLayer defaultThinkingDotColor](self, "defaultThinkingDotColor");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  -[CKTypingIndicatorLayer resolvedColor:forTraitCollection:](self, "resolvedColor:forTraitCollection:", v53, self->_traitCollection);
  v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
  thinkingDotColor = self->_thinkingDotColor;
  self->_thinkingDotColor = v3;

  -[CKTypingIndicatorLayer defaultBubbleColor](self, "defaultBubbleColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTypingIndicatorLayer resolvedColor:forTraitCollection:](self, "resolvedColor:forTraitCollection:", v5, self->_traitCollection);
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  bubbleColor = self->_bubbleColor;
  self->_bubbleColor = v6;

  -[CKTypingIndicatorLayer defaultThinkingDotOpacity](self, "defaultThinkingDotOpacity");
  self->_thinkingDotOpacity = v8;
  -[CKTypingIndicatorLayer defaultBubbleOpacity](self, "defaultBubbleOpacity");
  self->_bubbleOpacity = v9;
  -[CKTypingIndicatorLayer frame](self, "frame");
  v11 = v10;
  v13 = v12;
  objc_msgSend((id)objc_opt_class(), "defaultSize");
  -[CKTypingIndicatorLayer setFrame:](self, "setFrame:", v11, v13, v14, v15);
  v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  bubbleContainer = self->_bubbleContainer;
  self->_bubbleContainer = v16;

  v18 = self->_bubbleContainer;
  -[CKTypingIndicatorLayer bounds](self, "bounds");
  -[CALayer setFrame:](v18, "setFrame:");
  -[CALayer setAllowsGroupOpacity:](self->_bubbleContainer, "setAllowsGroupOpacity:", 1);
  -[CKTypingIndicatorLayer addSublayer:](self, "addSublayer:", self->_bubbleContainer);
  v19 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  smallBubble = self->_smallBubble;
  self->_smallBubble = v19;

  objc_msgSend((id)objc_opt_class(), "smallBubbleFrame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[CALayer setCornerRadius:](self->_smallBubble, "setCornerRadius:", v25 * 0.5);
  -[CALayer setAnchorPoint:](self->_smallBubble, "setAnchorPoint:", 0.318, 0.318);
  -[CALayer setPosition:](self->_smallBubble, "setPosition:", v22, v24);
  -[CALayer setBounds:](self->_smallBubble, "setBounds:", 0.0, 0.0, v26, v28);
  -[CALayer addSublayer:](self->_bubbleContainer, "addSublayer:", self->_smallBubble);
  v29 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  mediumBubble = self->_mediumBubble;
  self->_mediumBubble = v29;

  objc_msgSend((id)objc_opt_class(), "mediumBubbleFrame");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  -[CALayer setCornerRadius:](self->_mediumBubble, "setCornerRadius:", v37 * 0.5);
  -[CALayer setAnchorPoint:](self->_mediumBubble, "setAnchorPoint:", 0.326, 0.37);
  -[CALayer setPosition:](self->_mediumBubble, "setPosition:", v32, v34);
  -[CALayer setBounds:](self->_mediumBubble, "setBounds:", 0.0, 0.0, v36, v38);
  -[CALayer addSublayer:](self->_bubbleContainer, "addSublayer:", self->_mediumBubble);
  v39 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  largeBubble = self->_largeBubble;
  self->_largeBubble = v39;

  objc_msgSend((id)objc_opt_class(), "largeBubbleFrame");
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  -[CALayer setCornerRadius:](self->_largeBubble, "setCornerRadius:", v47 * 0.5);
  -[CALayer setAnchorPoint:](self->_largeBubble, "setAnchorPoint:", 0.185, 0.28);
  -[CALayer setPosition:](self->_largeBubble, "setPosition:", v42, v44);
  -[CALayer setBounds:](self->_largeBubble, "setBounds:", 0.0, 0.0, v46, v48);
  -[CALayer addSublayer:](self->_bubbleContainer, "addSublayer:", self->_largeBubble);
  v49 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  thinkingDotContainer = self->_thinkingDotContainer;
  self->_thinkingDotContainer = v49;

  v51 = self->_thinkingDotContainer;
  -[CKTypingIndicatorLayer largeBubble](self, "largeBubble");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "anchorPoint");
  -[CALayer setAnchorPoint:](v51, "setAnchorPoint:");

  -[CALayer setPosition:](self->_thinkingDotContainer, "setPosition:", v42, v44);
  -[CALayer setBounds:](self->_thinkingDotContainer, "setBounds:", 0.0, 0.0, v46, v48);
  -[CKTypingIndicatorLayer addSublayer:](self, "addSublayer:", self->_thinkingDotContainer);
  -[CKTypingIndicatorLayer _updateBubbleColors](self, "_updateBubbleColors");
  -[CKTypingIndicatorLayer _updateBubbleOpacity](self, "_updateBubbleOpacity");
  -[CKTypingIndicatorLayer _updateForImage](self, "_updateForImage");

}

- (void)_updateForImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MaxX;
  double v12;
  void *v13;
  id v14;
  CGRect v15;

  -[CKTypingIndicatorLayer largeBubble](self, "largeBubble");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "largeBubbleFrame");
  v10 = v9;
  if (self->_iconImage)
  {
    objc_msgSend((id)objc_opt_class(), "iconImageFrame");
    MaxX = CGRectGetMaxX(v15);
  }
  else
  {
    MaxX = 0.0;
  }
  v12 = v10 + MaxX;
  -[CKTypingIndicatorLayer largeBubble](self, "largeBubble");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v4, v6, v12, v8);

  -[CKTypingIndicatorLayer _buildIconImage](self, "_buildIconImage");
  -[CKTypingIndicatorLayer _buildThinkingDots](self, "_buildThinkingDots");

}

- (void)_buildIconImage
{
  void *v3;
  double v4;
  double v5;
  id iconImage;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t (*v14)(id, uint64_t, _QWORD);
  uint64_t v15;
  const void *v16;
  void *v17;
  id v18;

  -[CKTypingIndicatorLayer iconImageLayer](self, "iconImageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_iconImage)
  {
    if (v3)
    {
      v18 = v3;
      objc_msgSend(v3, "setContents:");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "iconImageFrame");
      v5 = v4;
      objc_msgSend(v18, "setFrame:");
      iconImage = self->_iconImage;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scale");
      v9 = v8;

      if (v9 == 1.0)
      {
        v10 = 73;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "scale");
        v13 = v12;

        if (v13 == 2.0)
          v10 = 74;
        else
          v10 = 75;
      }
      v14 = (uint64_t (*)(id, uint64_t, _QWORD))MEMORY[0x193FF3C24]("LICreateIconForImage", CFSTR("MobileIcons"));
      v15 = v14(iconImage, v10, 0);
      if (v15)
      {
        v16 = (const void *)v15;
        objc_msgSend(v18, "setContents:", v15);
        CFAutorelease(v16);
      }
      else
      {
        objc_msgSend(v18, "setMasksToBounds:", 1);
        objc_msgSend(v18, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
        objc_msgSend(v18, "setCornerRadius:", v5 * 0.5);
        objc_msgSend(v18, "setContents:", self->_iconImage);
      }
      -[CKTypingIndicatorLayer setIconImageLayer:](self, "setIconImageLayer:", v18);
      -[CKTypingIndicatorLayer largeBubble](self, "largeBubble");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSublayer:", v18);

    }
  }
  else
  {
    v18 = v3;
    objc_msgSend(v3, "removeFromSuperlayer");
    -[CKTypingIndicatorLayer setIconImageLayer:](self, "setIconImageLayer:", 0);
  }

}

- (void)_buildThinkingDots
{
  CALayer *thinkingDot;
  CAReplicatorLayer *thinkingDots;
  CALayer *v5;
  CALayer *v6;
  double v7;
  double v8;
  CALayer *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CAReplicatorLayer *v21;
  CAReplicatorLayer *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double MaxX;
  double v29;
  CAReplicatorLayer *v30;
  CGFloat v31;
  CATransform3D v32;
  _QWORD v33[3];
  CGRect v34;

  v33[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.0);
  -[CALayer removeAllAnimations](self->_thinkingDot, "removeAllAnimations");
  -[CAReplicatorLayer removeFromSuperlayer](self->_thinkingDots, "removeFromSuperlayer");
  -[CALayer removeFromSuperlayer](self->_thinkingDot, "removeFromSuperlayer");
  thinkingDot = self->_thinkingDot;
  self->_thinkingDot = 0;

  thinkingDots = self->_thinkingDots;
  self->_thinkingDots = 0;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v5 = (CALayer *)objc_claimAutoreleasedReturnValue();
  v6 = self->_thinkingDot;
  self->_thinkingDot = v5;

  objc_msgSend((id)objc_opt_class(), "thinkingDotDiameter");
  v8 = v7;
  -[CALayer setFrame:](self->_thinkingDot, "setFrame:", 0.0, 0.0, v8, v8);
  -[CALayer setCornerRadius:](self->_thinkingDot, "setCornerRadius:", v8 * 0.5);
  v9 = self->_thinkingDot;
  -[CKTypingIndicatorLayer thinkingDotColor](self, "thinkingDotColor");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](v9, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("opacity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = &unk_1E2871260;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[CKTypingIndicatorLayer thinkingDotOpacity](self, "thinkingDotOpacity");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValues:", v14);

  objc_msgSend(v11, "setKeyTimes:", &unk_1E286F460);
  objc_msgSend(v11, "setCalculationMode:", *MEMORY[0x1E0CD2938]);
  objc_msgSend(v11, "setDuration:", 0.5);
  LODWORD(v15) = 1061271823;
  LODWORD(v16) = 1014679044;
  LODWORD(v17) = 1058306785;
  LODWORD(v18) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunction:", v19);

  LODWORD(v20) = 2139095040;
  objc_msgSend(v11, "setRepeatCount:", v20);
  objc_msgSend(v11, "setAutoreverses:", 1);
  objc_msgSend(v11, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  -[CALayer addAnimation:forKey:](self->_thinkingDot, "addAnimation:forKey:", v11, CFSTR("Opacity"));
  objc_msgSend(MEMORY[0x1E0CD2828], "layer");
  v21 = (CAReplicatorLayer *)objc_claimAutoreleasedReturnValue();
  v22 = self->_thinkingDots;
  self->_thinkingDots = v21;

  objc_msgSend((id)objc_opt_class(), "thinkingDotsOffset");
  v24 = v23;
  v26 = v25;
  -[CKTypingIndicatorLayer iconImage](self, "iconImage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend((id)objc_opt_class(), "iconImageFrame");
    MaxX = CGRectGetMaxX(v34);
    objc_msgSend((id)objc_opt_class(), "iconImageTrailingSpace");
    v24 = MaxX + v29;
  }

  -[CAReplicatorLayer setFrame:](self->_thinkingDots, "setFrame:", v24, v26, 0.0, 0.0);
  -[CAReplicatorLayer setInstanceCount:](self->_thinkingDots, "setInstanceCount:", 3);
  v30 = self->_thinkingDots;
  objc_msgSend((id)objc_opt_class(), "thinkingDotSpace");
  CATransform3DMakeTranslation(&v32, v31, 0.0, 0.0);
  -[CAReplicatorLayer setInstanceTransform:](v30, "setInstanceTransform:", &v32);
  -[CAReplicatorLayer setInstanceDelay:](self->_thinkingDots, "setInstanceDelay:", 0.25);
  -[CAReplicatorLayer addSublayer:](self->_thinkingDots, "addSublayer:", self->_thinkingDot);
  -[CALayer addSublayer:](self->_thinkingDotContainer, "addSublayer:", self->_thinkingDots);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (void)_updateBubbleColors
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[CKTypingIndicatorLayer bubbleColor](self, "bubbleColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");

  -[CKTypingIndicatorLayer largeBubble](self, "largeBubble");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[CKTypingIndicatorLayer mediumBubble](self, "mediumBubble");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  -[CKTypingIndicatorLayer smallBubble](self, "smallBubble");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v4);

}

- (void)_updateBubbleOpacity
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  CALayer *bubbleContainer;
  double v10;

  -[CKTypingIndicatorLayer largeBubble](self, "largeBubble");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setOpacity:", v4);

  -[CKTypingIndicatorLayer mediumBubble](self, "mediumBubble");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 1.0;
  objc_msgSend(v5, "setOpacity:", v6);

  -[CKTypingIndicatorLayer smallBubble](self, "smallBubble");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1.0;
  objc_msgSend(v7, "setOpacity:", v8);

  bubbleContainer = self->_bubbleContainer;
  -[CKTypingIndicatorLayer bubbleOpacity](self, "bubbleOpacity");
  *(float *)&v10 = v10;
  -[CALayer setOpacity:](bubbleContainer, "setOpacity:", v10);
}

- (id)_smallBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  float v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  float v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  _QWORD v59[4];
  _QWORD v60[3];
  _QWORD v61[4];

  y = a4.y;
  x = a4.x;
  v61[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("hidden"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", v9);

  objc_msgSend(v7, "setDuration:", 0.0);
  v10 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v7, "setRemovedOnCompletion:", 1);
  objc_msgSend((id)objc_opt_class(), "smallBubbleGrowOffset");
  v12 = v11;
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = x;
  *(float *)&v17 = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v18;
  v19 = x + v12;
  *(float *)&v19 = x + v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v20;
  *(float *)&v21 = x;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValues:", v23);

  v24 = *MEMORY[0x1E0CD2928];
  objc_msgSend(v15, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  objc_msgSend(v15, "setDuration:", 0.4);
  LODWORD(v25) = 0.25;
  LODWORD(v26) = 0.25;
  LODWORD(v27) = 1.0;
  LODWORD(v28) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v25, v28, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v29);

  *(float *)&a3 = a3;
  LODWORD(v30) = LODWORD(a3);
  objc_msgSend(v15, "setSpeed:", v30);
  objc_msgSend(v15, "setFillMode:", v10);
  objc_msgSend(v15, "setRemovedOnCompletion:", 1);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.y"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = y;
  *(float *)&v33 = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v34;
  v35 = y + v14;
  *(float *)&v35 = y + v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v36;
  *(float *)&v37 = y;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setValues:", v39);

  objc_msgSend(v31, "setCalculationMode:", v24);
  objc_msgSend(v31, "setDuration:", 0.4);
  LODWORD(v40) = 1051315048;
  LODWORD(v41) = 1057991709;
  LODWORD(v42) = 1064582806;
  LODWORD(v43) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v40, v43, v41, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTimingFunction:", v44);

  LODWORD(v45) = LODWORD(a3);
  objc_msgSend(v31, "setSpeed:", v45);
  objc_msgSend(v31, "setFillMode:", v10);
  objc_msgSend(v31, "setRemovedOnCompletion:", 1);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v47) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setFromValue:", v48);

  LODWORD(v49) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setToValue:", v50);

  objc_msgSend(v46, "setDuration:", 0.25);
  LODWORD(v51) = LODWORD(a3);
  objc_msgSend(v46, "setSpeed:", v51);
  LODWORD(v52) = 0.25;
  LODWORD(v53) = 0.25;
  LODWORD(v54) = 1.0;
  LODWORD(v55) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v52, v55, v53, v54);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setTimingFunction:", v56);

  objc_msgSend(v46, "setFillMode:", v10);
  objc_msgSend(v46, "setRemovedOnCompletion:", 1);
  v59[0] = v7;
  v59[1] = v15;
  v59[2] = v31;
  v59[3] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (id)_smallBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValues:", &unk_1E286F478);
  objc_msgSend(v7, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  objc_msgSend(v7, "setTensionValues:", &unk_1E286F490);
  objc_msgSend(v7, "setDuration:", 0.7);
  -[CKTypingIndicatorLayer convertedCurrentMediaTime](self, "convertedCurrentMediaTime");
  objc_msgSend(v7, "setBeginTime:", v8 + a4);
  *(float *)&v9 = a3;
  objc_msgSend(v7, "setSpeed:", v9);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v10);

  LODWORD(v11) = 2139095040;
  objc_msgSend(v7, "setRepeatCount:", v11);
  objc_msgSend(v7, "setAutoreverses:", 1);
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v7, "setRemovedOnCompletion:", 0);
  return v7;
}

- (id)_mediumBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  uint64_t v33;
  void *v34;
  float v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  CKTypingIndicatorLayer *v64;
  _QWORD v65[4];
  _QWORD v66[3];
  _QWORD v67[5];

  y = a4.y;
  x = a4.x;
  v67[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("hidden"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToValue:", v10);

  objc_msgSend(v8, "setDuration:", 0.25);
  v11 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v8, "setRemovedOnCompletion:", 1);
  v64 = self;
  objc_msgSend((id)objc_opt_class(), "mediumBubbleGrowOffset");
  v13 = v12;
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = x;
  *(float *)&v18 = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v19;
  v20 = x + v13;
  *(float *)&v20 = x + v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v21;
  *(float *)&v22 = x;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValues:", v24);

  v25 = *MEMORY[0x1E0CD2928];
  objc_msgSend(v16, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  -[CKTypingIndicatorLayer convertedCurrentMediaTime](self, "convertedCurrentMediaTime");
  objc_msgSend(v16, "setBeginTime:", v26 + 0.065);
  objc_msgSend(v16, "setDuration:", 0.4);
  LODWORD(v27) = 0.25;
  LODWORD(v28) = 0.25;
  LODWORD(v29) = 1.0;
  LODWORD(v30) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v27, v30, v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimingFunction:", v31);

  *(float *)&a3 = a3;
  LODWORD(v32) = LODWORD(a3);
  objc_msgSend(v16, "setSpeed:", v32);
  v33 = v11;
  objc_msgSend(v16, "setFillMode:", v11);
  objc_msgSend(v16, "setRemovedOnCompletion:", 1);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.y"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = y;
  *(float *)&v36 = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v37;
  v38 = y + v15;
  *(float *)&v38 = y + v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v39;
  *(float *)&v40 = y;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setValues:", v42);

  objc_msgSend(v34, "setCalculationMode:", v25);
  -[CKTypingIndicatorLayer convertedCurrentMediaTime](v64, "convertedCurrentMediaTime");
  objc_msgSend(v34, "setBeginTime:", v43 + 0.065);
  objc_msgSend(v34, "setDuration:", 0.4);
  LODWORD(v44) = 1051315048;
  LODWORD(v45) = 1057991709;
  LODWORD(v46) = 1064582806;
  LODWORD(v47) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v44, v47, v45, v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTimingFunction:", v48);

  LODWORD(v49) = LODWORD(a3);
  objc_msgSend(v34, "setSpeed:", v49);
  objc_msgSend(v34, "setFillMode:", v33);
  objc_msgSend(v34, "setRemovedOnCompletion:", 1);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v51) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFromValue:", v52);

  LODWORD(v53) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setToValue:", v54);

  -[CKTypingIndicatorLayer convertedCurrentMediaTime](v64, "convertedCurrentMediaTime");
  objc_msgSend(v50, "setBeginTime:", v55 + 0.065);
  objc_msgSend(v50, "setDuration:", 0.25);
  LODWORD(v56) = LODWORD(a3);
  objc_msgSend(v50, "setSpeed:", v56);
  LODWORD(v57) = 0.25;
  LODWORD(v58) = 0.25;
  LODWORD(v59) = 1.0;
  LODWORD(v60) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v57, v60, v58, v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTimingFunction:", v61);

  objc_msgSend(v50, "setFillMode:", v33);
  objc_msgSend(v50, "setRemovedOnCompletion:", 1);
  v65[0] = v8;
  v65[1] = v16;
  v65[2] = v34;
  v65[3] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 4);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

- (id)_mediumBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValues:", &unk_1E286F4A8);
  objc_msgSend(v7, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  objc_msgSend(v7, "setTensionValues:", &unk_1E286F4C0);
  -[CKTypingIndicatorLayer convertedCurrentMediaTime](self, "convertedCurrentMediaTime");
  objc_msgSend(v7, "setBeginTime:", v8 + a4);
  objc_msgSend(v7, "setDuration:", 0.9);
  *(float *)&v9 = a3;
  objc_msgSend(v7, "setSpeed:", v9);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v10);

  LODWORD(v11) = 2139095040;
  objc_msgSend(v7, "setRepeatCount:", v11);
  objc_msgSend(v7, "setAutoreverses:", 1);
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v7, "setRemovedOnCompletion:", 0);
  return v7;
}

- (id)_largeBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  float v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  CKTypingIndicatorLayer *v66;
  _QWORD v67[4];
  _QWORD v68[3];
  _QWORD v69[4];

  y = a4.y;
  x = a4.x;
  v69[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("hidden"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToValue:", v10);

  objc_msgSend(v8, "setDuration:", 0.25);
  v11 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v8, "setRemovedOnCompletion:", 1);
  v66 = self;
  objc_msgSend((id)objc_opt_class(), "largeBubbleGrowOffset");
  v13 = v12;
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = x;
  *(float *)&v18 = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v19;
  v20 = x + v13;
  *(float *)&v20 = x + v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v21;
  *(float *)&v22 = x;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setValues:", v24);

  v25 = *MEMORY[0x1E0CD2928];
  objc_msgSend(v16, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  -[CKTypingIndicatorLayer convertedCurrentMediaTime](self, "convertedCurrentMediaTime");
  v27 = v26;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "transcriptTypingIndicatorLargeBubbleGrowBeginTime");
  objc_msgSend(v16, "setBeginTime:", v27 + v29);

  objc_msgSend(v16, "setDuration:", 0.4);
  LODWORD(v30) = 0.25;
  LODWORD(v31) = 0.25;
  LODWORD(v32) = 1.0;
  LODWORD(v33) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v30, v33, v31, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimingFunction:", v34);

  *(float *)&a3 = a3;
  LODWORD(v35) = LODWORD(a3);
  objc_msgSend(v16, "setSpeed:", v35);
  objc_msgSend(v16, "setFillMode:", v11);
  objc_msgSend(v16, "setRemovedOnCompletion:", 1);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.y"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = y;
  *(float *)&v38 = v37;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v39;
  v40 = y + v15;
  *(float *)&v40 = y + v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v41;
  *(float *)&v42 = y;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v68[2] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setValues:", v44);

  objc_msgSend(v36, "setCalculationMode:", v25);
  -[CKTypingIndicatorLayer convertedCurrentMediaTime](v66, "convertedCurrentMediaTime");
  objc_msgSend(v36, "setBeginTime:", v45 + 0.12);
  objc_msgSend(v36, "setDuration:", 0.4);
  LODWORD(v46) = 1045836616;
  LODWORD(v47) = 1048849804;
  LODWORD(v48) = 1057991709;
  LODWORD(v49) = 1064582806;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v46, v47, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTimingFunction:", v50);

  LODWORD(v51) = LODWORD(a3);
  objc_msgSend(v36, "setSpeed:", v51);
  objc_msgSend(v36, "setFillMode:", v11);
  objc_msgSend(v36, "setRemovedOnCompletion:", 1);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v53) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFromValue:", v54);

  LODWORD(v55) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setToValue:", v56);

  -[CKTypingIndicatorLayer convertedCurrentMediaTime](v66, "convertedCurrentMediaTime");
  objc_msgSend(v52, "setBeginTime:", v57 + 0.12);
  objc_msgSend(v52, "setDuration:", 0.25);
  LODWORD(v58) = LODWORD(a3);
  objc_msgSend(v52, "setSpeed:", v58);
  LODWORD(v59) = 0.25;
  LODWORD(v60) = 0.25;
  LODWORD(v61) = 1.0;
  LODWORD(v62) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v59, v62, v60, v61);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setTimingFunction:", v63);

  objc_msgSend(v52, "setFillMode:", v11);
  objc_msgSend(v52, "setRemovedOnCompletion:", 1);
  v67[0] = v8;
  v67[1] = v16;
  v67[2] = v36;
  v67[3] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

- (id)_largeBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValues:", &unk_1E286F4D8);
  objc_msgSend(v7, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  objc_msgSend(v7, "setTensionValues:", &unk_1E286F4F0);
  -[CKTypingIndicatorLayer convertedCurrentMediaTime](self, "convertedCurrentMediaTime");
  objc_msgSend(v7, "setBeginTime:", v8 + a4);
  objc_msgSend(v7, "setDuration:", 1.9);
  *(float *)&v9 = a3;
  objc_msgSend(v7, "setSpeed:", v9);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimingFunction:", v10);

  LODWORD(v11) = 2139095040;
  objc_msgSend(v7, "setRepeatCount:", v11);
  objc_msgSend(v7, "setAutoreverses:", 1);
  objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v7, "setRemovedOnCompletion:", 0);
  return v7;
}

- (void)startGrowAnimationWithCompletionBlock:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  CKTypingIndicatorLayer *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend((id)objc_opt_class(), "smallBubbleFrame");
  -[CKTypingIndicatorLayer _smallBubbleGrowAnimationsWithSpeed:offset:](self, "_smallBubbleGrowAnimationsWithSpeed:offset:", 1.0, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v54;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v54 != v10)
          objc_enumerationMutation(v7);
        -[CALayer addAnimation:forKey:](self->_smallBubble, "addAnimation:forKey:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v11++), 0);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v9);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend((id)objc_opt_class(), "mediumBubbleFrame");
  -[CKTypingIndicatorLayer _mediumBubbleGrowAnimationsWithSpeed:offset:](self, "_mediumBubbleGrowAnimationsWithSpeed:offset:", 1.0, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v50;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(v14);
        -[CALayer addAnimation:forKey:](self->_mediumBubble, "addAnimation:forKey:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v18++), 0);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v16);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[CALayer position](self->_largeBubble, "position");
  -[CKTypingIndicatorLayer _largeBubbleGrowAnimationsWithSpeed:offset:](self, "_largeBubbleGrowAnimationsWithSpeed:offset:", 1.0, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v46;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v46 != v24)
          objc_enumerationMutation(v21);
        -[CALayer addAnimation:forKey:](self->_largeBubble, "addAnimation:forKey:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v25++), 0);
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v23);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[CALayer position](self->_largeBubble, "position");
  -[CKTypingIndicatorLayer _largeBubbleGrowAnimationsWithSpeed:offset:](self, "_largeBubbleGrowAnimationsWithSpeed:offset:", 1.0, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v42;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v42 != v31)
          objc_enumerationMutation(v28);
        -[CALayer addAnimation:forKey:](self->_thinkingDotContainer, "addAnimation:forKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v32++), 0);
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
    }
    while (v30);
  }

  v33 = (void *)MEMORY[0x1E0CD28B0];
  v35 = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = __64__CKTypingIndicatorLayer_startGrowAnimationWithCompletionBlock___block_invoke;
  v38 = &unk_1E274C2E0;
  v39 = self;
  v40 = v4;
  v34 = v4;
  objc_msgSend(v33, "setCompletionBlock:", &v35);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit", v35, v36, v37, v38, v39);

}

uint64_t __64__CKTypingIndicatorLayer_startGrowAnimationWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateBubbleOpacity");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)startGrowAnimation
{
  -[CKTypingIndicatorLayer startGrowAnimationWithCompletionBlock:](self, "startGrowAnimationWithCompletionBlock:", 0);
}

- (void)startPulseAnimation
{
  CALayer *smallBubble;
  void *v4;
  CALayer *mediumBubble;
  void *v6;
  CALayer *largeBubble;
  void *v8;
  CALayer *thinkingDotContainer;
  void *v10;

  -[CKTypingIndicatorLayer stopPulseAnimation](self, "stopPulseAnimation");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  smallBubble = self->_smallBubble;
  -[CKTypingIndicatorLayer _smallBubblePulseAnimationWithSpeed:delay:](self, "_smallBubblePulseAnimationWithSpeed:delay:", 1.0, 0.25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer addAnimation:forKey:](smallBubble, "addAnimation:forKey:", v4, CFSTR("kCKAnimationKeyPulse"));

  mediumBubble = self->_mediumBubble;
  -[CKTypingIndicatorLayer _mediumBubblePulseAnimationWithSpeed:delay:](self, "_mediumBubblePulseAnimationWithSpeed:delay:", 1.0, 0.314999998);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer addAnimation:forKey:](mediumBubble, "addAnimation:forKey:", v6, CFSTR("kCKAnimationKeyPulse"));

  largeBubble = self->_largeBubble;
  -[CKTypingIndicatorLayer _largeBubblePulseAnimationWithSpeed:delay:](self, "_largeBubblePulseAnimationWithSpeed:delay:", 1.0, 0.370000005);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer addAnimation:forKey:](largeBubble, "addAnimation:forKey:", v8, CFSTR("kCKAnimationKeyPulse"));

  thinkingDotContainer = self->_thinkingDotContainer;
  -[CKTypingIndicatorLayer _largeBubblePulseAnimationWithSpeed:delay:](self, "_largeBubblePulseAnimationWithSpeed:delay:", 1.0, 0.370000005);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALayer addAnimation:forKey:](thinkingDotContainer, "addAnimation:forKey:", v10, CFSTR("kCKAnimationKeyPulse"));

  -[CKTypingIndicatorLayer _buildThinkingDots](self, "_buildThinkingDots");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)stopPulseAnimation
{
  double v3;

  -[CKTypingIndicatorLayer thinkingDotOpacity](self, "thinkingDotOpacity");
  *(float *)&v3 = v3;
  -[CALayer setOpacity:](self->_thinkingDot, "setOpacity:", v3);
  -[CALayer removeAllAnimations](self->_thinkingDot, "removeAllAnimations");
  -[CALayer removeAnimationForKey:](self->_smallBubble, "removeAnimationForKey:", CFSTR("kCKAnimationKeyPulse"));
  -[CALayer removeAnimationForKey:](self->_mediumBubble, "removeAnimationForKey:", CFSTR("kCKAnimationKeyPulse"));
  -[CALayer removeAnimationForKey:](self->_largeBubble, "removeAnimationForKey:", CFSTR("kCKAnimationKeyPulse"));
  -[CALayer removeAnimationForKey:](self->_thinkingDotContainer, "removeAnimationForKey:", CFSTR("kCKAnimationKeyPulse"));
}

- (void)startShrinkAnimationWithCompletionBlock:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  float v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  id v50;
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[3];
  _QWORD v55[5];

  v55[3] = *MEMORY[0x1E0C80C00];
  v50 = a3;
  -[CKTypingIndicatorLayer stopPulseAnimation](self, "stopPulseAnimation");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFromValue:", v6);

  LODWORD(v7) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToValue:", v8);

  -[CKTypingIndicatorLayer convertedCurrentMediaTime](self, "convertedCurrentMediaTime");
  objc_msgSend(v4, "setBeginTime:");
  objc_msgSend(v4, "setDuration:", 0.25);
  LODWORD(v9) = 1.0;
  objc_msgSend(v4, "setSpeed:", v9);
  LODWORD(v10) = 0.25;
  LODWORD(v11) = 0.25;
  LODWORD(v12) = 1.0;
  LODWORD(v13) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v10, v13, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v14);

  v51 = *MEMORY[0x1E0CD2B60];
  objc_msgSend(v4, "setFillMode:");
  objc_msgSend(v4, "setRemovedOnCompletion:", 1);
  -[CALayer addAnimation:forKey:](self->_smallBubble, "addAnimation:forKey:", v4, 0);
  -[CALayer addAnimation:forKey:](self->_mediumBubble, "addAnimation:forKey:", v4, 0);
  -[CALayer addAnimation:forKey:](self->_largeBubble, "addAnimation:forKey:", v4, 0);
  -[CALayer addAnimation:forKey:](self->_thinkingDotContainer, "addAnimation:forKey:", v4, 0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.x"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "largeBubbleFrame");
  v17 = v16;
  v19 = v18;
  v20 = v16;
  *(float *)&v16 = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v21;
  v22 = v17 + 5.0;
  *(float *)&v22 = v17 + 5.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v23;
  *(float *)&v24 = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setValues:", v26);

  v27 = *MEMORY[0x1E0CD2928];
  objc_msgSend(v15, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  -[CKTypingIndicatorLayer convertedCurrentMediaTime](self, "convertedCurrentMediaTime");
  objc_msgSend(v15, "setBeginTime:");
  objc_msgSend(v15, "setDuration:", 0.25);
  LODWORD(v28) = 0.25;
  LODWORD(v29) = 0.25;
  LODWORD(v30) = 1.0;
  LODWORD(v31) = 1036831949;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v28, v31, v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v32);

  LODWORD(v33) = 1.0;
  objc_msgSend(v15, "setSpeed:", v33);
  objc_msgSend(v15, "setFillMode:", v51);
  objc_msgSend(v15, "setRemovedOnCompletion:", 1);
  -[CALayer addAnimation:forKey:](self->_smallBubble, "addAnimation:forKey:", v15, 0);
  -[CALayer addAnimation:forKey:](self->_mediumBubble, "addAnimation:forKey:", v15, 0);
  -[CALayer addAnimation:forKey:](self->_largeBubble, "addAnimation:forKey:", v15, 0);
  -[CALayer addAnimation:forKey:](self->_thinkingDotContainer, "addAnimation:forKey:", v15, 0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("position.y"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v19;
  *(float *)&v36 = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v37;
  v38 = v19 + -6.0;
  *(float *)&v38 = v19 + -6.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v39;
  *(float *)&v40 = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setValues:", v42);

  objc_msgSend(v34, "setCalculationMode:", v27);
  -[CKTypingIndicatorLayer convertedCurrentMediaTime](self, "convertedCurrentMediaTime");
  objc_msgSend(v34, "setBeginTime:");
  objc_msgSend(v34, "setDuration:", 0.25);
  LODWORD(v43) = 1045836616;
  LODWORD(v44) = 1048849804;
  LODWORD(v45) = 1057991709;
  LODWORD(v46) = 1064582806;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTimingFunction:", v47);

  LODWORD(v48) = 1.0;
  objc_msgSend(v34, "setSpeed:", v48);
  objc_msgSend(v34, "setFillMode:", v51);
  objc_msgSend(v34, "setRemovedOnCompletion:", 1);
  -[CALayer addAnimation:forKey:](self->_smallBubble, "addAnimation:forKey:", v34, 0);
  -[CALayer addAnimation:forKey:](self->_mediumBubble, "addAnimation:forKey:", v34, 0);
  -[CALayer addAnimation:forKey:](self->_largeBubble, "addAnimation:forKey:", v34, 0);
  -[CALayer addAnimation:forKey:](self->_thinkingDotContainer, "addAnimation:forKey:", v34, 0);
  if (v50)
  {
    v49 = (void *)MEMORY[0x1E0CD28B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __66__CKTypingIndicatorLayer_startShrinkAnimationWithCompletionBlock___block_invoke;
    v52[3] = &unk_1E274AED0;
    v53 = v50;
    objc_msgSend(v49, "setCompletionBlock:", v52);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

uint64_t __66__CKTypingIndicatorLayer_startShrinkAnimationWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopAnimation
{
  -[CKTypingIndicatorLayer stopPulseAnimation](self, "stopPulseAnimation");
  -[CALayer removeAllAnimations](self->_smallBubble, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_mediumBubble, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_largeBubble, "removeAllAnimations");
  -[CALayer removeAllAnimations](self->_thinkingDotContainer, "removeAllAnimations");
}

- (BOOL)hasDarkBackground
{
  return self->_hasDarkBackground;
}

- (void)setHasDarkBackground:(BOOL)a3
{
  self->_hasDarkBackground = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (id)iconImage
{
  return self->_iconImage;
}

- (UIColor)bubbleColor
{
  return self->_bubbleColor;
}

- (UIColor)thinkingDotColor
{
  return self->_thinkingDotColor;
}

- (void)setThinkingDotColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)bubbleOpacity
{
  return self->_bubbleOpacity;
}

- (double)thinkingDotOpacity
{
  return self->_thinkingDotOpacity;
}

- (void)setThinkingDotOpacity:(double)a3
{
  self->_thinkingDotOpacity = a3;
}

- (UIColor)customBubbleColor
{
  return self->_customBubbleColor;
}

- (void)setCustomBubbleColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CALayer)bubbleContainer
{
  return self->_bubbleContainer;
}

- (void)setBubbleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleContainer, a3);
}

- (CALayer)smallBubble
{
  return self->_smallBubble;
}

- (void)setSmallBubble:(id)a3
{
  objc_storeStrong((id *)&self->_smallBubble, a3);
}

- (CALayer)mediumBubble
{
  return self->_mediumBubble;
}

- (void)setMediumBubble:(id)a3
{
  objc_storeStrong((id *)&self->_mediumBubble, a3);
}

- (CALayer)largeBubble
{
  return self->_largeBubble;
}

- (void)setLargeBubble:(id)a3
{
  objc_storeStrong((id *)&self->_largeBubble, a3);
}

- (CALayer)thinkingDotContainer
{
  return self->_thinkingDotContainer;
}

- (void)setThinkingDotContainer:(id)a3
{
  objc_storeStrong((id *)&self->_thinkingDotContainer, a3);
}

- (CALayer)thinkingDot
{
  return self->_thinkingDot;
}

- (void)setThinkingDot:(id)a3
{
  objc_storeStrong((id *)&self->_thinkingDot, a3);
}

- (CAReplicatorLayer)thinkingDots
{
  return self->_thinkingDots;
}

- (void)setThinkingDots:(id)a3
{
  objc_storeStrong((id *)&self->_thinkingDots, a3);
}

- (CALayer)iconImageLayer
{
  return self->_iconImageLayer;
}

- (void)setIconImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageLayer, 0);
  objc_storeStrong((id *)&self->_thinkingDots, 0);
  objc_storeStrong((id *)&self->_thinkingDot, 0);
  objc_storeStrong((id *)&self->_thinkingDotContainer, 0);
  objc_storeStrong((id *)&self->_largeBubble, 0);
  objc_storeStrong((id *)&self->_mediumBubble, 0);
  objc_storeStrong((id *)&self->_smallBubble, 0);
  objc_storeStrong((id *)&self->_bubbleContainer, 0);
  objc_storeStrong((id *)&self->_customBubbleColor, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_thinkingDotColor, 0);
  objc_storeStrong((id *)&self->_bubbleColor, 0);
  objc_storeStrong(&self->_iconImage, 0);
}

+ (CGSize)defaultSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptTypingIndicatorDefaultSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIColor)defaultBubbleColor
{
  void *v2;
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptTypingIndicatorBubbleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (UIColor)defaultThinkingDotColor
{
  void *v2;
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptTypingIndicatorDotColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (double)defaultThinkingDotOpacity
{
  return 0.449999988;
}

- (double)defaultBubbleOpacity
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptTypingIndicatorOpacity");
  v5 = v4;

  return v5;
}

+ (CGRect)smallBubbleFrame
{
  void *v2;
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
  CGRect result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptTypingIndicatorSmallBubbleFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

+ (CGPoint)smallBubbleGrowOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 5.5;
  v3 = -2.5;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGRect)mediumBubbleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
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
  CGRect result;

  objc_msgSend(a1, "smallBubbleFrame");
  v3 = v2;
  v5 = v4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transcriptTypingIndicatorMediumBubbleSize");
  v8 = v7;
  v10 = v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transcriptTypingIndicatorMediumBubbleOffset");
  v13 = v12;
  v15 = v14;

  v16 = v3 + v13;
  v17 = v5 + v15;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (CGPoint)mediumBubbleGrowOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 5.0;
  v3 = 3.5;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGRect)largeBubbleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
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
  CGRect result;

  objc_msgSend(a1, "smallBubbleFrame");
  v3 = v2;
  v5 = v4;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transcriptTypingIndicatorLargeBubbleSize");
  v8 = v7;
  v10 = v9;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transcriptTypingIndicatorLargeBubbleOffset");
  v13 = v12;
  v15 = v14;

  v16 = v3 + v13;
  v17 = v5 + v15;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (CGPoint)largeBubbleGrowOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptTypingIndicatorLargeBubbleGrowOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

+ (CGRect)iconImageFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 11.0;
  v3 = 7.5;
  v4 = 27.0;
  v5 = 20.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (double)iconImageTrailingSpace
{
  return 8.0;
}

+ (CGPoint)thinkingDotsOffset
{
  double MaxX;
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
  CGPoint result;
  CGRect v16;

  objc_msgSend(a1, "largeBubbleFrame");
  MaxX = CGRectGetMaxX(v16);
  objc_msgSend(a1, "thinkingDotDiameter");
  v5 = v4;
  objc_msgSend(a1, "thinkingDotSpace");
  v7 = v6;
  objc_msgSend(a1, "largeBubbleFrame");
  v9 = v8;
  objc_msgSend(a1, "thinkingDotDiameter");
  v11 = v10;
  if (CKMainScreenScale_once_45 != -1)
    dispatch_once(&CKMainScreenScale_once_45, &__block_literal_global_111);
  v12 = *(double *)&CKMainScreenScale_sMainScreenScale_45;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_45 == 0.0)
    v12 = 1.0;
  v13 = round((MaxX - (v7 + v7 + v5 * 3.0)) * 0.5 * v12) / v12;
  v14 = round((v9 * 0.5 - v11 * 0.5) * v12) / v12;
  result.y = v14;
  result.x = v13;
  return result;
}

+ (double)thinkingDotDiameter
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptTypingIndicatorThinkingDotDiameter");
  v4 = v3;

  return v4;
}

+ (double)thinkingDotSpace
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptTypingIndicatorThinkingDotSpace");
  v4 = v3;

  return v4;
}

@end
