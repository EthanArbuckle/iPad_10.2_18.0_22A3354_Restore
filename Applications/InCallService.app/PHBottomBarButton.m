@implementation PHBottomBarButton

+ (UIFont)defaultFont
{
  if (qword_1002DC700 != -1)
    dispatch_once(&qword_1002DC700, &stru_1002853A8);
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", *(double *)&qword_1002D57C8, UIFontWeightRegular);
}

- (PHBottomBarButton)initWithConfiguration:(id)a3
{
  id v4;
  double y;
  double width;
  double height;
  PHBottomBarButton *v8;
  double v9;
  PHRoundView *v10;
  double v11;
  PHRoundView *v12;
  UIView *roundView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIView *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
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
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  objc_super v74;
  _QWORD v75[2];

  v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)PHBottomBarButton;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[PHBottomBarButton initWithFrame:](&v74, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (!v8)
    goto LABEL_16;
  objc_msgSend(v4, "diameter");
  v8->_diameter = v9;
  v10 = [PHRoundView alloc];
  *(float *)&v11 = v8->_diameter * 0.5;
  v12 = -[PHRoundView initWithFrame:cornerRadius:](v10, "initWithFrame:cornerRadius:", CGRectZero.origin.x, y, width, height, v11);
  roundView = v8->_roundView;
  v8->_roundView = &v12->super;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8->_roundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v8->_roundView, "widthAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", v8->_diameter));
  objc_msgSend(v15, "setActive:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v8->_roundView, "heightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", v8->_diameter));
  objc_msgSend(v17, "setActive:", 1);

  -[UIView setUserInteractionEnabled:](v8->_roundView, "setUserInteractionEnabled:", 0);
  v18 = v8->_roundView;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton imageView](v8, "imageView"));
  -[PHBottomBarButton insertSubview:below:](v8, "insertSubview:below:", v18, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](v8, "titleLabel"));
  objc_msgSend(v20, "setAdjustsFontSizeToFitWidth:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](v8, "titleLabel"));
  objc_msgSend(v21, "setTextAlignment:", 1);

  v23 = objc_msgSend((id)objc_opt_class(v8, v22), "defaultFont");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](v8, "titleLabel"));
  objc_msgSend(v25, "setFont:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](v8, "titleLabel"));
  objc_msgSend(v26, "setLineBreakMode:", 4);

  if ((id)+[PHUIConfiguration inCallBottomBarMaxTitleSize](PHUIConfiguration, "inCallBottomBarMaxTitleSize") == (id)1)v27 = 100.0;
  else
    v27 = 105.0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](v8, "titleLabel"));
  objc_msgSend(v28, "setPreferredMaxLayoutWidth:", v27);

  v29 = v8->_diameter * 0.5;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton layer](v8, "layer"));
  objc_msgSend(v30, "setCornerRadius:", v29);

  -[PHBottomBarButton setClipsToBounds:](v8, "setClipsToBounds:", 0);
  -[PHBottomBarButton setAdjustsImageWhenHighlighted:](v8, "setAdjustsImageWhenHighlighted:", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  -[PHBottomBarButton setTitle:forState:](v8, "setTitle:forState:", v31, 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "icon"));
  -[PHBottomBarButton setImage:forState:](v8, "setImage:forState:", v32, 0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](v8, "titleLabel"));
  objc_msgSend(v33, "setNumberOfLines:", 0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColor"));
  -[PHBottomBarButton setBackgroundColor:](v8, "setBackgroundColor:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[PHBottomBarButton setTintColor:](v8, "setTintColor:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityIdentifier"));
  -[PHBottomBarButton setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedIcon"));
  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedIcon"));
    -[PHBottomBarButton setImage:forState:](v8, "setImage:forState:", v38, 4);

  }
  if (objc_msgSend(v4, "action") == (id)11
    || objc_msgSend(v4, "action") == (id)24
    || objc_msgSend(v4, "action") == (id)12)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorEffect"));

    if (v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorEffect"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 40.0));
      v42 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", 0);
      -[PHBottomBarButton setEffectView:](v8, "setEffectView:", v42);

      v75[0] = v40;
      v75[1] = v41;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v75, 2));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
      objc_msgSend(v44, "setBackgroundEffects:", v43);

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
      objc_msgSend(v45, "_setGroupName:", CFSTR("PHBottomBarButtonCaptureGroup"));

      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "captureView"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
      objc_msgSend(v47, "_setCaptureView:", v46);

    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
    objc_msgSend(v48, "setAutoresizingMask:", 18);

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton layer](v8, "layer"));
    objc_msgSend(v49, "cornerRadius");
    v51 = v50;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "layer"));
    objc_msgSend(v53, "setCornerRadius:", v51);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
    objc_msgSend(v54, "setClipsToBounds:", 1);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton imageView](v8, "imageView"));
    -[PHBottomBarButton insertSubview:belowSubview:](v8, "insertSubview:belowSubview:", v55, v56);
    goto LABEL_13;
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundMaterial"));

  if (v63)
  {
    v64 = objc_alloc((Class)UIVisualEffectView);
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundMaterial"));
    v66 = objc_msgSend(v64, "initWithEffect:", v65);
    -[PHBottomBarButton setEffectView:](v8, "setEffectView:", v66);

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
    objc_msgSend(v67, "setAutoresizingMask:", 18);

    v68 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton layer](v8, "layer"));
    objc_msgSend(v68, "cornerRadius");
    v70 = v69;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "layer"));
    objc_msgSend(v72, "setCornerRadius:", v70);

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
    objc_msgSend(v73, "setClipsToBounds:", 1);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v8, "effectView"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton imageView](v8, "imageView"));
    -[PHBottomBarButton insertSubview:below:](v8, "insertSubview:below:", v55, v56);
LABEL_13:

  }
  -[PHBottomBarButton setAction:](v8, "setAction:", objc_msgSend(v4, "action"));
  if (objc_msgSend(v4, "action") == (id)35)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "icon"));
    objc_msgSend(v57, "size");
    v59 = v58;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "icon"));
    objc_msgSend(v60, "size");
    -[PHBottomBarButton setIconSizeRatio:](v8, "setIconSizeRatio:", v59 / v61);

    -[PHBottomBarButton setActionType:](v8, "setActionType:", objc_msgSend(v4, "action"));
  }
LABEL_16:

  return v8;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHBottomBarButton;
  -[PHBottomBarButton layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](self, "effectView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](self, "effectView"));
    -[PHBottomBarButton sendSubviewToBack:](self, "sendSubviewToBack:", v4);

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  PHBottomBarButton *v4;
  id v5;
  PHBottomBarButton *v6;
  uint64_t v7;
  void *v8;
  PHBottomBarButton *v9;
  PHBottomBarButton *v10;
  objc_super v12;

  v4 = self;
  v12.receiver = self;
  v12.super_class = (Class)PHBottomBarButton;
  v5 = -[PHBottomBarButton hitTest:withEvent:](&v12, "hitTest:withEvent:", a4, a3.x, a3.y);
  v6 = (PHBottomBarButton *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6
    || (v7 = objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v4, "effectView"))) == 0
    || (v8 = (void *)v7,
        v9 = (PHBottomBarButton *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton effectView](v4, "effectView")),
        v9,
        v8,
        v6 != v9))
  {
    v4 = v6;
  }
  v10 = v4;

  return v10;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PHBottomBarButton iconSizeRatio](self, "iconSizeRatio");
  v4 = v3;
  -[PHBottomBarButton diameter](self, "diameter");
  v6 = v5;
  if (v4 != 0.0)
  {
    -[PHBottomBarButton iconSizeRatio](self, "iconSizeRatio");
    v6 = v6 * v7;
  }
  -[PHBottomBarButton diameter](self, "diameter");
  v9 = v8;
  v10 = v6;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setOrientation:(int64_t)a3
{
  __int128 v5;
  void *v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  if (self->_orientation != a3)
  {
    v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v9.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v9.c = v5;
    *(_OWORD *)&v9.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if ((unint64_t)(a3 - 2) <= 2)
      CGAffineTransformMakeRotation(&v9, dbl_10023F4A0[a3 - 2]);
    self->_orientation = a3;
    v8 = v9;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton imageView](self, "imageView"));
    v7 = v8;
    objc_msgSend(v6, "setTransform:", &v7);

  }
}

- (void)setUsesSmallerFontSize:(BOOL)a3
{
  void *v4;
  id v5;

  self->_usesSmallerFontSize = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 10.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setFont:", v5);

}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double x;
  double y;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  v20.receiver = self;
  v20.super_class = (Class)PHBottomBarButton;
  -[PHBottomBarButton imageRectForContentRect:](&v20, "imageRectForContentRect:", a3.origin.x, a3.origin.y);
  v7 = v6;
  v9 = v8;
  v10 = -[PHBottomBarButton orientation](self, "orientation");
  if ((unint64_t)(v10 - 3) >= 2)
    v11 = v9;
  else
    v11 = v7;
  if ((unint64_t)(v10 - 3) < 2)
    v7 = v9;
  x = width * 0.5 - v7 * 0.5;
  y = height * 0.5 - v11 * 0.5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v14, "scale");
  if (v15 == 1.0)
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = v7;
    v21.size.height = v11;
    v22 = CGRectIntegral(v21);
    x = v22.origin.x;
    y = v22.origin.y;
    v7 = v22.size.width;
    v11 = v22.size.height;
  }

  v16 = x;
  v17 = y;
  v18 = v7;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  NSAttributedStringKey v44;
  void *v45;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  v8 = CGRectZero.size.width;
  v9 = CGRectZero.size.height;
  v10 = objc_claimAutoreleasedReturnValue(-[PHBottomBarButton currentTitle](self, "currentTitle", a3.origin.x, a3.origin.y));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton currentTitle](self, "currentTitle"));
    v13 = objc_msgSend(v12, "length");

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](self, "titleLabel"));
      objc_msgSend(v14, "preferredMaxLayoutWidth");
      v16 = v15;
      if ((id)-[PHBottomBarButton actionType](self, "actionType") == (id)35)
        v17 = v16 + -15.0;
      else
        v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "font"));
      v20 = v18;
      if (v18)
      {
        v21 = v18;
      }
      else
      {
        v22 = objc_msgSend((id)objc_opt_class(self, v19), "defaultFont");
        v21 = (id)objc_claimAutoreleasedReturnValue(v22);
      }
      v23 = v21;

      v44 = NSFontAttributeName;
      v45 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton currentTitle](self, "currentTitle"));
      objc_msgSend(v25, "boundingRectWithSize:options:attributes:context:", 1, v24, 0, 3.40282347e38, 3.40282347e38);
      v27 = v26;
      v29 = v28;

      v30 = ceil(v27);
      if (v17 >= v30)
        v8 = v30;
      else
        v8 = v17;
      if (v8 == v17)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton currentTitle](self, "currentTitle"));
        objc_msgSend(v31, "boundingRectWithSize:options:attributes:context:", 1, v24, 0, v17, 3.40282347e38);
        v33 = v32;

        v34 = ceil(v33);
        if (v34 <= 45.0)
          v9 = v34;
        else
          v9 = 45.0;
      }
      else
      {
        v9 = ceil(v29);
      }
      v35 = ceil(width * 0.5 - v8 * 0.5);
      v36 = -[PHBottomBarButton actionType](self, "actionType");
      v37 = ceil((width + -15.0) * 0.5 - v8 * 0.5);
      if (v36 == 35)
        x = v37;
      else
        x = v35;
      -[PHBottomBarButton titleRectYOffset](self, "titleRectYOffset");
      v39 = height + v38;
      if (v8 == v17 && v9 == 45.0)
        objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);
      y = ceil(v39);

    }
  }
  v40 = x;
  v41 = y;
  v42 = v8;
  v43 = v9;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (double)titleRectYOffset
{
  void *v2;
  id v3;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (!_os_feature_enabled_impl("ConversationKit", "CallUI_ButtonLayout") || (result = 6.0, v3 == (id)1))
  {
    if (qword_1002DC710 != -1)
      dispatch_once(&qword_1002DC710, &stru_1002853C8);
    return *(double *)&qword_1002DC708;
  }
  return result;
}

- (id)newOverlayView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  if (-[PHBottomBarButton action](self, "action") == (id)4
    || -[PHBottomBarButton action](self, "action") == (id)5
    || -[PHBottomBarButton action](self, "action") == (id)6
    || -[PHBottomBarButton action](self, "action") == (id)35)
  {
    v3 = objc_alloc((Class)UIImageView);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton imageView](self, "imageView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "image"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_flatImageWithColor:", v6));
    v8 = objc_msgSend(v3, "initWithImage:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v8, "setBackgroundColor:", v9);

    -[PHBottomBarButton frame](self, "frame");
    -[PHBottomBarButton imageRectForContentRect:](self, "imageRectForContentRect:");
    objc_msgSend(v8, "setFrame:");
  }
  else
  {
    v11 = objc_alloc((Class)UIView);
    -[PHBottomBarButton bounds](self, "bounds");
    v8 = objc_msgSend(v11, "initWithFrame:");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    objc_msgSend(v8, "setBackgroundColor:", v12);

    -[PHBottomBarButton frame](self, "frame");
    v14 = v13 * 0.5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    objc_msgSend(v15, "setCornerRadius:", v14);

  }
  objc_msgSend(v8, "setAlpha:", 0.400000006);
  objc_msgSend(v8, "setUserInteractionEnabled:", 0);
  return v8;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PHBottomBarButton isEnabled](self, "isEnabled");
  v6.receiver = self;
  v6.super_class = (Class)PHBottomBarButton;
  -[PHBottomBarButton setEnabled:](&v6, "setEnabled:", v3);
  if (v5 != v3)
    -[PHBottomBarButton _performSetEnabled:](self, "_performSetEnabled:", v3);
}

- (void)_performSetEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  id v22;

  v3 = a3;
  if (-[PHBottomBarButton action](self, "action") == (id)9 || -[PHBottomBarButton action](self, "action") == (id)11)
  {
    if (v3)
      v5 = 1.0;
    else
      v5 = 0.3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", v5));
    -[PHBottomBarButton setTintColor:](self, "setTintColor:", v7);

  }
  if (-[PHBottomBarButton canBeEnabled](self, "canBeEnabled"))
  {
    if (v3)
    {
      -[PHBottomBarButton setAlpha:](self, "setAlpha:", 1.0);
      if (-[PHBottomBarButton action](self, "action") == (id)1 || -[PHBottomBarButton action](self, "action") == (id)3)
        v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
      else
        v8 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      v17 = (void *)v8;
      -[PHBottomBarButton setBackgroundColor:](self, "setBackgroundColor:", v8);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton layer](self, "layer"));
      objc_msgSend(v18, "setCompositingFilter:", 0);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton imageView](self, "imageView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "image"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_flatImageWithColor:", v21));

      -[PHBottomBarButton setImage:forState:](self, "setImage:forState:", v22, 0);
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      -[PHBottomBarButton setBackgroundColor:](self, "setBackgroundColor:", v9);

      -[PHBottomBarButton setAlpha:](self, "setAlpha:", 0.0500000007);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton imageView](self, "imageView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "image"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_flatImageWithColor:", v12));

      -[PHBottomBarButton setImage:forState:](self, "setImage:forState:", v22, 0);
      -[PHBottomBarButton setImage:forState:](self, "setImage:forState:", v22, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton layer](self, "layer"));
      objc_msgSend(v13, "setAllowsGroupBlending:", 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton layer](self, "layer"));
      objc_msgSend(v14, "setAllowsGroupOpacity:", 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterOverlayBlendMode));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton layer](self, "layer"));
      objc_msgSend(v16, "setCompositingFilter:", v15);

    }
  }
}

- (BOOL)canBeEnabled
{
  id v3;

  if (-[PHBottomBarButton action](self, "action") == (id)14 || -[PHBottomBarButton action](self, "action") == (id)15)
    goto LABEL_6;
  v3 = -[PHBottomBarButton action](self, "action");
  if (v3 != (id)1)
  {
    if (-[PHBottomBarButton action](self, "action") == (id)7 || -[PHBottomBarButton action](self, "action") == (id)3)
    {
LABEL_6:
      LOBYTE(v3) = 1;
      return (char)v3;
    }
    LOBYTE(v3) = -[PHBottomBarButton action](self, "action") == (id)8;
  }
  return (char)v3;
}

- (void)setHighlighted:(BOOL)a3
{
  if ((((self->_overlayView == 0) ^ a3) & 1) == 0)
    -[PHBottomBarButton _performSetHighlighted:](self, "_performSetHighlighted:");
}

- (void)_performSetHighlighted:(BOOL)a3
{
  UIView *v4;
  UIView *overlayView;
  UIView *v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  _QWORD v12[4];
  UIView *v13;

  if (a3)
  {
    v4 = -[PHBottomBarButton newOverlayView](self, "newOverlayView");
    overlayView = self->_overlayView;
    self->_overlayView = v4;

    -[PHBottomBarButton addSubview:](self, "addSubview:", self->_overlayView);
  }
  else if (-[PHBottomBarButton isSelected](self, "isSelected"))
  {
    -[UIView removeFromSuperview](self->_overlayView, "removeFromSuperview");
    v6 = self->_overlayView;
    self->_overlayView = 0;

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionDefault));
    objc_msgSend(v7, "setTimingFunction:", v8);

    objc_msgSend(v7, "setToValue:", &off_100297338);
    objc_msgSend(v7, "setDuration:", 0.5);
    objc_msgSend(v7, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v7, "setRemovedOnCompletion:", 0);
    +[CATransaction begin](CATransaction, "begin");
    v9 = self->_overlayView;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100033828;
    v12[3] = &unk_100284898;
    v13 = v9;
    v10 = v9;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_overlayView, "layer"));
    objc_msgSend(v11, "addAnimation:forKey:", v7, CFSTR("opacityAnimation"));

    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PHBottomBarButton isSelected](self, "isSelected");
  v6.receiver = self;
  v6.super_class = (Class)PHBottomBarButton;
  -[PHBottomBarButton setSelected:](&v6, "setSelected:", v3);
  if (v5 != v3)
    -[PHBottomBarButton _performSetSelected:](self, "_performSetSelected:", v3);
}

- (void)_performSetSelected:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton backgroundColor](self, "backgroundColor"));
    -[PHBottomBarButton setOriginalBackgroundColor:](self, "setOriginalBackgroundColor:", v4);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton backgroundColor](self, "backgroundColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 1.0));
    -[PHBottomBarButton setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton originalBackgroundColor](self, "originalBackgroundColor"));
    -[PHBottomBarButton setBackgroundColor:](self, "setBackgroundColor:");
  }

}

- (void)setBackgroundColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_roundView, "setBackgroundColor:", a3);
}

- (id)backgroundColor
{
  return -[UIView backgroundColor](self->_roundView, "backgroundColor");
}

- (int64_t)ambientButtonType
{
  return -[PHBottomBarButton action](self, "action") == (id)1;
}

- (NSArray)ambientButtonParts
{
  id v3;
  UIView *roundView;
  void *v5;
  UIVisualEffectView *effectView;
  void *v7;
  UIView *overlayView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init((Class)NSMutableArray);
  roundView = self->_roundView;
  if (roundView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHAmbientButtonPart partWithView:type:](PHAmbientButtonPart, "partWithView:type:", roundView, 0));
    objc_msgSend(v3, "addObject:", v5);

  }
  effectView = self->_effectView;
  if (effectView)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHAmbientButtonPart partWithView:type:](PHAmbientButtonPart, "partWithView:type:", effectView, 0));
    objc_msgSend(v3, "addObject:", v7);

  }
  overlayView = self->_overlayView;
  if (overlayView)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHAmbientButtonPart partWithView:type:](PHAmbientButtonPart, "partWithView:type:", overlayView, 0));
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton imageView](self, "imageView"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton imageView](self, "imageView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHAmbientButtonPart partWithView:type:](PHAmbientButtonPart, "partWithView:type:", v11, 1));
    objc_msgSend(v3, "addObject:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](self, "titleLabel"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](self, "titleLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHAmbientButtonPart partWithView:type:](PHAmbientButtonPart, "partWithView:type:", v14, 2));
    objc_msgSend(v3, "addObject:", v15);

  }
  return (NSArray *)v3;
}

- (void)refreshForCallState:(int64_t)a3
{
  PHBottomBarButtonConfiguration *v5;
  id v6;
  PHBottomBarButtonConfiguration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[8];

  v5 = [PHBottomBarButtonConfiguration alloc];
  v6 = -[PHBottomBarButton action](self, "action");
  -[PHBottomBarButton diameter](self, "diameter");
  v7 = -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:](v5, "initWithAction:diameter:callState:", v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButtonConfiguration icon](v7, "icon"));
  -[PHBottomBarButton setImage:forState:](self, "setImage:forState:", v8, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButtonConfiguration backgroundColor](v7, "backgroundColor"));
  -[PHBottomBarButton setBackgroundColor:](self, "setBackgroundColor:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButtonConfiguration selectedIcon](v7, "selectedIcon"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButtonConfiguration selectedIcon](v7, "selectedIcon"));
    -[PHBottomBarButton setImage:forState:](self, "setImage:forState:", v11, 4);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton imageView](self, "imageView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
  v14 = *(_OWORD *)&CATransform3DIdentity.m33;
  v18[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v18[5] = v14;
  v15 = *(_OWORD *)&CATransform3DIdentity.m43;
  v18[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v18[7] = v15;
  v16 = *(_OWORD *)&CATransform3DIdentity.m13;
  v18[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v18[1] = v16;
  v17 = *(_OWORD *)&CATransform3DIdentity.m23;
  v18[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v18[3] = v17;
  objc_msgSend(v13, "setTransform:", v18);

}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)usesSmallerFontSize
{
  return self->_usesSmallerFontSize;
}

- (BOOL)isShowingCountdown
{
  return self->_isShowingCountdown;
}

- (UIView)roundView
{
  return self->_roundView;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (UIColor)originalBackgroundColor
{
  return self->_originalBackgroundColor;
}

- (void)setOriginalBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_originalBackgroundColor, a3);
}

- (CGSize)buttonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_buttonSize.width;
  height = self->_buttonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setButtonSize:(CGSize)a3
{
  self->_buttonSize = a3;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (PHRingHighlightView)ringView
{
  return self->_ringView;
}

- (void)setRingView:(id)a3
{
  objc_storeStrong((id *)&self->_ringView, a3);
}

- (double)iconSizeRatio
{
  return self->_iconSizeRatio;
}

- (void)setIconSizeRatio:(double)a3
{
  self->_iconSizeRatio = a3;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_originalBackgroundColor, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_roundView, 0);
}

@end
