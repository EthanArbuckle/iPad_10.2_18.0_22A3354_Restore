@implementation LACDomainStateProvider

- (LACDomainStateProvider)initWithProviders:(id)a3
{
  id v5;
  LACDomainStateProvider *v6;
  LACDomainStateProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDomainStateProvider;
  v6 = -[LACDomainStateProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_providers, a3);

  return v7;
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  -[LACDomainStateProvider _domainStateWithProviders:request:partialResult:completion:](self, "_domainStateWithProviders:request:partialResult:completion:", self->_providers, a3, MEMORY[0x24BDBD1B8], a4);
}

- (void)_domainStateWithProviders:(id)a3 request:(id)a4 partialResult:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(v10, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __85__LACDomainStateProvider__domainStateWithProviders_request_partialResult_completion___block_invoke;
    v15[3] = &unk_2510C25E0;
    objc_copyWeak(&v20, &location);
    v19 = v13;
    v16 = v10;
    v17 = v12;
    v18 = v11;
    objc_msgSend(v14, "domainStateForRequest:completion:", v18, v15);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, id, _QWORD))v13 + 2))(v13, v12, 0);
  }

}

void __85__LACDomainStateProvider__domainStateWithProviders_request_partialResult_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 32), "count") - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      objc_msgSend(v8, "addEntriesFromDictionary:", v9);
      objc_msgSend(WeakRetained, "_domainStateWithProviders:request:partialResult:completion:", v7, *(_QWORD *)(a1 + 48), v8, *(_QWORD *)(a1 + 56));

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
}

@end
