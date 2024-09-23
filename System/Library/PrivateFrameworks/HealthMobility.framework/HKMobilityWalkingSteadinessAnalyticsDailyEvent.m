@implementation HKMobilityWalkingSteadinessAnalyticsDailyEvent

- (HKMobilityWalkingSteadinessAnalyticsDailyEvent)initWithDataSource:(id)a3
{
  id v5;
  HKMobilityWalkingSteadinessAnalyticsDailyEvent *v6;
  HKMobilityWalkingSteadinessAnalyticsDailyEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsDailyEvent;
  v6 = -[HKMobilityWalkingSteadinessAnalyticsDailyEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.health.walkingsteadiness.daily");
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "environmentDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isImproveHealthAndActivityEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("isImproveHealthAndActivityAllowed"));

  -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v12, "hasWalkingSteadinessMeasurementsWithError:", &v41);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v41;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("hasWalkingSteadinessMeasurements"));

  v15 = v14;
  if (v15)
    goto LABEL_6;
  -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v16, "walkingSteadinessNotificationsEnabledWithError:", &v40);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v40;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("isWalkingSteadinessNotificationsEnabled"));

  v15 = v18;
  if (v15)
    goto LABEL_6;
  -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v19, "activePairedWatchTypeWithError:", &v39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v39;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("activePairedWatchType"));

  v15 = v21;
  if (v15)
    goto LABEL_6;
  -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v22, "areHealthNotificationsAuthorizedWithError:", &v38);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v38;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("areHealthNotificationsAuthorized"));

  v15 = v24;
  if (v15)
    goto LABEL_6;
  -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  objc_msgSend(v25, "hasLaunchedHealthAppInLastWeek:", &v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v37;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("hasLaunchedHealthAppInLastWeek"));

  v15 = v27;
  if (v15)
  {
LABEL_6:
    v28 = v15;
    if (a4)
      *a4 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();

  }
  else
  {
    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v31, "hasLaunchedHealthAppInLastMonth:", &v36);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v36;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("hasLaunchedHealthAppInLastMonth"));

    v34 = v33;
    if (!v34)
    {
      v29 = (void *)objc_msgSend(v8, "copy");
      goto LABEL_11;
    }
    v35 = v34;
    if (a4)
      *a4 = objc_retainAutorelease(v34);
    else
      _HKLogDroppedError();

  }
  v29 = 0;
LABEL_11:

  return v29;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  objc_msgSend(v7, "ageWithError:", &v65);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v65;

  v10 = v9;
  if (v10)
  {
    v11 = v10;
    if (a4)
    {
      v12 = 0;
      *a4 = objc_retainAutorelease(v10);
    }
    else
    {
      _HKLogDroppedError();
      v12 = 0;
    }
    v48 = v11;
  }
  else
  {
    +[HKMobilityAnalyticsUtilities payloadValueForAge:](HKMobilityAnalyticsUtilities, "payloadValueForAge:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("age"));

    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    objc_msgSend(v14, "biologicalSexWithError:", &v64);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v64;

    v16 = v15;
    if (v16)
      goto LABEL_14;
    +[HKMobilityAnalyticsUtilities payloadStringForBiologicalSex:](HKMobilityAnalyticsUtilities, "payloadStringForBiologicalSex:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("sex"));

    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    objc_msgSend(v18, "hasHeightWithError:", &v63);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v63;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("hasHeight"));

    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v20;
    objc_msgSend(v21, "numberOfDaysSinceLastWalkingSteadinessMeasurementWithError:", &v62);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v62;

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("numberOfDaysSinceLastWalkingSteadinessMeasurement"));
    v16 = v23;
    if (v16)
      goto LABEL_14;
    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    objc_msgSend(v24, "numberOfLowNotificationsInPastYearWithError:", &v61);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v61;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("numberOfLowNotificationsInPastYear"));

    v16 = v26;
    if (v16)
      goto LABEL_14;
    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    objc_msgSend(v27, "numberOfRepeatLowNotificationsInPastYearWithError:", &v60);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v60;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("numberOfRepeatLowNotificationsInPastYear"));

    v16 = v29;
    if (v16)
      goto LABEL_14;
    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend(v30, "numberOfVeryLowNotificationsInPastYearWithError:", &v59);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v59;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("numberOfVeryLowNotificationsInPastYear"));

    v16 = v32;
    if (v16)
      goto LABEL_14;
    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    objc_msgSend(v33, "numberOfRepeatVeryLowNotificationsInPastYearWithError:", &v58);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v58;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("numberOfRepeatVeryLowNotificationsInPastYear"));

    v16 = v35;
    if (v16)
      goto LABEL_14;
    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v36, "numberOfInitialNotificationsInPastYearWithError:", &v57);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v57;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("numberOfInitialNotificationsInPastYear"));

    v16 = v38;
    if (v16)
      goto LABEL_14;
    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    objc_msgSend(v39, "daysSinceLastRepeatNotificationWithError:", &v56);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v56;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("daysSinceLastRepeatNotification"));

    v16 = v41;
    if (v16)
      goto LABEL_14;
    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    objc_msgSend(v42, "daysSinceLastInitialNotificationWithError:", &v55);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v55;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("daysSinceLastInitialNotification"));

    v16 = v44;
    if (v16)
      goto LABEL_14;
    -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v45, "currentWalkingSteadinessClassificationWithError:", &v54);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v54;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v46, CFSTR("currentWalkingSteadinessClassification"));

    v16 = v47;
    if (v16)
    {
LABEL_14:
      v48 = v16;
    }
    else
    {
      -[HKMobilityWalkingSteadinessAnalyticsDailyEvent dataSource](self, "dataSource");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      objc_msgSend(v50, "previousWalkingSteadinessClassificationWithError:", &v53);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v53;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v51, CFSTR("previousWalkingSteadinessClassification"));

      v48 = v52;
      if (!v48)
      {
        v12 = (void *)objc_msgSend(v6, "copy");
        goto LABEL_21;
      }
    }
    if (a4)
      *a4 = objc_retainAutorelease(v48);
    else
      _HKLogDroppedError();

    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (HKMobilityWalkingSteadinessAnalyticsDailyEventDataSourceProvider)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
