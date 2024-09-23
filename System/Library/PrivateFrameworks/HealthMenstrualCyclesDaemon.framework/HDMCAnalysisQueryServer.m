@implementation HDMCAnalysisQueryServer

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (id)_analysisQueryClientProxy
{
  void *v2;
  void *v3;

  -[HDQueryServer clientProxy](self, "clientProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)HDMCAnalysisQueryServer;
  -[HDQueryServer _queue_start](&v33, sel__queue_start);
  -[HDMCAnalysisQueryServer _analysisQueryClientProxy](self, "_analysisQueryClientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authorizationOracle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCAnalysisQueryServer objectTypes](self, "objectTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v5, "readAuthorizationStatusesForTypes:error:", v6, &v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;

  if (v7)
  {
    -[HDQueryServer client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authorizationOracle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "clientHasAuthorizationForAllTypes");

    if ((v11 & 1) == 0)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v7, "allValues");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v29;
        v16 = 1;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v29 != v15)
              objc_enumerationMutation(v12);
            if ((v16 & 1) != 0)
              v16 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "canRead");
            else
              v16 = 0;
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        }
        while (v14);

        if ((v16 & 1) == 0)
        {
          _HKInitializeLogging();
          v18 = (void *)*MEMORY[0x24BDD3030];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
          {
            v19 = v18;
            v20 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v35 = v20;
            v36 = 2114;
            v37 = v7;
            v21 = v20;
            _os_log_impl(&dword_21961B000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);

          }
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE46C10]), "initWithNumberOfCycles:firstMenstruationStartDayIndex:lastMenstruationStartDayIndex:cycleLengthMedian:cycleLengthLowerPercentile:cycleLengthUpperPercentile:menstruationLengthMedian:menstruationLengthLowerPercentile:menstruationLengthUpperPercentile:", 0, 0, 0, 0, 0, 0, 0, 0, 0);
          v23 = objc_alloc(MEMORY[0x24BE46B38]);
          LOBYTE(v27) = 0;
          LOBYTE(v26) = 0;
          v24 = (void *)objc_msgSend(v23, "initWithStatistics:menstruationProjections:fertileWindowProjections:menstruationProjectionsEnabled:fertileWindowProjectionsEnabled:cycles:deviations:recentSymptoms:recentBasalBodyTemperature:lastLoggedDayIndex:lastMenstrualFlowDayIndex:isPeriodLogLate:ongoingCycleFactors:numberOfDailySleepHeartRateStatisticsForPast100Days:numberOfDailyAwakeHeartRateStatisticsForPast100Days:hasHealthAppDevicesWithHigherAlgorithmVersions:", v22, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 0, 0, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 0, 0, 0, 0, v26, MEMORY[0x24BDBD1A8],
                          0,
                          0,
                          v27);
          -[HDQueryServer queryUUID](self, "queryUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "client_deliverAnalysis:queryUUID:", v24, v25);

          goto LABEL_21;
        }
      }
      else
      {

      }
    }
    -[HDMCProfileExtension analysisManager](self->_profileExtension, "analysisManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerObserver:queue:userInitiated:", self, 0, 1);
    if ((-[HKMCAnalysisQueryConfiguration forceAnalysis](self->_configuration, "forceAnalysis") & 1) == 0)
    {
      objc_msgSend(v22, "currentAnalysis");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMCAnalysisQueryServer _handleAnalysis:](self, "_handleAnalysis:", v24);
LABEL_21:

    }
  }
  else
  {
    -[HDQueryServer queryUUID](self, "queryUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "client_deliverError:forQuery:", v8, v22);
  }

}

- (HDMCAnalysisQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7
{
  id v13;
  id v14;
  HDMCAnalysisQueryServer *v15;
  HDMCAnalysisQueryServer *v16;
  objc_super v18;

  v13 = a4;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HDMCAnalysisQueryServer;
  v15 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v18, sel_initWithUUID_configuration_client_delegate_, a3, v13, a5, a6);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_profileExtension, a7);
    objc_storeStrong((id *)&v16->_configuration, a4);
  }

  return v16;
}

- (id)objectTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  HKMCCycleTrackingSampleTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD39A0], "characteristicTypeForIdentifier:", *MEMORY[0x24BDD2A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return v4;
}

- (void)_handleAnalysis:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v11 = v5;
    objc_msgSend(v5, "cycles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v11;
    if (v7)
    {
      v8 = -[HKMCAnalysis isEqual:](self->_analysis, "isEqual:", v11);
      v6 = v11;
      if ((v8 & 1) == 0)
      {
        objc_storeStrong((id *)&self->_analysis, a3);
        -[HDMCAnalysisQueryServer _analysisQueryClientProxy](self, "_analysisQueryClientProxy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDQueryServer queryUUID](self, "queryUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "client_deliverAnalysis:queryUUID:", v11, v10);

        v6 = v11;
      }
    }
  }

}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  BOOL v13;

  v6 = a4;
  objc_msgSend(v6, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDD3310];
  v9 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x24BDD3310]);

  if ((v9 & 1) != 0
    || (objc_msgSend(v6, "entitlements"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = *MEMORY[0x24BDD3300],
        v12 = objc_msgSend(v10, "hasPrivateAccessEntitlementWithIdentifier:", *MEMORY[0x24BDD3300]),
        v10,
        (v12 & 1) != 0))
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a5, 4, CFSTR("Missing required entitlement: %@ for core apps or %@ for second-party access."), v8, v11);
    v13 = 0;
  }

  return v13;
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HDMCAnalysisQueryServer *v17;
  id v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileExtensionWithIdentifier:", *MEMORY[0x24BE46AC8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[HDMCAnalysisQueryServer initWithUUID:configuration:client:delegate:profileExtension:]([HDMCAnalysisQueryServer alloc], "initWithUUID:configuration:client:delegate:profileExtension:", v11, v12, v13, v14, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 3, CFSTR("No profile extension found for %@"), objc_opt_class());
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  return v17;
}

- (void)_queue_stop
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HDMCAnalysisQueryServer;
  -[HDQueryServer _queue_stop](&v4, sel__queue_stop);
  -[HDMCProfileExtension analysisManager](self->_profileExtension, "analysisManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
}

@end
