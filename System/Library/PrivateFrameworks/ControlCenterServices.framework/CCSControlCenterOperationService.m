@implementation CCSControlCenterOperationService

+ (id)sharedService
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CCSControlCenterOperationService_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, block);
  return (id)sharedService_instance;
}

void __49__CCSControlCenterOperationService_sharedService__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedService_instance;
  sharedService_instance = (uint64_t)v1;

}

- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4
{
  CCSControlCenterOperationServiceDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "handleIconElementRequestWithOperationService:iconElementRequest:completionHandler:", self, v8, v7);

}

- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4
{
  CCSControlCenterOperationServiceDelegate **p_delegate;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "handleControlCenterOperationTypeWithOperationService:operationType:completionHandler:", self, a3, v7);

}

- (void)requestIconElementState:(id)a3 completionHandler:(id)a4
{
  CCSControlCenterOperationServiceDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "requestIconElementStateWithOperationService:iconElementRequest:completionHandler:", self, v8, v7);

}

- (CCSControlCenterOperationServiceDelegate)delegate
{
  return (CCSControlCenterOperationServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
