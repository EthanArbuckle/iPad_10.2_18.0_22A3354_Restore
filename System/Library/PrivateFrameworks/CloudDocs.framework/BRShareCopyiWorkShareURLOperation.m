@implementation BRShareCopyiWorkShareURLOperation

+ (id)iWorkShareableExtensions
{
  return &unk_1E3DC2678;
}

- (BRShareCopyiWorkShareURLOperation)initWithShare:(id)a3
{
  id v4;
  BRShareCopyiWorkShareURLOperation *v5;
  BRShareCopyiWorkShareURLOperation *v6;
  BRShareCopyiWorkShareURLOperation *v7;
  void *v8;
  NSObject *v9;
  objc_super v11;

  v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)BRShareCopyiWorkShareURLOperation;
    v5 = -[BROperation init](&v11, sel_init);
    v6 = v5;
    if (v5)
      -[BRShareCopyiWorkShareURLOperation setShare:](v5, "setShare:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[BRShareCopyiWorkShareURLOperation initWithShare:]", 842);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      -[BRShareCopyiWorkShareURLOperation initWithShare:].cold.1();

    v7 = 0;
  }

  return v7;
}

- (void)main
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[BROperation remoteObject](self, "remoteObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[CKShare copy](self->_share, "copy");
  br_setShareAssociatedURL(v4, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__BRShareCopyiWorkShareURLOperation_main__block_invoke;
  v5[3] = &unk_1E3DA4C48;
  v5[4] = self;
  objc_msgSend(v3, "startOperation:toCopyShareURLForShare:reply:", self, v4, v5);

}

uint64_t __41__BRShareCopyiWorkShareURLOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:");
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
  -[BRShareCopyiWorkShareURLOperation shareCopyURLCompletionBlock](self, "shareCopyURLCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[BRShareCopyiWorkShareURLOperation setShareCopyURLCompletionBlock:](self, "setShareCopyURLCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareCopyiWorkShareURLOperation;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (id)shareCopyURLCompletionBlock
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setShareCopyURLCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareCopyURLCompletionBlock, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

- (void)initWithShare:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_0(&dword_19CBF0000, v0, v1, "[ERROR] require a CKShare to craft share URL%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
