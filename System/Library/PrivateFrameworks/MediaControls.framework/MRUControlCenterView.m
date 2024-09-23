@implementation MRUControlCenterView

- (MRUControlCenterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUControlCenterView *v7;
  UICollectionViewFlowLayout *v8;
  UICollectionViewFlowLayout *collectionViewLayout;
  uint64_t v10;
  UICollectionView *collectionView;
  void *v12;
  MRUControlCenterButton *v13;
  MRUControlCenterButton *moreButton;
  id v15;
  uint64_t v16;
  UIView *containerView;
  uint64_t v18;
  UIView *materialView;
  void *v20;
  MRUControlCenterRouteButton *v21;
  MRUControlCenterRouteButton *routingButton;
  void *v23;
  void *v24;
  MRUVisualStylingProvider *v25;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)MRUControlCenterView;
  v7 = -[MRUControlCenterView initWithFrame:](&v27, sel_initWithFrame_);
  if (v7)
  {
    v8 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E0DC3610]);
    collectionViewLayout = v7->_collectionViewLayout;
    v7->_collectionViewLayout = v8;

    -[UICollectionViewFlowLayout setItemSize:](v7->_collectionViewLayout, "setItemSize:", MRUDefaultExpandedWidth(-[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v7->_collectionViewLayout, "setMinimumInteritemSpacing:", 16.0)), 108.0);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v7->_collectionViewLayout, x, y, width, height);
    collectionView = v7->_collectionView;
    v7->_collectionView = (UICollectionView *)v10;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v7->_collectionView, "setBackgroundColor:", v12);

    -[UICollectionView setShowsVerticalScrollIndicator:](v7->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](v7->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setAlwaysBounceVertical:](v7->_collectionView, "setAlwaysBounceVertical:", 1);
    -[MRUControlCenterView addSubview:](v7, "addSubview:", v7->_collectionView);
    v13 = objc_alloc_init(MRUControlCenterButton);
    moreButton = v7->_moreButton;
    v7->_moreButton = v13;

    -[MRUControlCenterView addSubview:](v7, "addSubview:", v7->_moreButton);
    v15 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v16 = objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    containerView = v7->_containerView;
    v7->_containerView = (UIView *)v16;

    -[MRUControlCenterView addSubview:](v7, "addSubview:", v7->_containerView);
    objc_msgSend(MEMORY[0x1E0D14790], "controlCenterModuleBackgroundMaterial");
    v18 = objc_claimAutoreleasedReturnValue();
    materialView = v7->_materialView;
    v7->_materialView = (UIView *)v18;

    -[UIView addSubview:](v7->_containerView, "addSubview:", v7->_materialView);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, 20.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MRUControlCenterRouteButton);
    routingButton = v7->_routingButton;
    v7->_routingButton = v21;

    -[MRUControlCenterRouteButton imageView](v7->_routingButton, "imageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPreferredSymbolConfiguration:", v20);

    -[UIView addSubview:](v7->_containerView, "addSubview:", v7->_routingButton);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIView visualStylingProviderForCategory:](v7->_materialView, "visualStylingProviderForCategory:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[MRUVisualStylingProvider initWithVisualStylingProvider:]([MRUVisualStylingProvider alloc], "initWithVisualStylingProvider:", v24);
      -[MRUControlCenterView setStylingProvider:](v7, "setStylingProvider:", v25);

    }
    -[MRUControlCenterView updateVisibility](v7, "updateVisibility");

  }
  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  uint64_t v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v25.receiver = self;
  v25.super_class = (Class)MRUControlCenterView;
  -[MRUControlCenterView layoutSubviews](&v25, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[MRUControlCenterView layoutSubviewsIPad](self, "layoutSubviewsIPad");
  }
  else if (MRULayoutShouldBeVertical())
  {
    -[MRUControlCenterView layoutSubviewsVertical](self, "layoutSubviewsVertical");
  }
  else
  {
    -[MRUControlCenterView layoutSubviewsHorizontal](self, "layoutSubviewsHorizontal");
  }
  -[MRUControlCenterView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;

  -[UIView bounds](self->_containerView, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[UIView setFrame:](self->_materialView, "setFrame:");
  -[UIView setFrame:](self->_contentView, "setFrame:", v9, v11, v13, v15);
  -[UIView setFrame:](self->_alertView, "setFrame:", v9, v11, v13, v15);
  MRUControlCenterRouteButtonInset();
  MRUControlCenterRouteButtonInset();
  MRUControlCenterRouteButtonInset();
  UIRectInset();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[MRUControlCenterRouteButton sizeThatFits:](self->_routingButton, "sizeThatFits:", v20, v22);
  v26.origin.x = v17;
  v26.origin.y = v19;
  v26.size.width = v21;
  v26.size.height = v23;
  CGRectGetMaxX(v26);
  v27.origin.x = v17;
  v27.origin.y = v19;
  v27.size.width = v21;
  v27.size.height = v23;
  CGRectGetMinY(v27);
  -[MRUControlCenterView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[MRUControlCenterRouteButton setFrame:](self->_routingButton, "setFrame:");
  -[MRUControlCenterView bounds](self, "bounds");
  CGRectGetWidth(v28);
  MRUDefaultExpandedWidth(v24);
  -[MRUControlCenterView bounds](self, "bounds");
  CGRectGetHeight(v29);
  -[MRUControlCenterView bounds](self, "bounds");
  UIRectCenteredIntegralRectScale();
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v7);
  -[MRUControlCenterView updateCollectionViewContentInset](self, "updateCollectionViewContentInset");
}

- (void)layoutSubviewsVertical
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
  uint64_t v12;
  uint64_t v13;
  int64_t state;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  int64_t v31;
  double x;
  id *p_containerView;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  -[MRUControlCenterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUControlCenterView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  MRUIsSmallScreen();
  state = self->_state;
  if ((unint64_t)(state - 1) < 2)
  {
    MRUExpandedContentInsets();
    UIRectInset();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[MRUControlCenterButton sizeThatFits:](self->_moreButton, "sizeThatFits:", v19, v21);
    v45.origin.x = v16;
    v45.origin.y = v18;
    v45.size.width = v20;
    v45.size.height = v22;
    CGRectGetMaxY(v45);
    v44 = v13;
    UIRectCenteredXInRectScale();
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[MRUControlCenterButton setFrame:](self->_moreButton, "setFrame:", v44);
    v31 = self->_state;
    if (v31 == 1)
    {
      if (self->_showAlertView)
      {
        v47.origin.x = v16;
        v47.origin.y = v18;
        v47.size.width = v20;
        v47.size.height = v22;
        CGRectGetWidth(v47);
        v48.origin.x = v16;
        v48.origin.y = v18;
        v48.size.width = v20;
        v48.size.height = v22;
        CGRectGetHeight(v48);
        goto LABEL_13;
      }
    }
    else if (v31 == 2)
    {
      x = self->_transitionFrame.origin.x;
LABEL_14:
      p_containerView = (id *)&self->_containerView;
      goto LABEL_15;
    }
    if (self->_showMoreButton)
    {
      v49.origin.x = v24;
      v49.origin.y = v26;
      v49.size.width = v28;
      v49.size.height = v30;
      CGRectGetHeight(v49);
      UIRectInset();
      v36 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;
      -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", v39, v41);
      v50.origin.x = v36;
      v50.origin.y = v38;
      v50.size.width = v40;
      v50.size.height = v42;
      CGRectGetWidth(v50);
      v51.origin.x = v36;
      v51.origin.y = v38;
      v51.size.width = v40;
      v51.size.height = v42;
      CGRectGetHeight(v51);
      v52.origin.x = v36;
      v52.origin.y = v38;
      v52.size.width = v40;
      v52.size.height = v42;
      x = CGRectGetMinX(v52);
      v53.origin.x = v36;
      v53.origin.y = v38;
      v53.size.width = v40;
      v53.size.height = v42;
      CGRectGetMaxY(v53);
      goto LABEL_14;
    }
    -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", v20, v22);
    v54.origin.x = v16;
    v54.origin.y = v18;
    v54.size.width = v20;
    v54.size.height = v22;
    CGRectGetWidth(v54);
    v55.origin.x = v16;
    v55.origin.y = v18;
    v55.size.width = v20;
    v55.size.height = v22;
    CGRectGetHeight(v55);
    -[MRUControlCenterView bounds](self, "bounds");
LABEL_13:
    UIRectCenteredIntegralRectScale();
    x = v43;
    goto LABEL_14;
  }
  if (!state)
  {
    -[UIView setFrame:](self->_containerView, "setFrame:", v4, v6, v8, v10);
    -[UIView setFrame:](self->_alertView, "setFrame:", v4, v6, v8, v10);
    p_containerView = (id *)&self->_moreButton;
    objc_msgSend(*p_containerView, "sizeThatFits:", v8, v10);
    v46.origin.x = v4;
    v46.origin.y = v6;
    v46.size.width = v8;
    v46.size.height = v10;
    CGRectGetMaxY(v46);
    UIRectCenteredXInRectScale();
    x = v34;
LABEL_15:
    objc_msgSend(*p_containerView, "setFrame:", x);
  }
}

- (void)layoutSubviewsIPad
{
  double v3;
  double MinX;
  double v5;
  double MinY;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t state;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  MRUControlCenterButton **p_moreButton;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double Width;
  double Height;
  int64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  -[MRUControlCenterView bounds](self, "bounds");
  MinX = v3;
  MinY = v5;
  v8 = v7;
  v10 = v9;
  -[MRUControlCenterView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  state = self->_state;
  if ((unint64_t)(state - 1) < 2)
  {
    v40 = v13;
    MRUExpandedContentInsets();
    UIRectInset();
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    p_moreButton = &self->_moreButton;
    -[MRUControlCenterButton sizeThatFits:](self->_moreButton, "sizeThatFits:", v19, v21);
    if (self->_showMoreButton)
    {
      UIRectInset();
      v16 = v24;
      v18 = v25;
      v20 = v26;
      v22 = v27;
    }
    -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", v20, v22);
    v29 = v28;
    v31 = v30;
    v41.origin.x = v16;
    v41.origin.y = v18;
    v41.size.width = v20;
    v41.size.height = v22;
    Width = CGRectGetWidth(v41);
    if (v29 >= Width)
      v8 = Width;
    else
      v8 = v29;
    v42.origin.x = v16;
    v42.origin.y = v18;
    v42.size.width = v20;
    v42.size.height = v22;
    Height = CGRectGetHeight(v42);
    if (v31 >= Height)
      v10 = Height;
    else
      v10 = v31;
    v43.origin.x = v16;
    v43.origin.y = v18;
    v43.size.width = v20;
    v43.size.height = v22;
    MinX = CGRectGetMinX(v43);
    v44.origin.x = v16;
    v44.origin.y = v18;
    v44.size.width = v20;
    v44.size.height = v22;
    MinY = CGRectGetMinY(v44);
    v34 = self->_state;
    if (v34 == 1)
    {
      if (self->_showAlertView)
      {
        v45.origin.x = v16;
        v45.origin.y = v18;
        v45.size.width = v20;
        v45.size.height = v22;
        CGRectGetWidth(v45);
        v46.origin.x = v16;
        v46.origin.y = v18;
        v46.size.width = v20;
        v46.size.height = v22;
        CGRectGetHeight(v46);
        v39 = v40;
        UIRectCenteredIntegralRectScale();
        MinX = v35;
        MinY = v36;
        v8 = v37;
        v10 = v38;
      }
    }
    else if (v34 == 2)
    {
      MinX = self->_transitionFrame.origin.x;
      MinY = self->_transitionFrame.origin.y;
      v8 = self->_transitionFrame.size.width;
      v10 = self->_transitionFrame.size.height;
    }
    -[UIView setFrame:](self->_containerView, "setFrame:", MinX, MinY, v8, v10, v39);
    goto LABEL_19;
  }
  if (!state)
  {
    -[UIView setFrame:](self->_containerView, "setFrame:", MinX, MinY, v8, v10);
    -[UIView setFrame:](self->_alertView, "setFrame:", MinX, MinY, v8, v10);
    p_moreButton = &self->_moreButton;
    -[MRUControlCenterButton sizeThatFits:](self->_moreButton, "sizeThatFits:", v8, v10);
LABEL_19:
    v47.origin.x = MinX;
    v47.origin.y = MinY;
    v47.size.width = v8;
    v47.size.height = v10;
    CGRectGetMaxY(v47);
    UIRectCenteredXInRectScale();
    -[MRUControlCenterButton setFrame:](*p_moreButton, "setFrame:");
  }
}

- (void)layoutSubviewsHorizontal
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
  uint64_t v12;
  uint64_t v13;
  int v14;
  double *v15;
  double v16;
  int64_t state;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  MRUControlCenterButton *moreButton;
  CGFloat v29;
  double v30;
  double x;
  uint64_t v32;
  int64_t v33;
  double y;
  id *p_containerView;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  -[MRUControlCenterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MRUControlCenterView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  v14 = MRUIsSmallScreen();
  v15 = (double *)&MRUControlCenterMoreButtonPaddingSmall;
  if (!v14)
    v15 = (double *)&MRUControlCenterMoreButtonPaddingDefault;
  v16 = *v15;
  state = self->_state;
  if ((unint64_t)(state - 1) < 2)
  {
    MRUExpandedContentInsets();
    v40 = v13;
    v19 = v4 + v18;
    v21 = v6 + v20;
    v23 = v8 - (v18 + v22);
    v25 = v10 - (v20 + v24);
    -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", v23, v25);
    v27 = v26;
    moreButton = self->_moreButton;
    v41.origin.x = v19;
    v41.origin.y = v21;
    v41.size.width = v23;
    v41.size.height = v25;
    v29 = CGRectGetWidth(v41) - (v16 + v27);
    v42.origin.x = v19;
    v42.origin.y = v21;
    v42.size.width = v23;
    v42.size.height = v25;
    -[MRUControlCenterButton sizeThatFits:](moreButton, "sizeThatFits:", v29, CGRectGetHeight(v42));
    v43.origin.x = v19;
    v43.origin.y = v21;
    v43.size.width = v23;
    v43.size.height = v25;
    CGRectGetMinX(v43);
    v44.origin.x = v19;
    v44.origin.y = v21;
    v44.size.width = v23;
    v44.size.height = v25;
    CGRectGetWidth(v44);
    UIRoundToScale();
    x = v30;
    UIRectCenteredYInRectScale();
    v32 = -[MRUControlCenterButton setFrame:](self->_moreButton, "setFrame:", v40);
    v33 = self->_state;
    if (v33 == 1)
    {
      if (self->_showAlertView)
      {
        MRUDefaultExpandedWidth(v32);
        v46.origin.x = v19;
        v46.origin.y = v21;
        v46.size.width = v23;
        v46.size.height = v25;
        CGRectGetHeight(v46);
        goto LABEL_14;
      }
    }
    else if (v33 == 2)
    {
      x = self->_transitionFrame.origin.x;
      y = self->_transitionFrame.origin.y;
LABEL_15:
      p_containerView = (id *)&self->_containerView;
      goto LABEL_16;
    }
    v47.origin.x = v19;
    v47.origin.y = v21;
    v47.size.width = v23;
    v47.size.height = v25;
    y = CGRectGetMinY(v47);
    if (self->_showMoreButton)
      goto LABEL_15;
    -[MRUControlCenterView bounds](self, "bounds");
LABEL_14:
    UIRectCenteredIntegralRectScale();
    x = v38;
    y = v39;
    goto LABEL_15;
  }
  if (!state)
  {
    -[UIView setFrame:](self->_containerView, "setFrame:", v4, v6, v8, v10);
    -[UIView setFrame:](self->_alertView, "setFrame:", v4, v6, v8, v10);
    p_containerView = (id *)&self->_moreButton;
    objc_msgSend(*p_containerView, "sizeThatFits:", v8, v10);
    v45.origin.x = v4;
    v45.origin.y = v6;
    v45.size.width = v8;
    v45.size.height = v10;
    CGRectGetMaxX(v45);
    UIRectCenteredYInRectScale();
    x = v36;
    y = v37;
LABEL_16:
    objc_msgSend(*p_containerView, "setFrame:", x, y);
  }
}

- (void)setFrame:(CGRect)a3
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
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MRUControlCenterView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MRUControlCenterView;
  -[MRUControlCenterView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  -[MRUControlCenterView bounds](self, "bounds");
  if (v13 != v9 || v12 != v11)
    -[MRUControlCenterView updateCollectionViewContentInset](self, "updateCollectionViewContentInset");
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUControlCenterButton setStylingProvider:](self->_moreButton, "setStylingProvider:", v5);
    -[MRUControlCenterRouteButton setStylingProvider:](self->_routingButton, "setStylingProvider:", v5);
  }

}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView **p_contentView;
  UIView *contentView;
  UIView *v8;

  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  v8 = v5;
  if (contentView != v5)
  {
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView _setContinuousCornerRadius:](*p_contentView, "_setContinuousCornerRadius:", self->_cornerRadius);
    -[UIView setClipsToBounds:](*p_contentView, "setClipsToBounds:", 1);
    -[UIView insertSubview:belowSubview:](self->_containerView, "insertSubview:belowSubview:", v8, self->_routingButton);
    -[MRUControlCenterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setAlertView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_alertView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_alertView, a3);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_alertView);
    -[MRUControlCenterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[MRUControlCenterView updateVisibility](self, "updateVisibility");
    -[MRUControlCenterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    -[MRUControlCenterView updateVisibility](self, "updateVisibility");
  }
}

- (void)setTransitionFrame:(CGRect)a3
{
  self->_transitionFrame = a3;
  -[MRUControlCenterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[UIView _setContinuousCornerRadius:](self->_materialView, "_setContinuousCornerRadius:");
  -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", a3);
}

- (void)setShowRoutingButton:(BOOL)a3
{
  if (self->_showRoutingButton != a3)
  {
    self->_showRoutingButton = a3;
    -[MRUControlCenterView updateVisibility](self, "updateVisibility");
  }
}

- (void)setShowMoreButton:(BOOL)a3
{
  if (self->_showMoreButton != a3)
  {
    self->_showMoreButton = a3;
    -[MRUControlCenterView updateVisibility](self, "updateVisibility");
    -[MRUControlCenterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowAlertView:(BOOL)a3
{
  if (self->_showAlertView != a3)
  {
    self->_showAlertView = a3;
    -[MRUControlCenterView updateVisibility](self, "updateVisibility");
    -[MRUControlCenterView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateCollectionViewContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  CGRect v20;
  CGRect v21;

  MRUExpandedContentInsets();
  v4 = v3;
  v6 = v5;
  -[MRUControlCenterView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[UICollectionView contentSize](self->_collectionView, "contentSize");
  v16 = v15;
  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  if (v16 < CGRectGetHeight(v20))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceIdiom");

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v21.origin.x = v8;
      v21.origin.y = v10;
      v21.size.width = v12;
      v21.size.height = v14;
      v19 = v16 - CGRectGetHeight(v21);
      if (v19 < 0.0)
        v19 = -v19;
      v4 = v19 * 0.5;
      v6 = v19 * 0.5;
    }
  }
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v4, 0.0, v6, 0.0);
}

- (void)updateVisibility
{
  int64_t state;
  _BOOL8 v4;
  double v5;
  UIView *alertView;
  double v7;
  double v8;
  double v9;

  state = self->_state;
  if (state == 2)
  {
    -[MRUControlCenterButton setAlpha:](self->_moreButton, "setAlpha:", 0.0);
    -[UICollectionView setAlpha:](self->_collectionView, "setAlpha:", 1.0);
    if (self->_transitioning)
      v5 = 1.0;
    else
      v5 = 0.0;
    -[UIView setAlpha:](self->_containerView, "setAlpha:", v5);
    -[UIView setAlpha:](self->_contentView, "setAlpha:", 1.0);
    alertView = self->_alertView;
    v7 = 0.0;
LABEL_19:
    -[UIView setAlpha:](alertView, "setAlpha:", v7);
    v4 = 1;
    goto LABEL_20;
  }
  if (state == 1)
  {
    v8 = 0.0;
    if (self->_showMoreButton && !self->_showAlertView)
      v8 = 1.0;
    -[MRUControlCenterButton setAlpha:](self->_moreButton, "setAlpha:", v8);
    -[UICollectionView setAlpha:](self->_collectionView, "setAlpha:", 0.0);
    -[UIView setAlpha:](self->_containerView, "setAlpha:", 1.0);
    if (self->_showAlertView)
      v9 = 0.0;
    else
      v9 = 1.0;
    -[UIView setAlpha:](self->_contentView, "setAlpha:", v9);
    if (self->_showAlertView)
      v7 = 1.0;
    else
      v7 = 0.0;
    alertView = self->_alertView;
    goto LABEL_19;
  }
  if (state)
    return;
  -[MRUControlCenterButton setAlpha:](self->_moreButton, "setAlpha:", 0.0);
  -[UICollectionView setAlpha:](self->_collectionView, "setAlpha:", 0.0);
  -[UIView setAlpha:](self->_containerView, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_contentView, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_alertView, "setAlpha:", 0.0);
  v4 = !self->_showRoutingButton;
LABEL_20:
  -[MRUControlCenterRouteButton setHidden:](self->_routingButton, "setHidden:", v4);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)alertView
{
  return self->_alertView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (MRUControlCenterButton)moreButton
{
  return self->_moreButton;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (MRUControlCenterRouteButton)routingButton
{
  return self->_routingButton;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (CGRect)transitionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_transitionFrame.origin.x;
  y = self->_transitionFrame.origin.y;
  width = self->_transitionFrame.size.width;
  height = self->_transitionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)showRoutingButton
{
  return self->_showRoutingButton;
}

- (BOOL)showMoreButton
{
  return self->_showMoreButton;
}

- (BOOL)showAlertView
{
  return self->_showAlertView;
}

- (UIView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_routingButton, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
