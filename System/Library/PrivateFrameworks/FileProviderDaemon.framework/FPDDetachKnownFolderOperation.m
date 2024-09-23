@implementation FPDDetachKnownFolderOperation

- (FPDDetachKnownFolderOperation)initWithKnownFolder:(id)a3 server:(id)a4 request:(id)a5
{
  id v9;
  id v10;
  id v11;
  FPDDetachKnownFolderOperation *v12;
  FPDDetachKnownFolderOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FPDDetachKnownFolderOperation;
  v12 = -[FPOperation init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_knownFolders, a3);
    objc_storeStrong((id *)&v13->_server, a4);
    objc_storeStrong((id *)&v13->_request, a5);
  }

  return v13;
}

- (void)main
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  FPDRequest *request;
  uint64_t v19;
  NSArray *obj;
  _QWORD v21[5];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = 304;
  obj = self->_knownFolders;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v24;
    while (2)
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v7);
        v22 = 0;
        -[FPDServer extensionManager](self->_server, "extensionManager", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logicalLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "domainForURL:reason:", v11, &v22);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 && v5 != v8)
        {
          objc_msgSend(v9, "logicalLocation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          FPProviderNotFoundErrorForURL();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPOperation finishWithResult:error:](self, "finishWithResult:error:", 0, v13);

          goto LABEL_17;
        }

        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(v5, "defaultBackend");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v5, "defaultBackend");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(uint64_t *)((char *)&self->super.super.super.isa + v19);
    request = self->_request;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __37__FPDDetachKnownFolderOperation_main__block_invoke;
    v21[3] = &unk_1E8C753A8;
    v21[4] = self;
    objc_msgSend(v16, "detachKnownFolders:request:completionHandler:", v17, request, v21);
  }
  else
  {
    FPNotSupportedError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPOperation finishWithResult:error:](self, "finishWithResult:error:", 0, v16);
  }

  v8 = v5;
LABEL_17:

}

uint64_t __37__FPDDetachKnownFolderOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_knownFolders, 0);
}

@end
