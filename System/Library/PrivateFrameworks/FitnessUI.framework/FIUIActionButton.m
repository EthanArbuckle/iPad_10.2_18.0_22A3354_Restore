@implementation FIUIActionButton

+ (id)buttonWithTitle:(id)a3 color:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "buttonWithType:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v10, 0);

  objc_msgSend(v8, "imageWithRenderingMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setImage:forState:", v12, 0);
  objc_msgSend(v9, "colorWithAlphaComponent:", 0.2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundImageColor:", v13);

  objc_msgSend(v9, "colorWithAlphaComponent:", 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setImageViewTintColor:", v14);
  objc_msgSend(v11, "sizeToFit");
  return v11;
}

- (FIUIActionButton)initWithFrame:(CGRect)a3
{
  FIUIActionButton *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIImageView *v11;
  UIImageView *transformingImageView;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FIUIActionButton;
  v3 = -[FIUIActionButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "defaultFontForTextStyle:", *MEMORY[0x24BEBE1E8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIActionButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v4);

    -[FIUIActionButton titleLabel](v3, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineBreakMode:", 4);

    -[FIUIActionButton titleLabel](v3, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTextAlignment:", 1);

    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIActionButton titleLabel](v3, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    -[FIUIActionButton titleLabel](v3, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsDefaultTighteningForTruncation:", 1);

    -[FIUIActionButton _setupInternalTouchActions](v3, "_setupInternalTouchActions");
    v11 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    transformingImageView = v3->_transformingImageView;
    v3->_transformingImageView = v11;

    -[UIImageView setContentMode:](v3->_transformingImageView, "setContentMode:", 1);
    -[FIUIActionButton addSubview:](v3, "addSubview:", v3->_transformingImageView);
    -[FIUIActionButton imageView](v3, "imageView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 0.0);

    -[FIUIActionButton setExclusiveTouch:](v3, "setExclusiveTouch:", 1);
  }
  return v3;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  CGFloat height;
  double width;
  double y;
  CGFloat x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FIUIActionButton currentTitle](self, "currentTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[FIUIActionButton titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_firstBaselineOffsetFromTop");
    v11 = v10;

    -[FIUIActionButton titleLabel](self, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "intrinsicContentSize");
    v14 = v13;

    if (width < v14)
    {
      v18 = 0.0;
    }
    else
    {
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.width = width;
      v29.size.height = height;
      v15 = CGRectGetWidth(v29) * 0.5;
      -[FIUIActionButton titleLabel](self, "titleLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "intrinsicContentSize");
      v18 = v15 - v17 * 0.5;

      -[FIUIActionButton titleLabel](self, "titleLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "intrinsicContentSize");
      width = v20;

    }
    v21 = y + 43.5 + 15.5 - v11;
    -[FIUIActionButton titleLabel](self, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "intrinsicContentSize");
    v22 = v24;

  }
  else
  {
    v18 = *MEMORY[0x24BDBF090];
    v21 = *(double *)(MEMORY[0x24BDBF090] + 8);
    width = *(double *)(MEMORY[0x24BDBF090] + 16);
    v22 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v25 = v18;
  v26 = v21;
  v27 = width;
  v28 = v22;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)_setupInternalTouchActions
{
  -[FIUIActionButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__touchDown, 1);
  -[FIUIActionButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__touchDown, 16);
  -[FIUIActionButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__touchUp, 64);
  -[FIUIActionButton addTarget:action:forControlEvents:](self, "addTarget:action:forControlEvents:", self, sel__touchUp, 32);
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double width;
  void *v4;
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
  double v15;
  double v16;
  CGRect result;

  width = a3.size.width;
  -[FIUIActionButton imageForState:](self, "imageForState:", -[FIUIActionButton state](self, "state", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = (width - v5) * 0.5;
  objc_msgSend(v4, "size");
  v8 = (43.5 - v7) * 0.5;
  objc_msgSend(v4, "size");
  v10 = v9;
  objc_msgSend(v4, "size");
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  void *v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  double x;
  double y;
  double width;
  double height;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  CGAffineTransform v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;

  v24.receiver = self;
  v24.super_class = (Class)FIUIActionButton;
  -[FIUIActionButton layoutSubviews](&v24, sel_layoutSubviews);
  -[FIUIActionButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  -[FIUIActionButton transformingImageView](self, "transformingImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicContentSize");
  v6 = v5;
  -[FIUIActionButton transformingImageView](self, "transformingImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  v9 = v8;

  -[FIUIActionButton transformingImageView](self, "transformingImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(&v23, 0, sizeof(v23));
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = v6;
  v25.size.height = v9;
  v26 = CGRectApplyAffineTransform(v25, &v23);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  -[FIUIActionButton transformingImageView](self, "transformingImageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", x, y, width, height);

  -[FIUIActionButton imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "center");
  v19 = v18;
  v21 = v20;
  -[FIUIActionButton transformingImageView](self, "transformingImageView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCenter:", v19, v21);

}

- (UIImageView)transformingImageView
{
  return self->_transformingImageView;
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FIUIActionButton;
  v6 = a3;
  -[FIUIActionButton setImage:forState:](&v8, sel_setImage_forState_, v6, a4);
  -[FIUIActionButton transformingImageView](self, "transformingImageView", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

}

- (void)setBackgroundImageColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  CGSize v9;

  v8 = a3;
  if ((-[UIColor isEqual:](self->_backgroundImageColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_backgroundImageColor, a3);
    v5 = v8;
    v9.width = 67.5;
    v9.height = 43.5;
    UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
    objc_msgSend(v5, "setFill");

    objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 67.5, 43.5, 21.75);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fill");
    UIGraphicsGetImageFromCurrentImageContext();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

    -[FIUIActionButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v7, 0);
  }

}

- (void)setImageViewTintColor:(id)a3
{
  UIColor **p_imageViewTintColor;
  UIColor *v6;
  void *v7;
  id v8;

  p_imageViewTintColor = &self->_imageViewTintColor;
  v8 = a3;
  if ((objc_msgSend(v8, "isEqual:", *p_imageViewTintColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_imageViewTintColor, a3);
    v6 = *p_imageViewTintColor;
    -[FIUIActionButton transformingImageView](self, "transformingImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

  }
}

- (void)setTouchUpAnimationCompleteHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  UIColor *imageViewTintColor;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FIUIActionButton;
  -[FIUIActionButton setEnabled:](&v8, sel_setEnabled_);
  if (v3)
  {
    -[FIUIActionButton setAlpha:](self, "setAlpha:", 1.0);
    imageViewTintColor = self->_imageViewTintColor;
    -[FIUIActionButton transformingImageView](self, "transformingImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", imageViewTintColor);
  }
  else
  {
    -[FIUIActionButton setAlpha:](self, "setAlpha:", 0.400000006);
    objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIActionButton transformingImageView](self, "transformingImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v6);

  }
}

- (CGRect)backgroundRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = (a3.size.width + -67.5) * 0.5;
  v4 = 67.5;
  v5 = 43.5;
  v6 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v6;
  result.origin.x = v3;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  FIUIActionButton *v11;
  CGPoint v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  -[FIUIActionButton bounds](self, "bounds", a4);
  -[FIUIActionButton backgroundRectForBounds:](self, "backgroundRectForBounds:");
  v14.origin.x = v7 + -8.0;
  v14.origin.y = v8 + -12.0;
  v14.size.width = v9 + 16.0;
  v14.size.height = v10 + 24.0;
  v13.x = x;
  v13.y = y;
  if (CGRectContainsPoint(v14, v13))
    v11 = self;
  else
    v11 = 0;
  return v11;
}

- (void)_touchDown
{
  -[FIUIActionButton setAnimatingTouchDown:](self, "setAnimatingTouchDown:", 1);
  -[FIUIActionButton _animateHighlighted:](self, "_animateHighlighted:", 1);
}

- (void)setAnimatingTouchDown:(BOOL)a3
{
  self->_animatingTouchDown = a3;
}

- (void)_animateHighlighted:(BOOL)a3
{
  double v3;
  _QWORD v4[5];
  BOOL v5;
  _QWORD v6[6];

  v3 = 0.8;
  v6[0] = MEMORY[0x24BDAC760];
  if (!a3)
    v3 = 1.0;
  v6[1] = 3221225472;
  v6[2] = __40__FIUIActionButton__animateHighlighted___block_invoke;
  v6[3] = &unk_24CF319A0;
  v6[4] = self;
  *(double *)&v6[5] = v3;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__FIUIActionButton__animateHighlighted___block_invoke_2;
  v4[3] = &unk_24CF319C8;
  v4[4] = self;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v6, v4, 0.15);
}

void __40__FIUIActionButton__animateHighlighted___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "transformingImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

- (void)_touchUp
{
  if (!-[FIUIActionButton animatingTouchDown](self, "animatingTouchDown"))
    -[FIUIActionButton _animateHighlighted:](self, "_animateHighlighted:", 0);
}

- (BOOL)animatingTouchDown
{
  return self->_animatingTouchDown;
}

- (id)touchUpAnimationCompleteHandler
{
  return self->_touchUpAnimationCompleteHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformingImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageColor, 0);
  objc_storeStrong((id *)&self->_imageViewTintColor, 0);
  objc_storeStrong(&self->_touchUpAnimationCompleteHandler, 0);
}

- (void)turnIntoSolidDotWithDuration:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;

  v6 = a4;
  -[FIUIActionButton backgroundImageColor](self, "backgroundImageColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorWithAlphaComponent:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBDB00];
  v13 = v6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__FIUIActionButton_turnIntoSolidDotWithDuration_completion___block_invoke;
  v14[3] = &unk_24CF305D8;
  v14[4] = self;
  v15 = v8;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__FIUIActionButton_turnIntoSolidDotWithDuration_completion___block_invoke_2;
  v12[3] = &unk_24CF30438;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "transitionWithView:duration:options:animations:completion:", self, 5439616, v14, v12, a3);

}

void __60__FIUIActionButton_turnIntoSolidDotWithDuration_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setBackgroundImageColor:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "transformingImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

uint64_t __60__FIUIActionButton_turnIntoSolidDotWithDuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGSize)FIUIActionButtonSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[FIUIActionButton titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;

  v5 = v4 + 43.5 + 1.0;
  v6 = 67.5;
  result.height = v5;
  result.width = v6;
  return result;
}

void __40__FIUIActionButton__animateHighlighted___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "setAnimatingTouchDown:", 0);
  if ((objc_msgSend(*(id *)(a1 + 32), "isHighlighted") & 1) != 0 || !*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "touchUpAnimationCompleteHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "touchUpAnimationCompleteHandler");
      v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v3[2]();

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_animateHighlighted:", 0);
  }
}

- (CGRect)backgroundImageFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[FIUIActionButton bounds](self, "bounds");
  -[FIUIActionButton backgroundRectForBounds:](self, "backgroundRectForBounds:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIColor)imageViewTintColor
{
  return self->_imageViewTintColor;
}

- (UIColor)backgroundImageColor
{
  return self->_backgroundImageColor;
}

- (void)setTransformingImageView:(id)a3
{
  objc_storeStrong((id *)&self->_transformingImageView, a3);
}

@end
