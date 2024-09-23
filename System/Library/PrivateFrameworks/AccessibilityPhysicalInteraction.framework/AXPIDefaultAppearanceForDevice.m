@implementation AXPIDefaultAppearanceForDevice

void __AXPIDefaultAppearanceForDevice_block_invoke()
{
  void *v0;
  int v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "laserEnabled");

  if (v1)
  {
    v2 = objc_opt_new();
    v3 = (void *)AXPIDefaultAppearanceForDevice_defaultAppearance;
    AXPIDefaultAppearanceForDevice_defaultAppearance = v2;

  }
  if (!AXPIDefaultAppearanceForDevice_defaultAppearance)
  {
    AXDeviceIsPad();
    v4 = objc_opt_new();
    v5 = (void *)AXPIDefaultAppearanceForDevice_defaultAppearance;
    AXPIDefaultAppearanceForDevice_defaultAppearance = v4;

  }
}

@end
