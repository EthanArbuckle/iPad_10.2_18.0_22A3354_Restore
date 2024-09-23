@implementation CNContactFetchExecutor

void __30__CNContactFetchExecutor_run___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, v7);

  }
}

- (CNContactFetchExecutor)initWithRequest:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  CNContactFetchExecutor *v9;
  CNContactFetchExecutor *v10;
  CNContactFetchExecutor *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactFetchExecutor;
  v9 = -[CNContactFetchExecutor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_store, a4);
    v11 = v10;
  }

  return v10;
}

- (id)run:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  CNFetchResult *v33;
  void *v34;
  void *v35;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, void *);
  void *v41;
  id v42;
  id v43;
  id v44;

  -[CNContactFetchExecutor request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldFailIfAccountNotYetSynced");

  if (v6
    && (-[CNContactFetchExecutor store](self, "store"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hasAccountFirstSyncCompleted"),
        v7,
        (v8 & 1) == 0))
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1007);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a3)
      *a3 = objc_retainAutorelease(v34);

    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactFetchExecutor store](self, "store");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactFetchExecutor request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __30__CNContactFetchExecutor_run___block_invoke;
    v41 = &unk_1E29F8768;
    v13 = v9;
    v42 = v13;
    v14 = v10;
    v43 = v14;
    v15 = objc_msgSend(v11, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v12, &v44, &v38);
    v16 = v44;

    if ((v15 & 1) != 0)
    {
      v17 = v13;
      -[CNContactFetchExecutor request](self, "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "predicate");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
        v21 = v19;

      objc_msgSend(v20, "cn_resultTransformWithMatchInfos:", v14);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
      {
        (*(void (**)(uint64_t, id))(v22 + 16))(v22, v17);
        v24 = objc_claimAutoreleasedReturnValue();

        v17 = (id)v24;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "data", v16, v38, v39, v40, v41, v42);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactFetchExecutor store](self, "store");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "currentHistoryAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      +[CNContactsLoggerProvider defaultProvider](CNContactsLoggerProvider, "defaultProvider");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "apiTriageLogger");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactFetchExecutor request](self, "request");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "request:willReturnAnchor:", v30, v27);

      if (objc_msgSend(v27, "isSuccess"))
      {
        objc_msgSend(v27, "value");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "historyToken");
        v32 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v32;
      }
      v16 = v37;
      v33 = -[CNFetchResult initWithValue:currentHistoryToken:]([CNFetchResult alloc], "initWithValue:currentHistoryToken:", v17, v25);

    }
    else
    {
      v33 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v16);
    }

    return v33;
  }
}

- (CNContactFetchRequest)request
{
  return self->_request;
}

- (CNContactStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

+ (id)os_log
{
  if (os_log_cn_once_token_0_2 != -1)
    dispatch_once(&os_log_cn_once_token_0_2, &__block_literal_global_18);
  return (id)os_log_cn_once_object_0_2;
}

void __32__CNContactFetchExecutor_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "fetching");
  v1 = (void *)os_log_cn_once_object_0_2;
  os_log_cn_once_object_0_2 = (uint64_t)v0;

}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactFetchExecutor request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("request"), v4);

  -[CNContactFetchExecutor store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("store"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
