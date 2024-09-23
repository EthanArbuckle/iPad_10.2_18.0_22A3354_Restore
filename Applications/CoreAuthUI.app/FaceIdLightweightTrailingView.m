@implementation FaceIdLightweightTrailingView

- (FaceIdLightweightTrailingView)init
{
  FaceIdLightweightTrailingView *v2;
  LACUIFaceIDSpinnerView *v3;
  LACUIFaceIDSpinnerView *faceIDSpinnerView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FaceIdLightweightTrailingView;
  v2 = -[FaceIdLightweightTrailingView initWithFrame:](&v6, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v2)
  {
    v3 = objc_opt_new(LACUIFaceIDSpinnerView);
    faceIDSpinnerView = v2->_faceIDSpinnerView;
    v2->_faceIDSpinnerView = v3;

    -[FaceIdLightweightTrailingView _setup](v2, "_setup");
  }
  return v2;
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

  -[LACUIFaceIDSpinnerView setTranslatesAutoresizingMaskIntoConstraints:](self->_faceIDSpinnerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[FaceIdLightweightTrailingView addSubview:](self, "addSubview:", self->_faceIDSpinnerView);
  -[LACUIFaceIDSpinnerView setState:](self->_faceIDSpinnerView, "setState:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView leadingAnchor](self->_faceIDSpinnerView, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightTrailingView leadingAnchor](self, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v16[0] = v13;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView trailingAnchor](self->_faceIDSpinnerView, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightTrailingView trailingAnchor](self, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  v16[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView topAnchor](self->_faceIDSpinnerView, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightTrailingView topAnchor](self, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v16[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LACUIFaceIDSpinnerView bottomAnchor](self->_faceIDSpinnerView, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FaceIdLightweightTrailingView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v16[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (LACUIFaceIDSpinnerView)faceIDSpinnerView
{
  return self->_faceIDSpinnerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_faceIDSpinnerView, 0);
}

@end
