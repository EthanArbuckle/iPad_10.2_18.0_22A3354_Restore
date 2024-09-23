@implementation _CNGeminiLogger

- (_CNGeminiLogger)init
{
  _CNGeminiLogger *v2;
  os_log_t v3;
  OS_os_log *log;
  _CNGeminiLogger *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_CNGeminiLogger;
  v2 = -[_CNGeminiLogger init](&v7, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.contacts", "Gemini");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)updatingSubscriptionInfo:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "UpdatingSubscriptionInfo", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___CNGeminiLogger_updatingSubscriptionInfo___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __44___CNGeminiLogger_updatingSubscriptionInfo___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)fetchingBestResultForDestinationHandle:(id)a3
{
  id v3;
  os_activity_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  _QWORD aBlock[4];
  os_activity_t v13;

  v3 = a3;
  v4 = _os_activity_create(&dword_18F8BD000, "FetchingBestResultForDestinationHandle", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___CNGeminiLogger_fetchingBestResultForDestinationHandle___block_invoke;
  aBlock[3] = &unk_1E29F8508;
  v13 = v4;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __58___CNGeminiLogger_fetchingBestResultForDestinationHandle___block_invoke_2;
  block[3] = &unk_1E29F8858;
  v10 = v3;
  v11 = _Block_copy(aBlock);
  v7 = v11;
  v8 = v3;
  os_activity_apply(v6, block);

}

- (void)recordedInteraction:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CNGeminiLogger log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "transport"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "directionality"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contactIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138413314;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      _os_log_impl(&dword_18F8BD000, v9, OS_LOG_TYPE_INFO, "Recorded interaction with transport:%@ directionality:%@ handle:%@ contactIdentifier:%@ contextUUID:%@", (uint8_t *)&v16, 0x34u);

LABEL_6:
    }
  }
  else if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "transport"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "directionality"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_18F8BD000, v9, OS_LOG_TYPE_INFO, "Recorded interaction with transport:%@ directionality:%@ handle:%@ contextUUID:%@", (uint8_t *)&v16, 0x2Au);
    goto LABEL_6;
  }

}

- (void)recordInteractionError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  -[_CNGeminiLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNGeminiLogger recordInteractionError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)registeredForContextUpdatesWithToken:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNGeminiLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Registered for context updates with token %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)unregisteredForContextUpdatesWithToken:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNGeminiLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Unregistered for context updates with token %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)updatedSubscriptionInfo:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_CNGeminiLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_INFO, "Updated subscription info: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)updateSubscriptionInfoError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  -[_CNGeminiLogger log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_CNGeminiLogger updateSubscriptionInfoError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)fetchedSortedResults:(id)a3 forInteraction:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CNGeminiLogger log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      objc_msgSend(v5, "handle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "transport"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_INFO, "Fetched sorted results for handle:%@ contactIdentifier:%@ transport:%@", (uint8_t *)&v12, 0x20u);

LABEL_6:
    }
  }
  else if (v8)
  {
    objc_msgSend(v5, "handle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "transport"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_18F8BD000, v7, OS_LOG_TYPE_INFO, "Fetched sorted results for handle:%@ transport:%@", (uint8_t *)&v12, 0x16u);
    goto LABEL_6;
  }

}

- (void)fetchSortedResultsForInteraction:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CNGeminiLogger log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v10)
      -[_CNGeminiLogger fetchSortedResultsForInteraction:error:].cold.2(v6, (uint64_t)v7, v9);
  }
  else if (v10)
  {
    -[_CNGeminiLogger fetchSortedResultsForInteraction:error:].cold.1(v6, (uint64_t)v7, v9);
  }

}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)recordInteractionError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Recording interaction failed with error: %@", a5, a6, a7, a8, 2u);
}

- (void)updateSubscriptionInfoError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Updating subscription info failed with error: %@", a5, a6, a7, a8, 2u);
}

- (void)fetchSortedResultsForInteraction:(NSObject *)a3 error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "transport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_error_impl(&dword_18F8BD000, a3, OS_LOG_TYPE_ERROR, "Fetching sorted results for handle:%@ type:%@ failed with error:%@", (uint8_t *)&v8, 0x20u);

}

- (void)fetchSortedResultsForInteraction:(NSObject *)a3 error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "transport"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138413058;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  v15 = 2112;
  v16 = a2;
  _os_log_error_impl(&dword_18F8BD000, a3, OS_LOG_TYPE_ERROR, "Fetching sorted results for handle:%@ contactIdentifier:%@ type:%@ failed with error:%@", (uint8_t *)&v9, 0x2Au);

}

@end
