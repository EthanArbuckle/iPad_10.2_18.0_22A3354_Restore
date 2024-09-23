@implementation CTXPCRefreshCarrierTokenRequest

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
  v10[2] = __79__CTXPCRefreshCarrierTokenRequest_performRequestWithHandler_completionHandler___block_invoke;
  v10[3] = &unk_1E152DA48;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "refreshUserAuthToken:completion:", v8, v10);

}

uint64_t __79__CTXPCRefreshCarrierTokenRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 16;
}

@end
