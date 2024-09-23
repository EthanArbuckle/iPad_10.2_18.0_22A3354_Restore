@implementation PHAudioCallControlsSupplementalButton

- (PHAudioCallControlsSupplementalButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  PHAudioCallControlsSupplementalButton *v5;
  PHAudioCallControlsSupplementalButton *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PHRoundView *v12;
  double v13;
  PHRoundView *v14;
  PHRoundView *roundView;
  PHRoundView *v16;
  void *v17;
  void *v18;
  void *v19;
  UIView *v20;
  void *v21;
  UIView *backdropEffectView;
  UIView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;
  _QWORD v33[2];

  height = a3.size.height;
  width = a3.size.width;
  v32.receiver = self;
  v32.super_class = (Class)PHAudioCallControlsSupplementalButton;
  v5 = -[PHAudioCallControlsSupplementalButton initWithFrame:](&v32, "initWithFrame:", a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    -[PHAudioCallControlsSupplementalButton setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[PHAudioCallControlsSupplementalButton setTintColor:](v6, "setTintColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    objc_msgSend(v8, "setCornerStyle:", 4);
    objc_msgSend(v8, "setButtonSize:", 1);
    objc_msgSend(v8, "setImagePadding:", 4.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", UIFontTextStyleFootnote));
    objc_msgSend(v8, "setPreferredSymbolConfigurationForImage:", v9);

    -[PHAudioCallControlsSupplementalButton setConfiguration:](v6, "setConfiguration:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsSupplementalButton titleLabel](v6, "titleLabel"));
    objc_msgSend(v10, "setMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityExtraExtraLarge);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsSupplementalButton imageView](v6, "imageView"));
    objc_msgSend(v11, "setMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityExtraLarge);

    v12 = [PHRoundView alloc];
    *(float *)&v13 = height * 0.5;
    v14 = -[PHRoundView initWithFrame:cornerRadius:](v12, "initWithFrame:cornerRadius:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, v13);
    roundView = v6->_roundView;
    v6->_roundView = v14;

    v16 = v6->_roundView;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.100000001));
    -[PHRoundView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    -[PHRoundView setTranslatesAutoresizingMaskIntoConstraints:](v6->_roundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PHRoundView setUserInteractionEnabled:](v6->_roundView, "setUserInteractionEnabled:", 0);
    -[PHAudioCallControlsSupplementalButton addSubview:](v6, "addSubview:", v6->_roundView);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControls](UIColorEffect, "inCallControls"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 40.0));
    v20 = (UIView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v19);
    v33[0] = v18;
    v33[1] = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
    -[UIView setBackgroundEffects:](v20, "setBackgroundEffects:", v21);

    -[UIView setFrame:](v20, "setFrame:", 0.0, 0.0, width, height);
    -[UIView _setCornerRadius:](v20, "_setCornerRadius:", height * 0.5);
    -[UIView setUserInteractionEnabled:](v20, "setUserInteractionEnabled:", 0);
    -[PHAudioCallControlsSupplementalButton addSubview:](v6, "addSubview:", v20);
    backdropEffectView = v6->_backdropEffectView;
    v6->_backdropEffectView = v20;
    v23 = v20;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_roundView, 5, 0, v6, 5, 1.0, 0.0));
    -[PHAudioCallControlsSupplementalButton addConstraint:](v6, "addConstraint:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_roundView, 6, 0, v6, 6, 1.0, 0.0));
    -[PHAudioCallControlsSupplementalButton addConstraint:](v6, "addConstraint:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_roundView, 3, 0, v6, 3, 1.0, 0.0));
    -[PHAudioCallControlsSupplementalButton addConstraint:](v6, "addConstraint:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6->_roundView, 4, 0, v6, 4, 1.0, 0.0));
    -[PHAudioCallControlsSupplementalButton addConstraint:](v6, "addConstraint:", v27);

    -[PHAudioCallControlsSupplementalButton sendSubviewToBack:](v6, "sendSubviewToBack:", v6->_roundView);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));

    -[PHAudioCallControlsSupplementalButton setTitleColor:forState:](v6, "setTitleColor:forState:", v28, 0);
    -[PHAudioCallControlsSupplementalButton setAdjustsImageWhenHighlighted:](v6, "setAdjustsImageWhenHighlighted:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsSupplementalButton layer](v6, "layer"));
    objc_msgSend(v29, "setAllowsGroupBlending:", 0);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsSupplementalButton layer](v6, "layer"));
    objc_msgSend(v30, "setAllowsGroupOpacity:", 0);

  }
  return v6;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PHAudioCallControlsSupplementalButton;
  -[PHAudioCallControlsSupplementalButton layoutSubviews](&v15, "layoutSubviews");
  -[PHAudioCallControlsSupplementalButton frame](self, "frame");
  v4 = v3 * 0.5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsSupplementalButton roundView](self, "roundView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v6, "setCornerRadius:", v4);

  -[PHAudioCallControlsSupplementalButton frame](self, "frame");
  v8 = v7;
  -[PHAudioCallControlsSupplementalButton frame](self, "frame");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsSupplementalButton backdropEffectView](self, "backdropEffectView"));
  objc_msgSend(v11, "setFrame:", 0.0, 0.0, v8, v10);

  -[PHAudioCallControlsSupplementalButton frame](self, "frame");
  v13 = v12 * 0.5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsSupplementalButton backdropEffectView](self, "backdropEffectView"));
  objc_msgSend(v14, "_setCornerRadius:", v13);

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallControlsSupplementalButton;
  -[PHAudioCallControlsSupplementalButton setHighlighted:](&v4, "setHighlighted:", a3);
  -[PHAudioCallControlsSupplementalButton updateRoundViewColor](self, "updateRoundViewColor");
  -[PHAudioCallControlsSupplementalButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_roundView);
}

- (void)updateRoundViewColor
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000292F0;
  v2[3] = &unk_100284898;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.170000002);
}

- (PHRoundView)roundView
{
  return (PHRoundView *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRoundView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (UIView)backdropEffectView
{
  return (UIView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBackdropEffectView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropEffectView, 0);
  objc_storeStrong((id *)&self->_roundView, 0);
}

@end
