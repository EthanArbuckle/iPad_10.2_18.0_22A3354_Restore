@implementation ENBusinessNoteStoreClient

- (NSString)noteStoreUrl
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[ENBusinessNoteStoreClient delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENBusinessNoteStoreClient.m"), 40, CFSTR("ENBusinessNoteStoreClient delegate not set"));

  }
  -[ENBusinessNoteStoreClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteStoreUrlForBusinessStoreClient:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)authenticationToken
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[ENBusinessNoteStoreClient delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENBusinessNoteStoreClient.m"), 46, CFSTR("ENBusinessNoteStoreClient delegate not set"));

  }
  -[ENBusinessNoteStoreClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticationTokenForBusinessStoreClient:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)createBusinessNotebook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__ENBusinessNoteStoreClient_createBusinessNotebook_completion___block_invoke;
  v8[3] = &unk_24F8B1548;
  v9 = v6;
  v7 = v6;
  -[ENNoteStoreClient createNotebook:completion:](self, "createNotebook:completion:", a3, v8);

}

- (void)createBusinessNotebook:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__ENBusinessNoteStoreClient_createBusinessNotebook_success_failure___block_invoke;
  v12[3] = &unk_24F8B8A40;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ENBusinessNoteStoreClient createBusinessNotebook:completion:](self, "createBusinessNotebook:completion:", a3, v12);

}

- (ENBusinessNoteStoreClientDelegate)delegate
{
  return (ENBusinessNoteStoreClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setNoteStoreUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteStoreUrl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __68__ENBusinessNoteStoreClient_createBusinessNotebook_success_failure___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__ENBusinessNoteStoreClient_createBusinessNotebook_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  EDAMLinkedNotebook *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a2;
  v19 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "sharedNotebooks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(EDAMLinkedNotebook);
    objc_msgSend(v7, "globalId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAMLinkedNotebook setSharedNotebookGlobalId:](v8, "setSharedNotebookGlobalId:", v9);

    objc_msgSend(v19, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAMLinkedNotebook setShareName:](v8, "setShareName:", v10);

    +[ENSession sharedSession](ENSession, "sharedSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "businessUser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "username");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAMLinkedNotebook setUsername:](v8, "setUsername:", v13);

    +[ENSession sharedSession](ENSession, "sharedSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "businessUser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shardId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAMLinkedNotebook setShardId:](v8, "setShardId:", v16);

    +[ENSession sharedSession](ENSession, "sharedSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "primaryNoteStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createLinkedNotebook:completion:", v8, *(_QWORD *)(a1 + 32));

  }
}

+ (id)noteStoreClientForBusiness
{
  return objc_alloc_init(ENBusinessNoteStoreClient);
}

@end
