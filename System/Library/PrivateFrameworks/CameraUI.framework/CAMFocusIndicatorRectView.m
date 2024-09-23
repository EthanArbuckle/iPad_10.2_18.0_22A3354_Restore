@implementation CAMFocusIndicatorRectView

- (CAMFocusIndicatorRectView)initWithStyle:(int64_t)a3
{
  CAMFocusIndicatorRectView *v4;
  CAMFocusIndicatorRectView *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIImageView *imageView;
  CAMFocusIndicatorRectView *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CAMFocusIndicatorRectView;
  v4 = -[CAMFocusIndicatorRectView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(a3 - 2) < 2)
    {
      v9 = (void *)MEMORY[0x1E0DC3870];
      CAMCameraUIFrameworkBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("CAMSubjectIndicatorActive"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0DC3870];
      CAMCameraUIFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("CAMSubjectIndicatorInactive"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "size");
      v16 = v15 * 0.5;
      v18 = v17 * 0.5;
      objc_msgSend(v11, "resizableImageWithCapInsets:resizingMode:", 1, v16, v18, v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "resizableImageWithCapInsets:resizingMode:", 1, v16, v18, v16, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 == 1)
      {
        v7 = (void *)MEMORY[0x1E0DC3870];
        v8 = CFSTR("PLFocusCrosshairsSmall");
      }
      else
      {
        if (a3)
        {
          v19 = 0;
          v20 = 0;
          goto LABEL_11;
        }
        v7 = (void *)MEMORY[0x1E0DC3870];
        v8 = CFSTR("PLFocusCrosshairs");
      }
      objc_msgSend(v7, "imageNamed:inBundle:", v8, v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "imageWithTintColor:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 0;
    }

LABEL_11:
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:highlightedImage:", v19, v20);
    imageView = v5->__imageView;
    v5->__imageView = (UIImageView *)v22;

    -[UIImageView setContentMode:](v5->__imageView, "setContentMode:", 0);
    -[CAMFocusIndicatorRectView addSubview:](v5, "addSubview:", v5->__imageView);
    v24 = v5;

  }
  return v5;
}

- (void)setInactive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMFocusIndicatorRectView _imageView](self, "_imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", v3);

}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (CGSize)intrinsicContentSize
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  CGSize result;

  v3 = -[CAMFocusIndicatorRectView style](self, "style");
  if (v3 < 2)
  {
    -[CAMFocusIndicatorRectView _imageView](self, "_imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intrinsicContentSize");
    v7 = v6;
    v4 = v8;

  }
  else
  {
    if (v3 == 2)
    {
      *(double *)&v4 = 127.0;
    }
    else
    {
      if (v3 != 3)
      {
        v7 = *MEMORY[0x1E0C9D820];
        v4 = *(uint64_t *)(MEMORY[0x1E0C9D820] + 8);
        goto LABEL_9;
      }
      *(double *)&v4 = 77.0;
    }
    v7 = *(double *)&v4;
  }
LABEL_9:
  v9 = v7;
  v10 = *(double *)&v4;
  result.height = v10;
  result.width = v9;
  return result;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setPulsing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (-[CAMFocusIndicatorRectView isPulsing](self, "isPulsing") != a3)
  {
    -[CAMFocusIndicatorRectView _imageView](self, "_imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v5, "setAlpha:", 1.0);
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __40__CAMFocusIndicatorRectView_setPulsing___block_invoke;
      v9[3] = &unk_1EA328868;
      v10 = v5;
      objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 30, v9, 0, 0.18, 0.0);

    }
    else
    {
      objc_msgSend(v6, "removeAnimationForKey:", CFSTR("opacity"));
      objc_msgSend(v5, "setAlpha:", 1.0);
    }

  }
}

- (BOOL)isPulsing
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[CAMFocusIndicatorRectView _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationForKey:", CFSTR("opacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

uint64_t __40__CAMFocusIndicatorRectView_setPulsing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.65);
}

- (void)layoutSubviews
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  void *v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = self;
  v12.super_class = (Class)CAMFocusIndicatorRectView;
  -[CAMFocusIndicatorRectView layoutSubviews](&v12, sel_layoutSubviews);
  -[CAMFocusIndicatorRectView bounds](self, "bounds");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if ((-[CAMFocusIndicatorRectView style](self, "style") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    v14 = CGRectInset(v13, -3.0, -3.0);
    x = v14.origin.x;
    y = v14.origin.y;
    width = v14.size.width;
    height = v14.size.height;
  }
  -[CAMFocusIndicatorRectView _imageView](self, "_imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", x, y, width, height);

}

- (BOOL)isInactive
{
  void *v2;
  char v3;

  -[CAMFocusIndicatorRectView _imageView](self, "_imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageView, 0);
}

@end
