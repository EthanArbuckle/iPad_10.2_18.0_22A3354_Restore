@implementation CPSLocationProvider

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_5);
  return (id)sharedProvider_sharedProvider;
}

void __37__CPSLocationProvider_sharedProvider__block_invoke()
{
  CPSLocationProvider *v0;
  void *v1;

  v0 = objc_alloc_init(CPSLocationProvider);
  v1 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = (uint64_t)v0;

}

- (CPSLocationProvider)init
{
  CPSLocationProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSObject *v5;
  CPSLocationProvider *v6;
  CPSLocationProvider *v7;
  _QWORD block[4];
  CPSLocationProvider *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CPSLocationProvider;
  v2 = -[CPSLocationProvider init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ClipServices.CPSLocationProvider", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__CPSLocationProvider_init__block_invoke;
    block[3] = &unk_24C3B94A8;
    v6 = v2;
    v10 = v6;
    dispatch_sync(v5, block);
    v7 = v6;

  }
  return v2;
}

uint64_t __27__CPSLocationProvider_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double *v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = objc_alloc((Class)getCLLocationManagerClass());
  LocationBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithEffectiveBundle:delegate:onQueue:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v7 = (double *)getkCLLocationAccuracyHundredMetersSymbolLoc_ptr;
  v13 = getkCLLocationAccuracyHundredMetersSymbolLoc_ptr;
  if (!getkCLLocationAccuracyHundredMetersSymbolLoc_ptr)
  {
    v8 = (void *)CoreLocationLibrary();
    v7 = (double *)dlsym(v8, "kCLLocationAccuracyHundredMeters");
    v11[3] = (uint64_t)v7;
    getkCLLocationAccuracyHundredMetersSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v10, 8);
  if (!v7)
    __27__CPSLocationProvider_init__block_invoke_cold_1();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDesiredAccuracy:", *v7, v10);
  result = objc_msgSend((id)objc_opt_class(), "locationServiceEnabled");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

+ (BOOL)locationServiceEnabled
{
  id CLLocationManagerClass;
  void *v3;

  CLLocationManagerClass = getCLLocationManagerClass();
  LocationBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(CLLocationManagerClass) = objc_msgSend(CLLocationManagerClass, "authorizationStatusForBundle:", v3) == 3;

  return (char)CLLocationManagerClass;
}

+ (void)setLocationServiceEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id CLLocationManagerClass;
  uint64_t v5;
  id v6;

  v3 = a3;
  CLLocationManagerClass = getCLLocationManagerClass();
  if (v3)
    v5 = 3;
  else
    v5 = 2;
  LocationBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CLLocationManagerClass, "setAuthorizationStatusByType:forBundle:", v5, v6);

}

- (void)confirmCurrentLocationInRegion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__CPSLocationProvider_confirmCurrentLocationInRegion_completion___block_invoke;
  v10[3] = &unk_24C3BA098;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[CPSLocationProvider getCurrentLocationWithCompletion:](self, "getCurrentLocationWithCompletion:", v10);

}

void __65__CPSLocationProvider_confirmCurrentLocationInRegion_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(void);
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a3)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_6:
    v5();
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "radius");
  if (v6 <= 500.0)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v10, "coordinate");
    objc_msgSend(v9, "containsCoordinate:");
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_6;
  }
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

LABEL_7:
}

- (void)getCurrentLocationWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__CPSLocationProvider_getCurrentLocationWithCompletion___block_invoke;
  v7[3] = &unk_24C3B93C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __56__CPSLocationProvider_getCurrentLocationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CPSPromise *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 32))
  {
    v3 = *(void **)(v2 + 16);
    if (!v3)
    {
      v4 = objc_alloc_init(CPSPromise);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v4;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "requestLocation");
      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    }
    objc_msgSend(v3, "addCompletionBlock:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CPSErrorDomain"), 14, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v8);

  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD44000, v4, OS_LOG_TYPE_INFO, "CPSLocationProvider: locationManagerDidChangeAuthorization", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CPSLocationProvider_locationManagerDidChangeAuthorization___block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __61__CPSLocationProvider_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "locationServiceEnabled");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v5, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138739971;
    v14 = v8;
    _os_log_impl(&dword_20AD44000, v7, OS_LOG_TYPE_INFO, "CPSLocationProvider: didUpdateLocation: %{sensitive}@", buf, 0xCu);

  }
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__CPSLocationProvider_locationManager_didUpdateLocations___block_invoke;
  v11[3] = &unk_24C3B94D0;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_async(queue, v11);

}

void __58__CPSLocationProvider_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CPSLocationProvider locationManager:didFailWithError:].cold.1((uint64_t)v5, v6);
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__CPSLocationProvider_locationManager_didFailWithError___block_invoke;
  v9[3] = &unk_24C3B94D0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

void __56__CPSLocationProvider_locationManager_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "finishWithError:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationPromise, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

void __27__CPSLocationProvider_init__block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CLLocationAccuracy getkCLLocationAccuracyHundredMeters(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("CPSLocationProvider.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
}

- (void)locationManager:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20AD44000, a2, OS_LOG_TYPE_ERROR, "CPSLocationProvider: didFailWithError: %@", (uint8_t *)&v2, 0xCu);
}

@end
