@implementation ARObjectTrackingDaemonControl

+ (id)serviceName
{
  return (id)*MEMORY[0x24BDFD8F8];
}

@end
