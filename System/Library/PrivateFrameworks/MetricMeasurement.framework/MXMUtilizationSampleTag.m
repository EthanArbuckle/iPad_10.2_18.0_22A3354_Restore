@implementation MXMUtilizationSampleTag

+ (MXMUtilizationSampleTag)CPU
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu"));
}

+ (MXMUtilizationSampleTag)CPUCycles
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.cycles"));
}

+ (MXMUtilizationSampleTag)CPUInstructions
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.instructions"));
}

+ (MXMUtilizationSampleTag)CPUTime
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.time"));
}

+ (MXMUtilizationSampleTag)CPUTimeUser
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.time.user"));
}

+ (MXMUtilizationSampleTag)CPUTimeSystem
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.time.system"));
}

+ (MXMUtilizationSampleTag)CPUQos
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.qos"));
}

+ (MXMUtilizationSampleTag)CPUQosDefault
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.qos.default"));
}

+ (MXMUtilizationSampleTag)CPUQosMaintenance
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.qos.maintenance"));
}

+ (MXMUtilizationSampleTag)CPUQosBackground
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.qos.background"));
}

+ (MXMUtilizationSampleTag)CPUQosUtility
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.qos.utility"));
}

+ (MXMUtilizationSampleTag)CPUQosLegacy
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.qos.legacy"));
}

+ (MXMUtilizationSampleTag)CPUQosUserInitiated
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.qos.user.initiated"));
}

+ (MXMUtilizationSampleTag)CPUQosUserInteractive
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.qos.user.interactive"));
}

+ (MXMUtilizationSampleTag)CPUTicks
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.ticks"));
}

+ (MXMUtilizationSampleTag)CPUTicksIdle
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.ticks.idle"));
}

+ (MXMUtilizationSampleTag)CPUTicksUser
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.ticks.user"));
}

+ (MXMUtilizationSampleTag)CPUTicksSystem
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.ticks.system"));
}

+ (MXMUtilizationSampleTag)CPUTicksNice
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.ticks.nice"));
}

+ (MXMUtilizationSampleTag)CPULoad
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.load"));
}

+ (MXMUtilizationSampleTag)CPULoadTask
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.load.task"));
}

+ (MXMUtilizationSampleTag)CPULoadThread
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.cpu.load.thread"));
}

+ (MXMUtilizationSampleTag)memory
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.memory"));
}

+ (MXMUtilizationSampleTag)memoryPhysical
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.memory.physical"));
}

+ (MXMUtilizationSampleTag)memoryPeakPhysicalLifetime
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.memory.peak.physical.lifetime"));
}

+ (MXMUtilizationSampleTag)memoryPeakPhysicalInterval
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.memory.peak.physical.interval"));
}

+ (MXMUtilizationSampleTag)memoryWired
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.memory.wired"));
}

+ (MXMUtilizationSampleTag)memoryResident
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.memory.resident"));
}

+ (MXMUtilizationSampleTag)memoryDirtied
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.memory.dirtied"));
}

+ (MXMUtilizationSampleTag)memorySwapped
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.memory.swapped"));
}

+ (MXMUtilizationSampleTag)memoryVirtual
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.memory.virtual"));
}

+ (MXMUtilizationSampleTag)memoryLeak
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.memory.leak"));
}

+ (MXMUtilizationSampleTag)IO
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.io"));
}

+ (MXMUtilizationSampleTag)IOReads
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.io.reads"));
}

+ (MXMUtilizationSampleTag)IOWrites
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.io.writes"));
}

+ (MXMUtilizationSampleTag)IOLogicalWrites
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.io.logical.writes"));
}

+ (MXMUtilizationSampleTag)machPort
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.mach.port"));
}

+ (MXMUtilizationSampleTag)network
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.network"));
}

+ (MXMUtilizationSampleTag)networkSentBytes
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.network.sent.bytes"));
}

+ (MXMUtilizationSampleTag)networkRecievedBytes
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.network.recieved.bytes"));
}

+ (MXMUtilizationSampleTag)networkSentPackets
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.network.sent.packets"));
}

+ (MXMUtilizationSampleTag)networkRecievedPackets
{
  return -[MXMSampleTag initWithDNString:]([MXMUtilizationSampleTag alloc], "initWithDNString:", CFSTR("utilization.network.recieved.packets"));
}

@end
