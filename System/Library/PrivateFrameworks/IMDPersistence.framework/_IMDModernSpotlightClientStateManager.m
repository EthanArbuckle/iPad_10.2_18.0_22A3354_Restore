@implementation _IMDModernSpotlightClientStateManager

- (_IMDModernSpotlightClientStateManager)init
{
  _IMDModernSpotlightClientStateManager *v2;
  _IMDLegacySpotlightClientStateManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_IMDModernSpotlightClientStateManager;
  v2 = -[_IMDModernSpotlightClientStateManager init](&v5, sel_init);
  if (v2 && objc_msgSend(MEMORY[0x1E0D39B00], "_needsMigrationFromDefaults"))
  {
    v3 = objc_alloc_init(_IMDLegacySpotlightClientStateManager);
    -[IMDSpotlightClientStateManager _migrateClientStateFromManager:](v2, "_migrateClientStateFromManager:", v3);

  }
  return v2;
}

- (id)_missingSpotlightIndexError
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v3 = *MEMORY[0x1E0D39280];
  v7 = *MEMORY[0x1E0CB2938];
  v8[0] = CFSTR("Failed to open the Spotlight index.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", v3, 1, v4);

  return v5;
}

- (void)_currentClientStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  IMCoreSpotlightIndex();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    sub_1ABB726B0();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = sub_1ABB727B4;
      v8[3] = &unk_1E5AB0738;
      v9 = v4;
      objc_msgSend(v5, "fetchLastClientStateWithCompletionHandler:", v8);

      goto LABEL_9;
    }
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1ABC562B8();

  }
  else
  {
    -[_IMDModernSpotlightClientStateManager _missingSpotlightIndexError](self, "_missingSpotlightIndexError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);
LABEL_9:

}

- (void)_saveClientState:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(id, id);
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  sub_1ABBD6E7C();
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Saving client state: %@", buf, 0xCu);
  }

  IMCoreSpotlightIndex();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1ABC5634C();

    -[_IMDModernSpotlightClientStateManager _missingSpotlightIndexError](self, "_missingSpotlightIndexError");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  sub_1ABB72BA8();
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (id)v10;
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1ABC563DC();

LABEL_11:
    v7[2](v7, v11);
    goto LABEL_18;
  }
  v25 = 0;
  objc_msgSend(v6, "dataWithError:", &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v25;
  if (v11)
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1ABC56378((uint64_t)v11, v15, v16, v17, v18, v19, v20, v21);

    v7[2](v7, v11);
  }
  else
  {
    objc_msgSend(v9, "beginIndexBatch");
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1ABB72CAC;
    v22[3] = &unk_1E5AB0760;
    v23 = 0;
    v24 = v7;
    objc_msgSend(v9, "endIndexBatchWithClientState:completionHandler:", v14, v22);

  }
LABEL_18:

}

@end
