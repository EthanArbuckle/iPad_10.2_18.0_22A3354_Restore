@implementation ANEndpointNotificationName

+ (id)getNotificationNameForEndpointID:(id)a3
{
  return +[ANEndpointNotificationName getEffectiveNotificationNameFromNotificationName:endpointID:](ANEndpointNotificationName, "getEffectiveNotificationNameFromNotificationName:endpointID:", kANAnnounceStateNotificationKey, a3);
}

+ (id)getEffectiveNotificationNameFromNotificationName:(id)a3 endpointID:(id)a4
{
  return a3;
}

@end
