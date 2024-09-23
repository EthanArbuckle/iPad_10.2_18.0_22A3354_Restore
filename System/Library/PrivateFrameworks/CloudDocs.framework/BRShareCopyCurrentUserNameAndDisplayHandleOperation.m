@implementation BRShareCopyCurrentUserNameAndDisplayHandleOperation

- (void)main
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_0();
  objc_msgSend(v0, "url");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19CBF0000, v3, v4, "[DEBUG] copying account name for '%@'%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __59__BRShareCopyCurrentUserNameAndDisplayHandleOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)objc_opt_new();
  v16 = v15;
  if (v17)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("nameComponents"));
  if (v11)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, CFSTR("displayHandle"));
  if (v12)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("primaryEmailAddress"));
  if (v13)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("personaIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v16, v14);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("nameComponents"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("displayHandle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("primaryEmailAddress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("personaIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRShareCopyCurrentUserNameAndDisplayHandleOperation shareUserNameCompletionBlock](self, "shareUserNameCompletionBlock");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, void *, void *, void *, void *, id))(v12 + 16))(v12, v8, v9, v10, v11, v7);
    -[BRShareCopyCurrentUserNameAndDisplayHandleOperation setShareUserNameCompletionBlock:](self, "setShareUserNameCompletionBlock:", 0);
  }

  v14.receiver = self;
  v14.super_class = (Class)BRShareCopyCurrentUserNameAndDisplayHandleOperation;
  -[BROperation finishWithResult:error:](&v14, sel_finishWithResult_error_, v6, v7);

}

- (id)shareUserNameCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setShareUserNameCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareUserNameCompletionBlock, 0);
}

@end
