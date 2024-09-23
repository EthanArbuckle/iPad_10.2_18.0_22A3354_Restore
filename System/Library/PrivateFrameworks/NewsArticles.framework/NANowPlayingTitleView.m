@implementation NANowPlayingTitleView

- (NANowPlayingTitleView)initWithFrame:(CGRect)a3 layoutSpecProvider:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  NANowPlayingTitleView *v10;
  NANowPlayingTitleView *v11;
  uint64_t v12;
  NANowPlayingTitleView *v13;
  uint64_t v14;
  UIImageView *publisherImageView;
  NANowPlayingTitleView *v16;
  uint64_t v17;
  MPUMarqueeView *publisherMarqueeContainer;
  uint64_t v19;
  UILabel *titleLabel;
  NANowPlayingTitleView *v21;
  uint64_t v22;
  MPUMarqueeView *titleMarqueeContainer;
  id *v24;
  uint64_t v25;
  id v26;
  _QWORD v28[4];
  id *v29;
  _QWORD v30[4];
  NANowPlayingTitleView *v31;
  _QWORD v32[4];
  NANowPlayingTitleView *v33;
  _QWORD v34[4];
  NANowPlayingTitleView *v35;
  objc_super v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)NANowPlayingTitleView;
  v10 = -[NANowPlayingTitleView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    v12 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke;
    v34[3] = &unk_1E71948B8;
    v13 = v10;
    v35 = v13;
    __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke((uint64_t)v34);
    v14 = objc_claimAutoreleasedReturnValue();
    publisherImageView = v13->_publisherImageView;
    v13->_publisherImageView = (UIImageView *)v14;

    v32[0] = v12;
    v32[1] = 3221225472;
    v32[2] = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_2;
    v32[3] = &unk_1E71949A8;
    v16 = v13;
    v33 = v16;
    __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_2((uint64_t)v32);
    v17 = objc_claimAutoreleasedReturnValue();
    publisherMarqueeContainer = v16->_publisherMarqueeContainer;
    v16->_publisherMarqueeContainer = (MPUMarqueeView *)v17;

    __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_3();
    v19 = objc_claimAutoreleasedReturnValue();
    titleLabel = v16->_titleLabel;
    v16->_titleLabel = (UILabel *)v19;

    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_4;
    v30[3] = &unk_1E71949A8;
    v21 = v16;
    v31 = v21;
    __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_4((uint64_t)v30);
    v22 = objc_claimAutoreleasedReturnValue();
    titleMarqueeContainer = v21->_titleMarqueeContainer;
    v21->_titleMarqueeContainer = (MPUMarqueeView *)v22;

    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_5;
    v28[3] = &unk_1E7194930;
    v24 = v21;
    v29 = v24;
    __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_5((uint64_t)v28);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v24[56];
    v24[56] = (id)v25;

    objc_storeWeak(v24 + 58, v9);
  }

  return v11;
}

id __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;

  v2 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(*(id *)(a1 + 32), "layoutSpecProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "publisherLogoHeight");
  v5 = (void *)objc_msgSend(v2, "initWithFrame:", 0.0, 0.0, 0.0, v4);

  objc_msgSend(v5, "setContentMode:", 1);
  objc_msgSend(v5, "setAccessibilityIgnoresInvertColors:", 1);
  objc_msgSend(v5, "setAccessibilityTraits:", objc_msgSend(v5, "accessibilityTraits") & ~*MEMORY[0x1E0DC4678]);
  v6 = objc_msgSend(v5, "accessibilityTraits");
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x1E0DC46C0] | v6);
  return v5;
}

id __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0D46968]);
  objc_msgSend(v2, "setMarqueeEnabled:", 1);
  objc_msgSend(v2, "setFadeEdgeInsets:", 0.0, 0.0, 0.0, 36.0);
  objc_msgSend(v2, "setContentGap:", 32.0);
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "publisherImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v2);
  return v2;
}

id __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_3()
{
  id v0;
  void *v1;

  v0 = objc_alloc(MEMORY[0x1E0DC3990]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v1, "setAdjustsFontForContentSizeCategory:", 1);
  return v1;
}

id __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0D46968]);
  objc_msgSend(v2, "setMarqueeEnabled:", 1);
  objc_msgSend(v2, "setFadeEdgeInsets:", 0.0, 0.0, 0.0, 36.0);
  objc_msgSend(v2, "setContentGap:", 32.0);
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  objc_msgSend(*(id *)(a1 + 32), "publisherMarqueeContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCoordinatedMarqueeView:", v5);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setViewForContentSize:", v6);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v2);
  return v2;
}

id __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  +[NATouchInsetsButton buttonWithType:](NATouchInsetsButton, "buttonWithType:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 20.0, *MEMORY[0x1E0DC1448]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4B60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scaledFontForFont:maximumPointSize:", v3, 26.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationWithPaletteColors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationByApplyingConfiguration:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "setImage:forState:", v2, 0);
  objc_msgSend(v1, "setPreferredSymbolConfiguration:forImageInState:", v14, 0);
  objc_msgSend(v1, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_ellipsisButtonTapped_, 0x2000);
  NABundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("more"), &stru_1E71B2988, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAccessibilityLabel:", v16);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v1);
  return v1;
}

- (void)layoutSubviews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  double Width;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double MaxY;
  void *v27;
  double v28;
  void *v29;
  double Height;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  double MidY;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  objc_super v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v54.receiver = self;
  v54.super_class = (Class)NANowPlayingTitleView;
  -[NANowPlayingTitleView layoutSubviews](&v54, sel_layoutSubviews);
  -[NANowPlayingTitleView ellipsisButton](self, "ellipsisButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

  -[NANowPlayingTitleView ellipsisButton](self, "ellipsisButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  Width = CGRectGetWidth(v55);

  -[NANowPlayingTitleView bounds](self, "bounds");
  v10 = CGRectGetWidth(v56) + -16.0;
  v11 = -[NANowPlayingTitleView hasPublisherLogo](self, "hasPublisherLogo");
  if (v11)
  {
    -[NANowPlayingTitleView layoutSpecProvider](self, "layoutSpecProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "publisherLogoHeight");
    v13 = v12;
    -[NANowPlayingTitleView publisherImageView](self, "publisherImageView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "image");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "size");
    v15 = v13 * v14;
    -[NANowPlayingTitleView publisherImageView](self, "publisherImageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
    v17 = v15 / v16;
  }
  else
  {
    v17 = 0.0;
  }
  v18 = v10 - Width;
  -[NANowPlayingTitleView layoutSpecProvider](self, "layoutSpecProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "publisherLogoHeight");
  v21 = v20;

  if (v11)
  {

  }
  -[NANowPlayingTitleView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentSize:", v17, v21);

  -[NANowPlayingTitleView publisherImageView](self, "publisherImageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", 0.0, 0.0, v17, v21);

  -[NANowPlayingTitleView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", 0.0, 0.0, v18, v21);

  -[NANowPlayingTitleView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  MaxY = CGRectGetMaxY(v57);

  if (-[NANowPlayingTitleView hasPublisherLogo](self, "hasPublisherLogo"))
  {
    -[NANowPlayingTitleView layoutSpecProvider](self, "layoutSpecProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "publisherLogoBottomMargin");
    MaxY = MaxY + v28;

  }
  -[NANowPlayingTitleView titleLabel](self, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bounds");
  Height = CGRectGetHeight(v58);
  -[NANowPlayingTitleView titleMarqueeContainer](self, "titleMarqueeContainer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", 0.0, MaxY, v18, Height);

  -[NANowPlayingTitleView ellipsisButton](self, "ellipsisButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v33 = CGRectGetHeight(v59);

  if (-[NANowPlayingTitleView hasPublisherLogo](self, "hasPublisherLogo"))
  {
    -[NANowPlayingTitleView publisherMarqueeContainer](self, "publisherMarqueeContainer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "frame");
    v35 = CGRectGetMaxY(v60);
    -[NANowPlayingTitleView layoutSpecProvider](self, "layoutSpecProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "publisherLogoBottomMargin");
    MidY = v35 + v37 * 0.5;

  }
  else
  {
    -[NANowPlayingTitleView titleMarqueeContainer](self, "titleMarqueeContainer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "frame");
    MidY = CGRectGetMidY(v61);
  }

  v39 = v33 * -0.5;
  -[NANowPlayingTitleView bounds](self, "bounds");
  v40 = CGRectGetWidth(v62);
  -[NANowPlayingTitleView ellipsisButton](self, "ellipsisButton");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  v42 = v40 - CGRectGetWidth(v63);
  v43 = MidY + v39;
  -[NANowPlayingTitleView ellipsisButton](self, "ellipsisButton");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bounds");
  v45 = CGRectGetWidth(v64);
  -[NANowPlayingTitleView ellipsisButton](self, "ellipsisButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bounds");
  v47 = CGRectGetHeight(v65);
  -[NANowPlayingTitleView ellipsisButton](self, "ellipsisButton");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v42, v43, v45, v47);

  -[NANowPlayingTitleView ellipsisButton](self, "ellipsisButton");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  -[NATouchInsetsButton setTouchInsets:](self->_ellipsisButton, "setTouchInsets:", NAInsetsToMinimumTapTargetForFrame(v50, v51, v52, v53));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  width = a3.width;
  v5 = (void *)MEMORY[0x1E0DC1350];
  -[NANowPlayingTitleView layoutSpecProvider](self, "layoutSpecProvider", a3.width, a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabelFontSize");
  objc_msgSend(v5, "systemFontOfSize:weight:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  v9 = v8;

  if (-[NANowPlayingTitleView hasPublisherLogo](self, "hasPublisherLogo"))
  {
    -[NANowPlayingTitleView layoutSpecProvider](self, "layoutSpecProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "publisherLogoHeight");
    v12 = v11;
    -[NANowPlayingTitleView layoutSpecProvider](self, "layoutSpecProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "publisherLogoBottomMargin");
    v9 = v9 + v12 + v14;

  }
  v15 = width;
  v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setPublisherImage:(id)a3 fallbackName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NANowPlayingTitleView *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  CGContext *CurrentContext;
  CGContext *v25;
  void *v26;
  _QWORD v27[3];
  _QWORD v28[4];
  CGSize v29;

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v9 = self;
    v10 = v6;
  }
  else
  {
    if (v7)
    {
      v11 = (void *)MEMORY[0x1E0DC1350];
      -[NANowPlayingTitleView layoutSpecProvider](self, "layoutSpecProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "publisherLogoHeight");
      objc_msgSend(v11, "systemFontOfSize:weight:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *MEMORY[0x1E0CA85F8];
      v27[0] = *MEMORY[0x1E0DC1138];
      v27[1] = v14;
      v28[0] = v13;
      v28[1] = &unk_1E71E1A08;
      v27[2] = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "sizeWithAttributes:", v16);
      v18 = v17;
      v20 = v19;
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scale");
      v23 = v22;
      v29.width = v18;
      v29.height = v20;
      UIGraphicsBeginImageContextWithOptions(v29, 0, v23);

      objc_msgSend(v8, "drawAtPoint:withAttributes:", v16, 0.0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSetShouldAntialias(CurrentContext, 1);
      v25 = UIGraphicsGetCurrentContext();
      CGContextSetAllowsAntialiasing(v25, 1);
      UIGraphicsGetImageFromCurrentImageContext();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();
      -[NANowPlayingTitleView _setPublisherImage:](self, "_setPublisherImage:", v26);

      goto LABEL_6;
    }
    v9 = self;
    v10 = 0;
  }
  -[NANowPlayingTitleView _setPublisherImage:](v9, "_setPublisherImage:", v10);
LABEL_6:

}

- (void)_setPublisherImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC3F10];
  -[NANowPlayingTitleView publisherImageView](self, "publisherImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__NANowPlayingTitleView__setPublisherImage___block_invoke;
  v8[3] = &unk_1E7194908;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "transitionWithView:duration:options:animations:completion:", v6, 5242880, v8, 0, 0.25);

}

uint64_t __44__NANowPlayingTitleView__setPublisherImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "publisherImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", v2);

  objc_msgSend(*(id *)(a1 + 40), "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "publisherImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

  objc_msgSend(*(id *)(a1 + 40), "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "publisherImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsAccessibilityElement:", v6 != 0);

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DC1350];
  -[NANowPlayingTitleView layoutSpecProvider](self, "layoutSpecProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleLabelFontSize");
  objc_msgSend(v5, "systemFontOfSize:weight:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", *MEMORY[0x1E0DC4B58]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scaledFontForFont:maximumPointSize:", v7, 26.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0CA85F8];
  v20[0] = *MEMORY[0x1E0DC1138];
  v20[1] = v10;
  v21[0] = v9;
  v21[1] = &unk_1E71E1A08;
  v20[2] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0DC3F10];
  -[NANowPlayingTitleView titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34__NANowPlayingTitleView_setTitle___block_invoke;
  v17[3] = &unk_1E71949D0;
  v17[4] = self;
  v18 = v4;
  v19 = v12;
  v15 = v12;
  v16 = v4;
  objc_msgSend(v13, "transitionWithView:duration:options:animations:completion:", v14, 5242880, v17, 0, 0.25);

}

uint64_t __34__NANowPlayingTitleView_setTitle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v2);

  objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeToFit");

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
}

- (void)setMarqueeRunning:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[NANowPlayingTitleView publisherMarqueeContainer](self, "publisherMarqueeContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMarqueeEnabled:", v3);

  -[NANowPlayingTitleView titleMarqueeContainer](self, "titleMarqueeContainer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMarqueeEnabled:", v3);

}

- (double)publisherLogoHeight
{
  void *v2;
  double v3;
  double v4;

  -[NANowPlayingTitleView layoutSpecProvider](self, "layoutSpecProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publisherLogoHeight");
  v4 = v3;

  return v4;
}

- (BOOL)hasPublisherLogo
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[NANowPlayingTitleView publisherImageView](self, "publisherImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4 > 0.0;

  return v5;
}

- (void)ellipsisButtonTapped:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  NANowPlayingLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B9E0F000, v4, OS_LOG_TYPE_DEFAULT, "ellipsisButtonTouchUpInside:", v6, 2u);
  }

  -[NANowPlayingTitleView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nowPlayingTitleViewDidTapEllipsis:", self);

}

- (UIImageView)publisherImageView
{
  return self->_publisherImageView;
}

- (void)setPublisherImageView:(id)a3
{
  objc_storeStrong((id *)&self->_publisherImageView, a3);
}

- (MPUMarqueeView)publisherMarqueeContainer
{
  return self->_publisherMarqueeContainer;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (MPUMarqueeView)titleMarqueeContainer
{
  return self->_titleMarqueeContainer;
}

- (NATouchInsetsButton)ellipsisButton
{
  return self->_ellipsisButton;
}

- (void)setEllipsisButton:(id)a3
{
  objc_storeStrong((id *)&self->_ellipsisButton, a3);
}

- (NANowPlayingTitleViewDelegate)delegate
{
  return (NANowPlayingTitleViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NANowPlayingTitleViewLayoutSpecProvider)layoutSpecProvider
{
  return (NANowPlayingTitleViewLayoutSpecProvider *)objc_loadWeakRetained((id *)&self->_layoutSpecProvider);
}

- (void)setLayoutSpecProvider:(id)a3
{
  objc_storeWeak((id *)&self->_layoutSpecProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutSpecProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ellipsisButton, 0);
  objc_storeStrong((id *)&self->_titleMarqueeContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_publisherMarqueeContainer, 0);
  objc_storeStrong((id *)&self->_publisherImageView, 0);
}

@end
