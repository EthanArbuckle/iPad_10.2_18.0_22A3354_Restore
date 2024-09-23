@implementation APUIRegisterCardServicesIfNeeded

void __APUIRegisterCardServicesIfNeeded_block_invoke()
{
  void *v0;
  void *v1;
  objc_class *v2;
  id v3;
  void *v4;
  APUICardService *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v0 = (void *)MEMORY[0x24BE15478];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v1 = (void *)getACSCardServiceClass_softClass;
  v10 = getACSCardServiceClass_softClass;
  if (!getACSCardServiceClass_softClass)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getACSCardServiceClass_block_invoke;
    v6[3] = &unk_24EDBF630;
    v6[4] = &v7;
    __getACSCardServiceClass_block_invoke((uint64_t)v6);
    v1 = (void *)v8[3];
  }
  v2 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v7, 8);
  v3 = objc_alloc_init(v2);
  objc_msgSend(v0, "registerService:", v3);

  v4 = (void *)MEMORY[0x24BE15478];
  v5 = objc_alloc_init(APUICardService);
  objc_msgSend(v4, "registerService:", v5);

}

@end
