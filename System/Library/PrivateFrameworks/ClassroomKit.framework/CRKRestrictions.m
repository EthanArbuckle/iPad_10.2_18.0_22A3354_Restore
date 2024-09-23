@implementation CRKRestrictions

+ (NSString)didChangeNotification
{
  return (NSString *)(id)*MEMORY[0x24BE63BA0];
}

+ (NSString)classroomAirPlayAllowed
{
  return (NSString *)(id)*MEMORY[0x24BE63858];
}

+ (NSString)classroomAutomaticallyJoinClassesForced
{
  return (NSString *)(id)*MEMORY[0x24BE63860];
}

+ (NSString)classroomDeviceSettingsModificationAllowed
{
  return (NSString *)(id)*MEMORY[0x24BE63868];
}

+ (NSString)classroomLockDeviceAllowed
{
  return (NSString *)(id)*MEMORY[0x24BE63870];
}

+ (NSString)classroomOpenAppAllowed
{
  return (NSString *)(id)*MEMORY[0x24BE63878];
}

+ (NSString)classroomOpenDeepLinkAllowed
{
  return (NSString *)(id)*MEMORY[0x24BE63880];
}

+ (NSString)classroomOpenURLAllowed
{
  return (NSString *)(id)*MEMORY[0x24BE63888];
}

+ (NSString)classroomRequestPermissionToLeaveClassesForced
{
  return (NSString *)(id)*MEMORY[0x24BE63890];
}

+ (NSString)classroomRoles
{
  return (NSString *)(id)*MEMORY[0x24BE63898];
}

+ (NSString)classroomScreenObservationAllowed
{
  return (NSString *)(id)*MEMORY[0x24BE638A0];
}

+ (NSString)classroomUnpromptedAppAndDeviceLockForced
{
  return (NSString *)(id)*MEMORY[0x24BE638A8];
}

+ (NSString)classroomUnpromptedScreenObservationForced
{
  return (NSString *)(id)*MEMORY[0x24BE638B0];
}

+ (NSString)remoteScreenObservationAllowed
{
  return (NSString *)(id)*MEMORY[0x24BE63A78];
}

+ (NSString)screenShotAllowed
{
  return (NSString *)(id)*MEMORY[0x24BE63AA0];
}

+ (NSString)unpromptedRemoteScreenObservationForced
{
  return (NSString *)(id)*MEMORY[0x24BE63AF0];
}

@end
