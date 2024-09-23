@implementation PHBottomBarSupplementalButton

- (PHBottomBarSupplementalButton)initWithText:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  PHBottomBarSupplementalButton *v8;
  PHBottomBarSupplementalButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = -[PHBottomBarSupplementalButton initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    -[PHBottomBarSupplementalButton setTitle:forState:](v8, "setTitle:forState:", v6, 0);
    -[PHBottomBarSupplementalButton setImage:forState:](v9, "setImage:forState:", v7, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[PHBottomBarSupplementalButton setTintColor:](v9, "setTintColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton titleLabel](v9, "titleLabel"));
    objc_msgSend(v11, "setTextAlignment:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButton defaultFont](PHBottomBarButton, "defaultFont"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton titleLabel](v9, "titleLabel"));
    objc_msgSend(v13, "setFont:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton titleLabel](v9, "titleLabel"));
    objc_msgSend(v14, "setLineBreakMode:", 4);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton titleLabel](v9, "titleLabel"));
    objc_msgSend(v15, "setNumberOfLines:", 2);

  }
  return v9;
}

- (PHBottomBarSupplementalButton)initWithAction:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  PHBottomBarSupplementalButton *v10;
  id v11;
  NSObject *v12;

  if (a3 > 11)
  {
    if (a3 == 12)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 38, UIFontTextStyleTitle3, -1, 1));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("CALL_BACK_LATER");
      goto LABEL_9;
    }
    if (a3 != 27)
      goto LABEL_10;
LABEL_7:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 13, UIFontTextStyleTitle3, -1, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("SEND_MESSAGE");
    goto LABEL_9;
  }
  if (a3 == 9)
    goto LABEL_7;
  if (a3 == 10)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 13, UIFontTextStyleTitle3, -1, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("SCREENING_BLOCK");
LABEL_9:
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_10028DC20, CFSTR("BottomBar")));
    self = -[PHBottomBarSupplementalButton initWithText:image:](self, "initWithText:image:", v9, v5);

    v10 = self;
    goto LABEL_13;
  }
LABEL_10:
  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_1001AAA70(a3, v12);

  v10 = 0;
LABEL_13:

  return v10;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton image](self, "image"));
  objc_msgSend(v5, "size");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "intrinsicContentSize");
  v10 = v9;

  if (v7 >= v10)
    v11 = v7;
  else
    v11 = v10;
  if (v4 >= v11)
    v11 = v4;
  v12 = ceil(v11);
  if (v12 <= 100.0)
    v13 = v12;
  else
    v13 = 100.0;
  +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
  v15 = v14;
  v16 = v13;
  result.height = v15;
  result.width = v16;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)PHBottomBarSupplementalButton;
  -[PHBottomBarSupplementalButton imageRectForContentRect:](&v8, "imageRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width * 0.5 - v4 * 0.5;
  v7 = 2.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  NSAttributedStringKey v20;
  void *v21;
  CGRect result;

  width = a3.size.width;
  v19.receiver = self;
  v19.super_class = (Class)PHBottomBarSupplementalButton;
  -[PHBottomBarSupplementalButton titleRectForContentRect:](&v19, "titleRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton imageForState:](self, "imageForState:", 0));
  objc_msgSend(v5, "size");
  v7 = v6 + 10.0;

  +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
  v9 = v8 - v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton currentTitle](self, "currentTitle"));
  v20 = NSFontAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButton defaultFont](PHBottomBarButton, "defaultFont"));
  v21 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, width, 3.40282347e38);
  v14 = v13;

  if (v9 >= v14)
    v15 = v14;
  else
    v15 = v9;
  v16 = 0.0;
  v17 = v7;
  v18 = width;
  result.size.height = v15;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v5 = -[PHBottomBarSupplementalButton isHighlighted](self, "isHighlighted");
  v11.receiver = self;
  v11.super_class = (Class)PHBottomBarSupplementalButton;
  -[PHBottomBarSupplementalButton setHighlighted:](&v11, "setHighlighted:", v3);
  if (v5 != v3)
  {
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton layer](self, "layer"));
      objc_msgSend(v6, "removeAllAnimations");

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton layer](self, "layer"));
      LODWORD(v8) = 1045220557;
      objc_msgSend(v7, "setOpacity:", v8);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionDefault));
      objc_msgSend(v7, "setTimingFunction:", v9);

      objc_msgSend(v7, "setToValue:", &off_1002973D8);
      objc_msgSend(v7, "setDuration:", 0.5);
      objc_msgSend(v7, "setFillMode:", kCAFillModeForwards);
      objc_msgSend(v7, "setDelegate:", self);
      objc_msgSend(v7, "setRemovedOnCompletion:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton layer](self, "layer"));
      objc_msgSend(v10, "addAnimation:forKey:", v7, CFSTR("opacityAnimation"));

    }
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void *v6;
  float v7;
  void *v8;
  double v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton layer](self, "layer", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animationForKey:", CFSTR("opacityAnimation")));

  if (v6)
  {
    if (-[PHBottomBarSupplementalButton isHighlighted](self, "isHighlighted"))
      v7 = 0.2;
    else
      v7 = 1.0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton layer](self, "layer"));
    *(float *)&v9 = v7;
    objc_msgSend(v8, "setOpacity:", v9);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton layer](self, "layer"));
    objc_msgSend(v10, "removeAnimationForKey:", CFSTR("opacityAnimation"));

  }
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v5 = -[PHBottomBarSupplementalButton isEnabled](self, "isEnabled");
  v10.receiver = self;
  v10.super_class = (Class)PHBottomBarSupplementalButton;
  -[PHBottomBarSupplementalButton setEnabled:](&v10, "setEnabled:", v3);
  if (v5 != v3)
  {
    if (v3)
    {
      -[PHBottomBarSupplementalButton setAlpha:](self, "setAlpha:", 1.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton layer](self, "layer"));
      objc_msgSend(v6, "setCompositingFilter:", 0);
    }
    else
    {
      -[PHBottomBarSupplementalButton setAlpha:](self, "setAlpha:", 0.0500000007);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton layer](self, "layer"));
      objc_msgSend(v7, "setAllowsGroupBlending:", 0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton layer](self, "layer"));
      objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterOverlayBlendMode));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarSupplementalButton layer](self, "layer"));
      objc_msgSend(v9, "setCompositingFilter:", v6);

    }
  }
}

@end
