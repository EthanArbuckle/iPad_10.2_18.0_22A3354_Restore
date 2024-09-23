@implementation CNReputationStore

- (CNReputationStore)init
{
  CNReputationCoreRecentsAdapter *v3;
  CNReputationContactsAdapter *v4;
  CNReputationLogger *v5;
  void *v6;
  CNReputationStore *v7;

  v3 = objc_alloc_init(CNReputationCoreRecentsAdapter);
  v4 = objc_alloc_init(CNReputationContactsAdapter);
  v5 = objc_alloc_init(CNReputationLogger);
  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNReputationStore initWithCoreRecentsAdapter:contactsAdapter:logger:schedulerProvider:](self, "initWithCoreRecentsAdapter:contactsAdapter:logger:schedulerProvider:", v3, v4, v5, v6);

  return v7;
}

- (CNReputationStore)initWithCoreRecentsAdapter:(id)a3 contactsAdapter:(id)a4 logger:(id)a5 schedulerProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNReputationStore *v15;
  CNReputationStore *v16;
  CNReputationStore *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNReputationStore;
  v15 = -[CNReputationStore init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_coreRecentsAdapter, a3);
    objc_storeStrong((id *)&v16->_contactsAdapter, a4);
    objc_storeStrong((id *)&v16->_logger, a5);
    objc_storeStrong((id *)&v16->_schedulerProvider, a6);
    v17 = v16;
  }

  return v16;
}

- (id)reputationForHandle:(id)a3 timeout:(double)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  CNReputationStore *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[6];

  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0D13B88]);
  -[CNReputationStore schedulerProvider](self, "schedulerProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timestamp");
  v13 = v12;

  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke;
  v32[3] = &unk_1E29FA9C0;
  v32[4] = self;
  v32[5] = v13;
  v15 = (void *)objc_msgSend(v32, "copy");
  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = _Block_copy(v16);
  objc_msgSend(v9, "push:", v17);

  -[CNReputationStore logger](self, "logger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "beginQueryForHandle:", v8);

  -[CNReputationStore makeFutureForHandle:](self, "makeFutureForHandle:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke_2;
  v30[3] = &unk_1E29FA9E8;
  v30[4] = self;
  v20 = v8;
  v31 = v20;
  objc_msgSend(v19, "addSuccessBlock:", v30);
  v24 = v14;
  v25 = 3221225472;
  v26 = __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke_3;
  v27 = &unk_1E29FAA10;
  v28 = self;
  v29 = v20;
  objc_msgSend(v19, "addFailureBlock:", &v24);
  objc_msgSend(v19, "resultWithTimeout:error:", a5, a4, v24, v25, v26, v27, v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21 && objc_msgSend(MEMORY[0x1E0D13A50], "isTimeoutError:", *a5))
    CNSetError(a5, 1001, 0);

  objc_msgSend(v9, "popAllWithHandler:", &__block_literal_global_63);
  v22 = (id)objc_opt_self();

  return v21;
}

void __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "schedulerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestamp");
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeToResolve:", v5 - *(double *)(a1 + 40));

}

void __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "logger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryForHandle:didFinishWithReputation:", *(_QWORD *)(a1 + 40), v4);

}

void __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "logger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryForHandle:didFailWithError:", *(_QWORD *)(a1 + 40), v4);

}

uint64_t __55__CNReputationStore_reputationForHandle_timeout_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)makeFutureForHandle:(id)a3
{
  id v4;
  CNReputationFutureBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  CNReputationFutureBuilder *v9;
  void *v10;

  v4 = a3;
  v5 = [CNReputationFutureBuilder alloc];
  -[CNReputationStore coreRecentsAdapter](self, "coreRecentsAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNReputationStore contactsAdapter](self, "contactsAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNReputationStore logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNReputationFutureBuilder initWithHandle:coreRecentsAdapter:contactsAdapter:logger:](v5, "initWithHandle:coreRecentsAdapter:contactsAdapter:logger:", v4, v6, v7, v8);

  objc_msgSend(v4, "configureBuilder:", v9);
  -[CNReputationFutureBuilder build](v9, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CNReputationCoreRecentsAdapter)coreRecentsAdapter
{
  return self->_coreRecentsAdapter;
}

- (CNReputationContactsAdapter)contactsAdapter
{
  return self->_contactsAdapter;
}

- (CNReputationLogger)logger
{
  return self->_logger;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_contactsAdapter, 0);
  objc_storeStrong((id *)&self->_coreRecentsAdapter, 0);
}

@end
