@implementation GEOMapDataSubscriptionShiftFunctionDownloader

- (GEOMapDataSubscriptionShiftFunctionDownloader)initWithSubscription:(id)a3 shifter:(id)a4 cache:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 log:(id)a8 logPrefix:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  GEOApplicationAuditToken *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  GEOMapDataSubscriptionShiftFunctionDownloader *v43;
  id v45;
  id v46;
  uint8_t buf[16];
  objc_super v48;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v46 = a7;
  v45 = a8;
  v20 = a9;
  v48.receiver = self;
  v48.super_class = (Class)GEOMapDataSubscriptionShiftFunctionDownloader;
  -[GEOMapDataSubscriptionShiftFunctionDownloader self](&v48, sel_self);
  v21 = objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
LABEL_16:
    v43 = 0;
    v33 = v45;
    v39 = v46;
    goto LABEL_13;
  }
  if (v17)
  {
    v22 = v17;
  }
  else
  {
    +[GEOLocationShifter _proxy](GEOLocationShifter, "_proxy");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = *(void **)(v21 + 32);
  *(_QWORD *)(v21 + 32) = v22;

  if ((objc_msgSend(*(id *)(v21 + 32), "conformsToProtocol:", &unk_1EE046BA8) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [_shifter conformsToProtocol:@protocol(_GEOLocationShifterProxyInternal)]", buf, 2u);
    }
    goto LABEL_16;
  }
  objc_storeStrong((id *)(v21 + 8), a3);
  objc_storeWeak((id *)(v21 + 16), v19);
  objc_storeStrong((id *)(v21 + 24), a7);
  if (v18)
  {
    v24 = v18;
  }
  else
  {
    _GEOGetSharedTileDB();
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v24;

  objc_storeStrong((id *)(v21 + 48), a8);
  v26 = objc_msgSend(v20, "copy");
  v27 = *(void **)(v21 + 56);
  *(_QWORD *)(v21 + 56) = v26;

  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = *(void **)(v21 + 96);
  *(_QWORD *)(v21 + 96) = v28;

  geo_dispatch_queue_create_with_qos();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = *(void **)(v21 + 64);
  *(_QWORD *)(v21 + 64) = v30;

  objc_msgSend(v16, "_originatingBundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v45;
  if (objc_msgSend(v32, "length"))
  {
    v34 = [GEOApplicationAuditToken alloc];
    objc_msgSend(v16, "_originatingBundleIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[GEOApplicationAuditToken initWithProxiedApplicationBundleId:](v34, "initWithProxiedApplicationBundleId:", v35);
    v37 = *(void **)(v21 + 72);
    *(_QWORD *)(v21 + 72) = v36;

  }
  else
  {
    +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
    v38 = objc_claimAutoreleasedReturnValue();
    v35 = *(void **)(v21 + 72);
    *(_QWORD *)(v21 + 72) = v38;
  }
  v39 = v46;

  +[GEOMapService sharedService](GEOMapService, "sharedService");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "defaultTraits");
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = *(void **)(v21 + 80);
  *(_QWORD *)(v21 + 80) = v41;

  v43 = (GEOMapDataSubscriptionShiftFunctionDownloader *)(id)v21;
LABEL_13:

  return v43;
}

- (NSProgress)progress
{
  return self->_progress;
}

+ (NSString)loggingDescription
{
  return (NSString *)CFSTR("shiftFxns");
}

- (void)_fetchShiftFunctionFor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  GEOTileDB *cache;
  double v9;
  double v10;
  double v11;
  double v12;
  OS_dispatch_queue *workQueue;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  GEOMapDataSubscriptionShiftFunctionDownloader *v18;
  id v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  cache = self->_cache;
  objc_msgSend(v6, "coordinate");
  v10 = v9;
  v12 = v11;
  workQueue = self->_workQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke;
  v16[3] = &unk_1E1C09B48;
  objc_copyWeak(&v20, &location);
  v14 = v7;
  v19 = v14;
  v15 = v6;
  v17 = v15;
  v18 = self;
  -[GEOTileDB findShiftResponseForCoordinate:withinRadius:queue:completion:](cache, "findShiftResponseForCoordinate:withinRadius:queue:completion:", workQueue, v16, v10, v12, 0.1);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v7
      && (v10 = objc_msgSend(v7, "version"),
          v10 == objc_msgSend(*((id *)WeakRetained + 4), "locationShiftFunctionVersion")))
    {
      objc_msgSend(*((id *)WeakRetained + 5), "linkShiftResponse:toSubscription:", a3, *((_QWORD *)WeakRetained + 1));
      v11 = *((_QWORD *)WeakRetained + 8);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_2;
      block[3] = &unk_1E1C01358;
      v23 = *(id *)(a1 + 48);
      v21 = v7;
      v22 = v8;
      dispatch_async(v11, block);

      v12 = v23;
    }
    else
    {
      v13 = (void *)*((_QWORD *)WeakRetained + 4);
      v15 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(v14 + 72);
      v16 = *(_QWORD *)(v14 + 80);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_3;
      v18[3] = &unk_1E1C09B20;
      v18[4] = WeakRetained;
      v19 = *(id *)(a1 + 48);
      objc_msgSend(v13, "_doNetworkRequestForLatLng:reduceRadius:traits:auditToken:shouldCache:completionHandler:", v15, v16, v17, 0, v18, 0.0);
      v12 = v19;
    }

  }
}

uint64_t __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "storeShiftResponse:forSubscription:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_4;
  block[3] = &unk_1E1C01358;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)pause
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__GEOMapDataSubscriptionShiftFunctionDownloader_pause__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __54__GEOMapDataSubscriptionShiftFunctionDownloader_pause__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 88) = 0;
  return result;
}

- (void)cancel
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GEOMapDataSubscriptionShiftFunctionDownloader_cancel__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __55__GEOMapDataSubscriptionShiftFunctionDownloader_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_finishWithError:", v2);

}

- (void)resume
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__GEOMapDataSubscriptionShiftFunctionDownloader_resume__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __55__GEOMapDataSubscriptionShiftFunctionDownloader_resume__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__GEOMapDataSubscriptionShiftFunctionDownloader_resume__block_invoke_2;
  v3[3] = &unk_1E1BFF6F8;
  v3[4] = v1;
  return objc_msgSend(v1, "_prepare:", v3);
}

uint64_t __55__GEOMapDataSubscriptionShiftFunctionDownloader_resume__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_downloadNextShiftFunction");
}

- (void)_finishWithError:(id)a3
{
  id v4;
  NSMutableArray *needCoordinates;
  NSObject *delegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_isRunning = 0;
  needCoordinates = self->_needCoordinates;
  self->_needCoordinates = 0;

  -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](self->_progress, "totalUnitCount"));
  delegateQueue = self->_delegateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__GEOMapDataSubscriptionShiftFunctionDownloader__finishWithError___block_invoke;
  v8[3] = &unk_1E1C00738;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(delegateQueue, v8);

}

void __66__GEOMapDataSubscriptionShiftFunctionDownloader__finishWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "downloader:didFinishWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_prepare:(id)a3
{
  void (**v4)(_QWORD);
  _GEOLocationShifterProxyInternal *shifter;
  void *v6;
  GEOLatLng *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  GEOLatLng *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD);
  id v16;
  id location;

  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (-[NSMutableArray count](self->_needCoordinates, "count"))
  {
    v4[2](v4);
  }
  else
  {
    shifter = self->_shifter;
    -[GEOMapDataSubscription region](self->_subscription, "region");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(shifter) = -[_GEOLocationShifterProxyInternal isLocationShiftRequiredForRegion:](shifter, "isLocationShiftRequiredForRegion:", v6);

    if ((shifter & 1) != 0)
    {
      objc_initWeak(&location, self);
      v7 = [GEOLatLng alloc];
      -[GEOMapDataSubscription region](self->_subscription, "region");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centerLat");
      v10 = v9;
      -[GEOMapDataSubscription region](self->_subscription, "region");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "centerLng");
      v13 = -[GEOLatLng initWithLatitude:longitude:](v7, "initWithLatitude:longitude:", v10, v12);

      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __58__GEOMapDataSubscriptionShiftFunctionDownloader__prepare___block_invoke;
      v14[3] = &unk_1E1C09B70;
      v14[4] = self;
      objc_copyWeak(&v16, &location);
      v15 = v4;
      -[GEOMapDataSubscriptionShiftFunctionDownloader _fetchShiftFunctionFor:completion:](self, "_fetchShiftFunctionFor:completion:", v13, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      -[GEOMapDataSubscriptionShiftFunctionDownloader _finishWithError:](self, "_finishWithError:", 0);
    }
  }

}

void __58__GEOMapDataSubscriptionShiftFunctionDownloader__prepare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id WeakRetained;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 64));
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__GEOMapDataSubscriptionShiftFunctionDownloader__prepare___block_invoke_2;
    block[3] = &unk_1E1BFFC90;
    block[4] = v7;
    v11 = v5;
    v12 = *(id *)(a1 + 40);
    dispatch_async(v8, block);

  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Could not fetch center"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_finishWithError:", v6);

  }
}

uint64_t __58__GEOMapDataSubscriptionShiftFunctionDownloader__prepare___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  GEOLatLng *v31;
  uint64_t v32;
  void *v33;
  double v35;
  double v36;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "region");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "radius");
  v4 = v3;
  v5 = v2;
  v6 = sqrt((v4 + v4) * (v4 + v4) * 0.5);
  v7 = v6 * 0.5;
  objc_msgSend(v5, "spanLng");
  v9 = v8;
  objc_msgSend(v5, "spanLat");
  v11 = v6 * ceil(v10 / v6) * 0.5;
  objc_msgSend(v5, "centerLng");
  v13 = v12;
  objc_msgSend(v5, "centerLng");
  v15 = v14;
  objc_msgSend(v5, "centerLat");
  v17 = -90.0;
  if (v6 * 0.5 + v16 - v11 > -90.0)
  {
    objc_msgSend(v5, "centerLat");
    v17 = v7 + v18 - v11;
  }
  objc_msgSend(v5, "centerLat");
  v20 = v11 + v19 - v7 < 90.0;
  v21 = 90.0;
  if (v20)
  {
    objc_msgSend(v5, "centerLat", 90.0);
    v21 = v11 + v22 - v7;
  }
  v23 = v21;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 - v23 < 0.00000000999999994)
  {
    v25 = v6 * ceil(v9 / v6) * 0.5;
    v26 = v7 + v13 - v25;
    v27 = v15 + v25 - v7;
    v35 = v26;
    v36 = v26 - v27;
    while (v36 >= 0.00000000999999994)
    {
LABEL_16:
      v17 = v6 + v17;
      if (v17 - v23 >= 0.00000000999999994)
        goto LABEL_17;
    }
    v28 = v35;
    while (v28 >= -180.0)
    {
      v30 = v28;
      if (v28 > 180.0)
      {
        v29 = -360.0;
        goto LABEL_14;
      }
LABEL_15:
      v31 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v17, v30);
      objc_msgSend(v24, "addObject:", v31);

      v28 = v6 + v28;
      if (v28 - v27 >= 0.00000000999999994)
        goto LABEL_16;
    }
    v29 = 360.0;
LABEL_14:
    v30 = v28 + v29;
    goto LABEL_15;
  }
LABEL_17:

  v32 = *(_QWORD *)(a1 + 32);
  v33 = *(void **)(v32 + 104);
  *(_QWORD *)(v32 + 104) = v24;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setTotalUnitCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "count") + 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setCompletedUnitCount:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_downloadNextShiftFunction
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_isRunning)
  {
    -[NSMutableArray lastObject](self->_needCoordinates, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_needCoordinates, "removeLastObject");
    if (v3)
    {
      objc_initWeak(&location, self);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __75__GEOMapDataSubscriptionShiftFunctionDownloader__downloadNextShiftFunction__block_invoke;
      v4[3] = &unk_1E1C09B98;
      v4[4] = self;
      objc_copyWeak(&v5, &location);
      -[GEOMapDataSubscriptionShiftFunctionDownloader _fetchShiftFunctionFor:completion:](self, "_fetchShiftFunctionFor:completion:", v3, v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
    else
    {
      -[GEOMapDataSubscriptionShiftFunctionDownloader _finishWithError:](self, "_finishWithError:", 0);
    }

  }
}

void __75__GEOMapDataSubscriptionShiftFunctionDownloader__downloadNextShiftFunction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 64));
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 88))
  {
    objc_msgSend(*(id *)(v5 + 96), "setCompletedUnitCount:", objc_msgSend(*(id *)(v5 + 96), "completedUnitCount") + 1);
    if (a2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "_downloadNextShiftFunction");
    }
    else
    {
      v7 = (uint64_t)v8;
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -13, CFSTR("Could not fetch function"));
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v8 = (id)v7;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "_finishWithError:", v8);
    }

  }
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (GEOMapDataSubscriptionDataDownloaderDelegate)delegate
{
  return (GEOMapDataSubscriptionDataDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needCoordinates, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_shifter, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
