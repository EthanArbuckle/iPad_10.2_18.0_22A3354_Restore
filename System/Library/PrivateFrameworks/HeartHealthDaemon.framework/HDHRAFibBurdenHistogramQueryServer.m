@implementation HDHRAFibBurdenHistogramQueryServer

- (HDHRAFibBurdenHistogramQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDHRAFibBurdenHistogramQueryServer *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HKHRAFibBurdenAnalyzer *analyzer;
  objc_super v18;

  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDHRAFibBurdenHistogramQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v18, sel_initWithUUID_configuration_client_delegate_, a3, a4, v10, a6);
  if (v11)
  {
    objc_msgSend(v10, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "profileExtensionWithIdentifier:", *MEMORY[0x1E0D2FB48]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "aFibBurdenComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "analyzer");
    v15 = objc_claimAutoreleasedReturnValue();
    analyzer = v11->_analyzer;
    v11->_analyzer = (HKHRAFibBurdenAnalyzer *)v15;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)objectTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A78]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HKHRAFibBurdenAnalyzer *analyzer;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)HDHRAFibBurdenHistogramQueryServer;
  -[HDQueryServer _queue_start](&v30, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationOracle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRAFibBurdenHistogramQueryServer objectTypes](self, "objectTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v6, "readAuthorizationStatusesForTypes:error:", v7, &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;

  if (!v8)
  {
    -[HDQueryServer queryUUID](self, "queryUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "client_deliverError:forQuery:", v9, v19);
    goto LABEL_22;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v8, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (!v11)
  {

LABEL_18:
    analyzer = self->_analyzer;
    v24 = v9;
    -[HKHRAFibBurdenAnalyzer generateSixWeekBurdenHistogramsWithError:](analyzer, "generateSixWeekBurdenHistogramsWithError:", &v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v24;

    -[HDQueryServer queryUUID](self, "queryUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v4, "client_deliverHistogramResult:queryUUID:", v19, v23);
    else
      objc_msgSend(v4, "client_deliverError:forQuery:", v22, v23);

    v9 = v22;
    goto LABEL_22;
  }
  v12 = v11;
  v13 = *(_QWORD *)v26;
  v14 = 1;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v10);
      if ((v14 & 1) != 0)
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "canRead");
      else
        v14 = 0;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  }
  while (v12);

  if ((v14 & 1) != 0)
    goto LABEL_18;
  _HKInitializeLogging();
  HKHRAFibBurdenLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v32 = v17;
    v33 = 2112;
    v34 = v8;
    v18 = v17;
    _os_log_impl(&dword_1CC29C000, v16, OS_LOG_TYPE_DEFAULT, "[%@] Avoiding exposing health data due to missing authorization: %@", buf, 0x16u);

  }
  -[HDHRAFibBurdenHistogramQueryServer _makeEmptyHistogramResult](self, "_makeEmptyHistogramResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer queryUUID](self, "queryUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client_deliverHistogramResult:queryUUID:", v19, v20);

LABEL_22:
}

- (id)_makeEmptyHistogramResult
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FB80]), "initWithBurdenPercentage:burdenPercentageWasClampedToLowerBound:unavailabilityReason:", 0, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FB88]), "initWithSundayBurden:mondayBurden:tuesdayBurden:wednesdayBurden:thursdayBurden:fridayBurden:saturdayBurden:", v2, v2, v2, v2, v2, v2, v2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBC0]), "initWithMidnightToFourAMBurden:fourAMtoEightAMBurden:eightAMToNoonBurden:noonToFourPMBurden:fourPMToEightPMBurden:eightPMToMidnightBurden:", v2, v2, v2, v2, v2, v2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2FBA0]), "initWithDayOfWeekHistogram:timeOfDayHistogram:", v3, v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end
