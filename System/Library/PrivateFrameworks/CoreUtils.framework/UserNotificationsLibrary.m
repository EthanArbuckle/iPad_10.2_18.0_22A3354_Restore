@implementation UserNotificationsLibrary

void *__UserNotificationsLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/UserNotifications.framework/UserNotifications", 2);
  UserNotificationsLibrary_sLib = (uint64_t)result;
  return result;
}

@end
