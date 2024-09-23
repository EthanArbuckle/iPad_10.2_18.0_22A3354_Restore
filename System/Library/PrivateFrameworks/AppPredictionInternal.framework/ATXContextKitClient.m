@implementation ATXContextKitClient

- (id)ckClient
{
  ATXContextKitClient *v2;
  CKContextClient *ckClient;
  uint64_t v4;
  CKContextClient *v5;
  CKContextClient *v6;

  v2 = self;
  objc_sync_enter(v2);
  ckClient = v2->_ckClient;
  if (!ckClient)
  {
    objc_msgSend(MEMORY[0x1E0D14368], "clientWithDefaultRequestType:", 18);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_ckClient;
    v2->_ckClient = (CKContextClient *)v4;

    ckClient = v2->_ckClient;
  }
  v6 = ckClient;
  objc_sync_exit(v2);

  return v6;
}

- (id)level1TopicIdsForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  -[ATXContextKitClient ckClient](self, "ckClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "newRequest");
    objc_msgSend(v4, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUrl:", v9);

    objc_msgSend(v8, "setIncludeHigherLevelTopics:", 1);
    objc_msgSend(v8, "execute");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      __atxlog_handle_default();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ATXContextKitClient level1TopicIdsForURL:].cold.2((uint64_t)self, v10, v12);

      v13 = (void *)objc_opt_new();
    }
    else
    {
      objc_msgSend(v10, "level1Topics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_234);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = objc_opt_new();
      }
      v13 = (void *)v17;

    }
  }
  else
  {
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXContextKitClient level1TopicIdsForURL:].cold.1((uint64_t)self, v14);

    v13 = (void *)objc_opt_new();
  }

  objc_autoreleasePoolPop(v5);
  return v13;
}

uint64_t __44__ATXContextKitClient_level1TopicIdsForURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "topicId");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckClient, 0);
}

- (void)level1TopicIdsForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%@ - could not initialize CKContextClient", (uint8_t *)&v5, 0xCu);

}

- (void)level1TopicIdsForURL:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ - Error from ContextKit: %@", (uint8_t *)&v8, 0x16u);

}

@end
