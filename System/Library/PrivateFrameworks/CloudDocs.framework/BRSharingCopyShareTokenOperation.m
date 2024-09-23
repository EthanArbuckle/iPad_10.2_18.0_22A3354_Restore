@implementation BRSharingCopyShareTokenOperation

- (BRSharingCopyShareTokenOperation)initWithURL:(id)a3
{
  id v5;
  BRSharingCopyShareTokenOperation *v6;
  BRSharingCopyShareTokenOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRSharingCopyShareTokenOperation;
  v6 = -[BRShareOperation initWithURL:](&v9, sel_initWithURL_, v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fileURL, a3);

  return v7;
}

- (BRSharingCopyShareTokenOperation)initWithItemID:(id)a3
{
  BRSharingCopyShareTokenOperation *v3;
  BRSharingCopyShareTokenOperation *v4;
  NSURL *fileURL;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRSharingCopyShareTokenOperation;
  v3 = -[BRShareOperation initWithItemIdentifier:](&v7, sel_initWithItemIdentifier_, a3);
  v4 = v3;
  if (v3)
  {
    fileURL = v3->_fileURL;
    v3->_fileURL = 0;

  }
  return v4;
}

- (void)main
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__BRSharingCopyShareTokenOperation_main__block_invoke;
  v7[3] = &unk_1E3DA4D10;
  v7[4] = self;
  v3 = (void *)MEMORY[0x1A1AD85E4](v7, a2);
  if (BRIsFPFSEnabled(v3, v4))
  {
    if (-[BRShareOperation shouldUseDirectConnection](self, "shouldUseDirectConnection"))
    {
      -[BRShareOperation directConnectionFPFSObject](self, "directConnectionFPFSObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[BRShareOperation itemID](self, "itemID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startOperation:toCopyParticipantTokenWithItemID:reply:", self, v6, v3);

    }
    else
    {
      -[BRShareOperation remoteFPFSObject](self, "remoteFPFSObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startOperation:toCopyParticipantTokenWithReply:", self, v3);
    }
  }
  else
  {
    -[BRShareOperation remoteLegacyObject](self, "remoteLegacyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startOperation:toCopyParticipantTokenAtURL:reply:", self, self->_fileURL, v3);
  }

}

void __40__BRSharingCopyShareTokenOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("shareToken"));
  if (v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("baseToken"));
  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", v9, v8);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("shareToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("baseToken"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRSharingCopyShareTokenOperation shareTokenCompletionBlock](self, "shareTokenCompletionBlock");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v8, v7);
    -[BRSharingCopyShareTokenOperation setShareTokenCompletionBlock:](self, "setShareTokenCompletionBlock:", 0);
  }

  -[BRSharingCopyShareTokenOperation shareAndBaseTokenCompletionBlock](self, "shareAndBaseTokenCompletionBlock");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, void *, void *, id))(v12 + 16))(v12, v8, v9, v7);
    -[BRSharingCopyShareTokenOperation setShareAndBaseTokenCompletionBlock:](self, "setShareAndBaseTokenCompletionBlock:", 0);
  }

  v14.receiver = self;
  v14.super_class = (Class)BRSharingCopyShareTokenOperation;
  -[BROperation finishWithResult:error:](&v14, sel_finishWithResult_error_, v6, v7);

}

- (id)shareTokenCompletionBlock
{
  return objc_getProperty(self, a2, 352, 1);
}

- (void)setShareTokenCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 352);
}

- (id)shareAndBaseTokenCompletionBlock
{
  return objc_getProperty(self, a2, 360, 1);
}

- (void)setShareAndBaseTokenCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 360);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shareAndBaseTokenCompletionBlock, 0);
  objc_storeStrong(&self->_shareTokenCompletionBlock, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
