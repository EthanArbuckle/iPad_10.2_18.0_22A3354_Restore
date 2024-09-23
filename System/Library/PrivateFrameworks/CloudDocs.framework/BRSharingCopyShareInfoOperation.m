@implementation BRSharingCopyShareInfoOperation

- (BRSharingCopyShareInfoOperation)initWithURL:(id)a3
{
  id v5;
  BRSharingCopyShareInfoOperation *v6;
  BRSharingCopyShareInfoOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRSharingCopyShareInfoOperation;
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
  v5[2] = __39__BRSharingCopyShareInfoOperation_main__block_invoke;
  v5[3] = &unk_1E3DA4D10;
  v5[4] = self;
  objc_msgSend(v3, "startOperation:toCopyShareInfoAtURL:reply:", self, fileURL, v5);

}

void __39__BRSharingCopyShareInfoOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  v12[0] = a2;
  v12[1] = a3;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "completedWithResult:error:", v11, v8);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[BRSharingCopyShareInfoOperation copyShareInfoCompletionBlock](self, "copyShareInfoCompletionBlock");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, _QWORD))v5)[2](v5, v6, v7, 0);

    -[BRSharingCopyShareInfoOperation setCopyShareInfoCompletionBlock:](self, "setCopyShareInfoCompletionBlock:", 0);
  }

}

- (id)copyShareInfoCompletionBlock
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setCopyShareInfoCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_copyShareInfoCompletionBlock, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
