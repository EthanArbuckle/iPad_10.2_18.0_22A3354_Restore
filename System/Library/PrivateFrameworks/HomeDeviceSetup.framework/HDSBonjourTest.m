@implementation HDSBonjourTest

- (HDSBonjourTest)init
{
  HDSBonjourTest *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDSBonjourTest;
  v2 = -[HDSBonjourTest init](&v6, sel_init);
  if (v2)
  {
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__HDSBonjourTest_activate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __26__HDSBonjourTest_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  dispatch_source_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD handler[5];
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = a1 + 32;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44) = 1;
  *(_QWORD *)(*(_QWORD *)v2 + 24) = mach_absolute_time();
  RandomBytes();
  NSStringWithMACAddress();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  *(_QWORD *)(*(_QWORD *)v2 + 16) = v3;

  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    LogPrintF();
  }
  v5 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate", v19);
  v6 = objc_opt_new();
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)v5 + 8) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)v5 + 8), "setDispatchQueue:", *(_QWORD *)(*(_QWORD *)v5 + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setServiceType:", CFSTR("_bonjourtest._tcp"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setChangeFlags:", 0xFFFFFFFFLL);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDomain:", CFSTR("local."));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setLabel:", CFSTR("HDSBonjour"));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __26__HDSBonjourTest_activate__block_invoke_2;
  v24[3] = &unk_24FCD4778;
  objc_copyWeak(&v25, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDeviceFoundHandler:", v24);
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __26__HDSBonjourTest_activate__block_invoke_3;
  v22[3] = &unk_24FCD47A0;
  objc_copyWeak(&v23, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDeviceChangedHandler:", v22);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "activate");
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v27 = CFSTR("bjtID");
  v28[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 48);
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __26__HDSBonjourTest_activate__block_invoke_4;
  v21[3] = &unk_24FCD4618;
  v21[4] = v11;
  objc_msgSend(v12, "sendRequestID:options:request:responseHandler:", CFSTR("_bjtS"), 0, v10, v21);
  v13 = *(_QWORD *)(a1 + 32);
  if (*(double *)(v13 + 80) > 0.0)
  {
    v14 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(v13 + 56));
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 32);
    *(_QWORD *)(v15 + 32) = v14;

    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(NSObject **)(v17 + 32);
    handler[0] = v8;
    handler[1] = 3221225472;
    handler[2] = __26__HDSBonjourTest_activate__block_invoke_5;
    handler[3] = &unk_24FCD3FE8;
    handler[4] = v17;
    dispatch_source_set_event_handler(v18, handler);
    HDSDispatchTimerSet(*(void **)(*(_QWORD *)(a1 + 32) + 32), *(double *)(*(_QWORD *)(a1 + 32) + 80), -1.0, 1.0);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __26__HDSBonjourTest_activate__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleFoundDevice:", v3);

}

void __26__HDSBonjourTest_activate__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleFoundDevice:", v3);

}

void __26__HDSBonjourTest_activate__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40)
    && gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

uint64_t __26__HDSBonjourTest_activate__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTimeout");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__HDSBonjourTest_invalidate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __28__HDSBonjourTest_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (void)_handleFoundDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OS_dispatch_source *timer;
  NSObject *v8;
  OS_dispatch_source *v9;
  CUBonjourBrowser *browser;
  SFSession *sfSession;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  objc_msgSend(v4, "txtDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rpBA"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", self->_testID) & 1) != 0)
  {
    if (gLogCategory_HDSBonjourTest <= 30
      && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
    {
      v12 = v4;
      LogPrintF();
    }
    self->_bonjourTestState = 4;
    timer = self->_timer;
    if (timer)
    {
      v8 = timer;
      dispatch_source_cancel(v8);
      v9 = self->_timer;
      self->_timer = 0;

    }
    -[CUBonjourBrowser invalidate](self->_browser, "invalidate", v12);
    browser = self->_browser;
    self->_browser = 0;

    sfSession = self->_sfSession;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __37__HDSBonjourTest__handleFoundDevice___block_invoke;
    v13[3] = &unk_24FCD4618;
    v13[4] = self;
    -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_bjtD"), 0, MEMORY[0x24BDBD1B8], v13);
  }
  else if (gLogCategory_HDSBonjourTest <= 30
         && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __37__HDSBonjourTest__handleFoundDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v6 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 40))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = v7;
    if (gLogCategory_HDSBonjourTest <= 30
      && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_complete", v9, v6, v12);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_complete", v8, v10, v11);
    }
  }

}

- (void)_handleTimeout
{
  double v3;

  if (!self->_invalidateCalled)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricTotalSeconds = v3;
    if (gLogCategory_HDSBonjourTest <= 90
      && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_bonjourTestState = 3;
    -[HDSBonjourTest _complete](self, "_complete");
  }
}

- (void)_complete
{
  double v3;
  void (**completionHandler)(void);
  id v5;

  if (!self->_invalidateCalled)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricTotalSeconds = v3;
    completionHandler = (void (**)(void))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2]();
      v5 = self->_completionHandler;
      self->_completionHandler = 0;

    }
  }
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
}

- (int)bonjourTestState
{
  return self->_bonjourTestState;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_testID, 0);
  objc_storeStrong((id *)&self->_browser, 0);
}

@end
