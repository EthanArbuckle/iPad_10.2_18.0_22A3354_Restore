@implementation HMDAppleMediaAccessoryDependencyFactory

- (id)deviceController
{
  return +[HMDDeviceController deviceControllerForCurrentDevice](HMDDeviceController, "deviceControllerForCurrentDevice");
}

- (id)deviceControllerWithDeviceIdentifier:(id)a3
{
  return +[HMDDeviceController placeholderDeviceControllerWithIdentifier:](HMDDeviceController, "placeholderDeviceControllerWithIdentifier:", a3);
}

- (id)deviceControllerWithDevice:(id)a3
{
  return +[HMDDeviceController deviceControllerForDevice:](HMDDeviceController, "deviceControllerForDevice:", a3);
}

- (id)deviceWithAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceForAddress:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)deviceForIDSIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceForIDSIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)symptomsHandlerForAccessory:(id)a3
{
  id v3;
  HMDAccessorySymptomHandler *v4;

  v3 = a3;
  v4 = -[HMDAccessorySymptomHandler initWithAccessory:]([HMDAccessorySymptomHandler alloc], "initWithAccessory:", v3);

  return v4;
}

- (id)darwinNotificationProviderForAccessory:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0CBA498]);
}

- (id)accountManagerForAccessory:(id)a3
{
  return +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager", a3);
}

@end
