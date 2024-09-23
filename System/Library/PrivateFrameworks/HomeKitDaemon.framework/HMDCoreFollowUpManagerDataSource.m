@implementation HMDCoreFollowUpManagerDataSource

- (id)followUpControllerForDeviceSetupManager:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.HomeKit"));
}

- (id)followUpItemForDeviceSetupManager:(id)a3
{
  return objc_alloc_init(MEMORY[0x24BE1B3B0]);
}

- (id)followUpActionForDeviceSetupManager:(id)a3
{
  return objc_alloc_init(MEMORY[0x24BE1B3A0]);
}

- (id)followUpPreferencesBundleIdentifierForDeviceSetupManager:(id)a3
{
  return (id)*MEMORY[0x24BE1B2B0];
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
