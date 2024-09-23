@implementation AVTRecordingButton

- (AVTRecordingButton)initWithFrame:(CGRect)a3
{
  AVTRecordingButton *v3;
  uint64_t v4;
  UIColor *centerCircleColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTRecordingButton;
  v3 = -[AVTRecordingButton initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v4 = objc_claimAutoreleasedReturnValue();
    centerCircleColor = v3->_centerCircleColor;
    v3->_centerCircleColor = (UIColor *)v4;

  }
  -[AVTRecordingButton configure](v3, "configure");
  return v3;
}

- (AVTRecordingButton)initWithCoder:(id)a3
{
  AVTRecordingButton *v3;
  AVTRecordingButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTRecordingButton;
  v3 = -[AVTRecordingButton initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AVTRecordingButton configure](v3, "configure");
  return v4;
}

- (void)configure
{
  void *v2;
  void *v4;
  CAShapeLayerAnimated *v5;
  CAShapeLayerAnimated *outerCircle;
  id v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  double v11;
  id v12;
  void *v13;
  CAShapeLayerAnimated *v14;
  CAShapeLayerAnimated *innerCircle;
  void *v16;
  void *v17;
  UIImageView *v18;
  UIImageView *iconView;
  void *v20;
  UIActivityIndicatorView *v21;
  UIActivityIndicatorView *spinner;
  UIImpactFeedbackGenerator *v23;
  UIImpactFeedbackGenerator *feedbackGenerator;
  id v25;

  -[AVTRecordingButton setForceUsePhoneStyle:](self, "setForceUsePhoneStyle:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTRecordingButton setBackgroundColor:](self, "setBackgroundColor:", v4);

  v5 = objc_alloc_init(CAShapeLayerAnimated);
  outerCircle = self->_outerCircle;
  self->_outerCircle = v5;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayerAnimated setFillColor:](self->_outerCircle, "setFillColor:", objc_msgSend(v7, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");
  if (v9 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 5)
    {
      -[CAShapeLayerAnimated setLineWidth:](self->_outerCircle, "setLineWidth:", 4.0);
LABEL_8:

      goto LABEL_9;
    }
  }
  v10 = -[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle");
  v11 = 7.0;
  if (v10)
    v11 = 4.0;
  -[CAShapeLayerAnimated setLineWidth:](self->_outerCircle, "setLineWidth:", v11);
  if (v9 != 1)
    goto LABEL_8;
LABEL_9:

  objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayerAnimated setStrokeColor:](self->_outerCircle, "setStrokeColor:", objc_msgSend(v12, "CGColor"));

  -[AVTRecordingButton layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSublayer:", self->_outerCircle);

  v14 = objc_alloc_init(CAShapeLayerAnimated);
  innerCircle = self->_innerCircle;
  self->_innerCircle = v14;

  -[CAShapeLayerAnimated setFillColor:](self->_innerCircle, "setFillColor:", -[UIColor CGColor](self->_centerCircleColor, "CGColor"));
  -[AVTRecordingButton layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSublayer:", self->_innerCircle);

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithWeight:", 6);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("arrow.up"), v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v17);
  iconView = self->_iconView;
  self->_iconView = v18;

  -[UIImageView setHidden:](self->_iconView, "setHidden:", 0);
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_iconView, "setTintColor:", v20);

  -[AVTRecordingButton addSubview:](self, "addSubview:", self->_iconView);
  v21 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 101);
  spinner = self->_spinner;
  self->_spinner = v21;

  -[UIActivityIndicatorView setUserInteractionEnabled:](self->_spinner, "setUserInteractionEnabled:", 0);
  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 0);
  -[AVTRecordingButton addSubview:](self, "addSubview:", self->_spinner);
  v23 = (UIImpactFeedbackGenerator *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 0);
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v23;

}

- (void)setCenterCircleColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  if (self->_centerCircleColor != v5)
  {
    objc_storeStrong((id *)&self->_centerCircleColor, a3);
    -[CAShapeLayerAnimated setFillColor:](self->_innerCircle, "setFillColor:", -[UIColor CGColor](objc_retainAutorelease(v5), "CGColor"));
  }

}

- (void)setForceUsePhoneStyle:(BOOL)a3
{
  if (self->_forceUsePhoneStyle != a3)
  {
    self->_forceUsePhoneStyle = a3;
    -[AVTRecordingButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v2;
  void *v3;
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  CGPathRef v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  _BOOL4 v37;
  double v38;
  double x;
  double y;
  double width;
  double height;
  const CGPath *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  unint64_t v53;
  BOOL v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  _QWORD v59[10];
  BOOL v60;
  CATransform3D v61;
  CATransform3D v62;
  objc_super v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect BoundingBox;

  v63.receiver = self;
  v63.super_class = (Class)AVTRecordingButton;
  -[AVTRecordingButton layoutSubviews](&v63, sel_layoutSubviews);
  v5 = objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[AVTRecordingButton setAlpha:](self, "setAlpha:", (double)-[AVTRecordingButton isEnabled](self, "isEnabled"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", v5);
  -[AVTRecordingButton bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");
  if (v15 == 1
    || (objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = 2.0,
        objc_msgSend(v2, "userInterfaceIdiom") == 5))
  {
    if (-[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle"))
      v16 = 2.0;
    else
      v16 = 3.5;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");
  if (v18 == 1
    || (objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v3, "userInterfaceIdiom"),
        v20 = 2.0,
        v19 == 5))
  {
    if (-[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle"))
      v20 = 2.0;
    else
      v20 = 3.5;
  }
  v64.origin.x = v7;
  v64.origin.y = v9;
  v64.size.width = v11;
  v64.size.height = v13;
  v65 = CGRectInset(v64, v16, v20);
  v21 = CGPathCreateWithEllipseInRect(v65, 0);
  if (v18 != 1)

  if (v15 != 1)
  -[AVTRecordingButton outerCircle](self, "outerCircle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPath:", v21);

  CFRelease(v21);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceIdiom");
  if (v24 == 1
    || (objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = 4.0,
        objc_msgSend(v2, "userInterfaceIdiom") == 5))
  {
    if (-[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle"))
      v25 = 4.0;
    else
      v25 = 7.0;
  }
  -[AVTRecordingButton outerCircle](self, "outerCircle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLineWidth:", v25);

  if (v24 != 1)
  v27 = -[AVTRecordingButton uiState](self, "uiState");
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "userInterfaceIdiom");
  if (v27 == (void *)1)
  {
    if (v29 == 1)
    {
      if (-[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle"))
        v30 = 16.0;
      else
        v30 = 20.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 16.0;
      if (objc_msgSend(v31, "userInterfaceIdiom") == 5)
      {
        if (-[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle"))
          v30 = 16.0;
        else
          v30 = 20.0;
      }

    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "userInterfaceIdiom") == 1)
    {
      if (-[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle"))
        v33 = 4.0;
      else
        v33 = 8.0;
      goto LABEL_57;
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 4.0;
    if (objc_msgSend(v27, "userInterfaceIdiom") == 5)
    {
      if (-[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle"))
        v33 = 4.0;
      else
        v33 = 8.0;
    }
LABEL_56:

    goto LABEL_57;
  }
  if (v29 == 1)
  {
    if (-[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle"))
      v30 = 7.0;
    else
      v30 = 11.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 7.0;
    if (objc_msgSend(v27, "userInterfaceIdiom") == 5)
    {
      if (-[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle"))
        v30 = 7.0;
      else
        v30 = 11.0;
    }

  }
  -[AVTRecordingButton bounds](self, "bounds");
  v35 = v34;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v32, "userInterfaceIdiom");
  if (v36 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "userInterfaceIdiom") != 5)
    {
      v33 = v35 * 0.5 + -7.0;
      goto LABEL_56;
    }
  }
  v37 = -[AVTRecordingButton forceUsePhoneStyle](self, "forceUsePhoneStyle");
  v38 = 11.0;
  if (v37)
    v38 = 7.0;
  v33 = -(v38 - v35 * 0.5);
  if (v36 != 1)
    goto LABEL_56;
LABEL_57:

  -[AVTRecordingButton bounds](self, "bounds");
  v67 = CGRectInset(v66, v30, v30);
  x = v67.origin.x;
  y = v67.origin.y;
  width = v67.size.width;
  height = v67.size.height;
  v43 = CGPathCreateWithRoundedRect(v67, v33, v33, 0);
  -[AVTRecordingButton innerCircle](self, "innerCircle");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFrame:", x, y, width, height);

  BoundingBox = CGPathGetBoundingBox(v43);
  v45 = BoundingBox.origin.x;
  v46 = BoundingBox.origin.y;
  v47 = BoundingBox.size.width;
  v48 = BoundingBox.size.height;
  -[AVTRecordingButton innerCircle](self, "innerCircle");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setBounds:", v45, v46, v47, v48);

  -[AVTRecordingButton innerCircle](self, "innerCircle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setPath:", v43);

  CFRelease(v43);
  if (-[AVTRecordingButton isHighlighted](self, "isHighlighted")
    && -[AVTRecordingButton uiState](self, "uiState") != 1)
  {
    v51 = 0.9;
  }
  else if (-[AVTRecordingButton uiState](self, "uiState") == 3)
  {
    v51 = 0.9;
  }
  else
  {
    v51 = 1.0;
  }
  CATransform3DMakeScale(&v62, v51, v51, 1.0);
  -[AVTRecordingButton innerCircle](self, "innerCircle");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v62;
  objc_msgSend(v52, "setTransform:", &v61);

  v53 = -[AVTRecordingButton uiState](self, "uiState");
  if (v53 == 2)
    -[AVTRecordingButton tintColor](self, "tintColor");
  else
    -[AVTRecordingButton centerCircleColor](self, "centerCircleColor");
  v54 = v53 == 2;
  v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v56 = objc_msgSend(v55, "CGColor");
  -[AVTRecordingButton innerCircle](self, "innerCircle");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setFillColor:", v56);

  v58 = (void *)MEMORY[0x1E0CEABB0];
  objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __36__AVTRecordingButton_layoutSubviews__block_invoke;
  v59[3] = &unk_1EA51EB58;
  *(double *)&v59[5] = x;
  *(double *)&v59[6] = y;
  *(double *)&v59[7] = width;
  *(double *)&v59[8] = height;
  *(double *)&v59[9] = v51;
  v59[4] = self;
  v60 = v54;
  objc_msgSend(v58, "animateWithDuration:animations:", v59);
}

void __36__AVTRecordingButton_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double x;
  double y;
  double width;
  double height;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  double v22;
  id v23;
  CGRect v24;
  CGRect v25;

  v24 = *(CGRect *)(a1 + 40);
  v2 = 1.0;
  v25 = CGRectInset(v24, v24.size.width * ((1.0 - *(double *)(a1 + 72)) * 0.5 + 0.2), v24.size.width * ((1.0 - *(double *)(a1 + 72)) * 0.5 + 0.2));
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  objc_msgSend(*(id *)(a1 + 32), "iconView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", x, y, width, height);

  if (*(_BYTE *)(a1 + 80))
    v8 = 1.0;
  else
    v8 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "iconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

  v10 = objc_msgSend(*(id *)(a1 + 32), "uiState");
  objc_msgSend(*(id *)(a1 + 32), "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "center");
  v13 = v12 + 1.0;
  objc_msgSend(*(id *)(a1 + 32), "iconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "center");
  v16 = v15 + 1.0;
  objc_msgSend(*(id *)(a1 + 32), "spinner");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCenter:", v13, v16);

  objc_msgSend(*(id *)(a1 + 32), "spinner");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v10 == 3)
  {
    objc_msgSend(v18, "startAnimating");
    v20 = 0.0;
  }
  else
  {
    objc_msgSend(v18, "stopAnimating");
    v20 = 1.0;
    v2 = 0.0;
  }

  objc_msgSend(*(id *)(a1 + 32), "spinner");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAlpha:", v2);

  objc_msgSend(*(id *)(a1 + 32), "innerCircle");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v22 = v20;
  objc_msgSend(v23, "setOpacity:", v22);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[AVTRecordingButton isEnabled](self, "isEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVTRecordingButton;
    -[AVTRecordingButton setEnabled:](&v5, sel_setEnabled_, v3);
    -[AVTRecordingButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUIState:(unint64_t)a3
{
  if (self->_uiState != a3)
  {
    self->_uiState = a3;
    if (a3 - 1 <= 1)
      -[AVTRecordingButton sendHapticFeedbackIfNeeded](self, "sendHapticFeedbackIfNeeded");
    -[AVTRecordingButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)sendHapticFeedbackIfNeeded
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  -[AVTRecordingButton lastFeedbackSent](self, "lastFeedbackSent");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[AVTRecordingButton lastFeedbackSent](self, "lastFeedbackSent"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "timeIntervalSinceNow"),
        v7 = v6,
        v5,
        v4,
        v7 < -0.2))
  {
    v8 = (void *)objc_opt_new();
    -[AVTRecordingButton setLastFeedbackSent:](self, "setLastFeedbackSent:", v8);

    -[AVTRecordingButton feedbackGenerator](self, "feedbackGenerator");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "impactOccurred");

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTRecordingButton;
  -[AVTRecordingButton touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  if (-[AVTRecordingButton uiState](self, "uiState") != 3)
    -[AVTRecordingButton sendHapticFeedbackIfNeeded](self, "sendHapticFeedbackIfNeeded");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[AVTRecordingButton performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_startLongPress, 0, 0.25);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  objc_super v12;
  CGPoint v13;
  CGRect v14;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVTRecordingButton;
  -[AVTRecordingButton touchesEnded:withEvent:](&v12, sel_touchesEnded_withEvent_, v6, a4);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  if (-[AVTRecordingButton isTrackingLongPress](self, "isTrackingLongPress"))
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", self);
    v9 = v8;
    v11 = v10;

    -[AVTRecordingButton bounds](self, "bounds");
    v13.x = v9;
    v13.y = v11;
    -[AVTRecordingButton endLongPress:](self, "endLongPress:", !CGRectContainsPoint(v14, v13));
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTRecordingButton;
  -[AVTRecordingButton touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  if (-[AVTRecordingButton isTrackingLongPress](self, "isTrackingLongPress"))
    -[AVTRecordingButton endLongPress:](self, "endLongPress:", 1);
}

- (void)startLongPress
{
  void *v3;
  id v4;

  -[AVTRecordingButton setIsTrackingLongPress:](self, "setIsTrackingLongPress:", 1);
  -[AVTRecordingButton longPressDelegate](self, "longPressDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVTRecordingButton longPressDelegate](self, "longPressDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordingButtonDidStartLongPress:", self);

  }
}

- (void)endLongPress:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[AVTRecordingButton setIsTrackingLongPress:](self, "setIsTrackingLongPress:", 0);
  -[AVTRecordingButton longPressDelegate](self, "longPressDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AVTRecordingButton longPressDelegate](self, "longPressDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordingButton:didEndLongPress:", self, v3);

  }
}

- (AVTRecordingButtonLongPressDelegate)longPressDelegate
{
  return (AVTRecordingButtonLongPressDelegate *)objc_loadWeakRetained((id *)&self->_longPressDelegate);
}

- (void)setLongPressDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_longPressDelegate, a3);
}

- (BOOL)forceUsePhoneStyle
{
  return self->_forceUsePhoneStyle;
}

- (unint64_t)uiState
{
  return self->_uiState;
}

- (UIColor)centerCircleColor
{
  return self->_centerCircleColor;
}

- (BOOL)ignoresLongPress
{
  return self->_ignoresLongPress;
}

- (void)setIgnoresLongPress:(BOOL)a3
{
  self->_ignoresLongPress = a3;
}

- (CAShapeLayerAnimated)outerCircle
{
  return self->_outerCircle;
}

- (void)setOuterCircle:(id)a3
{
  objc_storeStrong((id *)&self->_outerCircle, a3);
}

- (CAShapeLayerAnimated)innerCircle
{
  return self->_innerCircle;
}

- (void)setInnerCircle:(id)a3
{
  objc_storeStrong((id *)&self->_innerCircle, a3);
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (BOOL)isTrackingLongPress
{
  return self->_isTrackingLongPress;
}

- (void)setIsTrackingLongPress:(BOOL)a3
{
  self->_isTrackingLongPress = a3;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (NSDate)lastFeedbackSent
{
  return self->_lastFeedbackSent;
}

- (void)setLastFeedbackSent:(id)a3
{
  objc_storeStrong((id *)&self->_lastFeedbackSent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFeedbackSent, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_innerCircle, 0);
  objc_storeStrong((id *)&self->_outerCircle, 0);
  objc_storeStrong((id *)&self->_centerCircleColor, 0);
  objc_destroyWeak((id *)&self->_longPressDelegate);
}

@end
