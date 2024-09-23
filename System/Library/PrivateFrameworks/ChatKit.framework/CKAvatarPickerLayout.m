@implementation CKAvatarPickerLayout

- (CKAvatarPickerLayout)initWithLayoutMode:(unint64_t)a3
{
  CKAvatarPickerLayout *v4;
  CKAvatarPickerLayout *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = -[CKAvatarPickerLayout init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_layoutMode = a3;
    v4->_isInEditingMode = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, v5);
    v7 = CKNavigationBarCollectionViewShouldAdustForEditingModeNotification;
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__CKAvatarPickerLayout_initWithLayoutMode___block_invoke;
    v11[3] = &unk_1E2755FF0;
    objc_copyWeak(&v12, &location);
    v9 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v7, 0, v8, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
  return v5;
}

void __43__CKAvatarPickerLayout_initWithLayoutMode___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v12, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", kCKNavigationBarCollectionViewKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      objc_msgSend(v12, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", kCKNavigationBarIsInEditingModeKey);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        v9 = objc_msgSend(v8, "BOOLValue");
      else
        v9 = 0;
      objc_msgSend(WeakRetained, "setIsInEditingMode:", v9);
      if ((objc_msgSend(WeakRetained, "isInEditingMode") & 1) != 0)
      {
        objc_msgSend(v12, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", kCKNavigationBarEditFrameKey);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setEditingFrameValue:", v11);

      }
      else
      {
        objc_msgSend(WeakRetained, "setEditingFrameValue:", 0);
      }

    }
  }

}

- (void)invalidateLayoutAndCache
{
  -[CKAvatarPickerLayout setAttrCollection:](self, "setAttrCollection:", 0);
  -[CKAvatarPickerLayout setTitleSupplementaryAttr:](self, "setTitleSupplementaryAttr:", 0);
  -[CKAvatarPickerLayout setAvatarAttr:](self, "setAvatarAttr:", 0);
  -[CKAvatarPickerLayout invalidateLayout](self, "invalidateLayout");
}

- (void)setLayoutMode:(unint64_t)a3
{
  unint64_t layoutMode;

  layoutMode = self->_layoutMode;
  if (layoutMode != a3 && layoutMode != 2)
    self->_layoutMode = a3;
}

- (unint64_t)_itemCount
{
  void *v2;
  unint64_t v3;

  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItemsInSection:", 0);

  return v3;
}

- (void)_setupTitleViewLayoutWithYPosition:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double MidX;
  void *v10;
  void *v11;
  void *v12;
  double Width;
  void *v14;
  id v15;
  CGRect v16;
  CGRect v17;

  -[CKAvatarPickerLayout delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "avatarPickerLayoutTitleViewHeight");
  v7 = v6;

  if (v7 <= 0.0)
    v7 = 32.0;
  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  MidX = CGRectGetMidX(v16);

  -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", 0);

  -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCenter:", MidX, a3 + v7 * 0.5);

  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  Width = CGRectGetWidth(v17);
  -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSize:", Width, v7);

  -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", 1.0);

}

- (void)_setupGroupIdentityLayout
{
  double MaxY;
  double Width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  MaxY = 0.0;
  Width = 0.0;
  if (-[CKAvatarPickerLayout isInEditingMode](self, "isInEditingMode"))
  {
    -[CKAvatarPickerLayout editingFrameValue](self, "editingFrameValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CGRectValue");
    Width = CGRectGetWidth(v20);

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupAvatarViewSize");
  v8 = v7;

  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v10 = CGRectGetWidth(v21);

  -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (Width >= v10)
      v15 = Width;
    else
      v15 = v10;
    v16 = v15 * 0.5;
    -[CKAvatarPickerLayout collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    objc_msgSend(v14, "setSize:", v18, v8);

    if (CKMainScreenScale_once_100 != -1)
      dispatch_once(&CKMainScreenScale_once_100, &__block_literal_global_259);
    v19 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_100 != 0.0)
      v19 = *(double *)&CKMainScreenScale_sMainScreenScale_100;
    objc_msgSend(v14, "setCenter:", round(v16 * v19) / v19, round(v8 * 0.5 * v19) / v19);
    objc_msgSend(v14, "frame");
    MaxY = CGRectGetMaxY(v22);
    -[CKAvatarPickerLayout setAvatarAttr:](self, "setAvatarAttr:", v14);

  }
  -[CKAvatarPickerLayout _setupTitleViewLayoutWithYPosition:](self, "_setupTitleViewLayoutWithYPosition:", MaxY);
}

- (CGSize)_contentSizeForGroupIdentityLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double MaxX;
  void *v8;
  double MaxY;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;
  CGRect v17;

  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[CKAvatarPickerLayout avatarAttr](self, "avatarAttr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  MaxX = CGRectGetMaxX(v16);

  -[CKAvatarPickerLayout avatarAttr](self, "avatarAttr");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  MaxY = CGRectGetMaxY(v17);
  -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = MaxY + v11;

  if (MaxX >= v5)
    v13 = MaxX;
  else
    v13 = v5;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_setupSingleAvatarLayout
{
  double MaxY;
  double Width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  MaxY = 0.0;
  Width = 0.0;
  if (-[CKAvatarPickerLayout isInEditingMode](self, "isInEditingMode"))
  {
    -[CKAvatarPickerLayout editingFrameValue](self, "editingFrameValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "CGRectValue");
    Width = CGRectGetWidth(v20);

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "avatarSize");
  v8 = v7;
  v10 = v9;

  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = CGRectGetWidth(v21);

  -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (Width >= v12)
      v17 = Width;
    else
      v17 = v12;
    v18 = v17 * 0.5;
    objc_msgSend(v16, "setSize:", v8, v10);
    if (CKMainScreenScale_once_100 != -1)
      dispatch_once(&CKMainScreenScale_once_100, &__block_literal_global_259);
    v19 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_100 != 0.0)
      v19 = *(double *)&CKMainScreenScale_sMainScreenScale_100;
    objc_msgSend(v16, "setCenter:", round(v18 * v19) / v19, round(v10 * 0.5 * v19) / v19);
    objc_msgSend(v16, "frame");
    MaxY = CGRectGetMaxY(v22);
    -[CKAvatarPickerLayout setAvatarAttr:](self, "setAvatarAttr:", v16);

  }
  -[CKAvatarPickerLayout _setupTitleViewLayoutWithYPosition:](self, "_setupTitleViewLayoutWithYPosition:", MaxY);
}

- (CGSize)_contentSizeForSingleAvatarLayout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double MaxX;
  void *v8;
  double MaxY;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;
  CGRect v16;
  CGRect v17;

  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  -[CKAvatarPickerLayout avatarAttr](self, "avatarAttr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  MaxX = CGRectGetMaxX(v16);

  -[CKAvatarPickerLayout avatarAttr](self, "avatarAttr");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  MaxY = CGRectGetMaxY(v17);
  -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "size");
  v12 = MaxY + v11;

  if (MaxX >= v5)
    v13 = MaxX;
  else
    v13 = v5;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_setupBannerLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double MidX;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double MaxY;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double Width;
  void *v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bannerCellSize");
  v5 = v4;
  v7 = v6;
  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = fmin(v7, v12);
    v16 = fmin(v5, v10);
    -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKAvatarPickerLayout collectionView](self, "collectionView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    MidX = CGRectGetMidX(v40);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "avatarSpacingMargin");
    v23 = MidX + (v16 + v22) * 0.0;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bannerAdditionalOffset");
    v26 = v15 * 0.5 + v25;

    objc_msgSend(v18, "setCenter:", v23, v26);
    objc_msgSend(v18, "setSize:", v16, v15);
    objc_msgSend(v18, "frame");
    MaxY = CGRectGetMaxY(v41);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "avatarContactImageNameMargin");
    v30 = MaxY + v29;

  }
  else
  {
    v30 = 0.0;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bannerTitleAdditionalOffset");
  v33 = v30 + v32;

  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v35 = CGRectGetMidX(v42);

  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  Width = CGRectGetWidth(v43);
  -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setSize:", Width, 16.0);

  -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setCenter:", v35, v33);

}

- (CGSize)_contentSizeForBannerLayout
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarSize");
  v5 = v4;
  v7 = v6;

  -[CKAvatarPickerLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  v11 = v5 + 40.0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "avatarContactImageNameMargin");
  v14 = v7 + v13;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bannerTitleAdditionalOffset");
  v17 = v14 + v16 + 16.0;

  if (v11 >= v10)
    v18 = v11;
  else
    v18 = v10;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  double v13;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  -[CKAvatarPickerLayout collectionView](self, "collectionView", a3.origin.x, a3.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  if (v8 != width || v10 != height)
  {
    -[CKAvatarPickerLayout collectionView](self, "collectionView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v13 = CGRectGetWidth(v15);

    if (v13 != width)
    {
      -[CKAvatarPickerLayout setAttrCollection:](self, "setAttrCollection:", 0);
      -[CKAvatarPickerLayout setTitleSupplementaryAttr:](self, "setTitleSupplementaryAttr:", 0);
      -[CKAvatarPickerLayout setAvatarAttr:](self, "setAvatarAttr:", 0);
    }
  }
  return 1;
}

- (CGSize)collectionViewContentSize
{
  unint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v3 = -[CKAvatarPickerLayout layoutMode](self, "layoutMode");
  if (v3 == 1)
  {
    -[CKAvatarPickerLayout _contentSizeForSingleAvatarLayout](self, "_contentSizeForSingleAvatarLayout");
  }
  else if (v3 == 2)
  {
    -[CKAvatarPickerLayout _contentSizeForBannerLayout](self, "_contentSizeForBannerLayout");
  }
  else
  {
    -[CKAvatarPickerLayout _contentSizeForGroupIdentityLayout](self, "_contentSizeForGroupIdentityLayout");
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)prepareLayout
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[CKAvatarPickerLayout _itemCount](self, "_itemCount");
  -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
    if (v3 >= 1)
    {
      for (i = 0; i != v3; ++i)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA460], "layoutAttributesForCellWithIndexPath:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

      }
    }
    v9 = (void *)MEMORY[0x1E0CEA460];
    +[CKAvatarTitleCollectionReusableView supplementaryViewKind](CKAvatarTitleCollectionReusableView, "supplementaryViewKind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAvatarPickerLayout setTitleSupplementaryAttr:](self, "setTitleSupplementaryAttr:", v12);

    -[CKAvatarPickerLayout setAttrCollection:](self, "setAttrCollection:", v5);
  }
  if (-[CKAvatarPickerLayout layoutMode](self, "layoutMode") == 2)
  {
    -[CKAvatarPickerLayout _setupBannerLayout](self, "_setupBannerLayout");
  }
  else if (-[CKAvatarPickerLayout layoutMode](self, "layoutMode") == 3)
  {
    -[CKAvatarPickerLayout _setupGroupIdentityLayout](self, "_setupGroupIdentityLayout");
  }
  else if (-[CKAvatarPickerLayout layoutMode](self, "layoutMode") == 1)
  {
    -[CKAvatarPickerLayout _setupSingleAvatarLayout](self, "_setupSingleAvatarLayout");
  }
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)initialLayoutAttributesForAppearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CKAvatarPickerLayout initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:].cold.1();

  return 0;
}

- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CKAvatarPickerLayout finalLayoutAttributesForDisappearingDecorationElementOfKind:atIndexPath:].cold.1();

  return 0;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v6 = a3;
  +[CKAvatarTitleCollectionReusableView supplementaryViewKind](CKAvatarTitleCollectionReusableView, "supplementaryViewKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKAvatarPickerLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKAvatarPickerLayout.m"), 270, CFSTR("Trying to use supplementaryKind that is for neither name nor title: %@"), v6);

    v9 = 0;
  }

  return v9;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v6 = a3;
  +[CKAvatarTitleCollectionReusableView supplementaryViewKind](CKAvatarTitleCollectionReusableView, "supplementaryViewKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKAvatarPickerLayout finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKAvatarPickerLayout.m"), 281, CFSTR("Trying to use supplementaryKind that is for neither name nor title: %@"), v6);

    v9 = 0;
  }

  return v9;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;

  v6 = a3;
  +[CKAvatarTitleCollectionReusableView supplementaryViewKind](CKAvatarTitleCollectionReusableView, "supplementaryViewKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKAvatarPickerLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKAvatarPickerLayout.m"), 296, CFSTR("Trying to use supplementaryKind that is for neither name nor title: %@"), v6);

    v9 = 0;
  }

  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CKAvatarPickerLayout layoutAttributesForDecorationViewOfKind:atIndexPath:].cold.1();

  return 0;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  unint64_t v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  BOOL v29;
  void *v30;
  uint8_t v32;
  _BYTE v33[15];
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") + 1;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v13 >= v15)
      {
        IMLogHandleForCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[CKAvatarPickerLayout layoutAttributesForElementsInRect:].cold.1(&v32, v33, v17);
      }
      else
      {
        -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndex:", v13);
        v17 = objc_claimAutoreleasedReturnValue();

        -[NSObject frame](v17, "frame");
        v36.origin.x = v18;
        v36.origin.y = v19;
        v36.size.width = v20;
        v36.size.height = v21;
        v34.origin.x = x;
        v34.origin.y = y;
        v34.size.width = width;
        v34.size.height = height;
        if (CGRectIntersectsRect(v34, v36))
          objc_msgSend(v10, "addObject:", v17);
      }

      ++v13;
      -[CKAvatarPickerLayout attrCollection](self, "attrCollection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

    }
    while (v13 < v23);
  }
  -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v37.origin.x = v25;
  v37.origin.y = v26;
  v37.size.width = v27;
  v37.size.height = v28;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v29 = CGRectIntersectsRect(v35, v37);

  if (v29)
  {
    -[CKAvatarPickerLayout titleSupplementaryAttr](self, "titleSupplementaryAttr");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v30);

  }
  return v10;
}

- (BOOL)_shouldShowContactNames
{
  return 0;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

- (CKAvatarPickerLayoutDelegate)delegate
{
  return (CKAvatarPickerLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UICollectionViewLayoutAttributes)titleSupplementaryAttr
{
  return self->_titleSupplementaryAttr;
}

- (void)setTitleSupplementaryAttr:(id)a3
{
  objc_storeStrong((id *)&self->_titleSupplementaryAttr, a3);
}

- (NSArray)attrCollection
{
  return self->_attrCollection;
}

- (void)setAttrCollection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (UICollectionViewLayoutAttributes)avatarAttr
{
  return self->_avatarAttr;
}

- (void)setAvatarAttr:(id)a3
{
  objc_storeStrong((id *)&self->_avatarAttr, a3);
}

- (BOOL)isInEditingMode
{
  return self->_isInEditingMode;
}

- (void)setIsInEditingMode:(BOOL)a3
{
  self->_isInEditingMode = a3;
}

- (NSValue)editingFrameValue
{
  return self->_editingFrameValue;
}

- (void)setEditingFrameValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingFrameValue, 0);
  objc_storeStrong((id *)&self->_avatarAttr, 0);
  objc_storeStrong((id *)&self->_attrCollection, 0);
  objc_storeStrong((id *)&self->_titleSupplementaryAttr, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)finalLayoutAttributesForDisappearingDecorationElementOfKind:atIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)layoutAttributesForSupplementaryViewOfKind:atIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)layoutAttributesForDecorationViewOfKind:atIndexPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_18DFCD000, v0, v1, "Unknown element kind: %@ in %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)layoutAttributesForElementsInRect:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Index is out of bound for attrCollection", buf, 2u);
}

@end
