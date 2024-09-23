@implementation HDAudioAnalyticsExposureCalculator

- (HDAudioAnalyticsExposureCalculator)initWithTargetDate:(id)a3 exposureType:(int64_t)a4 profile:(id)a5
{
  id v8;
  id v9;
  HDAudioAnalyticsExposureCalculator *v10;
  HDAudioAnalyticsExposureCalculator *v11;
  HDAudioAnalyticsExposureCalculator *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDAudioAnalyticsExposureCalculator;
  v10 = -[HDAudioAnalyticsExposureCalculator init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    -[HDAudioAnalyticsExposureCalculator setTargetDate:](v10, "setTargetDate:", v8);
    -[HDAudioAnalyticsExposureCalculator setAudioExposureType:](v11, "setAudioExposureType:", a4);
    -[HDAudioAnalyticsExposureCalculator setProfile:](v11, "setProfile:", v9);
    v12 = v11;
  }

  return v11;
}

- (id)audioExposureResultWithError:(id *)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  id v14;
  id v15;
  HDAudioAnalyticsBucketedExposureResult *v16;
  void *v17;
  void *v18;
  id v20;

  -[HDAudioAnalyticsExposureCalculator targetDate](self, "targetDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAudioAnalyticsUtilities rollingDays:beforeDate:](HDAudioAnalyticsUtilities, "rollingDays:beforeDate:", 7, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HDAudioAnalyticsExposureCalculator audioExposureType](self, "audioExposureType");
  -[HDAudioAnalyticsExposureCalculator profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  +[HDAudioAnalyticsUtilities audioAverageAndDurationForExposureType:profile:startDate:endDate:error:](HDAudioAnalyticsUtilities, "audioAverageAndDurationForExposureType:profile:startDate:endDate:error:", v7, v8, v9, v10, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;

  if (!v11)
  {
    v14 = v12;
    v15 = v14;
    if (v14)
    {
      if (a3)
      {
        v15 = objc_retainAutorelease(v14);
        v16 = 0;
        *a3 = v15;
        goto LABEL_11;
      }
      _HKLogDroppedError();
    }
    v16 = 0;
    goto LABEL_11;
  }
  v13 = -[HDAudioAnalyticsExposureCalculator audioExposureType](self, "audioExposureType");
  +[HDAudioAnalyticsUtilities leqFromStatistics:](HDAudioAnalyticsUtilities, "leqFromStatistics:", v11);
  if (v13 == 3)
    +[HDAudioAnalyticsUtilities boundedIntegerForSoundReductionLEQ:](HDAudioAnalyticsUtilities, "boundedIntegerForSoundReductionLEQ:");
  else
    +[HDAudioAnalyticsUtilities boundedIntegerForLEQ:](HDAudioAnalyticsUtilities, "boundedIntegerForLEQ:");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  +[HDAudioAnalyticsUtilities durationFromStatistics:](HDAudioAnalyticsUtilities, "durationFromStatistics:", v11);
  +[HDAudioAnalyticsUtilities boundedIntegerForExposureDuration:](HDAudioAnalyticsUtilities, "boundedIntegerForExposureDuration:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAudioAnalyticsUtilities doseFromStatistics:days:](HDAudioAnalyticsUtilities, "doseFromStatistics:days:", v11, 7);
  +[HDAudioAnalyticsUtilities boundedIntegerForDose:](HDAudioAnalyticsUtilities, "boundedIntegerForDose:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDAudioAnalyticsBucketedExposureResult initWithLEQ:duration:dose:]([HDAudioAnalyticsBucketedExposureResult alloc], "initWithLEQ:duration:dose:", v15, v17, v18);

LABEL_11:
  return v16;
}

- (id)notificationCountForRollingDays:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v18;

  -[HDAudioAnalyticsExposureCalculator targetDate](self, "targetDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAudioAnalyticsUtilities rollingDays:beforeDate:](HDAudioAnalyticsUtilities, "rollingDays:beforeDate:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HDAudioAnalyticsExposureCalculator audioExposureType](self, "audioExposureType");
  -[HDAudioAnalyticsExposureCalculator profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  +[HDAudioAnalyticsUtilities audioExposureEventsForExposureType:profile:startDate:endDate:error:](HDAudioAnalyticsUtilities, "audioExposureEventsForExposureType:profile:startDate:endDate:error:", v9, v10, v11, v12, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v18;

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v14;
    if (v16)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v16);
      else
        _HKLogDroppedError();
    }

    v15 = 0;
  }

  return v15;
}

- (id)sevenDayDoseForMostRecentNotificationWithError:(id *)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  id v20;
  id v21;

  v5 = -[HDAudioAnalyticsExposureCalculator audioExposureType](self, "audioExposureType");
  -[HDAudioAnalyticsExposureCalculator profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  +[HDAudioAnalyticsUtilities latestAudioExposureEventForExposureType:profile:error:](HDAudioAnalyticsUtilities, "latestAudioExposureEventForExposureType:profile:error:", v5, v6, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;

  if (v7)
  {
    v9 = -[HDAudioAnalyticsExposureCalculator audioExposureType](self, "audioExposureType");
    -[HDAudioAnalyticsExposureCalculator profile](self, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v8;
    +[HDAudioAnalyticsUtilities audioAverageAndDurationForExposureType:profile:startDate:endDate:error:](HDAudioAnalyticsUtilities, "audioAverageAndDurationForExposureType:profile:startDate:endDate:error:", v9, v10, v11, v12, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v20;

    if (v13)
    {
      v15 = (void *)MEMORY[0x24BDD16E0];
      +[HDAudioAnalyticsUtilities doseFromStatistics:days:](HDAudioAnalyticsUtilities, "doseFromStatistics:days:", v13, 7);
      objc_msgSend(v15, "numberWithInteger:", (uint64_t)v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v14;
      if (v18)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v18);
        else
          _HKLogDroppedError();
      }

      v17 = 0;
    }

    goto LABEL_15;
  }
  if (v8)
  {
    if (a3)
    {
      v14 = objc_retainAutorelease(v8);
      v17 = 0;
      *a3 = v14;
    }
    else
    {
      _HKLogDroppedError();
      v17 = 0;
      v14 = v8;
    }
LABEL_15:

    goto LABEL_16;
  }
  v17 = &unk_24DC668B0;
LABEL_16:

  return v17;
}

- (NSDate)targetDate
{
  return self->_targetDate;
}

- (void)setTargetDate:(id)a3
{
  objc_storeStrong((id *)&self->_targetDate, a3);
}

- (HDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
}

- (int64_t)audioExposureType
{
  return self->_audioExposureType;
}

- (void)setAudioExposureType:(int64_t)a3
{
  self->_audioExposureType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_targetDate, 0);
}

@end
