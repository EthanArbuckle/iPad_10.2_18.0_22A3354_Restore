@implementation IMDBroadcastController

+ (IMDBroadcasterProviding)sharedProvider
{
  return (IMDBroadcasterProviding *)(id)qword_1ED9362A8;
}

+ (void)registerSharedProvider:(id)a3
{
  objc_storeStrong((id *)&qword_1ED9362A8, a3);
}

@end
