@implementation UICollectionView(MailUI)

- (id)mui_sortedIndexPathsForVisibleItems
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "indexPathsForVisibleItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortedArrayUsingSelector:", sel_compare_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)mui_indexPathsForPreparedItems
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD block[5];

  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__UICollectionView_MailUI__mui_indexPathsForPreparedItems__block_invoke;
  block[3] = &unk_1E99E1258;
  block[4] = a1;
  if (mui_indexPathsForPreparedItems_onceToken != -1)
    dispatch_once(&mui_indexPathsForPreparedItems_onceToken, block);
  if (mui_indexPathsForPreparedItems_shouldUseImprovedSPI)
  {
    objc_msgSend(a1, "_indexPathsForPreparedItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "preparedCells");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v2;
    v6[1] = 3221225472;
    v6[2] = __58__UICollectionView_MailUI__mui_indexPathsForPreparedItems__block_invoke_2;
    v6[3] = &unk_1E99E2838;
    v6[4] = a1;
    objc_msgSend(v4, "ef_compactMap:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (uint64_t)mui_selectItemAtIndexPath:()MailUI animated:scrollPosition:
{
  return objc_msgSend(a1, "selectItemAtIndexPath:animated:scrollPosition:", a3, a4, a5 == 1);
}

- (uint64_t)mui_scrollToItemAtIndexPath:()MailUI atScrollPosition:animated:
{
  return objc_msgSend(a1, "scrollToItemAtIndexPath:atScrollPosition:animated:", a3, a4 == 1);
}

- (double)mui_safeVisibleBounds
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "visibleBounds");
  v3 = v2;
  objc_msgSend(a1, "safeAreaInsets");
  return v3 + v4;
}

- (BOOL)mui_isIndexPathVisible:()MailUI
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  _BOOL8 v20;
  CGRect v22;
  CGRect v23;

  v4 = a3;
  objc_msgSend(a1, "indexPathsForVisibleItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    objc_msgSend(a1, "layoutAttributesForItemAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "mui_safeVisibleBounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "frame");
    v23.origin.x = v16;
    v23.origin.y = v17;
    v23.size.width = v18;
    v23.size.height = v19;
    v22.origin.x = v9;
    v22.origin.y = v11;
    v22.size.width = v13;
    v22.size.height = v15;
    v20 = CGRectContainsRect(v22, v23);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
