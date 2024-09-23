@implementation C3DNotificationCenterGetSharedInstance

uint64_t __C3DNotificationCenterGetSharedInstance_block_invoke()
{
  uint64_t result;

  result = C3DNotificationCenterCreate();
  C3DNotificationCenterGetSharedInstance_sharedInstance = result;
  return result;
}

@end
