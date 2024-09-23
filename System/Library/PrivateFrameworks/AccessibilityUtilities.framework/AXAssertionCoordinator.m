@implementation AXAssertionCoordinator

- (AXAssertionCoordinator)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  AXAssertionCoordinator *v8;
  dispatch_queue_t v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXAssertionCoordinator;
  v8 = -[AXAssertionCoordinator init](&v11, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("AXAssertionCoordinator-AssertionQueue", 0);
    -[AXAssertionCoordinator setAssertionQueue:](v8, "setAssertionQueue:", v9);

    -[AXAssertionCoordinator setDelegate:](v8, "setDelegate:", v7);
    -[AXAssertionCoordinator setIdentifier:](v8, "setIdentifier:", v6);
  }

  return v8;
}

- (id)acquireAssertionWithReason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  -[AXAssertionCoordinator identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __53__AXAssertionCoordinator_acquireAssertionWithReason___block_invoke;
  v12 = &unk_1E24C5898;
  objc_copyWeak(&v13, &location);
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", v6, v4, &v9);

  -[AXAssertionCoordinator _startTrackingPoorMansAssertion:](self, "_startTrackingPoorMansAssertion:", v7, v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

void __53__AXAssertionCoordinator_acquireAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_stopTrackingPoorMansAssertion:", v3);

}

- (void)_startTrackingPoorMansAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "AXAssertionCoordinator: Now start tracking assertion for reason: %@", buf, 0xCu);

  }
  -[AXAssertionCoordinator assertionQueue](self, "assertionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__AXAssertionCoordinator__startTrackingPoorMansAssertion___block_invoke;
  v9[3] = &unk_1E24C5200;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __58__AXAssertionCoordinator__startTrackingPoorMansAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAssertions:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertionCoordinator:assertionsDidBecomeActive:", *(_QWORD *)(a1 + 32), 1);

  }
}

- (void)_stopTrackingPoorMansAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  AXLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_18C62B000, v5, OS_LOG_TYPE_DEFAULT, "AXAssertionCoordinator: Stop tracking assertion for reason: %@", buf, 0xCu);

  }
  -[AXAssertionCoordinator assertionQueue](self, "assertionQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__AXAssertionCoordinator__stopTrackingPoorMansAssertion___block_invoke;
  v9[3] = &unk_1E24C5200;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __57__AXAssertionCoordinator__stopTrackingPoorMansAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "assertions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assertionCoordinator:assertionsDidBecomeActive:", *(_QWORD *)(a1 + 32), 0);

    }
  }
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[AXAssertionCoordinator assertionQueue](self, "assertionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AXAssertionCoordinator_dealloc__block_invoke;
  block[3] = &unk_1E24C4C38;
  block[4] = self;
  dispatch_async(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)AXAssertionCoordinator;
  -[AXAssertionCoordinator dealloc](&v4, sel_dealloc);
}

void __33__AXAssertionCoordinator_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "assertions", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "invalidate");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (AXAssertionCoordinatorDelegate)delegate
{
  return (AXAssertionCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (OS_dispatch_queue)assertionQueue
{
  return self->_assertionQueue;
}

- (void)setAssertionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assertionQueue, a3);
}

- (NSHashTable)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_assertions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_assertionQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
