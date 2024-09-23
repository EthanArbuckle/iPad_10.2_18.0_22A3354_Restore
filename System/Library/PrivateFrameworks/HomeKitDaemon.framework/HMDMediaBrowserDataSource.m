@implementation HMDMediaBrowserDataSource

- (HMDMediaBrowserDataSource)init
{
  HMDMediaBrowserDataSource *v2;
  id v3;
  uint64_t v4;
  HAP2AccessoryServerDiscoveryBonjour *airPlayBonjourBrowser;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDMediaBrowserDataSource;
  v2 = -[HMDMediaBrowserDataSource init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE1B930]);
    v4 = objc_msgSend(v3, "initWithLocalDomainAndServiceType:", *MEMORY[0x24BE1B418]);
    airPlayBonjourBrowser = v2->_airPlayBonjourBrowser;
    v2->_airPlayBonjourBrowser = (HAP2AccessoryServerDiscoveryBonjour *)v4;

  }
  return v2;
}

- (NSString)currentAccessoryMediaRouteIdentifier
{
  return (NSString *)(id)_mediaRouteIdentifier;
}

- (BOOL)isAppleMediaAccessory
{
  return +[HMDDeviceCapabilities isAppleMediaAccessory](HMDDeviceCapabilities, "isAppleMediaAccessory");
}

- (BOOL)requiresHomePodMiniPairing
{
  return +[HMDDeviceCapabilities requiresHomePodMiniPairing](HMDDeviceCapabilities, "requiresHomePodMiniPairing");
}

- (unint64_t)supportedStereoPairVersions
{
  unint64_t v2;

  v2 = +[HMDDeviceCapabilities supportsStereoPairingV1](HMDDeviceCapabilities, "supportsStereoPairingV1");
  if (+[HMDDeviceCapabilities supportsStereoPairingV2](HMDDeviceCapabilities, "supportsStereoPairingV2"))
    v2 |= 2uLL;
  if (+[HMDDeviceCapabilities supportsStereoPairingV3](HMDDeviceCapabilities, "supportsStereoPairingV3"))
    v2 |= 4uLL;
  if (+[HMDDeviceCapabilities supportsStereoPairingV4](HMDDeviceCapabilities, "supportsStereoPairingV4"))
    return v2 | 8;
  else
    return v2;
}

- (BOOL)requiresHomePod2ndGenPairing
{
  return +[HMDDeviceCapabilities requiresHomePod2ndGenPairing](HMDDeviceCapabilities, "requiresHomePod2ndGenPairing");
}

- (HMFSystemInfo)systemInfo
{
  return (HMFSystemInfo *)objc_msgSend(MEMORY[0x24BE3F288], "systemInfo");
}

- (HMFProductInfo)productInfo
{
  return (HMFProductInfo *)objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
}

- (unint64_t)appleMediaAccessoryVariant
{
  return +[HMDDeviceCapabilities appleMediaAccessoryVariant](HMDDeviceCapabilities, "appleMediaAccessoryVariant");
}

- (HMDDevice)currentDevice
{
  void *v2;
  void *v3;

  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDDevice *)v3;
}

- (id)performOperation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE3F268];
  v4 = a3;
  objc_msgSend(v3, "defaultScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performOperation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HAP2AccessoryServerDiscoveryBonjour)airPlayBonjourBrowser
{
  return (HAP2AccessoryServerDiscoveryBonjour *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airPlayBonjourBrowser, 0);
}

+ (id)shortDescription
{
  return CFSTR("HMDMediaBrowserDataSource");
}

@end
