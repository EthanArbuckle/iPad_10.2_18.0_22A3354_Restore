@implementation BPSStockholmSupportedInGizmoRegion

void __BPSStockholmSupportedInGizmoRegion_block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  NPSQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __BPSStockholmSupportedInGizmoRegion_block_invoke_4;
  v5[3] = &unk_24CBE5388;
  v7 = a2;
  v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);

}

void __BPSStockholmSupportedInGizmoRegion_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  char v6;
  _QWORD v7[4];
  id v8;
  char v9;
  char v10;

  v2 = objc_alloc(MEMORY[0x24BE6B2C0]);
  getNPKDefaultsDomain();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDomain:", v3);

  v10 = 0;
  v5 = objc_msgSend(v4, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("passbookRegistrationSupportedInRegion"), &v10);
  if (v10)
    v6 = v5;
  else
    v6 = 1;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __BPSStockholmSupportedInGizmoRegion_block_invoke_2;
  v7[3] = &unk_24CBE5388;
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __BPSStockholmSupportedInGizmoRegion_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void __BPSStockholmSupportedInGizmoRegion_block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v2 = objc_alloc(MEMORY[0x24BE6B2C0]);
  getNPKDefaultsDomain();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDomain:", v3);

  objc_msgSend(v4, "setBool:forKey:", *(unsigned __int8 *)(a1 + 40), CFSTR("passbookRegistrationSupportedInRegion"));
  v5 = (id)objc_msgSend(v4, "synchronize");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __BPSStockholmSupportedInGizmoRegion_block_invoke_5;
  v6[3] = &unk_24CBE5388;
  v7 = *(id *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __BPSStockholmSupportedInGizmoRegion_block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

@end
