@implementation MPUHalfTintedTransportButton

- (MPUHalfTintedTransportButton)initWithFrame:(CGRect)a3
{
  MPUHalfTintedTransportButton *v3;
  MPUTransportButtonEventHandler *v4;
  MPUTransportButtonEventHandler *transportButtonEventHandler;
  uint64_t v6;
  UIButton *regularButton;
  uint64_t v8;
  UIButton *tintedButton;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPUHalfTintedTransportButton;
  v3 = -[MPUHalfTintedTransportButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MPUTransportButtonEventHandler);
    transportButtonEventHandler = v3->_transportButtonEventHandler;
    v3->_transportButtonEventHandler = v4;

    -[MPUTransportButtonEventHandler setButton:](v3->_transportButtonEventHandler, "setButton:", v3);
    v6 = -[MPUHalfTintedTransportButton _newButton](v3, "_newButton");
    regularButton = v3->_regularButton;
    v3->_regularButton = (UIButton *)v6;

    -[UIButton setHidden:](v3->_regularButton, "setHidden:", 1);
    -[UIButton setUserInteractionEnabled:](v3->_regularButton, "setUserInteractionEnabled:", 0);
    -[MPUHalfTintedTransportButton addSubview:](v3, "addSubview:", v3->_regularButton);
    v8 = -[MPUHalfTintedTransportButton _newButton](v3, "_newButton");
    tintedButton = v3->_tintedButton;
    v3->_tintedButton = (UIButton *)v8;

    -[UIButton setHidden:](v3->_tintedButton, "setHidden:", 1);
    -[UIButton setUserInteractionEnabled:](v3->_tintedButton, "setUserInteractionEnabled:", 0);
    -[MPUHalfTintedTransportButton addSubview:](v3, "addSubview:", v3->_tintedButton);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPUHalfTintedTransportButton;
  -[MPUHalfTintedTransportButton layoutSubviews](&v11, sel_layoutSubviews);
  -[MPUHalfTintedTransportButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIButton setFrame:](self->_regularButton, "setFrame:");
  -[UIButton setFrame:](self->_tintedButton, "setFrame:", v4, v6, v8, v10);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  MPUTransportButtonEventHandler *transportButtonEventHandler;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  MPUHalfTintedTransportButton *v14;
  CGFloat v15;
  CGFloat v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  transportButtonEventHandler = self->_transportButtonEventHandler;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__MPUHalfTintedTransportButton_hitTest_withEvent___block_invoke;
  v12[3] = &unk_24DD6DFF8;
  v15 = x;
  v16 = y;
  v13 = v7;
  v14 = self;
  v9 = v7;
  -[MPUTransportButtonEventHandler performHitTestingBlock:](transportButtonEventHandler, "performHitTestingBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __50__MPUHalfTintedTransportButton_hitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v8;

  v2 = *(_QWORD *)(a1 + 32);
  v8.receiver = *(id *)(a1 + 40);
  v8.super_class = (Class)MPUHalfTintedTransportButton;
  objc_msgSendSuper2(&v8, sel_hitTest_withEvent_, v2, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = *(_QWORD **)(a1 + 40);
  if (v3 == v5[58] || v3 == v5[59])
  {
    v6 = v5;

    v4 = v6;
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIButton sizeThatFits:](self->_regularButton, "sizeThatFits:");
  v7 = v6;
  v9 = v8;
  -[UIButton sizeThatFits:](self->_tintedButton, "sizeThatFits:", width, height);
  if (v7 >= v10)
    v10 = v7;
  if (v9 >= v11)
    v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  MPUHalfTintedTransportButton *v5;
  MPUTransportButtonEventHandler *transportButtonEventHandler;
  id v7;
  id v8;
  objc_super v10;

  v5 = self;
  transportButtonEventHandler = self->_transportButtonEventHandler;
  v7 = a4;
  v8 = a3;
  -[MPUTransportButtonEventHandler beginTrackingWithTouch:withEvent:](transportButtonEventHandler, "beginTrackingWithTouch:withEvent:", v8, v7);
  v10.receiver = v5;
  v10.super_class = (Class)MPUHalfTintedTransportButton;
  LOBYTE(v5) = -[MPUHalfTintedTransportButton beginTrackingWithTouch:withEvent:](&v10, sel_beginTrackingWithTouch_withEvent_, v8, v7);

  return (char)v5;
}

- (void)cancelTrackingWithEvent:(id)a3
{
  MPUTransportButtonEventHandler *transportButtonEventHandler;
  id v5;
  objc_super v6;

  transportButtonEventHandler = self->_transportButtonEventHandler;
  v5 = a3;
  -[MPUTransportButtonEventHandler cancelTrackingWithEvent:](transportButtonEventHandler, "cancelTrackingWithEvent:", v5);
  v6.receiver = self;
  v6.super_class = (Class)MPUHalfTintedTransportButton;
  -[MPUHalfTintedTransportButton cancelTrackingWithEvent:](&v6, sel_cancelTrackingWithEvent_, v5);

}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  MPUTransportButtonEventHandler *transportButtonEventHandler;
  id v7;
  id v8;
  objc_super v9;

  transportButtonEventHandler = self->_transportButtonEventHandler;
  v7 = a4;
  v8 = a3;
  -[MPUTransportButtonEventHandler endTrackingWithTouch:withEvent:](transportButtonEventHandler, "endTrackingWithTouch:withEvent:", v8, v7);
  v9.receiver = self;
  v9.super_class = (Class)MPUHalfTintedTransportButton;
  -[MPUHalfTintedTransportButton endTrackingWithTouch:withEvent:](&v9, sel_endTrackingWithTouch_withEvent_, v8, v7);

}

- (BOOL)isEnabled
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUHalfTintedTransportButton;
  return -[MPUHalfTintedTransportButton isEnabled](&v4, sel_isEnabled)
      || -[MPUTransportButtonEventHandler shouldFakeEnabled](self->_transportButtonEventHandler, "shouldFakeEnabled");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPUHalfTintedTransportButton;
  -[MPUHalfTintedTransportButton setEnabled:](&v5, sel_setEnabled_);
  -[UIButton setEnabled:](self->_regularButton, "setEnabled:", v3);
  -[UIButton setEnabled:](self->_tintedButton, "setEnabled:", v3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPUHalfTintedTransportButton;
  -[MPUHalfTintedTransportButton setHighlighted:](&v5, sel_setHighlighted_);
  -[UIButton setHighlighted:](self->_regularButton, "setHighlighted:", v3);
  -[UIButton setHighlighted:](self->_tintedButton, "setHighlighted:", v3);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPUHalfTintedTransportButton;
  -[MPUHalfTintedTransportButton setSelected:](&v5, sel_setSelected_);
  if (-[MPUHalfTintedTransportButton _shouldForwardSelectedState](self, "_shouldForwardSelectedState"))
  {
    -[UIButton setSelected:](self->_regularButton, "setSelected:", v3);
    -[UIButton setSelected:](self->_tintedButton, "setSelected:", v3);
  }
}

- (BOOL)shouldTrack
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MPUHalfTintedTransportButton;
  return -[MPUHalfTintedTransportButton shouldTrack](&v4, sel_shouldTrack)
      || -[MPUTransportButtonEventHandler shouldForceTrackingEnabled](self->_transportButtonEventHandler, "shouldForceTrackingEnabled");
}

+ (id)transportButton
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (MPUTransportButtonEventHandler)transportButtonEventHandler
{
  return self->_transportButtonEventHandler;
}

- (void)applyTransportButtonLayoutAttributes:(id *)a3
{
  -[MPUHalfTintedTransportButton setFrame:](self, "setFrame:", a3->var1.origin.x, a3->var1.origin.y, a3->var1.size.width, a3->var1.size.height);
}

- (void)prepareForReuse
{
  -[MPUHalfTintedTransportButton setRegularImage:](self, "setRegularImage:", 0);
  -[MPUHalfTintedTransportButton setTintedImage:](self, "setTintedImage:", 0);
}

- (BOOL)wantsCustomHighlightAppearance
{
  return 1;
}

- (BOOL)adjustsImageWhenHighlighted
{
  return -[UIButton adjustsImageWhenHighlighted](self->_regularButton, "adjustsImageWhenHighlighted");
}

- (void)setAdjustsImageWhenHighlighted:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIButton setAdjustsImageWhenHighlighted:](self->_regularButton, "setAdjustsImageWhenHighlighted:");
  -[UIButton setAdjustsImageWhenHighlighted:](self->_tintedButton, "setAdjustsImageWhenHighlighted:", v3);
}

- (int64_t)transportButtonImageViewContentMode
{
  void *v2;
  int64_t v3;

  -[UIButton imageView](self->_regularButton, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentMode");

  return v3;
}

- (void)setTransportButtonImageViewContentMode:(int64_t)a3
{
  void *v5;
  id v6;

  -[UIButton imageView](self->_regularButton, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", a3);

  -[UIButton imageView](self->_tintedButton, "imageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentMode:", a3);

}

- (double)regularImageAlpha
{
  double result;

  -[UIButton alpha](self->_regularButton, "alpha");
  return result;
}

- (UIImageView)regularImageView
{
  return -[UIButton imageView](self->_regularButton, "imageView");
}

- (void)setRegularImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_regularImage != v5)
  {
    objc_storeStrong((id *)&self->_regularImage, a3);
    -[MPUHalfTintedTransportButton _updateRegularImage](self, "_updateRegularImage");
    -[UIButton setHidden:](self->_regularButton, "setHidden:", v5 == 0);
  }

}

- (void)setRegularImageAlpha:(double)a3
{
  -[UIButton setAlpha:](self->_regularButton, "setAlpha:", a3);
}

- (void)setRegularImageColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_regularImageColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_regularImageColor, a3);
    -[UIButton setTintColor:](self->_regularButton, "setTintColor:", v6);
    v5 = v6;
    if ((v6 != 0) == (self->_regularImageColor == 0))
    {
      -[MPUHalfTintedTransportButton _updateRegularImage](self, "_updateRegularImage");
      v5 = v6;
    }
  }

}

- (void)setTintedImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_tintedImage != v6)
  {
    objc_storeStrong((id *)&self->_tintedImage, a3);
    -[UIImage imageWithRenderingMode:](v6, "imageWithRenderingMode:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUHalfTintedTransportButton _applyImage:toButton:](self, "_applyImage:toButton:", v5, self->_tintedButton);

    -[UIButton setHidden:](self->_tintedButton, "setHidden:", v6 == 0);
  }

}

- (void)setTintedImageAlpha:(double)a3
{
  -[UIButton setAlpha:](self->_tintedButton, "setAlpha:", a3);
}

- (void)setTintedImageColor:(id)a3
{
  -[UIButton setTintColor:](self->_tintedButton, "setTintColor:", a3);
}

- (double)tintedImageAlpha
{
  double result;

  -[UIButton alpha](self->_tintedButton, "alpha");
  return result;
}

- (UIColor)tintedImageColor
{
  return -[UIButton tintColor](self->_tintedButton, "tintColor");
}

- (UIImageView)tintedImageView
{
  return -[UIButton imageView](self->_tintedButton, "imageView");
}

- (void)_applyImage:(id)a3 toButton:(id)a4
{
  objc_msgSend(a4, "setImage:forState:", a3, 0);
}

- (id)_newButton
{
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIButton)_regularButton
{
  return self->_regularButton;
}

- (BOOL)_shouldForwardSelectedState
{
  return 1;
}

- (UIButton)_tintedButton
{
  return self->_tintedButton;
}

- (void)_updateRegularImage
{
  uint64_t v3;
  id v4;

  if (self->_regularImageColor)
    v3 = 2;
  else
    v3 = 1;
  -[UIImage imageWithRenderingMode:](self->_regularImage, "imageWithRenderingMode:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MPUHalfTintedTransportButton _applyImage:toButton:](self, "_applyImage:toButton:", v4, self->_regularButton);

}

- (UIImage)regularImage
{
  return self->_regularImage;
}

- (UIColor)regularImageColor
{
  return self->_regularImageColor;
}

- (UIImage)tintedImage
{
  return self->_tintedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintedImage, 0);
  objc_storeStrong((id *)&self->_regularImageColor, 0);
  objc_storeStrong((id *)&self->_regularImage, 0);
  objc_storeStrong((id *)&self->_transportButtonEventHandler, 0);
  objc_storeStrong((id *)&self->_tintedButton, 0);
  objc_storeStrong((id *)&self->_regularButton, 0);
}

@end
