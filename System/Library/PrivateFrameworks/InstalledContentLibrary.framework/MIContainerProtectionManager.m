@implementation MIContainerProtectionManager

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MIContainerProtectionManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, block);
  return (id)defaultManager_defaultManager;
}

void __46__MIContainerProtectionManager_defaultManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;

}

- (void)setDataProtectionOnDataContainer:(id)a3 forNewBundle:(id)a4 retryIfLocked:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "dataProtectionClass");
  objc_msgSend(v7, "bundleType");
  objc_msgSend(v6, "containerClass");
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  objc_msgSend(v9, "UTF8String");
  v11 = v6;
  v10 = v6;
  container_set_data_protection_for_current_user();

}

uint64_t __92__MIContainerProtectionManager_setDataProtectionOnDataContainer_forNewBundle_retryIfLocked___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    result = gLogHandle;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      return MOLogWrite();
  }
  return result;
}

@end
