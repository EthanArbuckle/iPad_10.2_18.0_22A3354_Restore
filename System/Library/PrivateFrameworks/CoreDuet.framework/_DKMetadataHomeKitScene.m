@implementation _DKMetadataHomeKitScene

+ (id)homeUUID
{
  return CFSTR("homekit.homeUUID");
}

+ (id)actionSetUUID
{
  return CFSTR("homekit.actionSetUUID");
}

+ (id)actionSetName
{
  return CFSTR("homekit.actionSetName");
}

+ (id)actionSetType
{
  return CFSTR("homekit.actionSetType");
}

+ (id)clientName
{
  return CFSTR("homekit.clientName");
}

+ (id)sceneName
{
  return CFSTR("homekit.sceneName");
}

+ (id)source
{
  return CFSTR("homekit.source");
}

+ (id)associatedAccessoryUUIDs
{
  return CFSTR("homekit.associatedAccessoryUUIDs");
}

+ (id)homeOccupancy
{
  return CFSTR("homekit.homeOccupancy");
}

@end
