@implementation BRSharingCopyEtagOperation

- (BRSharingCopyEtagOperation)initWithURL:(id)a3
{
  id v5;
  BRSharingCopyEtagOperation *v6;
  BRSharingCopyEtagOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRSharingCopyEtagOperation;
  v6 = -[BROperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fileURL, a3);

  return v7;
}

- (void)main
{
  void *v3;
  NSURL *fileURL;
  _QWORD v5[5];

  -[BROperation remoteLegacyObject](self, "remoteLegacyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fileURL = self->_fileURL;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__BRSharingCopyEtagOperation_main__block_invoke;
  v5[3] = &unk_1E3DA4D38;
  v5[4] = self;
  objc_msgSend(v3, "startOperation:toCopyEtagAtURL:reply:", self, fileURL, v5);

}

uint64_t __34__BRSharingCopyEtagOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
  -[BRSharingCopyEtagOperation sharingEtagCompletionBlock](self, "sharingEtagCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
    -[BRSharingCopyEtagOperation setSharingEtagCompletionBlock:](self, "setSharingEtagCompletionBlock:", 0);
  }

  v10.receiver = self;
  v10.super_class = (Class)BRSharingCopyEtagOperation;
  -[BROperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (id)sharingEtagCompletionBlock
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setSharingEtagCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sharingEtagCompletionBlock, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
