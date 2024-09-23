@implementation HMDMinimalCoreAnalyticsLogEventObserverDelegate

- (void)addCommonDimensionsToEventDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("isHH2Enabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E8B33360, CFSTR("isHH2Enabled_INT"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[HMDMetricsDeviceStateManager internalDeviceDaysSinceSoftwareUpdate](HMDMetricsDeviceStateManager, "internalDeviceDaysSinceSoftwareUpdate"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("daysSinceSWUpdate"));

}

@end
