@implementation FCOfflineThumbnailAssetHandlesForPuzzle

void __FCOfflineThumbnailAssetHandlesForPuzzle_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "thumbnailSmallImageAssetHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_safelyAddObject:", v3);

  objc_msgSend(*(id *)(a1 + 32), "puzzleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exploreTileImageAssetHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_safelyAddObject:", v5);

  if ((objc_msgSend(*(id *)(a1 + 40), "useSmallestPuzzleThumbnails") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "thumbnailLargeImageAssetHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fc_safelyAddObject:", v6);

  }
}

@end
