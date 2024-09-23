@implementation HMDMediaBrowserDataSource

+ (id)shortDescription
{
  return CFSTR("HMDMediaBrowserDataSource");
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
  return (HMFSystemInfo *)objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
}

- (HMFProductInfo)productInfo
{
  return (HMFProductInfo *)objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
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

  v3 = (void *)MEMORY[0x1E0D28698];
  v4 = a3;
  objc_msgSend(v3, "defaultScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performOperation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createUnassociatedAppleMediaAccessory:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 rawAccessoryCapabilities:(id)a8 rawResidentCapabilities:(id)a9 messageDispatcher:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HMDUnassociatedAppleMediaAccessory *v23;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = -[HMDUnassociatedAppleMediaAccessory initWithIdentifier:name:category:productColor:idsIdentifierString:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:]([HMDUnassociatedAppleMediaAccessory alloc], "initWithIdentifier:name:category:productColor:idsIdentifierString:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:", v22, v21, v20, a6, v19, v18, v17, v16);

  return v23;
}

- (id)createUnassociatedHomePodAccessory:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 requiredPairingCapabilities:(unint64_t)a8 minimumPairingSoftware:(id)a9 rawAccessoryCapabilities:(id)a10 rawResidentCapabilities:(id)a11 messageDispatcher:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  HMDUnassociatedAppleHomePodAccessory *v25;

  v17 = a12;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a7;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = -[HMDUnassociatedAppleHomePodAccessory initWithIdentifier:name:category:productColor:idsIdentifierString:requiredPairingCapabilities:minimumPairingSoftware:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:]([HMDUnassociatedAppleHomePodAccessory alloc], "initWithIdentifier:name:category:productColor:idsIdentifierString:requiredPairingCapabilities:minimumPairingSoftware:rawAccessoryCapabilities:rawResidentCapabilities:messageDispatcher:", v24, v23, v22, a6, v21, a8, v20, v19, v18, v17);

  return v25;
}

@end
