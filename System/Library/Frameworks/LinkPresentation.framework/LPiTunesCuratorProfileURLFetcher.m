@implementation LPiTunesCuratorProfileURLFetcher

- (LPiTunesCuratorProfileURLFetcher)initWithCuratorID:(id)a3
{
  id v5;
  LPiTunesCuratorProfileURLFetcher *v6;
  LPiTunesCuratorProfileURLFetcher *v7;
  LPiTunesCuratorProfileURLFetcher *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPiTunesCuratorProfileURLFetcher;
  v6 = -[LPFetcher init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_curatorID, a3);
    v8 = v7;
  }

  return v7;
}

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id completionHandler;
  LPiTunesMediaLookupTask *v11;
  LPiTunesMediaLookupTask *lookupTask;
  LPiTunesMediaLookupTask *v13;
  _QWORD v14[5];

  v7 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  v8 = a4;
  v9 = _Block_copy(v8);

  completionHandler = self->_completionHandler;
  self->_completionHandler = v9;

  if (self->_curatorID)
  {
    v11 = -[LPiTunesMediaLookupTask initWithIdentifier:storefrontCountryCode:]([LPiTunesMediaLookupTask alloc], "initWithIdentifier:storefrontCountryCode:", self->_curatorID, 0);
    lookupTask = self->_lookupTask;
    self->_lookupTask = v11;

    v13 = self->_lookupTask;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__LPiTunesCuratorProfileURLFetcher_fetchWithConfiguration_completionHandler___block_invoke;
    v14[3] = &unk_1E44A8A48;
    v14[4] = self;
    -[LPiTunesMediaLookupTask start:](v13, "start:", v14);
  }

}

void __77__LPiTunesCuratorProfileURLFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a2;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__LPiTunesCuratorProfileURLFetcher_fetchWithConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_1E44A8DD0;
  block[4] = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__LPiTunesCuratorProfileURLFetcher_fetchWithConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  LPFetcherURLResponse *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  v4 = *(_BYTE **)(a1 + 32);
  if (!v4[72])
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v4, "_failedWithError:");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("shortUrl"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 32);
        if (v5)
        {
          v7 = -[LPFetcherURLResponse initWithURL:fetcher:]([LPFetcherURLResponse alloc], "initWithURL:fetcher:", v5, *(_QWORD *)(a1 + 32));
          objc_msgSend(v6, "_completedWithResponse:", v7);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "_failedWithError:", 0);
        }

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_failedWithError:", 0);
      }

    }
  }
}

- (void)cancel
{
  id completionHandler;

  self->_cancelled = 1;
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)_failedWithError:(id)a3
{
  LPFetcherErrorResponse *v4;
  id v5;

  v5 = a3;
  v4 = -[LPFetcherErrorResponse initWithError:fetcher:]([LPFetcherErrorResponse alloc], "initWithError:fetcher:", v5, self);
  -[LPiTunesCuratorProfileURLFetcher _completedWithResponse:](self, "_completedWithResponse:", v4);

}

- (void)_completedWithResponse:(id)a3
{
  id v4;
  void (**completionHandler)(void);
  id v6;
  id v7;

  v4 = a3;
  completionHandler = (void (**)(void))self->_completionHandler;
  v7 = v4;
  if (completionHandler)
  {
    completionHandler[2]();
    v6 = self->_completionHandler;
  }
  else
  {
    v6 = 0;
  }
  self->_completionHandler = 0;

}

- (NSString)curatorID
{
  return self->_curatorID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupTask, 0);
  objc_storeStrong((id *)&self->_curatorID, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
