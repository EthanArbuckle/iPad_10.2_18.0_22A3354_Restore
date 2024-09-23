@implementation ASCArtworkView

- (ASCArtworkView)initWithFrame:(CGRect)a3
{
  ASCArtworkView *v3;
  uint64_t v4;
  ASCScreenshotDisplayConfiguration *screenshotDisplayConfiguration;
  uint64_t v6;
  UIColor *placeholderColor;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIImageView *imageView;
  ASCBorderView *v15;
  ASCBorderView *borderView;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ASCArtworkView;
  v3 = -[ASCArtworkView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_opt_self();
    v3->_preferredSize = (CGSize)*MEMORY[0x1E0C9D820];
    objc_storeStrong((id *)&v3->_decoration, CFSTR("none"));
    +[ASCScreenshotDisplayConfiguration defaultConfiguration](ASCScreenshotDisplayConfiguration, "defaultConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
    screenshotDisplayConfiguration = v3->_screenshotDisplayConfiguration;
    v3->_screenshotDisplayConfiguration = (ASCScreenshotDisplayConfiguration *)v4;

    +[ASCSemanticColor artworkPlaceholder]();
    v6 = objc_claimAutoreleasedReturnValue();
    placeholderColor = v3->_placeholderColor;
    v3->_placeholderColor = (UIColor *)v6;

    v8 = objc_alloc(MEMORY[0x1E0DC3890]);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v13;

    v15 = -[ASCBorderView initWithFrame:]([ASCBorderView alloc], "initWithFrame:", v9, v10, v11, v12);
    borderView = v3->_borderView;
    v3->_borderView = v15;

    -[ASCArtworkView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[ASCArtworkView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[ASCArtworkView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[ASCArtworkView setAccessibilityIgnoresInvertColors:](v3, "setAccessibilityIgnoresInvertColors:", 1);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    +[ASCSemanticColor artworkSymbolTint]();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_imageView, "setTintColor:", v17);

    -[ASCArtworkView addSubview:](v3, "addSubview:", v3->_imageView);
    -[ASCBorderView setWidth:](v3->_borderView, "setWidth:", 1.0);
    +[ASCSemanticColor artworkBorder]();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCBorderView setColor:](v3->_borderView, "setColor:", v18);

    -[ASCArtworkView addSubview:](v3, "addSubview:", v3->_borderView);
    -[ASCArtworkView setDataChanged](v3, "setDataChanged");
  }
  return v3;
}

- (ASCArtworkView)initWithCoder:(id)a3
{
  -[ASCArtworkView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCArtworkView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setPreferredSize:(CGSize)a3
{
  void *v5;
  void *v6;

  if (self->_preferredSize.width != a3.width || self->_preferredSize.height != a3.height)
  {
    self->_preferredSize = a3;
    if (a3.width >= a3.height)
      a3.width = a3.height;
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, -1, ceil(a3.width * 0.5));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCArtworkView imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredSymbolConfiguration:", v5);

    -[ASCArtworkView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCArtworkView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDecoration:(id)a3
{
  NSString *v4;
  NSString *decoration;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_decoration, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    decoration = self->_decoration;
    self->_decoration = v4;

    -[ASCArtworkView setDataChanged](self, "setDataChanged");
  }

}

- (void)setScreenshotDisplayConfiguration:(id)a3
{
  ASCScreenshotDisplayConfiguration *v4;
  ASCScreenshotDisplayConfiguration *screenshotDisplayConfiguration;
  BOOL v6;
  ASCScreenshotDisplayConfiguration *v7;
  ASCScreenshotDisplayConfiguration *v8;
  ASCScreenshotDisplayConfiguration *v9;

  v4 = (ASCScreenshotDisplayConfiguration *)a3;
  screenshotDisplayConfiguration = self->_screenshotDisplayConfiguration;
  v9 = v4;
  if (v4 && screenshotDisplayConfiguration)
  {
    v6 = -[ASCScreenshotDisplayConfiguration isEqual:](screenshotDisplayConfiguration, "isEqual:", v4);
    v4 = v9;
    if (v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (screenshotDisplayConfiguration != v4)
  {
LABEL_6:
    v7 = (ASCScreenshotDisplayConfiguration *)-[ASCScreenshotDisplayConfiguration copy](v4, "copy");
    v8 = self->_screenshotDisplayConfiguration;
    self->_screenshotDisplayConfiguration = v7;

    -[ASCArtworkView setDataChanged](self, "setDataChanged");
    v4 = v9;
  }
LABEL_7:

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[ASCArtworkView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "_isSymbolImage"))
    v5 = 4;
  else
    v5 = 1;
  -[ASCArtworkView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentMode:", v5);

  -[ASCArtworkView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v4);

  -[ASCArtworkView setDataChanged](self, "setDataChanged");
}

- (void)setPlaceholderColor:(id)a3
{
  UIColor *v5;
  char v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  v5 = self->_placeholderColor;
  if (v7 && v5)
  {
    v6 = -[UIColor isEqual:](v5, "isEqual:", v7);

    if ((v6 & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }

  if (v5 != v7)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    -[ASCArtworkView setDataChanged](self, "setDataChanged");
  }
LABEL_7:

}

- (BOOL)isHighlighted
{
  void *v2;
  char v3;

  -[ASCArtworkView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCArtworkView imageView](self, "imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", v3);

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCArtworkView;
  -[ASCArtworkView setSemanticContentAttribute:](&v7, sel_setSemanticContentAttribute_);
  -[ASCArtworkView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", a3);

  -[ASCArtworkView borderView](self, "borderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSemanticContentAttribute:", a3);

}

- (void)setDataChanged
{
  int HasBorder;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;

  HasBorder = ASCArtworkDecorationHasBorder(self->_decoration);
  -[ASCArtworkView image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ASCArtworkView image](self, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isSymbolImage") | HasBorder ^ 1;

  }
  else
  {
    v6 = 1;
  }

  -[ASCArtworkView borderView](self, "borderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  -[ASCArtworkView placeholderColor](self, "placeholderColor");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_11;
  v9 = (void *)v8;
  -[ASCArtworkView image](self, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[ASCArtworkView image](self, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_isSymbolImage");

    v13 = v12 ^ 1;
  }
  else
  {
    v13 = 0;
  }

  if (HasBorder && (v13 & 1) == 0)
  {
    -[ASCArtworkView placeholderColor](self, "placeholderColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCArtworkView imageView](self, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v14);

  }
  else
  {
LABEL_11:
    -[ASCArtworkView imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", 0);
  }

  -[ASCArtworkView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[ASCArtworkView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCArtworkView;
  -[ASCArtworkView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  if (-[ASCArtworkView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[ASCArtworkView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateIntrinsicContentSize");

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v13;
  void *v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCArtworkView image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_3;
  }
  -[ASCArtworkView decoration](self, "decoration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("none")))
  {

LABEL_20:
    width = *MEMORY[0x1E0C9D820];
    height = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_21;
  }
  -[ASCArtworkView placeholderColor](self, "placeholderColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_20;
LABEL_3:
  -[ASCArtworkView preferredSize](self, "preferredSize");
  v9 = v7;
  v10 = v8;
  if (width == *MEMORY[0x1E0DC4FF8] && height == *(double *)(MEMORY[0x1E0DC4FF8] + 8))
  {
    width = v7;
    height = v8;
  }
  else
  {
    objc_opt_self();
    if (v9 != *MEMORY[0x1E0C9D820] || v10 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      if (width >= v9)
        width = v9;
      if (height >= v10)
        height = v10;
    }
  }
LABEL_21:
  v15 = width;
  v16 = height;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double MidX;
  CGFloat v28;
  double MidY;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat rect;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ASCArtworkView layoutMargins](self, "layoutMargins");
  v9 = x + v8;
  v11 = y + v10;
  v13 = width - (v8 + v12);
  v15 = height - (v10 + v14);
  v35.origin.x = v9;
  v35.origin.y = v11;
  v35.size.width = v13;
  v35.size.height = v15;
  if (!CGRectIsEmpty(v35))
  {
    -[ASCArtworkView image](self, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[ASCArtworkView image](self, "image");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "size");
      v19 = v18;
      v21 = v20;

      if (v19 >= 2.22044605e-16 && v21 >= 2.22044605e-16)
      {
        v36.origin.x = v9;
        v36.origin.y = v11;
        v36.size.width = v13;
        v36.size.height = v15;
        v22 = CGRectGetWidth(v36) / v19;
        v37.origin.x = v9;
        v37.origin.y = v11;
        v37.size.width = v13;
        v37.size.height = v15;
        v23 = CGRectGetHeight(v37) / v21;
        v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        rect = *MEMORY[0x1E0C9D648];
        if (v22 >= v23)
        {
          v25 = floor(v19 * v23);
          v39.origin.x = v9;
          v39.origin.y = v11;
          v39.size.width = v13;
          v39.size.height = v15;
          v26 = CGRectGetHeight(v39);
        }
        else
        {
          v38.origin.x = v9;
          v38.origin.y = v11;
          v38.size.width = v13;
          v38.size.height = v15;
          v25 = CGRectGetWidth(v38);
          v26 = floor(v21 * v22);
        }
        v40.origin.x = v9;
        v40.origin.y = v11;
        v40.size.width = v13;
        v40.size.height = v15;
        MidX = CGRectGetMidX(v40);
        v41.origin.x = rect;
        v41.origin.y = v24;
        v41.size.width = v25;
        v41.size.height = v26;
        v28 = floor(MidX - CGRectGetWidth(v41) * 0.5);
        v42.origin.x = v9;
        v42.origin.y = v11;
        v42.size.width = v13;
        v42.size.height = v15;
        MidY = CGRectGetMidY(v42);
        v43.origin.x = v28;
        v43.origin.y = v24;
        v43.size.width = v25;
        v43.size.height = v26;
        v11 = floor(MidY - CGRectGetHeight(v43) * 0.5);
        v15 = v26;
        v13 = v25;
        v9 = v28;
      }
    }
  }
  v30 = v9;
  v31 = v11;
  v32 = v13;
  v33 = v15;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (double)cornerRadiusForContentRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  void *v8;
  char v9;
  double v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[ASCArtworkView decoration](self, "decoration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("none"));

  v10 = 0.0;
  if ((v9 & 1) != 0)
    return v10;
  -[ASCArtworkView decoration](self, "decoration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("maskToCircle"));

  if (v12)
  {
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v13 = CGRectGetWidth(v38);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v14 = CGRectGetHeight(v39);
    if (v13 < v14)
      v14 = v13;
    return v14 * 0.5;
  }
  -[ASCArtworkView decoration](self, "decoration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", CFSTR("roundedRect")))
  {

LABEL_9:
    objc_msgSend(MEMORY[0x1E0D3A830], "imageDescriptorNamed:", *MEMORY[0x1E0D3A870]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "continuousCornerRadius");
    v20 = v19;
    objc_msgSend(v18, "size");
    v22 = v21;
    v24 = v23;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v25 = CGRectGetWidth(v40);
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    if (v25 <= CGRectGetWidth(v41))
    {
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      v26 = CGRectGetHeight(v43) / v24;
    }
    else
    {
      v42.origin.x = x;
      v42.origin.y = y;
      v42.size.width = width;
      v42.size.height = height;
      v26 = CGRectGetWidth(v42) / v22;
    }
    v10 = v20 * v26;

    return v10;
  }
  -[ASCArtworkView decoration](self, "decoration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("iap"));

  if (v17)
    goto LABEL_9;
  -[ASCArtworkView decoration](self, "decoration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("pill"));

  if (v29)
  {
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v14 = CGRectGetHeight(v44);
    return v14 * 0.5;
  }
  -[ASCArtworkView decoration](self, "decoration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("tvRect"));

  if (v31)
  {
    v14 = floor(width * 0.095 + width * 0.095);
    return v14 * 0.5;
  }
  -[ASCArtworkView decoration](self, "decoration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("screenshot"));

  if (!v33)
  {
    -[ASCArtworkView decoration](self, "decoration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    ASCUnknownEnumCase(CFSTR("ASCArtworkDecoration"), v37);
  }
  -[ASCArtworkView screenshotDisplayConfiguration](self, "screenshotDisplayConfiguration");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "cornerRadiusForSize:", width, height);
  v36 = v35;

  return v36;
}

- (id)cornerCurveForContentRect:(CGRect)a3
{
  void *v4;
  int v5;
  id *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  -[ASCArtworkView decoration](self, "decoration", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("maskToCircle"));

  if (v5)
  {
    v6 = (id *)MEMORY[0x1E0CD2A60];
LABEL_6:
    v10 = *v6;
    return v10;
  }
  -[ASCArtworkView decoration](self, "decoration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("screenshot"));

  if (!v8)
  {
    v6 = (id *)MEMORY[0x1E0CD2A68];
    goto LABEL_6;
  }
  -[ASCArtworkView screenshotDisplayConfiguration](self, "screenshotDisplayConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cornerCurve");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)cornerMaskForContentRect:(CGRect)a3
{
  void *v4;
  char v5;
  void *v7;
  int v8;
  void *v9;
  unint64_t v10;

  -[ASCArtworkView decoration](self, "decoration", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("iap"));

  if ((v5 & 1) != 0)
    return 2;
  -[ASCArtworkView decoration](self, "decoration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("screenshot"));

  if (!v8)
    return 15;
  -[ASCArtworkView screenshotDisplayConfiguration](self, "screenshotDisplayConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "maskedCorners");

  return v10;
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
  double v11;
  double v12;
  void *v13;
  unint64_t v14;
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
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)ASCArtworkView;
  -[ASCArtworkView layoutSubviews](&v26, sel_layoutSubviews);
  -[ASCArtworkView bounds](self, "bounds");
  -[ASCArtworkView contentRectForBounds:](self, "contentRectForBounds:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ASCArtworkView cornerRadiusForContentRect:](self, "cornerRadiusForContentRect:");
  v12 = v11;
  -[ASCArtworkView cornerCurveForContentRect:](self, "cornerCurveForContentRect:", v4, v6, v8, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ASCArtworkView cornerMaskForContentRect:](self, "cornerMaskForContentRect:", v4, v6, v8, v10);
  -[ASCArtworkView imageView](self, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

  -[ASCArtworkView imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCornerRadius:", v12);

  -[ASCArtworkView imageView](self, "imageView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerCurve:", v13);

  -[ASCArtworkView imageView](self, "imageView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMaskedCorners:", v14);

  -[ASCArtworkView borderView](self, "borderView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v4, v6, v8, v10);

  -[ASCArtworkView borderView](self, "borderView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCornerRadius:", v12);

  -[ASCArtworkView borderView](self, "borderView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerCurve:", v13);

  -[ASCArtworkView borderView](self, "borderView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCornerMask:", v14);

}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ASCArtworkView preferredSize](self, "preferredSize");
  v6 = v5;
  -[ASCArtworkView preferredSize](self, "preferredSize");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("{%f, %f}"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("preferredSize"));

  -[ASCArtworkView decoration](self, "decoration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, CFSTR("decoration"));

  -[ASCArtworkView image](self, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, CFSTR("image"));

  -[ASCArtworkView placeholderColor](self, "placeholderColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("placeholderColor"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CGSize)preferredSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredSize.width;
  height = self->_preferredSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)decoration
{
  return self->_decoration;
}

- (ASCScreenshotDisplayConfiguration)screenshotDisplayConfiguration
{
  return self->_screenshotDisplayConfiguration;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (ASCBorderView)borderView
{
  return self->_borderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_screenshotDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_decoration, 0);
}

@end
