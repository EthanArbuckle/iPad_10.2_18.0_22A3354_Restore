@implementation NTPBTelemetryNetworkEventGroup

uint64_t __87__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__totalDurationStats__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a2;
  v4 = objc_msgSend(v3, "connectDuration");
  v5 = objc_msgSend(v3, "dnsDuration") + v4;
  v6 = objc_msgSend(v3, "requestDuration");
  v7 = objc_msgSend(v3, "dnsDuration");

  return objc_msgSend(v2, "numberWithLongLong:", v5 + v6 + v7);
}

uint64_t __85__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__dnsDurationStats__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "dnsDuration"));
}

uint64_t __89__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__connectDurationStats__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "connectDuration"));
}

uint64_t __89__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__timeToFirstByteStats__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a2;
  v4 = objc_msgSend(v3, "dnsDuration");
  v5 = objc_msgSend(v3, "connectDuration") + v4;
  v6 = objc_msgSend(v3, "requestDuration");

  return objc_msgSend(v2, "numberWithLongLong:", v5 + v6);
}

BOOL __82__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__cacheHitCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cacheState") == 1;
}

BOOL __83__NTPBTelemetryNetworkEventGroup_FCNetworkBehaviorMonitorAdditions__cacheMissCount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cacheState") == 2;
}

@end
