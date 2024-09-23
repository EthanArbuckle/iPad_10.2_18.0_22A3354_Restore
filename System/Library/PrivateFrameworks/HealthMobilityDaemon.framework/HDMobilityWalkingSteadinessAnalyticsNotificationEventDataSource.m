@implementation HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource

- (HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource)initWithProfile:(id)a3 category:(id)a4 value:(int64_t)a5 date:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource *v13;
  HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource;
  v13 = -[HDMobilityWalkingSteadinessAnalyticsNotificationEventDataSource init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_profile, v10);
    objc_storeStrong((id *)&v14->_category, a4);
    v14->_value = a5;
    objc_storeStrong((id *)&v14->_date, a6);
  }

  return v14;
}

- (id)ageWithError:(id *)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMobilityAnalyticsUtilities ageWithProfile:date:error:](HDMobilityAnalyticsUtilities, "ageWithProfile:date:error:", WeakRetained, v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)biologicalSexWithError:(id *)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDMobilityAnalyticsUtilities biologicalSexWithProfile:error:](HDMobilityAnalyticsUtilities, "biologicalSexWithProfile:error:", WeakRetained, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)daysSinceLastNotificationWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v16;

  HKMobilityWalkingSteadinessEventType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForEndDate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE40BC0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v16 = 0;
  objc_msgSend(v7, "mostRecentSampleWithType:profile:encodingOptions:predicate:anchor:error:", v5, WeakRetained, 0, v6, 0, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;

  if (!v9)
  {
    v14 = v10;
    v12 = v14;
    if (v14)
    {
      if (a3)
      {
        v12 = objc_retainAutorelease(v14);
        v13 = 0;
        *a3 = v12;
        goto LABEL_8;
      }
      _HKLogDroppedError();
    }
    v13 = 0;
    goto LABEL_8;
  }
  v11 = (void *)MEMORY[0x24BE46D88];
  objc_msgSend(v9, "endDate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberOfDaysBetweenStartDate:endDate:", v12, self->_date);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v13;
}

- (id)notificationClassificationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE46DA8], "payloadStringForWalkingSteadinessNotificationClassificationWithValue:", self->_value);
}

- (id)notificationTypeWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE46DA8], "payloadStringForWalkingSteadinessNotificationTypeWithValue:", self->_value);
}

- (id)areHealthNotificationsAuthorizedWithError:(id *)a3
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "notificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "areHealthNotificationsAuthorized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
