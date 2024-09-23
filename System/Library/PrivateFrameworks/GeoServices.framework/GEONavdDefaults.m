@implementation GEONavdDefaults

- (double)minimumTimeIntervalToConsiderLeechedLocationInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumTimeIntervalToConsiderLeechedLocationInSeconds, (uint64_t)off_1EDF4D6F8);
}

- (double)minimumDistanceToConsiderLeechedLocationInMeters
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumDistanceToConsiderLeechedLocation, (uint64_t)off_1EDF4D6E8);
}

+ (id)sharedInstance
{
  if (qword_1ECDBB8C8 != -1)
    dispatch_once(&qword_1ECDBB8C8, &__block_literal_global_8);
  return (id)_MergedGlobals_178;
}

void __33__GEONavdDefaults_sharedInstance__block_invoke()
{
  GEONavdDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(GEONavdDefaults);
  v1 = (void *)_MergedGlobals_178;
  _MergedGlobals_178 = (uint64_t)v0;

}

- (double)minimumDistanceToGetLocationUpdatesInMeters
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumDistanceToGetLocationUpdates, (uint64_t)off_1EDF4D6D8);
}

- (double)locationUpdatesDesiredAccuracyWhileStationaryForDriving
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyWhileStationaryForDriving, (uint64_t)off_1EDF4D708);
}

- (double)locationUpdatesDesiredAccuracyWhileStationaryForWalking
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyWhileStationaryForWalking, (uint64_t)off_1EDF4D718);
}

- (double)locationUpdatesDesiredAccuracyWhileStationaryForTransit
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyWhileStationaryForTransit, (uint64_t)off_1EDF4D728);
}

- (double)locationUpdatesDesiredAccuracyForWalking
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyForWalking, (uint64_t)off_1EDF4D738);
}

- (double)locationUpdatesDesiredAccuracyForDriving
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyForDriving, (uint64_t)off_1EDF4D748);
}

- (double)locationUpdatesDesiredAccuracyForTransit
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateDesiredAccuracyForTransit, (uint64_t)off_1EDF4D758);
}

- (double)locationUpdateTimerInterval
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationUpdateTimerInterval, (uint64_t)off_1EDF4D768);
}

- (double)staleLocationUseTimerInterval
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdStaleLocationUseTimerInterval, (uint64_t)off_1EDF4D778);
}

- (double)extraLocationWaitTimeInterval
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdExtraLocationWaitTimeInterval, (uint64_t)off_1EDF4D788);
}

- (double)locationFreshnessThreshold
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationFreshnessThreshold, (uint64_t)off_1EDF4D798);
}

- (double)locationReuseThreshold
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdLocationReuseThreshold, (uint64_t)off_1EDF4D7A8);
}

- (double)minimumDistanceToCompareAgainstLocationAccuracy
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumDistanceToCompareAgainstLocationAccuracy, (uint64_t)off_1EDF4D7B8);
}

- (unint64_t)initialSelfInitiatedHypothesisCacheAccessValue
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdInitialSelfInitiatedHypothesisCacheAccessValue, (uint64_t)off_1EDF4D7C8);
}

- (unint64_t)initialClientInitiatedHypothesisCacheAccessValue
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdInitialClientInitiatedHypothesisCacheAccessValue, (uint64_t)off_1EDF4D7D8);
}

- (double)hypothesisResponseStaleToRefreshThresholdInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdHypothesisResponseStaleToRefreshThresholdInSeconds, (uint64_t)off_1EDF4D7E8);
}

- (double)hypothesisResponseStaleToPurgeFromDiskThresholdInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdHypothesisResponseStaleToPurgeFromDiskThresholdInSeconds, (uint64_t)off_1EDF4D7F8);
}

- (double)hypothesisShouldPersistThresholdInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdHypothesisShouldPersistThresholdInSeconds, (uint64_t)off_1EDF4D808);
}

- (unint64_t)maximumNumberOfEntriesInTheCacheUnderMemoryPressure
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdMaximumNumberOfEntriesInTheCacheUnderMemoryPressure, (uint64_t)off_1EDF4D818);
}

- (int64_t)maximumNumberOfDestinationsToMonitor
{
  return GEOConfigGetInteger(GeoServicesConfig_NavdMaximumNumberOfDestinationsToMonitor, (uint64_t)off_1EDF4D828);
}

- (double)pendingStopTimeToLive
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdPendingStopTimeToLiveInSeconds, (uint64_t)off_1EDF4D838);
}

- (double)minimumTimeBetweenConsecutiveLocationUpdatesInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumTimeBetweenConsecutiveLocationUpdatesInSeconds, (uint64_t)off_1EDF4D848);
}

- (double)maximumTimeBetweenConsecutiveHypothesisUpdatesInSeconds
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMaximumTimeBetweenConsecutiveHypothesisUpdatesInSeconds, (uint64_t)off_1EDF4D858);
}

- (unint64_t)accessValueThresholdToUpdateCacheEntries
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdAccessValueThresholdToUpdateCacheEntries, (uint64_t)off_1EDF4D868);
}

- (unint64_t)maximumNumberOfProcessingLoopRepeats
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdMaximumNumberOfProcessingLoopRepeats, (uint64_t)off_1EDF4D878);
}

- (double)refreshTimeIntervalToUseIfError
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdRefreshTimeIntervalToUseIfError, (uint64_t)off_1EDF4D888);
}

- (unint64_t)refreshEquationLowestFrequency
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdRefreshEquationLowestFrequency, (uint64_t)off_1EDF4D898);
}

- (unint64_t)refreshEquationLowestFrequencyTransit
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdRefreshEquationLowestFrequencyTransit, (uint64_t)off_1EDF4D8A8);
}

- (unint64_t)refreshEquationHighestFrequency
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdRefreshEquationHighestFrequency, (uint64_t)off_1EDF4D8B8);
}

- (double)maximumRefreshIntervalLeeway
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMaximumRefreshIntervalLeeway, (uint64_t)off_1EDF4D8C8);
}

- (double)minimumTimerTimeStampFudge
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMinimumTimerTimeStampFudge, (uint64_t)off_1EDF4D8D8);
}

- (double)refreshTimeIntervalBackoffBase
{
  return GEOConfigGetDouble(GeoServicesConfig_NavRefreshTimeIntervalBackoffBase, (uint64_t)off_1EDF4D8E8);
}

- (double)refreshTimeIntervalBackoffMax
{
  return GEOConfigGetDouble(GeoServicesConfig_NavRefreshTimeIntervalBackoffMax, (uint64_t)off_1EDF4D8F8);
}

- (double)predictionsWatchdogInterval
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdPredictionsWatchdogInterval, (uint64_t)off_1EDF4D908);
}

- (double)defaultExpirationOffset
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdHypothesisDefaultExpirationOffsetInSeconds, (uint64_t)off_1EDF4D918);
}

- (double)minimumExpirationOffset
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdHypothesisMinimumExpirationOffsetInSeconds, (uint64_t)off_1EDF4D928);
}

- (unint64_t)maximumNumberOfLeechedLocations
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdMaximumNumberOfLeechedLocations, (uint64_t)off_1EDF4D938);
}

- (double)updateTimeout
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdUpdateTimeout, (uint64_t)off_1EDF4D948);
}

- (BOOL)useConservativeDepartureForRefreshTimer
{
  return GEOConfigGetBOOL(GeoServicesConfig_NavdUseConservativeDepatureForRefreshTimer, (uint64_t)off_1EDF4D958);
}

- (double)maximumUserRoutingPreferencesAge
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdMaximumUserRoutingPreferencesAge, (uint64_t)off_1EDF4D968);
}

- (unint64_t)maximumTraceFileCount
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdMaximumTraceFileCount, (uint64_t)off_1EDF4D978);
}

- (double)exitRegionSize
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdRouteHypothesizerExitRegionSize, (uint64_t)off_1EDF4D988);
}

- (BOOL)shouldUseServerSideETAs
{
  return GEOConfigGetBOOL(GeoServicesConfig_NavdRouteHypothesizerShouldUseServerSideETAs, (uint64_t)off_1EDF4D998);
}

- (BOOL)transitTTLSupported
{
  return GEOConfigGetBOOL(GeoServicesConfig_NavdTransitTTLSupported, (uint64_t)off_1EDF4D9A8);
}

- (double)averageWalkingSpeed
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdRouteHypothesizerAverageWalkingSpeed, (uint64_t)off_1EDF4D9B8);
}

- (double)slowWalkingSpeed
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdRouteHypothesizerSlowWalkingSpeed, (uint64_t)off_1EDF4D9C8);
}

- (double)fastWalkingSpeed
{
  return GEOConfigGetDouble(GeoServicesConfig_NavdRouteHypothesizerFastWalkingSpeed, (uint64_t)off_1EDF4D9D8);
}

- (unint64_t)minRandomJitterForHypothesisWakeup
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdRouteHypothesizerMinJitterTime, (uint64_t)off_1EDF4D9E8);
}

- (unint64_t)maxRandomJitterForHypothesisWakeup
{
  return GEOConfigGetUInteger(GeoServicesConfig_NavdRouteHypothesizerMaxJitterTime, (uint64_t)off_1EDF4D9F8);
}

@end
