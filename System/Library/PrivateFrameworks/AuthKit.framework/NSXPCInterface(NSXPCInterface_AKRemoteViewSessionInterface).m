@implementation NSXPCInterface(NSXPCInterface_AKRemoteViewSessionInterface)

+ (id)remoteViewSessionInterface
{
  if (remoteViewSessionInterface_once != -1)
    dispatch_once(&remoteViewSessionInterface_once, &__block_literal_global_22);
  return (id)remoteViewSessionInterface_interface;
}

@end
