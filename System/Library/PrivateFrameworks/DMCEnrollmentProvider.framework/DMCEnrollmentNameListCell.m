@implementation DMCEnrollmentNameListCell

- (DMCEnrollmentNameListCell)initWithNames:(id)a3 numberOfColumns:(unint64_t)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  DMCEnrollmentNameListCell *v9;
  void *v10;
  uint64_t v11;
  NSArray *names;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id location;
  objc_super v28;
  uint64_t v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)DMCEnrollmentNameListCell;
  v9 = -[DMCEnrollmentNameListCell initWithStyle:reuseIdentifier:](&v28, sel_initWithStyle_reuseIdentifier_, 0, v8);

  if (v9)
  {
    -[DMCEnrollmentNameListCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
    -[DMCEnrollmentNameListCell setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentNameListCell setBackgroundColor:](v9, "setBackgroundColor:", v10);

    v11 = objc_msgSend(v6, "copy");
    names = v9->_names;
    v9->_names = (NSArray *)v11;

    v9->_numberOfColumns = a4;
    v13 = objc_alloc_init(MEMORY[0x24BDF6908]);
    v14 = objc_alloc(MEMORY[0x24BDF68D8]);
    v15 = (void *)objc_msgSend(v14, "initWithFrame:collectionViewLayout:", v13, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v15, "setDelegate:", v9);
    objc_msgSend(v15, "setDataSource:", v9);
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v15, "setScrollEnabled:", 0);
    objc_msgSend(v15, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("DMCEnrollmentNameItemCell"));
    -[DMCEnrollmentNameListCell contentView](v9, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);

    v30 = CFSTR("collectionView");
    v31[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-0-[collectionView]-0-|"), 0, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[collectionView]-0-|"), 0, 0, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCEnrollmentNameListCell contentView](v9, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addConstraints:", v18);

    -[DMCEnrollmentNameListCell contentView](v9, "contentView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addConstraints:", v19);

    objc_storeStrong((id *)&v9->_collectionView, v15);
    objc_initWeak(&location, v9);
    v29 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __59__DMCEnrollmentNameListCell_initWithNames_numberOfColumns___block_invoke;
    v25[3] = &unk_24D52E2D0;
    objc_copyWeak(&v26, &location);
    v23 = (id)-[DMCEnrollmentNameListCell registerForTraitChanges:withHandler:](v9, "registerForTraitChanges:withHandler:", v22, v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v9;
}

void __59__DMCEnrollmentNameListCell_initWithNames_numberOfColumns___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "collectionView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)DMCEnrollmentNameListCell;
  -[DMCEnrollmentNameListCell layoutSubviews](&v4, sel_layoutSubviews);
  -[DMCEnrollmentNameListCell collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[DMCEnrollmentNameListCell bounds](self, "bounds");
  -[DMCEnrollmentNameListCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetWidth(v5), 0.0, 0.0);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("DMCEnrollmentNameItemCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCEnrollmentNameListCell names](self, "names");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  -[DMCEnrollmentNameListCell setCellHeight:](self, "setCellHeight:", v13);

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[DMCEnrollmentNameListCell names](self, "names", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double Width;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  _QWORD v31[2];
  CGSize result;
  CGRect v33;

  v31[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a3;
  -[DMCEnrollmentNameListCell names](self, "names");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "row");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x24BEBB360];
  +[DMCEnrollmentNameItemCell _titleFont](DMCEnrollmentNameItemCell, "_titleFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 0, v13, 0, 1.79769313e308, 1.79769313e308);
  v15 = v14;

  -[DMCEnrollmentNameListCell names](self, "names");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  objc_msgSend(v8, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v33.origin.x = v19;
  v33.origin.y = v21;
  v33.size.width = v23;
  v33.size.height = v25;
  Width = CGRectGetWidth(v33);
  if (v17 >= 2)
  {
    v27 = Width + (double)(-[DMCEnrollmentNameListCell numberOfColumns](self, "numberOfColumns") - 1) * -5.0;
    Width = v27 / (double)-[DMCEnrollmentNameListCell numberOfColumns](self, "numberOfColumns");
  }

  v28 = Width;
  v29 = v15;
  result.height = v29;
  result.width = v28;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 5.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 5.0;
}

- (double)cellHeight
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  unint64_t v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  -[DMCEnrollmentNameListCell names](self, "names");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0.0;
  v5 = 0;
  v6 = 0;
  v7 = *MEMORY[0x24BEBB360];
  v8 = 0.0;
  do
  {
    -[DMCEnrollmentNameListCell names](self, "names");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v7;
    +[DMCEnrollmentNameItemCell _titleFont](DMCEnrollmentNameItemCell, "_titleFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 0, v12, 0, 1.79769313e308, 1.79769313e308);
    v8 = v8 + v13;

    if (v6)
      v8 = v8 + 5.0;
    v6 += -[DMCEnrollmentNameListCell numberOfColumns](self, "numberOfColumns");
    v5 = v6;
    -[DMCEnrollmentNameListCell names](self, "names");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

  }
  while (v15 > v6);
  return v8;
}

- (double)estimatedCellHeight
{
  return 25.0;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (NSArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
  objc_storeStrong((id *)&self->_names, a3);
}

- (void)setCellHeight:(double)a3
{
  self->_cellHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
