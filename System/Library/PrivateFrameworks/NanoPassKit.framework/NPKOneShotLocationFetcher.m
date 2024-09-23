@implementation NPKOneShotLocationFetcher

- (NPKOneShotLocationFetcher)init
{
  NPKOneShotLocationFetcher *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *locationManagerQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NPKOneShotLocationFetcher;
  v2 = -[NPKOneShotLocationFetcher init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.nanopassbook.locationfetch", 0);
    locationManagerQueue = v2->_locationManagerQueue;
    v2->_locationManagerQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  CLLocationManager *v3;
  CLInUseAssertion *v4;
  NSObject *locationManagerQueue;
  CLInUseAssertion *v6;
  CLLocationManager *v7;
  objc_super v8;
  _QWORD block[4];
  CLLocationManager *v10;
  CLInUseAssertion *v11;

  v3 = self->_locationManager;
  v4 = self->_inUseAssertion;
  -[CLLocationManager setDelegate:](v3, "setDelegate:", 0);
  locationManagerQueue = self->_locationManagerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__NPKOneShotLocationFetcher_dealloc__block_invoke;
  block[3] = &unk_24CFE7E40;
  v10 = v3;
  v11 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(locationManagerQueue, block);

  v8.receiver = self;
  v8.super_class = (Class)NPKOneShotLocationFetcher;
  -[NPKOneShotLocationFetcher dealloc](&v8, sel_dealloc);
}

uint64_t __36__NPKOneShotLocationFetcher_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopUpdatingLocation");
  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)fetchLocationWithCompletion:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD block[4];
  id v9;

  -[NPKOneShotLocationFetcher setCompletionHandler:](self, "setCompletionHandler:", a3);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke;
  v7[3] = &unk_24CFE9828;
  v7[4] = self;
  v5 = v7;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = ___CanDetermineDeviceLocation_block_invoke;
  block[3] = &unk_24CFE7B00;
  v9 = v5;
  dispatch_async(v6, block);

}

void __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  _QWORD block[5];
  uint8_t buf[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (a2)
  {
    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Can determine device location.", buf, 2u);
      }

    }
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke_45;
    block[3] = &unk_24CFE7998;
    block[4] = v7;
    dispatch_async(v8, block);
  }
  else
  {
    if (v5)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Returning provisioning device data without location", buf, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0);

      objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    }
  }
}

void __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke_45(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_time_t v19;
  _QWORD handler[4];
  id v21;
  id buf[2];

  v2 = objc_alloc(MEMORY[0x24BDBFA88]);
  PKPassKitCoreBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithEffectiveBundle:delegate:onQueue:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

  v5 = (void *)MEMORY[0x24BDBFA70];
  PKPassKitCoreBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "newAssertionForBundle:withReason:", v6, CFSTR("NanoPassKit one-shot fetcher requested location"));

  objc_msgSend(v4, "requestWhenInUseAuthorization");
  objc_msgSend(v4, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && _LocationMeetsAccuracyCriteria(v8))
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Immediately retrieved location", (uint8_t *)buf, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionHandler");
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v14)[2](v14, v9);

      objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    }
    objc_msgSend(v7, "invalidate");
  }
  else
  {
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      pk_Payment_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Start updating location…", (uint8_t *)buf, 2u);
      }

    }
    v18 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 40));
    v19 = dispatch_walltime(0, 10000000000);
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak(buf, *(id *)(a1 + 32));
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke_49;
    handler[3] = &unk_24CFE7970;
    objc_copyWeak(&v21, buf);
    dispatch_source_set_event_handler(v18, handler);
    dispatch_resume(v18);
    objc_msgSend(v4, "startUpdatingLocation");
    objc_msgSend(*(id *)(a1 + 32), "setLocationFixTimeout:", v18);
    objc_msgSend(*(id *)(a1 + 32), "setLocationManager:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setInUseAssertion:", v7);
    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);

  }
}

void __57__NPKOneShotLocationFetcher_fetchLocationWithCompletion___block_invoke_49(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Event handler fired", v7, 2u);
    }

  }
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "completionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(WeakRetained, "completionHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0);

      objc_msgSend(WeakRetained, "setCompletionHandler:", 0);
    }
  }

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Location did update", buf, 2u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  v13 = v11;
  if (!v12)
    goto LABEL_20;
  v14 = v12;
  v13 = 0;
  v15 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v23 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      if (_LocationMeetsAccuracyCriteria(v17))
      {
        v18 = v17;

        v13 = v18;
      }
    }
    v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  }
  while (v14);

  if (v13)
  {
    pk_Payment_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      pk_Payment_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Found candidate location", buf, 2u);
      }

    }
    -[NPKOneShotLocationFetcher _finishLocationFixWithLocation:](self, "_finishLocationFixWithLocation:", v13, (_QWORD)v22);
LABEL_20:

  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[16];

  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Location did fail", v8, 2u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  -[NPKOneShotLocationFetcher _finishLocationFixWithLocation:](self, "_finishLocationFixWithLocation:", 0);
}

- (void)_finishLocationFixWithLocation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;

  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationManagerQueue);
  -[NPKOneShotLocationFetcher locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopUpdatingLocation");

  -[NPKOneShotLocationFetcher locationManager](self, "locationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  -[NPKOneShotLocationFetcher setLocationManager:](self, "setLocationManager:", 0);
  -[NPKOneShotLocationFetcher locationFixTimeout](self, "locationFixTimeout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NPKOneShotLocationFetcher locationFixTimeout](self, "locationFixTimeout");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    -[NPKOneShotLocationFetcher setLocationFixTimeout:](self, "setLocationFixTimeout:", 0);
  }
  -[NPKOneShotLocationFetcher completionHandler](self, "completionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NPKOneShotLocationFetcher completionHandler](self, "completionHandler");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v9)[2](v9, v10);

    -[NPKOneShotLocationFetcher setCompletionHandler:](self, "setCompletionHandler:", 0);
  }

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (OS_dispatch_source)locationFixTimeout
{
  return self->_locationFixTimeout;
}

- (void)setLocationFixTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_locationFixTimeout, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (CLInUseAssertion)inUseAssertion
{
  return self->_inUseAssertion;
}

- (void)setInUseAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_inUseAssertion, a3);
}

- (OS_dispatch_queue)locationManagerQueue
{
  return self->_locationManagerQueue;
}

- (void)setLocationManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_locationManagerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManagerQueue, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationFixTimeout, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
