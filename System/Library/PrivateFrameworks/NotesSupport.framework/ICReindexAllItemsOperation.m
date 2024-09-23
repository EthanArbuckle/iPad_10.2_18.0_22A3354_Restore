@implementation ICReindexAllItemsOperation

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Started main function of reindexing operation %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __34__ICReindexAllItemsOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;

  v3 = a2;
  if (ICVerboseSearchLogging())
  {
    v4 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __34__ICReindexAllItemsOperation_main__block_invoke_cold_2(a1, v4, v5, v6, v7, v8, v9, v10);

  }
  if (v3)
  {
    v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __34__ICReindexAllItemsOperation_main__block_invoke_cold_1();

  }
}

- (NSData)clientStateData
{
  NSData **p_clientStateData;
  NSData *clientStateData;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v9;
  id v10;

  p_clientStateData = &self->_clientStateData;
  clientStateData = self->_clientStateData;
  if (!clientStateData)
  {
    +[ICSettingsUtilities objectForKey:](ICSettingsUtilities, "objectForKey:", CFSTR("ClientStateData"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      objc_storeStrong((id *)p_clientStateData, v4);
LABEL_12:

      clientStateData = *p_clientStateData;
      return clientStateData;
    }
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v6)
    {
      v7 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ICReindexAllItemsOperation clientStateData].cold.2();

      if (!v5)
        goto LABEL_11;
    }
    else if (!v5)
    {
      v9 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ICReindexAllItemsOperation clientStateData].cold.1(v9);

      goto LABEL_11;
    }
    objc_storeStrong((id *)p_clientStateData, v5);
    +[ICSettingsUtilities setObject:forKey:](ICSettingsUtilities, "setObject:forKey:", v5, CFSTR("ClientStateData"));
LABEL_11:

    goto LABEL_12;
  }
  return clientStateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientStateData, 0);
}

void __34__ICReindexAllItemsOperation_main__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Error writing client state data into CoreSpotlight %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __34__ICReindexAllItemsOperation_main__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, a2, a3, "%@ Did end setting the search index client state", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)clientStateData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Error generating random NSData for CoreSpotlight client state data. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
