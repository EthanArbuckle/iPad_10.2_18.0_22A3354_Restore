@implementation CCTypeIdentifierRegistryBridge

void __CCTypeIdentifierRegistryBridge_block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getCCTypeIdentifierRegistryClass_softClass;
  v8 = getCCTypeIdentifierRegistryClass_softClass;
  if (!getCCTypeIdentifierRegistryClass_softClass)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getCCTypeIdentifierRegistryClass_block_invoke;
    v4[3] = &unk_2509903C8;
    v4[4] = &v5;
    __getCCTypeIdentifierRegistryClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  CCTypeIdentifierRegistryBridge_registryClass = (uint64_t)v1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<CCTypeIdentifierRegistryProtocol,CCTypeIdentifierRegistryProtocolPrivate>  _Nonnull CCTypeIdentifierRegistryBridge(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("CCTypeIdentifierRegistryBase.m"), 34, CFSTR("Must have IntelligencePlatformLibrary framework linked to obtain CCTypeIdentifierRegistry"));

  }
}

@end
