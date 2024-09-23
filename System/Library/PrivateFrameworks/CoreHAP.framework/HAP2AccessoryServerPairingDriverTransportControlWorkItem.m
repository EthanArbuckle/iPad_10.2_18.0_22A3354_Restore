@implementation HAP2AccessoryServerPairingDriverTransportControlWorkItem

- (HAP2AccessoryServerPairingDriverTransportControlWorkItem)initWithConnect:(BOOL)a3
{
  HAP2AccessoryServerPairingDriverTransportControlWorkItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HAP2AccessoryServerPairingDriverTransportControlWorkItem;
  result = -[HAP2AccessoryServerPairingDriverTransportControlWorkItem init](&v5, sel_init);
  if (result)
    result->_connect = a3;
  return result;
}

- (id)initForOpening
{
  return -[HAP2AccessoryServerPairingDriverTransportControlWorkItem initWithConnect:](self, "initWithConnect:", 1);
}

- (id)initForClosing
{
  return -[HAP2AccessoryServerPairingDriverTransportControlWorkItem initWithConnect:](self, "initWithConnect:", 0);
}

- (void)runForPairingDriver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __80__HAP2AccessoryServerPairingDriverTransportControlWorkItem_runForPairingDriver___block_invoke;
  v10 = &unk_1E894DCE0;
  objc_copyWeak(&v11, &location);
  v6 = (void *)MEMORY[0x1D17B7400](&v7);
  if (-[HAP2AccessoryServerPairingDriverTransportControlWorkItem connect](self, "connect", v7, v8, v9, v10))
    objc_msgSend(v5, "openWithCompletion:", v6);
  else
    objc_msgSend(v5, "closeWithError:completion:", 0, v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_finishWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertCurrentQueue");

  -[HAP2AccessoryServerPairingDriverTransportControlWorkItem cancelError](self, "cancelError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[HAP2AccessoryServerPairingDriverWorkItem finishWithError:](self, "finishWithError:", v6);

}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HAP2AccessoryServerPairingDriverTransportControlWorkItem_cancelWithError___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (BOOL)connect
{
  return self->_connect;
}

- (NSError)cancelError
{
  return self->_cancelError;
}

- (void)setCancelError:(id)a3
{
  objc_storeStrong((id *)&self->_cancelError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelError, 0);
}

void __76__HAP2AccessoryServerPairingDriverTransportControlWorkItem_cancelWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancelError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(WeakRetained, "setCancelError:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "finishWithError:", *(_QWORD *)(a1 + 32));
  }

}

void __80__HAP2AccessoryServerPairingDriverTransportControlWorkItem_runForPairingDriver___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__HAP2AccessoryServerPairingDriverTransportControlWorkItem_runForPairingDriver___block_invoke_2;
  v11[3] = &unk_1E894DF38;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v10 = v7;
  v12 = v10;
  objc_msgSend(v9, "addBlock:", v11);

  objc_destroyWeak(&v13);
}

void __80__HAP2AccessoryServerPairingDriverTransportControlWorkItem_runForPairingDriver___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishWithError:", *(_QWORD *)(a1 + 32));

}

+ (id)openConnection
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithConnect:", 1);
}

+ (id)closeConnection
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithConnect:", 0);
}

@end
