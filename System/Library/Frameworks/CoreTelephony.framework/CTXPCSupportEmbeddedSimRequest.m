@implementation CTXPCSupportEmbeddedSimRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__CTXPCSupportEmbeddedSimRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E152FB00;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "supportsEmbeddedSIMWithCompletion:", v7);

}

void __78__CTXPCSupportEmbeddedSimRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  CTXPCSimCommonNumberResultResponse *v4;
  void *v5;
  CTXPCSimCommonNumberResultResponse *v6;

  v4 = [CTXPCSimCommonNumberResultResponse alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CTXPCSimCommonNumberResultResponse initWithResult:](v4, "initWithResult:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)requiredEntitlement
{
  return 26;
}

@end
