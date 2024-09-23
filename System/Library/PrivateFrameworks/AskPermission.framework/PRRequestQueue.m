@implementation PRRequestQueue

+ (id)defaultRequestQueue
{
  if (defaultRequestQueue_ap_once_token___COUNTER__ != -1)
    dispatch_once(&defaultRequestQueue_ap_once_token___COUNTER__, &__block_literal_global_0);
  return (id)defaultRequestQueue_ap_once_object___COUNTER__;
}

void __37__PRRequestQueue_defaultRequestQueue__block_invoke()
{
  PRRequestQueue *v0;
  void *v1;

  v0 = objc_alloc_init(PRRequestQueue);
  v1 = (void *)defaultRequestQueue_ap_once_object___COUNTER__;
  defaultRequestQueue_ap_once_object___COUNTER__ = (uint64_t)v0;

}

- (void)_attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:(unint64_t)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __99__PRRequestQueue__attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier_completionHandler___block_invoke;
  v9[3] = &unk_24DB1B168;
  v10 = v5;
  v8 = v5;
  +[APRequestHandler localApproveRequestWithItemIdentifier:completion:](APRequestHandler, "localApproveRequestWithItemIdentifier:completion:", v7, v9);

}

uint64_t __99__PRRequestQueue__attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, a2 == 0, a2);
}

- (void)_attemptLocalApprovalForStorePurchaseRequestWithAdamID:(unint64_t)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __91__PRRequestQueue__attemptLocalApprovalForStorePurchaseRequestWithAdamID_completionHandler___block_invoke;
  v9[3] = &unk_24DB1B168;
  v10 = v5;
  v8 = v5;
  +[APRequestHandler localApproveRequestWithItemIdentifier:completion:](APRequestHandler, "localApproveRequestWithItemIdentifier:completion:", v7, v9);

}

uint64_t __91__PRRequestQueue__attemptLocalApprovalForStorePurchaseRequestWithAdamID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, a2 == 0, a2);
}

- (id)_pushToken
{
  return 0;
}

- (PRRequestDelegate)delegate
{
  return (PRRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
