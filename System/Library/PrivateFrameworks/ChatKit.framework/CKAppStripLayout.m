@implementation CKAppStripLayout

- (CKAppStripLayout)init
{
  CKAppStripLayout *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKAppStripLayout;
  result = -[CKAppStripLayout init](&v3, sel_init);
  if (result)
    result->_layoutMode = 0;
  return result;
}

- (CGSize)collectionViewContentSizeForLayoutMode:(unint64_t)a3
{
  uint64_t v5;
  double v6;
  double v7;
  CGSize result;

  v5 = -[CKAppStripLayout _itemCount](self, "_itemCount");
  -[CKAppStripLayout _specForLayoutMode:](self, "_specForLayoutMode:", a3);
  v6 = 0.0;
  v7 = 0.0 * (double)(v5 - 1) + 0.0 * (double)v5;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)invalidateCachedLayout
{
  NSArray *minifiedAttributes;
  NSArray *magnifiedAttributes;
  NSArray *supplementryMinifiedAttributes;
  NSArray *supplementryMagnifiedAttributes;
  objc_super v7;

  minifiedAttributes = self->_minifiedAttributes;
  self->_minifiedAttributes = 0;

  magnifiedAttributes = self->_magnifiedAttributes;
  self->_magnifiedAttributes = 0;

  supplementryMinifiedAttributes = self->_supplementryMinifiedAttributes;
  self->_supplementryMinifiedAttributes = 0;

  supplementryMagnifiedAttributes = self->_supplementryMagnifiedAttributes;
  self->_supplementryMagnifiedAttributes = 0;

  v7.receiver = self;
  v7.super_class = (Class)CKAppStripLayout;
  -[CKAppStripLayout invalidateLayout](&v7, sel_invalidateLayout);
}

- (void)prepareForLayoutModeTransition
{
  self->_inLayoutModeTransition = 1;
}

- (void)finishLayoutModeTransition
{
  self->_inLayoutModeTransition = 0;
}

+ (double)minHeight
{
  return 38.0;
}

+ (double)maxHeight
{
  return 68.0;
}

- (int64_t)_itemCount
{
  int64_t v3;

  v3 = -[CKAppStripLayout _favoritesCount](self, "_favoritesCount");
  return -[CKAppStripLayout _recentsCount](self, "_recentsCount") + v3;
}

- (int64_t)_favoritesCount
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[CKAppStripLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[CKAppStripLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", 0);

  return v6;
}

- (int64_t)_recentsCount
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[CKAppStripLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[CKAppStripLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfItemsInSection:", 1);

  return v6;
}

- (id)_currentAttributes
{
  return -[CKAppStripLayout _attributesForLayoutMode:](self, "_attributesForLayoutMode:", -[CKAppStripLayout layoutMode](self, "layoutMode"));
}

- (id)_currentSupplementryAttributes
{
  return -[CKAppStripLayout _supplementryAttributesForLayoutMode:](self, "_supplementryAttributesForLayoutMode:", -[CKAppStripLayout layoutMode](self, "layoutMode"));
}

- (id)_attributesForLayoutMode:(unint64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___CKAppStripLayout__magnifiedAttributes;
  if (!a3)
    v3 = &OBJC_IVAR___CKAppStripLayout__minifiedAttributes;
  return *(id *)((char *)&self->super.super.isa + *v3);
}

- (id)_supplementryAttributesForLayoutMode:(unint64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___CKAppStripLayout__supplementryMagnifiedAttributes;
  if (!a3)
    v3 = &OBJC_IVAR___CKAppStripLayout__supplementryMinifiedAttributes;
  return *(id *)((char *)&self->super.super.isa + *v3);
}

- (id)_generateAttributesForSpec:(_Spec *)a3
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  char *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int64_t v20;

  v5 = -[CKAppStripLayout _favoritesCount](self, "_favoritesCount");
  v20 = -[CKAppStripLayout _recentsCount](self, "_recentsCount");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[CKAppStripLayout _itemCount](self, "_itemCount"));
  v7 = 0x1E0CB3000uLL;
  v8 = (char *)&unk_1ECF5C000;
  if (v5 < 1)
  {
    v10 = 0.0;
  }
  else
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      objc_msgSend(*(id *)(v7 + 1712), "indexPathForItem:inSection:", v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8 + 2064, "layoutAttributesForCellWithIndexPath:", v11);
      v12 = v8;
      v13 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSize:", a3->var0.width, a3->var0.height);
      objc_msgSend(v14, "setFrame:", v10, 0.0, a3->var0.width, a3->var0.height);
      objc_msgSend(v14, "setShowsBorder:", -[CKAppStripLayout shouldShowCellBorders](self, "shouldShowCellBorders"));
      objc_msgSend(v14, "setAppStripSize:", a3->var4);
      objc_msgSend(v6, "addObject:", v14);
      v10 = v10 + a3->var3 + a3->var0.width;

      v7 = v13;
      v8 = v12;

      ++v9;
    }
    while (v5 != v9);
  }
  if (CKIsRunningInCameraAppsClient())
  {
    v15 = v20;
  }
  else
  {
    v15 = v20;
    if (v20)
      v10 = v10 + a3->var1.width + a3->var2 * 2.0;
  }
  if (v15 >= 1)
  {
    for (i = 0; i != v15; ++i)
    {
      objc_msgSend(*(id *)(v7 + 1712), "indexPathForItem:inSection:", i, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8 + 2064, "layoutAttributesForCellWithIndexPath:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSize:", a3->var0.width, a3->var0.height);
      objc_msgSend(v18, "setFrame:", v10, 0.0, a3->var0.width, a3->var0.height);
      objc_msgSend(v18, "setShowsBorder:", -[CKAppStripLayout shouldShowCellBorders](self, "shouldShowCellBorders"));
      objc_msgSend(v18, "setAppStripSize:", a3->var4);
      objc_msgSend(v6, "addObject:", v18);
      v10 = v10 + a3->var3 + a3->var0.width;

    }
  }
  return v6;
}

- (id)_generateSupplementryAttributesForSpec:(_Spec *)a3 minified:(BOOL)a4
{
  _BOOL4 v4;
  int64_t v7;
  int64_t v8;
  int v9;
  void *v10;
  int *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double MaxX;
  double v21;
  double v22;
  _QWORD v24[2];
  CGRect v25;
  CGRect v26;

  v4 = a4;
  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = -[CKAppStripLayout _favoritesCount](self, "_favoritesCount");
  v8 = -[CKAppStripLayout _recentsCount](self, "_recentsCount");
  v9 = CKIsRunningInCameraAppsClient();
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (!v9 && v7 && v8)
  {
    v11 = &OBJC_IVAR___CKAppStripLayout__magnifiedAttributes;
    if (v4)
      v11 = &OBJC_IVAR___CKAppStripLayout__minifiedAttributes;
    v12 = *(id *)((char *)&self->super.super.isa + *v11);
    objc_msgSend(v12, "objectAtIndex:", v7 - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CEA460];
    +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind](CKBrowserSwitcherFooterAccessoryCell, "supplementryViewKind");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setSize:", a3->var1.width, a3->var1.height);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    objc_msgSend(v13, "frame");
    MaxX = CGRectGetMaxX(v25);
    objc_msgSend(v14, "frame");
    v21 = MaxX + (CGRectGetMinX(v26) - MaxX) * 0.5 - a3->var1.width * 0.5;
    if (CKMainScreenScale_once_48 != -1)
      dispatch_once(&CKMainScreenScale_once_48, &__block_literal_global_118);
    v22 = *(double *)&CKMainScreenScale_sMainScreenScale_48;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_48 == 0.0)
      v22 = 1.0;
    objc_msgSend(v18, "setFrame:", round(v21 * v22) / v22, v19, a3->var1.width, a3->var1.height);
    v24[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (_Spec)_specForLayoutMode:(SEL)a3
{
  if (a4)
  {
    retstr->var0 = (CGSize)_MagnifiedSpec;
    retstr->var1 = (CGSize)unk_18E7CB0C0;
    *(_OWORD *)&retstr->var2 = xmmword_18E7CB0D0;
    retstr->var4 = 1;
  }
  else
  {
    retstr->var4 = 0;
    retstr->var0 = (CGSize)_MinifiedSpec;
    retstr->var1 = (CGSize)unk_18E7CB088;
    *(_OWORD *)&retstr->var2 = xmmword_18E7CB098;
  }
  return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  BOOL v8;

  height = a3.size.height;
  width = a3.size.width;
  -[CKAppStripLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v8 = v7 != height || v6 != width;

  return v8;
}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[CKAppStripLayout collectionViewContentSizeForLayoutMode:](self, "collectionViewContentSizeForLayoutMode:", -[CKAppStripLayout layoutMode](self, "layoutMode"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareLayout
{
  NSArray *v3;
  NSArray *minifiedAttributes;
  NSArray *v5;
  NSArray *magnifiedAttributes;
  NSArray *v7;
  NSArray *supplementryMinifiedAttributes;
  NSArray *v9;
  NSArray *supplementryMagnifiedAttributes;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  -[CKAppStripLayout invalidateCachedLayout](self, "invalidateCachedLayout");
  if (!self->_minifiedAttributes)
  {
    v14 = 0;
    v11 = _MinifiedSpec;
    v12 = unk_18E7CB088;
    v13 = xmmword_18E7CB098;
    -[CKAppStripLayout _generateAttributesForSpec:](self, "_generateAttributesForSpec:", &v11);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    minifiedAttributes = self->_minifiedAttributes;
    self->_minifiedAttributes = v3;

  }
  if (!self->_magnifiedAttributes)
  {
    v11 = _MagnifiedSpec;
    v12 = unk_18E7CB0C0;
    v13 = xmmword_18E7CB0D0;
    v14 = 1;
    -[CKAppStripLayout _generateAttributesForSpec:](self, "_generateAttributesForSpec:", &v11);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    magnifiedAttributes = self->_magnifiedAttributes;
    self->_magnifiedAttributes = v5;

  }
  if (!self->_supplementryMinifiedAttributes)
  {
    v14 = 0;
    v11 = _MinifiedSpec;
    v12 = unk_18E7CB088;
    v13 = xmmword_18E7CB098;
    -[CKAppStripLayout _generateSupplementryAttributesForSpec:minified:](self, "_generateSupplementryAttributesForSpec:minified:", &v11, 1);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    supplementryMinifiedAttributes = self->_supplementryMinifiedAttributes;
    self->_supplementryMinifiedAttributes = v7;

  }
  if (!self->_supplementryMagnifiedAttributes)
  {
    v11 = _MagnifiedSpec;
    v12 = unk_18E7CB0C0;
    v13 = xmmword_18E7CB0D0;
    v14 = 1;
    -[CKAppStripLayout _generateSupplementryAttributesForSpec:minified:](self, "_generateSupplementryAttributesForSpec:minified:", &v11, 0);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    supplementryMagnifiedAttributes = self->_supplementryMagnifiedAttributes;
    self->_supplementryMagnifiedAttributes = v9;

  }
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  CKAppStripLayout *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  v6 = objc_msgSend(v4, "section");

  if (v6 == 1)
    v5 += -[CKAppStripLayout _favoritesCount](self, "_favoritesCount");
  if (self->_inLayoutModeTransition)
  {
    if (-[CKAppStripLayout layoutMode](self, "layoutMode"))
    {
      v7 = self;
      v8 = 0;
    }
    else
    {
      v7 = self;
      v8 = 1;
    }
    -[CKAppStripLayout _attributesForLayoutMode:](v7, "_attributesForLayoutMode:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKAppStripLayout _currentAttributes](self, "_currentAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  v6 = objc_msgSend(v4, "section");

  if (v6 == 1)
    v5 += -[CKAppStripLayout _favoritesCount](self, "_favoritesCount");
  -[CKAppStripLayout _currentAttributes](self, "_currentAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v5 >= v8)
  {
    v10 = 0;
  }
  else
  {
    -[CKAppStripLayout _currentAttributes](self, "_currentAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;
  CKAppStripLayout *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = objc_msgSend(a4, "item");
  +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind](CKBrowserSwitcherFooterAccessoryCell, "supplementryViewKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (v9
    && (-[CKAppStripLayout _currentSupplementryAttributes](self, "_currentSupplementryAttributes"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v7 < v11))
  {
    if (self->_inLayoutModeTransition)
    {
      if (-[CKAppStripLayout layoutMode](self, "layoutMode"))
      {
        v12 = self;
        v13 = 0;
      }
      else
      {
        v12 = self;
        v13 = 1;
      }
      -[CKAppStripLayout _supplementryAttributesForLayoutMode:](v12, "_supplementryAttributesForLayoutMode:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CKAppStripLayout _currentSupplementryAttributes](self, "_currentSupplementryAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind](CKBrowserSwitcherFooterAccessoryCell, "supplementryViewKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9
    && (v10 = objc_msgSend(v6, "row"),
        -[CKAppStripLayout _currentSupplementryAttributes](self, "_currentSupplementryAttributes"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v11,
        v10 < v12))
  {
    -[CKAppStripLayout _currentSupplementryAttributes](self, "_currentSupplementryAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "item");
  v6 = objc_msgSend(v4, "section");

  if (v6 == 1)
    v5 += -[CKAppStripLayout _favoritesCount](self, "_favoritesCount");
  -[CKAppStripLayout _currentAttributes](self, "_currentAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  +[CKBrowserSwitcherFooterAccessoryCell supplementryViewKind](CKBrowserSwitcherFooterAccessoryCell, "supplementryViewKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9
    && (v10 = objc_msgSend(v6, "row"),
        -[CKAppStripLayout _currentSupplementryAttributes](self, "_currentSupplementryAttributes"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "count"),
        v11,
        v10 < v12))
  {
    -[CKAppStripLayout _currentSupplementryAttributes](self, "_currentSupplementryAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[CKAppStripLayout _itemCount](self, "_itemCount"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[CKAppStripLayout _currentAttributes](self, "_currentAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "frame");
        v43.origin.x = v15;
        v43.origin.y = v16;
        v43.size.width = v17;
        v43.size.height = v18;
        v41.origin.x = x;
        v41.origin.y = y;
        v41.size.width = width;
        v41.size.height = height;
        if (CGRectIntersectsRect(v41, v43))
          objc_msgSend(v8, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v11);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CKAppStripLayout _currentSupplementryAttributes](self, "_currentSupplementryAttributes", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
        objc_msgSend(v24, "frame");
        v44.origin.x = v25;
        v44.origin.y = v26;
        v44.size.width = v27;
        v44.size.height = v28;
        v42.origin.x = x;
        v42.origin.y = y;
        v42.size.width = width;
        v42.size.height = height;
        if (CGRectIntersectsRect(v42, v44))
          objc_msgSend(v8, "addObject:", v24);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v21);
  }

  return v8;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = objc_msgSend(v7, "row");
  v9 = objc_msgSend(v7, "section");

  if (v9 == 1)
    v8 += -[CKAppStripLayout _favoritesCount](self, "_favoritesCount");
  -[CKAppStripLayout _currentAttributes](self, "_currentAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v12, "setCenter:", x, y);
  return v12;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(unint64_t)a3
{
  self->_layoutMode = a3;
}

- (BOOL)shouldDimPluginCells
{
  return self->_shouldDimPluginCells;
}

- (void)setShouldDimPluginCells:(BOOL)a3
{
  self->_shouldDimPluginCells = a3;
}

- (BOOL)shouldShowCellBorders
{
  return self->_shouldShowCellBorders;
}

- (void)setShouldShowCellBorders:(BOOL)a3
{
  self->_shouldShowCellBorders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementryMagnifiedAttributes, 0);
  objc_storeStrong((id *)&self->_supplementryMinifiedAttributes, 0);
  objc_storeStrong((id *)&self->_magnifiedAttributes, 0);
  objc_storeStrong((id *)&self->_minifiedAttributes, 0);
}

@end
