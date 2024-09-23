@implementation HAP2AccessoryServerPairingDriverAuthPromptWorkItem

- (HAP2AccessoryServerPairingDriverAuthPromptWorkItem)initWithPermissionType:(unint64_t)a3
{
  HAP2AccessoryServerPairingDriverAuthPromptWorkItem *v4;
  HAP2AccessoryServerPairingDriverAuthPromptWorkItem *v5;
  HAP2AccessoryServerPairingDriverAuthPromptWorkItem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HAP2AccessoryServerPairingDriverAuthPromptWorkItem;
  v4 = -[HAP2AccessoryServerPairingDriverAuthPromptWorkItem init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_permissionType = a3;
    v6 = v4;
  }

  return v5;
}

- (void)runForPairingDriver:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = -[HAP2AccessoryServerPairingDriverAuthPromptWorkItem permissionType](self, "permissionType");
    objc_msgSend(v4, "accessoryServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_runForPairingDriver___block_invoke;
    v9[3] = &unk_1E894DDF8;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "pairingDriver:doesRequirePermission:accessory:completion:", v4, v6, v7, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerPairingDriverWorkItem finishWithError:](self, "finishWithError:", v8);

  }
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
  v7[2] = __70__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_cancelWithError___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HAP2AccessoryServerPairingDriverAuthPromptWorkItem;
  -[HAP2AccessoryServerPairingDriverWorkItem description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[HAP2AccessoryServerPairingDriverAuthPromptWorkItem permissionType](self, "permissionType");
  if (v5 - 1 > 3)
    v6 = CFSTR("Unknown Type");
  else
    v6 = off_1E894DCB8[v5 - 1];
  v7 = v6;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (%@)"), v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)permissionType
{
  return self->_permissionType;
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

void __70__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_cancelWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCancelError:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishWithError:", *(_QWORD *)(a1 + 32));

}

void __74__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_runForPairingDriver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_runForPairingDriver___block_invoke_2;
    v8[3] = &unk_1E894DF38;
    objc_copyWeak(&v10, v4);
    v9 = v3;
    objc_msgSend(v7, "addBlock:", v8);

    objc_destroyWeak(&v10);
  }

}

void __74__HAP2AccessoryServerPairingDriverAuthPromptWorkItem_runForPairingDriver___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancelError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(WeakRetained, "finishWithError:", *(_QWORD *)(a1 + 32));

}

+ (id)promptForType:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPermissionType:", a3);
}

@end
