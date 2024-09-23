@implementation UICollectionView(CKUtilities)

- (id)__ck_indexPathForLastItem
{
  uint64_t v1;
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;

  v1 = objc_msgSend(a1, "numberOfItemsInSection:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsReplyButtonsInTranscript");

  v4 = -5;
  if (!v3)
    v4 = -1;
  if (v4 + v1 < 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v4 + v1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)__ck_indexPathForInputView
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "numberOfItemsInSection:", 0);
  v2 = 0;
  if (v1 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v1 - 3, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)__ck_indexPathForRepliesList
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "numberOfItemsInSection:", 0);
  v2 = 0;
  if (v1 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v1 - 2, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (double)__ck_contentSize
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "collectionViewLayout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "collectionViewContentSize");
  v3 = v2;

  return v3;
}

- (BOOL)__ck_isScrolledToBottomHidingIndexPath:()CKUtilities
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "__ck_bottomOffsetHidingIndexPath:");
  v3 = v2;
  objc_msgSend(a1, "contentOffset");
  return v4 >= v3 + -0.00000011920929;
}

- (uint64_t)__ck_bottomOffsetHidingIndexPath:()CKUtilities
{
  return objc_msgSend(a1, "__ck_bottomOffsetHidingIndexPath:skippingLayoutUpdate:", a3, 0);
}

- (double)__ck_bottomOffsetHidingIndexPath:()CKUtilities skippingLayoutUpdate:
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)UICollectionView_0;
  objc_msgSendSuper2(&v13, sel___ck_bottomOffset);
  v8 = v7;
  if (v6)
  {
    if ((a4 & 1) == 0)
    {
      objc_msgSend(a1, "setNeedsLayout");
      objc_msgSend(a1, "layoutIfNeeded");
    }
    objc_msgSend(a1, "collectionViewLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutAttributesForItemAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");

    objc_msgSend(a1, "contentInset");
    objc_msgSend(a1, "bounds");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomTranscriptSpace");

    if (CKMainScreenScale_once_20 != -1)
      dispatch_once(&CKMainScreenScale_once_20, &__block_literal_global_1415);
  }
  objc_msgSend(a1, "__ck_scrollToTopContentOffset");

  return v8;
}

- (double)__ck_offsetForTopOfCellAtIndexPath:()CKUtilities hidingCellAtIndexPath:
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "contentOffset");
  v9 = v8;
  objc_msgSend(a1, "collectionViewLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutAttributesForItemAtIndexPath:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "frame");
    objc_msgSend(a1, "contentInset");
  }
  else
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[UICollectionView(CKUtilities) __ck_offsetForTopOfCellAtIndexPath:hidingCellAtIndexPath:].cold.2((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);

  }
  objc_msgSend(a1, "__ck_scrollToTopContentOffset");
  if (v7)
  {
    objc_msgSend(v10, "layoutAttributesForItemAtIndexPath:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "frame");
      objc_msgSend(a1, "bounds");
      if (CKMainScreenScale_once_20 != -1)
        dispatch_once(&CKMainScreenScale_once_20, &__block_literal_global_1415);
    }
    else
    {
      IMLogHandleForCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[UICollectionView(CKUtilities) __ck_offsetForTopOfCellAtIndexPath:hidingCellAtIndexPath:].cold.1((uint64_t)v7, v22, v23, v24, v25, v26, v27, v28);

    }
  }

  return v9;
}

- (void)__ck_reloadDataKeepingSelection
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "indexPathsForSelectedItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reloadData");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(a1, "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 0, 0, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)__ck_offsetForTopOfCellAtIndexPath:()CKUtilities hidingCellAtIndexPath:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Could not hide index path %@, did not find layout attributes.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)__ck_offsetForTopOfCellAtIndexPath:()CKUtilities hidingCellAtIndexPath:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Could not scroll to index path %@, did not find layout attributes.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
