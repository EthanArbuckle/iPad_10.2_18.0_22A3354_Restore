@implementation CTXPCGetRatSelectionRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[CTXPCSubscriptionContextRequest descriptor](self, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__CTXPCGetRatSelectionRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E1532670;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "getRatSelectionMask:completion:", v8, v10);

}

void __75__CTXPCGetRatSelectionRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetRatSelectionResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = 0;
  if (v7 && !v5)
    v6 = -[CTXPCGetRatSelectionResponse initWithRATSelection:]([CTXPCGetRatSelectionResponse alloc], "initWithRATSelection:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
