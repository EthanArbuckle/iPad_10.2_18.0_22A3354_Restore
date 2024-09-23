@implementation CHProcessHandle

- (BOOL)hasDataStoreReadWriteEntitlement
{
  return -[CHProcessHandle hasEntitlement:](self, "hasEntitlement:", 0x1E67481B0);
}

+ (id)processHandle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__CHProcessHandle_processHandle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (processHandle_onceToken != -1)
    dispatch_once(&processHandle_onceToken, block);
  return (id)processHandle_sProcessHandle;
}

void __32__CHProcessHandle_processHandle__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)processHandle_sProcessHandle;
  processHandle_sProcessHandle = (uint64_t)v1;

}

- (BOOL)hasDataStoreReadOnlyEntitlement
{
  return -[CHProcessHandle hasEntitlement:](self, "hasEntitlement:", 0x1E6748190);
}

- (BOOL)hasDataVaultEntitlement
{
  return -[CHProcessHandle hasEntitlement:](self, "hasEntitlement:", 0x1E67481D0);
}

- (BOOL)hasAppProtectionReadEntitlement
{
  return -[CHProcessHandle hasEntitlement:](self, "hasEntitlement:", 0x1E67481F0);
}

@end
