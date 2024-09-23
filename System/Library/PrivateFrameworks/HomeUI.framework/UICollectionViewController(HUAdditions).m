@implementation UICollectionViewController(HUAdditions)

- (id)hu_actionSheetWithTitle:()HUAdditions message:indexPath:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForItemAtIndexPath:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(a1, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceView:", v12);

  }
  return v9;
}

- (uint64_t)hu_shouldScrollToTop
{
  void *v2;
  double v3;
  _BOOL8 v4;

  if (!objc_msgSend(a1, "isViewLoaded"))
    return 1;
  objc_msgSend(a1, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustedContentInset");
  v4 = v3 <= 0.0;

  return v4;
}

@end
