@implementation CTXPCGet2GUserPreferenceRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__CTXPCGet2GUserPreferenceRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E152FCB8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "get2GUserPreference:", v7);

}

void __79__CTXPCGet2GUserPreferenceRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CTXPCGet2GUserPreferenceResponse *v5;
  id v6;

  v6 = a3;
  if (v6)
    v5 = 0;
  else
    v5 = -[CTXPCGet2GUserPreferenceResponse initWithIsEnabled:]([CTXPCGet2GUserPreferenceResponse alloc], "initWithIsEnabled:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int)requiredEntitlement
{
  return 3;
}

@end
