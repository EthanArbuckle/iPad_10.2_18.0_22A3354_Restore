@implementation ATXSlotResolutionStatistics

- (ATXSlotResolutionStatistics)initWithActionKey:(id)a3
{
  id v6;
  ATXSlotResolutionStatistics *v7;
  ATXSlotResolutionStatistics *v8;
  uint64_t v9;
  NSMutableDictionary *statisticsForParameters;
  uint64_t v11;
  NSMutableDictionary *statisticsForSlotSet;
  uint64_t v13;
  NSMutableSet *totalUniqueDaysLaunched;
  uint64_t v15;
  NSMutableSet *totalUniqueDaysConfirmedOrRejectedInSpotlightWithinMeanWindowForAllSlots;
  ATXSlotResolutionStatistics *v17;
  void *v19;
  objc_super v20;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXActionStatistics.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionKey"));

  }
  v20.receiver = self;
  v20.super_class = (Class)ATXSlotResolutionStatistics;
  v7 = -[ATXSlotResolutionStatistics init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_actionKey, a3);
    v9 = objc_opt_new();
    statisticsForParameters = v8->_statisticsForParameters;
    v8->_statisticsForParameters = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    statisticsForSlotSet = v8->_statisticsForSlotSet;
    v8->_statisticsForSlotSet = (NSMutableDictionary *)v11;

    v8->_totalLaunches = 0.0;
    v8->_slotCount = 0;
    v8->_totalPartOfWeekAndLocationCount = 0.0;
    v8->_totalConfirmRatioCount = 0;
    *(_OWORD *)&v8->_totalTimeOfDayCount = 0u;
    *(_OWORD *)&v8->_totalHourWindowCount = 0u;
    *(_OWORD *)&v8->_totalCoarseTimeOfDayCount = 0u;
    *(_OWORD *)&v8->_totalPartOfWeekCount = 0u;
    *(_OWORD *)&v8->_totalMotionTypeCount = 0u;
    v8->_totalConfirmsForAllSlots = 0.0;
    *(_OWORD *)&v8->_totalRejectsForAllSlots = 0u;
    *(_OWORD *)&v8->_totalConfirmRatioMean = 0u;
    v13 = objc_opt_new();
    totalUniqueDaysLaunched = v8->_totalUniqueDaysLaunched;
    v8->_totalUniqueDaysLaunched = (NSMutableSet *)v13;

    *(_OWORD *)&v8->_totalConfirmsInSpotlightForAllSlots = 0u;
    *(_OWORD *)&v8->_totalConfirmsInSpotlightWithinMeanWindowForAllSlots = 0u;
    *(_OWORD *)&v8->_totalTimeAndLocationCount = 0u;
    *(_OWORD *)&v8->_totalDayAndLocationCount = 0u;
    *(_OWORD *)&v8->_totalPrevLocationAndMotionTypeCount = 0u;
    *(_OWORD *)&v8->_totalTimeAndPrevLocationCount = 0u;
    *(_OWORD *)&v8->_totalTimeOfDayOccurrences = 0u;
    *(_OWORD *)&v8->_totalLocationOccurrences = 0u;
    *(_OWORD *)&v8->_totalPreviousLocationOccurrences = 0u;
    *(_OWORD *)&v8->_totalTimeAndDayOccurrences = 0u;
    *(_OWORD *)&v8->_totalDayAndLocationOccurrences = 0u;
    *(_OWORD *)&v8->_totalPrevLocationAndLocationOccurrences = 0u;
    *(_OWORD *)&v8->_totalTimeAndPrevLocationOccurrences = 0u;
    *(_OWORD *)&v8->_totalPartOfWeekAndLocationOccurrences = 0u;
    v15 = objc_opt_new();
    totalUniqueDaysConfirmedOrRejectedInSpotlightWithinMeanWindowForAllSlots = v8->_totalUniqueDaysConfirmedOrRejectedInSpotlightWithinMeanWindowForAllSlots;
    v8->_totalUniqueDaysConfirmedOrRejectedInSpotlightWithinMeanWindowForAllSlots = (NSMutableSet *)v15;

    *(_OWORD *)&v8->_totalConfirmsInLockscreenForAllSlots = 0u;
    *(_OWORD *)&v8->_totalConfirmsTodayInLockscreenForAllSlots = 0u;
    *(_OWORD *)&v8->_totalCoarseTimePOWLocationCount = 0u;
    *(_OWORD *)&v8->_totalConfirmsCoarseTimePOWLocationCount = 0u;
    *(_OWORD *)&v8->_totalRejectsCoarseTimePOWLocationCount = 0u;
    *(_OWORD *)&v8->_totalSpecificTimeDOWLocationCount = 0u;
    *(_OWORD *)&v8->_totalConfirmsSpecificTimeDOWLocationCount = 0u;
    *(_OWORD *)&v8->_totalRejectsSpecificTimeDOWLocationCount = 0u;
    *(_OWORD *)&v8->_launchesDayOfWeekInContext = 0u;
    *(_OWORD *)&v8->_launchesSpecificGeoHashInContext = 0u;
    *(_OWORD *)&v8->_confirmsTimeOfDayInContext = 0u;
    *(_OWORD *)&v8->_confirmsDayOfWeekInContext = 0u;
    *(_OWORD *)&v8->_confirmsCoarseGeoHashInContext = 0u;
    *(_OWORD *)&v8->_confirmsSpecificGeoHashInContext = 0u;
    *(_OWORD *)&v8->_homeScreenActionConfirmsOnDayOfWeekInContext = 0u;
    *(_OWORD *)&v8->_homeScreenActionConfirmsAtTimeOfDayInContext = 0u;
    *(_OWORD *)&v8->_homeScreenActionConfirmsAtCoarseGeohashInContext = 0u;
    *(_OWORD *)&v8->_homeScreenActionConfirmsAtSpecificGeohashInContext = 0u;
    *(_OWORD *)&v8->_homeScreenActionConfirmsAtCoarseTimePOWLocationInContext = 0u;
    *(_OWORD *)&v8->_homeScreenActionConfirmsAtSpecificTimeDOWLocationInContext = 0u;
    v17 = v8;
  }

  return v8;
}

- (void)_updateConfirmRatioStatisticsForNewConfirmRatio:(double)a3
{
  int v3;
  double totalConfirmRatioMean;
  double v5;
  double v6;

  v3 = self->_totalConfirmRatioCount + 1;
  self->_totalConfirmRatioCount = v3;
  totalConfirmRatioMean = self->_totalConfirmRatioMean;
  v5 = a3 - totalConfirmRatioMean;
  v6 = totalConfirmRatioMean + (a3 - totalConfirmRatioMean) / (double)v3;
  self->_totalConfirmRatioMean = v6;
  self->_totalConfirmRatioSumOfSquaresOfDifferencesFromMean = self->_totalConfirmRatioSumOfSquaresOfDifferencesFromMean
                                                            + v5 * (a3 - v6);
}

- (double)_totalConfirmRatioStandardDeviation
{
  int totalConfirmRatioCount;

  totalConfirmRatioCount = self->_totalConfirmRatioCount;
  if (totalConfirmRatioCount >= 2)
    return sqrt(self->_totalConfirmRatioSumOfSquaresOfDifferencesFromMean / (double)(totalConfirmRatioCount - 1));
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalUniqueDaysConfirmedOrRejectedInSpotlightWithinMeanWindowForAllSlots, 0);
  objc_storeStrong((id *)&self->_totalUniqueDaysLaunched, 0);
  objc_storeStrong((id *)&self->_statisticsForSlotSet, 0);
  objc_storeStrong((id *)&self->_statisticsForParameters, 0);
  objc_storeStrong((id *)&self->_actionKey, 0);
}

@end
