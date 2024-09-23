@implementation HMDCoreFollowUpManagerDataSource

- (id)followUpControllerForDeviceSetupManager:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D15E30]), "initWithClientIdentifier:", CFSTR("com.apple.HomeKit"));
}

- (id)followUpItemForDeviceSetupManager:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0D15E38]);
}

- (id)followUpActionForDeviceSetupManager:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0D15E28]);
}

- (id)followUpPreferencesBundleIdentifierForDeviceSetupManager:(id)a3
{
  return (id)*MEMORY[0x1E0D15DD8];
}

- (BOOL)currentDeviceSupportsDeviceSetup
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsDeviceSetup");

  return v3;
}

@end
