@implementation APUIRegisterCardKitProvidersIfNeeded

void __APUIRegisterCardKitProvidersIfNeeded_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v0 = (void *)MEMORY[0x24BE15448];
  v1 = objc_alloc_init(MEMORY[0x24BE852A0]);
  objc_msgSend(v0, "registerProvider:", v1);

  v2 = (void *)MEMORY[0x24BE15448];
  v3 = objc_alloc_init(MEMORY[0x24BE5B930]);
  objc_msgSend(v2, "registerProvider:", v3);

  v4 = (void *)MEMORY[0x24BE15448];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v5 = (void *)getVSUICKPEntryPointClass_softClass;
  v12 = getVSUICKPEntryPointClass_softClass;
  if (!getVSUICKPEntryPointClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getVSUICKPEntryPointClass_block_invoke;
    v8[3] = &unk_24EDBF630;
    v8[4] = &v9;
    __getVSUICKPEntryPointClass_block_invoke((uint64_t)v8);
    v5 = (void *)v10[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v9, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v4, "registerProvider:", v7);

}

@end
