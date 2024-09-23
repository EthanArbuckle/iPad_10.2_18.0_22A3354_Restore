@implementation NSCollectionLayoutSection

- (BOOL)_hasBackgroundDecorationItem
{
  return self->_hasBackgroundDecorationItem;
}

- (_UICollectionLayoutSectionCallback)_callback
{
  return self->_callback;
}

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutSection *v4;
  _BOOL4 isEmptySection;
  char v6;
  _BOOL4 prefersListSolver;
  _BOOL4 v8;
  UIContentInsetsReference v9;
  UICollectionLayoutSectionOrthogonalScrollingBehavior v10;
  UIContentInsetsReference v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  char v20;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;

  v4 = (NSCollectionLayoutSection *)a3;
  if (self == v4)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  isEmptySection = self->_isEmptySection;
  if (isEmptySection != -[NSCollectionLayoutSection _isEmptySection](v4, "_isEmptySection"))
    goto LABEL_17;
  if (self->_isEmptySection && -[NSCollectionLayoutSection _isEmptySection](v4, "_isEmptySection"))
  {
LABEL_6:
    v6 = 1;
    goto LABEL_18;
  }
  prefersListSolver = self->_prefersListSolver;
  if (prefersListSolver != -[NSCollectionLayoutSection prefersListSolver](v4, "prefersListSolver"))
    goto LABEL_17;
  v8 = -[NSCollectionLayoutSection supplementariesFollowContentInsets](self, "supplementariesFollowContentInsets");
  if (v8 != -[NSCollectionLayoutSection supplementariesFollowContentInsets](v4, "supplementariesFollowContentInsets"))
    goto LABEL_17;
  v9 = -[NSCollectionLayoutSection supplementaryContentInsetsReference](self, "supplementaryContentInsetsReference");
  if (v9 != -[NSCollectionLayoutSection supplementaryContentInsetsReference](v4, "supplementaryContentInsetsReference"))
    goto LABEL_17;
  v10 = -[NSCollectionLayoutSection orthogonalScrollingBehavior](self, "orthogonalScrollingBehavior");
  if (v10 != -[NSCollectionLayoutSection orthogonalScrollingBehavior](v4, "orthogonalScrollingBehavior"))
    goto LABEL_17;
  v11 = -[NSCollectionLayoutSection contentInsetsReference](self, "contentInsetsReference");
  if (v11 != -[NSCollectionLayoutSection contentInsetsReference](v4, "contentInsetsReference"))
    goto LABEL_17;
  v12 = -[NSCollectionLayoutSection _clipsContentToBounds](self, "_clipsContentToBounds");
  if (v12 != -[NSCollectionLayoutSection _clipsContentToBounds](v4, "_clipsContentToBounds"))
    goto LABEL_17;
  v13 = -[NSCollectionLayoutSection _excludesBoundarySupplementariesFromClipping](self, "_excludesBoundarySupplementariesFromClipping");
  if (v13 != -[NSCollectionLayoutSection _excludesBoundarySupplementariesFromClipping](v4, "_excludesBoundarySupplementariesFromClipping"))goto LABEL_17;
  v14 = -[NSCollectionLayoutSection _clipsBackgroundDecorationsToContent](self, "_clipsBackgroundDecorationsToContent");
  if (v14 != -[NSCollectionLayoutSection _clipsBackgroundDecorationsToContent](v4, "_clipsBackgroundDecorationsToContent"))goto LABEL_17;
  -[NSCollectionLayoutSection interGroupSpacing](self, "interGroupSpacing");
  v16 = v15;
  -[NSCollectionLayoutSection interGroupSpacing](v4, "interGroupSpacing");
  if (vabdd_f64(v16, v17) > 0.0001
    || (-[NSCollectionLayoutSection visibleItemsInvalidationHandler](self, "visibleItemsInvalidationHandler"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSCollectionLayoutSection visibleItemsInvalidationHandler](v4, "visibleItemsInvalidationHandler"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = (v18 == 0) ^ (v19 == 0),
        v19,
        v18,
        (v20 & 1) != 0))
  {
LABEL_17:
    v6 = 0;
    goto LABEL_18;
  }
  -[NSCollectionLayoutSection contentInsets](self, "contentInsets");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[NSCollectionLayoutSection contentInsets](v4, "contentInsets");
  v6 = 0;
  if (v25 == v33 && v23 == v30 && v29 == v32 && v27 == v31)
  {
    -[NSCollectionLayoutSection _cornerRadius](self, "_cornerRadius");
    v35 = v34;
    -[NSCollectionLayoutSection _cornerRadius](v4, "_cornerRadius");
    if (vabdd_f64(v35, v36) > 0.0001)
      goto LABEL_17;
    -[NSCollectionLayoutSection _preBoundaryPadding](self, "_preBoundaryPadding");
    v38 = v37;
    -[NSCollectionLayoutSection _preBoundaryPadding](v4, "_preBoundaryPadding");
    if (vabdd_f64(v38, v39) > 0.0001)
      goto LABEL_17;
    -[NSCollectionLayoutSection _postBoundaryPadding](self, "_postBoundaryPadding");
    v41 = v40;
    -[NSCollectionLayoutSection _postBoundaryPadding](v4, "_postBoundaryPadding");
    if (vabdd_f64(v41, v42) > 0.0001)
      goto LABEL_17;
    -[NSCollectionLayoutSection _clippingInsets](self, "_clippingInsets");
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    -[NSCollectionLayoutSection _clippingInsets](v4, "_clippingInsets");
    v6 = 0;
    if (v46 == v54 && v44 == v51 && v50 == v53 && v48 == v52)
    {
      -[NSCollectionLayoutSection decorationItems](self, "decorationItems");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCollectionLayoutSection decorationItems](v4, "decorationItems");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = __objectEqual(v55, v56);

      if (!v57)
        goto LABEL_17;
      -[NSCollectionLayoutSection pinnedBoundarySupplementaryItemIndexes](self, "pinnedBoundarySupplementaryItemIndexes");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCollectionLayoutSection pinnedBoundarySupplementaryItemIndexes](v4, "pinnedBoundarySupplementaryItemIndexes");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v58 == 0) != (v59 == 0))
      {
        v6 = 0;
LABEL_33:

        goto LABEL_18;
      }
      -[NSCollectionLayoutSection pinnedBoundarySupplementaryItemIndexes](self, "pinnedBoundarySupplementaryItemIndexes");
      v60 = objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        v61 = (void *)v60;
        -[NSCollectionLayoutSection pinnedBoundarySupplementaryItemIndexes](self, "pinnedBoundarySupplementaryItemIndexes");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSCollectionLayoutSection pinnedBoundarySupplementaryItemIndexes](v4, "pinnedBoundarySupplementaryItemIndexes");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v62, "isEqualToIndexSet:", v63);

        if (!v64)
          goto LABEL_17;
      }
      else
      {

      }
      -[NSCollectionLayoutSection supplementaryItems](self, "supplementaryItems");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCollectionLayoutSection supplementaryItems](v4, "supplementaryItems");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = __objectEqual(v65, v66);

      if (!v67)
        goto LABEL_17;
      -[NSCollectionLayoutSection boundarySupplementaryItems](self, "boundarySupplementaryItems");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCollectionLayoutSection boundarySupplementaryItems](v4, "boundarySupplementaryItems");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = __objectEqual(v68, v69);

      if (!v70)
        goto LABEL_17;
      -[NSCollectionLayoutSection _orthogonalScrollingProperties](self, "_orthogonalScrollingProperties");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71)
      {

      }
      else
      {
        -[NSCollectionLayoutSection _orthogonalScrollingProperties](v4, "_orthogonalScrollingProperties");
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v72)
        {
LABEL_44:
          -[NSCollectionLayoutSection group](self, "group");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSCollectionLayoutSection group](v4, "group");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v58, "isEqual:", v59);
          goto LABEL_33;
        }
      }
      -[NSCollectionLayoutSection orthogonalScrollingProperties](self, "orthogonalScrollingProperties");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCollectionLayoutSection orthogonalScrollingProperties](v4, "orthogonalScrollingProperties");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v73, "isEqual:", v74);

      if (!v75)
        goto LABEL_17;
      goto LABEL_44;
    }
  }
LABEL_18:

  return v6;
}

- (BOOL)scrollsOrthogonally
{
  return -[NSCollectionLayoutSection orthogonalScrollingBehavior](self, "orthogonalScrollingBehavior") != UICollectionLayoutSectionOrthogonalScrollingBehaviorNone;
}

- (UICollectionLayoutSectionOrthogonalScrollingBehavior)orthogonalScrollingBehavior
{
  return self->_orthogonalScrollingBehavior;
}

- (CGFloat)interGroupSpacing
{
  return self->_interGroupSpacing;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  trailing = self->_contentInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (BOOL)_clipsContentToBounds
{
  return self->__clipsContentToBounds;
}

- (UIContentInsetsReference)contentInsetsReference
{
  return self->_contentInsetsReference;
}

- (NSArray)decorationItems
{
  return self->_decorationItems;
}

- (NSArray)boundarySupplementaryItems
{
  return self->_boundarySupplementaryItems;
}

- (NSCollectionLayoutGroup)group
{
  return self->_group;
}

- (UIContentInsetsReference)supplementaryContentInsetsReference
{
  return self->_supplementaryContentInsetsReference;
}

- (double)_preBoundaryPadding
{
  return self->__preBoundaryPadding;
}

- (double)_postBoundaryPadding
{
  return self->__postBoundaryPadding;
}

- (BOOL)supplementariesFollowContentInsets
{
  return self->_supplementariesFollowContentInsets;
}

- (id)pinnedBoundarySupplementaryItemIndexes
{
  NSIndexSet *pinnedBoundarySupplementaryItemIndexes;
  NSIndexSet **p_pinnedBoundarySupplementaryItemIndexes;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  p_pinnedBoundarySupplementaryItemIndexes = &self->_pinnedBoundarySupplementaryItemIndexes;
  pinnedBoundarySupplementaryItemIndexes = self->_pinnedBoundarySupplementaryItemIndexes;
  if (!pinnedBoundarySupplementaryItemIndexes)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy_;
    v12 = __Block_byref_object_dispose_;
    v13 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    -[NSCollectionLayoutSection boundarySupplementaryItems](self, "boundarySupplementaryItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__NSCollectionLayoutSection_pinnedBoundarySupplementaryItemIndexes__block_invoke;
    v7[3] = &unk_1EA7CE3E8;
    v7[4] = &v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

    objc_storeStrong((id *)p_pinnedBoundarySupplementaryItemIndexes, (id)v9[5]);
    _Block_object_dispose(&v8, 8);

    pinnedBoundarySupplementaryItemIndexes = *p_pinnedBoundarySupplementaryItemIndexes;
  }
  return pinnedBoundarySupplementaryItemIndexes;
}

- (BOOL)_clipsBackgroundDecorationsToContent
{
  return self->__clipsBackgroundDecorationsToContent;
}

- (NSCollectionLayoutSectionVisibleItemsInvalidationHandler)visibleItemsInvalidationHandler
{
  return self->_visibleItemsInvalidationHandler;
}

- (BOOL)_excludesBoundarySupplementariesFromClipping
{
  return self->__excludesBoundarySupplementariesFromClipping;
}

- (double)_cornerRadius
{
  return self->__cornerRadius;
}

- (CVCDirectionalEdgeInsets)_clippingInsets
{
  double top;
  double leading;
  double bottom;
  double trailing;
  CVCDirectionalEdgeInsets result;

  top = self->__clippingInsets.top;
  leading = self->__clippingInsets.leading;
  bottom = self->__clippingInsets.bottom;
  trailing = self->__clippingInsets.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (id)_orthogonalScrollingProperties
{
  return self->_orthogonalScrollingProperties;
}

- (NSArray)supplementaryItems
{
  return self->_supplementaryItems;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v15;
  double v16;
  double v17;
  void *v18;
  BOOL v19;
  void *v20;
  UICollectionLayoutSectionOrthogonalScrollingBehavior v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  uint64_t v28;
  uint64_t v29;
  UIContentInsetsReference v30;
  void *v31;

  v31 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NSCollectionLayoutSection group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSection contentInsets](self, "contentInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v30 = -[NSCollectionLayoutSection contentInsetsReference](self, "contentInsetsReference");
  -[NSCollectionLayoutSection supplementaryItems](self, "supplementaryItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSection boundarySupplementaryItems](self, "boundarySupplementaryItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSection pinnedSupplementaryItemIndexes](self, "pinnedSupplementaryItemIndexes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCollectionLayoutSection interGroupSpacing](self, "interGroupSpacing");
  v17 = v16;
  -[NSCollectionLayoutSection visibleItemsInvalidationHandler](self, "visibleItemsInvalidationHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NSCollectionLayoutSection supplementariesFollowContentInsets](self, "supplementariesFollowContentInsets");
  -[NSCollectionLayoutSection decorationItems](self, "decorationItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[NSCollectionLayoutSection orthogonalScrollingBehavior](self, "orthogonalScrollingBehavior");
  v22 = -[NSCollectionLayoutSection _isEmptySection](self, "_isEmptySection");
  BYTE1(v29) = -[NSCollectionLayoutSection prefersListSolver](self, "prefersListSolver");
  LOBYTE(v29) = v22;
  LOBYTE(v28) = v19;
  v23 = objc_msgSend(v31, "initWithGroup:contentInsets:contentInsetsReference:supplementaryItems:boundarySupplementaryItems:pinnedSupplementaryItemIndexes:interGroupSpacing:visibleItemsInvalidationHandler:supplementariesFollowInsets:decorationItems:orthogonalScrollingBehavior:isEmptySection:prefersListSolver:", v4, v30, v13, v14, v15, v18, v6, v8, v10, v12, v17, v28, v20, v21, v29);

  v24 = -[UICollectionLayoutSectionOrthogonalScrollingProperties copy](self->_orthogonalScrollingProperties, "copy");
  v25 = *(void **)(v23 + 48);
  *(_QWORD *)(v23 + 48) = v24;

  *(double *)(v23 + 160) = self->__cornerRadius;
  *(_BYTE *)(v23 + 57) = self->__clipsContentToBounds;
  *(_BYTE *)(v23 + 58) = self->__excludesBoundarySupplementariesFromClipping;
  *(_BYTE *)(v23 + 59) = self->__clipsBackgroundDecorationsToContent;
  v26 = *(_OWORD *)&self->__clippingInsets.top;
  *(_OWORD *)(v23 + 248) = *(_OWORD *)&self->__clippingInsets.bottom;
  *(_OWORD *)(v23 + 232) = v26;
  *(double *)(v23 + 168) = self->__preBoundaryPadding;
  *(double *)(v23 + 176) = self->__postBoundaryPadding;
  *(_QWORD *)(v23 + 80) = self->_supplementaryContentInsetsReference;
  return (id)v23;
}

- (BOOL)_isEmptySection
{
  return self->_isEmptySection;
}

- (NSIndexSet)pinnedSupplementaryItemIndexes
{
  return self->_pinnedSupplementaryItemIndexes;
}

- (NSCollectionLayoutSection)initWithLayoutGroup:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSCollectionLayoutSection *v7;
  uint64_t v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB36B8];
  v5 = a3;
  objc_msgSend(v4, "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v10) = 0;
  LOBYTE(v9) = 1;
  v7 = -[NSCollectionLayoutSection initWithGroup:contentInsets:contentInsetsReference:supplementaryItems:boundarySupplementaryItems:pinnedSupplementaryItemIndexes:interGroupSpacing:visibleItemsInvalidationHandler:supplementariesFollowInsets:decorationItems:orthogonalScrollingBehavior:isEmptySection:prefersListSolver:](self, "initWithGroup:contentInsets:contentInsetsReference:supplementaryItems:boundarySupplementaryItems:pinnedSupplementaryItemIndexes:interGroupSpacing:visibleItemsInvalidationHandler:supplementariesFollowInsets:decorationItems:orthogonalScrollingBehavior:isEmptySection:prefersListSolver:", v5, 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v6, 0, 0.0, 0.0, 0.0, 0.0, 0.0, v9, 0, 0, v10);

  return v7;
}

- (BOOL)prefersListSolver
{
  return self->_prefersListSolver;
}

- (void)setDecorationItems:(NSArray *)decorationItems
{
  objc_class *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99D20];
  v5 = decorationItems;
  v6 = (NSArray *)objc_msgSend([v4 alloc], "initWithArray:copyItems:", v5, 1);

  v7 = self->_decorationItems;
  self->_decorationItems = v6;

  self->_hasBackgroundDecorationItem = -[NSCollectionLayoutSection _containsBackgroundDecorationItem:](self, "_containsBackgroundDecorationItem:", self->_decorationItems);
}

- (NSCollectionLayoutSection)initWithGroup:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 contentInsetsReference:(int64_t)a5 supplementaryItems:(id)a6 boundarySupplementaryItems:(id)a7 pinnedSupplementaryItemIndexes:(id)a8 interGroupSpacing:(double)a9 visibleItemsInvalidationHandler:(id)a10 supplementariesFollowInsets:(BOOL)a11 decorationItems:(id)a12 orthogonalScrollingBehavior:(int64_t)a13 isEmptySection:(BOOL)a14 prefersListSolver:(BOOL)a15
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSCollectionLayoutSection *v33;
  uint64_t v34;
  NSCollectionLayoutGroup *group;
  uint64_t v36;
  NSArray *supplementaryItems;
  uint64_t v38;
  NSArray *boundarySupplementaryItems;
  uint64_t v40;
  NSIndexSet *pinnedSupplementaryItemIndexes;
  uint64_t v42;
  id visibleItemsInvalidationHandler;
  NSIndexSet *pinnedBoundarySupplementaryItemIndexes;
  uint64_t v45;
  NSArray *decorationItems;
  void *v48;
  objc_super v49;

  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  v27 = a3;
  v28 = a6;
  v29 = a7;
  v30 = a8;
  v31 = a10;
  v32 = a12;
  if (!v27 && !a14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCollectionLayoutItem.m"), 1015, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("group"));

  }
  v49.receiver = self;
  v49.super_class = (Class)NSCollectionLayoutSection;
  v33 = -[NSCollectionLayoutSection init](&v49, sel_init);
  if (v33)
  {
    v34 = objc_msgSend(v27, "copy");
    group = v33->_group;
    v33->_group = (NSCollectionLayoutGroup *)v34;

    v33->_contentInsets.top = top;
    v33->_contentInsets.leading = leading;
    v33->_contentInsets.bottom = bottom;
    v33->_contentInsets.trailing = trailing;
    v33->_contentInsetsReference = a5;
    v36 = objc_msgSend(v28, "copy");
    supplementaryItems = v33->_supplementaryItems;
    v33->_supplementaryItems = (NSArray *)v36;

    v38 = objc_msgSend(v29, "copy");
    boundarySupplementaryItems = v33->_boundarySupplementaryItems;
    v33->_boundarySupplementaryItems = (NSArray *)v38;

    v40 = objc_msgSend(v30, "copy");
    pinnedSupplementaryItemIndexes = v33->_pinnedSupplementaryItemIndexes;
    v33->_pinnedSupplementaryItemIndexes = (NSIndexSet *)v40;

    v33->_interGroupSpacing = a9;
    v42 = objc_msgSend(v31, "copy");
    visibleItemsInvalidationHandler = v33->_visibleItemsInvalidationHandler;
    v33->_visibleItemsInvalidationHandler = (id)v42;

    v33->_supplementariesFollowContentInsets = a11;
    pinnedBoundarySupplementaryItemIndexes = v33->_pinnedBoundarySupplementaryItemIndexes;
    v33->_pinnedBoundarySupplementaryItemIndexes = 0;

    v45 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v32, 1);
    decorationItems = v33->_decorationItems;
    v33->_decorationItems = (NSArray *)v45;

    v33->_hasBackgroundDecorationItem = -[NSCollectionLayoutSection _containsBackgroundDecorationItem:](v33, "_containsBackgroundDecorationItem:", v33->_decorationItems);
    v33->_orthogonalScrollingBehavior = a13;
    v33->_isEmptySection = a14;
    v33->_prefersListSolver = a15;
  }

  return v33;
}

- (BOOL)_containsBackgroundDecorationItem:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isBackgroundDecoration", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

void __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "supplementaryItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "elementKind");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[4], CFSTR("NSCollectionLayoutItem.m"), 1370, CFSTR("Error: no elementKind for supplementary. Please file a bug on UICollectionView as this should not be possible."));

        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v8);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)_containsEstimatedSizeElement
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_isEmptySection)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_boundarySupplementaryItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "size", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEstimated");

        if ((v10 & 1) != 0)
        {

          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  return -[NSCollectionLayoutItem containsEstimatedSizeItem](self->_group, "containsEstimatedSizeItem");
}

- (UICollectionLayoutSectionOrthogonalScrollingProperties)orthogonalScrollingProperties
{
  UICollectionLayoutSectionOrthogonalScrollingProperties *orthogonalScrollingProperties;
  UICollectionLayoutSectionOrthogonalScrollingProperties *v4;
  UICollectionLayoutSectionOrthogonalScrollingProperties *v5;

  orthogonalScrollingProperties = self->_orthogonalScrollingProperties;
  if (!orthogonalScrollingProperties)
  {
    v4 = objc_alloc_init(UICollectionLayoutSectionOrthogonalScrollingProperties);
    v5 = self->_orthogonalScrollingProperties;
    self->_orthogonalScrollingProperties = v4;

    orthogonalScrollingProperties = self->_orthogonalScrollingProperties;
  }
  return orthogonalScrollingProperties;
}

- (BOOL)_wantsSwipeActions
{
  return 0;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)contentInsets
{
  self->_contentInsets = (CVCDirectionalEdgeInsets)contentInsets;
}

- (void)setContentInsetsReference:(UIContentInsetsReference)contentInsetsReference
{
  self->_contentInsetsReference = contentInsetsReference;
}

- (void)setInterGroupSpacing:(CGFloat)interGroupSpacing
{
  self->_interGroupSpacing = interGroupSpacing;
}

- (double)_paddingToBoundarySupplementaries
{
  return 0.0;
}

- (void)setVisibleItemsInvalidationHandler:(NSCollectionLayoutSectionVisibleItemsInvalidationHandler)visibleItemsInvalidationHandler
{
  objc_setProperty_nonatomic_copy(self, a2, visibleItemsInvalidationHandler, 104);
}

- (void)setOrthogonalScrollingBehavior:(UICollectionLayoutSectionOrthogonalScrollingBehavior)orthogonalScrollingBehavior
{
  self->_orthogonalScrollingBehavior = orthogonalScrollingBehavior;
}

- (BOOL)_hasVisibleItemsHandler
{
  void *v2;
  BOOL v3;

  -[NSCollectionLayoutSection visibleItemsInvalidationHandler](self, "visibleItemsInvalidationHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_isListSolverCompatibleForLayoutAxis:(unint64_t)a3
{
  char v5;
  void *v6;

  if (!self->_prefersListSolver)
    return 0;
  v5 = -[NSCollectionLayoutSection scrollsOrthogonally](self, "scrollsOrthogonally");
  -[NSCollectionLayoutSection group](self, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "_isListSolverCompatibleForLayoutAxis:", a3);

  return a3 & ~v5;
}

uint64_t __67__NSCollectionLayoutSection_pinnedBoundarySupplementaryItemIndexes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "pinToVisibleBounds");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addIndex:", a3);
  return result;
}

- (void)setBoundarySupplementaryItems:(NSArray *)boundarySupplementaryItems
{
  NSArray *v4;
  NSArray *v5;
  NSIndexSet *pinnedBoundarySupplementaryItemIndexes;

  v4 = (NSArray *)-[NSArray copy](boundarySupplementaryItems, "copy");
  v5 = self->_boundarySupplementaryItems;
  self->_boundarySupplementaryItems = v4;

  pinnedBoundarySupplementaryItemIndexes = self->_pinnedBoundarySupplementaryItemIndexes;
  self->_pinnedBoundarySupplementaryItemIndexes = 0;

}

+ (NSCollectionLayoutSection)sectionWithGroup:(NSCollectionLayoutGroup *)group
{
  NSCollectionLayoutGroup *v4;
  void *v5;

  v4 = group;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLayoutGroup:", v4);

  return (NSCollectionLayoutSection *)v5;
}

- (id)_auxillaryItemForElementKind:(id)a3 category:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = v6;
  v8 = 0;
  if (a4 && !self->_isEmptySection)
  {
    if (objc_msgSend(v6, "length"))
    {
      if (a4 == 1)
      {
        -[NSCollectionLayoutSection supplementaryItemsDict](self, "supplementaryItemsDict");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if (a4 == 2)
      {
        -[NSCollectionLayoutSection decorationItemsDict](self, "decorationItemsDict");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v10 = v9;
        objc_msgSend(v9, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
    }
    v8 = 0;
  }
LABEL_10:

  return v8;
}

- (id)decorationItemsDict
{
  NSDictionary *decorationItemsDict;
  NSDictionary *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSDictionary *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_isEmptySection)
    return MEMORY[0x1E0C9AA70];
  decorationItemsDict = self->_decorationItemsDict;
  if (!decorationItemsDict)
  {
    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSCollectionLayoutSection decorationItems](self, "decorationItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "elementKind");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v13 = self->_decorationItemsDict;
    self->_decorationItemsDict = v5;

    decorationItemsDict = self->_decorationItemsDict;
  }
  return decorationItemsDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_decorationItemssDict, 0);
  objc_storeStrong((id *)&self->_pinnedSupplementaryItemIndexes, 0);
  objc_storeStrong((id *)&self->_supplementaryItems, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_decorationItems, 0);
  objc_storeStrong(&self->_visibleItemsInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_boundarySupplementaryItems, 0);
  objc_storeStrong((id *)&self->_orthogonalScrollingProperties, 0);
  objc_storeStrong((id *)&self->_decorationItemsDict, 0);
  objc_storeStrong((id *)&self->_supplementaryItemsDict, 0);
  objc_storeStrong((id *)&self->_pinnedBoundarySupplementaryItemIndexes, 0);
}

- (id)_preferredContainerBackgroundColor
{
  return 0;
}

- (void)setSupplementariesFollowContentInsets:(BOOL)supplementariesFollowContentInsets
{
  void *v6;

  if (supplementariesFollowContentInsets
    && -[NSCollectionLayoutSection supplementaryContentInsetsReference](self, "supplementaryContentInsetsReference"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCollectionLayoutItem.m"), 1070, CFSTR("Mixing supplementariesFollowContentInsets and supplementaryContentInsetsReference is not supported. Please use supplementaryContentInsetsReference and the contentInsets property on the boundary supplementary item to get the desired behavior."));

  }
  self->_supplementariesFollowContentInsets = supplementariesFollowContentInsets;
}

- (id)_backgroundDecorationViewsRequiringCustomViewClassRegistration
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_hasBackgroundDecorationItem)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[NSCollectionLayoutSection decorationItems](self, "decorationItems", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v9, "isBackgroundDecoration") && objc_msgSend(v9, "_registrationViewClass"))
            objc_msgSend(v3, "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = (id)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

- (void)_setExcludesBoundarySupplementariesFromClipping:(BOOL)a3
{
  self->__excludesBoundarySupplementariesFromClipping = a3;
}

- (void)_setCornerRadius:(double)a3
{
  self->__cornerRadius = a3;
}

- (void)_setClipsContentToBounds:(BOOL)a3
{
  self->__clipsContentToBounds = a3;
}

- (void)_setClipsBackgroundDecorationsToContent:(BOOL)a3
{
  self->__clipsBackgroundDecorationsToContent = a3;
}

- (void)setSupplementaryContentInsetsReference:(UIContentInsetsReference)supplementaryContentInsetsReference
{
  self->_supplementaryContentInsetsReference = supplementaryContentInsetsReference;
  -[NSCollectionLayoutSection setSupplementariesFollowContentInsets:](self, "setSupplementariesFollowContentInsets:", 0);
}

- (void)_checkForDuplicateSupplementaryItemKindsAndThrowIfFound
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  if (!self->_isEmptySection)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy_;
    v33 = __Block_byref_object_dispose_;
    v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke;
    v22[3] = &unk_1EA7CE410;
    v22[4] = self;
    v22[5] = &v29;
    v22[6] = &v23;
    v22[7] = a2;
    v5 = (void *)MEMORY[0x1DF0DB6D0](v22);
    -[NSCollectionLayoutSection group](self, "group");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke_2;
    v20[3] = &unk_1EA7CE3C0;
    v7 = v5;
    v21 = v7;
    objc_msgSend(v6, "_enumerateItemsWithHandler:", v20);

    -[NSCollectionLayoutSection boundarySupplementaryItems](self, "boundarySupplementaryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v8);

    v9 = objc_msgSend((id)v24[5], "count");
    if (v9 != objc_msgSend((id)v30[5], "count"))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = (void *)v30[5];
      v14 = v4;
      v15 = 3221225472;
      v16 = __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke_3;
      v17 = &unk_1EA7CE438;
      v19 = &v23;
      v12 = v10;
      v18 = v12;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v14);
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSCollectionLayoutItem.m"), 1398, CFSTR("Error: Every supplementary must have a unique elementKind: duplicates detected: %@"), v12, v14, v15, v16, v17);

    }
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
  }
}

- (id)_descriptionProperties
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  double top;
  double leading;
  double bottom;
  void *v11;
  __CFString *v12;
  void *v13;
  int64_t contentInsetsReference;
  void *v15;
  void *v16;
  void *v17;
  int64_t supplementaryContentInsetsReference;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t orthogonalScrollingBehavior;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("group = <%@: %p>"), v6, self->_group);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  top = self->_contentInsets.top;
  leading = self->_contentInsets.leading;
  bottom = self->_contentInsets.bottom;
  if (leading != 0.0 || top != 0.0 || self->_contentInsets.trailing != 0.0 || bottom != 0.0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("{%.*g, %.*g, %.*g, %.*g}"), 17, *(_QWORD *)&top, 17, *(_QWORD *)&leading, 17, *(_QWORD *)&bottom, 17, *(_QWORD *)&self->_contentInsets.trailing);
    objc_msgSend(v11, "stringWithFormat:", CFSTR("contentInsets = %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  contentInsetsReference = self->_contentInsetsReference;
  if (contentInsetsReference)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    _CVCContentInsetsReferenceDescription(contentInsetsReference);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("contentInsetsReference = %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

  }
  supplementaryContentInsetsReference = self->_supplementaryContentInsetsReference;
  if (supplementaryContentInsetsReference)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    _CVCContentInsetsReferenceDescription(supplementaryContentInsetsReference);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("supplementaryContentInsetsReference = %@"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  else if (!self->_supplementariesFollowContentInsets)
  {
    objc_msgSend(v3, "addObject:", CFSTR("supplementariesFollowContentInsets = NO"));
  }
  if (self->_interGroupSpacing != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("interGroupSpacing = %g"), *(_QWORD *)&self->_interGroupSpacing);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

  }
  orthogonalScrollingBehavior = self->_orthogonalScrollingBehavior;
  if (orthogonalScrollingBehavior)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    if (orthogonalScrollingBehavior >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown value: %ld)"), self->_orthogonalScrollingBehavior);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1EA7CE4D8[orthogonalScrollingBehavior - 1];
    }
    objc_msgSend(v24, "stringWithFormat:", CFSTR("orthogonalScrollingBehavior = %@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v26);

    if (self->_orthogonalScrollingProperties)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("orthogonalScrollingProperties = %@"), self->_orthogonalScrollingProperties);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v27);

    }
  }
  if (-[NSArray count](self->_boundarySupplementaryItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("boundarySupplementaryItems = <%p>"), self->_boundarySupplementaryItems);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v28);

  }
  if (-[NSArray count](self->_decorationItems, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("decorationItems = <%p>"), self->_decorationItems);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSCollectionLayoutSection _descriptionProperties](self, "_descriptionProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("; "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v6, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_emptySection
{
  id v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  LOWORD(v7) = 1;
  LOBYTE(v6) = 0;
  v4 = (void *)objc_msgSend(v2, "initWithGroup:contentInsets:contentInsetsReference:supplementaryItems:boundarySupplementaryItems:pinnedSupplementaryItemIndexes:interGroupSpacing:visibleItemsInvalidationHandler:supplementariesFollowInsets:decorationItems:orthogonalScrollingBehavior:isEmptySection:prefersListSolver:", 0, 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v3, 0, 0.0, 0.0, 0.0, 0.0, 0.0, v6, MEMORY[0x1E0C9AA60], 0, v7);

  return v4;
}

void __84__NSCollectionLayoutSection__checkForDuplicateSupplementaryItemKindsAndThrowIfFound__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObjectAtIndex:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "indexOfObject:", v3));
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "indexOfObject:", v3) != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (NSDictionary)supplementaryItemsDict
{
  NSDictionary *supplementaryItemsDict;
  NSDictionary *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  NSDictionary *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_isEmptySection)
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
  supplementaryItemsDict = self->_supplementaryItemsDict;
  if (!supplementaryItemsDict)
  {
    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[NSCollectionLayoutSection supplementaryItems](self, "supplementaryItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v11, "elementKind");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v8);
    }

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[NSCollectionLayoutSection boundarySupplementaryItems](self, "boundarySupplementaryItems", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
          objc_msgSend(v18, "elementKind");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v18, v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v15);
    }

    v20 = self->_supplementaryItemsDict;
    self->_supplementaryItemsDict = v5;

    supplementaryItemsDict = self->_supplementaryItemsDict;
  }
  return supplementaryItemsDict;
}

- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3
{
  return 0;
}

- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3
{
  return 0;
}

- (BOOL)shouldRestrictOrthogonalAxisDuringInteractiveMovement
{
  return 0;
}

- (BOOL)_pinnedSupplementariesShouldOverlap
{
  return 0;
}

- (BOOL)_wantsBandSelectionVisuals
{
  return 1;
}

- (void)setGroup:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setSupplementaryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setPinnedSupplementaryItemIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDictionary)decorationItemssDict
{
  return self->_decorationItemssDict;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void)_setClippingInsets:(CVCDirectionalEdgeInsets)a3
{
  self->__clippingInsets = a3;
}

- (void)_setPreBoundaryPadding:(double)a3
{
  self->__preBoundaryPadding = a3;
}

- (void)_setPostBoundaryPadding:(double)a3
{
  self->__postBoundaryPadding = a3;
}

- (void)setPrefersListSolver:(BOOL)a3
{
  self->_prefersListSolver = a3;
}

@end
