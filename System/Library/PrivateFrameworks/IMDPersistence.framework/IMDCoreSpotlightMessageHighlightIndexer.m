@implementation IMDCoreSpotlightMessageHighlightIndexer

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  IMDSharedWithYouMetadataManager *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = objc_alloc_init(IMDSharedWithYouMetadataManager);
  -[IMDSharedWithYouMetadataManager updateAttributesWithSharedWithYouMetadata:withItem:chat:](v14, "updateAttributesWithSharedWithYouMetadata:withItem:chat:", v12, v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v17;
      _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "Message highlight indexer updating SearchableItem with identifier %@", (uint8_t *)&v18, 0xCu);

    }
  }

}

@end
