@implementation BRShareAcceptOperation

- (BRShareAcceptOperation)initWithShareLink:(id)a3
{
  id v5;
  BRShareAcceptOperation *v6;
  BRShareAcceptOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRShareAcceptOperation;
  v6 = -[BROperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_shareLink, a3);

  return v7;
}

- (void)main
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  v3 = v0;
  OUTLINED_FUNCTION_7(&dword_19CBF0000, v1, (uint64_t)v1, "[DEBUG] Accepting share link '%@'%@", v2);
  OUTLINED_FUNCTION_1();
}

void __30__BRShareAcceptOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completedWithResult:error:", v6, v5);

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
  -[BRShareAcceptOperation shareAcceptCompletionBlock](self, "shareAcceptCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[BRShareAcceptOperation setShareAcceptCompletionBlock:](self, "setShareAcceptCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareAcceptOperation;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (id)shareAcceptCompletionBlock
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setShareAcceptCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareAcceptCompletionBlock, 0);
  objc_storeStrong((id *)&self->_shareLink, 0);
}

@end
