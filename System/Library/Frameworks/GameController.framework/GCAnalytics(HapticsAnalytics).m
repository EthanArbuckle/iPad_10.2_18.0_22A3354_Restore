@implementation GCAnalytics(HapticsAnalytics)

- (void)sendHapticsPlayerDestroyedEventForBundleID:()HapticsAnalytics productCategory:totalEventsProcessed:transientEventsProcessed:continuousEventsProcessed:parameterCurvesProcessed:sessionTotalDuration:sessionActiveDuration:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215181000, log, OS_LOG_TYPE_DEBUG, "Dropping haptics analytics event: #SPAMMING!", v1, 2u);
}

@end
