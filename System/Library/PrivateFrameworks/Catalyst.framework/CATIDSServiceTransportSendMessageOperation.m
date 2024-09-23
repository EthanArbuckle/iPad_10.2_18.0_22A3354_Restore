@implementation CATIDSServiceTransportSendMessageOperation

void __53___CATIDSServiceTransportSendMessageOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo(404, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endOperationWithError:", v3);

  }
}

uint64_t __51___CATIDSServiceTransportSendMessageOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendData");
}

void __55___CATIDSServiceTransportSendMessageOperation_sendData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55___CATIDSServiceTransportSendMessageOperation_sendData__block_invoke_2;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_4;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __55___CATIDSServiceTransportSendMessageOperation_sendData__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didSendDataWithError:", *(_QWORD *)(a1 + 32));

}

@end
