@implementation CTXPCGetTransferPlansRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__CTXPCGetTransferPlansRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E152FBA0;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "getTransferPlansWithCompletion:", v7);

}

void __76__CTXPCGetTransferPlansRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCGetTransferPlansResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = -[CTXPCGetTransferPlansResponse initWithRemtoeDevices:]([CTXPCGetTransferPlansResponse alloc], "initWithRemtoeDevices:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int)requiredEntitlement
{
  return 3;
}

@end
