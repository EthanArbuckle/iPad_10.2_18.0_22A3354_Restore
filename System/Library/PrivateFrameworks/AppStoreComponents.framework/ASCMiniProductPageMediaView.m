@implementation ASCMiniProductPageMediaView

- (ASCMiniProductPageMediaView)initWithFrame:(CGRect)a3
{
  ASCMiniProductPageMediaView *v3;
  uint64_t v4;
  NSMutableArray *imageViews;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCMiniProductPageMediaView;
  v3 = -[ASCMiniProductPageMediaView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v4 = objc_claimAutoreleasedReturnValue();
    imageViews = v3->_imageViews;
    v3->_imageViews = (NSMutableArray *)v4;

    -[ASCMiniProductPageMediaView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  }
  return v3;
}

- (ASCMiniProductPageMediaView)initWithCoder:(id)a3
{
  -[ASCMiniProductPageMediaView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCMiniProductPageMediaView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setImage:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > a4)
  {
    -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v10);

  }
}

- (void)setScreenshots:(id)a3 andTrailers:(id)a4
{
  id v6;
  ASCScreenshots *screenshots;
  ASCScreenshots *v8;

  v8 = (ASCScreenshots *)a3;
  v6 = a4;
  screenshots = self->_screenshots;
  if (v8 && screenshots)
  {
    if (-[ASCScreenshots isEqual:](screenshots, "isEqual:", v8))
      goto LABEL_7;
    goto LABEL_6;
  }
  if (screenshots != v8)
  {
LABEL_6:
    -[ASCMiniProductPageMediaView setScreenshots:](self, "setScreenshots:", v8);
    -[ASCMiniProductPageMediaView updateImageViews](self, "updateImageViews");
    -[ASCMiniProductPageMediaView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCMiniProductPageMediaView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_7:

}

- (void)setShowsPlaceholderContent:(BOOL)a3
{
  if (((!self->_showsPlaceholderContent ^ a3) & 1) == 0)
  {
    self->_showsPlaceholderContent = a3;
    -[ASCMiniProductPageMediaView updateImageViews](self, "updateImageViews");
    -[ASCMiniProductPageMediaView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCMiniProductPageMediaView setNeedsLayout](self, "setNeedsLayout");
  }
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
    -[ASCMiniProductPageMediaView updateImageViews](self, "updateImageViews");
    -[ASCMiniProductPageMediaView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCMiniProductPageMediaView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_7:

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[ASCMiniProductPageMediaView screenshotSizeForBoundingSize:](self, "screenshotSizeForBoundingSize:", a3.width, a3.height);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[ASCMiniProductPageMediaView bounds](self, "bounds");
  -[ASCMiniProductPageMediaView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
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
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)ASCMiniProductPageMediaView;
  -[ASCMiniProductPageMediaView layoutSubviews](&v31, sel_layoutSubviews);
  -[ASCMiniProductPageMediaView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ASCMiniProductPageMediaView preferredScreenshotSize](self, "preferredScreenshotSize");
  v12 = v11;
  v14 = v13;
  v15 = -[ASCMiniProductPageMediaView actualScreenshotCount](self, "actualScreenshotCount");
  v16 = v4;
  if (v15 < -[ASCMiniProductPageMediaView preferredScreenshotCount](self, "preferredScreenshotCount"))
  {
    -[ASCMiniProductPageMediaView widthOfScreenshotCount:](self, "widthOfScreenshotCount:", -[ASCMiniProductPageMediaView actualScreenshotCount](self, "actualScreenshotCount"));
    v18 = v17;
    -[ASCMiniProductPageMediaView bounds](self, "bounds");
    v16 = (v19 - v18) * 0.5;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ASCMiniProductPageMediaView imageViews](self, "imageViews", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v24);
        +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", self, v16, v6, v12, v14, v4, v6, v8, v10);
        objc_msgSend(v25, "setFrame:");
        -[ASCMiniProductPageMediaView screenshotSpacing](self, "screenshotSpacing");
        v16 = v12 + v16 + v26;
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }

}

- (unint64_t)preferredScreenshotCount
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;

  -[ASCMiniProductPageMediaView screenshots](self, "screenshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "isPortrait"))
      v6 = 3;
    else
      v6 = 1;
  }
  else if (-[ASCMiniProductPageMediaView showsPlaceholderContent](self, "showsPlaceholderContent"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceIdiom") == 1)
      v6 = 1;
    else
      v6 = 3;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)actualScreenshotCount
{
  void *v3;
  unint64_t result;
  void *v5;
  void *v6;
  unint64_t v7;

  -[ASCMiniProductPageMediaView screenshots](self, "screenshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[ASCMiniProductPageMediaView showsPlaceholderContent](self, "showsPlaceholderContent"))
  {
    return -[ASCMiniProductPageMediaView preferredScreenshotCount](self, "preferredScreenshotCount");
  }
  -[ASCMiniProductPageMediaView screenshots](self, "screenshots");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  result = -[ASCMiniProductPageMediaView preferredScreenshotCount](self, "preferredScreenshotCount");
  if (v7 < result)
    return v7;
  return result;
}

- (BOOL)shouldPeekNextScreenshot
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  ASCMiniProductPageMediaView *v9;

  v9 = self;
  -[ASCMiniProductPageMediaView screenshots](self, "screenshots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASCMiniProductPageMediaView screenshots](v9, "screenshots");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = -[ASCMiniProductPageMediaView actualScreenshotCount](v9, "actualScreenshotCount");

  LOBYTE(v9) = 0;
  if (v7 > v8 && v4)
    LODWORD(v9) = objc_msgSend(v4, "isPortrait") ^ 1;

  return (char)v9;
}

- (CGSize)preferredScreenshotSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[ASCMiniProductPageMediaView bounds](self, "bounds");
  -[ASCMiniProductPageMediaView screenshotSizeForBoundingSize:](self, "screenshotSizeForBoundingSize:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)screenshotSizeForBoundingSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  double v10;
  unint64_t v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCMiniProductPageMediaView firstScreenshotVerticalFraction](self, "firstScreenshotVerticalFraction");
  v7 = v6;
  v8 = -[ASCMiniProductPageMediaView preferredScreenshotCount](self, "preferredScreenshotCount");
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if ((height != v10 || width != v9) && v8 != 0)
  {
    v13 = v8;
    -[ASCMiniProductPageMediaView screenshotSpacing](self, "screenshotSpacing");
    v15 = (width - v14 * (double)(v13 - 1)) / (double)v13;
    v16 = v7 * v15;
    v9 = ceil(v15);
    v10 = ceil(v16);
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)firstScreenshotVerticalFraction
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;

  -[ASCMiniProductPageMediaView screenshots](self, "screenshots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artwork");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "height");
    v6 = v5;
    objc_msgSend(v4, "width");
    v8 = v6 / v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userInterfaceIdiom");

    if (v15)
    {
      if (v11 >= v13)
        v16 = v13;
      else
        v16 = v11;
      if (v11 >= v13)
        v17 = v11;
      else
        v17 = v13;
    }
    else
    {
      if (v11 >= v13)
        v16 = v11;
      else
        v16 = v13;
      if (v11 >= v13)
        v17 = v13;
      else
        v17 = v11;
    }
    v8 = v16 / v17;
  }

  return v8;
}

- (id)preferredScreenshotDisplayConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ASCScreenshotDisplayConfiguration *v7;

  -[ASCMiniProductPageMediaView screenshots](self, "screenshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASCMiniProductPageMediaView screenshots](self, "screenshots");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaPlatform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceCornerRadiusFactor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[ASCScreenshotDisplayConfiguration initWithDeviceCornerRadiusFactor:]([ASCScreenshotDisplayConfiguration alloc], "initWithDeviceCornerRadiusFactor:", v6);
  }
  else
  {
    +[ASCScreenshotDisplayConfiguration defaultConfiguration](ASCScreenshotDisplayConfiguration, "defaultConfiguration");
    v7 = (ASCScreenshotDisplayConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (double)widthOfScreenshotCount:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;

  if (!a3)
    return 0.0;
  -[ASCMiniProductPageMediaView preferredScreenshotSize](self, "preferredScreenshotSize");
  v6 = v5 * (double)a3;
  -[ASCMiniProductPageMediaView screenshotSpacing](self, "screenshotSpacing");
  return v6 + v7 * (double)(a3 - 1);
}

- (void)updateImageViews
{
  _BOOL4 v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  ASCArtworkView *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;

  v3 = -[ASCMiniProductPageMediaView shouldPeekNextScreenshot](self, "shouldPeekNextScreenshot");
  v4 = -[ASCMiniProductPageMediaView actualScreenshotCount](self, "actualScreenshotCount") + v3;
  -[ASCMiniProductPageMediaView preferredScreenshotDisplayConfiguration](self, "preferredScreenshotDisplayConfiguration");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= v4)
    v7 = v4;
  else
    v7 = v6;
  if (v7)
  {
    v8 = 0;
    do
    {
      -[ASCMiniProductPageMediaView screenshots](self, "screenshots");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setImage:", 0);

      }
      -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setScreenshotDisplayConfiguration:", v38);

      -[ASCMiniProductPageMediaView placeholderColor](self, "placeholderColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPlaceholderColor:", v14);

      ++v8;
      -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 >= v4)
        v19 = v4;
      else
        v19 = v18;
    }
    while (v19 > v8);
  }
  -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 != v4)
  {
    v22 = *MEMORY[0x1E0C9D648];
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v26 = *MEMORY[0x1E0DC4678];
    do
    {
      -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count");

      if (v28 >= v4)
      {
        -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastObject");
        v29 = (ASCArtworkView *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "removeLastObject");

          -[ASCArtworkView removeFromSuperview](v29, "removeFromSuperview");
        }
      }
      else
      {
        v29 = -[ASCArtworkView initWithFrame:]([ASCArtworkView alloc], "initWithFrame:", v22, v23, v24, v25);
        -[ASCArtworkView setScreenshotDisplayConfiguration:](v29, "setScreenshotDisplayConfiguration:", v38);
        -[ASCArtworkView setDecoration:](v29, "setDecoration:", CFSTR("screenshot"));
        -[ASCMiniProductPageMediaView placeholderColor](self, "placeholderColor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCArtworkView setPlaceholderColor:](v29, "setPlaceholderColor:", v30);

        -[ASCArtworkView setUserInteractionEnabled:](v29, "setUserInteractionEnabled:", 0);
        -[ASCArtworkView setIsAccessibilityElement:](v29, "setIsAccessibilityElement:", 1);
        -[ASCArtworkView setAccessibilityTraits:](v29, "setAccessibilityTraits:", v26);
        ASCLocalizedString(CFSTR("AX_ARTWORK"), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCArtworkView setAccessibilityLabel:](v29, "setAccessibilityLabel:", v32);

        -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v29);

        -[ASCMiniProductPageMediaView addSubview:](self, "addSubview:", v29);
      }

      -[ASCMiniProductPageMediaView imageViews](self, "imageViews");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");

    }
    while (v37 != v4);
  }

}

- (unint64_t)maxScreenshotsCount
{
  return self->_maxScreenshotsCount;
}

- (void)setMaxScreenshotsCount:(unint64_t)a3
{
  self->_maxScreenshotsCount = a3;
}

- (double)screenshotSpacing
{
  return self->_screenshotSpacing;
}

- (void)setScreenshotSpacing:(double)a3
{
  self->_screenshotSpacing = a3;
}

- (ASCScreenshots)screenshots
{
  return self->_screenshots;
}

- (void)setScreenshots:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (BOOL)showsPlaceholderContent
{
  return self->_showsPlaceholderContent;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
}

@end
