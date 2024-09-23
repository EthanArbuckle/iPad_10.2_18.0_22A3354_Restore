@implementation PHAudioControlsButton

- (PHAudioControlsButton)initWithFrame:(CGRect)a3
{
  PHAudioControlsButton *v3;
  NSUUID *v4;
  NSUUID *uuid;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHAudioControlsButton;
  v3 = -[PHAudioControlsButton initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new(NSUUID);
    uuid = v3->_uuid;
    v3->_uuid = v4;

    -[PHAudioControlsButton setupLabel](v3, "setupLabel");
    -[PHAudioControlsButton setupBackdropView](v3, "setupBackdropView");
    -[PHAudioControlsButton setupRoundview](v3, "setupRoundview");
    -[PHAudioControlsButton setupConstraints](v3, "setupConstraints");
    -[PHAudioControlsButton sendSubviewToBack:](v3, "sendSubviewToBack:", v3->_roundView);
    if (-[PHAudioControlsButton isButtonLayoutEnabled](v3, "isButtonLayoutEnabled"))
      -[PHAudioControlsButton sendSubviewToBack:](v3, "sendSubviewToBack:", v3->_backdropEffectView);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton imageView](v3, "imageView"));
    -[PHAudioControlsButton bringSubviewToFront:](v3, "bringSubviewToFront:", v6);

    -[PHAudioControlsButton setupTitleColors](v3, "setupTitleColors");
    -[PHAudioControlsButton adjustImageColors](v3, "adjustImageColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton layer](v3, "layer"));
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton layer](v3, "layer"));
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    -[PHAudioControlsButton _titleOffset](v3, "_titleOffset");
    -[PHAudioControlsButton setTitleEdgeInsets:](v3, "setTitleEdgeInsets:");
    -[PHAudioControlsButton updateViewsAnimated:](v3, "updateViewsAnimated:", 0);
  }
  return v3;
}

- (PHAudioControlsButton)initWithSize:(CGSize)a3
{
  self->_sizeOverride = a3;
  return -[PHAudioControlsButton initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)setupLabel
{
  unint64_t v2;
  double v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton titleLabel](self, "titleLabel"));
  v2 = +[PHUIConfiguration inCallControlSize](PHUIConfiguration, "inCallControlSize");
  v3 = 15.0;
  if (v2 == 1)
    v3 = 13.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v3));
  objc_msgSend(v5, "setFont:", v4);

  objc_msgSend(v5, "setLineBreakMode:", 0);
  objc_msgSend(v5, "setTextAlignment:", 1);

}

- (void)setupRoundview
{
  double v3;
  double v4;
  double v5;
  double v6;
  PHRoundView *v7;
  double v8;
  PHRoundView *v9;
  PHRoundView *roundView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[PHAudioControlsButton _buttonSize](self, "_buttonSize");
  v4 = v3;
  v6 = v5;
  v7 = [PHRoundView alloc];
  *(float *)&v8 = v6 * 0.5;
  v9 = -[PHRoundView initWithFrame:cornerRadius:](v7, "initWithFrame:cornerRadius:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, v8);
  roundView = self->_roundView;
  self->_roundView = v9;

  -[PHRoundView setTranslatesAutoresizingMaskIntoConstraints:](self->_roundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHRoundView widthAnchor](self->_roundView, "widthAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", v4));
  objc_msgSend(v12, "setActive:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHRoundView heightAnchor](self->_roundView, "heightAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", v6));
  objc_msgSend(v14, "setActive:", 1);

  -[PHRoundView setUserInteractionEnabled:](self->_roundView, "setUserInteractionEnabled:", 0);
  -[PHAudioControlsButton addSubview:](self, "addSubview:", self->_roundView);
}

- (void)setupBackdropView
{
  double v3;
  double v4;
  double v5;
  double v6;
  BackdropView *v7;
  UIView *v8;
  CABackdropLayer *backdropLayer;
  id v10;
  void *v11;
  UIView *v12;
  id v13;
  void *v14;
  void *v15;
  UIView *backdropView;
  id v17;
  _QWORD v18[2];

  -[PHAudioControlsButton _buttonSize](self, "_buttonSize");
  v4 = v3;
  v6 = v5;
  if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled"))
  {
    v7 = objc_alloc_init(BackdropView);
    v8 = (UIView *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControls](UIColorEffect, "inCallControls"));
    backdropLayer = (CABackdropLayer *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 40.0));
    v10 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", 0);

    v18[0] = v8;
    v18[1] = backdropLayer;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
    objc_msgSend(v10, "setBackgroundEffects:", v11);

    objc_msgSend(v10, "setFrame:", 0.0, 0.0, v4, v6);
    objc_msgSend(v10, "_setCornerRadius:", v6 * 0.5);
    objc_msgSend(v10, "setUserInteractionEnabled:", 0);
    -[PHAudioControlsButton addSubview:](self, "addSubview:", v10);
    -[PHAudioControlsButton setBackdropEffectView:](self, "setBackdropEffectView:", v10);
  }
  else
  {
    v12 = (UIView *)objc_alloc_init((Class)UIView);
    v13 = objc_alloc_init((Class)CABackdropLayer);
    v10 = (id)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorSaturate));
    objc_msgSend(v10, "setName:", CFSTR("saturation"));
    objc_msgSend(v10, "setValue:forKey:", &off_1002973F8, CFSTR("inputAmount"));
    v17 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    objc_msgSend(v13, "setFilters:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v12, "layer"));
    objc_msgSend(v15, "addSublayer:", v13);

    objc_msgSend(v13, "setFrame:", 0.0, 0.0, v4, v6);
    objc_msgSend(v13, "setCornerRadius:", v6 * 0.5);
    -[UIView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
    -[PHAudioControlsButton addSubview:](self, "addSubview:", v12);
    backdropView = self->_backdropView;
    self->_backdropView = v12;
    v8 = v12;

    backdropLayer = self->_backdropLayer;
    self->_backdropLayer = (CABackdropLayer *)v13;
  }

}

- (void)updateBackgroundMaterial:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void **v7;
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

  switch(a3)
  {
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));

      if (v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControls](UIColorEffect, "inCallControls"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 40.0));
        v15 = v5;
        v16 = v6;
        v7 = &v15;
        goto LABEL_10;
      }
      break;
    case 1uLL:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));

      if (v8)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControlsButtonAvatarOnly](UIColorEffect, "inCallControlsButtonAvatarOnly"));
        v19 = v5;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));
        objc_msgSend(v9, "setBackgroundEffects:", v6);
        goto LABEL_11;
      }
      break;
    case 2uLL:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));

      if (v10)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControlsButtonNoPhotoNoAvatar](UIColorEffect, "inCallControlsButtonNoPhotoNoAvatar"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 30.0));
        v17 = v5;
        v18 = v6;
        v7 = &v17;
        goto LABEL_10;
      }
      break;
    case 3uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));

      if (v11)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControlsEmergencyCallButton](UIColorEffect, "inCallControlsEmergencyCallButton"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 100.0));
        v13 = v5;
        v14 = v6;
        v7 = &v13;
LABEL_10:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2, v13, v14, v15, v16, v17, v18));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));
        objc_msgSend(v12, "setBackgroundEffects:", v9);

LABEL_11:
      }
      break;
    default:
      return;
  }
}

- (void)setupTitleColors
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.899999976, 1.0));
    -[PHAudioControlsButton setTitleColor:forState:](self, "setTitleColor:forState:", v4, 0);

    v3 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.200000003));
  }
  v5 = (id)v3;
  -[PHAudioControlsButton setTitleColor:forState:](self, "setTitleColor:forState:");

}

- (void)setupConstraints
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_roundView, 9, 0, self, 9, 1.0, 0.0));
  -[PHAudioControlsButton addConstraint:](self, "addConstraint:", v3);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_roundView, 10, 0, self, 10, 1.0, 0.0));
  -[PHAudioControlsButton addConstraint:](self, "addConstraint:", v4);

}

- (void)adjustImageColors
{
  if (!-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled"))
    -[PHAudioControlsButton setAdjustsImageWhenDisabled:](self, "setAdjustsImageWhenDisabled:", 1);
  -[PHAudioControlsButton setAdjustsImageWhenHighlighted:](self, "setAdjustsImageWhenHighlighted:", 0);
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double width;
  double x;
  double top;
  double left;
  double right;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double height;
  void *v15;
  void *v16;
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
  NSAttributedStringKey v27;
  void *v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  width = a3.size.width;
  x = a3.origin.x;
  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  right = self->_contentInsets.right;
  v9 = a3.origin.y + top;
  v10 = a3.size.height - (top + self->_contentInsets.bottom);
  if ((id)-[PHAudioControlsButton controlType](self, "controlType") == (id)17)
    v11 = 15.0;
  else
    v11 = 12.0;
  v12 = objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton currentTitle](self, "currentTitle"));
  -[PHAudioControlsButton bounds](self, "bounds");
  v30 = CGRectInset(v29, -v11, 0.0);
  v13 = v30.size.width;
  height = v30.size.height;
  v27 = NSFontAttributeName;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton _font](self, "_font", v30.origin.x, v30.origin.y));
  v28 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  objc_msgSend((id)v12, "boundingRectWithSize:options:attributes:context:", 1, v16, 0, v13, height);
  v18 = v17;
  v20 = v19;

  v21 = ceil(v20);
  LOBYTE(v12) = -[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled");
  -[PHAudioControlsButton _titleOffset](self, "_titleOffset");
  v23 = v9 + v10 + v22;
  if ((v12 & 1) == 0)
    v23 = v23 - floor(v21 / 2.4000001);
  v24 = ceil(v18);
  v25 = x + left + (width - (left + right) - v24) * 0.5;
  v26 = v21;
  result.size.height = v26;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v25;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double left;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double width;
  double v12;
  double height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double x;
  double y;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  left = self->_contentInsets.left;
  v5 = a3.origin.x + left;
  v6 = a3.size.width - (left + self->_contentInsets.right);
  v7 = a3.size.height - (self->_contentInsets.top + self->_contentInsets.bottom);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton currentImage](self, "currentImage"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton currentImage](self, "currentImage"));
    objc_msgSend(v9, "size");
    width = v10;
    height = v12;

  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  -[PHAudioControlsButton imageEdgeInsets](self, "imageEdgeInsets");
  v15 = width - v14;
  -[PHAudioControlsButton imageEdgeInsets](self, "imageEdgeInsets");
  v17 = v15 - v16;
  -[PHAudioControlsButton imageEdgeInsets](self, "imageEdgeInsets");
  v19 = height - v18;
  -[PHAudioControlsButton imageEdgeInsets](self, "imageEdgeInsets");
  v21 = v19 - v20;
  x = v5 + (v6 - v17) * 0.5;
  y = v7 * 0.5 - ceil(v21 * 0.5);
  if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled")
    && (id)-[PHAudioControlsButton controlType](self, "controlType") == (id)4)
  {
    v24 = -2.0;
    v25 = 0.0;
LABEL_9:
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = v17;
    v30.size.height = v21;
    v31 = CGRectOffset(v30, v24, v25);
    x = v31.origin.x;
    y = v31.origin.y;
    v17 = v31.size.width;
    v21 = v31.size.height;
    goto LABEL_10;
  }
  if ((id)-[PHAudioControlsButton controlType](self, "controlType") == (id)19)
  {
    v24 = 2.0;
    v25 = 2.0;
    goto LABEL_9;
  }
LABEL_10:
  v26 = x;
  v27 = y;
  v28 = v17;
  v29 = v21;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UIEdgeInsets *p_contentInsets;
  double v9;
  CGFloat v10;
  double v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentInsets = &self->_contentInsets;
  -[PHAudioControlsButton bounds](self, "bounds");
  v10 = v9 - height - y;
  -[PHAudioControlsButton bounds](self, "bounds");
  p_contentInsets->top = y;
  p_contentInsets->left = x;
  p_contentInsets->bottom = v10;
  p_contentInsets->right = v11 - x - width;
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHAudioControlsButton;
  -[PHAudioControlsButton setHighlighted:](&v4, "setHighlighted:", a3);
  -[PHAudioControlsButton updateViewsAnimated:](self, "updateViewsAnimated:", 1);
  -[PHAudioControlsButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_roundView);
  if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled"))
    -[PHAudioControlsButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backdropEffectView);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PHAudioControlsButton isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)PHAudioControlsButton;
  -[PHAudioControlsButton setSelected:](&v6, "setSelected:", v3);
  if (v5 != v3)
    -[PHAudioControlsButton updateViewsAnimated:](self, "updateViewsAnimated:", 1);
  -[PHAudioControlsButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_roundView);
  if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled"))
    -[PHAudioControlsButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backdropEffectView);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PHAudioControlsButton isEnabled](self, "isEnabled");
  v6.receiver = self;
  v6.super_class = (Class)PHAudioControlsButton;
  -[PHAudioControlsButton setEnabled:](&v6, "setEnabled:", v3);
  if (v5 != v3)
    -[PHAudioControlsButton updateViewsAnimated:](self, "updateViewsAnimated:", 1);
  -[PHAudioControlsButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_roundView);
  if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled"))
    -[PHAudioControlsButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backdropEffectView);
}

- (void)setControlImage:(id)a3
{
  UIImage *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  UIImage *ImageFromCurrentImageContext;
  void *v19;
  UIImage *v20;
  CGSize v21;

  v5 = (UIImage *)a3;
  if (self->_controlImage != v5)
  {
    v20 = v5;
    objc_storeStrong((id *)&self->_controlImage, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton controlImage](self, "controlImage"));
    -[PHAudioControlsButton setImage:forStates:](self, "setImage:forStates:", v6, 0);

    if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage imageWithRenderingMode:](v20, "imageWithRenderingMode:", 2));
      objc_msgSend(v7, "size");
      v9 = v8;
      v11 = v10;
      -[UIImage scale](v20, "scale");
      v13 = v12;
      v21.width = v9;
      v21.height = v11;
      UIGraphicsBeginImageContextWithOptions(v21, 0, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      objc_msgSend(v14, "set");

      -[UIImage size](v20, "size");
      v16 = v15;
      -[UIImage size](v20, "size");
      objc_msgSend(v7, "drawInRect:blendMode:alpha:", 2, 0.0, 0.0, v16, v17, 0.2);
      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v19 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      UIGraphicsEndImageContext();
      -[PHAudioControlsButton setImage:forState:](self, "setImage:forState:", v19, 2);

    }
    -[PHAudioControlsButton updateViewsAnimated:](self, "updateViewsAnimated:", 0);
    v5 = v20;
  }

}

- (void)updateViewsAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PHAudioControlsButton updateRoundViewColorAnimated:](self, "updateRoundViewColorAnimated:", a3);
  -[PHAudioControlsButton updateImageColor](self, "updateImageColor");
  -[PHAudioControlsButton updateMaterialAndAlpha](self, "updateMaterialAndAlpha");
  -[PHAudioControlsButton setNeedsDisplay](self, "setNeedsDisplay");
  -[PHAudioControlsButton forceDisplayIfNeeded](self, "forceDisplayIfNeeded");
  if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled")
    && (id)-[PHAudioControlsButton controlType](self, "controlType") == (id)16)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton roundView](self, "roundView"));
    objc_msgSend(v4, "setAlpha:", 0.0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));
    objc_msgSend(v5, "setAlpha:", 0.0);

  }
  if ((id)-[PHAudioControlsButton controlType](self, "controlType") == (id)15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropView](self, "backdropView"));
    objc_msgSend(v6, "setAlpha:", 0.0);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));
    objc_msgSend(v7, "setAlpha:", 0.0);

  }
}

- (void)updateMaterialAndAlpha
{
  unsigned int v3;
  void *v4;
  double v5;
  id v6;

  if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled"))
  {
    v3 = -[PHAudioControlsButton isSelected](self, "isSelected");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));
    v6 = v4;
    v5 = 1.0;
    if (v3)
      v5 = 0.0;
    objc_msgSend(v4, "setAlpha:", v5);

  }
}

- (id)circleWithColor:(id)a3 radius:(int)a4
{
  id v5;
  id v6;
  double v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, (double)(2 * a4), (double)(2 * a4));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = (double)a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v8, "setCornerRadius:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v9, "setMasksToBounds:", 1);

  return v6;
}

- (void)updateRoundViewColorAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003C2B8;
  v6[3] = &unk_100284898;
  v6[4] = self;
  v4 = objc_retainBlock(v6);
  v5 = v4;
  if (v3)
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v4, 0.170000002);
  else
    ((void (*)(_QWORD *))v4[2])(v4);

}

- (void)updateImageColor
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[PHAudioControlsButton controlType](self, "controlType"))
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  v5 = (id)v3;
  if (-[PHAudioControlsButton isSelected](self, "isSelected"))
  {
    -[PHAudioControlsButton setTintColor:](self, "setTintColor:", v5);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[PHAudioControlsButton setTintColor:](self, "setTintColor:", v4);

  }
}

- (BOOL)isButtonLayoutEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v3 = objc_msgSend(v2, "isButtonLayoutEnabled");

  return v3;
}

- (CGSize)_buttonSize
{
  double v3;
  double v4;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float v14;
  unint64_t v15;
  CGSize result;

  -[PHAudioControlsButton sizeOverride](self, "sizeOverride");
  if (CGSizeZero.width == v4 && CGSizeZero.height == v3)
  {
    if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v8, "bounds");
      v10 = v9;
      v12 = v11;

      if (v10 >= v12)
        v13 = v12;
      else
        v13 = v10;
      v14 = v13 * 0.1976;
      v6 = roundf(v14);
    }
    else
    {
      v15 = +[PHUIConfiguration inCallControlSize](PHUIConfiguration, "inCallControlSize");
      v6 = 65.0;
      switch(v15)
      {
        case 1uLL:
          break;
        case 4uLL:
          v6 = 85.0;
          break;
        default:
          v6 = 75.0;
          break;
      }
    }
    v7 = v6;
  }
  else
  {
    -[PHAudioControlsButton sizeOverride](self, "sizeOverride");
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)_titleOffset
{
  unsigned __int8 v2;
  double result;
  unint64_t v4;

  v2 = -[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled");
  result = 6.0;
  if ((v2 & 1) == 0)
  {
    v4 = +[PHUIConfiguration inCallControlSize](PHUIConfiguration, "inCallControlSize", 6.0);
    result = 0.0;
    if (v4 - 1 <= 3)
      return dbl_10023F578[v4 - 1];
  }
  return result;
}

- (void)setCaptureView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[PHAudioControlsButton isButtonLayoutEnabled](self, "isButtonLayoutEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));
    objc_msgSend(v4, "_setGroupName:", CFSTR("InCallButtonsCaptureGroup"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton backdropEffectView](self, "backdropEffectView"));
    objc_msgSend(v5, "_setCaptureView:", v6);

  }
}

- (void)setMenuDataSource:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_menuDataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_menuDataSource, obj);
    -[PHAudioControlsButton setContextMenuEnabled:](self, "setContextMenuEnabled:", obj != 0);
    -[PHAudioControlsButton setContextMenuIsPrimary:](self, "setContextMenuIsPrimary:", obj != 0);
  }

}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];
  CGPoint v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003C7A4;
  v5[3] = &unk_100285478;
  v6 = a4;
  v5[4] = self;
  return (id)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5));
}

- (int64_t)ambientButtonType
{
  return 2 * ((id)-[PHAudioControlsButton controlType](self, "controlType") == (id)15);
}

- (NSArray)ambientButtonParts
{
  id v3;
  PHRoundView *roundView;
  void *v5;
  UIView *backdropView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init((Class)NSMutableArray);
  roundView = self->_roundView;
  if (roundView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHAmbientButtonPart partWithView:type:](PHAmbientButtonPart, "partWithView:type:", roundView, 0));
    objc_msgSend(v3, "addObject:", v5);

  }
  backdropView = self->_backdropView;
  if (backdropView)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHAmbientButtonPart partWithView:type:](PHAmbientButtonPart, "partWithView:type:", backdropView, 0));
    objc_msgSend(v3, "addObject:", v7);

  }
  if (self->_backdropEffectView && (id)-[PHAudioControlsButton ambientButtonType](self, "ambientButtonType") != (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHAmbientButtonPart partWithView:type:](PHAmbientButtonPart, "partWithView:type:", self->_backdropEffectView, 0));
    objc_msgSend(v3, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton imageView](self, "imageView"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton imageView](self, "imageView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHAmbientButtonPart partWithView:type:](PHAmbientButtonPart, "partWithView:type:", v10, 1));
    objc_msgSend(v3, "addObject:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton titleLabel](self, "titleLabel"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioControlsButton titleLabel](self, "titleLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PHAmbientButtonPart partWithView:type:](PHAmbientButtonPart, "partWithView:type:", v13, 2));
    objc_msgSend(v3, "addObject:", v14);

  }
  return (NSArray *)v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (UIImage)controlImage
{
  return self->_controlImage;
}

- (unint64_t)controlType
{
  return self->_controlType;
}

- (void)setControlType:(unint64_t)a3
{
  self->_controlType = a3;
}

- (PHAudioControlsButtonMenuDataSource)menuDataSource
{
  return (PHAudioControlsButtonMenuDataSource *)objc_loadWeakRetained((id *)&self->_menuDataSource);
}

- (PHRoundView)roundView
{
  return (PHRoundView *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRoundView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CGSize)sizeOverride
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_sizeOverride, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  UIEdgeInsets result;

  objc_copyStruct(v6, &self->_contentInsets, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v3;

  v3 = a3;
  objc_copyStruct(&self->_contentInsets, &v3, 32, 1, 0);
}

- (UIView)backdropView
{
  return (UIView *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBackdropView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIVisualEffectView)backdropEffectView
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBackdropEffectView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CABackdropLayer)backdropLayer
{
  return (CABackdropLayer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBackdropLayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_backdropEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_roundView, 0);
  objc_destroyWeak((id *)&self->_menuDataSource);
  objc_storeStrong((id *)&self->_controlImage, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
