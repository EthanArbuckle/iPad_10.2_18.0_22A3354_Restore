@implementation BRCAcceptShareOperation

- (BRCAcceptShareOperation)initWithShareMetadata:(id)a3 syncContext:(id)a4 sessionContext:(id)a5
{
  id v9;
  BRCAcceptShareOperation *v10;
  BRCAcceptShareOperation *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCAcceptShareOperation;
  v10 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v13, sel_initWithName_syncContext_sessionContext_, CFSTR("share/accept"), a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_shareMetadata, a3);

  return v11;
}

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[6];
  _QWORD v8[5];
  _QWORD v9[5];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C94B78]);
  v11[0] = self->_shareMetadata;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithShareMetadatas:", v4);

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__8;
  v9[4] = __Block_byref_object_dispose__8;
  v6 = MEMORY[0x1E0C809B0];
  v10 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __31__BRCAcceptShareOperation_main__block_invoke;
  v8[3] = &unk_1E875F850;
  v8[4] = v9;
  objc_msgSend(v5, "setPerShareCompletionBlock:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __31__BRCAcceptShareOperation_main__block_invoke_2;
  v7[3] = &unk_1E875F878;
  v7[4] = self;
  v7[5] = v9;
  objc_msgSend(v5, "setAcceptSharesCompletionBlock:", v7);
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v5);
  _Block_object_dispose(v9, 8);

}

void __31__BRCAcceptShareOperation_main__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __31__BRCAcceptShareOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[BRCAcceptShareOperation acceptShareCompletionBlock](self, "acceptShareCompletionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[BRCAcceptShareOperation acceptShareCompletionBlock](self, "acceptShareCompletionBlock");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v9)[2](v9, v6, v7);

  }
  v10.receiver = self;
  v10.super_class = (Class)BRCAcceptShareOperation;
  -[_BRCOperation finishWithResult:error:](&v10, sel_finishWithResult_error_, v6, v7);

}

- (id)acceptShareCompletionBlock
{
  return self->_acceptShareCompletionBlock;
}

- (void)setAcceptShareCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_acceptShareCompletionBlock, 0);
  objc_storeStrong((id *)&self->_shareMetadata, 0);
}

@end
