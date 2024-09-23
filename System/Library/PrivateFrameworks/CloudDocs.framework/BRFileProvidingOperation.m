@implementation BRFileProvidingOperation

- (BRFileProvidingOperation)initWithURL:(id)a3 readingOptions:(unint64_t)a4
{
  id v7;
  BRFileProvidingOperation *v8;
  BRFileProvidingOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BRFileProvidingOperation;
  v8 = -[BROperation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v9->_readingOptions = a4;
    -[BROperation setWaitForRemoteToBeCancelled:](v9, "setWaitForRemoteToBeCancelled:", 1);
  }

  return v9;
}

- (void)main
{
  NSURL *url;
  _QWORD v3[5];

  url = self->_url;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__BRFileProvidingOperation_main__block_invoke;
  v3[3] = &unk_1E3DA4E38;
  v3[4] = self;
  BRPerformWithPersonaAndErrorForURLIfAble(url, v3);
}

void __32__BRFileProvidingOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "remoteLegacyObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __32__BRFileProvidingOperation_main__block_invoke_2;
  v7 = &unk_1E3DA47F0;
  v8 = v3;
  objc_msgSend(v2, "startOperation:toDownloadItemAtURL:readingOptions:wantsCurrentVersion:reply:");

}

uint64_t __32__BRFileProvidingOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[BRFileProvidingOperation fileProvidingCompletion](self, "fileProvidingCompletion");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v8)[2](v8, v6);

  -[BRFileProvidingOperation setFileProvidingCompletion:](self, "setFileProvidingCompletion:", 0);
  v9.receiver = self;
  v9.super_class = (Class)BRFileProvidingOperation;
  -[BROperation finishWithResult:error:](&v9, sel_finishWithResult_error_, v7, v6);

}

- (id)fileProvidingCompletion
{
  return self->_fileProvidingCompletion;
}

- (void)setFileProvidingCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (BOOL)wantsCurrentVersion
{
  return self->_wantsCurrentVersion;
}

- (void)setWantsCurrentVersion:(BOOL)a3
{
  self->_wantsCurrentVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileProvidingCompletion, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
