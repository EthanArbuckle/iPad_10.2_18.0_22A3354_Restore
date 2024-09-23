@implementation CNChangeHistoryTriageLogger

+ (CNChangeHistoryTriageLogger)saveLogger
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CNChangeHistoryTriageLogger_saveLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (saveLogger_cn_once_token_0 != -1)
    dispatch_once(&saveLogger_cn_once_token_0, block);
  return (CNChangeHistoryTriageLogger *)(id)saveLogger_cn_once_object_0;
}

void __41__CNChangeHistoryTriageLogger_saveLogger__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithOSLog:defaultLogType:destructiveLogType:", v2, 1, 0);

  v4 = (void *)saveLogger_cn_once_object_0;
  saveLogger_cn_once_object_0 = v3;

}

+ (CNChangeHistoryTriageLogger)fetchLogger
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CNChangeHistoryTriageLogger_fetchLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (fetchLogger_cn_once_token_1 != -1)
    dispatch_once(&fetchLogger_cn_once_token_1, block);
  return (CNChangeHistoryTriageLogger *)(id)fetchLogger_cn_once_object_1;
}

void __42__CNChangeHistoryTriageLogger_fetchLogger__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithOSLog:defaultLogType:destructiveLogType:", v2, 1, 1);

  v4 = (void *)fetchLogger_cn_once_object_1;
  fetchLogger_cn_once_object_1 = v3;

}

+ (OS_os_log)log
{
  if (log_cn_once_token_2 != -1)
    dispatch_once(&log_cn_once_token_2, &__block_literal_global_51);
  return (OS_os_log *)(id)log_cn_once_object_2;
}

void __34__CNChangeHistoryTriageLogger_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "change-history-triage");
  v1 = (void *)log_cn_once_object_2;
  log_cn_once_object_2 = (uint64_t)v0;

}

- (CNChangeHistoryTriageLogger)init
{
  os_log_t v3;
  CNChangeHistoryTriageLogger *v4;

  v3 = os_log_create("com.apple.contacts", "change-history-triage");
  v4 = -[CNChangeHistoryTriageLogger initWithOSLog:defaultLogType:destructiveLogType:](self, "initWithOSLog:defaultLogType:destructiveLogType:", v3, 1, 0);

  return v4;
}

- (CNChangeHistoryTriageLogger)initWithOSLog:(id)a3 defaultLogType:(unsigned __int8)a4 destructiveLogType:(unsigned __int8)a5
{
  id v9;
  CNChangeHistoryTriageLogger *v10;
  CNChangeHistoryTriageLogger *v11;
  CNChangeHistoryTriageLogger *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNChangeHistoryTriageLogger;
  v10 = -[CNChangeHistoryTriageLogger init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_os_log, a3);
    v11->_defaultLogType = a4;
    v11->_destructiveLogType = a5;
    v12 = v11;
  }

  return v11;
}

- (void)willExecuteSaveRequest
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  uint8_t v4[16];

  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18F8BD000, os_log, defaultLogType, "Will execute save request", v4, 2u);
  }
}

- (void)didExecuteSaveRequest
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  uint8_t v4[16];

  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18F8BD000, os_log, defaultLogType, "Did execute save request", v4, 2u);
  }
}

- (void)willFetchHistoryWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CNChangeHistoryAnchor *v8;
  void *v9;
  CNChangeHistoryAnchor *v10;
  id v11;
  NSObject *v12;
  os_log_type_t defaultLogType;
  NSObject *os_log;
  const char *v15;
  id v16;
  uint8_t buf[4];
  CNChangeHistoryAnchor *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "startingToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    os_log = self->_os_log;
    if (!os_log_type_enabled(os_log, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v15 = "Will fetch complete history (nil starting token)";
LABEL_10:
    _os_log_impl(&dword_18F8BD000, os_log, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    goto LABEL_14;
  }
  objc_msgSend(v4, "startingToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    os_log = self->_os_log;
    if (!os_log_type_enabled(os_log, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v15 = "Will fetch complete history (empty starting token)";
    goto LABEL_10;
  }
  v8 = [CNChangeHistoryAnchor alloc];
  objc_msgSend(v4, "startingToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = -[CNChangeHistoryAnchor initWithHistoryToken:error:](v8, "initWithHistoryToken:error:", v9, &v16);
  v11 = v16;

  v12 = self->_os_log;
  if (v10)
  {
    defaultLogType = self->_defaultLogType;
    if (os_log_type_enabled(v12, defaultLogType))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl(&dword_18F8BD000, v12, defaultLogType, "Will fetch history from anchor: %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_os_log, OS_LOG_TYPE_ERROR))
  {
    -[CNChangeHistoryTriageLogger willFetchHistoryWithRequest:].cold.1((uint64_t)v11, v12, v4);
  }

LABEL_14:
}

- (void)didFetchHistoryEvents:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  NSObject *os_log;
  os_log_type_t defaultLogType;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  os_log_type_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F8BD000, os_log, defaultLogType, "Did fetch history events:", buf, 2u);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "acceptEventVisitor:", self, (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v12);
  }

  v15 = self->_os_log;
  v16 = self->_defaultLogType;
  if (os_log_type_enabled(v15, v16))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v7;
    _os_log_impl(&dword_18F8BD000, v15, v16, "Latest change anchor: %{public}@", buf, 0xCu);
  }

}

- (void)didFetchHistoryEventsCount:(int64_t)a3 anchor:(id)a4 truncated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *os_log;
  os_log_type_t defaultLogType;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  int64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = os_log;
    objc_msgSend(v11, "numberWithBool:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134349570;
    v15 = a3;
    v16 = 2114;
    v17 = v8;
    v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_18F8BD000, v12, defaultLogType, "Did fetch history events count: %{public}lu, latest change anchor: %{public}@, truncated: %{public}@", (uint8_t *)&v14, 0x20u);

  }
}

- (void)fetchDidFailWithError:(id)a3
{
  id v4;
  NSObject *os_log;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  os_log = self->_os_log;
  if (os_log_type_enabled(os_log, OS_LOG_TYPE_ERROR))
    -[CNChangeHistoryTriageLogger fetchDidFailWithError:].cold.1((uint64_t)v4, os_log, v6, v7, v8, v9, v10, v11);

}

- (void)fetchDidFailToTranslateWithError:(id)a3
{
  id v4;
  NSObject *os_log;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  os_log = self->_os_log;
  if (os_log_type_enabled(os_log, OS_LOG_TYPE_ERROR))
    -[CNChangeHistoryTriageLogger fetchDidFailToTranslateWithError:].cold.1((uint64_t)v4, os_log, v6, v7, v8, v9, v10, v11);

}

- (void)visitDropEverythingEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t destructiveLogType;
  uint8_t v5[16];

  os_log = self->_os_log;
  destructiveLogType = self->_destructiveLogType;
  if (os_log_type_enabled(os_log, destructiveLogType))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18F8BD000, os_log, destructiveLogType, " - Drop everything", v5, 2u);
  }
}

- (void)visitAddContactEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *os_log;
  os_log_type_t defaultLogType;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  v8 = os_log_type_enabled(os_log, defaultLogType);
  if (v5)
  {
    if (v8)
    {
      v9 = os_log;
      objc_msgSend(v4, "contact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_18F8BD000, v9, defaultLogType, " - Add %{public}@ (container: %{public}@", (uint8_t *)&v13, 0x16u);

LABEL_6:
    }
  }
  else if (v8)
  {
    v9 = os_log;
    objc_msgSend(v4, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_18F8BD000, v9, defaultLogType, " - Add %{public}@", (uint8_t *)&v13, 0xCu);
    goto LABEL_6;
  }

}

- (void)visitUpdateContactEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v6 = os_log;
    objc_msgSend(a3, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_18F8BD000, v6, defaultLogType, " - Update %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)visitDeleteContactEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t destructiveLogType;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  destructiveLogType = self->_destructiveLogType;
  if (os_log_type_enabled(os_log, destructiveLogType))
  {
    v6 = os_log;
    objc_msgSend(a3, "contactIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_18F8BD000, v6, destructiveLogType, " - Delete %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)visitAddGroupEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *os_log;
  os_log_type_t defaultLogType;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  v8 = os_log_type_enabled(os_log, defaultLogType);
  if (v5)
  {
    if (v8)
    {
      v9 = os_log;
      objc_msgSend(v4, "group");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "containerIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v12;
      _os_log_impl(&dword_18F8BD000, v9, defaultLogType, " - Add %{public}@ (container: %{public}@", (uint8_t *)&v13, 0x16u);

LABEL_6:
    }
  }
  else if (v8)
  {
    v9 = os_log;
    objc_msgSend(v4, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_18F8BD000, v9, defaultLogType, " - Add %{public}@", (uint8_t *)&v13, 0xCu);
    goto LABEL_6;
  }

}

- (void)visitUpdateGroupEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v6 = os_log;
    objc_msgSend(a3, "group");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_18F8BD000, v6, defaultLogType, " - Update %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)visitDeleteGroupEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t destructiveLogType;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  destructiveLogType = self->_destructiveLogType;
  if (os_log_type_enabled(os_log, destructiveLogType))
  {
    v6 = os_log;
    objc_msgSend(a3, "groupIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_18F8BD000, v6, destructiveLogType, " - Delete %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)visitAddMemberToGroupEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v6 = os_log;
    v7 = a3;
    objc_msgSend(v7, "member");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18F8BD000, v6, defaultLogType, " - Add %{public}@ to %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

- (void)visitRemoveMemberFromGroupEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v6 = os_log;
    v7 = a3;
    objc_msgSend(v7, "member");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18F8BD000, v6, defaultLogType, " - Remove %{public}@ from %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

- (void)visitAddSubgroupToGroupEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v6 = os_log;
    v7 = a3;
    objc_msgSend(v7, "subgroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18F8BD000, v6, defaultLogType, " - Add %{public}@ to %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

- (void)visitRemoveSubgroupFromGroupEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v6 = os_log;
    v7 = a3;
    objc_msgSend(v7, "subgroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18F8BD000, v6, defaultLogType, " - Remove %{public}@ from %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

- (void)visitLinkContactsEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v6 = os_log;
    v7 = a3;
    objc_msgSend(v7, "fromContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "toContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v9;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18F8BD000, v6, defaultLogType, " - Link %{public}@ with %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

- (void)visitUnlinkContactEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v6 = os_log;
    objc_msgSend(a3, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_18F8BD000, v6, defaultLogType, " - Unlink %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)visitPreferredContactForNameEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v6 = os_log;
    objc_msgSend(a3, "preferredContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_18F8BD000, v6, defaultLogType, " - Prefer %{public}@ for name", (uint8_t *)&v9, 0xCu);

  }
}

- (void)visitPreferredContactForImageEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t defaultLogType;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  defaultLogType = self->_defaultLogType;
  if (os_log_type_enabled(os_log, defaultLogType))
  {
    v6 = os_log;
    objc_msgSend(a3, "preferredContact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_18F8BD000, v6, defaultLogType, " - Prefer %{public}@ for images", (uint8_t *)&v9, 0xCu);

  }
}

- (void)visitDifferentMeCardEvent:(id)a3
{
  NSObject *os_log;
  os_log_type_t destructiveLogType;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  os_log = self->_os_log;
  destructiveLogType = self->_destructiveLogType;
  if (os_log_type_enabled(os_log, destructiveLogType))
  {
    v6 = os_log;
    objc_msgSend(a3, "contactIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_18F8BD000, v6, destructiveLogType, " - Set Me Card to %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (OS_os_log)os_log
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)defaultLogType
{
  return self->_defaultLogType;
}

- (unsigned)destructiveLogType
{
  return self->_destructiveLogType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_os_log, 0);
}

- (void)willFetchHistoryWithRequest:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "startingToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_ERROR, "Will fetch history from invalid anchor: %{public}@ (token: %{public}@)", (uint8_t *)&v7, 0x16u);

}

- (void)fetchDidFailWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Failed to fetch change history: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)fetchDidFailToTranslateWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Failed to translate change history: %{public}@", a5, a6, a7, a8, 2u);
}

@end
