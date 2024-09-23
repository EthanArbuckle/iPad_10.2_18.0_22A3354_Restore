@implementation CAFUIPunchThroughController

- (CAFUIPunchThroughController)initWithSession:(id)a3
{
  id v5;
  CAFUIPunchThroughController *v6;
  CAFUIPunchThroughController *v7;
  uint64_t v8;
  NSMutableDictionary *activePunchThroughs;
  id v10;
  uint64_t v11;
  CARObserverHashTable *observers;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSDictionary *availablePunchThroughIdentifiers;
  _QWORD v20[4];
  id v21;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CAFUIPunchThroughController;
  v6 = -[CAFUIPunchThroughController init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    activePunchThroughs = v7->_activePunchThroughs;
    v7->_activePunchThroughs = (NSMutableDictionary *)v8;

    v10 = objc_alloc(MEMORY[0x24BE15228]);
    v11 = objc_msgSend(v10, "initWithProtocol:callbackQueue:", &unk_256829998, MEMORY[0x24BDAC9B8]);
    observers = v7->_observers;
    v7->_observers = (CARObserverHashTable *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displays");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __47__CAFUIPunchThroughController_initWithSession___block_invoke;
    v20[3] = &unk_2508D18A8;
    v21 = v13;
    v16 = v13;
    objc_msgSend(v15, "bs_each:", v20);

    v17 = objc_msgSend(v16, "copy");
    availablePunchThroughIdentifiers = v7->_availablePunchThroughIdentifiers;
    v7->_availablePunchThroughIdentifiers = (NSDictionary *)v17;

  }
  return v7;
}

void __47__CAFUIPunchThroughController_initWithSession___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "punchThroughIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    v5 = v8;
  else
    v5 = (id)MEMORY[0x24BDBD1A8];
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFUIPunchThroughController observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFUIPunchThroughController observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)requestActivationOfPunchThroughWithIdentifier:(id)a3 displayIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (-[CAFUIPunchThroughController displayIdentifier:hasPunchThroughWithIdentifier:](self, "displayIdentifier:hasPunchThroughWithIdentifier:", v9, v8))
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE15420]), "initWithPunchThroughIdentifier:", v8);
    objc_msgSend(v11, "setDelegate:", self);
    -[CAFUIPunchThroughController activePunchThroughs](self, "activePunchThroughs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v9);

    CAFUIStatusLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v8;
      v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_237505000, v13, OS_LOG_TYPE_DEFAULT, "Requesting presentation of punch-through %{public}@ on display %{public}@", buf, 0x16u);
    }

    +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendStringWithFormat:", CFSTR("Requesting presentation of punch-through %{public}@ on display %{public}@"), v8, v9);

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_96;
    v19[3] = &unk_2508D1920;
    v20 = v8;
    v21 = v10;
    v15 = v10;
    objc_msgSend(v11, "requestPresentationWithCompletion:", v19);

  }
  else
  {
    CAFUIStatusLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v25 = v8;
      v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_237505000, v16, OS_LOG_TYPE_DEFAULT, "Requested presentation of punch-through %{public}@, which does not exist on display %{public}@.", buf, 0x16u);
    }

    +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendStringWithFormat:", CFSTR("Requested presentation of punch-through %{public}@, which does not exist on display %{public}@."), v8, v9);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke;
    block[3] = &unk_2508D18D0;
    v23 = v10;
    v11 = v10;
    v18 = (void *)MEMORY[0x24BDAC9B8];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v15 = v23;
  }

}

uint64_t __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_96(uint64_t a1, char a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD block[4];
  id v10;
  char v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CAFUIStatusLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_237505000, v4, OS_LOG_TYPE_DEFAULT, "Presentation of punch-through %{public}@ was requested successfully.", buf, 0xCu);
    }

    +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendStringWithFormat:", CFSTR("Presentation of punch-through %{public}@ was requested successfully."), *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_237505000, v4, OS_LOG_TYPE_DEFAULT, "Presentation of punch-through %{public}@ was unsuccessful!", buf, 0xCu);
    }

    +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendStringWithFormat:", CFSTR("Presentation of punch-through %{public}@ was unsuccessful!"), *(_QWORD *)(a1 + 32));
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_101;
  block[3] = &unk_2508D18F8;
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __106__CAFUIPunchThroughController_requestActivationOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)requestDismissalOfPunchThroughWithIdentifier:(id)a3 displayIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  id *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  CAFUIPunchThroughController *v30;
  id v31;
  id v32;
  _QWORD block[4];
  id v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[CAFUIPunchThroughController activePunchThroughs](self, "activePunchThroughs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    CAFUIStatusLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v38 = v8;
      _os_log_impl(&dword_237505000, v21, OS_LOG_TYPE_DEFAULT, "Requested dismissal of punch-through %{public}@, but it isn't visible.", buf, 0xCu);
    }

    +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appendStringWithFormat:", CFSTR("Requested dismissal of punch-through %{public}@, but it isn't visible."), v8);

    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke;
    v35[3] = &unk_2508D18D0;
    v18 = &v36;
    v36 = v10;
    v20 = MEMORY[0x24BDAC9B8];
    v23 = v35;
    goto LABEL_12;
  }
  objc_msgSend(v12, "punchThroughIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", v8);

  CAFUIStatusLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) == 0)
  {
    if (v16)
    {
      objc_msgSend(v12, "punchThroughIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v8;
      v39 = 2114;
      v40 = v9;
      v41 = 2114;
      v42 = v24;
      _os_log_impl(&dword_237505000, v15, OS_LOG_TYPE_DEFAULT, "Requested dismissal of punch-through %{public}@ on display %{public}@, but that display is showing a different punch-through: %{public}@", buf, 0x20u);

    }
    +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "punchThroughIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "appendStringWithFormat:", CFSTR("Requested dismissal of punch-through %{public}@ on display %{public}@, but that display is showing a different punch-through: %{public}@"), v8, v9, v26);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_107;
    block[3] = &unk_2508D18D0;
    v18 = &v34;
    v34 = v10;
    v20 = MEMORY[0x24BDAC9B8];
    v23 = block;
LABEL_12:
    dispatch_async(v20, v23);
    goto LABEL_13;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138543618;
    v38 = v8;
    v39 = 2114;
    v40 = v9;
    _os_log_impl(&dword_237505000, v15, OS_LOG_TYPE_DEFAULT, "Requesting dismissal of punch-through %{public}@ on display %{public}@", buf, 0x16u);
  }

  +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendStringWithFormat:", CFSTR("Requesting dismissal of punch-through %{public}@ on display %{public}@"), v8, v9);

  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_110;
  v27[3] = &unk_2508D1970;
  v18 = &v28;
  v28 = v8;
  v19 = v12;
  v29 = v19;
  v30 = self;
  v31 = v9;
  v32 = v10;
  -[NSObject requestDismissalWithCompletion:](v19, "requestDismissalWithCompletion:", v27);

  v20 = v29;
LABEL_13:

}

uint64_t __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_107(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_110(uint64_t a1, char a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  CAFUIStatusLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_impl(&dword_237505000, v4, OS_LOG_TYPE_DEFAULT, "Dismissal of punch-through %{public}@ was requested successfully.", buf, 0xCu);
    }

    +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendStringWithFormat:", CFSTR("Dismissal of punch-through %{public}@ was requested successfully."), *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v20 = v8;
      _os_log_impl(&dword_237505000, v4, OS_LOG_TYPE_DEFAULT, "Dismissal of punch-through %{public}@ was unsuccessful!", buf, 0xCu);
    }

    +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendStringWithFormat:", CFSTR("Dismissal of punch-through %{public}@ was unsuccessful!"), *(_QWORD *)(a1 + 32));
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_115;
  block[3] = &unk_2508D1948;
  v9 = *(id *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(void **)(a1 + 56);
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 64);
  v18 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __105__CAFUIPunchThroughController_requestDismissalOfPunchThroughWithIdentifier_displayIdentifier_completion___block_invoke_115(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "activePunchThroughs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "punchThroughController:didDismissPunchThroughWithIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (BOOL)hasPunchThroughWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[CAFUIPunchThroughController session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displays");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__CAFUIPunchThroughController_hasPunchThroughWithIdentifier___block_invoke;
  v12[3] = &unk_2508D1998;
  v13 = v4;
  v8 = v4;
  objc_msgSend(v7, "bs_firstObjectPassingTest:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

uint64_t __61__CAFUIPunchThroughController_hasPunchThroughWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPunchThroughWithIdentifier:", *(_QWORD *)(a1 + 32));
}

- (BOOL)displayIdentifier:(id)a3 hasPunchThroughWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[CAFUIPunchThroughController session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displays");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__CAFUIPunchThroughController_displayIdentifier_hasPunchThroughWithIdentifier___block_invoke;
  v14[3] = &unk_2508D1998;
  v15 = v6;
  v11 = v6;
  objc_msgSend(v10, "bs_firstObjectPassingTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v12, "hasPunchThroughWithIdentifier:", v7);
  return (char)v8;
}

uint64_t __79__CAFUIPunchThroughController_displayIdentifier_hasPunchThroughWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)displayIdentifier:(id)a3 isDisplayingPunchThroughWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[CAFUIPunchThroughController activePunchThroughs](self, "activePunchThroughs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "punchThroughIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "isEqualToString:", v6);

  return (char)v8;
}

- (id)punchThroughIdentifierOnDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CAFUIPunchThroughController activePunchThroughs](self, "activePunchThroughs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "punchThroughIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removeControllersWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CAFUIPunchThroughController activePunchThroughs](self, "activePunchThroughs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__CAFUIPunchThroughController_removeControllersWithIdentifier___block_invoke;
  v8[3] = &unk_2508D19C0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v7, "bs_each:", v8);

}

void __63__CAFUIPunchThroughController_removeControllersWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activePunchThroughs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "punchThroughIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v7)
  {
    CAFUIStatusLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      v15 = 2114;
      v16 = v3;
      _os_log_impl(&dword_237505000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating punch-through %{public}@ on display %{public}@", buf, 0x16u);
    }

    +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendStringWithFormat:", CFSTR("Invalidating punch-through %{public}@ on display %{public}@"), *(_QWORD *)(a1 + 40), v3);

    objc_msgSend(v5, "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "activePunchThroughs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v3);

    objc_msgSend(*(id *)(a1 + 32), "observers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "punchThroughController:didDismissPunchThroughWithIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)punchThroughControllerDidDismiss:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CAFUIStatusLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "punchThroughIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_237505000, v5, OS_LOG_TYPE_DEFAULT, "Punch-through with identifier %{public}@ did dismiss.", buf, 0xCu);

  }
  +[CAFUIStatusViewController sharedInstance](CAFUIStatusViewController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchThroughIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendStringWithFormat:", CFSTR("Punch-through with identifier %{public}@ did dismiss."), v8);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CAFUIPunchThroughController_punchThroughControllerDidDismiss___block_invoke;
  block[3] = &unk_2508D19E8;
  block[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __64__CAFUIPunchThroughController_punchThroughControllerDidDismiss___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "punchThroughIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeControllersWithIdentifier:", v2);

}

- (NSDictionary)availablePunchThroughIdentifiers
{
  return self->_availablePunchThroughIdentifiers;
}

- (CARSession)session
{
  return self->_session;
}

- (NSMutableDictionary)activePunchThroughs
{
  return self->_activePunchThroughs;
}

- (void)setActivePunchThroughs:(id)a3
{
  objc_storeStrong((id *)&self->_activePunchThroughs, a3);
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activePunchThroughs, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_availablePunchThroughIdentifiers, 0);
}

@end
