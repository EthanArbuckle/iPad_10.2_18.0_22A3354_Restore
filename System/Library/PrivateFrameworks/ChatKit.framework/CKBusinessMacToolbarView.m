@implementation CKBusinessMacToolbarView

- (void)layoutSubviews
{
  int v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  _BOOL4 v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)CKBusinessMacToolbarView;
  -[CKBusinessMacToolbarView layoutSubviews](&v46, sel_layoutSubviews);
  v3 = -[CKBusinessMacToolbarView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CKBusinessMacToolbarView leftItemView](self, "leftItemView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");

  -[CKBusinessMacToolbarView bannerImage](self, "bannerImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBusinessMacToolbarView _maxSizeForImage:](self, "_maxSizeForImage:", v5);
  v7 = v6;
  v9 = v8;

  -[CKBusinessMacToolbarView bannerImage](self, "bannerImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = v11;
  v14 = v13;

  if (v12 <= 0.0 || v14 <= 0.0)
  {
    if (v3)
    {
      -[CKBusinessMacToolbarView detailsPopoverFrame](self, "detailsPopoverFrame");
      v18 = v17;
      -[CKBusinessMacToolbarView detailsPopoverFrame](self, "detailsPopoverFrame");
      v20 = v18 + v19;
    }
    else
    {
      -[CKBusinessMacToolbarView frame](self, "frame");
      v22 = v21;
      -[CKBusinessMacToolbarView detailsPopoverFrame](self, "detailsPopoverFrame");
      v20 = v22 - v23;
    }
    -[CKBusinessMacToolbarView frame](self, "frame");
    v25 = v24;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "macNavbarLeftMargin");
    v16 = v25 - v27 + -8.0 - v20;

  }
  else
  {
    v15 = v7 / v12;
    if (v7 / v12 >= v9 / v14)
      v15 = v9 / v14;
    v16 = v12 * v15;
    v9 = v14 * v15;
  }
  -[CKBusinessMacToolbarView preferredHeight](self, "preferredHeight");
  v29 = v28;
  if (v3)
  {
    -[CKBusinessMacToolbarView frame](self, "frame");
    v31 = v30;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "macNavbarLeftMargin");
    v34 = v31 - v33 - v16;

    v35 = -[CKBusinessMacToolbarView showingInStandAloneWindow](self, "showingInStandAloneWindow");
    v36 = -73.0;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "macNavbarLeftMargin");
    v34 = v38;

    v35 = -[CKBusinessMacToolbarView showingInStandAloneWindow](self, "showingInStandAloneWindow");
    v36 = 73.0;
  }
  v39 = v34 + v36;
  if (v35)
    v34 = v39;
  v40 = (v29 - v9) * 0.5;
  -[CKBusinessMacToolbarView traitCollection](self, "traitCollection");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "displayScale");
  v43 = round(v34 * v42) / v42;
  v44 = round(v40 * v42) / v42;

  -[CKBusinessMacToolbarView leftItemView](self, "leftItemView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setFrame:", v43, v44, v16, v9);

}

- (void)setBannerImageData:(id)a3
{
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = objc_msgSend(v8, "isEqualToData:", self->_bannerImageData);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bannerImageData, a3);
    -[CKBusinessMacToolbarView _generateScaledImageFromBannerData](self, "_generateScaledImageFromBannerData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[CKBusinessMacToolbarView _updateBannerImage:](self, "_updateBannerImage:", v7);

    v6 = v8;
  }

}

- (void)setFallbackTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CKBusinessMacToolbarView fallbackTitleLabel](self, "fallbackTitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[CKBusinessMacToolbarView bannerImage](self, "bannerImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CKBusinessMacToolbarView leftItemView](self, "leftItemView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CKBusinessMacToolbarView leftItemView](self, "leftItemView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
    if (v4)
    {
      -[CKBusinessMacToolbarView fallbackTitleLabel](self, "fallbackTitleLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBusinessMacToolbarView setLeftItemView:](self, "setLeftItemView:", v10);

      -[CKBusinessMacToolbarView leftItemView](self, "leftItemView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBusinessMacToolbarView addSubview:](self, "addSubview:", v11);

      -[CKBusinessMacToolbarView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)setFallbackTitleColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKBusinessMacToolbarView fallbackTitleLabel](self, "fallbackTitleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

}

- (void)setPreferredHeight:(double)a3
{
  if (self->_preferredHeight != a3)
  {
    self->_preferredHeight = a3;
    -[CKBusinessMacToolbarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "displayScale");
  v5 = v4;
  -[CKBusinessMacToolbarView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  if (v5 != v8)
  {
    -[CKBusinessMacToolbarView _generateScaledImageFromBannerData](self, "_generateScaledImageFromBannerData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      -[CKBusinessMacToolbarView _updateBannerImage:](self, "_updateBannerImage:", v9);
      v9 = v10;
    }

  }
}

- (UILabel)fallbackTitleLabel
{
  UILabel *fallbackTitleLabel;
  id v4;
  UILabel *v5;
  UILabel *v6;

  fallbackTitleLabel = self->_fallbackTitleLabel;
  if (!fallbackTitleLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_fallbackTitleLabel;
    self->_fallbackTitleLabel = v5;

    fallbackTitleLabel = self->_fallbackTitleLabel;
  }
  return fallbackTitleLabel;
}

- (id)_generateScaledImageFromBannerData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;

  -[CKBusinessMacToolbarView bannerImageData](self, "bannerImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CEA638];
    -[CKBusinessMacToolbarView bannerImageData](self, "bannerImageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBusinessMacToolbarView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    objc_msgSend(v4, "imageWithData:scale:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA618], "preferredFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBusinessMacToolbarView traitCollection](self, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayScale");
    objc_msgSend(v8, "setScale:");

    objc_msgSend(v8, "setPreferredRange:", 0);
    objc_msgSend(v8, "setOpaque:", 0);
    -[CKBusinessMacToolbarView _maxSizeForImage:](self, "_maxSizeForImage:", v7);
    v11 = v10;
    v13 = v12;
    objc_msgSend(v7, "size");
    v16 = v11 / v14;
    if (v11 / v14 >= v13 / v15)
      v16 = v13 / v15;
    v17 = v14 * v16;
    v18 = v15 * v16;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithBounds:format:", v8, 0.0, 0.0, v14 * v16, v15 * v16);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62__CKBusinessMacToolbarView__generateScaledImageFromBannerData__block_invoke;
    v23[3] = &unk_1E2751E98;
    v25 = 0;
    v26 = 0;
    v24 = v7;
    v27 = v17;
    v28 = v18;
    v20 = v7;
    objc_msgSend(v19, "imageWithActions:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  return v21;
}

uint64_t __62__CKBusinessMacToolbarView__generateScaledImageFromBannerData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_updateBannerImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = a3;
    -[CKBusinessMacToolbarView setBannerImage:](self, "setBannerImage:", v4);
    -[CKBusinessMacToolbarView leftItemView](self, "leftItemView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CKBusinessMacToolbarView leftItemView](self, "leftItemView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v4);

    objc_msgSend(v9, "setClipsToBounds:", 1);
    -[CKBusinessMacToolbarView setLeftItemView:](self, "setLeftItemView:", v9);
    -[CKBusinessMacToolbarView leftItemView](self, "leftItemView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBusinessMacToolbarView addSubview:](self, "addSubview:", v8);

    -[CKBusinessMacToolbarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)_maxSizeForImage:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v3 = a3;
  objc_msgSend(v3, "size");
  if (v4 > 0.0
    && (objc_msgSend(v3, "size"), v5 > 0.0)
    && (objc_msgSend(v3, "size"), v7 = v6, objc_msgSend(v3, "size"), v7 == v8))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "businessSquareToolbarLogoHeight");
    v11 = v10;
    v12 = v10;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "businessBannerSize");
    v12 = v14;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "businessBannerSize");
    v11 = v15;
  }

  v16 = v12;
  v17 = v11;
  result.height = v17;
  result.width = v16;
  return result;
}

- (NSData)bannerImageData
{
  return self->_bannerImageData;
}

- (double)preferredHeight
{
  return self->_preferredHeight;
}

- (BOOL)showingInStandAloneWindow
{
  return self->_showingInStandAloneWindow;
}

- (void)setShowingInStandAloneWindow:(BOOL)a3
{
  self->_showingInStandAloneWindow = a3;
}

- (CGRect)detailsPopoverFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_detailsPopoverFrame.origin.x;
  y = self->_detailsPopoverFrame.origin.y;
  width = self->_detailsPopoverFrame.size.width;
  height = self->_detailsPopoverFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setDetailsPopoverFrame:(CGRect)a3
{
  self->_detailsPopoverFrame = a3;
}

- (UIView)leftItemView
{
  return self->_leftItemView;
}

- (void)setLeftItemView:(id)a3
{
  objc_storeStrong((id *)&self->_leftItemView, a3);
}

- (UIImage)bannerImage
{
  return self->_bannerImage;
}

- (void)setBannerImage:(id)a3
{
  objc_storeStrong((id *)&self->_bannerImage, a3);
}

- (void)setFallbackTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackTitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTitleLabel, 0);
  objc_storeStrong((id *)&self->_bannerImage, 0);
  objc_storeStrong((id *)&self->_leftItemView, 0);
  objc_storeStrong((id *)&self->_bannerImageData, 0);
}

@end
