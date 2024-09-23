@implementation MRUMediaControlsModuleView

- (MRUMediaControlsModuleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUMediaControlsModuleView *v7;
  UICollectionViewFlowLayout *v8;
  UICollectionViewFlowLayout *collectionViewLayout;
  double v10;
  uint64_t v11;
  UICollectionView *collectionView;
  void *v13;
  MRUMediaControlsModuleMoreButton *v14;
  MRUMediaControlsModuleMoreButton *moreButton;
  MRUMediaControlsModuleBackgroundView *v16;
  MRUMediaControlsModuleBackgroundView *backgroundView;
  MRUMediaControlsModuleContainerView *v18;
  MRUMediaControlsModuleContainerView *containerView;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)MRUMediaControlsModuleView;
  v7 = -[MRUMediaControlsModuleView initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E0DC3610]);
    collectionViewLayout = v7->_collectionViewLayout;
    v7->_collectionViewLayout = v8;

    CCUILayoutGutter();
    -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v7->_collectionViewLayout, "setMinimumInteritemSpacing:");
    v10 = MRUExpandedTallWidth();
    -[UICollectionViewFlowLayout setItemSize:](v7->_collectionViewLayout, "setItemSize:", v10, MEMORY[0x1AF423F90]());
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v7->_collectionViewLayout, x, y, width, height);
    collectionView = v7->_collectionView;
    v7->_collectionView = (UICollectionView *)v11;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v7->_collectionView, "setBackgroundColor:", v13);

    -[UICollectionView setShowsVerticalScrollIndicator:](v7->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](v7->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setAlwaysBounceVertical:](v7->_collectionView, "setAlwaysBounceVertical:", 1);
    -[MRUMediaControlsModuleView addSubview:](v7, "addSubview:", v7->_collectionView);
    v14 = objc_alloc_init(MRUMediaControlsModuleMoreButton);
    moreButton = v7->_moreButton;
    v7->_moreButton = v14;

    -[MRUMediaControlsModuleView addSubview:](v7, "addSubview:", v7->_moreButton);
    v16 = objc_alloc_init(MRUMediaControlsModuleBackgroundView);
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = v16;

    -[MRUMediaControlsModuleView addSubview:](v7, "addSubview:", v7->_backgroundView);
    v18 = objc_alloc_init(MRUMediaControlsModuleContainerView);
    containerView = v7->_containerView;
    v7->_containerView = v18;

    -[MRUMediaControlsModuleView addSubview:](v7, "addSubview:", v7->_containerView);
    v7->_contentScale = 1.0;
    -[MRUMediaControlsModuleBackgroundView stylingProvider](v7->_backgroundView, "stylingProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUMediaControlsModuleView setStylingProvider:](v7, "setStylingProvider:", v20);

    -[MRUMediaControlsModuleView updateVisibility](v7, "updateVisibility");
  }
  return v7;
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
  id *p_moreButton;
  MRUMediaControlsModuleMoreButton *moreButton;
  double Width;
  double v14;
  unsigned int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  MRUMediaControlsModuleMoreButton *v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  MRUMediaControlsModuleMoreButton *v47;
  double v48;
  double v49;
  uint64_t v50;
  CGFloat x;
  CGFloat y;
  CGFloat v53;
  CGFloat height;
  MRUMediaControlsModuleMoreButton *v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  double v63;
  double MinX;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  MRUMediaControlsModuleMoreButton *v69;
  double v70;
  double v71;
  double v72;
  objc_super v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v73.receiver = self;
  v73.super_class = (Class)MRUMediaControlsModuleView;
  -[MRUMediaControlsModuleView layoutSubviews](&v73, sel_layoutSubviews);
  -[MRUMediaControlsModuleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CCUICAPackageView setFrame:](self->_previewView, "setFrame:");
  switch(self->_layout)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      -[MRUMediaControlsModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v4, v6, v8, v10);
      -[MRUMediaControlsModuleContainerView setFrame:](self->_containerView, "setFrame:", v4, v6, v8, v10);
      -[UIView setFrame:](self->_alertView, "setFrame:", v4, v6, v8, v10);
      p_moreButton = (id *)&self->_moreButton;
      moreButton = self->_moreButton;
      v74.origin.x = v4;
      v74.origin.y = v6;
      v74.size.width = v8;
      v74.size.height = v10;
      Width = CGRectGetWidth(v74);
      v14 = Width - MEMORY[0x1AF423F90]();
      -[MRUMediaControlsModuleMoreButton sizeThatFits:](moreButton, "sizeThatFits:", v14, MEMORY[0x1AF423F90]());
      v75.origin.x = v4;
      v75.origin.y = v6;
      v75.size.width = v8;
      v75.size.height = v10;
      CGRectGetMaxY(v75);
      goto LABEL_9;
    case 1:
      -[MRUMediaControlsModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:", self->_transitionFrame.origin.x, self->_transitionFrame.origin.y, self->_transitionFrame.size.width, self->_transitionFrame.size.height);
      -[MRUMediaControlsModuleContainerView setFrame:](self->_containerView, "setFrame:", self->_transitionFrame.origin.x, self->_transitionFrame.origin.y, self->_transitionFrame.size.width, self->_transitionFrame.size.height);
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v4, v6, v8, v10);
      -[UIView setFrame:](self->_alertView, "setFrame:", v4, v6, v8, v10);
      CCUINumberOfRowsForGridSizeClass();
      v89.origin.x = v4;
      v89.origin.y = v6;
      v89.size.width = v8;
      v89.size.height = v10;
      CGRectGetHeight(v89);
      MEMORY[0x1AF423F90]();
      CCUILayoutGutter();
      v50 = CCUILayoutGutter();
      MEMORY[0x1AF423F90](v50);
      UIRectInset();
      x = v90.origin.x;
      y = v90.origin.y;
      v53 = v90.size.width;
      height = v90.size.height;
      p_moreButton = (id *)&self->_moreButton;
      v55 = self->_moreButton;
      v56 = CGRectGetWidth(v90);
      v57 = v56 - MEMORY[0x1AF423F90]();
      -[MRUMediaControlsModuleMoreButton sizeThatFits:](v55, "sizeThatFits:", v57, MEMORY[0x1AF423F90]());
      v91.origin.x = x;
      v91.origin.y = y;
      v91.size.width = v53;
      v91.size.height = height;
      CGRectGetMinX(v91);
      v92.origin.x = x;
      v92.origin.y = y;
      v92.size.width = v53;
      v92.size.height = height;
      CGRectGetMaxY(v92);
      goto LABEL_9;
    case 2:
      -[MRUMediaControlsModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:", self->_transitionFrame.origin.x, self->_transitionFrame.origin.y, self->_transitionFrame.size.width, self->_transitionFrame.size.height);
      -[MRUMediaControlsModuleContainerView setFrame:](self->_containerView, "setFrame:", self->_transitionFrame.origin.x, self->_transitionFrame.origin.y, self->_transitionFrame.size.width, self->_transitionFrame.size.height);
      v58 = MRUExpandedTallWidth();
      v93.origin.x = v4;
      v93.origin.y = v6;
      v93.size.width = v8;
      v93.size.height = v10;
      CGRectGetWidth(v93);
      UIRectInset();
      v59 = v94.origin.x;
      v60 = v94.origin.y;
      v61 = v94.size.width;
      v62 = v94.size.height;
      v63 = CGRectGetHeight(v94);
      v95.origin.x = v59;
      v95.origin.y = v60;
      v95.size.width = v61;
      v95.size.height = v62;
      MinX = CGRectGetMinX(v95);
      v96.origin.x = v59;
      v96.origin.y = v60;
      v96.size.width = v61;
      v96.size.height = v62;
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:", MinX, CGRectGetMinY(v96), v58, v63);
      CCUINumberOfRowsForGridSizeClass();
      v97.origin.x = v59;
      v97.origin.y = v60;
      v97.size.width = v61;
      v97.size.height = v62;
      CGRectGetHeight(v97);
      MEMORY[0x1AF423F90]();
      CCUILayoutGutter();
      UIRectInset();
      v65 = v98.origin.x;
      v66 = v98.origin.y;
      v67 = v98.size.width;
      v68 = v98.size.height;
      p_moreButton = (id *)&self->_moreButton;
      v69 = self->_moreButton;
      v70 = CGRectGetWidth(v98);
      v71 = v70 - MEMORY[0x1AF423F90]();
      -[MRUMediaControlsModuleMoreButton sizeThatFits:](v69, "sizeThatFits:", v71, MEMORY[0x1AF423F90]());
      v99.origin.x = v65;
      v99.origin.y = v66;
      v99.size.width = v67;
      v99.size.height = v68;
      CGRectGetMaxY(v99);
      goto LABEL_9;
    case 6:
    case 8:
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v4, v6, v8, v10);
      CCUINumberOfRowsForGridSizeClass();
      v85.origin.x = v4;
      v85.origin.y = v6;
      v85.size.width = v8;
      v85.size.height = v10;
      CGRectGetHeight(v85);
      MEMORY[0x1AF423F90]();
      CCUILayoutGutter();
      v38 = CCUILayoutGutter();
      MEMORY[0x1AF423F90](v38);
      UIRectInset();
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      -[MRUMediaControlsModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:");
      -[MRUMediaControlsModuleContainerView setFrame:](self->_containerView, "setFrame:", v40, v42, v44, v46);
      -[UIView setFrame:](self->_alertView, "setFrame:", v40, v42, v44, v46);
      p_moreButton = (id *)&self->_moreButton;
      v47 = self->_moreButton;
      v86.origin.x = v40;
      v86.origin.y = v42;
      v86.size.width = v44;
      v86.size.height = v46;
      v48 = CGRectGetWidth(v86);
      v49 = v48 - MEMORY[0x1AF423F90]();
      -[MRUMediaControlsModuleMoreButton sizeThatFits:](v47, "sizeThatFits:", v49, MEMORY[0x1AF423F90]());
      v87.origin.x = v40;
      v87.origin.y = v42;
      v87.size.width = v44;
      v87.size.height = v46;
      CGRectGetMinX(v87);
      v88.origin.x = v40;
      v88.origin.y = v42;
      v88.size.width = v44;
      v88.size.height = v46;
      CGRectGetMaxY(v88);
LABEL_9:
      UIRectCenteredXInRect();
      goto LABEL_10;
    case 7:
    case 9:
      v15 = CCUINumberOfRowsForGridSizeClass();
      CCUINumberOfColumnsForGridSizeClass();
      v76.origin.x = v4;
      v76.origin.y = v6;
      v76.size.width = v8;
      v76.size.height = v10;
      v16 = CGRectGetHeight(v76);
      v17 = MEMORY[0x1AF423F90]();
      CCUILayoutGutter();
      v72 = (v16 - (v18 * (double)(int)(v15 - 1) + v17 * (double)v15)) * 0.5;
      v77.origin.x = v4;
      v77.origin.y = v6;
      v77.size.width = v8;
      v77.size.height = v10;
      CGRectGetWidth(v77);
      MEMORY[0x1AF423F90]();
      CCUILayoutGutter();
      MRUExpandedTallWidth();
      v78.origin.x = v4;
      v78.origin.y = v6;
      v78.size.width = v8;
      v78.size.height = v10;
      CGRectGetHeight(v78);
      v79.origin.x = v4;
      v79.origin.y = v6;
      v79.size.width = v8;
      v79.size.height = v10;
      CGRectGetMinY(v79);
      UIRectCenteredXInRect();
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
      UIRectInset();
      v19 = v80.origin.x;
      v20 = v80.origin.y;
      v21 = v80.size.width;
      v22 = v80.size.height;
      v23 = self->_moreButton;
      v24 = CGRectGetWidth(v80);
      v25 = v24 - MEMORY[0x1AF423F90]();
      -[MRUMediaControlsModuleMoreButton sizeThatFits:](v23, "sizeThatFits:", v25, MEMORY[0x1AF423F90]());
      v81.origin.x = v19;
      v81.origin.y = v20;
      v81.size.width = v21;
      v81.size.height = v22;
      CGRectGetMaxY(v81);
      UIRectCenteredXInRect();
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      -[MRUMediaControlsModuleMoreButton setFrame:](self->_moreButton, "setFrame:");
      if (self->_showMoreButton)
      {
        v82.origin.x = v27;
        v82.origin.y = v29;
        v82.size.width = v31;
        v82.size.height = v33;
        CGRectGetHeight(v82);
        UIRectInset();
        v19 = v34;
        v20 = v35;
        v21 = v36;
        v22 = v37;
      }
      -[MRUMediaControlsModuleBackgroundView setFrame:](self->_backgroundView, "setFrame:", v19, v20, v21, v22, *(_QWORD *)&v72);
      -[MRUMediaControlsModuleContainerView setFrame:](self->_containerView, "setFrame:", v19, v20, v21, v22);
      v83.origin.x = v19;
      v83.origin.y = v20;
      v83.size.width = v21;
      v83.size.height = v22;
      CGRectGetHeight(v83);
      v84.origin.x = v19;
      v84.origin.y = v20;
      v84.size.width = v21;
      v84.size.height = v22;
      CGRectGetMinY(v84);
      UIRectCenteredXInRect();
      p_moreButton = (id *)&self->_alertView;
LABEL_10:
      objc_msgSend(*p_moreButton, "setFrame:");
      break;
    default:
      return;
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
  -[MRUMediaControlsModuleView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MRUMediaControlsModuleView;
  -[MRUMediaControlsModuleView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  -[MRUMediaControlsModuleView bounds](self, "bounds");
  if (v13 != v9 || v12 != v11)
    -[MRUMediaControlsModuleView updateCollectionViewContentInset](self, "updateCollectionViewContentInset");
}

- (void)setAlertView:(id)a3
{
  UIView *v5;
  UIView *alertView;
  UIView *v7;

  v5 = (UIView *)a3;
  alertView = self->_alertView;
  if (alertView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](alertView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_alertView, a3);
    -[MRUMediaControlsModuleView addSubview:](self, "addSubview:", self->_alertView);
    -[MRUMediaControlsModuleView setNeedsLayout](self, "setNeedsLayout");
    -[MRUMediaControlsModuleView updateVisibility](self, "updateVisibility");
    v5 = v7;
  }

}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;

  v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUMediaControlsModuleContainerView setStylingProvider:](self->_containerView, "setStylingProvider:", v5);
    -[MRUMediaControlsModuleMoreButton setStylingProvider:](self->_moreButton, "setStylingProvider:", v5);
  }

}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUMediaControlsModuleContainerView setLayout:](self->_containerView, "setLayout:");
    -[MRUMediaControlsModuleBackgroundView setLayout:](self->_backgroundView, "setLayout:", a3);
    -[MRUMediaControlsModuleView updateVisibility](self, "updateVisibility");
    -[MRUMediaControlsModuleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTransitioning:(BOOL)a3
{
  if (self->_transitioning != a3)
  {
    self->_transitioning = a3;
    -[MRUMediaControlsModuleView updateVisibility](self, "updateVisibility");
  }
}

- (void)setTransitionFrame:(CGRect)a3
{
  self->_transitionFrame = a3;
  -[MRUMediaControlsModuleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[MRUMediaControlsModuleBackgroundView setCornerRadius:](self->_backgroundView, "setCornerRadius:");
  -[MRUMediaControlsModuleContainerView _setContinuousCornerRadius:](self->_containerView, "_setContinuousCornerRadius:", a3);
}

- (void)setShowMoreButton:(BOOL)a3
{
  if (self->_showMoreButton != a3)
  {
    self->_showMoreButton = a3;
    -[MRUMediaControlsModuleView updateVisibility](self, "updateVisibility");
    -[MRUMediaControlsModuleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShowAlertView:(BOOL)a3
{
  if (self->_showAlertView != a3)
  {
    self->_showAlertView = a3;
    -[MRUMediaControlsModuleView updateVisibility](self, "updateVisibility");
    -[MRUMediaControlsModuleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentMetrics:(id)a3
{
  double v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_contentMetrics, a3);
  -[MRUMediaControlsModuleContainerView setContentMetrics:](self->_containerView, "setContentMetrics:", v6);
  if (v6)
    objc_msgSend(v6, "symbolScaleFactor");
  else
    v5 = 1.0;
  -[MRUMediaControlsModuleView setContentScale:](self, "setContentScale:", v5);

}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUMediaControlsModuleBackgroundView setContentScale:](self->_backgroundView, "setContentScale:", a3);
    -[MRUMediaControlsModuleMoreButton setContentScale:](self->_moreButton, "setContentScale:", a3);
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
  -[MRUMediaControlsModuleView bounds](self, "bounds");
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

- (void)setShowPreviewView:(BOOL)a3
{
  CCUICAPackageView *v4;
  CCUICAPackageView *previewView;
  void *v6;
  CCUICAPackageView *v7;

  if (self->_showPreviewView != a3)
  {
    self->_showPreviewView = a3;
    if (a3)
    {
      v4 = (CCUICAPackageView *)objc_alloc_init(MEMORY[0x1E0D14770]);
      previewView = self->_previewView;
      self->_previewView = v4;

      +[MRUAssetsProvider packageDescriptionWithName:](MRUAssetsProvider, "packageDescriptionWithName:", CFSTR("NowPlayingPreview2x2"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUICAPackageView setPackageDescription:](self->_previewView, "setPackageDescription:", v6);

      -[CCUICAPackageView setScale:](self->_previewView, "setScale:", 0.333333333);
      -[MRUMediaControlsModuleView addSubview:](self, "addSubview:", self->_previewView);
    }
    else
    {
      -[CCUICAPackageView removeFromSuperview](self->_previewView, "removeFromSuperview");
      v7 = self->_previewView;
      self->_previewView = 0;

    }
    -[MRUMediaControlsModuleView updateVisibility](self, "updateVisibility");
    -[MRUMediaControlsModuleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateVisibility
{
  _BOOL4 showPreviewView;
  MRUMediaControlsModuleBackgroundView *backgroundView;
  double v5;
  UIView *alertView;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  showPreviewView = self->_showPreviewView;
  backgroundView = self->_backgroundView;
  if (showPreviewView)
  {
    -[MRUMediaControlsModuleBackgroundView setShowMaterialOnly:](backgroundView, "setShowMaterialOnly:", 1);
    -[MRUMediaControlsModuleBackgroundView setAlpha:](self->_backgroundView, "setAlpha:", 1.0);
    v5 = 0.0;
    -[MRUMediaControlsModuleContainerView setAlpha:](self->_containerView, "setAlpha:", 0.0);
    alertView = self->_alertView;
LABEL_3:
    -[UIView setAlpha:](alertView, "setAlpha:", 0.0);
    v7 = 0.0;
LABEL_4:
    -[MRUMediaControlsModuleMoreButton setAlpha:](self->_moreButton, "setAlpha:", v5);
    -[UICollectionView setAlpha:](self->_collectionView, "setAlpha:", v7);
  }
  else
  {
    -[MRUMediaControlsModuleBackgroundView setShowMaterialOnly:](backgroundView, "setShowMaterialOnly:", 0);
    switch(self->_layout)
    {
      case 0:
      case 3:
      case 4:
      case 5:
        -[MRUMediaControlsModuleBackgroundView setAlpha:](self->_backgroundView, "setAlpha:", 1.0);
        -[MRUMediaControlsModuleContainerView setAlpha:](self->_containerView, "setAlpha:", 1.0);
        alertView = self->_alertView;
        v5 = 0.0;
        goto LABEL_3;
      case 1:
      case 2:
        v7 = 1.0;
        v5 = 0.0;
        if (self->_transitioning)
          v10 = 1.0;
        else
          v10 = 0.0;
        -[MRUMediaControlsModuleBackgroundView setAlpha:](self->_backgroundView, "setAlpha:", v10);
        if (self->_transitioning)
          v11 = 1.0;
        else
          v11 = 0.0;
        -[MRUMediaControlsModuleContainerView setAlpha:](self->_containerView, "setAlpha:", v11);
        -[UIView setAlpha:](self->_alertView, "setAlpha:", 0.0);
        goto LABEL_4;
      case 6:
      case 7:
      case 8:
      case 9:
        -[MRUMediaControlsModuleBackgroundView setAlpha:](self->_backgroundView, "setAlpha:", 1.0);
        v5 = 0.0;
        if (self->_showAlertView)
          v8 = 0.0;
        else
          v8 = 1.0;
        -[MRUMediaControlsModuleContainerView setAlpha:](self->_containerView, "setAlpha:", v8);
        if (self->_showAlertView)
          v9 = 1.0;
        else
          v9 = 0.0;
        -[UIView setAlpha:](self->_alertView, "setAlpha:", v9);
        v7 = 0.0;
        if (self->_showMoreButton)
        {
          if (self->_showAlertView)
            v5 = 0.0;
          else
            v5 = 1.0;
        }
        goto LABEL_4;
      default:
        return;
    }
  }
}

- (MRUMediaControlsModuleBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (MRUMediaControlsModuleContainerView)containerView
{
  return self->_containerView;
}

- (MRUMediaControlsModuleMoreButton)moreButton
{
  return self->_moreButton;
}

- (UIView)alertView
{
  return self->_alertView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
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

- (BOOL)showMoreButton
{
  return self->_showMoreButton;
}

- (BOOL)showAlertView
{
  return self->_showAlertView;
}

- (BOOL)showPreviewView
{
  return self->_showPreviewView;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (CCUICAPackageView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_previewView, a3);
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_contentMetrics, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
