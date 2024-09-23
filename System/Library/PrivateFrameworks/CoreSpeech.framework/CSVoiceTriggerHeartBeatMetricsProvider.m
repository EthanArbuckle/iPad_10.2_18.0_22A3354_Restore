@implementation CSVoiceTriggerHeartBeatMetricsProvider

+ (id)fetchVoiceTriggerHeartBeatMetrics
{
  void *v2;
  void *v3;

  +[CSVoiceTriggerXPCService sharedService](CSVoiceTriggerXPCService, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchVoiceTriggerDailyStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
