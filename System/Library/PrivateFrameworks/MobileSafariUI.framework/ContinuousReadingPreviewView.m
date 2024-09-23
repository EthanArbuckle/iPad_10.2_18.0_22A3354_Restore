@implementation ContinuousReadingPreviewView

- (ContinuousReadingPreviewView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (ContinuousReadingPreviewView)initWithContinuousReadingItem:(id)a3 previewingNextDocument:(BOOL)a4
{
  id v7;
  ContinuousReadingPreviewView *v8;
  ContinuousReadingPreviewView *v9;
  void *v10;
  void *v11;
  void *v12;
  ContinuousReadingPreviewView *v13;
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ContinuousReadingPreviewView;
  v8 = -[ContinuousReadingPreviewView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_continuousReadingItem, a3);
    v9->_previewingNextDocument = a4;
    -[ContinuousReadingPreviewView headerView](v9, "headerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContinuousReadingPreviewView addSubview:](v9, "addSubview:", v10);

    -[ContinuousReadingPreviewView bannerView](v9, "bannerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContinuousReadingPreviewView addSubview:](v9, "addSubview:", v11);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContinuousReadingPreviewView setBackgroundColor:](v9, "setBackgroundColor:", v12);

    v13 = v9;
  }

  return v9;
}

- (double)headerHeight
{
  void *v2;
  double v3;
  double v4;
  CGRect v6;

  -[ContinuousReadingPreviewView bannerView](self, "bannerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");
  v3 = headerLabelHeight();
  objc_msgSend(v2, "titleRect");
  v4 = ceil(v3 + CGRectGetMinY(v6) * 1.5);

  return v4;
}

- (double)rubberBandingHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  CGRect v8;

  -[ContinuousReadingPreviewView headerHeight](self, "headerHeight");
  v4 = v3;
  -[ContinuousReadingPreviewView bannerView](self, "bannerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = v4 + CGRectGetHeight(v8);

  return v6;
}

- (void)setContentView:(id)a3
{
  WKWebView *v5;
  WKWebView **p_contentView;
  WKWebView *contentView;
  UIView *v8;
  UIView *contentBackgroundView;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  WKWebView *v13;

  v5 = (WKWebView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  v13 = v5;
  if (contentView != v5)
  {
    -[WKWebView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    if (*p_contentView)
    {
      if (!self->_contentBackgroundView)
      {
        v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        contentBackgroundView = self->_contentBackgroundView;
        self->_contentBackgroundView = v8;

        objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](self->_contentBackgroundView, "setBackgroundColor:", v10);

        -[ContinuousReadingPreviewView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_contentBackgroundView, *p_contentView);
      }
      -[ContinuousReadingPreviewView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:");
      -[WKWebView frame](*p_contentView, "frame");
      self->_contentViewSize.width = v11;
      self->_contentViewSize.height = v12;
      -[ContinuousReadingPreviewView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (UIView)headerView
{
  UIView *headerView;
  double Width;
  double v5;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  void *v9;
  UIView *v10;
  void *v11;
  UIView *v12;
  UIView *headerHairline;
  UIView *v14;
  UIView *v15;
  CGRect v17;

  if (self->_previewingNextDocument)
  {
    headerView = self->_headerView;
    if (!headerView)
    {
      -[ContinuousReadingPreviewView bounds](self, "bounds");
      Width = CGRectGetWidth(v17);
      -[ContinuousReadingPreviewView headerHeight](self, "headerHeight");
      v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, Width, v5);
      v7 = self->_headerView;
      self->_headerView = v6;

      -[UIView setOpaque:](self->_headerView, "setOpaque:", 1);
      v8 = self->_headerView;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[UIView setAutoresizingMask:](self->_headerView, "setAutoresizingMask:", 34);
      v10 = self->_headerView;
      -[ContinuousReadingPreviewView headerLabel](self, "headerLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](v10, "addSubview:", v11);

      +[ContinuousReadingBannerView makeHairlineSeparator](ContinuousReadingBannerView, "makeHairlineSeparator");
      v12 = (UIView *)objc_claimAutoreleasedReturnValue();
      headerHairline = self->_headerHairline;
      self->_headerHairline = v12;

      -[UIView frame](self->_headerHairline, "frame");
      v14 = self->_headerHairline;
      _SFRoundRectToPixels();
      -[UIView setFrame:](v14, "setFrame:");
      -[UIView addSubview:](self->_headerView, "addSubview:", self->_headerHairline);
      headerView = self->_headerView;
    }
    v15 = headerView;
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (ContinuousReadingBannerView)bannerView
{
  ContinuousReadingBannerView *bannerView;
  ContinuousReadingBannerView *v4;
  void *v5;
  ContinuousReadingBannerView *v6;
  ContinuousReadingBannerView *v7;
  ContinuousReadingBannerView *v8;
  void *v9;
  double MaxY;
  CGRect v12;

  bannerView = self->_bannerView;
  if (!bannerView)
  {
    v4 = [ContinuousReadingBannerView alloc];
    -[ContinuousReadingPreviewView continuousReadingItem](self, "continuousReadingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ContinuousReadingBannerView initWithContinuousReadingItem:](v4, "initWithContinuousReadingItem:", v5);
    v7 = self->_bannerView;
    self->_bannerView = v6;

    v8 = self->_bannerView;
    -[ContinuousReadingPreviewView headerView](self, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    MaxY = CGRectGetMaxY(v12);
    -[ContinuousReadingPreviewView bounds](self, "bounds");
    -[ContinuousReadingBannerView setFrame:](v8, "setFrame:", 0.0, MaxY);

    bannerView = self->_bannerView;
  }
  return bannerView;
}

- (UILabel)headerLabel
{
  UILabel *headerLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;

  headerLabel = self->_headerLabel;
  if (!headerLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v5 = self->_headerLabel;
    self->_headerLabel = v4;

    v6 = self->_headerLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = self->_headerLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    v10 = self->_headerLabel;
    _WBSLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10, "setText:", v11);

    headerLabel = self->_headerLabel;
  }
  return headerLabel;
}

- (BOOL)canShowContentView
{
  void *v3;
  BOOL v4;

  -[ContinuousReadingPreviewView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 || self->_snapshotView || -[ContinuousReadingPreviewView isPrefetchingDisabled](self, "isPrefetchingDisabled");

  return v4;
}

- (void)setDocumentSnapshot:(id)a3
{
  UIImage *v5;
  UIImageView *snapshotView;
  double v7;
  double v8;
  double v9;
  double v10;
  UIImageView *v11;
  UIImageView *v12;
  UIImageView *v13;
  UIImage *v14;

  v5 = (UIImage *)a3;
  if (self->_documentSnapshot != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_documentSnapshot, a3);
    snapshotView = self->_snapshotView;
    if (self->_documentSnapshot)
    {
      if (!snapshotView)
      {
        v7 = *MEMORY[0x1E0C9D538];
        v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        -[UIImage size](v14, "size");
        v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v7, v8, v9, v10);
        v12 = self->_snapshotView;
        self->_snapshotView = v11;

        -[ContinuousReadingPreviewView insertSubview:above:](self, "insertSubview:above:", self->_snapshotView, self->_contentView);
        -[ContinuousReadingPreviewView layoutIfNeeded](self, "layoutIfNeeded");
        snapshotView = self->_snapshotView;
      }
      -[UIImageView setImage:](snapshotView, "setImage:", v14);
    }
    else
    {
      -[UIImageView removeFromSuperview](snapshotView, "removeFromSuperview");
      v13 = self->_snapshotView;
      self->_snapshotView = 0;

    }
    v5 = v14;
  }

}

- (void)replaceContentViewWithItsSnapshot
{
  WKWebView *contentView;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  id v12;
  CGSize v13;

  contentView = self->_contentView;
  if (contentView)
  {
    -[WKWebView bounds](contentView, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13.width = v8;
    v13.height = v10;
    UIGraphicsBeginImageContext(v13);
    -[WKWebView drawViewHierarchyInRect:afterScreenUpdates:](self->_contentView, "drawViewHierarchyInRect:afterScreenUpdates:", 0, v5, v7, v9, v11);
    UIGraphicsGetImageFromCurrentImageContext();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    -[ContinuousReadingPreviewView setDocumentSnapshot:](self, "setDocumentSnapshot:", v12);

  }
}

- (void)setContentViewSize:(CGSize)a3
{
  if (self->_contentViewSize.width != a3.width || self->_contentViewSize.height != a3.height)
  {
    self->_contentViewSize = a3;
    -[ContinuousReadingPreviewView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBannerTheme:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  ContinuousReadingPreviewView *v13;
  id v14;

  v4 = a4;
  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __56__ContinuousReadingPreviewView_setBannerTheme_animated___block_invoke;
    v12 = &unk_1E9CF1830;
    v13 = self;
    v14 = v6;
    v7 = _Block_copy(&v9);
    v8 = v7;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331648, v7, 0, v9, v10, v11, v12, v13);
    else
      (*((void (**)(void *))v7 + 2))(v7);

  }
}

void __56__ContinuousReadingPreviewView_setBannerTheme_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "headerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setLocalOverrideTraitCollection:", v2);

  objc_msgSend(*(id *)(a1 + 40), "themeColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v9, "setBackgroundColor:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "separatorColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[ContinuousReadingBannerView hairlineColor](ContinuousReadingBannerView, "hairlineColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setBackgroundColor:", v6);
  if (!v5)

  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bannerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTheme:", v7);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ContinuousReadingPreviewView;
  -[ContinuousReadingPreviewView layoutSubviews](&v5, sel_layoutSubviews);
  -[ContinuousReadingPreviewView safeAreaInsets](self, "safeAreaInsets");
  -[ContinuousReadingBannerView setTopHairlineInsets:](self->_bannerView, "setTopHairlineInsets:", 0.0, fmax(v3, 15.0), 0.0, fmax(v4, 15.0));
  if (self->_previewingNextDocument)
    -[ContinuousReadingPreviewView _layOutHeader](self, "_layOutHeader");
  -[ContinuousReadingPreviewView _layOutContentView](self, "_layOutContentView");
}

- (void)_layOutHeader
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGRect v14;

  -[ContinuousReadingPreviewView headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");

  headerLabelHeight();
  -[ContinuousReadingPreviewView safeAreaInsets](self, "safeAreaInsets");
  -[ContinuousReadingPreviewView bannerView](self, "bannerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleRect");
  CGRectGetMinY(v14);

  _SFRoundRectToPixels();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[ContinuousReadingPreviewView headerLabel](self, "headerLabel");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (void)_layOutContentView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double MaxY;
  double height;
  UIImageView *snapshotView;
  double Width;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  -[ContinuousReadingPreviewView bounds](self, "bounds");
  v4 = v3;
  _SFRoundFloatToPixels();
  v6 = v5;
  if (self->_previewingNextDocument)
  {
    -[ContinuousReadingBannerView frame](self->_bannerView, "frame");
    MaxY = CGRectGetMaxY(v11);
    height = self->_contentViewSize.height;
  }
  else
  {
    height = self->_contentViewSize.height;
    MaxY = -height;
  }
  -[WKWebView setFrame:](self->_contentView, "setFrame:", v6, MaxY, self->_contentViewSize.width, height);
  -[UIView setFrame:](self->_contentBackgroundView, "setFrame:", 0.0, MaxY, v4, self->_contentViewSize.height);
  snapshotView = self->_snapshotView;
  -[UIImageView frame](snapshotView, "frame");
  Width = CGRectGetWidth(v12);
  -[UIImageView frame](self->_snapshotView, "frame");
  -[UIImageView setFrame:](snapshotView, "setFrame:", v6, MaxY, Width, CGRectGetHeight(v13));
}

- (ContinuousReadingItem)continuousReadingItem
{
  return self->_continuousReadingItem;
}

- (WKWebView)contentView
{
  return self->_contentView;
}

- (void)setBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_bannerView, a3);
}

- (BOOL)isPrefetchingDisabled
{
  return self->_prefetchingDisabled;
}

- (void)setPrefetchingDisabled:(BOOL)a3
{
  self->_prefetchingDisabled = a3;
}

- (BOOL)isPreviewingNextDocument
{
  return self->_previewingNextDocument;
}

- (UIImage)documentSnapshot
{
  return self->_documentSnapshot;
}

- (CGSize)contentViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentViewSize.width;
  height = self->_contentViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIView)contentBackgroundView
{
  return self->_contentBackgroundView;
}

- (void)setContentBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_contentBackgroundView, a3);
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_contentBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_documentSnapshot, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_continuousReadingItem, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_headerHairline, 0);
  objc_storeStrong((id *)&self->_bannerTheme, 0);
}

@end
