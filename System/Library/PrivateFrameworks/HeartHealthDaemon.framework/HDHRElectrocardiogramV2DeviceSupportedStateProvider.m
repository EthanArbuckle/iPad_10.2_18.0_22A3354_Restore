@implementation HDHRElectrocardiogramV2DeviceSupportedStateProvider

- (BOOL)isDeviceSupported:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAppleWatch");

    if ((v5 & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0D516D8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("68AB2987-CE75-463C-9EAF-9861B292F01E"));
      v10 = objc_msgSend(v3, "supportsCapability:", v9);

      v6 = v10 & ~v8;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
