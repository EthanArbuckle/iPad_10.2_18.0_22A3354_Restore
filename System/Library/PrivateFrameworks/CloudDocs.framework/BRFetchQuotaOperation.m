@implementation BRFetchQuotaOperation

- (void)main
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] fetching available quota%@", (uint8_t *)&v2, 0xCu);
}

uint64_t __29__BRFetchQuotaOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", a2, a3);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[BRFetchQuotaOperation fetchQuotaCompletionBlock](self, "fetchQuotaCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[BRFetchQuotaOperation setFetchQuotaCompletionBlock:](self, "setFetchQuotaCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRFetchQuotaOperation;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (id)fetchQuotaCompletionBlock
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setFetchQuotaCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchQuotaCompletionBlock, 0);
}

@end
