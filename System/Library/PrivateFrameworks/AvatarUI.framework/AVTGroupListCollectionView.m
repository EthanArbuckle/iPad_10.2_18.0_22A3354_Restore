@implementation AVTGroupListCollectionView

- (AVTGroupListCollectionView)initWithGroupItems:(id)a3 environment:(id)a4
{
  id v6;
  AVTGroupListCollectionView *v7;
  AVTGroupListCollectionView *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVTGroupListCollectionView;
  v7 = -[AVTGroupListCollectionView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_groupItems, a3);
    -[AVTGroupListCollectionView setupView](v8, "setupView");
    -[AVTGroupListCollectionView setupBorder](v8, "setupBorder");
  }

  return v8;
}

- (void)setupBorder
{
  CALayer *v3;
  CALayer *border;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v3 = (CALayer *)objc_claimAutoreleasedReturnValue();
  border = self->_border;
  self->_border = v3;

  +[AVTUIColorRepository separatorColor](AVTUIColorRepository, "separatorColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](self->_border, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  -[AVTGroupListCollectionView layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSublayer:", self->_border);

}

- (void)setupView
{
  id v3;
  UICollectionView *v4;
  UICollectionView *collectionView;
  void *v6;
  UICollectionView *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0CEA450]);
  objc_msgSend(v10, "setSectionInset:", 10.0, 10.0, 10.0, 10.0);
  objc_msgSend(v10, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend(v10, "setMinimumLineSpacing:", 0.0);
  v3 = objc_alloc(MEMORY[0x1E0CEA410]);
  -[AVTGroupListCollectionView bounds](self, "bounds");
  v4 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v10);
  collectionView = self->_collectionView;
  self->_collectionView = v4;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v6);

  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setContentInsetAdjustmentBehavior:](self->_collectionView, "setContentInsetAdjustmentBehavior:", 2);
  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 18);
  v7 = self->_collectionView;
  v8 = objc_opt_class();
  +[AVTGroupListCollectionViewCell cellIdentifier](AVTGroupListCollectionViewCell, "cellIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](v7, "registerClass:forCellWithReuseIdentifier:", v8, v9);

  -[AVTGroupListCollectionView addSubview:](self, "addSubview:", self->_collectionView);
}

- (double)borderWidth
{
  return AVTRoundToViewScale(self, 1.0);
}

- (void)layoutSubviews
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
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Height;
  void *v22;
  objc_super v23;
  CGRect v24;

  v23.receiver = self;
  v23.super_class = (Class)AVTGroupListCollectionView;
  -[AVTGroupListCollectionView layoutSubviews](&v23, sel_layoutSubviews);
  -[AVTGroupListCollectionView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTGroupListCollectionView updateCollectionLayoutItemSize:](self, "updateCollectionLayoutItemSize:", v4);

  -[AVTGroupListCollectionView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[AVTGroupListCollectionView collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  -[AVTGroupListCollectionView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0.0;
  if (objc_msgSend(v14, "layoutDirection") != 1)
  {
    -[AVTGroupListCollectionView bounds](self, "bounds");
    v17 = v16;
    -[AVTGroupListCollectionView borderWidth](self, "borderWidth");
    v15 = v17 - v18;
  }

  -[AVTGroupListCollectionView borderWidth](self, "borderWidth");
  v20 = v19;
  -[AVTGroupListCollectionView bounds](self, "bounds");
  Height = CGRectGetHeight(v24);
  -[AVTGroupListCollectionView border](self, "border");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, 0.0, v20, Height);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTGroupListCollectionView;
  v4 = a3;
  -[AVTGroupListCollectionView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  +[AVTUIColorRepository separatorColor](AVTUIColorRepository, "separatorColor", v10.receiver, v10.super_class);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CALayer setBackgroundColor:](self->_border, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  v6 = objc_msgSend(v4, "userInterfaceStyle");
  -[AVTGroupListCollectionView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceStyle");

  if (v6 != v8)
  {
    -[AVTGroupListCollectionView collectionView](self, "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");

  }
}

- (void)updateCollectionLayoutItemSize:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  -[AVTGroupListCollectionView bounds](self, "bounds");
  v5 = v4;
  objc_msgSend(v9, "sectionInset");
  v7 = v6;
  objc_msgSend(v9, "sectionInset");
  objc_msgSend(v9, "setEstimatedItemSize:", v5 - (v7 + v8), 10.0);
  objc_msgSend(v9, "invalidateLayout");

}

- (void)reloadData
{
  id v2;

  -[AVTGroupListCollectionView collectionView](self, "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)setSelectedGroupIndex:(int64_t)a3 animated:(BOOL)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTGroupListCollectionView collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectItemAtIndexPath:animated:scrollPosition:", v6, 1, 2);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AVTGroupListCollectionView groupItems](self, "groupItems", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  +[AVTGroupListCollectionViewCell cellIdentifier](AVTGroupListCollectionViewCell, "cellIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTGroupListCollectionView groupItems](self, "groupItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "item");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "localizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v13);

  objc_msgSend(v12, "symbolNameProvider");
  v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[AVTGroupListCollectionView traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, objc_msgSend(v15, "userInterfaceStyle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSymbolName:", v16);

  return v9;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  -[AVTGroupListCollectionView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "item");

  objc_msgSend(v7, "groupPicker:didDeselectGroupAtIndex:", self, v6);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  -[AVTGroupListCollectionView delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "item");

  objc_msgSend(v7, "groupPicker:didSelectGroupAtIndex:tapped:", self, v6, 1);
}

- (AVTGroupPickerDelegate)delegate
{
  return (AVTGroupPickerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSArray)groupItems
{
  return self->_groupItems;
}

- (int64_t)selectedGroupIndex
{
  return self->selectedGroupIndex;
}

- (void)setSelectedGroupIndex:(int64_t)a3
{
  self->selectedGroupIndex = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (CALayer)border
{
  return self->_border;
}

- (void)setBorder:(id)a3
{
  objc_storeStrong((id *)&self->_border, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_border, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_groupItems, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
