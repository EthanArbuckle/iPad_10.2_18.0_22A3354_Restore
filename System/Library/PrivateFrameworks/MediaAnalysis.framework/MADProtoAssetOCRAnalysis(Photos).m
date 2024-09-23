@implementation MADProtoAssetOCRAnalysis(Photos)

+ (void)protoFromPhotosAsset:()Photos .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[%@] Failed to fetch asset's cloud identifier: %@", (uint8_t *)&v4, 0x16u);

}

@end
