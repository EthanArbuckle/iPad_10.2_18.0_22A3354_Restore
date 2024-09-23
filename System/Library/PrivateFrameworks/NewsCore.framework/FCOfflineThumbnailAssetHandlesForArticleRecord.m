@implementation FCOfflineThumbnailAssetHandlesForArticleRecord

void __FCOfflineThumbnailAssetHandlesForArticleRecord_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "useSmallestArticleThumbnails")
    && (objc_msgSend(*(id *)(a1 + 40), "thumbnailLQURL"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v4, "thumbnailLQURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generateThumbnailAssetHandleForURL:withAssetManager:", v5, *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fc_safelyAddObject:", v6);

  }
  else
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(id *)(a1 + 40);
    v9 = v7;
    if (qword_1ED0F8350 != -1)
      dispatch_once(&qword_1ED0F8350, &__block_literal_global_85);
    if (_MergedGlobals_170
      && (objc_msgSend(v8, "thumbnailHQURL"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
    {
      objc_msgSend(v8, "thumbnailHQURL");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "thumbnailURL");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    objc_msgSend(v8, "generateThumbnailAssetHandleForURL:withAssetManager:", v11, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "fc_safelyAddObject:", v5);
  }

  v13 = *(void **)(a1 + 40);
  objc_msgSend(v13, "videoStillImageURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "generateThumbnailAssetHandleForURL:withAssetManager:", v14, *(_QWORD *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fc_safelyAddObject:", v15);

}

@end
