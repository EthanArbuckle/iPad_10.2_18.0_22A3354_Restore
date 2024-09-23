@implementation LAPSPasscodeChangeSystemDispatchDecorator

- (LAPSPasscodeChangeSystemDispatchDecorator)initWithSystem:(id)a3
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  LAPSPasscodeChangeSystemDispatchDecorator *v9;

  v4 = (void *)MEMORY[0x24BE606C0];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createUserInitiatedSerialQueueWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[LAPSPasscodeChangeSystemDispatchDecorator initWithSystem:workQueue:](self, "initWithSystem:workQueue:", v5, v8);
  return v9;
}

- (LAPSPasscodeChangeSystemDispatchDecorator)initWithSystem:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  LAPSPasscodeChangeSystemDispatchDecorator *v9;
  LAPSPasscodeChangeSystemDispatchDecorator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LAPSPasscodeChangeSystemDispatchDecorator;
  v9 = -[LAPSPasscodeChangeSystemDispatchDecorator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_system, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (id)oldPasscodeRequest
{
  return (id)-[LAPSPasscodeChangeSystem oldPasscodeRequest](self->_system, "oldPasscodeRequest");
}

- (id)newPasscodeRequest
{
  return (id)-[LAPSPasscodeChangeSystem newPasscodeRequest](self->_system, "newPasscodeRequest");
}

- (BOOL)hasPasscode
{
  return -[LAPSPasscodeChangeSystem hasPasscode](self->_system, "hasPasscode");
}

- (id)lastPasscodeChange
{
  return (id)-[LAPSPasscodeChangeSystem lastPasscodeChange](self->_system, "lastPasscodeChange");
}

- (void)verifyPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke;
  v10[3] = &unk_24FDCDB10;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[LAPSPasscodeChangeSystemDispatchDecorator _performOnBackgroundQueue:](self, "_performOnBackgroundQueue:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 1);
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke_2;
    v7[3] = &unk_24FDCD980;
    objc_copyWeak(&v9, v2);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "verifyPasscode:completion:", v6, v7);

    objc_destroyWeak(&v9);
  }

}

void __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke_3;
    v5[3] = &unk_24FDCD958;
    v7 = *(id *)(a1 + 32);
    v6 = v3;
    objc_msgSend(WeakRetained, "_performOnMainQueue:", v5);

  }
}

uint64_t __71__LAPSPasscodeChangeSystemDispatchDecorator_verifyPasscode_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)verifyNewPasscode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke;
  v10[3] = &unk_24FDCDB10;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[LAPSPasscodeChangeSystemDispatchDecorator _performOnBackgroundQueue:](self, "_performOnBackgroundQueue:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 1);
    v6 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke_2;
    v7[3] = &unk_24FDCD980;
    objc_copyWeak(&v9, v2);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v5, "verifyNewPasscode:completion:", v6, v7);

    objc_destroyWeak(&v9);
  }

}

void __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke_3;
    v5[3] = &unk_24FDCD958;
    v7 = *(id *)(a1 + 32);
    v6 = v3;
    objc_msgSend(WeakRetained, "_performOnMainQueue:", v5);

  }
}

uint64_t __74__LAPSPasscodeChangeSystemDispatchDecorator_verifyNewPasscode_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)canChangePasscodeWithError:(id *)a3
{
  return -[LAPSPasscodeChangeSystem canChangePasscodeWithError:](self->_system, "canChangePasscodeWithError:", a3);
}

- (void)changePasscode:(id)a3 to:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke;
  v14[3] = &unk_24FDCDDA8;
  objc_copyWeak(&v18, &location);
  v11 = v8;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v13 = v10;
  v17 = v13;
  -[LAPSPasscodeChangeSystemDispatchDecorator _performOnBackgroundQueue:](self, "_performOnBackgroundQueue:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 1);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke_2;
    v8[3] = &unk_24FDCD980;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "changePasscode:to:completion:", v6, v7, v8);

    objc_destroyWeak(&v10);
  }

}

void __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke_3;
    v5[3] = &unk_24FDCD958;
    v7 = *(id *)(a1 + 32);
    v6 = v3;
    objc_msgSend(WeakRetained, "_performOnMainQueue:", v5);

  }
}

uint64_t __74__LAPSPasscodeChangeSystemDispatchDecorator_changePasscode_to_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_performOnBackgroundQueue:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_workQueue, a3);
}

- (void)_performOnMainQueue:(id)a3
{
  dispatch_async(MEMORY[0x24BDAC9B8], a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_system, 0);
}

@end
