@implementation JFXEffect(AssetDownloading)

- (void)registerMotionDocumentWithinAssets:()AssetDownloading .cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11();
  NSStringFromJFXEffectType(objc_msgSend(v1, "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v4, v5, "downloading assets for %@ %@ motion document not found", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_2();
}

- (void)registerMotionDocumentWithinAssets:()AssetDownloading .cold.2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_10_1();
  NSStringFromJFXEffectType(objc_msgSend(v1, "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_7(&dword_2269A9000, v4, v5, "downloading motion document for %@ %@ succeeded with path %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_6_2();
}

- (void)requestPreviewingAssetsWithPriority:()AssetDownloading onlyThumbnailAssetWhenAvailable:progressHandler:completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_2269A9000, a2, OS_LOG_TYPE_DEBUG, "requesting preview image for overlay %@", (uint8_t *)&v4, 0xCu);

}

@end
