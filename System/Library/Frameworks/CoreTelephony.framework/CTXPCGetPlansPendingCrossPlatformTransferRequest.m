@implementation CTXPCGetPlansPendingCrossPlatformTransferRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __96__CTXPCGetPlansPendingCrossPlatformTransferRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E152FC40;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "plansPendingCrossPlatformTransferWithCompletion:", v7);

}

void __96__CTXPCGetPlansPendingCrossPlatformTransferRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  CTXPCGetPlansPendingCrossPlatformTransferResponse *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = -[CTXPCGetPlansPendingCrossPlatformTransferResponse initWithList:]([CTXPCGetPlansPendingCrossPlatformTransferResponse alloc], "initWithList:", v8);
  (*(void (**)(uint64_t, CTXPCGetPlansPendingCrossPlatformTransferResponse *, id))(v6 + 16))(v6, v7, v5);

}

- (int)requiredEntitlement
{
  return 25;
}

@end
