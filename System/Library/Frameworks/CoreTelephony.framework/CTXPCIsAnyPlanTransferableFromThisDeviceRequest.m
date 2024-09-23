@implementation CTXPCIsAnyPlanTransferableFromThisDeviceRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__CTXPCIsAnyPlanTransferableFromThisDeviceRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E152FCB8;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "isAnyPlanTransferableFromThisDeviceWithCompletion:", v7);

}

void __95__CTXPCIsAnyPlanTransferableFromThisDeviceRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  CTXPCBooleanResponseMessage *v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = -[CTXPCBooleanResponseMessage initWithResult:]([CTXPCBooleanResponseMessage alloc], "initWithResult:", a2);
  (*(void (**)(uint64_t, CTXPCBooleanResponseMessage *, id))(v5 + 16))(v5, v6, v7);

}

- (int)requiredEntitlement
{
  return 3;
}

@end
