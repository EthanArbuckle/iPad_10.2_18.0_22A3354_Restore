@implementation FaceIdLightweightLeadingView

- (FaceIdLightweightLeadingView)init
{
  return -[FaceIdLightweightLeadingView initWithInitialState:](self, "initWithInitialState:", 0);
}

- (FaceIdLightweightLeadingView)initWithInitialState:(int64_t)a3
{
  FaceIdLightweightLeadingView *v4;
  LACUIFaceIDSpinnerView *v5;
  LACUIFaceIDSpinnerView *faceIDSpinnerView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FaceIdLightweightLeadingView;
  v4 = -[FaceIdLightweightLeadingView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v4)
  {
    v5 = (LACUIFaceIDSpinnerView *)objc_msgSend(objc_alloc((Class)LACUIFaceIDSpinnerView), "initWithInitialState:", 3);
    faceIDSpinnerView = v4->_faceIDSpinnerView;
    v4->_faceIDSpinnerView = v5;

    v4->_state = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](v4->_faceIDSpinnerView, "faceLayer"));
    v4->_defaultContentsMultiplyColor = (CGColor *)objc_msgSend(v7, "contentsMultiplyColor");

    -[FaceIdLightweightLeadingView _setup](v4, "_setup");
  }
  return v4;
}

- (void)_setup
{
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
  _QWORD v16[4];

  -[FaceIdLightweightLeadingView addSubview:](self, "addSubview:", self->_faceIDSpinnerView);
  -[LACUIFaceIDSpinnerView setTranslatesAutoresizingMaskIntoConstraints:](self->_faceIDSpinnerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[FaceIdLightweightLeadingView _setState:animated:](self, "_setState:animated:", self->_state, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView leadingAnchor](self->_faceIDSpinnerView, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightLeadingView leadingAnchor](self, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v16[0] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView trailingAnchor](self->_faceIDSpinnerView, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightLeadingView trailingAnchor](self, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  v16[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView topAnchor](self->_faceIDSpinnerView, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightLeadingView topAnchor](self, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v16[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView bottomAnchor](self->_faceIDSpinnerView, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightLeadingView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v16[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[FaceIdLightweightLeadingView _setState:animated:](self, "_setState:animated:");
  }
}

- (void)_setState:(int64_t)a3 animated:(BOOL)a4
{
  +[CATransaction begin](CATransaction, "begin", a3, a4);
  -[FaceIdLightweightLeadingView _updateOpacityForState:animated:](self, "_updateOpacityForState:animated:", a3, 1);
  -[FaceIdLightweightLeadingView _updateTintColorForState:animated:](self, "_updateTintColorForState:animated:", a3, 1);
  +[CATransaction commit](CATransaction, "commit");
}

- (void)_updateOpacityForState:(int64_t)a3 animated:(BOOL)a4
{
  double v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  id v20;

  -[FaceIdLightweightLeadingView _opacityForState:](self, "_opacityForState:");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](self->_faceIDSpinnerView, "faceLayer"));
  objc_msgSend(v9, "opacity");
  v11 = v10;

  if (v11 != v8)
  {
    if (a4)
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightLeadingView _animationForState:propertyName:](self, "_animationForState:propertyName:", a3, CFSTR("opacity")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](self->_faceIDSpinnerView, "faceLayer"));
      objc_msgSend(v12, "opacity");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
      objc_msgSend(v20, "setFromValue:", v13);

      *(float *)&v14 = v8;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
      objc_msgSend(v20, "setToValue:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](self->_faceIDSpinnerView, "faceLayer"));
      *(float *)&v17 = v8;
      objc_msgSend(v16, "setOpacity:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](self->_faceIDSpinnerView, "faceLayer"));
      objc_msgSend(v18, "addAnimation:forKey:", v20, CFSTR("opacity"));

    }
    else
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](self->_faceIDSpinnerView, "faceLayer"));
      *(float *)&v19 = v8;
      objc_msgSend(v20, "setOpacity:", v19);
    }

  }
}

- (void)_updateTintColorForState:(int64_t)a3 animated:(BOOL)a4
{
  CGColor *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = -[FaceIdLightweightLeadingView _tintColorForState:](self, "_tintColorForState:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](self->_faceIDSpinnerView, "faceLayer"));
  v9 = CGColorEqualToColor(v7, (CGColorRef)objc_msgSend(v8, "contentsMultiplyColor"));

  if (!v9)
  {
    if (a4)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightLeadingView _animationForState:propertyName:](self, "_animationForState:propertyName:", a3, CFSTR("contentsMultiplyColor")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](self->_faceIDSpinnerView, "faceLayer"));
      objc_msgSend(v13, "setFromValue:", objc_msgSend(v10, "contentsMultiplyColor"));

      objc_msgSend(v13, "setToValue:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](self->_faceIDSpinnerView, "faceLayer"));
      objc_msgSend(v11, "setContentsMultiplyColor:", v7);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](self->_faceIDSpinnerView, "faceLayer"));
      objc_msgSend(v12, "addAnimation:forKey:", v13, CFSTR("contentsMultiplyColor"));

    }
    else
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView faceLayer](self->_faceIDSpinnerView, "faceLayer"));
      objc_msgSend(v13, "setContentsMultiplyColor:", v7);
    }

  }
}

- (double)_opacityForState:(int64_t)a3
{
  double result;

  result = 0.4;
  if (a3 == 1)
    result = 1.0;
  if (a3 == 2)
    return 0.2;
  return result;
}

- (CGColor)_tintColorForState:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  CGColor *v6;

  if (!a3 || a3 == 2)
    return (CGColor *)*((_QWORD *)self + 3);
  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resolvedColorWithTraitCollection:", v4)));
    v6 = (CGColor *)objc_msgSend(v5, "CGColor");

    return v6;
  }
  return self;
}

- (id)_animationForState:(int64_t)a3 propertyName:(id)a4
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", a4));
  objc_msgSend(v4, "setDuration:", 0.25);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIDSpinnerView, 0);
}

@end
