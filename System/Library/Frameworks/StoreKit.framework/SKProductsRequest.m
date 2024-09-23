@implementation SKProductsRequest

- (SKProductsRequest)init
{
  SKProductsRequest *v2;
  SKProductsRequestInternal *v3;
  id productsRequestInternal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKProductsRequest;
  v2 = -[SKRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKProductsRequestInternal);
    productsRequestInternal = v2->_productsRequestInternal;
    v2->_productsRequestInternal = v3;

  }
  return v2;
}

- (SKProductsRequest)initWithProductIdentifiers:(NSSet *)productIdentifiers
{
  NSSet *v4;
  SKProductsRequest *v5;
  uint64_t v6;
  _QWORD *productsRequestInternal;
  void *v8;

  v4 = productIdentifiers;
  v5 = -[SKProductsRequest init](self, "init");
  if (v5)
  {
    v6 = -[NSSet copy](v4, "copy");
    productsRequestInternal = v5->_productsRequestInternal;
    v8 = (void *)productsRequestInternal[1];
    productsRequestInternal[1] = v6;

  }
  return v5;
}

- (void)_start
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__SKProductsRequest__start__block_invoke;
  v3[3] = &unk_1E5B26890;
  v3[4] = self;
  objc_copyWeak(&v4, &location);
  -[SKProductsRequest _startWithCompletionHandler:](self, "_startWithCompletionHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __27__SKProductsRequest__start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (!dyld_program_sdk_at_least())
  {
    v7 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
    if (v6)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
LABEL_3:
  _SKErrorFromNSError(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_logEventWithPrimaryError:mappedError:", v6, v8);
LABEL_6:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SKProductsRequest__start__block_invoke_2;
  block[3] = &unk_1E5B26868;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  v13 = v8;
  v14 = v5;
  v10 = v5;
  v11 = v8;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
}

void __27__SKProductsRequest__start__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  char v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = objc_opt_respondsToSelector();
    v4 = WeakRetained;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v2, "request:didFailWithError:", WeakRetained, *(_QWORD *)(a1 + 32));
LABEL_8:
      v4 = WeakRetained;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "productsRequest:didReceiveResponse:", WeakRetained, *(_QWORD *)(a1 + 40));
    v5 = objc_opt_respondsToSelector();
    v4 = WeakRetained;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v2, "requestDidFinish:", WeakRetained);
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "_shutdownRequest");

}

- (void)_logEventWithPrimaryError:(id)a3 mappedError:(id)a4
{
  id v5;
  id v6;
  SKOneErrorEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SKOneErrorEvent);
  -[SKBaseErrorEvent setUserAction:](v7, "setUserAction:", 5);
  -[SKBaseErrorEvent setPrimaryError:](v7, "setPrimaryError:", v6);

  -[SKBaseErrorEvent setMappedError:](v7, "setMappedError:", v5);
  +[SKAnalyticsManager sendEvent:](SKAnalyticsManager, "sendEvent:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_productsRequestInternal, 0);
}

- (NSSet)_productIdentifiers
{
  return (NSSet *)*((id *)self->_productsRequestInternal + 1);
}

- (void)_startWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  SKProductsRequest *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1AC0845B0((uint64_t)&unk_1EEC65E48, v5);
}

@end
