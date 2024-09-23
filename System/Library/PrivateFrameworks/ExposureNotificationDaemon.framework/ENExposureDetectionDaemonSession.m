@implementation ENExposureDetectionDaemonSession

- (ENExposureDetectionDaemonSession)initWithQueue:(id)a3
{
  id v5;
  ENExposureDetectionDaemonSession *v6;
  ENExposureDetectionDaemonSession *v7;
  ENExposureDetectionDaemonSessionStatistics *v8;
  ENExposureDetectionDaemonSessionStatistics *statistics;
  ENExposureDetectionDaemonSession *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENExposureDetectionDaemonSession;
  v6 = -[ENExposureDetectionDaemonSession init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v7->_signpostID = 0;
    v8 = objc_alloc_init(ENExposureDetectionDaemonSessionStatistics);
    statistics = v7->_statistics;
    v7->_statistics = v8;

    v7->_tekMatchBatchSize = 256;
    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[ENExposureDetectionDaemonSession _signpostEnd](self, "_signpostEnd");
  v3.receiver = self;
  v3.super_class = (Class)ENExposureDetectionDaemonSession;
  -[ENExposureDetectionDaemonSession dealloc](&v3, sel_dealloc);
}

- (BOOL)prepareAndReturnError:(id *)a3
{
  NSObject *dispatchQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ENExposureDetectionDaemonSession_prepareAndReturnError___block_invoke;
  block[3] = &unk_1E87D9F68;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __58__ENExposureDetectionDaemonSession_prepareAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_prepareAndReturnError:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_prepareAndReturnError:(id *)a3
{
  BOOL v3;
  NSDate *sessionDate;
  NSDate *v7;
  NSDate *v8;
  ENExposureDatabase *exposureDatabase;
  ENXPCClient *v10;
  void *v11;
  ENRegionServerExposureConfiguration *v12;
  ENRegionServerExposureConfiguration *v13;
  double v14;
  double v15;
  ENExposureConfiguration *v16;
  ENExposureConfiguration *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  ENExposureConfiguration *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  ENExposureDatabase *v28;
  id v29;
  id v31;
  void *v32;
  NSDate *obj;
  id v34;

  if (!self->_prepared)
  {
    -[ENExposureDetectionDaemonSession _signpostBegin](self, "_signpostBegin");
    sessionDate = self->_sessionDate;
    if (sessionDate)
    {
      v7 = sessionDate;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D60], "date");
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    obj = v7;
    if (self->_advertisementDatabaseQuerySession)
    {
      exposureDatabase = self->_exposureDatabase;
      if (exposureDatabase)
      {
        if (-[ENExposureDatabase openWithError:](exposureDatabase, "openWithError:", a3))
        {
          v10 = self->_client;
          -[ENRegionConfiguration region](self->_regionConfiguration, "region");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = self->_serverExposureConfiguration;
          v13 = v12;
          if (v12)
          {
            -[ENRegionServerExposureConfiguration privacyParameterInputCandenceInterval](v12, "privacyParameterInputCandenceInterval");
            v15 = v14;
          }
          else
          {
            v15 = 604800.0;
          }
          v32 = v11;
          if (v10)
          {
            v16 = self->_clientExposureConfiguration;
            if (v16)
            {
              v17 = v16;
              if (-[ENXPCClient appAPIVersion](v10, "appAPIVersion") < 2)
              {
LABEL_17:
                if ((-[ENExposureConfiguration flags](v17, "flags") & 4) == 0
                  || -[ENXPCClient accessLevel](v10, "accessLevel") > 3)
                {
                  -[ENXPCClient signingIdentity](v10, "signingIdentity");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_29;
                }
                if (a3)
                {
                  ENErrorF();
                  v31 = (id)objc_claimAutoreleasedReturnValue();
                  goto LABEL_52;
                }
LABEL_57:
                v20 = 0;
LABEL_58:
                v3 = 0;
                goto LABEL_36;
              }
              -[ENExposureConfiguration infectiousnessForDaysSinceOnsetOfSymptoms](v17, "infectiousnessForDaysSinceOnsetOfSymptoms");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "count");

              if (v19)
              {
                -[ENExposureConfiguration setFlags:](v17, "setFlags:", -[ENExposureConfiguration flags](v17, "flags") | 3);
                goto LABEL_17;
              }
              if (!a3)
                goto LABEL_57;
              NSStringFromSelector(sel_infectiousnessForDaysSinceOnsetOfSymptoms);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              ENErrorF();
              *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

              goto LABEL_57;
            }
            if (a3)
              goto LABEL_51;
          }
          else if (v11)
          {
            if (v13)
            {
              -[ENRegionServerExposureConfiguration exposureConfigurationValues](v13, "exposureConfigurationValues");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (ENExposureConfiguration *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA308]), "initWithDictionary:error:", v21, a3);
              v17 = v22;
              if (v22)
              {
                -[ENExposureConfiguration setFlags:](v22, "setFlags:", 3);
                if (-[ENRegionServerExposureConfiguration enableRecursiveReportType](v13, "enableRecursiveReportType")&& gLogCategory__ENExposureDetectionDaemonSession <= 90&& (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                v23 = (void *)MEMORY[0x1E0CB3938];
                objc_msgSend(v11, "regionCode");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "stringWithFormat:", CFSTR("com.apple.ExposureNotification.%@"), v24);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                v8 = obj;
LABEL_29:
                if (-[ENExposureDetectionDaemonSession prepareConfiguration:bundleIdentifier:nowDate:expiryInterval:error:](self, "prepareConfiguration:bundleIdentifier:nowDate:expiryInterval:error:", v17, v20, v8, a3, v15))
                {
                  v25 = objc_alloc_init(MEMORY[0x1E0CAA328]);
                  objc_msgSend(v25, "setDate:", v8);
                  v26 = (void *)MGCopyAnswer();
                  objc_msgSend(v25, "setSystemBuildVersion:", v26);

                  if (v10)
                  {
                    -[ENXPCClient signingIdentity](v10, "signingIdentity");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "setAppBundleIdentifier:", v27);
                  }
                  else
                  {
                    -[ENRegionConfiguration region](self->_regionConfiguration, "region");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "setRegion:", v27);
                  }

                  v28 = self->_exposureDatabase;
                  v34 = 0;
                  v3 = -[ENExposureDatabase upsertExposureDetectionHistorySession:error:](v28, "upsertExposureDetectionHistorySession:error:", v25, &v34);
                  v29 = v34;
                  if (v3)
                  {
                    objc_storeStrong((id *)&self->_historySession, v25);
                    objc_storeStrong((id *)&self->_sessionDate, obj);
                    objc_storeStrong((id *)&self->_sessionExposureConfiguration, v17);
                    self->_useCache = -[ENExposureConfiguration flags](self->_sessionExposureConfiguration, "flags") & 1;
                    self->_prepared = 1;
                  }
                  else if (a3)
                  {
                    ENNestedErrorF();
                    *a3 = (id)objc_claimAutoreleasedReturnValue();
                  }

                  goto LABEL_36;
                }
                goto LABEL_58;
              }
              goto LABEL_56;
            }
            if (a3)
            {
LABEL_51:
              ENErrorF();
              v31 = (id)objc_claimAutoreleasedReturnValue();
              v17 = 0;
LABEL_52:
              v20 = 0;
              v3 = 0;
              *a3 = v31;
LABEL_36:

LABEL_37:
              return v3;
            }
          }
          else if (a3)
          {
            goto LABEL_51;
          }
          v17 = 0;
          goto LABEL_57;
        }
LABEL_43:
        v3 = 0;
        goto LABEL_37;
      }
      if (!a3)
        goto LABEL_43;
    }
    else if (!a3)
    {
      goto LABEL_43;
    }
    ENErrorF();
    v3 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  return 1;
}

- (BOOL)prepareConfiguration:(id)a3 bundleIdentifier:(id)a4 nowDate:(id)a5 expiryInterval:(double)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  ENExposureDatabase *exposureDatabase;
  _BOOL4 v17;
  ENExposureDetectionDaemonSessionState *v18;
  ENExposureDetectionDaemonSessionState *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  double v28;
  ENXPCClient *client;
  _BOOL4 v30;
  const char *v31;
  const char *v32;
  void *v33;
  void *v34;
  void *v35;
  BOOL v36;
  BOOL v37;
  const char *v39;
  id v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  id *v45;
  id v46;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("ENExposureDetectionDaemonSessionState.%@"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  exposureDatabase = self->_exposureDatabase;
  v46 = 0;
  v17 = -[ENExposureDatabase getValue:forKey:ofClass:error:](exposureDatabase, "getValue:forKey:ofClass:error:", &v46, v15, objc_opt_class(), a7);
  v18 = (ENExposureDetectionDaemonSessionState *)v46;
  v19 = v18;
  if (!v17)
  {
    v37 = 0;
    goto LABEL_34;
  }
  if (!v18)
    v19 = objc_alloc_init(ENExposureDetectionDaemonSessionState);
  objc_msgSend(v12, "infectiousnessForDaysSinceOnsetOfSymptoms");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENExposureDetectionDaemonSessionState infectiousnessForDaysSinceOnsetOfSymptoms](v19, "infectiousnessForDaysSinceOnsetOfSymptoms");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20;
  v23 = v21;
  v24 = v23;
  if (v22 == v23)
  {

LABEL_31:
    objc_msgSend(v12, "setInfectiousnessForDaysSinceOnsetOfSymptoms:", v24, v39, v40, v41, v42);
    goto LABEL_32;
  }
  v45 = a7;
  if ((v22 == 0) != (v23 != 0))
  {
    v25 = objc_msgSend(v22, "isEqual:", v23);

    if ((v25 & 1) != 0)
      goto LABEL_31;
  }
  else
  {

  }
  -[ENExposureDetectionDaemonSessionState infectiousnessForDaysSinceOnsetOfSymptomsChangeDate](v19, "infectiousnessForDaysSinceOnsetOfSymptomsChangeDate");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    objc_msgSend(v14, "timeIntervalSinceDate:", v26);
    if (v28 < a6 && objc_msgSend(v24, "count"))
    {
      client = self->_client;
      if (client)
        v30 = -[ENXPCClient accessLevel](client, "accessLevel") > 2;
      else
        v30 = 0;
    }
    else
    {
      v30 = 1;
    }
    if (gLogCategory_ENExposureDetectionDaemonSession <= 50
      && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
    {
      if (v30)
        v31 = "Using";
      else
        v31 = "Ignoring";
      v32 = "using";
      if (v30)
        v32 = "overriding";
      v43 = v32;
      v44 = v31;
      CUPrintDurationDouble();
      v41 = v43;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v44;
      v40 = v13;
      LogPrintF_safe();

    }
    if (!v30)
      goto LABEL_31;
  }
  else if (gLogCategory_ENExposureDetectionDaemonSession <= 50
         && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
  {
    v39 = (const char *)v13;
    LogPrintF_safe();
  }
  -[ENExposureDetectionDaemonSessionState setInfectiousnessForDaysSinceOnsetOfSymptoms:](v19, "setInfectiousnessForDaysSinceOnsetOfSymptoms:", v22, v39, v40, v41, v42);
  -[ENExposureDetectionDaemonSessionState setInfectiousnessForDaysSinceOnsetOfSymptomsChangeDate:](v19, "setInfectiousnessForDaysSinceOnsetOfSymptomsChangeDate:", v14);
  -[ENXPCClient signingIdentity](self->_client, "signingIdentity");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENExposureDetectionDaemonSessionState setClientSigningIdentity:](v19, "setClientSigningIdentity:", v33);

  -[ENRegionConfiguration region](self->_regionConfiguration, "region");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENExposureDetectionDaemonSessionState setRegion:](v19, "setRegion:", v34);

  objc_msgSend(v14, "dateByAddingTimeInterval:", -a6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[ENExposureDatabase setValue:forKey:expiryDate:error:](self->_exposureDatabase, "setValue:forKey:expiryDate:error:", v19, v15, v35, v45);

  if (v36)
  {
LABEL_32:
    v37 = 1;
    goto LABEL_33;
  }
  v37 = 0;
LABEL_33:

LABEL_34:
  return v37;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ENExposureDetectionDaemonSession_invalidate__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __46__ENExposureDetectionDaemonSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  ENExposureConfiguration *clientExposureConfiguration;
  ENExposureDetectionHistorySession *historySession;
  ENExposureCalculationSession *exposureCalculationSession;
  ENRegionServerExposureConfiguration *serverExposureConfiguration;
  ENExposureConfiguration *sessionExposureConfiguration;

  -[ENExposureDetectionDaemonSession _signpostEnd](self, "_signpostEnd");
  -[ENAdvertisementDatabaseQuerySession invalidate](self->_advertisementDatabaseQuerySession, "invalidate");
  clientExposureConfiguration = self->_clientExposureConfiguration;
  self->_clientExposureConfiguration = 0;

  historySession = self->_historySession;
  self->_historySession = 0;

  exposureCalculationSession = self->_exposureCalculationSession;
  self->_exposureCalculationSession = 0;

  serverExposureConfiguration = self->_serverExposureConfiguration;
  self->_serverExposureConfiguration = 0;

  sessionExposureConfiguration = self->_sessionExposureConfiguration;
  self->_sessionExposureConfiguration = 0;

  *(_WORD *)&self->_finished = 0;
}

- (BOOL)addMatchesFromFileSession:(id)a3 publicKey:(id)a4 endpoint:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *dispatchQueue;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  id *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  dispatchQueue = self->_dispatchQueue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__ENExposureDetectionDaemonSession_addMatchesFromFileSession_publicKey_endpoint_error___block_invoke;
  v18[3] = &unk_1E87D9F90;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = &v24;
  v23 = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(dispatchQueue, v18);
  LOBYTE(dispatchQueue) = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)dispatchQueue;
}

uint64_t __87__ENExposureDetectionDaemonSession_addMatchesFromFileSession_publicKey_endpoint_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_addMatchesFromFileSession:publicKey:endpoint:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (BOOL)_addMatchesFromFileSession:(id)a3 publicKey:(id)a4 endpoint:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  BOOL v12;
  const char *v13;
  ENExposureDetectionDaemonSession *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  BOOL v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  BOOL v31;
  id v32;
  void *v33;
  void *v34;
  const char *v36;
  void *v37;
  void *v38;
  id *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  ENAdvertisementDatabaseQuerySession *v45;
  void *v46;
  ENExposureDetectionDaemonSession *v47;
  void *context;
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  _QWORD v61[6];
  id v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t *v67;
  _QWORD *v68;
  id v69;
  _QWORD v70[4];
  _QWORD v71[4];
  _QWORD v72[4];
  _QWORD v73[4];
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[4];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v41 = a5;
  v39 = a6;
  v38 = v11;
  if (!-[ENExposureDetectionDaemonSession _checkPreparedAndReturnError:](self, "_checkPreparedAndReturnError:", a6))
  {
    v31 = 0;
    goto LABEL_45;
  }
  v84 = 0;
  v47 = self;
  v12 = -[ENExposureDetectionDaemonSession _verifySignatureForFileSession:publicKey:error:](self, "_verifySignatureForFileSession:publicKey:error:", v10, v11, &v84);
  v40 = v84;
  if (!v12)
  {
    if (gLogCategory__ENExposureDetectionDaemonSession <= 90
      && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
    {
      if (self->_skipFileSigningVerification)
        v13 = " (ignored)";
      else
        v13 = "";
      CUPrintNSError();
      v36 = v13;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    -[ENExposureDetectionDaemonSession _updateStatisticsWithHandler:](self, "_updateStatisticsWithHandler:", &__block_literal_global_2, v36, v37, v38);
    if (!self->_skipFileSigningVerification)
    {
      v31 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v40);
      goto LABEL_44;
    }
  }
  v14 = self;
  v45 = self->_advertisementDatabaseQuerySession;
  if (self->_useCache)
  {
    v46 = 0;
    goto LABEL_14;
  }
  -[ENExposureDetectionDaemonSession _prepareExposureCalculationSessionWithError:](self, "_prepareExposureCalculationSessionWithError:", a6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self;
  if (v46)
  {
LABEL_14:
    -[ENRegionServerConfiguration rpiAdvertisementTolerance](v14->_regionServerConfiguration, "rpiAdvertisementTolerance");
    if (v15 == 0.0)
      v16 = 7200.0;
    else
      v16 = v15;
    objc_msgSend(v41, "region");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "countryCode");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v42 = 0;
    v43 = 0;
    while (1)
    {
      context = (void *)MEMORY[0x1D17A7CB8](v18);
      v83 = v19;
      objc_msgSend(v10, "readTEKBatchAndReturnError:", &v83);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v83;

      if (!v20)
        break;
      if (!objc_msgSend(v20, "count"))
      {

        objc_autoreleasePoolPop(context);
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_4;
        v50[3] = &unk_1E87DA048;
        v32 = v10;
        v51 = v32;
        -[ENExposureDetectionDaemonSession _updateStatisticsWithHandler:](v47, "_updateStatisticsWithHandler:", v50);
        objc_msgSend(v32, "sha256Data");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "metadata");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENExposureDetectionDaemonSession _addFileToHistoryWithHash:metadata:endpoint:keyCount:matchCount:](v47, "_addFileToHistoryWithHash:metadata:endpoint:keyCount:matchCount:", v33, v34, v41, v42, v43);

        v31 = 1;
        v30 = v49;
        goto LABEL_42;
      }
      if (CFPrefs_GetInt64())
      {
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v21 = v20;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v80;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v80 != v23)
                objc_enumerationMutation(v21);
              if (gLogCategory_ENExposureDetectionDaemonSession <= 40
                && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
          }
          while (v22);
        }

      }
      v78[0] = 0;
      v78[1] = v78;
      v78[2] = 0x2020000000;
      v78[3] = 0;
      v74 = 0;
      v75 = &v74;
      v76 = 0x2020000000;
      v77 = 0;
      v73[0] = 0;
      v73[1] = v73;
      v73[2] = 0x2020000000;
      v73[3] = 0;
      v72[0] = 0;
      v72[1] = v72;
      v72[2] = 0x2020000000;
      v72[3] = 0;
      v71[0] = 0;
      v71[1] = v71;
      v71[2] = 0x2020000000;
      v71[3] = 0;
      v70[0] = 0;
      v70[1] = v70;
      v70[2] = 0x2020000000;
      v70[3] = 0;
      v69 = v49;
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_2;
      v61[3] = &unk_1E87D9FF8;
      v61[4] = v47;
      v61[5] = v44;
      v63 = v73;
      v64 = v70;
      v65 = v78;
      v25 = v46;
      v62 = v25;
      v66 = v71;
      v67 = &v74;
      v68 = v72;
      v26 = -[ENAdvertisementDatabaseQuerySession enumerateAdvertisementsMatchingKeys:attenuationThreshold:timestampTolerance:error:handler:](v45, "enumerateAdvertisementsMatchingKeys:attenuationThreshold:timestampTolerance:error:handler:", v20, 255, &v69, v61, v16);
      v27 = v69;

      v19 = v27;
      if (v26)
      {
        v28 = objc_msgSend(v20, "count");
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_3;
        v52[3] = &unk_1E87DA020;
        v54 = v78;
        v53 = v25;
        v55 = v71;
        v56 = &v74;
        v57 = v72;
        v58 = v73;
        v59 = v70;
        v60 = v28;
        -[ENExposureDetectionDaemonSession _updateStatisticsWithHandler:](v47, "_updateStatisticsWithHandler:", v52);
        v29 = v75[3];

        v42 += v28;
        v43 += v29;
      }

      _Block_object_dispose(v70, 8);
      _Block_object_dispose(v71, 8);
      _Block_object_dispose(v72, 8);
      _Block_object_dispose(v73, 8);
      _Block_object_dispose(&v74, 8);
      _Block_object_dispose(v78, 8);

      objc_autoreleasePoolPop(context);
      if (!v26)
        goto LABEL_36;
    }
    objc_autoreleasePoolPop(context);
    v19 = v49;
LABEL_36:
    if (v39)
    {
      v30 = objc_retainAutorelease(v19);
      v31 = 0;
      *v39 = v30;
    }
    else
    {
      v31 = 0;
      v30 = v19;
    }
LABEL_42:

    goto LABEL_43;
  }
  if (gLogCategory__ENExposureDetectionDaemonSession <= 90
    && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v31 = 0;
LABEL_43:

LABEL_44:
LABEL_45:

  return v31;
}

void __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setInvalidFileSignatureCount:", objc_msgSend(v2, "invalidFileSignatureCount") + 1);

}

void __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  ENPersistentTemporaryExposureKey *v7;
  void *v8;
  ENPersistentTemporaryExposureKey *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = [ENPersistentTemporaryExposureKey alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "signingIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ENPersistentTemporaryExposureKey initWithTemporaryExposureKey:appBundleIdentifier:regionCountryCode:](v7, "initWithTemporaryExposureKey:appBundleIdentifier:regionCountryCode:", v5, v8, *(_QWORD *)(a1 + 40));

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v16 = 0;
  v11 = objc_msgSend(v10, "insertMatchedAdvertisements:forKey:error:", v6, v9, &v16);
  v12 = v16;
  switch(v11)
  {
    case 0:
      if (gLogCategory__ENExposureDetectionDaemonSession <= 90
        && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      break;
    case 1:
      v13 = *(_QWORD *)(a1 + 56);
      goto LABEL_8;
    case 3:
      v13 = *(_QWORD *)(a1 + 64);
      goto LABEL_8;
    case 4:
      v13 = *(_QWORD *)(a1 + 72);
LABEL_8:
      ++*(_QWORD *)(*(_QWORD *)(v13 + 8) + 24);
      break;
    default:
      break;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 48), "exposureInfoForMatchedAdvertisements:key:", v6, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    if (objc_msgSend(v5, "diagnosisReportType", v15) == 5)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);

  }
}

void __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDroppedCachedKeyUpdatesCount:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + objc_msgSend(v3, "droppedCachedKeyUpdatesCount"));
  if (a1[4])
    objc_msgSend(v3, "setDroppedKeyCount:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24)- (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24)+ *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24))+ objc_msgSend(v3, "droppedKeyCount"));
  objc_msgSend(v3, "setFileKeyCount:", a1[11] + objc_msgSend(v3, "fileKeyCount"));
  objc_msgSend(v3, "setMatchedKeyCount:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) + objc_msgSend(v3, "matchedKeyCount"));
  objc_msgSend(v3, "setNewCachedKeyCount:", *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) + objc_msgSend(v3, "newCachedKeyCount"));
  objc_msgSend(v3, "setRevokedKeyCount:", *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) + objc_msgSend(v3, "revokedKeyCount"));
  objc_msgSend(v3, "setUpdatedCachedKeyCount:", *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) + objc_msgSend(v3, "updatedCachedKeyCount"));

}

void __88__ENExposureDetectionDaemonSession__addMatchesFromFileSession_publicKey_endpoint_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setFileInvalidKeyCount:", objc_msgSend(v3, "fileInvalidKeyCount") + objc_msgSend(v2, "invalidKeyCount"));
  objc_msgSend(v3, "setProcessedFileCount:", objc_msgSend(v3, "processedFileCount") + 1);

}

- (void)_addFileToHistoryWithHash:(id)a3 metadata:(id)a4 endpoint:(id)a5 keyCount:(unint64_t)a6 matchCount:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ENExposureDetectionHistorySession *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  ENXPCClient *client;
  void *v22;
  ENExposureDatabase *exposureDatabase;
  BOOL v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v12;
  if (v15)
  {
    v16 = self->_historySession;
    if (v16)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0CAA320]);
      objc_msgSend(v17, "setFileHash:", v15);
      objc_msgSend(MEMORY[0x1E0C99D60], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setProcessDate:", v18);

      objc_msgSend(v17, "setMetadata:", v13);
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedLongLong:", a6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setKeyCount:", v19);

      if (self->_useCache)
      {
        objc_msgSend(v17, "setMatchCount:", 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedLongLong:", a7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setMatchCount:", v20);

      }
      client = self->_client;
      if (client)
      {
        -[ENXPCClient signingIdentity](client, "signingIdentity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSourceAppBundleIdentifier:", v22);
      }
      else
      {
        objc_msgSend(v14, "region");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSourceRegion:", v22);
      }

      exposureDatabase = self->_exposureDatabase;
      v26 = 0;
      v24 = -[ENExposureDatabase insertExposureDetectionFile:session:error:](exposureDatabase, "insertExposureDetectionFile:session:error:", v17, v16, &v26);
      v25 = v26;
      if (!v24
        && gLogCategory__ENExposureDetectionDaemonSession <= 90
        && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
    else if (gLogCategory__ENExposureDetectionDaemonSession <= 90
           && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else if (gLogCategory__ENExposureDetectionDaemonSession <= 90
         && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (BOOL)_verifySignatureForFileSession:(id)a3 publicKey:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v14;

  v7 = a3;
  v8 = objc_msgSend(a4, "keyRef");
  if (v8)
  {
    v14 = 0;
    objc_msgSend(v7, "verifySignatureWithPublicKey:error:", v8, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v11 = v10;
    v12 = v9 != 0;
    if (v9)
    {
      if (gLogCategory_ENExposureDetectionDaemonSession <= 10
        && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else if (a5)
    {
      __83__ENExposureDetectionDaemonSession__verifySignatureForFileSession_publicKey_error___block_invoke((uint64_t)v10, v10, CFSTR("Signature verification failed"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a5)
  {
    __83__ENExposureDetectionDaemonSession__verifySignatureForFileSession_publicKey_error___block_invoke(0, 0, CFSTR("Nil public key"));
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __83__ENExposureDetectionDaemonSession__verifySignatureForFileSession_publicKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99E00];
  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(v4);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Invalid signature"), *MEMORY[0x1E0CB2D58]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Invalid signature"), CFSTR("cuErrorDesc"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("cuErrorMsg"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3390]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C0]), "initWithDomain:code:userInfo:", CFSTR("ENExposureDetectionDaemonSessionErrorDomain"), 2, v7);

  return v8;
}

- (BOOL)_checkPreparedAndReturnError:(id *)a3
{
  _BOOL4 prepared;

  prepared = self->_prepared;
  if (!self->_prepared && a3 != 0)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return prepared;
}

- (BOOL)_checkFinishedAndReturnError:(id *)a3
{
  _BOOL4 finished;

  finished = self->_finished;
  if (!self->_finished && a3 != 0)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return finished;
}

- (id)finishAndReturnError:(id *)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ENExposureDetectionDaemonSession_finishAndReturnError___block_invoke;
  block[3] = &unk_1E87D9F68;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __57__ENExposureDetectionDaemonSession_finishAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_finishAndReturnError:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_finishAndReturnError:(id *)a3
{
  void *v5;
  double Current;
  ENExposureDatabase *exposureDatabase;
  uint64_t v8;
  _BOOL4 v9;
  BOOL v10;
  ENExposureDetectionDaemonSessionStatistics *v11;
  uint64_t v12;
  void *v13;
  int v14;
  ENExposureDetectionDaemonSessionResult *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  ENExposureDetectionDaemonSessionResult *v22;
  void *v23;
  void *v24;
  ENExposureDetectionHistorySession *v25;
  ENExposureDatabase *v26;
  BOOL v27;
  id v28;
  ENExposureDetectionDaemonSessionStatistics *statistics;
  uint64_t v31;
  uint64_t v32;
  double v33;
  id v34;
  _QWORD v35[7];
  _QWORD v36[10];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];

  if (!-[ENExposureDetectionDaemonSession _checkPreparedAndReturnError:](self, "_checkPreparedAndReturnError:"))
    goto LABEL_40;
  if (self->_finished)
  {
    if (a3)
    {
      ENErrorF();
      v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v15;
    }
LABEL_40:
    v15 = 0;
    return v15;
  }
  -[ENExposureDetectionDaemonSession _prepareExposureCalculationSessionWithError:](self, "_prepareExposureCalculationSessionWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_15;
  if (!self->_useCache)
    goto LABEL_11;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v46[3] = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  Current = CFAbsoluteTimeGetCurrent();
  exposureDatabase = self->_exposureDatabase;
  v8 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __58__ENExposureDetectionDaemonSession__finishAndReturnError___block_invoke;
  v36[3] = &unk_1E87DA070;
  v36[6] = &v37;
  v36[7] = &v42;
  v36[4] = self;
  v36[5] = v5;
  v36[8] = v46;
  v36[9] = v41;
  v9 = -[ENExposureDatabase enumerateMatchedAdvertisementsWithError:handler:](exposureDatabase, "enumerateMatchedAdvertisementsWithError:handler:", a3, v36);
  v10 = v9;
  if (v9
    && gLogCategory_ENExposureDetectionDaemonSession <= 30
    && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
  {
    v11 = (ENExposureDetectionDaemonSessionStatistics *)v38[3];
    v12 = v43[3];
    v33 = CFAbsoluteTimeGetCurrent() - Current;
    statistics = v11;
    v32 = (uint64_t)v11 - v12;
    LogPrintF_safe();
  }
  v35[0] = v8;
  v35[1] = 3221225472;
  v35[2] = __58__ENExposureDetectionDaemonSession__finishAndReturnError___block_invoke_2;
  v35[3] = &unk_1E87DA098;
  v35[4] = &v42;
  v35[5] = v46;
  v35[6] = v41;
  -[ENExposureDetectionDaemonSession _updateStatisticsWithHandler:](self, "_updateStatisticsWithHandler:", v35, statistics, v32, *(_QWORD *)&v33);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v46, 8);
  if (v10)
  {
LABEL_11:
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSensitiveLoggingAllowed");

    if (v14
      && gLogCategory_ENExposureDetectionDaemonSession <= 30
      && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
    {
      statistics = self->_statistics;
      LogPrintF_safe();
    }
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", statistics);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isSensitiveLoggingAllowed");

    if (v17
      && gLogCategory_ENExposureDetectionDaemonSession <= 30
      && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
    {
      v18 = objc_opt_class();
      v32 = objc_msgSend(v5, "cachedExposureInfoCount");
      v33 = COERCE_DOUBLE(objc_msgSend(v5, "cachedExposureWindowCount"));
      v31 = v18;
      LogPrintF_safe();
    }
    self->_finished = 1;
    -[ENExposureDetectionDaemonSession _getSummaryAndReturnError:](self, "_getSummaryAndReturnError:", a3, v31, v32, *(_QWORD *)&v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[ENExposureDetectionDaemonSession _getBeaconCountMetricsAndReturnError:](self, "_getBeaconCountMetricsAndReturnError:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "differentialPrivacyRepresentationWithCountThresholds:", &unk_1E87EDDD8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = objc_alloc_init(ENExposureDetectionDaemonSessionResult);
        -[ENExposureDetectionDaemonSessionResult setStatistics:](v22, "setStatistics:", self->_statistics);
        -[ENExposureDetectionDaemonSessionResult setSummary:](v22, "setSummary:", v19);
        -[ENRegionConfiguration region](self->_regionConfiguration, "region");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENExposureDetectionDaemonSessionResult setRegion:](v22, "setRegion:", v23);

        objc_msgSend(v5, "cachedExposuresDifferentialPrivacyRiskParameters");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENExposureDetectionDaemonSessionResult setDifferentialPrivacyRiskParameters:](v22, "setDifferentialPrivacyRiskParameters:", v24);

        -[ENExposureDetectionDaemonSessionResult setDifferentialPrivacyBeaconCount:](v22, "setDifferentialPrivacyBeaconCount:", v21);
        if (-[ENExposureDetectionDaemonSession _classifyExposureWithResult:error:](self, "_classifyExposureWithResult:error:", v22, a3))
        {
          v25 = self->_historySession;
          if (v25)
          {
            v26 = self->_exposureDatabase;
            v34 = 0;
            v27 = -[ENExposureDatabase upsertExposureDetectionHistorySession:error:](v26, "upsertExposureDetectionHistorySession:error:", v25, &v34);
            v28 = v34;
            if (!v27
              && gLogCategory__ENExposureDetectionDaemonSession <= 90
              && (gLogCategory__ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }

          }
          -[ENExposureDetectionDaemonSession _signpostEnd](self, "_signpostEnd");
          v15 = v22;
        }
        else
        {
          v15 = 0;
        }

      }
      else if (a3)
      {
        ENErrorF();
        v15 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
LABEL_15:
    v15 = 0;
  }

  return v15;
}

void __58__ENExposureDetectionDaemonSession__finishAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldMatchPersistenKey:", v8))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(v8, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "exposureInfoForMatchedAdvertisements:key:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (objc_msgSend(v6, "diagnosisReportType") == 5)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

  }
}

void __58__ENExposureDetectionDaemonSession__finishAndReturnError___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v6 = a2;
  objc_msgSend(v6, "setDroppedKeyCount:", v3 - (v4 + v5) + objc_msgSend(v6, "droppedKeyCount"));
  objc_msgSend(v6, "setMatchedKeyCount:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + objc_msgSend(v6, "matchedKeyCount"));
  objc_msgSend(v6, "setRevokedKeyCount:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + objc_msgSend(v6, "revokedKeyCount"));

}

- (BOOL)_shouldMatchPersistenKey:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[ENRegionConfiguration region](self->_regionConfiguration, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ENRegionServerExposureConfiguration matchingRestrictedToRegion](self->_serverExposureConfiguration, "matchingRestrictedToRegion"))v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v4, "regionCountryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  return v9;
}

- (BOOL)classifyExposureWithResult:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  dispatchQueue = self->_dispatchQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__ENExposureDetectionDaemonSession_classifyExposureWithResult_error___block_invoke;
  v10[3] = &unk_1E87DA0C0;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(dispatchQueue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __69__ENExposureDetectionDaemonSession_classifyExposureWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_classifyExposureWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_classifyExposureWithResult:(id)a3 error:(id *)a4
{
  BOOL v6;
  ENRegionServerExposureConfiguration *v7;
  ENRegionServerExposureConfiguration *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unsigned int v17;
  id v18;
  unsigned int v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  unsigned int v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  unsigned int v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  ENExposureDetectionDaemonSession *v75;
  ENExposureClassification *previousExposureClassification;
  id v77;
  ENExposureClassification *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  int v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  int v92;
  void *v93;
  void *v94;
  id v95;
  char v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  int v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v107;
  BOOL v108;
  ENRegionServerExposureConfiguration *v109;
  id v110;
  ENExposureDetectionDaemonSession *v111;
  id obj;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  id v118;
  id v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v119 = a3;
  if (!self->_client)
  {
    if (!-[ENExposureDetectionDaemonSession _checkFinishedAndReturnError:](self, "_checkFinishedAndReturnError:", a4))
    {
      v6 = 0;
      goto LABEL_89;
    }
    v7 = self->_serverExposureConfiguration;
    v8 = v7;
    if (!v7)
    {
      if (a4)
      {
        ENErrorF();
        v6 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      goto LABEL_88;
    }
    -[ENRegionServerExposureConfiguration classificationCriteria](v7, "classificationCriteria");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v114, "count"))
    {
      if (a4)
      {
        ENErrorF();
        v6 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      goto LABEL_87;
    }
    -[ENRegionConfiguration region](self->_regionConfiguration, "region");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v117)
    {
      if (a4)
      {
        ENErrorF();
        v6 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }
      goto LABEL_86;
    }
    objc_msgSend(v119, "summary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v9 != 0;
    if (!v9)
    {
LABEL_85:

LABEL_86:
LABEL_87:

LABEL_88:
      goto LABEL_89;
    }
    v110 = v9;
    v111 = self;
    v108 = v9 != 0;
    v109 = v8;
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    objc_msgSend(v9, "daySummaries");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v130, 16);
    v10 = 0;
    if (v115)
    {
      v113 = *(_QWORD *)v126;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v126 != v113)
            objc_enumerationMutation(obj);
          v116 = v11;
          v12 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * v11);
          v121 = 0u;
          v122 = 0u;
          v123 = 0u;
          v124 = 0u;
          v118 = v114;
          v13 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
          if (v13)
          {
            v14 = v13;
            v120 = *(_QWORD *)v122;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v122 != v120)
                  objc_enumerationMutation(v118);
                v16 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
                if (v10)
                {
                  v17 = objc_msgSend(v10, "index");
                  if (v17 < objc_msgSend(v16, "index"))
                    continue;
                }
                v18 = objc_alloc_init(MEMORY[0x1E0CAA300]);
                v19 = objc_msgSend(v16, "perDaySumERVThreshold");
                objc_msgSend(v12, "daySummary");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "scoreSum");
                v22 = v21;

                if (v19 && v22 >= (double)v19)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithDouble:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setPerDaySumERVAboveThreshold:", v23);

                }
                v24 = objc_msgSend(v16, "perDayMaxERVThreshold");
                objc_msgSend(v12, "daySummary");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "maximumScore");
                v27 = v26;

                if (v24 && v27 >= (double)v24)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithDouble:", v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setPerDaySumERVAboveThreshold:", v28);

                }
                objc_msgSend(v16, "perDaySumERVThresholdsByDiagnosisReportType");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "objectForKeyedSubscript:", &unk_1E87EE048);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "doubleValue");
                v32 = v31;

                objc_msgSend(v12, "confirmedTestSummary");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "scoreSum");
                v35 = v34;

                if (v32 > 0.0 && v35 >= v32)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithDouble:", v35);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setConfirmedTestPerDaySumERVAboveThreshold:", v37);

                }
                objc_msgSend(v29, "objectForKeyedSubscript:", &unk_1E87EE060);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "doubleValue");
                v40 = v39;

                objc_msgSend(v12, "confirmedClinicalDiagnosisSummary");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "scoreSum");
                v43 = v42;

                if (v40 > 0.0 && v43 >= v40)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithDouble:", v43);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setClinicalDiagnosisPerDaySumERVAboveThreshold:", v44);

                }
                objc_msgSend(v29, "objectForKeyedSubscript:", &unk_1E87EE078);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "doubleValue");
                v47 = v46;

                objc_msgSend(v12, "recursiveSummary");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "scoreSum");
                v50 = v49;

                if (v47 > 0.0 && v50 >= v47)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithDouble:", v50);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setRecursivePerDaySumERVAboveThreshold:", v51);

                }
                objc_msgSend(v29, "objectForKeyedSubscript:", &unk_1E87EE090);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "doubleValue");
                v54 = v53;

                objc_msgSend(v12, "selfReportedSummary");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "scoreSum");
                v57 = v56;

                if (v54 > 0.0 && v57 >= v54)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithDouble:", v57);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setSelfReportPerDaySumERVAboveThreshold:", v58);

                }
                v59 = objc_msgSend(v16, "weightedDurationAtAttenuationThreshold");
                objc_msgSend(v12, "daySummary");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "weightedDurationSum");
                v62 = v61;

                if (v59 && v62 >= (double)v59)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithDouble:", v62);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setWeightedDurationAtAttenuationAboveThreshold:", v63);

                }
                if (objc_msgSend(v18, "anyThresholdsExceeded"))
                {
                  objc_msgSend(v119, "exposureClassification");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "date");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v65
                    || (objc_msgSend(v12, "date"),
                        v66 = (void *)objc_claimAutoreleasedReturnValue(),
                        objc_msgSend(v66, "timeIntervalSinceReferenceDate"),
                        v68 = v67,
                        objc_msgSend(v65, "timeIntervalSinceReferenceDate"),
                        v70 = v69,
                        v66,
                        v68 > v70))
                  {
                    objc_msgSend(v12, "date");
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "setDate:", v71);

                    objc_msgSend(v18, "setIndex:", objc_msgSend(v16, "index"));
                    objc_msgSend(v16, "classificationName");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "setName:", v72);

                    objc_msgSend(v18, "setRegion:", v117);
                    v73 = v16;

                    objc_msgSend(v119, "setExposureClassification:", v18);
                    v10 = v73;
                  }

                }
              }
              v14 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v121, v129, 16);
            }
            while (v14);
          }

          v11 = v116 + 1;
        }
        while (v116 + 1 != v115);
        v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v130, 16);
      }
      while (v115);
    }

    objc_msgSend(v119, "exposureClassification");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v111;
    previousExposureClassification = v111->_previousExposureClassification;
    v77 = v74;
    v78 = previousExposureClassification;
    objc_msgSend(v77, "name");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENExposureClassification name](v78, "name");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v79;
    v82 = v80;
    v83 = v82;
    if (v81 == v82)
    {

    }
    else
    {
      v84 = v82;
      v85 = v81;
      if ((v81 == 0) == (v82 != 0))
      {
LABEL_71:

LABEL_72:
LABEL_73:
        objc_msgSend(v119, "statistics");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v109;
        v6 = v108;
        if (!objc_msgSend(v98, "revokedKeyCount") || (v99 = objc_msgSend(v98, "matchedKeyCount"), v77) || v99)
          v97 = 2;
        else
          v97 = 3;
        goto LABEL_78;
      }
      v86 = objc_msgSend(v81, "isEqual:", v82);

      if (!v86)
        goto LABEL_72;
    }
    objc_msgSend(v77, "region");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENExposureClassification region](v78, "region");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v87;
    v89 = v88;
    v84 = v89;
    if (v85 == v89)
    {

    }
    else
    {
      v90 = v89;
      v91 = v85;
      if ((v85 == 0) == (v89 != 0))
      {
LABEL_69:

LABEL_70:
        v75 = v111;
        goto LABEL_71;
      }
      v92 = objc_msgSend(v85, "isEqual:", v89);

      if (!v92)
        goto LABEL_70;
    }
    objc_msgSend(v77, "date");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENExposureClassification date](v78, "date");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v93;
    v95 = v94;
    if (v91 == v95)
    {

      v97 = 1;
      v98 = v77;
      v8 = v109;
      v6 = v108;
      v75 = v111;
LABEL_78:

LABEL_79:
      objc_msgSend(v119, "setExposureClassificationStatus:", v97);
      objc_msgSend(v77, "name");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENExposureDetectionHistorySession setExposureClassificationIdentifier:](v75->_historySession, "setExposureClassificationIdentifier:", v100);

      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v101, "isSensitiveLoggingAllowed");

      if (v102)
      {
        if (gLogCategory_ENExposureDetectionDaemonSession <= 30)
        {
          if (gLogCategory_ENExposureDetectionDaemonSession != -1 || (v103 = _LogCategory_Initialize(), (_DWORD)v103))
          {
            __70__ENExposureDetectionDaemonSession__classifyExposureWithResult_error___block_invoke(v103, v75->_previousExposureClassification);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "exposureClassification");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            __70__ENExposureDetectionDaemonSession__classifyExposureWithResult_error___block_invoke((uint64_t)v105, v105);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
        }
      }

      v9 = v110;
      goto LABEL_85;
    }
    v90 = v95;
    if ((v91 == 0) != (v95 != 0))
    {
      v96 = objc_msgSend(v91, "isEqual:", v95);

      v75 = v111;
      if ((v96 & 1) != 0)
      {
        v97 = 1;
        v8 = v109;
        v6 = v108;
        goto LABEL_79;
      }
      goto LABEL_73;
    }

    goto LABEL_69;
  }
  v6 = 1;
LABEL_89:

  return v6;
}

__CFString *__70__ENExposureDetectionDaemonSession__classifyExposureWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  if (a2)
  {
    v2 = (void *)MEMORY[0x1E0CB3938];
    v3 = a2;
    objc_msgSend(v3, "region");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%@) %@"), v4, v5, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("<none>");
  }
  return v7;
}

- (id)getAnalysisSessionAndReturnError:(id *)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ENExposureDetectionDaemonSession_getAnalysisSessionAndReturnError___block_invoke;
  block[3] = &unk_1E87D9F68;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __69__ENExposureDetectionDaemonSession_getAnalysisSessionAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getAnalysisSessionAndReturnError:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_getAnalysisSessionAndReturnError:(id *)a3
{
  id v4;

  if (-[ENExposureDetectionDaemonSession _checkFinishedAndReturnError:](self, "_checkFinishedAndReturnError:", a3))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CAA330]);
    objc_msgSend(v4, "setConfiguration:", self->_sessionExposureConfiguration);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)getBeaconCountMetricsAndReturnError:(id *)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__ENExposureDetectionDaemonSession_getBeaconCountMetricsAndReturnError___block_invoke;
  block[3] = &unk_1E87D9F68;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__ENExposureDetectionDaemonSession_getBeaconCountMetricsAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getBeaconCountMetricsAndReturnError:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_getBeaconCountMetricsAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (-[ENExposureDetectionDaemonSession _checkFinishedAndReturnError:](self, "_checkFinishedAndReturnError:"))
  {
    objc_msgSend(MEMORY[0x1E0C99D60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAdvertisementDatabaseQuerySession beaconCountMetricsWithStartDate:endDate:windowDuration:error:](self->_advertisementDatabaseQuerySession, "beaconCountMetricsWithStartDate:endDate:windowDuration:error:", v6, v5, a3, 900.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)getSummaryAndReturnError:(id *)a3
{
  NSObject *dispatchQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ENExposureDetectionDaemonSession_getSummaryAndReturnError___block_invoke;
  block[3] = &unk_1E87D9F68;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dispatchQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __61__ENExposureDetectionDaemonSession_getSummaryAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getSummaryAndReturnError:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_getSummaryAndReturnError:(id *)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  double Current;
  ENExposureCalculationSession *exposureCalculationSession;
  double v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  uint64_t j;
  const char *v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t k;
  void *v40;
  uint64_t v42;
  const char *v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  id obj;
  _QWORD v60[5];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[16];
  char v72;
  uint64_t v73;
  double *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  double *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[4];
  _BYTE v98[128];
  _QWORD v99[4];

  v99[2] = *MEMORY[0x1E0C80C00];
  -[ENExposureDetectionDaemonSession _getAnalysisSessionAndReturnError:](self, "_getAnalysisSessionAndReturnError:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v4;
  if (v4)
  {
    objc_msgSend(v4, "configuration");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = 0;
    v99[1] = 0;
    v97[0] = 0;
    v97[1] = v97;
    v97[2] = 0x2020000000;
    v97[3] = v99;
    v5 = objc_msgSend(v58, "daysSinceLastExposureThreshold");
    v93 = 0;
    v94 = &v93;
    v95 = 0x2020000000;
    v96 = 0;
    v56 = objc_alloc_init(MEMORY[0x1E0C99E00]);
    v6 = -[ENExposureDetectionDaemonSessionStatistics matchedKeyCount](self->_statistics, "matchedKeyCount");
    v89 = 0;
    v90 = &v89;
    v91 = 0x2020000000;
    v92 = 0;
    v7 = objc_msgSend(v58, "minimumRiskScore");
    objc_msgSend(v58, "minimumRiskScoreFullRange");
    v9 = v8;
    v84 = 0;
    v85 = 0;
    v86 = &v85;
    v87 = 0x2020000000;
    v88 = 0;
    v81 = 0;
    v82 = (double *)&v81;
    v83 = 0x2020000000;
    v77 = 0;
    v78 = (double *)&v77;
    v79 = 0x2020000000;
    v80 = 0;
    v73 = 0;
    v74 = (double *)&v73;
    v75 = 0x2020000000;
    v76 = 0;
    Current = CFAbsoluteTimeGetCurrent();
    exposureCalculationSession = self->_exposureCalculationSession;
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __62__ENExposureDetectionDaemonSession__getSummaryAndReturnError___block_invoke;
    v71[3] = &unk_1E87DA0E8;
    v71[6] = &v77;
    v71[7] = &v93;
    v72 = v7;
    *(double *)&v71[14] = Current;
    v71[15] = v9;
    v71[8] = &v89;
    v71[9] = &v85;
    v71[10] = &v81;
    v71[11] = &v73;
    v71[12] = v97;
    v71[13] = v5;
    v71[4] = v57;
    v71[5] = v56;
    -[ENExposureCalculationSession enumerateCachedExposureInfo:](exposureCalculationSession, "enumerateCachedExposureInfo:", v71);
    v55 = objc_alloc_init(MEMORY[0x1E0CAA338]);
    if ((objc_msgSend(v58, "flags") & 2) != 0)
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isSensitiveLoggingAllowed");

      if (v15
        && gLogCategory_ENExposureDetectionDaemonSession <= 30
        && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
      {
        v42 = objc_msgSend(v56, "count");
        v46 = v58;
        LogPrintF_safe();
      }
      objc_msgSend(v56, "allValues", v42, v46);
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v98, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v68 != v24)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            objc_msgSend(v26, "roundDurations", v45, v49);
            v61 = 0;
            v62 = &v61;
            v63 = 0x3032000000;
            v64 = __Block_byref_object_copy__2;
            v65 = __Block_byref_object_dispose__2;
            v66 = 0;
            v60[0] = MEMORY[0x1E0C809B0];
            v60[1] = 3221225472;
            v60[2] = __62__ENExposureDetectionDaemonSession__getSummaryAndReturnError___block_invoke_2;
            v60[3] = &unk_1E87DA110;
            v60[4] = &v61;
            v27 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17A7E5C](v60);
            objc_msgSend(v26, "daySummary");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, const char *, void *))v27)[2](v27, "Overall", v28);

            objc_msgSend(v26, "confirmedTestSummary");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, const char *, void *))v27)[2](v27, ", CTest", v29);

            objc_msgSend(v26, "confirmedClinicalDiagnosisSummary");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, const char *, void *))v27)[2](v27, ", CClin", v30);

            objc_msgSend(v26, "recursiveSummary");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, const char *, void *))v27)[2](v27, ", Recur", v31);

            objc_msgSend(v26, "selfReportedSummary");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, const char *, void *))v27)[2](v27, ", SelfR", v32);

            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v26) = objc_msgSend(v33, "isSensitiveLoggingAllowed");

            if ((_DWORD)v26
              && gLogCategory_ENExposureDetectionDaemonSession <= 30
              && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
            {
              v45 = v62[5];
              v49 = v58;
              LogPrintF_safe();
            }

            _Block_object_dispose(&v61, 8);
          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v98, 16);
        }
        while (v23);
      }

      v20 = obj;
      objc_msgSend(v55, "setDaySummaries:", obj);
    }
    else
    {
      v12 = v78[3];
      if (v12 <= 0.0)
        v13 = 0;
      else
        v13 = (uint64_t)((Current - v12) / 86400.0);
      NSAppendPrintF_safe();
      v16 = 0;
      for (j = 0; j != 16; j += 4)
      {
        if (j)
          v18 = ", ";
        else
          v18 = "";
        v43 = v18;
        v47 = *(unsigned int *)((char *)v99 + j);
        NSAppendPrintF_safe();
        v19 = v16;

        v16 = v19;
      }
      NSAppendPrintF_safe();
      v20 = v19;

      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs", v43, v47);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isSensitiveLoggingAllowed");

      if (v22
        && gLogCategory_ENExposureDetectionDaemonSession <= 30
        && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
      {
        v53 = v20;
        v54 = v58;
        v51 = v90[3];
        v52 = v94[3];
        v48 = v13;
        v50 = *((unsigned __int8 *)v86 + 24);
        v44 = v6;
        LogPrintF_safe();
      }
      objc_msgSend(v58, "attenuationDurationThresholds", v44, v48, v50, v51, v52, v53, v54);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v34, "count") + 1) > 3)
      {
        v37 = 4;
      }
      else
      {
        objc_msgSend(v58, "attenuationDurationThresholds");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "count");

        v37 = v36 + 1;
      }

      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE0]), "initWithCapacity:", v37);
      if (v37)
      {
        for (k = 0; k != v37; ++k)
        {
          objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", 60 * ((*((_DWORD *)v99 + k) + 59) / 0x3Cu));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setObject:atIndexedSubscript:", v40, k);

        }
      }
      objc_msgSend(v55, "setAttenuationDurations:", v38);
      objc_msgSend(v55, "setDaysSinceLastExposure:", v13);
      objc_msgSend(v55, "setMatchedKeyCount:", v6);
      objc_msgSend(v55, "setMaximumRiskScore:", *((unsigned __int8 *)v86 + 24));
      objc_msgSend(v55, "setMaximumRiskScoreFullRange:", v82[3]);
      objc_msgSend(v55, "setRiskScoreSumFullRange:", v74[3]);

    }
    _Block_object_dispose(&v73, 8);
    _Block_object_dispose(&v77, 8);
    _Block_object_dispose(&v81, 8);
    _Block_object_dispose(&v85, 8);
    _Block_object_dispose(&v89, 8);

    _Block_object_dispose(&v93, 8);
    _Block_object_dispose(v97, 8);

  }
  else
  {
    v55 = 0;
  }

  return v55;
}

void __62__ENExposureDetectionDaemonSession__getSummaryAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  double v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t j;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  int v32;
  void *v33;
  id v34;
  void *v35;
  double v36;
  id v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v40;
    v37 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v8, "date", v35, *(_QWORD *)&v36);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceReferenceDate");
        v11 = v10;
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        if (v10 > *(double *)(v12 + 24))
          *(double *)(v12 + 24) = v10;
        if (*(uint64_t *)(a1 + 104) >= 1)
        {
          objc_msgSend(v8, "date");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v15 = *(double *)(a1 + 112);
            objc_msgSend(v13, "timeIntervalSinceReferenceDate");
            v17 = v15 - v16;
            if (v17 > 9.22337204e18)
              v17 = 9.22337204e18;
            v18 = v17 >= 0.0 ? v17 / 86400.0 : 0.0;
            if (*(_QWORD *)(a1 + 104) < (uint64_t)v18)
            {
              ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

              goto LABEL_47;
            }
          }

        }
        v38 = 0;
        objc_msgSend(*(id *)(a1 + 32), "estimateRiskWithExposureInfo:referenceTime:transmissionRiskLevel:skip:", v8, 0, &v38, *(double *)(a1 + 112));
        if (!v38)
        {
          v20 = v19;
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isSensitiveLoggingAllowed");

          if (v22
            && gLogCategory_ENExposureDetectionDaemonSession <= 10
            && (gLogCategory_ENExposureDetectionDaemonSession != -1 || _LogCategory_Initialize()))
          {
            v36 = v20;
            v35 = v8;
            LogPrintF_safe();
          }
          if (v20 <= 255.0)
            v23 = v20;
          else
            v23 = 255.0;
          if (v23 < 0.0)
            v23 = 0.0;
          v24 = (int)v23;
          if (*(unsigned __int8 *)(a1 + 128) <= (int)v23 && v20 >= *(double *)(a1 + 120))
          {
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            if (*(unsigned __int8 *)(v25 + 24) < v24)
              *(_BYTE *)(v25 + 24) = v24;
            v26 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
            if (v20 > *(double *)(v26 + 24))
              *(double *)(v26 + 24) = v20;
            *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v20
                                                                        + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88)
                                                                                                + 8)
                                                                                    + 24);
            objc_msgSend(v8, "attenuationDurations", v35, *(_QWORD *)&v36);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v27, "count") >= 4)
            {
              for (j = 0; j != 4; ++j)
              {
                v29 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + 4 * j);
                if (v29 <= 0x707)
                {
                  objc_msgSend(v27, "objectAtIndexedSubscript:", j);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "unsignedIntValue") + v29;

                  if (v31 >= 0x708)
                    v32 = 1800;
                  else
                    v32 = v31;
                  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + 4 * j) = v32;
                }
              }
            }
            objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", (v11 / 86400.0));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v33);
            v34 = (id)objc_claimAutoreleasedReturnValue();
            if (!v34)
            {
              v34 = objc_alloc_init(MEMORY[0x1E0CAA310]);
              objc_msgSend(v34, "setDate:", v9);
              objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v34, v33);
            }
            objc_msgSend(*(id *)(a1 + 32), "updateDaySummary:exposureInfo:score:", v34, v8, v20);

            v3 = v37;
          }
          else
          {
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          }
        }
LABEL_47:

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v5);
  }

}

void __62__ENExposureDetectionDaemonSession__getSummaryAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;
  id obj;

  if (a3)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    obj = *(id *)(v3 + 40);
    v4 = a3;
    objc_msgSend(v4, "scoreSum");
    objc_msgSend(v4, "maximumScore");
    objc_msgSend(v4, "weightedDurationSum");

    NSAppendPrintF_safe();
    objc_storeStrong((id *)(v3 + 40), obj);
  }
}

- (id)_prepareExposureCalculationSessionWithError:(id *)a3
{
  ENExposureCalculationSession *exposureCalculationSession;
  ENExposureCalculationSession **p_exposureCalculationSession;
  ENExposureCalculationSession *v5;
  ENExposureConfiguration *v8;
  ENAdvertisementDatabaseQuerySession *v9;
  ENAdvertisementDatabaseQuerySession *v10;
  ENExposureCalculationSession *v11;
  uint64_t v12;
  ENExposureCalculationSession *v13;
  double v14;
  double v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v21;

  p_exposureCalculationSession = &self->_exposureCalculationSession;
  exposureCalculationSession = self->_exposureCalculationSession;
  if (!exposureCalculationSession)
  {
    if (!-[ENExposureDetectionDaemonSession _checkPreparedAndReturnError:](self, "_checkPreparedAndReturnError:"))
    {
      v5 = 0;
      return v5;
    }
    v8 = self->_sessionExposureConfiguration;
    if (!v8)
    {
      if (a3)
      {
        ENErrorF();
        v5 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }
      goto LABEL_18;
    }
    v9 = self->_advertisementDatabaseQuerySession;
    v10 = v9;
    if (v9)
    {
      v21 = -[ENAdvertisementDatabaseQuerySession storedAdvertisementCount](v9, "storedAdvertisementCount");
      if (!self->_useCache
        || -[ENExposureDatabase getAdvertisementCount:error:](self->_exposureDatabase, "getAdvertisementCount:error:", &v21, a3))
      {
        v11 = [ENExposureCalculationSession alloc];
        v12 = -[ENAdvertisementDatabaseQuerySession attenuationThreshold](v10, "attenuationThreshold");
        v13 = -[ENExposureCalculationSession initWithAttenuationThreshold:capacity:](v11, "initWithAttenuationThreshold:capacity:", v12, v21);
        if (v13)
        {
          -[ENRegionServerConfiguration rpiDuplicateAdvertisementTolerance](self->_regionServerConfiguration, "rpiDuplicateAdvertisementTolerance");
          if (v14 == 0.0)
            v15 = 1200.0;
          else
            v15 = v14;
          v16 = -[ENRegionServerConfiguration numberOfAdvSamplesForRPIThreshold](self->_regionServerConfiguration, "numberOfAdvSamplesForRPIThreshold");
          if (v16 <= 1)
            v17 = 1;
          else
            v17 = v16;
          -[ENExposureCalculationSession setAllowRecursiveReportType:](v13, "setAllowRecursiveReportType:", (-[ENExposureConfiguration flags](v8, "flags") >> 2) & 1);
          -[ENExposureCalculationSession setExposureConfiguration:](v13, "setExposureConfiguration:", v8);
          objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithDouble:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENExposureCalculationSession setAllowedRPIBroadcastDuration:](v13, "setAllowedRPIBroadcastDuration:", v18);

          objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[ENExposureCalculationSession setAdvertisementSampleCountThreshold:](v13, "setAdvertisementSampleCountThreshold:", v19);

          -[ENExposureCalculationSession setCacheExposureInfo:](v13, "setCacheExposureInfo:", 1);
          -[ENExposureCalculationSession setCacheExposureWindows:](v13, "setCacheExposureWindows:", 1);
          objc_storeStrong((id *)p_exposureCalculationSession, v13);
          v5 = self->_exposureCalculationSession;
        }
        else if (a3)
        {
          ENErrorF();
          v5 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5 = 0;
        }

        goto LABEL_17;
      }
    }
    else if (a3)
    {
      ENErrorF();
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:
      return v5;
    }
    v5 = 0;
    goto LABEL_17;
  }
  v5 = exposureCalculationSession;
  return v5;
}

- (void)_updateStatisticsWithHandler:(id)a3
{
  ENExposureDetectionDaemonSessionStatistics *v4;
  ENExposureDetectionDaemonSessionStatistics *v5;
  uint64_t v6;
  ENExposureDetectionDaemonSessionStatistics *statistics;
  ENExposureDetectionDaemonSessionStatistics *v8;
  void (**v9)(id, ENExposureDetectionDaemonSessionStatistics *);

  v9 = (void (**)(id, ENExposureDetectionDaemonSessionStatistics *))a3;
  v4 = self->_statistics;
  v5 = v4;
  if (self->_shouldCopyStatistics)
  {
    v6 = -[ENExposureDetectionDaemonSessionStatistics copy](v4, "copy");

    v5 = (ENExposureDetectionDaemonSessionStatistics *)v6;
  }
  v9[2](v9, v5);
  statistics = self->_statistics;
  self->_statistics = v5;
  v8 = v5;

  self->_shouldCopyStatistics = 0;
  -[ENExposureDetectionHistorySession setMatchCount:](self->_historySession, "setMatchCount:", -[ENExposureDetectionDaemonSessionStatistics matchedKeyCount](v8, "matchedKeyCount"));
  -[ENExposureDetectionHistorySession setFileCount:](self->_historySession, "setFileCount:", -[ENExposureDetectionDaemonSessionStatistics processedFileCount](v8, "processedFileCount"));

}

- (ENExposureDetectionDaemonSessionStatistics)statistics
{
  self->_shouldCopyStatistics = 1;
  return self->_statistics;
}

- (void)_signpostBegin
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t signpostID;
  uint8_t v7[16];

  if (!self->_signpostID)
  {
    v3 = LogCategoryCopyOSLogHandle();
    self->_signpostID = os_signpost_id_generate(v3);
    v4 = v3;
    v5 = v4;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CC1C7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "ExposureDetectionSession", ", v7, 2u);
    }

  }
}

- (void)_signpostEnd
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t signpostID;
  uint8_t v6[16];

  if (self->_signpostID)
  {
    v3 = LogCategoryCopyOSLogHandle();
    v4 = v3;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CC1C7000, v4, OS_SIGNPOST_INTERVAL_END, signpostID, "ExposureDetectionSession", ", v6, 2u);
    }

    self->_signpostID = 0;
  }
}

- (id)description
{
  objc_class *v2;
  id v3;
  void *v5;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v3 = 0;

  return v3;
}

- (BOOL)skipFileSigningVerification
{
  return self->_skipFileSigningVerification;
}

- (void)setSkipFileSigningVerification:(BOOL)a3
{
  self->_skipFileSigningVerification = a3;
}

- (ENExposureCalculationSession)exposureCalculationSession
{
  return self->_exposureCalculationSession;
}

- (ENAdvertisementDatabaseQuerySession)advertisementDatabaseQuerySession
{
  return self->_advertisementDatabaseQuerySession;
}

- (void)setAdvertisementDatabaseQuerySession:(id)a3
{
  objc_storeStrong((id *)&self->_advertisementDatabaseQuerySession, a3);
}

- (ENXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (ENExposureConfiguration)clientExposureConfiguration
{
  return self->_clientExposureConfiguration;
}

- (void)setClientExposureConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_clientExposureConfiguration, a3);
}

- (ENExposureDatabase)exposureDatabase
{
  return self->_exposureDatabase;
}

- (void)setExposureDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_exposureDatabase, a3);
}

- (ENExposureClassification)previousExposureClassification
{
  return self->_previousExposureClassification;
}

- (void)setPreviousExposureClassification:(id)a3
{
  objc_storeStrong((id *)&self->_previousExposureClassification, a3);
}

- (ENRegionConfiguration)regionConfiguration
{
  return self->_regionConfiguration;
}

- (void)setRegionConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (ENRegionServerConfiguration)regionServerConfiguration
{
  return self->_regionServerConfiguration;
}

- (void)setRegionServerConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (ENRegionServerExposureConfiguration)serverExposureConfiguration
{
  return self->_serverExposureConfiguration;
}

- (void)setServerExposureConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDate)sessionDate
{
  return self->_sessionDate;
}

- (void)setSessionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (ENExposureDetectionHistorySession)historySession
{
  return self->_historySession;
}

- (ENExposureConfiguration)sessionExposureConfiguration
{
  return self->_sessionExposureConfiguration;
}

- (unint64_t)tekMatchBatchSize
{
  return self->_tekMatchBatchSize;
}

- (void)setTekMatchBatchSize:(unint64_t)a3
{
  self->_tekMatchBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionExposureConfiguration, 0);
  objc_storeStrong((id *)&self->_historySession, 0);
  objc_storeStrong((id *)&self->_sessionDate, 0);
  objc_storeStrong((id *)&self->_serverExposureConfiguration, 0);
  objc_storeStrong((id *)&self->_regionServerConfiguration, 0);
  objc_storeStrong((id *)&self->_regionConfiguration, 0);
  objc_storeStrong((id *)&self->_previousExposureClassification, 0);
  objc_storeStrong((id *)&self->_exposureDatabase, 0);
  objc_storeStrong((id *)&self->_clientExposureConfiguration, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_advertisementDatabaseQuerySession, 0);
  objc_storeStrong((id *)&self->_exposureCalculationSession, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
