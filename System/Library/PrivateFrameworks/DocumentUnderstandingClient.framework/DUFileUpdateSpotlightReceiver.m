@implementation DUFileUpdateSpotlightReceiver

- (id)supportedContentTypes
{
  return 0;
}

- (id)supportedBundleIDs
{
  return 0;
}

- (void)addOrUpdateSearchableItems:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t v13[16];

  v5 = a3;
  v6 = a4;
  if (+[DocumentUnderstandingFeatureFlagReader isSearchAndOrganizationDocumentIngestEnabled](_TtC27DocumentUnderstandingClient38DocumentUnderstandingFeatureFlagReader, "isSearchAndOrganizationDocumentIngestEnabled"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUnderstanding: calling by XPC into textunderstandingd for DUFileUpdateSpotlightReceiver", v13, 2u);
    }
    if (objc_msgSend(v5, "count"))
    {
      v7 = 0;
      while (1)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "attributeSet");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fileProviderID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "length"))
          goto LABEL_9;
        objc_msgSend(v9, "fileItemID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v12)
          break;
LABEL_10:

        if (++v7 >= (unint64_t)objc_msgSend(v5, "count"))
          goto LABEL_14;
      }
      +[DUXPCClient sharedInstance](DUXPCClient, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addOrUpdateSearchableItems:bundleID:completion:", v5, v6, &__block_literal_global_1);
LABEL_9:

      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
  {
    -[DUFileUpdateSpotlightReceiver addOrUpdateSearchableItems:bundleID:].cold.1();
  }
LABEL_14:

}

void __69__DUFileUpdateSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __69__DUFileUpdateSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke_cold_1((uint64_t)v2);

}

- (void)addOrUpdateSearchableItems:bundleID:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "DocumentUnderstanding: Ingest disabled, skipping XPC call to textunderstandingd", v0, 2u);
}

void __69__DUFileUpdateSpotlightReceiver_addOrUpdateSearchableItems_bundleID___block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "DocumentUnderstanding: error in DUFileUpdateSpotlightReceiver received from XPC handler: %@", (uint8_t *)&v1, 0xCu);
}

@end
