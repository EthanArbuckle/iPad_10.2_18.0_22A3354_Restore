@implementation HKMedicationAnalyticsGenericFieldsProvider

- (HKMedicationAnalyticsGenericFieldsProvider)initWithDataSource:(id)a3
{
  id v5;
  HKMedicationAnalyticsGenericFieldsProvider *v6;
  HKMedicationAnalyticsGenericFieldsProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationAnalyticsGenericFieldsProvider;
  v6 = -[HKMedicationAnalyticsGenericFieldsProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)activePairedWatchProductType
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0D51738]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)biologicalSex
{
  HKAnalyticsHealthDataSource *dataSource;
  void *v3;
  id v4;
  NSObject *v5;
  unint64_t v6;
  __CFString *v7;
  id v9;

  dataSource = self->_dataSource;
  v9 = 0;
  -[HKAnalyticsHealthDataSource biologicalSexWithError:](dataSource, "biologicalSexWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v4)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[HKMedicationAnalyticsGenericFieldsProvider biologicalSex].cold.1();

    goto LABEL_7;
  }
  v6 = objc_msgSend(v3, "biologicalSex");
  if (v6 > 3)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v7 = off_1E6CD5BA0[v6];
LABEL_8:

  return v7;
}

- (id)userAgeForCurrentDate:(id)a3
{
  HKAnalyticsHealthDataSource *dataSource;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;

  dataSource = self->_dataSource;
  v9 = 0;
  -[HKAnalyticsHealthDataSource ageWithCurrentDate:error:](dataSource, "ageWithCurrentDate:error:", a3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[HKMedicationAnalyticsGenericFieldsProvider userAgeForCurrentDate:].cold.1();

    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (BOOL)isOntologySupportedRegion
{
  return +[HKMedicationDeviceConfiguration supportsOntologyBackedMedications](HKMedicationDeviceConfiguration, "supportsOntologyBackedMedications");
}

- (id)bucketedUserAgeForCurrentDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HKMedicationAnalyticsGenericFieldsProvider userAgeForCurrentDate:](self, "userAgeForCurrentDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    HKMedicationsBucketedDecadeForAge(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = &unk_1E6CE03F8;
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)biologicalSex
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1B77D4000, v2, v3, "[%{public}@] Unable access biological sex due to error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)userAgeForCurrentDate:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1B77D4000, v2, v3, "[%{public}@] Unable access age due to error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
