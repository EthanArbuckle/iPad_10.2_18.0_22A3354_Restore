@implementation BRShareUnshareOperation

- (BRShareUnshareOperation)initWithShare:(id)a3
{
  id v4;
  BRShareUnshareOperation *v5;
  BRShareUnshareOperation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BRShareUnshareOperation;
  v5 = -[BRShareOperation initWithShare:](&v8, sel_initWithShare_, v4);
  v6 = v5;
  if (v5)
    -[BRShareUnshareOperation setShare:](v5, "setShare:", v4);

  return v6;
}

- (BRShareUnshareOperation)initWithShare:(id)a3 fileURL:(id)a4
{
  id v6;
  BRShareUnshareOperation *v7;
  BRShareUnshareOperation *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRShareUnshareOperation;
  v7 = -[BRShareOperation initWithURL:](&v10, sel_initWithURL_, a4);
  v8 = v7;
  if (v7)
    -[BRShareUnshareOperation setShare:](v7, "setShare:", v6);

  return v8;
}

- (void)main
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[BRShareOperation remoteObject](self, "remoteObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[CKShare copy](self->_share, "copy");
  br_setShareAssociatedURL(v4, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__BRShareUnshareOperation_main__block_invoke;
  v5[3] = &unk_1E3DA47F0;
  v5[4] = self;
  objc_msgSend(v3, "startOperation:toUnshareShare:forceDelete:reply:", self, v4, 0, v5);

}

uint64_t __31__BRShareUnshareOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
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
  -[BRShareUnshareOperation unshareCompletionBlock](self, "unshareCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    -[BRShareUnshareOperation setUnshareCompletionBlock:](self, "setUnshareCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRShareUnshareOperation;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v7, v6);

}

- (CKShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (id)unshareCompletionBlock
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setUnshareCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unshareCompletionBlock, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

@end
