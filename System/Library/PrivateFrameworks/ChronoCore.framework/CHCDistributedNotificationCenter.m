@implementation CHCDistributedNotificationCenter

+ (id)sharedInstance
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
}

@end
