@implementation BTLEScanner

- (void)didUpdateBTLEState:(int64_t)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  if (self)
    workQueue = self->_workQueue;
  else
    workQueue = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__BTLEScanner_didUpdateBTLEState___block_invoke;
  v4[3] = &unk_1E89C0B98;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (BTLEScanner)init
{
  BTLEScanner *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  uint64_t v8;
  HAPBTLECentralManager *centralManager;
  HMDAccessoryQueues *v10;
  HMDAccessoryQueues *scanQueue;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BTLEScanner;
  v2 = -[BTLEScanner init](&v13, sel_init);
  if (v2)
  {
    HMDispatchQueueNameString();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0D16408], "getInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    centralManager = v2->_centralManager;
    v2->_centralManager = (HAPBTLECentralManager *)v8;

    v10 = objc_alloc_init(HMDAccessoryQueues);
    scanQueue = v2->_scanQueue;
    v2->_scanQueue = v10;

    -[HMDAccessoryQueues createQueue:](v2->_scanQueue, "createQueue:", CFSTR("ScanQueue"));
    -[HAPBTLECentralManager registerCentralManagerDelegate:](v2->_centralManager, "registerCentralManagerDelegate:", v2);
  }
  return v2;
}

- (void)_flushQueue
{
  void *v3;
  HMDAccessoryQueues *i;
  void *v5;

  v3 = 0;
  if (!self)
    goto LABEL_5;
LABEL_2:
  for (i = self->_scanQueue; ; i = 0)
  {
    -[HMDAccessoryQueues popAccessoryFromQueue:](i, "popAccessoryFromQueue:", CFSTR("ScanQueue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      break;
    objc_msgSend(v5, "scanningCompleteWithAccessoryFound:suspended:", 0, 0);
    v3 = v5;
    if (self)
      goto LABEL_2;
LABEL_5:
    ;
  }
}

- (void)_stopTimer
{
  if (self)
  {
    -[HMFTimer suspend](self->_scanTimer, "suspend");
    objc_storeStrong((id *)&self->_scanTimer, 0);
  }
  else
  {
    objc_msgSend(0, "suspend");
  }
}

- (void)_checkCanScan
{
  BTLEScanner *v2;
  HMDAccessoryQueues *scanQueue;
  HMDAccessoryQueues *v4;
  uint64_t v5;
  id v6;
  void *v7;
  HMFTimer *scanTimer;
  HMFTimer *v9;
  OS_dispatch_queue *v10;
  HMFTimer *v11;
  HMFTimer *v12;
  HMFTimer *v13;
  HMFTimer *v14;
  id v15;
  void *v16;
  CUBLEScanner *cubleScanner;
  CUBLEScanner *v18;
  CUBLEScanner *v19;
  CUBLEScanner *v20;
  CUBLEScanner *v21;
  CUBLEScanner *v22;
  CUBLEScanner *v23;
  CUBLEScanner *v24;
  CUBLEScanner *v25;
  CUBLEScanner *v26;
  _QWORD v27[4];
  id v28;
  id location;
  _QWORD v30[5];
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;

  v2 = self;
  if (self)
    self = (BTLEScanner *)self->_scanQueue;
  if (-[BTLEScanner countForQueue:](self, "countForQueue:", CFSTR("ScanQueue")))
  {
    v31 = 0;
    v32 = (double *)&v31;
    v33 = 0x2020000000;
    v34 = 0;
    if (v2)
      scanQueue = v2->_scanQueue;
    else
      scanQueue = 0;
    v4 = scanQueue;
    v5 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __28__BTLEScanner__checkCanScan__block_invoke;
    v30[3] = &unk_1E89AAF50;
    v30[4] = &v31;
    -[HMDAccessoryQueues enumerateQueue:enumerateAccessory:](v4, "enumerateQueue:enumerateAccessory:", CFSTR("ScanQueue"), v30);

    v6 = objc_alloc(MEMORY[0x1E0D286C8]);
    v7 = (void *)objc_msgSend(v6, "initWithTimeInterval:options:", 1, v32[3]);
    -[BTLEScanner setScanTimer:]((uint64_t)v2, v7);

    if (v2)
      scanTimer = v2->_scanTimer;
    else
      scanTimer = 0;
    v9 = scanTimer;
    -[HMFTimer setDelegate:](v9, "setDelegate:", v2);

    if (v2)
    {
      v10 = v2->_workQueue;
      v11 = v2->_scanTimer;
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    v12 = v11;
    -[HMFTimer setDelegateQueue:](v12, "setDelegateQueue:", v10);

    if (v2)
      v13 = v2->_scanTimer;
    else
      v13 = 0;
    v14 = v13;
    -[HMFTimer resume](v14, "resume");

    objc_initWeak(&location, v2);
    v15 = objc_alloc_init(MEMORY[0x1E0D1B330]);
    v16 = v15;
    if (v2)
    {
      objc_storeStrong((id *)&v2->_cubleScanner, v15);

      cubleScanner = v2->_cubleScanner;
    }
    else
    {

      cubleScanner = 0;
    }
    v18 = cubleScanner;
    -[CUBLEScanner setScanFlags:](v18, "setScanFlags:", 64);

    if (IsAppleTV())
    {
      if (v2)
        v19 = v2->_cubleScanner;
      else
        v19 = 0;
      v20 = v19;
      -[CUBLEScanner setScanFlags:](v20, "setScanFlags:", -[CUBLEScanner scanFlags](v20, "scanFlags") | 1);

    }
    if (v2)
      v21 = v2->_cubleScanner;
    else
      v21 = 0;
    v22 = v21;
    -[CUBLEScanner setChangeFlags:](v22, "setChangeFlags:", 0);

    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __28__BTLEScanner__checkCanScan__block_invoke_2;
    v27[3] = &unk_1E89AAFA0;
    objc_copyWeak(&v28, &location);
    if (v2)
      v23 = v2->_cubleScanner;
    else
      v23 = 0;
    v24 = v23;
    -[CUBLEScanner setDeviceFoundHandler:](v24, "setDeviceFoundHandler:", v27);

    if (v2)
      v25 = v2->_cubleScanner;
    else
      v25 = 0;
    v26 = v25;
    -[CUBLEScanner activate](v26, "activate");

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    -[BTLEScanner _stopScan](v2, "_stopScan");
  }
}

- (void)_stopScan
{
  CUBLEScanner *cubleScanner;

  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    -[BTLEScanner _stopTimer](self, "_stopTimer");
    cubleScanner = self->_cubleScanner;
    if (cubleScanner)
    {
      -[CUBLEScanner invalidate](cubleScanner, "invalidate");
      objc_storeStrong((id *)&self->_cubleScanner, 0);
    }
  }
  else
  {
    dispatch_assert_queue_V2(0);
    objc_msgSend(0, "_stopTimer");
  }
}

- (void)timerDidFire:(id)a3
{
  HMFTimer *scanTimer;
  HMFTimer *v5;
  HMFTimer *v6;

  v6 = (HMFTimer *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    scanTimer = self->_scanTimer;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    scanTimer = 0;
  }
  v5 = v6;
  if (scanTimer == v6)
  {
    -[BTLEScanner _stopScan](self, "_stopScan");
    -[BTLEScanner _flushQueue](self, "_flushQueue");
    v5 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanQueue, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_cubleScanner, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __28__BTLEScanner__checkCanScan__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a3)
    v3 = *(_QWORD *)(a3 + 8);
  else
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return 1;
}

- (void)setScanTimer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

void __28__BTLEScanner__checkCanScan__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    v6 = WeakRetained[1];
  else
    v6 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__BTLEScanner__checkCanScan__block_invoke_3;
  v8[3] = &unk_1E89C2328;
  v8[4] = WeakRetained;
  v9 = v3;
  v7 = v3;
  dispatch_async(v6, v8);

}

void __28__BTLEScanner__checkCanScan__block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, void *, void *);
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__47972;
  v24 = __Block_byref_object_dispose__47973;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[5];
  v3 = v2;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __28__BTLEScanner__checkCanScan__block_invoke_10;
  v11 = &unk_1E89AAF78;
  v4 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v4;
  v14 = &v16;
  v15 = &v20;
  objc_msgSend(v3, "enumerateQueue:enumerateAccessory:", CFSTR("ScanQueue"), &v8);

  v5 = v21;
  if (v21[5])
  {
    v6 = *(_QWORD **)(a1 + 32);
    if (v6)
      v6 = (_QWORD *)v6[5];
    v7 = v6;
    objc_msgSend(v7, "removeAccessory:", v5[5], v8, v9, v10, v11, v12);

    objc_msgSend((id)v21[5], "scanningCompleteWithAccessoryFound:suspended:", 1, *((unsigned __int8 *)v17 + 24));
    objc_msgSend(*(id *)(a1 + 32), "_checkCanScan");
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

}

uint64_t __28__BTLEScanner__checkCanScan__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t IsReversed;
  id v21;
  uint64_t v22;
  id v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v4 = a2;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v25 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectivityInfo");
    v24 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "woBLEInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lgBTAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v11;
    v28 = 2112;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Scan result -- looking for %@ found %@", buf, 0x20u);

    v7 = v24;
    v4 = v25;
  }

  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "connectivityInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "woBLEInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lgBTAddress");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  IsReversed = HMFDataIsReversed();

  if ((_DWORD)IsReversed)
  {
    objc_msgSend(*(id *)(a1 + 40), "manufacturerData");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = objc_msgSend(v21, "bytes");

    if (*(_BYTE *)(v22 + 5) == 18)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);
  }

  return IsReversed;
}

uint64_t __34__BTLEScanner_didUpdateBTLEState___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 40) != 5)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "_stopScan");
    return objc_msgSend(*(id *)(v1 + 32), "_flushQueue");
  }
  return result;
}

+ (id)sharedBTLEScanner
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__BTLEScanner_sharedBTLEScanner__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedBTLEScanner_onceToken != -1)
    dispatch_once(&sharedBTLEScanner_onceToken, block);
  return (id)sharedBTLEScanner_sharedScanner;
}

void __32__BTLEScanner_sharedBTLEScanner__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedBTLEScanner_sharedScanner;
  sharedBTLEScanner_sharedScanner = (uint64_t)v1;

}

@end
