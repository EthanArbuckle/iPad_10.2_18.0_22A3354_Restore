@implementation HDStatisticsCollectionCalculatorDefaultDataSource(HealthHearingDaemon)

- (id)hearing_addQuantitySamples:()HealthHearingDaemon calculator:error:
{
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  int v14;
  os_log_t *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  char v21;
  NSObject *v22;
  id v24;
  uint8_t buf[8];
  id v26;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v26 = 0;
    v10 = 1;
    v11 = objc_msgSend(a1, "addValuesForQuantitySamples:calculator:includeSeries:error:", v8, v9, 1, &v26);
    v12 = v26;
    v13 = v12;
    if ((v11 & 1) == 0)
    {
      v14 = objc_msgSend(v12, "hearing_isExpectedError");
      _HKInitializeLogging();
      v15 = (os_log_t *)MEMORY[0x24BDD3000];
      v16 = (void *)*MEMORY[0x24BDD3000];
      v17 = *MEMORY[0x24BDD3000];
      if (v14)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[HDStatisticsCollectionCalculatorDefaultDataSource(HealthHearingDaemon) hearing_addQuantitySamples:calculator:error:].cold.2(v16);
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        -[HDStatisticsCollectionCalculatorDefaultDataSource(HealthHearingDaemon) hearing_addQuantitySamples:calculator:error:].cold.3(v16);
      }
      if ((objc_msgSend(v13, "hearing_isExpectedError") & 1) == 0)
      {
        objc_msgSend(v9, "dateInterval");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setDateInterval:", v19);

        _HKInitializeLogging();
        v20 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21A0AA000, v20, OS_LOG_TYPE_DEFAULT, "Attempted recovery by reseting calculator.", buf, 2u);
        }

        v24 = 0;
        v10 = 1;
        v21 = objc_msgSend(a1, "addValuesForQuantitySamples:calculator:includeSeries:error:", v8, v9, 1, &v24);
        v13 = v24;
        if ((v21 & 1) != 0)
          goto LABEL_17;
        _HKInitializeLogging();
        v22 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
          -[HDStatisticsCollectionCalculatorDefaultDataSource(HealthHearingDaemon) hearing_addQuantitySamples:calculator:error:].cold.1((uint64_t)v13, v22);
      }
      if (!objc_msgSend(a1, "addValuesForQuantitySamples:calculator:includeSeries:error:", v8, v9, 0, a5))
      {
        v18 = 0;
        goto LABEL_18;
      }
      v10 = 0;
    }
LABEL_17:
    +[HDHeadphoneExposureStatisticUpdateResult resultForSamplesAdded:includedSeries:](HDHeadphoneExposureStatisticUpdateResult, "resultForSamplesAdded:includedSeries:", v8, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  +[HDHeadphoneExposureStatisticUpdateResult resultForEmptySamplesAdded](HDHeadphoneExposureStatisticUpdateResult, "resultForEmptySamplesAdded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v18;
}

- (void)hearing_addQuantitySamples:()HealthHearingDaemon calculator:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21A0AA000, a2, OS_LOG_TYPE_ERROR, "Still unable to update calculator including series: %{public}@.", (uint8_t *)&v2, 0xCu);
}

- (void)hearing_addQuantitySamples:()HealthHearingDaemon calculator:error:.cold.2(void *a1)
{
  NSObject *v1;
  id v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_21A0AA000, v1, OS_LOG_TYPE_ERROR, "Unable to append samples (%ld) to calculator due to error: %{public}@.", v3, 0x16u);

  OUTLINED_FUNCTION_1();
}

- (void)hearing_addQuantitySamples:()HealthHearingDaemon calculator:error:.cold.3(void *a1)
{
  NSObject *v1;
  id v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = a1;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_21A0AA000, v1, OS_LOG_TYPE_FAULT, "Unable to append samples (%ld) to calculator due to error: %{public}@.", v3, 0x16u);

  OUTLINED_FUNCTION_1();
}

@end
