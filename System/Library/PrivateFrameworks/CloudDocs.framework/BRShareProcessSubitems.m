@implementation BRShareProcessSubitems

- (BRShareProcessSubitems)initWithURL:(id)a3 processType:(unint64_t)a4
{
  BRShareProcessSubitems *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRShareProcessSubitems;
  result = -[BRShareOperation initWithURL:](&v6, sel_initWithURL_, a3);
  if (result)
  {
    result->_processType = a4;
    result->_maxSharedSubitemsBeforeFailure = 1;
  }
  return result;
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
  OUTLINED_FUNCTION_1_0(&dword_19CBF0000, v3, v4, "[DEBUG] processing share subitems at '%@'%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __30__BRShareProcessSubitems_main__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2 == 0;
  v5 = a2;
  objc_msgSend(v3, "numberWithInt:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completedWithResult:error:", v6, v5);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[BRShareProcessSubitems processSubitemsCompletionBlock](self, "processSubitemsCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    -[BRShareProcessSubitems setProcessSubitemsCompletionBlock:](self, "setProcessSubitemsCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareProcessSubitems;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v7, v6);

}

- (id)processSubitemsCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setProcessSubitemsCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (unint64_t)maxSharedSubitemsBeforeFailure
{
  return self->_maxSharedSubitemsBeforeFailure;
}

- (void)setMaxSharedSubitemsBeforeFailure:(unint64_t)a3
{
  self->_maxSharedSubitemsBeforeFailure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processSubitemsCompletionBlock, 0);
}

@end
