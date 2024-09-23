@implementation CNMeCardSharingOnboardingAvatarCarouselLayout

- (double)pagingLength
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[CNMeCardSharingOnboardingAvatarCarouselLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[CNMeCardSharingOnboardingAvatarCarouselLayout collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = floor(v5 - v7) * 0.5;

  v9 = floor(v8 * 0.5) + -10.0;
  -[CNMeCardSharingOnboardingAvatarCarouselLayout collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  -[CNMeCardSharingOnboardingAvatarCarouselLayout collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v17 = v12 - (v15 - v16 - v9);

  return v17;
}

- (double)pagingOrigin
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[CNMeCardSharingOnboardingAvatarCarouselLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[UICollectionViewFlowLayout itemSize](self, "itemSize");
  v7 = (v5 - v6) * -0.5;

  return v7;
}

- (int64_t)selectedPageIndex
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[CNMeCardSharingOnboardingAvatarCarouselLayout collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;
  -[CNMeCardSharingOnboardingAvatarCarouselLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNMeCardSharingOnboardingAvatarCarouselLayout indexPathForNearestItemToCenterWithOffset:collectionView:layout:](CNMeCardSharingOnboardingAvatarCarouselLayout, "indexPathForNearestItemToCenterWithOffset:collectionView:layout:", v8, self, v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "item");
  return v10;
}

- (double)pageOffsetForIndex:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[CNMeCardSharingOnboardingAvatarCarouselLayout collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveUserInterfaceLayoutDirection");

  if (v6 == 1)
  {
    -[CNMeCardSharingOnboardingAvatarCarouselLayout collectionView](self, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v7, "numberOfItemsInSection:", 0) + ~a3;

  }
  -[CNMeCardSharingOnboardingAvatarCarouselLayout collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3 <= 0)
  {
    objc_msgSend(v8, "_firstPageOffset");
    v13 = v14;
  }
  else
  {
    -[CNMeCardSharingOnboardingAvatarCarouselLayout pagingLength](self, "pagingLength");
    v11 = v10;
    -[CNMeCardSharingOnboardingAvatarCarouselLayout pagingOrigin](self, "pagingOrigin");
    v13 = v12 + v11 * (double)a3;
  }

  return v13;
}

- (CGRect)frameForElementAtIndex:(int64_t)a3 visibleBounds:(CGRect)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)indexesForElementsInRect:(CGRect)a3 visibleBounds:(CGRect)a4 numberOfItems:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v16, "indexPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "section");

        if (!v18)
        {
          objc_msgSend(v16, "indexPath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addIndex:", objc_msgSend(v19, "row"));

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }
  v20 = (void *)objc_msgSend(v10, "copy");

  return v20;
}

+ (id)indexPathForNearestItemToCenterWithOffset:(CGPoint)a3 collectionView:(id)a4 layout:(id)a5
{
  double y;
  double x;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void *v37;
  id v38;
  id v39;
  _QWORD *v40;
  uint64_t *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];
  _QWORD aBlock[6];
  CGRect v52;
  CGRect v53;
  CGRect v54;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "contentSize");
  v11 = v10;
  objc_msgSend(v8, "contentInset");
  v13 = v11 + v12;
  objc_msgSend(v8, "bounds");
  v14 = v13 - CGRectGetWidth(v52);
  if (x >= v14)
    x = v14;
  objc_msgSend(v8, "_firstPageOffset");
  if (v15 >= x)
    x = v15;
  objc_msgSend(v8, "bounds");
  v16 = CGRectGetWidth(v53) * 0.5 + x;
  objc_msgSend(v8, "bounds");
  v17 = y + CGRectGetHeight(v54) * 0.5;
  objc_msgSend(v8, "bounds");
  UIRectCenteredAboutPoint();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__CNMeCardSharingOnboardingAvatarCarouselLayout_indexPathForNearestItemToCenterWithOffset_collectionView_layout___block_invoke;
  aBlock[3] = &__block_descriptor_48_e39_d40__0_CGRect__CGPoint_dd__CGSize_dd__8l;
  *(CGFloat *)&aBlock[4] = v16;
  *(double *)&aBlock[5] = v17;
  v27 = _Block_copy(aBlock);
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0x7FEFFFFFFFFFFFFFLL;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v9, "indexesForElementsInRect:visibleBounds:numberOfItems:", objc_msgSend(v8, "numberOfItemsInSection:", 0), v19, v21, v23, v25, v19, v21, v23, v25);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v26;
  v35 = 3221225472;
  v36 = __113__CNMeCardSharingOnboardingAvatarCarouselLayout_indexPathForNearestItemToCenterWithOffset_collectionView_layout___block_invoke_2;
  v37 = &unk_1E2049DF8;
  v29 = v9;
  v38 = v29;
  v42 = v19;
  v43 = v21;
  v44 = v23;
  v45 = v25;
  v30 = v27;
  v39 = v30;
  v40 = v50;
  v41 = &v46;
  objc_msgSend(v28, "enumerateIndexesUsingBlock:", &v34);
  v31 = v47[3];
  if (v31 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v31, 0, v34, v35, v36, v37, v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);

  return v32;
}

double __113__CNMeCardSharingOnboardingAvatarCarouselLayout_indexPathForNearestItemToCenterWithOffset_collectionView_layout___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX;
  CGRect v12;

  MidX = CGRectGetMidX(*(CGRect *)&a2);
  v12.origin.x = a2;
  v12.origin.y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  CGRectGetMidY(v12);
  return vabdd_f64(MidX, *(double *)(a1 + 32));
}

void __113__CNMeCardSharingOnboardingAvatarCarouselLayout_indexPathForNearestItemToCenterWithOffset_collectionView_layout___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "frameForElementAtIndex:visibleBounds:", a2, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v4 = (*(double (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v4 < *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  }
}

@end
