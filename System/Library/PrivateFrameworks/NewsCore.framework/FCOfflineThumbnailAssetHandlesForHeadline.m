@implementation FCOfflineThumbnailAssetHandlesForHeadline

void __FCOfflineThumbnailAssetHandlesForHeadline_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "useSmallestArticleThumbnails")
    && (objc_msgSend(*(id *)(a1 + 40), "thumbnailLQ"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "thumbnailLQ");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "thumbnailAssetHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fc_safelyAddObject:", v5);

  }
  else
  {
    v6 = *(id *)(a1 + 40);
    if (qword_1ED0F8350 != -1)
      dispatch_once(&qword_1ED0F8350, &__block_literal_global_85);
    if (_MergedGlobals_170
      && (objc_msgSend(v6, "thumbnailHQ"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      objc_msgSend(v6, "thumbnailHQ");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "thumbnail");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    objc_msgSend(v8, "thumbnailAssetHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "fc_safelyAddObject:", v4);
  }

  objc_msgSend(*(id *)(a1 + 40), "videoStillImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fc_safelyAddObject:", v10);

}

@end
