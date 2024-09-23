@implementation FCOfflineThumbnailAssetHandlesForPuzzleRecords

void __FCOfflineThumbnailAssetHandlesForPuzzleRecords_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "publishedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nsDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateThumbnailImageAssetHandleForDate:assetManager:", v5, *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fc_safelyAddObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "generateExploreTileImageAssetHandleWithAssetManager:", *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fc_safelyAddObject:", v7);

  if ((objc_msgSend(*(id *)(a1 + 56), "useSmallestPuzzleThumbnails") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "generateThumbnailLargeImageAssetHandleWithAssetManager:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fc_safelyAddObject:", v8);

  }
}

@end
