@implementation FKApplePayOrderFetchController

- (void)fetchAllRowViewModelsForTransactionWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(2, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __102__FKApplePayOrderFetchController_fetchAllRowViewModelsForTransactionWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_2504B6F48;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __102__FKApplePayOrderFetchController_fetchAllRowViewModelsForTransactionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  +[ApplePayOrderFetchController makeFetchController](_TtC12FinanceKitUI28ApplePayOrderFetchController, "makeFetchController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAllRowViewModelsForTransactionWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
