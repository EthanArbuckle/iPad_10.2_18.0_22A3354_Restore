@implementation BRShareCopyAccessTokenOperation

- (BRShareCopyAccessTokenOperation)initWithURL:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRShareCopyAccessTokenOperation;
  return -[BRShareOperation initWithURL:](&v4, sel_initWithURL_, a3);
}

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
  OUTLINED_FUNCTION_1_0(&dword_19CBF0000, v3, v4, "[DEBUG] copying access token for '%@'%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __39__BRShareCopyAccessTokenOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  if (a2 && a3)
  {
    v12[0] = a2;
    v12[1] = a3;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a4;
    v9 = a3;
    v10 = a2;
    objc_msgSend(v7, "arrayWithObjects:count:", v12, 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "completedWithResult:error:", v11, v8);

  }
  else
  {
    v9 = a4;
    v10 = a3;
    v11 = a2;
    objc_msgSend(v6, "completedWithResult:error:", 0, v9);
  }

}

void __39__BRShareCopyAccessTokenOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  if (a2 && a3)
  {
    v12[0] = a2;
    v12[1] = a3;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a4;
    v9 = a3;
    v10 = a2;
    objc_msgSend(v7, "arrayWithObjects:count:", v12, 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "completedWithResult:error:", v11, v8);

  }
  else
  {
    v9 = a4;
    v10 = a3;
    v11 = a2;
    objc_msgSend(v6, "completedWithResult:error:", 0, v9);
  }

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[BRShareCopyAccessTokenOperation shareCopyAccessTokenCompletionBlock](self, "shareCopyAccessTokenCompletionBlock");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, id))v8)[2](v8, v9, v10, v7);

    -[BRShareCopyAccessTokenOperation setShareCopyAccessTokenCompletionBlock:](self, "setShareCopyAccessTokenCompletionBlock:", 0);
  }

  v11.receiver = self;
  v11.super_class = (Class)BRShareCopyAccessTokenOperation;
  -[BROperation finishWithResult:error:](&v11, sel_finishWithResult_error_, v6, v7);

}

- (id)shareCopyAccessTokenCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setShareCopyAccessTokenCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareCopyAccessTokenCompletionBlock, 0);
}

@end
