@implementation HKMedicationLogMetric

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.HealthRecords.MedsLogging");
}

- (HKMedicationLogMetric)initWithActions:(int64_t)a3 provenance:(int64_t)a4 context:(int64_t)a5 loggingMultipleMeds:(BOOL)a6 hoursAgoLoggedForMax:(id)a7 hoursAgoLoggedForMin:(id)a8 hoursFromScheduledTimeLoggedMax:(id)a9 hoursFromScheduledTimeLoggedMin:(id)a10 hoursFromScheduledToTakenOrSkippedMax:(id)a11 hoursFromScheduledToTakenOrSkippedMin:(id)a12 isPartiallyLoggingScheduledMeds:(id)a13 dataSource:(id)a14
{
  id v18;
  HKMedicationLogMetric *v19;
  HKMedicationLogMetric *v20;
  HKMedicationAnalyticsGenericFieldsProvider *v21;
  HKMedicationAnalyticsGenericFieldsProvider *genericDataProvider;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a7;
  v30 = a9;
  v29 = a10;
  v28 = a11;
  v27 = a12;
  v26 = a13;
  v18 = a14;
  v32.receiver = self;
  v32.super_class = (Class)HKMedicationLogMetric;
  v19 = -[HKMedicationLogMetric init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_actions = a3;
    v19->_provenance = a4;
    v19->_context = a5;
    v19->_isLoggingMultipleMeds = a6;
    objc_storeStrong((id *)&v19->_hoursAgoLoggedForMax, a7);
    objc_storeStrong((id *)&v20->_hoursAgoLoggedForMin, a7);
    objc_storeStrong((id *)&v20->_hoursFromScheduledTimeLoggedMax, a9);
    objc_storeStrong((id *)&v20->_hoursFromScheduledTimeLoggedMin, a10);
    objc_storeStrong((id *)&v20->_hoursFromScheduledToTakenOrSkippedMax, a11);
    objc_storeStrong((id *)&v20->_hoursFromScheduledToTakenOrSkippedMin, a12);
    objc_storeStrong((id *)&v20->_isPartiallyLoggingScheduledMeds, a13);
    v21 = -[HKMedicationAnalyticsGenericFieldsProvider initWithDataSource:]([HKMedicationAnalyticsGenericFieldsProvider alloc], "initWithDataSource:", v18);
    genericDataProvider = v20->_genericDataProvider;
    v20->_genericDataProvider = v21;

  }
  return v20;
}

- (NSDictionary)eventPayload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSNumber *isPartiallyLoggingScheduledMeds;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKMedicationAnalyticsGenericFieldsProvider *genericDataProvider;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[HKMedicationLogMetric actionsPayload](self, "actionsPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[HKMedicationLogMetric contextValue](self, "contextValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HKMedicationLogMetric contextValue](self, "contextValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("context"));

  }
  -[HKMedicationLogMetric provenanceValue](self, "provenanceValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HKMedicationLogMetric provenanceValue](self, "provenanceValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("provenance"));

  }
  isPartiallyLoggingScheduledMeds = self->_isPartiallyLoggingScheduledMeds;
  if (isPartiallyLoggingScheduledMeds)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", isPartiallyLoggingScheduledMeds, CFSTR("medsPartiallyLogged"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLoggingMultipleMeds);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isLoggingMultipleMeds"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_hoursAgoLoggedForMax);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("hoursAgoLoggedForMax"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_hoursAgoLoggedForMin);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hoursAgoLoggedForMin"));

  if (self->_hoursFromScheduledTimeLoggedMax)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_hoursFromScheduledTimeLoggedMax);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hoursFromScheduledTimeLoggedMax"));

  }
  if (self->_hoursFromScheduledTimeLoggedMin)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_hoursFromScheduledTimeLoggedMin);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hoursFromScheduledTimeLoggedMin"));

  }
  if (self->_hoursFromScheduledToTakenOrSkippedMax)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_hoursFromScheduledToTakenOrSkippedMax);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("hoursFromScheduledToTakenOrSkippedMax"));

  }
  if (self->_hoursFromScheduledToTakenOrSkippedMin)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_hoursFromScheduledToTakenOrSkippedMin);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hoursFromScheduledToTakenOrSkippedMin"));

  }
  -[HKMedicationAnalyticsGenericFieldsProvider biologicalSex](self->_genericDataProvider, "biologicalSex");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("biologicalSex"));
  genericDataProvider = self->_genericDataProvider;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationAnalyticsGenericFieldsProvider bucketedUserAgeForCurrentDate:](genericDataProvider, "bucketedUserAgeForCurrentDate:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("age"));

  v21 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v21;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HKMedicationLogMetric eventPayload](self, "eventPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p payload: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contextValue
{
  return HKStringFromMedicationLoggingContext(self->_context);
}

- (id)provenanceValue
{
  unint64_t v2;
  void *v6;

  v2 = self->_provenance - 1;
  if (v2 < 4)
    return off_1E6CD5108[v2];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMedicationLogMetric.m"), 150, CFSTR("Invalid provenance for HKMedicationLoggingProvenance %ld"), self->_provenance);

  return 0;
}

- (id)actionsPayload
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  v5 = MEMORY[0x1E0C9AAB0];
  v6 = MEMORY[0x1E0C9AAA0];
  if ((self->_actions & 1) != 0)
    v7 = MEMORY[0x1E0C9AAB0];
  else
    v7 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("actionDidFinishLogging"));
  if ((self->_actions & 4) != 0)
    v8 = v5;
  else
    v8 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("actionDidCancelLogging"));
  if ((self->_actions & 8) != 0)
    v9 = v5;
  else
    v9 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("actionDidChangeDose"));
  if ((self->_actions & 0x10) != 0)
    v10 = v5;
  else
    v10 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("actionDidChangeTime"));
  if ((self->_actions & 0x20) != 0)
    v11 = v5;
  else
    v11 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("actionDidMarkAllAsTaken"));
  if ((self->_actions & 0x40) != 0)
    v12 = v5;
  else
    v12 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("actionDidSkipMedication"));
  if ((self->_actions & 0x100) != 0)
    v13 = v5;
  else
    v13 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("actionDidEditDose"));
  if ((self->_actions & 0x80) != 0)
    v14 = v5;
  else
    v14 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("actionDidEditTime"));
  if ((self->_actions & 0x200) != 0)
    v15 = v5;
  else
    v15 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("actionDidEditToSkip"));
  if ((self->_actions & 0x400) != 0)
    v16 = v5;
  else
    v16 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("actionDidEditToTake"));
  if ((self->_actions & 0x800) != 0)
    v17 = v5;
  else
    v17 = v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("actionDidUnlog"));
  return v4;
}

- (void)setEventPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventPayload, 0);
  objc_storeStrong((id *)&self->_isPartiallyLoggingScheduledMeds, 0);
  objc_storeStrong((id *)&self->_hoursFromScheduledToTakenOrSkippedMin, 0);
  objc_storeStrong((id *)&self->_hoursFromScheduledToTakenOrSkippedMax, 0);
  objc_storeStrong((id *)&self->_hoursFromScheduledTimeLoggedMin, 0);
  objc_storeStrong((id *)&self->_hoursFromScheduledTimeLoggedMax, 0);
  objc_storeStrong((id *)&self->_hoursAgoLoggedForMin, 0);
  objc_storeStrong((id *)&self->_hoursAgoLoggedForMax, 0);
  objc_storeStrong((id *)&self->_genericDataProvider, 0);
}

@end
