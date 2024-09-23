@implementation FCOfflineThumbnailAssetHandlesForIssue

void __FCOfflineThumbnailAssetHandlesForIssue_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "coverImageAssetHandle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safelyAddObject:", v4);

}

@end
