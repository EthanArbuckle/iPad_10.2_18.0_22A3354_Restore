@implementation IFImageBag(IconServicesAdditions)

+ (id)defaultAppIconAssetsBag
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (defaultAppIconAssetsBag_onceToken != -1)
    dispatch_once(&defaultAppIconAssetsBag_onceToken, &__block_literal_global_24);
  v0 = (void *)defaultAppIconAssetsBag_bag;
  if (!defaultAppIconAssetsBag_bag)
  {
    _ISDefaultLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      +[IFImageBag(IconServicesAdditions) defaultAppIconAssetsBag].cold.1(v1, v2, v3, v4, v5, v6, v7, v8);

    v0 = (void *)defaultAppIconAssetsBag_bag;
  }
  return v0;
}

+ (id)defaultAppClipAssetsBag
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (defaultAppClipAssetsBag_onceToken != -1)
    dispatch_once(&defaultAppClipAssetsBag_onceToken, &__block_literal_global_3_1);
  v0 = (void *)defaultAppClipAssetsBag_bag;
  if (!defaultAppClipAssetsBag_bag)
  {
    _ISDefaultLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      +[IFImageBag(IconServicesAdditions) defaultAppClipAssetsBag].cold.1(v1, v2, v3, v4, v5, v6, v7, v8);

    v0 = (void *)defaultAppClipAssetsBag_bag;
  }
  return v0;
}

+ (void)defaultAppIconAssetsBag
{
  OUTLINED_FUNCTION_0_3(&dword_1AA928000, a1, a3, "Failed to retrieve default app icon assets", a5, a6, a7, a8, 0);
}

+ (void)defaultAppClipAssetsBag
{
  OUTLINED_FUNCTION_0_3(&dword_1AA928000, a1, a3, "Failed to retrieve default app clip icon assets", a5, a6, a7, a8, 0);
}

@end
