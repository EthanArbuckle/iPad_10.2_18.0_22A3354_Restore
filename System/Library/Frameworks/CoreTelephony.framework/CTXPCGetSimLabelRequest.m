@implementation CTXPCGetSimLabelRequest

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
  -[CTXPCSubscriptionContextRequest context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__CTXPCGetSimLabelRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E1534C68;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "getSimLabel:completion:", v8, v10);

}

void __71__CTXPCGetSimLabelRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetSimLabelResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    v6 = -[CTXPCGetSimLabelResponse initWithLabel:]([CTXPCGetSimLabelResponse alloc], "initWithLabel:", v7);
  else
    v6 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int)requiredEntitlement
{
  return 3;
}

@end
