@implementation _MKZoomSliderView

- (_MKZoomSliderView)initWithFrame:(CGRect)a3
{
  _MKZoomSliderView *v3;
  id v4;
  void *v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  UIImageView *shadowImageView;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIView *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSLayoutConstraint *knobCenterYConstraint;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  UIView *knob;
  _MKZoomSliderView *v50;
  void *v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)_MKZoomSliderView;
  v3 = -[_MKZoomSliderView initWithFrame:](&v53, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    _trackShadowImage(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "initWithImage:", v7);
    shadowImageView = v3->_shadowImageView;
    v3->_shadowImageView = (UIImageView *)v8;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v3->_lastTrackShadowImageScale = v11;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_shadowImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKZoomSliderView addSubview:](v3, "addSubview:", v3->_shadowImageView);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_shadowImageView, 9, 0, v3, 9, 1.0, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKZoomSliderView addConstraint:](v3, "addConstraint:", v12);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_shadowImageView, 3, 0, v3, 3, 1.0, -75.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKZoomSliderView addConstraint:](v3, "addConstraint:", v13);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v3->_shadowImageView, 4, 0, v3, 4, 1.0, 75.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKZoomSliderView addConstraint:](v3, "addConstraint:", v14);

    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 4001);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v52);
    objc_msgSend(v15, "_setCornerRadius:continuous:maskedCorners:", 1, 15, 6.0);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKZoomSliderView addSubview:](v3, "addSubview:", v15);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 7, 0, 0, 0, 1.0, 12.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKZoomSliderView addConstraint:](v3, "addConstraint:", v16);

    v17 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("track"), v15, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[track]|"), 0, 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKZoomSliderView addConstraints:](v3, "addConstraints:", v19);

    v20 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("track"), v15, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[track]|"), 0, 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKZoomSliderView addConstraints:](v3, "addConstraints:", v22);

    v23 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = objc_msgSend(v24, "CGColor");
    -[UIView layer](v23, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setShadowColor:", v25);

    -[UIView layer](v23, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShadowRadius:", 6.0);

    -[UIView layer](v23, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 1053609165;
    objc_msgSend(v28, "setShadowOpacity:", v29);

    -[UIView layer](v23, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setShadowOffset:", 0.0, 4.0);

    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", 0.0, 0.0, 24.0, 24.0);
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = objc_msgSend(v31, "CGPath");
    -[UIView layer](v23, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setShadowPath:", v32);

    -[_MKZoomSliderView addSubview:](v3, "addSubview:", v23);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 9, 0, v3, 9, 1.0, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKZoomSliderView addConstraint:](v3, "addConstraint:", v34);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 10, 0, v3, 3, 1.0, 0.0);
    v35 = objc_claimAutoreleasedReturnValue();
    knobCenterYConstraint = v3->_knobCenterYConstraint;
    v3->_knobCenterYConstraint = (NSLayoutConstraint *)v35;

    -[_MKZoomSliderView addConstraint:](v3, "addConstraint:", v3->_knobCenterYConstraint);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 7, 0, 0, 0, 1.0, 24.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKZoomSliderView addConstraint:](v3, "addConstraint:", v37);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 8, 0, v23, 7, 1.0, 0.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKZoomSliderView addConstraint:](v3, "addConstraint:", v38);

    v39 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setBackgroundColor:", v40);

    objc_msgSend(v39, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setMasksToBounds:", 1);

    objc_msgSend(v39, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCornerRadius:", 12.0);

    -[UIView addSubview:](v23, "addSubview:", v39);
    v43 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("knobCircle"), v39, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[knobCircle]|"), 0, 0, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v23, "addConstraints:", v45);

    v46 = (void *)MEMORY[0x1E0CB3718];
    _NSDictionaryOfVariableBindings(CFSTR("knobCircle"), v39, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[knobCircle]|"), 0, 0, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraints:](v23, "addConstraints:", v48);

    knob = v3->_knob;
    v3->_knob = v23;

    v50 = v3;
  }

  return v3;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MKZoomSliderView;
  -[_MKZoomSliderView didMoveToWindow](&v9, sel_didMoveToWindow);
  -[_MKZoomSliderView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_MKZoomSliderView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;

    if (vabdd_f64(v7, self->_lastTrackShadowImageScale) >= 0.000001)
    {
      self->_lastTrackShadowImageScale = v7;
      _trackShadowImage(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_shadowImageView, "setImage:", v8);

    }
  }
}

- (void)setZoomFraction:(double)a3
{
  self->_zoomFraction = a3;
  -[_MKZoomSliderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKZoomSliderView;
  -[_MKZoomSliderView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_MKZoomSliderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)updateConstraints
{
  double v3;
  double v4;
  _BOOL4 v5;
  _BOOL4 v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MKZoomSliderView;
  -[_MKZoomSliderView updateConstraints](&v9, sel_updateConstraints);
  v3 = 1.0;
  v4 = 1.0 - self->_zoomFraction;
  v5 = v4 > 0.0 || v4 >= 1.0;
  v6 = v4 <= 0.0 || v4 >= 1.0;
  if (!v5)
    v3 = 0.0;
  if (v6)
    v7 = v3;
  else
    v7 = 1.0 - self->_zoomFraction;
  -[_MKZoomSliderView bounds](self, "bounds");
  -[NSLayoutConstraint setConstant:](self->_knobCenterYConstraint, "setConstant:", v8 * v7);
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
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
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _OWORD v47[8];
  _OWORD v48[8];
  CATransform3D v49;
  CATransform3D v50;
  CATransform3D v51;
  _OWORD v52[8];
  CATransform3D v53;
  _QWORD v54[3];
  _QWORD v55[4];

  v55[3] = *MEMORY[0x1E0C80C00];
  if (self->_active != a3)
  {
    v3 = a3;
    self->_active = a3;
    -[UIView layer](self->_knob, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      memset(&v53, 0, sizeof(v53));
      CATransform3DMakeScale(&v53, 2.0, 2.0, 1.0);
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMass:", 1.20000005);
      objc_msgSend(v7, "setStiffness:", 300.0);
      objc_msgSend(v7, "setDamping:", 30.0);
      v8 = (void *)MEMORY[0x1E0CB3B18];
      if (v6)
        objc_msgSend(v6, "transform");
      else
        memset(v52, 0, sizeof(v52));
      objc_msgSend(v8, "valueWithCATransform3D:", v52);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFromValue:", v10);

      v51 = v53;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v51);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setToValue:", v11);

      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("shadowOffset"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMass:", 1.20000005);
      objc_msgSend(v12, "setStiffness:", 300.0);
      objc_msgSend(v12, "setDamping:", 30.0);
      v13 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v6, "shadowOffset");
      objc_msgSend(v13, "valueWithCGSize:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFromValue:", v14);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 0.0, 12.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setToValue:", v15);

      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("shadowOpacity"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMass:", 1.20000005);
      objc_msgSend(v16, "setStiffness:", 300.0);
      objc_msgSend(v16, "setDamping:", 30.0);
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "shadowOpacity");
      objc_msgSend(v17, "numberWithFloat:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFromValue:", v18);

      objc_msgSend(v16, "setToValue:", &unk_1E21584D0);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDuration:", 0.300000012);
      v55[0] = v7;
      v55[1] = v12;
      v55[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAnimations:", v20);

      -[UIView layer](self->_knob, "layer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addAnimation:forKey:", v19, CFSTR("Active"));

      v50 = v53;
      -[UIView layer](self->_knob, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v50;
      objc_msgSend(v22, "setTransform:", &v49);

      -[UIView layer](self->_knob, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setShadowOffset:", 0.0, 12.0);

      -[UIView layer](self->_knob, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      LODWORD(v26) = 1045220557;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMass:", 1.20000005);
      objc_msgSend(v7, "setStiffness:", 300.0);
      objc_msgSend(v7, "setDamping:", 30.0);
      v9 = (void *)MEMORY[0x1E0CB3B18];
      if (v6)
        objc_msgSend(v6, "transform");
      else
        memset(v48, 0, sizeof(v48));
      objc_msgSend(v9, "valueWithCATransform3D:", v48);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFromValue:", v27);

      v46 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      *(_OWORD *)&v53.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v45 = *(_OWORD *)&v53.m31;
      *(_OWORD *)&v53.m33 = v46;
      v44 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      *(_OWORD *)&v53.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v43 = *(_OWORD *)&v53.m41;
      *(_OWORD *)&v53.m43 = v44;
      v42 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&v53.m11 = *MEMORY[0x1E0CD2610];
      v41 = *(_OWORD *)&v53.m11;
      *(_OWORD *)&v53.m13 = v42;
      v40 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      *(_OWORD *)&v53.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v39 = *(_OWORD *)&v53.m21;
      *(_OWORD *)&v53.m23 = v40;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v53);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setToValue:", v28);

      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("shadowOffset"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMass:", 1.20000005);
      objc_msgSend(v12, "setStiffness:", 300.0);
      objc_msgSend(v12, "setDamping:", 30.0);
      v29 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v6, "shadowOffset");
      objc_msgSend(v29, "valueWithCGSize:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFromValue:", v30);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", 0.0, 4.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setToValue:", v31);

      objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("shadowOpacity"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setMass:", 1.20000005);
      objc_msgSend(v16, "setStiffness:", 300.0);
      objc_msgSend(v16, "setDamping:", 30.0);
      v32 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "shadowOpacity");
      objc_msgSend(v32, "numberWithFloat:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFromValue:", v33);

      objc_msgSend(v16, "setToValue:", &unk_1E21584E0);
      objc_msgSend(MEMORY[0x1E0CD2700], "animation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setDuration:", 0.300000012);
      v54[0] = v7;
      v54[1] = v12;
      v54[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAnimations:", v34);

      -[UIView layer](self->_knob, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "removeAnimationForKey:", CFSTR("Active"));

      -[UIView layer](self->_knob, "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addAnimation:forKey:", v19, CFSTR("Active"));

      -[UIView layer](self->_knob, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v47[4] = v45;
      v47[5] = v46;
      v47[6] = v43;
      v47[7] = v44;
      v47[0] = v41;
      v47[1] = v42;
      v47[2] = v39;
      v47[3] = v40;
      objc_msgSend(v37, "setTransform:", v47);

      -[UIView layer](self->_knob, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setShadowOffset:", 0.0, 4.0);

      -[UIView layer](self->_knob, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      LODWORD(v26) = 1053609165;
    }
    objc_msgSend(v24, "setShadowOpacity:", v26);

  }
}

- (double)zoomFraction
{
  return self->_zoomFraction;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_knob, 0);
  objc_storeStrong((id *)&self->_knobCenterYConstraint, 0);
}

@end
