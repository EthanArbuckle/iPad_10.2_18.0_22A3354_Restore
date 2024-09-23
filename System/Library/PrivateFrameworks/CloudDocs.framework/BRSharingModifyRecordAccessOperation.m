@implementation BRSharingModifyRecordAccessOperation

- (BRSharingModifyRecordAccessOperation)initWithURL:(id)a3 allowAccess:(BOOL)a4
{
  id v7;
  BRSharingModifyRecordAccessOperation *v8;
  BRSharingModifyRecordAccessOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRSharingModifyRecordAccessOperation;
  v8 = -[BRShareOperation initWithURL:](&v11, sel_initWithURL_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileURL, a3);
    v9->_allowAccess = a4;
  }

  return v9;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__BRSharingModifyRecordAccessOperation_main__block_invoke;
  v6[3] = &unk_1E3DA4CE8;
  v6[4] = self;
  v3 = (void *)MEMORY[0x1A1AD85E4](v6, a2);
  if (BRIsFPFSEnabled(v3, v4))
  {
    -[BRShareOperation remoteFPFSObject](self, "remoteFPFSObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startOperation:toModifyRecordWithAllowAccess:reply:", self, self->_allowAccess, v3);
  }
  else
  {
    -[BRShareOperation remoteLegacyObject](self, "remoteLegacyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startOperation:toModifyRecordAccessAtURL:allowAccess:reply:", self, self->_fileURL, self->_allowAccess, v3);
  }

}

void __44__BRSharingModifyRecordAccessOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("accessToken"));
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("referenceIdentifier"));
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v9, v8);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[BRSharingModifyRecordAccessOperation allowAccessCompletionBlock](self, "allowAccessCompletionBlock");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v7);
    -[BRSharingModifyRecordAccessOperation setAllowAccessCompletionBlock:](self, "setAllowAccessCompletionBlock:", 0);
  }

  -[BRSharingModifyRecordAccessOperation accessAllowedCompletionBlock](self, "accessAllowedCompletionBlock");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessToken"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("referenceIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, id))v10)[2](v10, v11, v12, v7);

    -[BRSharingModifyRecordAccessOperation setAccessAllowedCompletionBlock:](self, "setAccessAllowedCompletionBlock:", 0);
  }

  v13.receiver = self;
  v13.super_class = (Class)BRSharingModifyRecordAccessOperation;
  -[BROperation finishWithResult:error:](&v13, sel_finishWithResult_error_, v6, v7);

}

- (id)allowAccessCompletionBlock
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setAllowAccessCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (id)accessAllowedCompletionBlock
{
  return objc_getProperty(self, a2, 368, 1);
}

- (void)setAccessAllowedCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 368);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessAllowedCompletionBlock, 0);
  objc_storeStrong(&self->_allowAccessCompletionBlock, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
