@implementation ICAttachment(CloudKit)

- (void)mergeCloudKitRecord:()CloudKit accountID:approach:mergeableFieldState:newAttachment:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1BD918000, v0, OS_LOG_TYPE_ERROR, "Error creating unarchiver: %@", v1, 0xCu);
}

- (void)makeCloudKitRecordForApproach:()CloudKit mergeableFieldState:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Couldn't archive placemark: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

+ (void)noteFromAttachmentUserSpecificRecord:()CloudKit accountID:context:.cold.1()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "recordID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "recordName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Attachment user-specific record (%@) for account (%@) does not have a note reference", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)addPreviewImages:()CloudKit toRecord:.cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1BD918000, a4, OS_LOG_TYPE_ERROR, "Error creating asset for preview image: %@", a1, 0xCu);

}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot begin attachment fallback asset generation {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Processed fallback asset — committing… {attachment: %@}", v4, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot copy unsupported attachment fallback asset — rolling back… {attachment: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot link unsupported attachment fallback asset — trying copying… {attachment: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.5()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot move unsupported attachment fallback asset — trying linking… {attachment: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.6(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Fallback asset URL is not reachable {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)mergePaperBundleFromRecord:()CloudKit .cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "ic_loggingIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Failed writing new version of synced paper bundle (%@): %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
