@implementation HMMutableCameraUserNotificationSettings

- (id)copyWithZone:(_NSZone *)a3
{
  HMCameraUserNotificationSettings *v4;
  void *v5;

  v4 = objc_alloc_init(HMCameraUserNotificationSettings);
  -[HMCameraUserNotificationSettings setVersion:](v4, "setVersion:", -[HMCameraUserNotificationSettings version](self, "version"));
  -[HMCameraUserNotificationSettings setAccessModeChangeNotificationEnabled:](v4, "setAccessModeChangeNotificationEnabled:", -[HMCameraUserNotificationSettings isAccessModeChangeNotificationEnabled](self, "isAccessModeChangeNotificationEnabled"));
  -[HMCameraUserNotificationSettings setReachabilityEventNotificationEnabled:](v4, "setReachabilityEventNotificationEnabled:", -[HMCameraUserNotificationSettings isReachabilityEventNotificationEnabled](self, "isReachabilityEventNotificationEnabled"));
  -[HMCameraUserNotificationSettings setSmartBulletinBoardNotificationEnabled:](v4, "setSmartBulletinBoardNotificationEnabled:", -[HMCameraUserNotificationSettings isSmartBulletinBoardNotificationEnabled](self, "isSmartBulletinBoardNotificationEnabled"));
  -[HMCameraUserNotificationSettings smartBulletinBoardNotificationCondition](self, "smartBulletinBoardNotificationCondition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraUserNotificationSettings setSmartBulletinBoardNotificationCondition:](v4, "setSmartBulletinBoardNotificationCondition:", v5);

  return v4;
}

@end
