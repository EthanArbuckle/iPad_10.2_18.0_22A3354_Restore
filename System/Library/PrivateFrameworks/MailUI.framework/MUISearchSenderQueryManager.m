@implementation MUISearchSenderQueryManager

+ (id)log
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MUISearchSenderQueryManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (log_onceToken_12 != -1)
    dispatch_once(&log_onceToken_12, block);
  return (id)log_log_12;
}

void __34__MUISearchSenderQueryManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_12;
  log_log_12 = (uint64_t)v1;

}

- (MUISearchSenderQueryManager)initWithSenderRepository:(id)a3
{
  id v5;
  MUISearchSenderQueryManager *v6;
  MUISearchSenderQueryManager *v7;
  uint64_t v8;
  EFFuture *senderFilterQueryFuture;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUISearchSenderQueryManager;
  v6 = -[MUISearchSenderQueryManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_senderRepository, a3);
    -[MUISearchSenderQueryManager _relevantSendersFilterQuery](v7);
    v8 = objc_claimAutoreleasedReturnValue();
    senderFilterQueryFuture = v7->_senderFilterQueryFuture;
    v7->_senderFilterQueryFuture = (EFFuture *)v8;

  }
  return v7;
}

- (_QWORD)_relevantSendersFilterQuery
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)v1[1];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__MUISearchSenderQueryManager__relevantSendersFilterQuery__block_invoke;
    v6[3] = &unk_1E99E34A0;
    v7 = v2;
    v4 = v2;
    objc_msgSend(v3, "simpleAddressesForRelevantSendersWithCompletion:", v6);
    objc_msgSend(v4, "future");
    v1 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

void __58__MUISearchSenderQueryManager__relevantSendersFilterQuery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[MUISearchSenderQueryManager log]();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "Returned %ld senders", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" || "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishWithResult:", v11);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__MUISearchSenderQueryManager__relevantSendersFilterQuery__block_invoke_cold_1(v6, v8);

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }

}

uint64_t __58__MUISearchSenderQueryManager__relevantSendersFilterQuery__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemAuthorEmailAddresses = '%@')"), a2);
}

- (EFFuture)senderFilterQueryFuture
{
  return self->_senderFilterQueryFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderFilterQueryFuture, 0);
  objc_storeStrong((id *)&self->_senderRepository, 0);
}

void __58__MUISearchSenderQueryManager__relevantSendersFilterQuery__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ef_publicDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D5522000, a2, OS_LOG_TYPE_ERROR, "Error retrieving primary senders: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
