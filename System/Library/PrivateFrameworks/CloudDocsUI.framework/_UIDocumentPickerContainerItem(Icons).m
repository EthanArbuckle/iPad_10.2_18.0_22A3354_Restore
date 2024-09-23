@implementation _UIDocumentPickerContainerItem(Icons)

+ (void)_blockingThumbnailForItem:()Icons documentProxy:withSize:scale:wantsBorder:generatedThumbnail:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_21F506000, v2, v3, "[DEBUG] No thumbnail found for %@, error %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)_blockingFolderIconForURL:()Icons container:size:scale:.cold.1(double a1, double a2, uint64_t a3, NSObject *a4)
{
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  NSStringFromCGSize(*(CGSize *)&a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_21F506000, a4, OS_LOG_TYPE_FAULT, "[ERROR] Unknown icon size %@ requested for file %@", v6, 0x16u);

  OUTLINED_FUNCTION_1();
}

@end
