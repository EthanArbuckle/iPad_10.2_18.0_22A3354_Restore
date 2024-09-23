@implementation ICSEffectPickerView

- (ICSEffectPickerView)init
{
  ICSEffectPickerView *v2;
  id v3;
  UICollectionView *v4;
  UICollectionView *collectionView;
  UICollectionView *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;
  _QWORD v30[4];

  v29.receiver = self;
  v29.super_class = (Class)ICSEffectPickerView;
  v2 = -[ICSEffectPickerView init](&v29, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    objc_msgSend(v3, "setMinimumInteritemSpacing:", 2.0);
    objc_msgSend(v3, "setMinimumLineSpacing:", 2.0);
    v4 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    collectionView = v2->_collectionView;
    v2->_collectionView = v4;

    -[ICSEffectPickerView addSubview:](v2, "addSubview:", v2->_collectionView);
    -[UICollectionView setContentInset:](v2->_collectionView, "setContentInset:", 5.0, 5.0, 5.0, 5.0);
    -[UICollectionView setDelegate:](v2->_collectionView, "setDelegate:", v2);
    -[UICollectionView setDataSource:](v2->_collectionView, "setDataSource:", v2);
    -[UICollectionView setShowsVerticalScrollIndicator:](v2->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](v2->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = v2->_collectionView;
    v8 = objc_opt_class(ICSEffectPickerViewCell, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICSEffectPickerViewCell reuseIdentifier](ICSEffectPickerViewCell, "reuseIdentifier"));
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v6, "registerClass:forCellWithReuseIdentifier:", v8, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](v2->_collectionView, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView topAnchor](v2, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](v2->_collectionView, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView bottomAnchor](v2, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leftAnchor](v2->_collectionView, "leftAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView leftAnchor](v2, "leftAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView rightAnchor](v2->_collectionView, "rightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView rightAnchor](v2, "rightAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));

    v30[0] = v12;
    v30[1] = v15;
    v30[2] = v18;
    v30[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    v23 = objc_alloc_init((Class)UIView);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v23, "setBackgroundColor:", v24);

    objc_msgSend(v23, "setAlpha:", 0.5);
    -[UICollectionView setBackgroundView:](v2->_collectionView, "setBackgroundView:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](v2->_collectionView, "setBackgroundColor:", v25);

    -[UICollectionView setAllowsMultipleSelection:](v2->_collectionView, "setAllowsMultipleSelection:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView layer](v2, "layer"));
    objc_msgSend(v26, "setMasksToBounds:", 1);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView layer](v2, "layer"));
    objc_msgSend(v27, "setCornerRadius:", 10.0);

  }
  return v2;
}

- (void)setDataSource:(id)a3
{
  ICSEffectPickerViewDataSource **p_dataSource;
  id v5;
  NSArray *v6;
  NSArray *effects;
  void *v8;
  id v9;

  p_dataSource = &self->_dataSource;
  v9 = a3;
  v5 = objc_storeWeak((id *)p_dataSource, v9);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "videoEffectsForEffectPickerView:", self));

  effects = self->_effects;
  self->_effects = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView collectionView](self, "collectionView"));
  objc_msgSend(v8, "reloadData");

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICSEffectPickerViewCell reuseIdentifier](ICSEffectPickerViewCell, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView effects](self, "effects"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
  objc_msgSend(v9, "setVideoEffect:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));
  objc_msgSend(v9, "setSelected:", objc_msgSend(v12, "containsObject:", v7));

  if (objc_msgSend(v9, "isSelected"))
    objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView effects](self, "effects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
  objc_msgSend(v8, "effectPickerView:didSelectVideoEffect:", self, v10);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v16));
        objc_msgSend(v17, "setSelected:", 0);

        objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v16, 0);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView effects](self, "effects"));
  v7 = objc_msgSend(v5, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));
  objc_msgSend(v9, "effectPickerView:didDeselectVideoEffect:", self, v8);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerView effects](self, "effects", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[ICSEffectPickerView bounds](self, "bounds", a3, a4, a5);
  v6 = (double)(uint64_t)(v5 + -10.0);
  v7 = v6;
  result.height = v7;
  result.width = v6;
  return result;
}

- (ICSEffectPickerViewDelegate)delegate
{
  return (ICSEffectPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ICSEffectPickerViewDataSource)dataSource
{
  return (ICSEffectPickerViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (NSArray)effects
{
  return self->_effects;
}

- (void)setEffects:(id)a3
{
  objc_storeStrong((id *)&self->_effects, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effects, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
