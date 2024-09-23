@implementation BRSharingCopyShortTokenOperation

- (BRSharingCopyShortTokenOperation)initWithURL:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BRSharingCopyShortTokenOperation;
  return -[BRShareOperation initWithURL:](&v4, sel_initWithURL_, a3);
}

- (void)main
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  if (BRIsFPFSEnabled(self, a2))
  {
    -[BRShareOperation remoteFPFSObject](self, "remoteFPFSObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__BRSharingCopyShortTokenOperation_main__block_invoke;
    v6[3] = &unk_1E3DA4D38;
    v6[4] = self;
    objc_msgSend(v3, "startOperation:toCopyShortTokenWithReply:", self, v6);
  }
  else
  {
    -[BRShareOperation remoteLegacyObject](self, "remoteLegacyObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRShareOperation url](self, "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__BRSharingCopyShortTokenOperation_main__block_invoke_2;
    v5[3] = &unk_1E3DA4D38;
    v5[4] = self;
    objc_msgSend(v3, "startOperation:toCopyShortTokenAtURL:reply:", self, v4, v5);

  }
}

uint64_t __40__BRSharingCopyShortTokenOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", a2, a3);
}

uint64_t __40__BRSharingCopyShortTokenOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
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
  -[BRSharingCopyShortTokenOperation shortTokenCompletionBlock](self, "shortTokenCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[BRSharingCopyShortTokenOperation setShortTokenCompletionBlock:](self, "setShortTokenCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRSharingCopyShortTokenOperation;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (id)shortTokenCompletionBlock
{
  return objc_getProperty(self, a2, 344, 1);
}

- (void)setShortTokenCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 344);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shortTokenCompletionBlock, 0);
}

@end
