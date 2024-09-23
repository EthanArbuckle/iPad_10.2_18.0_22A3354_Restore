@implementation BRShareCreateShareOperation

- (BRShareCreateShareOperation)initWithItemID:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRShareCreateShareOperation;
  return -[BRShareOperation initWithItemIdentifier:](&v4, sel_initWithItemIdentifier_, a3);
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
  OUTLINED_FUNCTION_1_0(&dword_19CBF0000, v3, v4, "[DEBUG] creating share for '%@'%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

uint64_t __35__BRShareCreateShareOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", a2, a3);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[BRShareOperation url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  br_setShareAssociatedURL(v6, v8);

  -[BRShareCreateShareOperation shareCreateCompletionBlock](self, "shareCreateCompletionBlock");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v7);
    -[BRShareCreateShareOperation setShareCreateCompletionBlock:](self, "setShareCreateCompletionBlock:", 0);
  }

  v11.receiver = self;
  v11.super_class = (Class)BRShareCreateShareOperation;
  -[BROperation finishWithResult:error:](&v11, sel_finishWithResult_error_, v6, v7);

}

- (id)shareCreateCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setShareCreateCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareCreateCompletionBlock, 0);
}

@end
