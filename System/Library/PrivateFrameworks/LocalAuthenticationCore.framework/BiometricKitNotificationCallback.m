@implementation BiometricKitNotificationCallback

uint64_t __BiometricKitNotificationCallback_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_refreshIdentitiesDueToAccessoryChange:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_handleEnrollmentChangedNotification");
}

uint64_t __BiometricKitNotificationCallback_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLockoutStateChangedNotification");
}

@end
