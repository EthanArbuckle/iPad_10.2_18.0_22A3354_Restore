@implementation CNDCoreTelephonyServices

- (__CTServerConnection)_CTServerConnectionCreateOnTargetQueue:(__CFAllocator *)a3 :(__CFString *)a4 :(id)a5 :(id)a6
{
  return (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
}

- (void)_CTServerConnectionRegisterBlockForNotification:(__CTServerConnection *)a3 :(__CFString *)a4 :(id)a5
{
  _CTServerConnectionRegisterBlockForNotification();
}

- (void)_CTServerConnectionUnregisterForNotification:(__CTServerConnection *)a3 :(__CFString *)a4
{
  _CTServerConnectionUnregisterForNotification();
}

@end
