@implementation DOCTagsCollectionView

- (DOCTagsCollectionView)init
{
  DOCTagsCollectionView *v2;
  DOCTagsCollectionView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCTagsCollectionView;
  v2 = -[DOCTagsCollectionView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DOCTagsCollectionView doc_commonInit](v2, "doc_commonInit");
  return v3;
}

- (void)doc_commonInit
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *nodes;
  id v10;
  UICollectionView *v11;
  UICollectionView *collectionView;
  void *v13;
  _TtC26DocumentManagerExecutables25DOCTagsCollectionViewData *v14;
  _TtC26DocumentManagerExecutables25DOCTagsCollectionViewData *tagsData;
  void *v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBD488]);
  v4 = *MEMORY[0x24BEBE178];
  v20[0] = *MEMORY[0x24BEBE170];
  v20[1] = v4;
  v21[0] = &unk_24E33E8D8;
  v21[1] = &unk_24E33E8D8;
  v20[2] = *MEMORY[0x24BEBE180];
  v21[2] = &unk_24E33E8D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setRowAlignmentsOptions:", v5);

  +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "verticalTagSpacing");
  objc_msgSend(v3, "setMinimumLineSpacing:");

  +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "horizontalTagSpacing");
  objc_msgSend(v3, "setMinimumInteritemSpacing:");

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  nodes = self->_nodes;
  self->_nodes = v8;

  self->_showsAddTagButton = 1;
  v10 = objc_alloc(MEMORY[0x24BEBD450]);
  -[DOCTagsCollectionView bounds](self, "bounds");
  v11 = (UICollectionView *)objc_msgSend(v10, "initWithFrame:collectionViewLayout:", v3);
  collectionView = self->_collectionView;
  self->_collectionView = v11;

  -[UICollectionView setOpaque:](self->_collectionView, "setOpaque:", 0);
  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", 0);
  -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
  -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
  v18[0] = CFSTR("TagCellIdentifier");
  v18[1] = CFSTR("AddTagCellIdentifier");
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagsCollectionView setupCells:registerClasses:](self, "setupCells:registerClasses:", v13, 1);

  -[UICollectionView setAutoresizingMask:](self->_collectionView, "setAutoresizingMask:", 2);
  v14 = objc_alloc_init(_TtC26DocumentManagerExecutables25DOCTagsCollectionViewData);
  tagsData = self->_tagsData;
  self->_tagsData = v14;

  -[DOCTagsCollectionViewData setDelegate:](self->_tagsData, "setDelegate:", self);
  -[DOCTagsCollectionView updateForChangedTraitsAffectingFonts](self, "updateForChangedTraitsAffectingFonts");
  objc_msgSend(MEMORY[0x24BEBDAB0], "doc_traitsAffectingFonts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)-[DOCTagsCollectionView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v16, sel_updateForChangedTraitsAffectingFonts);

  -[DOCTagsCollectionView addSubview:](self, "addSubview:", self->_collectionView);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize *p_lastIntrinsicContentSize;
  double width;
  double height;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)DOCTagsCollectionView;
  -[DOCTagsCollectionView layoutSubviews](&v20, sel_layoutSubviews);
  -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewContentSize");
  v5 = v4;
  v7 = v6;
  p_lastIntrinsicContentSize = &self->_lastIntrinsicContentSize;
  width = self->_lastIntrinsicContentSize.width;
  height = self->_lastIntrinsicContentSize.height;

  if (v5 != width || v7 != height)
  {
    -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionViewContentSize");
    p_lastIntrinsicContentSize->width = v13;
    self->_lastIntrinsicContentSize.height = v14;

    -[UICollectionView frame](self->_collectionView, "frame");
    v16 = v15;
    v17 = self->_lastIntrinsicContentSize.height;
    if (p_lastIntrinsicContentSize->width != v18 || v17 != v16)
      -[UICollectionView setFrame:](self->_collectionView, "setFrame:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), p_lastIntrinsicContentSize->width, v17);
    -[DOCTagsCollectionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setShowsAddTagButton:(BOOL)a3
{
  if (self->_showsAddTagButton != a3)
  {
    self->_showsAddTagButton = a3;
    -[DOCTagsCollectionView _reloadData](self, "_reloadData");
  }
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastIntrinsicContentSize.width;
  height = self->_lastIntrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)result
{
  double height;

  height = self->_lastIntrinsicContentSize.height;
  result.height = height;
  return result;
}

- (void)setNodes:(id)a3
{
  -[DOCTagsCollectionViewData applyTagsFromNodes:](self->_tagsData, "applyTagsFromNodes:", a3);
}

- (void)_reloadData
{
  -[UICollectionView reloadData](self->_collectionView, "reloadData");
  -[DOCTagsCollectionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setupCells:(id)a3 registerClasses:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSDictionary *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  objc_class *v14;
  id v15;
  NSDictionary *sizingCells;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v14 = (objc_class *)objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v17);
        v15 = objc_alloc_init(v14);
        -[NSDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v15, v13);
        if (v4)
          -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  sizingCells = self->_sizingCells;
  self->_sizingCells = v7;

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[DOCTagsCollectionViewData countOfTags](self->_tagsData, "countOfTags", a3, a4) + self->_showsAddTagButton;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__DOCTagsCollectionView_collectionView_cellForItemAtIndexPath___block_invoke;
  v12[3] = &unk_24E327948;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  -[DOCTagsCollectionView cellForIndexPath:dequeueCell:](self, "cellForIndexPath:dequeueCell:", v8, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __63__DOCTagsCollectionView_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dequeueReusableCellWithReuseIdentifier:forIndexPath:", a2, *(_QWORD *)(a1 + 40));
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  CGSize result;

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__DOCTagsCollectionView_collectionView_layout_sizeForItemAtIndexPath___block_invoke;
  v12[3] = &unk_24E327970;
  v12[4] = self;
  -[DOCTagsCollectionView cellForIndexPath:dequeueCell:](self, "cellForIndexPath:dequeueCell:", a5, v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

id __70__DOCTagsCollectionView_collectionView_layout_sizeForItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sizingCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "item");
  if (v7 == -[DOCTagsCollectionViewData countOfTags](self->_tagsData, "countOfTags"))
  {
    -[DOCTagsCollectionView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellForItemAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tagsCollectionView:didSelectAddTagButton:", self, v9);

  }
}

- (id)cellForIndexPath:(id)a3 dequeueCell:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  int64_t v9;
  void (*v10)(_QWORD *, const __CFString *);
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "item");
  v9 = -[DOCTagsCollectionViewData countOfTags](self->_tagsData, "countOfTags");
  v10 = (void (*)(_QWORD *, const __CFString *))v7[2];
  if (v8 == v9)
  {
    v10(v7, CFSTR("AddTagCellIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10(v7, CFSTR("TagCellIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[DOCTagsCollectionViewData tagAtIndex:](self->_tagsData, "tagAtIndex:", objc_msgSend(v6, "item"));
    v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tagView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    objc_msgSend(v11, "tagView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTagValue:", v7);

    v14 = -[DOCTagsCollectionViewData presenceOf:](self->_tagsData, "presenceOf:", v7) == 1;
    objc_msgSend(v11, "tagView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIsMixed:", v14);

  }
  return v11;
}

- (id)_layout
{
  return -[UICollectionView collectionViewLayout](self->_collectionView, "collectionViewLayout");
}

- (void)updateForChangedTraitsAffectingFonts
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("TagCellIdentifier");
  v6[1] = CFSTR("AddTagCellIdentifier");
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagsCollectionView setupCells:registerClasses:](self, "setupCells:registerClasses:", v3, 0);

  self->_lastIntrinsicContentSize.width = 0.0;
  self->_lastIntrinsicContentSize.height = 0.0;
  -[DOCTagsCollectionView _layout](self, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "horizontalTagSpacing");
  objc_msgSend(v4, "setMinimumInteritemSpacing:");

  objc_msgSend(v4, "invalidateLayout");
  -[DOCTagsCollectionView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[DOCTagsCollectionView setNeedsLayout](self, "setNeedsLayout");

}

- (void)tagsCollectionItem:(id)a3 didDeleteTag:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DOCTagsCollectionView _indexPathOfTag:](self, "_indexPathOfTag:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_opt_new();
    v15[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeletions:", v10);

    -[DOCTagsCollectionViewData applyPendingExternalChange:timeout:](self->_tagsData, "applyPendingExternalChange:timeout:", v9, 1.0);
    -[DOCTagsCollectionView collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteItemsAtIndexPaths:", v12);

    -[DOCTagsCollectionView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tagsCollectionItem:didDeleteTag:", v6, v7);

  }
}

- (id)_indexPathOfTag:(id)a3
{
  int64_t v3;

  v3 = -[DOCTagsCollectionViewData indexOfTag:](self->_tagsData, "indexOfTag:", a3);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_cellMenuTargetForIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doc_tagsCollectionCellMenuTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "count");

  if (v8 == 1)
  {
    -[DOCTagsCollectionView _cellMenuTargetForIndexPath:](self, "_cellMenuTargetForIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "menuForContextMenuPresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10
      && (objc_msgSend(v10, "children"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "count"),
          v12,
          v13))
    {
      v14 = (void *)MEMORY[0x24BEBD4F8];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __91__DOCTagsCollectionView_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke;
      v17[3] = &unk_24E327998;
      v18 = v11;
      objc_msgSend(v14, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

id __91__DOCTagsCollectionView_collectionView_contextMenuConfigurationForItemsAtIndexPaths_point___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "cellForItemAtIndexPath:", a5, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "tagView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cornerRadius");

    v7 = objc_alloc_init(MEMORY[0x24BEBD888]);
    v8 = (void *)MEMORY[0x24BEBD420];
    objc_msgSend(v5, "bounds");
    objc_msgSend(v8, "bezierPathWithRoundedRect:cornerRadius:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVisiblePath:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA30]), "initWithView:parameters:", v5, v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v10[6];

  v6 = a5;
  +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dimmingAlphaDuringMenuPresentation");
  v9 = v8;

  if (v9 != 1.0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __89__DOCTagsCollectionView_collectionView_willDisplayContextMenuWithConfiguration_animator___block_invoke;
    v10[3] = &unk_24E3279C0;
    v10[4] = self;
    *(double *)&v10[5] = v9;
    objc_msgSend(v6, "addAnimations:", v10);
  }

}

uint64_t __89__DOCTagsCollectionView_collectionView_willDisplayContextMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v10[5];

  v6 = a5;
  +[DOCTagAppearance infoCollection](DOCTagAppearance, "infoCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dimmingAlphaDuringMenuPresentation");
  v9 = v8;

  if (v9 != 1.0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __96__DOCTagsCollectionView_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke;
    v10[3] = &unk_24E3279E8;
    v10[4] = self;
    objc_msgSend(v6, "addAnimations:", v10);
  }

}

uint64_t __96__DOCTagsCollectionView_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (DOCTagsCollectionViewDelegate)delegate
{
  return (DOCTagsCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (BOOL)showsAddTagButton
{
  return self->_showsAddTagButton;
}

- (_TtC26DocumentManagerExecutables25DOCTagsCollectionViewData)tagsData
{
  return self->_tagsData;
}

- (CGSize)lastIntrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastIntrinsicContentSize.width;
  height = self->_lastIntrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (NSDictionary)sizingCells
{
  return self->_sizingCells;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizingCells, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_tagsData, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
