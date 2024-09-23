@implementation HMDMinimalCoreAnalyticsLogEventObserverDelegate

- (void)addCommonDimensionsToEventDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("isHH2Enabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24E96B408, CFSTR("isHH2Enabled_INT"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", +[HMDMetricsDeviceStateManager internalDeviceDaysSinceSoftwareUpdate](HMDMetricsDeviceStateManager, "internalDeviceDaysSinceSoftwareUpdate"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("daysSinceSWUpdate"));

}

@end
