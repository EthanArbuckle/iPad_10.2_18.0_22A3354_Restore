@implementation SBSRemoteAlertHandle(HMD)

- (uint64_t)activate
{
  return objc_msgSend(a1, "activateWithContext:", 0);
}

@end
