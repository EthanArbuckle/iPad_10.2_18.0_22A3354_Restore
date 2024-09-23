@implementation NWRPFileTransferSession

- (id)initAsTarget:(BOOL)a3
{
  _BOOL4 v3;
  NWRPFileTransferSession *v4;
  double v5;
  uint64_t v6;
  RPFileTransferSession *v7;
  RPFileTransferSession *session;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NWRPFileTransferSession;
  v4 = -[NWRPFileTransferSession init](&v16, sel_init);
  v4->_isTarget = v3;
  objc_initWeak(&location, v4);
  gotLoadHelper_x8__OBJC_CLASS___RPFileTransferSession(v5);
  v7 = (RPFileTransferSession *)objc_alloc_init(*(Class *)(v6 + 2352));
  session = v4->_session;
  v4->_session = v7;

  -[RPFileTransferSession setFlags:](v4->_session, "setFlags:", v3 | 0x50u);
  -[RPFileTransferSession setProgressHandlerTimeInterval:](v4->_session, "setProgressHandlerTimeInterval:", 1.0);
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__NWRPFileTransferSession_initAsTarget___block_invoke;
  v13[3] = &unk_1E149CE98;
  objc_copyWeak(&v14, &location);
  -[RPFileTransferSession setReceivedItemHandler:](v4->_session, "setReceivedItemHandler:", v13);
  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __40__NWRPFileTransferSession_initAsTarget___block_invoke_2;
  v11[3] = &unk_1E149CEC0;
  objc_copyWeak(&v12, &location);
  -[RPFileTransferSession setProgressHandler:](v4->_session, "setProgressHandler:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v4;
}

- (NSData)peerPublicKey
{
  void *v2;
  void *v3;

  -[NWRPFileTransferSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerPublicKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setPeerPublicKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NWRPFileTransferSession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPeerPublicKey:", v4);

}

- (NSData)selfPublicKey
{
  void *v2;
  void *v3;

  -[NWRPFileTransferSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selfPublicKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)targetID
{
  void *v2;
  void *v3;

  -[NWRPFileTransferSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTargetID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NWRPFileTransferSession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTargetID:", v4);

}

- (NSURL)temporaryDirectoryURL
{
  void *v2;
  void *v3;

  -[NWRPFileTransferSession session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "temporaryDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NWRPFileTransferSession session](self, "session");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTemporaryDirectoryURL:", v4);

}

- (void)activate
{
  id v2;

  -[NWRPFileTransferSession session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activate");

}

- (void)invalidate
{
  id v2;

  -[NWRPFileTransferSession session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)prepare
{
  id v2;

  -[NWRPFileTransferSession session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareTemplateAndReturnError:", 0);

}

- (void)transferFileURL:(id)a3 completion:(id)a4
{
  id v6;
  double v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  gotLoadHelper_x8__OBJC_CLASS___RPFileTransferItem(v7);
  v9 = *(objc_class **)(v8 + 2328);
  v10 = a3;
  v11 = objc_alloc_init(v9);
  objc_msgSend(v11, "setItemURL:", v10);
  objc_msgSend(v10, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setFilename:", v12);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__NWRPFileTransferSession_transferFileURL_completion___block_invoke;
  v15[3] = &unk_1E149CEE8;
  v16 = v6;
  v13 = v6;
  objc_msgSend(v11, "setCompletionHandler:", v15);
  -[NWRPFileTransferSession session](self, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addItem:", v11);

}

- (void)handleReceivedItem:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  objc_msgSend(a3, "filename");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NWRPFileTransferSession receivedFileHandler](self, "receivedFileHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[NWRPFileTransferSession receivedFileHandler](self, "receivedFileHandler");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v5)[2](v5, v6);

    }
  }

}

- (void)handleProgress:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(void);
  id v7;

  v7 = a3;
  -[NWRPFileTransferSession completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[NWRPFileTransferSession isTarget](self, "isTarget") && objc_msgSend(v7, "type") == 11
      || objc_msgSend(v7, "totalFileCount") >= 1
      && (v5 = objc_msgSend(v7, "totalFileCount"), v5 == objc_msgSend(v7, "transferredFileCount")))
    {
      -[NWRPFileTransferSession completionHandler](self, "completionHandler");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

    }
  }

}

- (id)receivedFileHandler
{
  return self->_receivedFileHandler;
}

- (void)setReceivedFileHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isTarget
{
  return self->_isTarget;
}

- (RPFileTransferSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_receivedFileHandler, 0);
}

uint64_t __54__NWRPFileTransferSession_transferFileURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__NWRPFileTransferSession_initAsTarget___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(uint64_t, _QWORD);
  id v6;
  id WeakRetained;

  v5 = *(void (**)(uint64_t, _QWORD))(a3 + 16);
  v6 = a2;
  v5(a3, 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleReceivedItem:", v6);

}

void __40__NWRPFileTransferSession_initAsTarget___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleProgress:", v3);

}

@end
