@implementation ATXSlotResolutionParametersStatistics

- (ATXSlotResolutionParametersStatistics)initWithNumParameters:(int)a3
{
  char *v4;
  char *v5;
  uint64_t v6;
  void *v7;
  int64x2_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ATXSlotResolutionParametersStatistics;
  v4 = -[ATXSlotResolutionParametersStatistics init](&v21, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_DWORD *)v4 + 6) = a3;
    *((_DWORD *)v4 + 2) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *((_QWORD *)v4 + 74) = 0;
    *(_OWORD *)(v4 + 248) = 0u;
    *((_QWORD *)v4 + 45) = 0;
    *(_OWORD *)(v4 + 232) = 0u;
    *(_OWORD *)(v4 + 264) = 0u;
    *(_OWORD *)(v4 + 280) = 0u;
    *(_OWORD *)(v4 + 296) = 0u;
    *(_OWORD *)(v4 + 312) = 0u;
    *(_OWORD *)(v4 + 328) = 0u;
    *(_OWORD *)(v4 + 344) = 0u;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v6;

    v8 = vdupq_n_s64(0x41086A0000000000uLL);
    *(int64x2_t *)(v5 + 88) = v8;
    *(int64x2_t *)(v5 + 104) = v8;
    *(int64x2_t *)(v5 + 120) = v8;
    *(_OWORD *)(v5 + 136) = 0u;
    *(_OWORD *)(v5 + 152) = 0u;
    *(_OWORD *)(v5 + 168) = 0u;
    *(_OWORD *)(v5 + 184) = 0u;
    *(_OWORD *)(v5 + 200) = 0u;
    *(_OWORD *)(v5 + 216) = 0u;
    v9 = objc_opt_new();
    v10 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v9;

    *((_QWORD *)v5 + 8) = 0;
    *((_QWORD *)v5 + 9) = 0;
    *((_QWORD *)v5 + 10) = 0;
    *((_OWORD *)v5 + 23) = 0u;
    *((_OWORD *)v5 + 24) = 0u;
    *((_OWORD *)v5 + 25) = 0u;
    *((_OWORD *)v5 + 26) = 0u;
    *((_OWORD *)v5 + 27) = 0u;
    *((_OWORD *)v5 + 28) = 0u;
    *((_OWORD *)v5 + 29) = 0u;
    *((_OWORD *)v5 + 30) = 0u;
    *((_OWORD *)v5 + 31) = 0u;
    *((_OWORD *)v5 + 32) = 0u;
    *((_OWORD *)v5 + 33) = 0u;
    *((_OWORD *)v5 + 34) = 0u;
    *((_OWORD *)v5 + 35) = 0u;
    *((_OWORD *)v5 + 36) = 0u;
    bzero(v5 + 600, 0x218uLL);
    v11 = objc_opt_new();
    v12 = (void *)*((_QWORD *)v5 + 142);
    *((_QWORD *)v5 + 142) = v11;

    v13 = objc_opt_new();
    v14 = (void *)*((_QWORD *)v5 + 143);
    *((_QWORD *)v5 + 143) = v13;

    v15 = objc_opt_new();
    v16 = (void *)*((_QWORD *)v5 + 144);
    *((_QWORD *)v5 + 144) = v15;

    v17 = objc_opt_new();
    v18 = (void *)*((_QWORD *)v5 + 145);
    *((_QWORD *)v5 + 145) = v17;

    v19 = v5;
  }

  return (ATXSlotResolutionParametersStatistics *)v5;
}

- (void)_updateTimeOfDayBudgetStatisticsForNewTimeOfDayBudget:(double)a3
{
  double v3;
  double timeOfDayBudgetMean;
  double v5;

  v3 = self->_timeOfDayBudgetCount + 1.0;
  self->_timeOfDayBudgetCount = v3;
  timeOfDayBudgetMean = self->_timeOfDayBudgetMean;
  v5 = timeOfDayBudgetMean + (a3 - timeOfDayBudgetMean) / v3;
  self->_timeOfDayBudgetMean = v5;
  self->_timeOfDayBudgetSumOfSquaresOfDifferencesFromMean = self->_timeOfDayBudgetSumOfSquaresOfDifferencesFromMean
                                                          + (a3 - timeOfDayBudgetMean) * (a3 - v5);
}

- (double)_timeOfDayBudgetStandardDeviation
{
  double timeOfDayBudgetCount;

  timeOfDayBudgetCount = self->_timeOfDayBudgetCount;
  if (timeOfDayBudgetCount >= 2.0)
    return sqrt(self->_timeOfDayBudgetSumOfSquaresOfDifferencesFromMean / (timeOfDayBudgetCount + -1.0));
  else
    return 0.0;
}

+ (double)smoothedRatio:(double)a3 over:(double)a4
{
  void *v6;
  double v7;
  double v8;

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "slotResolutionRatioSmoothingThreshold");
  v8 = v7;

  return a3 * a4 / ((v8 + a4) * (v8 + a4));
}

- (double)_totalFeedbackEvents
{
  return self->_totalRejects + self->_totalConfirms;
}

- (double)_confirmRatio
{
  double v4;
  double v5;
  double v6;
  double totalConfirms;
  double v8;
  double v9;
  void *v12;
  void *v13;

  -[ATXSlotResolutionParametersStatistics _totalFeedbackEvents](self, "_totalFeedbackEvents");
  if (v4 < self->_totalConfirms)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXActionStatistics.m"), 433, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _totalFeedbackEvents] >= _totalConfirms"));

  }
  -[ATXSlotResolutionParametersStatistics _totalFeedbackEvents](self, "_totalFeedbackEvents");
  v5 = 0.0;
  if (v6 > 0.0)
  {
    totalConfirms = self->_totalConfirms;
    -[ATXSlotResolutionParametersStatistics _totalFeedbackEvents](self, "_totalFeedbackEvents");
    +[ATXSlotResolutionParametersStatistics smoothedRatio:over:](ATXSlotResolutionParametersStatistics, "smoothedRatio:over:", totalConfirms, v8);
    v5 = v9;
    if (v9 < 0.0 || v9 > 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXActionStatistics.m"), 436, CFSTR("Invalid probablity found: %f"), *(_QWORD *)&v5);

    }
  }
  return v5;
}

+ (double)_smoothedCountForTimeOfDay:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "smoothedCountForTimeOfDayStd");
  v8 = v7;

  return ATXGaussianDistributionWithZeroMean(v8, (double)(a3 - a4) * 0.0166666667);
}

+ (double)_smoothedCountForCoarseTimeOfDay:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "smoothedCountForCoarseTimeOfDayStd");
  v8 = v7;

  return ATXGaussianDistributionWithZeroMean(v8, (double)(a3 - a4) * 0.0166666667);
}

+ (double)_smoothedCountForThirtyMinuteWindow:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  return ATXGaussianDistributionWithZeroMean(7.5, (double)(a3 - a4) * 0.0166666667);
}

+ (double)_smoothedCountForHourWindow:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  return ATXGaussianDistributionWithZeroMean(15.0, (double)(a3 - a4) * 0.0166666667);
}

+ (double)_smoothedCountForEightHourWindow:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  return ATXGaussianDistributionWithZeroMean(120.0, (double)(a3 - a4) * 0.0166666667);
}

+ (double)_smoothedBudgetForTimeOfDay:(int64_t)a3 currentTimeOfDay:(int64_t)a4
{
  void *v6;
  double v7;
  double v8;

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "smoothedBudgetForTimeOfDayStd");
  v8 = v7;

  return ATXGaussianDistributionWithZeroMean(v8, (double)(a3 - a4) * 0.0166666667);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Statistics for %d parameters"), self->_numParameters);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificGeoHashDistributionOfLaunches, 0);
  objc_storeStrong((id *)&self->_coarseGeoHashDistributionOfLaunches, 0);
  objc_storeStrong((id *)&self->_timeOfDayDistributionOfLaunches, 0);
  objc_storeStrong((id *)&self->_dayOfWeekDistributionOfLaunches, 0);
  objc_storeStrong((id *)&self->_latestOccurrenceTime, 0);
  objc_storeStrong((id *)&self->_earliestOccurrenceTime, 0);
  objc_storeStrong((id *)&self->_uniqueDaysLaunched, 0);
  objc_storeStrong((id *)&self->_latestAppSessionStartDate, 0);
}

@end
