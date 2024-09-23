@implementation ContinuousReadingBannerView

- (ContinuousReadingBannerView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (ContinuousReadingBannerView)initWithContinuousReadingItem:(id)a3
{
  id v5;
  ContinuousReadingBannerView *v6;
  ContinuousReadingBannerView *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  ContinuousReadingBannerView *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ContinuousReadingBannerView;
  v6 = -[ContinuousReadingBannerView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_continuousReadingItem, a3);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("subtitle"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v7, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12++), 0, kContinuousReadingItemObserverContext);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    -[ContinuousReadingBannerView _updateLabels](v7, "_updateLabels");
    -[ContinuousReadingBannerView setOpaque:](v7, "setOpaque:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContinuousReadingBannerView setBackgroundColor:](v7, "setBackgroundColor:", v13);

    -[ContinuousReadingBannerView _updateImage](v7, "_updateImage");
    -[ContinuousReadingBannerView setAutoresizingMask:](v7, "setAutoresizingMask:", 34);
    v14 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("title"), CFSTR("subtitle"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[ContinuousReadingItem removeObserver:forKeyPath:context:](self->_continuousReadingItem, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), kContinuousReadingItemObserverContext);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ContinuousReadingBannerView;
  -[ContinuousReadingBannerView dealloc](&v8, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)kContinuousReadingItemObserverContext == a6)
  {
    -[ContinuousReadingBannerView _updateLabels](self, "_updateLabels", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ContinuousReadingBannerView;
    -[ContinuousReadingBannerView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
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
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double width;
  double height;
  double v20;
  void *v21;
  void *v22;
  id v23;
  CGRect v24;

  -[ContinuousReadingBannerView bounds](self, "bounds");
  v4 = v3;
  -[ContinuousReadingBannerView _textBaseline](self, "_textBaseline");
  v6 = v5;
  -[ContinuousReadingBannerView safeAreaInsets](self, "safeAreaInsets");
  v8 = fmax(v7, 15.0);
  v10 = fmax(v9, 15.0);
  -[ContinuousReadingBannerView image](self, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v8 + 50.0;
  else
    v12 = v8;
  -[ContinuousReadingBannerView titleLabel](self, "titleLabel");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v4 - v12 - v10;
  objc_msgSend(v23, "sizeThatFits:", v13, 1.79769313e308);
  _SFRoundRectToPixels();
  objc_msgSend(v23, "setFrame:");
  _SFRoundFloatToPixels();
  objc_msgSend(v23, "_setFirstLineBaselineFrameOriginY:", v6 - v14);
  -[ContinuousReadingBannerView subtitleLabel](self, "subtitleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeThatFits:", v13, 1.79769313e308);
  _SFRoundRectToPixels();
  objc_msgSend(v15, "setFrame:");
  _SFRoundFloatToPixels();
  objc_msgSend(v15, "_setFirstLineBaselineFrameOriginY:", v6 - v16);
  -[ContinuousReadingBannerView imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  width = v24.size.width;
  height = v24.size.height;
  v24.origin.x = v8;
  CGRectGetHeight(v24);
  _SFRoundFloatToPixels();
  objc_msgSend(v17, "setFrame:", v8, v20, width, height);
  -[ContinuousReadingBannerView _topHairline](self, "_topHairline");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  _SFRoundRectToPixels();
  objc_msgSend(v21, "setFrame:");
  -[ContinuousReadingBannerView _bottomHairline](self, "_bottomHairline");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  _SFOnePixel();
  _SFRoundRectToPixels();
  objc_msgSend(v22, "setFrame:");

}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ContinuousReadingBannerView;
  -[ContinuousReadingBannerView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, 60.0);
}

+ (id)makeHairlineSeparator
{
  id v2;
  double v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  _SFOnePixel();
  v4 = (void *)objc_msgSend(v2, "initWithFrame:", 0.0, 0.0, 0.0, v3);
  objc_msgSend(v4, "setAutoresizingMask:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  return v4;
}

+ (UIColor)hairlineColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
}

- (void)setTitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ContinuousReadingBannerView title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[ContinuousReadingBannerView titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

    -[ContinuousReadingBannerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)title
{
  void *v2;
  void *v3;

  -[ContinuousReadingBannerView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[ContinuousReadingBannerView subtitle](self, "subtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if ((v5 & 1) == 0)
  {
    -[ContinuousReadingBannerView subtitleLabel](self, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      v7 = v8;
    else
      v7 = 0;
    objc_msgSend(v6, "setText:", v7);

    -[ContinuousReadingBannerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  -[ContinuousReadingBannerView subtitleLabel](self, "subtitleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setImage:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  CGContext *CurrentContext;
  const CGPath *v9;
  void *v10;
  id v11;
  CGSize v12;
  CGRect v13;

  v11 = a3;
  -[ContinuousReadingBannerView image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v4) & 1) == 0)
  {
    if ((v11 == 0) == (v4 != 0))
      -[ContinuousReadingBannerView setNeedsLayout](self, "setNeedsLayout");
    -[ContinuousReadingBannerView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12.width = 40.0;
      v12.height = 40.0;
      UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
      v6 = *MEMORY[0x1E0C9D538];
      v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      CurrentContext = UIGraphicsGetCurrentContext();
      v13.origin.x = v6;
      v13.origin.y = v7;
      v13.size.width = 40.0;
      v13.size.height = 40.0;
      v9 = CGPathCreateWithEllipseInRect(v13, 0);
      CGContextAddPath(CurrentContext, v9);
      CGContextClip(CurrentContext);
      objc_msgSend(v11, "drawInRect:", v6, v7, 40.0, 40.0);
      CGPathRelease(v9);
      UIGraphicsGetImageFromCurrentImageContext();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setImage:", v10);

      UIGraphicsEndImageContext();
    }
    else
    {
      objc_msgSend(v5, "setImage:", 0);
    }

  }
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[ContinuousReadingBannerView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    v6 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4A90]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = self->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 1);
    -[ContinuousReadingBannerView addSubview:](self, "addSubview:", self->_titleLabel);
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UILabel)subtitleLabel
{
  UILabel *subtitleLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;

  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_subtitleLabel;
    self->_subtitleLabel = v4;

    v6 = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = self->_subtitleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 1);
    -[ContinuousReadingBannerView addSubview:](self, "addSubview:", self->_subtitleLabel);
    subtitleLabel = self->_subtitleLabel;
  }
  return subtitleLabel;
}

- (UIImageView)imageView
{
  UIImageView *imageView;
  UIImageView *v4;
  UIImageView *v5;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 15.0, 0.0, 40.0, 40.0);
    v5 = self->_imageView;
    self->_imageView = v4;

    imageView = self->_imageView;
  }
  -[ContinuousReadingBannerView addSubview:](self, "addSubview:", imageView);
  return self->_imageView;
}

- (void)setTopHairlineInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_topHairlineInsets.left
    || a3.top != self->_topHairlineInsets.top
    || a3.right != self->_topHairlineInsets.right
    || a3.bottom != self->_topHairlineInsets.bottom)
  {
    self->_topHairlineInsets = a3;
    -[ContinuousReadingBannerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)titleRect
{
  void *v2;
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
  double v13;
  double v14;
  CGRect result;

  -[ContinuousReadingBannerView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setTheme:(id)a3
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = WBSIsEqual();
  v5 = v15;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v15, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContinuousReadingBannerView _setLocalOverrideTraitCollection:](self, "_setLocalOverrideTraitCollection:", v6);

    objc_msgSend(v15, "themeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[ContinuousReadingBannerView setBackgroundColor:](self, "setBackgroundColor:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ContinuousReadingBannerView setBackgroundColor:](self, "setBackgroundColor:", v8);

    }
    objc_msgSend(v15, "separatorColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    -[ContinuousReadingBannerView _topHairline](self, "_topHairline");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    -[ContinuousReadingBannerView _bottomHairline](self, "_bottomHairline");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v12);

    v5 = v15;
  }

}

- (id)_topHairline
{
  UIView *topHairline;
  UIView *v4;
  UIView *v5;

  topHairline = self->_topHairline;
  if (!topHairline)
  {
    objc_msgSend((id)objc_opt_class(), "makeHairlineSeparator");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_topHairline;
    self->_topHairline = v4;

    -[ContinuousReadingBannerView addSubview:](self, "addSubview:", self->_topHairline);
    topHairline = self->_topHairline;
  }
  return topHairline;
}

- (id)_bottomHairline
{
  UIView *bottomHairline;
  UIView *v4;
  UIView *v5;

  bottomHairline = self->_bottomHairline;
  if (!bottomHairline)
  {
    objc_msgSend((id)objc_opt_class(), "makeHairlineSeparator");
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_bottomHairline;
    self->_bottomHairline = v4;

    -[ContinuousReadingBannerView addSubview:](self, "addSubview:", self->_bottomHairline);
    bottomHairline = self->_bottomHairline;
  }
  return bottomHairline;
}

- (void)_updateLabels
{
  void *v3;
  id v4;

  -[ContinuousReadingItem title](self->_continuousReadingItem, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ContinuousReadingBannerView setTitle:](self, "setTitle:", v3);

  -[ContinuousReadingItem subtitle](self->_continuousReadingItem, "subtitle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ContinuousReadingBannerView setSubtitle:](self, "setSubtitle:", v4);

}

- (CGSize)_scaledImageSize
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  CGSize result;

  if (_scaledImageSize_hasComputedSize == 1)
  {
    v2 = *(double *)&_scaledImageSize_imageSize_0;
    v3 = *(double *)&_scaledImageSize_imageSize_1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    v3 = v6 * 40.0;
    *(double *)&_scaledImageSize_imageSize_0 = v6 * 40.0;
    *(double *)&_scaledImageSize_imageSize_1 = v6 * 40.0;
    _scaledImageSize_hasComputedSize = 1;
    v2 = v6 * 40.0;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)_textBaseline
{
  double v2;

  -[ContinuousReadingBannerView bounds](self, "bounds");
  return v2;
}

- (ContinuousReadingItem)continuousReadingItem
{
  return self->_continuousReadingItem;
}

- (UIEdgeInsets)topHairlineInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_topHairlineInsets.top;
  left = self->_topHairlineInsets.left;
  bottom = self->_topHairlineInsets.bottom;
  right = self->_topHairlineInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (SFBannerTheme)theme
{
  return self->_theme;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_continuousReadingItem, 0);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
}

@end
