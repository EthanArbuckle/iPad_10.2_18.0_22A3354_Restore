@implementation BRSharePrepFolderForSharing

- (BRSharePrepFolderForSharing)initWithURL:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRSharePrepFolderForSharing;
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
  OUTLINED_FUNCTION_1_0(&dword_19CBF0000, v3, v4, "[DEBUG] prepping folder for sharing at '%@'%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __35__BRSharePrepFolderForSharing_main__block_invoke(uint64_t a1, void *a2)
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
  -[BRSharePrepFolderForSharing prepFolderSharingCompletionBlock](self, "prepFolderSharingCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    -[BRSharePrepFolderForSharing setPrepFolderSharingCompletionBlock:](self, "setPrepFolderSharingCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRSharePrepFolderForSharing;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v7, v6);

}

- (id)prepFolderSharingCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setPrepFolderSharingCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prepFolderSharingCompletionBlock, 0);
}

@end
