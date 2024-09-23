@implementation UARPAccessory(HomeKit)

- (id)availableSoftwareVersion
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "availableFirmwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2
    && (v3 = (void *)MEMORY[0x1E0D286A0],
        objc_msgSend(a1, "availableFirmwareVersion"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v3) = objc_msgSend(v3, "isValidVersionString:", v4),
        v4,
        (_DWORD)v3))
  {
    v5 = objc_alloc(MEMORY[0x1E0D286A0]);
    objc_msgSend(a1, "availableFirmwareVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithVersionString:", v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
