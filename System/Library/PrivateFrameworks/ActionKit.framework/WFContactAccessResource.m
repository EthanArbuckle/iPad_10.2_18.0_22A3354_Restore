@implementation WFContactAccessResource

+ (BOOL)isSystemResource
{
  return 1;
}

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.MobileAddressBook");
}

- (unint64_t)status
{
  return 4;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v8 = (void *)getCNContactStoreClass_softClass;
  v19 = getCNContactStoreClass_softClass;
  v9 = MEMORY[0x24BDAC760];
  if (!getCNContactStoreClass_softClass)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __getCNContactStoreClass_block_invoke;
    v15[3] = &unk_24F8BB430;
    v15[4] = &v16;
    __getCNContactStoreClass_block_invoke((uint64_t)v15);
    v8 = (void *)v17[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v16, 8);
  v11 = (void *)objc_opt_new();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __76__WFContactAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v13[3] = &unk_24F8B8FC0;
  v13[4] = self;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "requestAccessForEntityType:completionHandler:", 0, v13);

}

void __76__WFContactAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__WFContactAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
  v8[3] = &unk_24F8B3990;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __76__WFContactAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithForcedNotification");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
