@implementation CTXPCMobileEquipmentInfoRequest

- (void)performRequestWithHandler:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__CTXPCMobileEquipmentInfoRequest_performRequestWithHandler_completionHandler___block_invoke;
  v7[3] = &unk_1E1534C18;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "copyMobileEquipmentInfo:", v7);

}

void __79__CTXPCMobileEquipmentInfoRequest_performRequestWithHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CTXPCMobileEquipmentInfoResponse *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
    v6 = -[CTXPCMobileEquipmentInfoResponse initWithEquipmentInfoList:]([CTXPCMobileEquipmentInfoResponse alloc], "initWithEquipmentInfoList:", v7);
  else
    v6 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int)requiredEntitlement
{
  return 5;
}

@end
