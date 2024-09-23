@implementation DUDocumentHarvesting

- (void)addSerializedDocument:(id)a3 documentType:(int64_t)a4
{
  id v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  if (+[DocumentUnderstandingFeatureFlagReader isSearchAndOrganizationDocumentIngestEnabled](_TtC27DocumentUnderstandingClient38DocumentUnderstandingFeatureFlagReader, "isSearchAndOrganizationDocumentIngestEnabled"))
  {
    if (+[DocumentUnderstandingFeatureFlagReader isIndexNonfileDocumentsEnabled](_TtC27DocumentUnderstandingClient38DocumentUnderstandingFeatureFlagReader, "isIndexNonfileDocumentsEnabled"))
    {
      +[DUXPCClient sharedInstance](DUXPCClient, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSerializedDocument:documentType:completion:", v5, a4, &__block_literal_global);

    }
    else
    {
      v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      if (v15)
        -[DUDocumentHarvesting addSerializedDocument:documentType:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v7)
      -[DUDocumentHarvesting addSerializedDocument:documentType:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
  }

}

void __59__DUDocumentHarvesting_addSerializedDocument_documentType___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __59__DUDocumentHarvesting_addSerializedDocument_documentType___block_invoke_cold_1(v2);

}

- (void)addSerializedDocument:(uint64_t)a3 documentType:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A6C9000, MEMORY[0x24BDACB70], a3, "DocumentUnderstanding: Non-file ingest disabled, skipping xpc to textunderstandingd from ProactiveHarvesting", a5, a6, a7, a8, 0);
}

- (void)addSerializedDocument:(uint64_t)a3 documentType:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23A6C9000, MEMORY[0x24BDACB70], a3, "DocumentUnderstanding: Ingest disabled, skipping XPC call to textunderstandingd from ProactiveHarvesting", a5, a6, a7, a8, 0);
}

void __59__DUDocumentHarvesting_addSerializedDocument_documentType___block_invoke_cold_1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error in addSerializedDocument: %@", (uint8_t *)&v2, 0xCu);

}

@end
