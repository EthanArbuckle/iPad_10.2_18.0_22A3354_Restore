@implementation CTXPCEmbeddedSIMHealthRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__CTXPCEmbeddedSIMHealthRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E152FCB8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "checkEmbeddedSimHealthWithCompletion:", v7);

}

void __77__CTXPCEmbeddedSIMHealthRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CTXPCSimCommonNumberResultResponse *v5;
  void *v6;
  CTXPCSimCommonNumberResultResponse *v7;
  id v8;

  v8 = a3;
  v5 = [CTXPCSimCommonNumberResultResponse alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CTXPCSimCommonNumberResultResponse initWithResult:](v5, "initWithResult:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 3;
}

@end
