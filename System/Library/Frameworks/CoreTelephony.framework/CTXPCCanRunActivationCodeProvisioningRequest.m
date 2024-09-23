@implementation CTXPCCanRunActivationCodeProvisioningRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92__CTXPCCanRunActivationCodeProvisioningRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E152FB78;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "canRunActivationCodeProvisioningWithCompletion:", v7);

}

void __92__CTXPCCanRunActivationCodeProvisioningRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  CTXPCCanRunActivationCodeProvisioningResponse *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  v9 = -[CTXPCCanRunActivationCodeProvisioningResponse initWithTitle:message:]([CTXPCCanRunActivationCodeProvisioningResponse alloc], "initWithTitle:message:", v10, v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int)requiredEntitlement
{
  return 32;
}

@end
