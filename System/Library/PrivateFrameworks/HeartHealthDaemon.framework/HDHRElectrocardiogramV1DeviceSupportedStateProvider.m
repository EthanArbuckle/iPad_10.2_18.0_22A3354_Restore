@implementation HDHRElectrocardiogramV1DeviceSupportedStateProvider

- (BOOL)isDeviceSupported:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;

  v3 = a3;
  if (!v3)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleWatch");

  if (!v5)
  {
    objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0D516D8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("68AB2987-CE75-463C-9EAF-9861B292F01E"));
    v12 = objc_msgSend(v3, "supportsCapability:", v11);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("16625FBA-E847-4494-8191-433915DC9F15"));
    v14 = objc_msgSend(v3, "supportsCapability:", v13);

    if ((v10 & 1) == 0)
    {
      v8 = v12 & (v14 ^ 1);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("16625FBA-E847-4494-8191-433915DC9F15"));
  v7 = objc_msgSend(v3, "supportsCapability:", v6);

  v8 = v7 ^ 1;
LABEL_7:

  return v8;
}

@end
