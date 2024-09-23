@implementation DAOfficeHoursContext

- (BOOL)isFetch
{
  void *v2;
  BOOL v3;

  -[DAOfficeHoursContext fetchCompletionBlock](self, "fetchCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)finishFetchWithOfficeHours:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSString *accountID;
  void *v10;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  DALoggingwithCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    accountID = self->_accountID;
    *(_DWORD *)buf = 138543362;
    v18 = accountID;
    _os_log_impl(&dword_1B5244000, v8, OS_LOG_TYPE_DEBUG, "Fetch of office hours for account %{public}@ completed.", buf, 0xCu);
  }

  -[DAOfficeHoursContext fetchCompletionBlock](self, "fetchCompletionBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    queue = self->_queue;
    if (queue)
    {
      v12 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v12 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__DAOfficeHoursContext_finishFetchWithOfficeHours_error___block_invoke;
    block[3] = &unk_1E68DAD90;
    block[4] = self;
    v15 = v6;
    v16 = v7;
    dispatch_async(v13, block);

  }
}

void __57__DAOfficeHoursContext_finishFetchWithOfficeHours_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "fetchCompletionBlock");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD, _QWORD))v3 + 2))(v3, v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)finishSetWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *accountID;
  void *v7;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    accountID = self->_accountID;
    *(_DWORD *)buf = 138543362;
    v14 = accountID;
    _os_log_impl(&dword_1B5244000, v5, OS_LOG_TYPE_DEBUG, "Setting of office hours for account %{public}@ completed.", buf, 0xCu);
  }

  -[DAOfficeHoursContext setCompletionBlock](self, "setCompletionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    queue = self->_queue;
    if (queue)
    {
      v9 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v9 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__DAOfficeHoursContext_finishSetWithError___block_invoke;
    v11[3] = &unk_1E68DAD40;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v10, v11);

  }
}

void __43__DAOfficeHoursContext_finishSetWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock");
  v3 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2, *(_QWORD *)(a1 + 40));

}

- (void)abortWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[DAOfficeHoursContext fetchCompletionBlock](self, "fetchCompletionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DAOfficeHoursContext finishFetchWithOfficeHours:error:](self, "finishFetchWithOfficeHours:error:", 0, v7);
LABEL_5:
    v6 = v7;
    goto LABEL_6;
  }
  -[DAOfficeHoursContext setCompletionBlock](self, "setCompletionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5)
  {
    -[DAOfficeHoursContext finishSetWithError:](self, "finishSetWithError:", v7);
    goto LABEL_5;
  }
LABEL_6:

}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)fetchCompletionBlock
{
  return self->_fetchCompletionBlock;
}

- (void)setFetchCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)setCompletionBlock
{
  return self->_setCompletionBlock;
}

- (void)setSetCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setCompletionBlock, 0);
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
