@implementation AKColorPaletteView

- (AKColorPaletteView)initWithCoder:(id)a3
{
  AKColorPaletteView *v3;
  AKColorPaletteView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKColorPaletteView;
  v3 = -[AKColorPaletteView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AKColorPaletteView _commonInit](v3, "_commonInit");
  return v4;
}

- (AKColorPaletteView)initWithFrame:(CGRect)a3
{
  AKColorPaletteView *v3;
  AKColorPaletteView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKColorPaletteView;
  v3 = -[AKColorPaletteView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AKColorPaletteView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[9];

  v30[8] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v3;
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v4;
  objc_msgSend(MEMORY[0x24BDF6950], "akColorPickerPurple");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v5;
  objc_msgSend(MEMORY[0x24BDF6950], "akColorPickerBlue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v6;
  objc_msgSend(MEMORY[0x24BDF6950], "akColorPickerGreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v7;
  objc_msgSend(MEMORY[0x24BDF6950], "akColorPickerYellow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v8;
  objc_msgSend(MEMORY[0x24BDF6950], "akColorPickerOrange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v9;
  objc_msgSend(MEMORY[0x24BDF6950], "akColorPickerRed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKColorPaletteView setColors:](self, "setColors:", v11);

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setScrollDirection:", 0);
  objc_msgSend(v12, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend(v12, "setMinimumLineSpacing:", 0.0);
  -[AKColorPaletteView _itemSizeInContainer](self, "_itemSizeInContainer");
  objc_msgSend(v12, "setItemSize:");
  v13 = objc_alloc(MEMORY[0x24BDF68D8]);
  -[AKColorPaletteView frame](self, "frame");
  v14 = (void *)objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v12);
  -[AKColorPaletteView setCollectionView:](self, "setCollectionView:", v14);

  -[AKColorPaletteView collectionView](self, "collectionView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKColorPaletteView collectionView](self, "collectionView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);

  -[AKColorPaletteView collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDataSource:", self);

  -[AKColorPaletteView collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPagingEnabled:", 1);

  -[AKColorPaletteView collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShowsHorizontalScrollIndicator:", 0);

  -[AKColorPaletteView collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShowsVerticalScrollIndicator:", 0);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKColorPaletteView collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v21);

  -[AKColorPaletteView collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("AnnotationKit.colorPickerReuseIdentifier"));

  -[AKColorPaletteView collectionView](self, "collectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKColorPaletteView addSubview:](self, "addSubview:", v24);

  _NSDictionaryOfVariableBindings(CFSTR("_collectionView"), self->_collectionView, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_collectionView]|"), 0, 0, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v27);

  v28 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_collectionView]|"), 0, 0, v25);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v29);

}

- (void)setScrollDirection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  self->_scrollDirection = a3;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setScrollDirection:", self->_scrollDirection);
  objc_msgSend(v8, "setMinimumInteritemSpacing:", 0.0);
  objc_msgSend(v8, "setMinimumLineSpacing:", 0.0);
  if (-[AKColorPaletteView scrollDirection](self, "scrollDirection"))
  {
    objc_msgSend(v8, "setSectionInset:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    -[AKColorPaletteView colors](self, "colors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reverseObjectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKColorPaletteView setColors:](self, "setColors:", v6);

  }
  else
  {
    objc_msgSend(v8, "setSectionInset:", 4.0, 4.0, 4.0, 4.0);
  }
  -[AKColorPaletteView _itemSizeInContainer](self, "_itemSizeInContainer");
  objc_msgSend(v8, "setItemSize:");
  -[AKColorPaletteView collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCollectionViewLayout:animated:", v8, 0);

}

- (void)layoutSubviews
{
  void *v3;
  id v4;

  -[AKColorPaletteView collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[AKColorPaletteView _itemSizeInContainer](self, "_itemSizeInContainer");
  objc_msgSend(v4, "setItemSize:");

}

- (void)scrollToCurrentColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[AKColorPaletteView color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKColorPaletteView color](self, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKColorPaletteView _indexPathOfColor:](self, "_indexPathOfColor:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, objc_msgSend(v7, "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[AKColorPaletteView collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scrollToItemAtIndexPath:atScrollPosition:animated:", v5, 8, 0);

    }
  }
}

- (void)setColor:(id)a3
{
  UIColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIColor *v11;

  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v11 = v5;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKColorPaletteView _indexPathOfColor:](self, "_indexPathOfColor:", self->_color);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKColorPaletteView _indexPathOfColor:](self, "_indexPathOfColor:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_color, a3);
    if (v7)
      objc_msgSend(v6, "addObject:", v7);
    if (v8)
      objc_msgSend(v6, "addObject:", v8);
    if (objc_msgSend(v6, "count"))
    {
      -[AKColorPaletteView collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadItemsAtIndexPaths:", v10);

    }
    v5 = v11;
  }

}

- (CGSize)_itemSizeInContainer
{
  void *v3;
  unint64_t v4;
  BOOL IsEmpty;
  double v6;
  double Height;
  double Width;
  double v9;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[AKColorPaletteView colors](self, "colors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[AKColorPaletteView frame](self, "frame");
  IsEmpty = CGRectIsEmpty(v13);
  v6 = 24.0;
  Height = 24.0;
  if (!IsEmpty)
  {
    -[AKColorPaletteView frame](self, "frame", 24.0);
    Height = CGRectGetHeight(v14);
    -[AKColorPaletteView frame](self, "frame");
    Width = CGRectGetWidth(v15);
    if (-[AKColorPaletteView scrollDirection](self, "scrollDirection"))
    {
      v9 = (Width + (double)v4 * -24.0) / (double)v4;
      if (v9 <= 0.0)
        v6 = 24.0;
      else
        v6 = v9 + 24.0;
    }
    else
    {
      v6 = Width + -8.0;
      v10 = (Height + -8.0 + (double)v4 * -39.0) / (double)v4;
      if (v10 <= 4.0)
        Height = 43.0;
      else
        Height = v10 + 39.0;
    }
  }
  v11 = Height;
  result.height = v11;
  result.width = v6;
  return result;
}

- (id)_indexPathOfColor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AKColorPaletteView colors](self, "colors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
  {

LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v7 = v6;
  v8 = *(_QWORD *)v16;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (objc_msgSend(v4, "akIsEqualToColor:", v11))
      {
        -[AKColorPaletteView colors](self, "colors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v12, "indexOfObject:", v11);

      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v7);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  -[AKColorPaletteView colors](self, "colors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKColorPaletteView setColor:](self, "setColor:", v8);

  -[AKColorPaletteView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AKColorPaletteView colors](self, "colors", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int64_t v26;
  double v27;
  void *v28;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("AnnotationKit.colorPickerReuseIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewWithTag:", 1001);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && !v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
    objc_msgSend(v9, "setContentMode:", 9);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "setTag:", 1001);
    objc_msgSend(v9, "setClipsToBounds:", 0);
    objc_msgSend(v7, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v9);

    v11 = -[AKColorPaletteView scrollDirection](self, "scrollDirection");
    v12 = 39.0;
    if (v11)
      v12 = 24.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("imageView, size"), v9, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[imageView(size)]"), 0, v14, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

    v17 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[imageView(size)]"), 0, v14, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v18);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 9, 0, v7, 9, 1.0, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 10, 0, v7, 10, 1.0, 0.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

  }
  -[AKColorPaletteView colors](self, "colors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v6, "row");

  objc_msgSend(v21, "objectAtIndexedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKColorPaletteView color](self, "color");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "akIsEqualToColor:", v23);

  v26 = -[AKColorPaletteView scrollDirection](self, "scrollDirection");
  v27 = 39.0;
  if (v26)
    v27 = 24.0;
  objc_msgSend(MEMORY[0x24BDF6AC8], "ak_colorSwatchPickerImageWithColor:size:selected:", v23, v25, v27, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v28);

  return v7;
}

- (BOOL)wantsInkUpdate
{
  return 1;
}

- (UIColor)color
{
  return self->_color;
}

- (int64_t)scrollDirection
{
  return self->_scrollDirection;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_storeStrong((id *)&self->_colors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
