@implementation HMDHomeLocalDeviceCapabilitiesDataSource

- (BOOL)supportsHomeKitDataStream
{
  return +[HMDDeviceCapabilities supportsHomeKitDataStream](HMDDeviceCapabilities, "supportsHomeKitDataStream");
}

- (BOOL)isResidentCapable
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResidentCapable");

  return v3;
}

- (BOOL)supportsHomeInvitation
{
  void *v2;
  char v3;

  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsHomeInvitation");

  return v3;
}

- (BOOL)supportsRemoteAccess
{
  return +[HMDDeviceCapabilities supportsRemoteAccess](HMDDeviceCapabilities, "supportsRemoteAccess");
}

- (BOOL)supportsAddingAccessory
{
  return +[HMDDeviceCapabilities supportsAddingAccessory](HMDDeviceCapabilities, "supportsAddingAccessory");
}

- (BOOL)isCompanionCapable
{
  return +[HMDDeviceCapabilities isCompanionCapable](HMDDeviceCapabilities, "isCompanionCapable");
}

- (BOOL)supportsBulletinBoard
{
  return +[HMDDeviceCapabilities supportsBulletinBoard](HMDDeviceCapabilities, "supportsBulletinBoard");
}

- (BOOL)supportsSiriUnsecuringActionsWithWatchAuth
{
  return +[HMDDeviceCapabilities supportsSiriUnsecuringActionsWithWatchAuth](HMDDeviceCapabilities, "supportsSiriUnsecuringActionsWithWatchAuth");
}

- (BOOL)supportsSiriUnsecuringActionsWithNoPasscode
{
  return +[HMDDeviceCapabilities supportsSiriUnsecuringActionsWithNoPasscode](HMDDeviceCapabilities, "supportsSiriUnsecuringActionsWithNoPasscode");
}

@end
