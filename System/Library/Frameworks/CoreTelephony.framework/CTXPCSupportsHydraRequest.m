@implementation CTXPCSupportsHydraRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__CTXPCSupportsHydraRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E152FB00;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "supportsHydraWithCompletion:", v7);

}

void __73__CTXPCSupportsHydraRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  CTXPCBooleanResponseMessage *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = -[CTXPCBooleanResponseMessage initWithResult:]([CTXPCBooleanResponseMessage alloc], "initWithResult:", a2);
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (int)requiredEntitlement
{
  return 25;
}

@end
