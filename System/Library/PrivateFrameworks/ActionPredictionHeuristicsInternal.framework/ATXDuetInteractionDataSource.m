@implementation ATXDuetInteractionDataSource

- (ATXDuetInteractionDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXDuetInteractionDataSource *v6;
  ATXDuetInteractionDataSource *v7;
  ATXDuetInteractionDataSource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXDuetInteractionDataSource;
  v6 = -[ATXDuetInteractionDataSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = v7;
  }

  return v7;
}

- (void)duetInteractionCountForHandles:(id)a3 sinceDate:(id)a4 callback:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, id))a5;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5548) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D158E0], "storeWithDirectory:readOnly:", v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (v8)
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate > %@ AND ANY recipients.identifier IN %@"), v8, v7);
      else
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v7, v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v23 = 0;
      v15 = objc_msgSend(v11, "countInteractionsUsingPredicate:error:", v13, &v23);
      v16 = v23;
      objc_msgSend(v14, "numberWithUnsignedInteger:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_heuristic();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v16)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[ATXDuetInteractionDataSource duetInteractionCountForHandles:sinceDate:callback:].cold.1((uint64_t)v16, v19);

        v9[2](v9, 0, v16);
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(v17, "unsignedIntegerValue");
          v21 = objc_msgSend(v7, "count");
          *(_DWORD *)buf = 134218498;
          v25 = v20;
          v26 = 2048;
          v27 = v21;
          v28 = 2114;
          v29 = v8;
          _os_log_impl(&dword_1C99DF000, v19, OS_LOG_TYPE_DEFAULT, "Got %tu interactions (direct and group interactions) from _CDInteractionStore for contact interaction with %tu handles. Since date: %{public}@", buf, 0x20u);
        }

        ((void (**)(id, void *, id))v9)[2](v9, v17, 0);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v13);
    }

  }
  else
  {
    __atxlog_handle_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_DEFAULT, "Learn from app turned off for Phone, Messages or Mail", buf, 2u);
    }

    v9[2](v9, 0, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)duetInteractionCountForHandles:(uint64_t)a1 sinceDate:(NSObject *)a2 callback:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "Error querying _CDInteractionStore for count of interactions with contact. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
