@implementation BRShareCopyOperation

- (BRShareCopyOperation)initWithURL:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRShareCopyOperation;
  return -[BRShareOperation initWithURL:](&v4, sel_initWithURL_, a3);
}

- (BRShareCopyOperation)initWithItemID:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRShareCopyOperation;
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
  OUTLINED_FUNCTION_1_0(&dword_19CBF0000, v3, v4, "[DEBUG] copying share for '%@'%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __28__BRShareCopyOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  if (v10)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("share"));
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("rootURL"));
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v9, v8);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("share"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRShareOperation url](self, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  br_setShareAssociatedURL(v8, v9);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rootURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRShareCopyOperation shareCopyCompletionBlock](self, "shareCopyCompletionBlock");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v8, v7);
    -[BRShareCopyOperation setShareCopyCompletionBlock:](self, "setShareCopyCompletionBlock:", 0);
  }

  -[BRShareCopyOperation rootShareCopyCompletionBlock](self, "rootShareCopyCompletionBlock");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    (*(void (**)(uint64_t, void *, void *, id))(v13 + 16))(v13, v8, v10, v7);
    -[BRShareCopyOperation setRootShareCopyCompletionBlock:](self, "setRootShareCopyCompletionBlock:", 0);
  }

  v15.receiver = self;
  v15.super_class = (Class)BRShareCopyOperation;
  -[BROperation finishWithResult:error:](&v15, sel_finishWithResult_error_, v6, v7);

}

- (id)shareCopyCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setShareCopyCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (id)rootShareCopyCompletionBlock
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setRootShareCopyCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rootShareCopyCompletionBlock, 0);
  objc_storeStrong(&self->_shareCopyCompletionBlock, 0);
}

@end
