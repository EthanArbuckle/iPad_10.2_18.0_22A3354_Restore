@implementation CRKFetchBooksFromBooksServiceOperation

+ (id)defaultRequest
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setIncludeImages:", 1);
  return v2;
}

- (CRKFetchBooksFromBooksServiceOperation)init
{
  void *v3;
  CRKFetchBooksFromBooksServiceOperation *v4;

  objc_msgSend((id)objc_opt_class(), "defaultRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRKFetchBooksFromBooksServiceOperation initWithRequest:](self, "initWithRequest:", v3);

  return v4;
}

- (CRKFetchBooksFromBooksServiceOperation)initWithRequest:(id)a3
{
  id v5;
  CRKFetchBooksFromBooksServiceOperation *v6;
  CRKFetchBooksFromBooksServiceOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchBooksFromBooksServiceOperation;
  v6 = -[CRKFetchBooksFromBooksServiceOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mRequest, a3);

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CRKFetchBooksFromBooksServiceOperation_main__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __46__CRKFetchBooksFromBooksServiceOperation_main__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  v2 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 376);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__CRKFetchBooksFromBooksServiceOperation_main__block_invoke_2;
  v5[3] = &unk_24D9CA0E0;
  v5[4] = v3;
  objc_msgSend(v2, "fetchBooksWithRequest:completion:", v4, v5);

}

uint64_t __46__CRKFetchBooksFromBooksServiceOperation_main__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "endOperationWithError:");
  else
    return objc_msgSend(v3, "endOperationWithResultObject:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRequest, 0);
}

@end
