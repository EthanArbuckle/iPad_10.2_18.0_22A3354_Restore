@implementation HDSBonjourTestHandler

- (HDSBonjourTestHandler)init
{
  HDSBonjourTestHandler *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDSBonjourTestHandler;
  v2 = -[HDSBonjourTestHandler init](&v6, sel_init);
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
  block[2] = __33__HDSBonjourTestHandler_activate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__HDSBonjourTestHandler_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  v4 = *(void **)(v2 + 24);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__HDSBonjourTestHandler_activate__block_invoke_2;
  v9[3] = &unk_24FCD4690;
  v9[4] = v2;
  objc_msgSend(v4, "registerRequestID:options:handler:", CFSTR("_bjtS"), 0, v9);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __33__HDSBonjourTestHandler_activate__block_invoke_3;
  v8[3] = &unk_24FCD4690;
  v8[4] = v5;
  return objc_msgSend(v6, "registerRequestID:options:handler:", CFSTR("_bjtD"), 0, v8);
}

uint64_t __33__HDSBonjourTestHandler_activate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStart:responseHandler:");
}

uint64_t __33__HDSBonjourTestHandler_activate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStop:responseHandler:");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__HDSBonjourTestHandler_invalidate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __35__HDSBonjourTestHandler_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

- (void)_handleStart:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CUBonjourAdvertiser *v9;
  CUBonjourAdvertiser *advertiser;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bjtID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CUBonjourAdvertiser invalidate](self->_advertiser, "invalidate");
    v9 = (CUBonjourAdvertiser *)objc_opt_new();
    advertiser = self->_advertiser;
    self->_advertiser = v9;

    -[CUBonjourAdvertiser setDispatchQueue:](self->_advertiser, "setDispatchQueue:", self->_dispatchQueue);
    v13 = CFSTR("rpBA");
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUBonjourAdvertiser setTxtDictionary:](self->_advertiser, "setTxtDictionary:", v11);

    -[CUBonjourAdvertiser setServiceType:](self->_advertiser, "setServiceType:", CFSTR("_bonjourtest._tcp"));
    -[CUBonjourAdvertiser setDomain:](self->_advertiser, "setDomain:", CFSTR("local."));
    -[CUBonjourAdvertiser setLabel:](self->_advertiser, "setLabel:", CFSTR("HDSBonjour"));
    -[CUBonjourAdvertiser setName:](self->_advertiser, "setName:", v8);
    -[CUBonjourAdvertiser setPort:](self->_advertiser, "setPort:", 9);
    -[CUBonjourAdvertiser activate](self->_advertiser, "activate");
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, MEMORY[0x24BDBD1B8]);
  }
  else
  {
    NSErrorWithOSStatusF();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_HDSBonjourTest <= 90
      && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v12, 0, 0);

  }
}

- (void)_handleStop:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[HDSBonjourTestHandler invalidate](self, "invalidate");
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, MEMORY[0x24BDBD1B8]);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
}

@end
