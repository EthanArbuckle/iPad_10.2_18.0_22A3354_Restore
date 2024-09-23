@implementation MRUMediaSuggestionsView

- (MRUMediaSuggestionsView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUMediaSuggestionsView *v7;
  MRUMediaSuggestionsView *v8;
  uint64_t v9;
  UICollectionView *collectionView;
  void *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)MRUMediaSuggestionsView;
  v7 = -[MRUMediaSuggestionsView initWithFrame:](&v13, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[MRUMediaSuggestionsView updateCollectionViewLayout](v7, "updateCollectionViewLayout");
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC35B8]), "initWithFrame:collectionViewLayout:", v8->_collectionViewLayout, x, y, width, height);
    collectionView = v8->_collectionView;
    v8->_collectionView = (UICollectionView *)v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v8->_collectionView, "setBackgroundColor:", v11);

    -[UICollectionView setShowsVerticalScrollIndicator:](v8->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](v8->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    v8->_contentScale = 1.0;
    -[MRUMediaSuggestionsView addSubview:](v8, "addSubview:", v8->_collectionView);
  }
  return v8;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUMediaSuggestionsView;
  -[MRUMediaSuggestionsView layoutSubviews](&v3, sel_layoutSubviews);
  -[MRUMediaSuggestionsView bounds](self, "bounds");
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double top;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  -[MRUMediaSuggestionsView itemWidthForWidth:](self, "itemWidthForWidth:", a3.width, a3.height);
  -[MRUMediaSuggestionsView itemHeightForItemWidth:](self, "itemHeightForItemWidth:");
  top = self->_contentEdgeInsets.top;
  v7 = top + v6 * (double)-[MRUMediaSuggestionsView numberOfRows](self, "numberOfRows");
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
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
  -[MRUMediaSuggestionsView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)MRUMediaSuggestionsView;
  -[MRUMediaSuggestionsView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  -[MRUMediaSuggestionsView bounds](self, "bounds");
  if (v13 != v9 || v12 != v11)
    -[MRUMediaSuggestionsView updateCollectionViewLayout](self, "updateCollectionViewLayout");
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[MRUMediaSuggestionsView updateCollectionViewLayout](self, "updateCollectionViewLayout");
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    -[MRUMediaSuggestionsView updateCollectionViewLayout](self, "updateCollectionViewLayout");
  }
}

- (void)setContentScale:(double)a3
{
  if (vabdd_f64(self->_contentScale, a3) > 2.22044605e-16)
  {
    self->_contentScale = a3;
    -[MRUMediaSuggestionsView updateCollectionViewLayout](self, "updateCollectionViewLayout");
  }
}

- (void)updateCollectionViewLayout
{
  int64_t v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  UICollectionViewCompositionalLayout *v19;
  uint64_t v20;
  UICollectionViewCompositionalLayout *collectionViewLayout;
  int64_t v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  UICollectionViewCompositionalLayout *v33;
  void *v34;
  CGRect v35;
  CGRect v36;

  if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
  {
    v22 = -[MRUMediaSuggestionsView numberOfColumns](self, "numberOfColumns");
    -[MRUMediaSuggestionsView bounds](self, "bounds");
    -[MRUMediaSuggestionsView itemWidthForWidth:](self, "itemWidthForWidth:", CGRectGetWidth(v36));
    -[MRUMediaSuggestionsView itemHeightForItemWidth:](self, "itemHeightForItemWidth:");
    v24 = v23;
    v25 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sizeWithWidthDimension:heightDimension:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v28;
    objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sizeWithWidthDimension:heightDimension:", v30, v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3350], "horizontalGroupWithLayoutSize:subitem:count:", v14, v10, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 10.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInterItemSpacing:", v32);

    objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentInsets:", self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.right);
    v17 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
    objc_msgSend(v17, "setScrollDirection:", 0);
    v33 = (UICollectionViewCompositionalLayout *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSection:configuration:", v16, v17);
    v18 = 0;
    collectionViewLayout = self->_collectionViewLayout;
    self->_collectionViewLayout = v33;
    v20 = 1;
  }
  else
  {
    v3 = -[MRUMediaSuggestionsView numberOfRows](self, "numberOfRows");
    -[MRUMediaSuggestionsView bounds](self, "bounds");
    -[MRUMediaSuggestionsView itemWidthForWidth:](self, "itemWidthForWidth:", CGRectGetWidth(v35));
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeWithWidthDimension:heightDimension:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalHeightDimension:", 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sizeWithWidthDimension:heightDimension:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3350], "verticalGroupWithLayoutSize:subitem:count:", v14, v10, v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInterGroupSpacing:", 10.0);
    objc_msgSend(v16, "setContentInsets:", self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, 0.0, self->_contentEdgeInsets.right);
    v17 = objc_alloc_init(MEMORY[0x1E0DC35D8]);
    v18 = 1;
    objc_msgSend(v17, "setScrollDirection:", 1);
    v19 = (UICollectionViewCompositionalLayout *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35D0]), "initWithSection:configuration:", v16, v17);
    v20 = 0;
    collectionViewLayout = self->_collectionViewLayout;
    self->_collectionViewLayout = v19;
  }

  -[UICollectionView setAlwaysBounceVertical:](self->_collectionView, "setAlwaysBounceVertical:", v20);
  -[UICollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", v18);

  -[UICollectionView setCollectionViewLayout:](self->_collectionView, "setCollectionViewLayout:", self->_collectionViewLayout);
  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (double)itemWidthForWidth:(double)a3
{
  double result;
  int64_t layout;
  void *v6;
  void *v7;
  double v8;
  double v9;

  MRUMediaSuggestionsVisibleItemCount(self->_layout);
  layout = self->_layout;
  if (layout)
  {
    if (layout != 1)
      return result;
    -[MRUMediaSuggestionsView traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    UIRoundToScale();

    MRUMediaSuggestionsMaxItemWidthCompact();
  }
  else if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
  {
    -[MRUMediaSuggestionsView numberOfColumns](self, "numberOfColumns");
  }
  -[MRUMediaSuggestionsView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  UIRoundToScale();
  v9 = v8;

  return v9;
}

- (double)itemHeightForItemWidth:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_suggestionsTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");

  objc_msgSend(MEMORY[0x1E0DC1350], "mru_suggestionsSubtitleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");

  -[MRUMediaSuggestionsView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  UIRoundToScale();
  v8 = v7;

  return v8;
}

- (int64_t)numberOfRows
{
  if (self->_layout)
    return 1;
  if (MRUIsSmallScreenWithScale(self->_contentScale))
    return 1;
  return 2;
}

- (int64_t)numberOfColumns
{
  if (MRUIsSmallScreenWithScale(self->_contentScale))
    return 2;
  else
    return 3;
}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (int64_t)layout
{
  return self->_layout;
}

- (BOOL)supportsHorizontalLayout
{
  return self->_supportsHorizontalLayout;
}

- (void)setSupportsHorizontalLayout:(BOOL)a3
{
  self->_supportsHorizontalLayout = a3;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentEdgeInsets.top;
  left = self->_contentEdgeInsets.left;
  bottom = self->_contentEdgeInsets.bottom;
  right = self->_contentEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end
