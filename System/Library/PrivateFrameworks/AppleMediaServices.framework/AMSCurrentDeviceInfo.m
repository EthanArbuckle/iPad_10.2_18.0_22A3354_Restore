@implementation AMSCurrentDeviceInfo

- (NSString)buildVersion
{
  return +[AMSDevice buildVersion](AMSDevice, "buildVersion");
}

- (NSString)productType
{
  return +[AMSDevice productType](AMSDevice, "productType");
}

- (NSString)productVersion
{
  return +[AMSDevice productVersion](AMSDevice, "productVersion");
}

- (NSString)hardwarePlatform
{
  return +[AMSDevice hardwarePlatform](AMSDevice, "hardwarePlatform");
}

- (BOOL)deviceIsAppleWatch
{
  return +[AMSDevice deviceIsAppleWatch](AMSDevice, "deviceIsAppleWatch");
}

- (BOOL)deviceIsAppleTV
{
  return +[AMSDevice deviceIsAppleTV](AMSDevice, "deviceIsAppleTV");
}

- (int64_t)biometricState
{
  return +[AMSDevice biometricState](AMSDevice, "biometricState");
}

- (void)setBiometricState:(int64_t)a3
{
  +[AMSDevice setBiometricState:](AMSDevice, "setBiometricState:", a3);
}

- (NSString)compatibleProductType
{
  return +[AMSDevice compatibleProductType](AMSDevice, "compatibleProductType");
}

- (NSString)deviceGUID
{
  return +[AMSDevice deviceGUID](AMSDevice, "deviceGUID");
}

- (NSString)deviceName
{
  return +[AMSDevice deviceName](AMSDevice, "deviceName");
}

- (NSString)localIPAddress
{
  return +[AMSDevice localIPAddress](AMSDevice, "localIPAddress");
}

- (NSString)modelPartNumber
{
  return +[AMSDevice modelPartNumber](AMSDevice, "modelPartNumber");
}

- (NSString)operatingSystem
{
  return +[AMSDevice operatingSystem](AMSDevice, "operatingSystem");
}

- (NSString)regionCode
{
  return +[AMSDevice regionCode](AMSDevice, "regionCode");
}

- (BOOL)isRunningInStoreDemoMode
{
  return +[AMSDevice isRunningInStoreDemoMode](AMSDevice, "isRunningInStoreDemoMode");
}

- (NSString)secureElementID
{
  return +[AMSDevice secureElementID](AMSDevice, "secureElementID");
}

- (NSNumber)screenScale
{
  return +[AMSDevice screenScale](AMSDevice, "screenScale");
}

- (NSNumber)screenHeight
{
  return +[AMSDevice screenHeight](AMSDevice, "screenHeight");
}

- (NSNumber)screenWidth
{
  return +[AMSDevice screenWidth](AMSDevice, "screenWidth");
}

- (BOOL)isSecureElementAvailable
{
  return +[AMSDevice isSecureElementAvailable](AMSDevice, "isSecureElementAvailable");
}

- (NSString)serialNumber
{
  return +[AMSDevice serialNumber](AMSDevice, "serialNumber");
}

- (NSString)thinnedAppVariantId
{
  return +[AMSDevice thinnedAppVariantId](AMSDevice, "thinnedAppVariantId");
}

- (NSString)uniqueDeviceId
{
  return +[AMSDevice uniqueDeviceId](AMSDevice, "uniqueDeviceId");
}

- (BOOL)deviceIsAudioAccessory
{
  return +[AMSDevice deviceIsAudioAccessory](AMSDevice, "deviceIsAudioAccessory");
}

- (BOOL)deviceIsiPad
{
  return +[AMSDevice deviceIsiPad](AMSDevice, "deviceIsiPad");
}

- (BOOL)deviceIsiPhone
{
  return +[AMSDevice deviceIsiPhone](AMSDevice, "deviceIsiPhone");
}

- (BOOL)deviceIsiPod
{
  return +[AMSDevice deviceIsiPod](AMSDevice, "deviceIsiPod");
}

- (BOOL)deviceIsMac
{
  return +[AMSDevice deviceIsMac](AMSDevice, "deviceIsMac");
}

- (BOOL)deviceIsRealityDevice
{
  return +[AMSDevice deviceIsRealityDevice](AMSDevice, "deviceIsRealityDevice");
}

- (BOOL)deviceIsBundle
{
  return +[AMSDevice deviceIsBundle](AMSDevice, "deviceIsBundle");
}

- (BOOL)deviceIsPasscodeProtected
{
  return +[AMSDevice deviceIsPasscodeProtected](AMSDevice, "deviceIsPasscodeProtected");
}

- (NSArray)carrierNames
{
  return +[AMSDevice carrierNames](AMSDevice, "carrierNames");
}

- (NSString)name
{
  return +[AMSDevice name](AMSDevice, "name");
}

- (NSString)phoneNumber
{
  return +[AMSDevice phoneNumber](AMSDevice, "phoneNumber");
}

- (AMSPromise)carrierNamesPromise
{
  return (AMSPromise *)+[AMSDevice carrierNamesPromise](AMSDevice, "carrierNamesPromise");
}

- (BOOL)deviceIsAppleTVSimulator
{
  return +[AMSDevice deviceIsAppleTVSimulator](AMSDevice, "deviceIsAppleTVSimulator");
}

- (BOOL)deviceIsAppleWatchSimulator
{
  return +[AMSDevice deviceIsAppleWatchSimulator](AMSDevice, "deviceIsAppleWatchSimulator");
}

- (BOOL)deviceIsiPadSimulator
{
  return +[AMSDevice deviceIsiPadSimulator](AMSDevice, "deviceIsiPadSimulator");
}

- (BOOL)deviceIsiPhoneSimulator
{
  return +[AMSDevice deviceIsiPhoneSimulator](AMSDevice, "deviceIsiPhoneSimulator");
}

- (BOOL)deviceIsiPodSimulator
{
  return +[AMSDevice deviceIsiPodSimulator](AMSDevice, "deviceIsiPodSimulator");
}

- (BOOL)deviceIsRealityDeviceSimulator
{
  return +[AMSDevice deviceIsRealityDeviceSimulator](AMSDevice, "deviceIsRealityDeviceSimulator");
}

- (AMSPhoneNumberContextInfo)voicePreferredPhoneNumberContextInfo
{
  return (AMSPhoneNumberContextInfo *)+[AMSDevice voicePreferredPhoneNumberContextInfo](AMSDevice, "voicePreferredPhoneNumberContextInfo");
}

- (AMSPromise)voicePreferredPACToken
{
  return (AMSPromise *)+[AMSDevice voicePreferredPACToken](AMSDevice, "voicePreferredPACToken");
}

@end
