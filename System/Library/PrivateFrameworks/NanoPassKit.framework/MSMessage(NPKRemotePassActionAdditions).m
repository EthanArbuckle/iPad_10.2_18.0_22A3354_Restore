@implementation MSMessage(NPKRemotePassActionAdditions)

- (NPKRemotePassAction)remotePassAction
{
  return -[NPKRemotePassAction initWithUnderlyingMessage:]([NPKRemotePassAction alloc], "initWithUnderlyingMessage:", a1);
}

- (uint64_t)updateDataURLForRemoteAction:()NPKRemotePassActionAdditions
{
  return objc_msgSend(a3, "_updateDataURL");
}

@end
