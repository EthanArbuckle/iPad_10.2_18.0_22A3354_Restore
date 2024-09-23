@implementation GKApplicationNotificationNames

+ (id)didEnterBackground
{
  return CFSTR("UIApplicationDidEnterBackgroundNotification");
}

+ (id)willEnterForeground
{
  return CFSTR("UIApplicationWillEnterForegroundNotification");
}

+ (id)willTerminate
{
  return CFSTR("UIApplicationWillTerminateNotification");
}

@end
