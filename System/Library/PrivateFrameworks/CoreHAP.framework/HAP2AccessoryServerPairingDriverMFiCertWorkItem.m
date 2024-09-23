@implementation HAP2AccessoryServerPairingDriverMFiCertWorkItem

+ (id)checkCertificate
{
  return (id)objc_opt_new();
}

- (void)runForPairingDriver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  objc_msgSend(v4, "pairingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getCertificate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(v4, "accessoryServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__HAP2AccessoryServerPairingDriverMFiCertWorkItem_runForPairingDriver___block_invoke;
    v15[3] = &unk_1E8949C28;
    objc_copyWeak(&v19, &location);
    v12 = v9;
    v16 = v12;
    v17 = v4;
    v13 = v8;
    v18 = v13;
    objc_msgSend(v7, "pairingDriver:validatePairingCert:model:completion:", v17, v6, v11, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerPairingDriverWorkItem finishWithError:](self, "finishWithError:", v14);

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
  v7[2] = __67__HAP2AccessoryServerPairingDriverMFiCertWorkItem_cancelWithError___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

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

void __67__HAP2AccessoryServerPairingDriverMFiCertWorkItem_cancelWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "setCancelError:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "finishWithError:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __71__HAP2AccessoryServerPairingDriverMFiCertWorkItem_runForPairingDriver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v5, "accessoryServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "model");

    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v10 = (id)objc_msgSend(v8, "numberWithDouble:");

    objc_msgSend(v3, "domain");
    objc_msgSend(v3, "code");

    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __71__HAP2AccessoryServerPairingDriverMFiCertWorkItem_runForPairingDriver___block_invoke_2;
    v16 = &unk_1E894E0F8;
    v17 = WeakRetained;
    v18 = v3;
    v11 = (void *)MEMORY[0x1D17B7400](&v13);
    objc_msgSend(WeakRetained, "operationQueue", v13, v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addBlock:", v11);

  }
}

void __71__HAP2AccessoryServerPairingDriverMFiCertWorkItem_runForPairingDriver___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "cancelError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

@end
