@implementation MXMSystemSampleTag

+ (MXMSystemSampleTag)CPUCores
{
  return -[MXMSampleTag initWithDNString:]([MXMSystemSampleTag alloc], "initWithDNString:", CFSTR("system.cpu.cores"));
}

+ (MXMSystemSampleTag)CPUCoresLogical
{
  return -[MXMSampleTag initWithDNString:]([MXMSystemSampleTag alloc], "initWithDNString:", CFSTR("system.cpu.cores.logical"));
}

+ (MXMSystemSampleTag)CPUCoresPhysical
{
  return -[MXMSampleTag initWithDNString:]([MXMSystemSampleTag alloc], "initWithDNString:", CFSTR("system.cpu.cores.physical"));
}

@end
