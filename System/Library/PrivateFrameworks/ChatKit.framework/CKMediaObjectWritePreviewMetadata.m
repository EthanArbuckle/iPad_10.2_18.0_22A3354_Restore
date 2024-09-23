@implementation CKMediaObjectWritePreviewMetadata

void ___CKMediaObjectWritePreviewMetadata_block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "previewMetadataFilenameExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMAttachmentPreviewMetadataFileURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Persisting preview metadata to URL %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "writePreviewMetadata:toURL:error:", *(_QWORD *)(a1 + 40), v5, 0);

}

@end
