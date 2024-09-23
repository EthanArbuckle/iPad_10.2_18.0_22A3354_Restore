@implementation FCChannelMembershipController

- (FCChannelMembershipController)initWithChannelMembershipRecordSource:(id)a3
{
  id v5;
  FCChannelMembershipController *v6;
  FCChannelMembershipController *v7;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "recordSource");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCChannelMembershipController initWithChannelMembershipRecordSource:]";
    v13 = 2080;
    v14 = "FCChannelMembershipController.m";
    v15 = 1024;
    v16 = 29;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCChannelMembershipController;
  v6 = -[FCChannelMembershipController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_recordSource, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

uint64_t __112__FCChannelMembershipController_fetchChannelMembershipsForIDs_maximumCachedAge_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchChannelMembershipsForIDs:(id)a3 maximumCachedAge:(double)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "channelMembershipIDs != nil");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCChannelMembershipController fetchChannelMembershipsForIDs:maximumCachedAge:callbackQueue:completionHandler:]";
    v25 = 2080;
    v26 = "FCChannelMembershipController.m";
    v27 = 1024;
    v28 = 50;
    v29 = 2114;
    v30 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "callbackQueue != nil");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCChannelMembershipController fetchChannelMembershipsForIDs:maximumCachedAge:callbackQueue:completionHandler:]";
    v25 = 2080;
    v26 = "FCChannelMembershipController.m";
    v27 = 1024;
    v28 = 51;
    v29 = 2114;
    v30 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (v11)
  {
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "count"))
      {
        -[FCChannelMembershipController recordSource](self, "recordSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fetchOperationForRecordsWithIDs:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setQualityOfService:", 9);
        objc_msgSend(v13, "setCachePolicy:", 1);
        objc_msgSend(v13, "setFetchCompletionQueue:", v10);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __112__FCChannelMembershipController_fetchChannelMembershipsForIDs_maximumCachedAge_callbackQueue_completionHandler___block_invoke;
        v20[3] = &unk_1E463B880;
        v20[4] = self;
        v21 = v9;
        v22 = v11;
        objc_msgSend(v13, "setFetchCompletionBlock:", v20);
        objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addOperation:", v13);

      }
      else
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __112__FCChannelMembershipController_fetchChannelMembershipsForIDs_maximumCachedAge_callbackQueue_completionHandler___block_invoke_2;
        block[3] = &unk_1E463B598;
        v19 = v11;
        dispatch_async(v10, block);

      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCChannelMembershipController fetchChannelMembershipsForIDs:maximumCachedAge:callbackQueue:completionHandler:]";
    v25 = 2080;
    v26 = "FCChannelMembershipController.m";
    v27 = 1024;
    v28 = 52;
    v29 = 2114;
    v30 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (id)cachedChannelMembershipsForIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[FCChannelMembershipController recordSource](self, "recordSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedRecordsWithIDs:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCChannelMembershipController channelMembershipsFromHeldRecords:](self, "channelMembershipsFromHeldRecords:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __112__FCChannelMembershipController_fetchChannelMembershipsForIDs_maximumCachedAge_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  if (objc_msgSend(v3, "status"))
  {
    objc_msgSend(v3, "error");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v4 = v4;
      v9 = 0;
      v5 = 0;
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fc_notAvailableError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      v5 = 0;
    }
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "fetchedObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "channelMembershipsFromHeldRecords:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v9, "allKeys");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectsInArray:", v4);
    v6 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)channelMembershipsFromHeldRecords:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__FCChannelMembershipController_channelMembershipsFromHeldRecords___block_invoke;
  v8[3] = &unk_1E463C730;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateRecordsAndInterestTokensWithBlock:", v8);

  return v6;
}

void __67__FCChannelMembershipController_channelMembershipsFromHeldRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  FCChannelMembership *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(v13, "base");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deletedFromCloud");

  if ((v7 & 1) == 0)
  {
    v8 = -[FCChannelMembership initWithRecord:interestToken:]([FCChannelMembership alloc], "initWithRecord:interestToken:", v13, v5);
    -[FCChannelMembership channelID](v8, "channelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v13, "base");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v8, v12);

    }
  }

}

- (FCChannelMembershipRecordSource)recordSource
{
  return self->_recordSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordSource, 0);
}

@end
