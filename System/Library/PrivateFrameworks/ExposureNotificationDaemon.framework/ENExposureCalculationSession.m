@implementation ENExposureCalculationSession

- (ENExposureCalculationSession)initWithAttenuationThreshold:(unsigned __int8)a3 capacity:(unsigned int)a4
{
  ENExposureCalculationSession *v5;
  ENExposureCalculationSession *v6;
  unsigned int v7;
  uint64_t v8;
  OS_os_transaction *transaction;
  $7ADA1EF68C37A8F83EC2BAFA30593E49 *v10;
  $6B14AE857B43CEDA041F2BA42EED81B6 *v11;
  NSNumber *allowedRPIBroadcastDuration;
  NSNumber *advertisementSampleCountThreshold;
  ENExposureCalculationSession *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)ENExposureCalculationSession;
  v5 = -[ENExposureCalculationSession init](&v16, sel_init, a3);
  v6 = v5;
  if (!v5)
    goto LABEL_8;
  if (a4 >= 0xDF638)
    v7 = 915000;
  else
    v7 = a4;
  v5->_scanInstanceBufferSize = v7;
  v8 = os_transaction_create();
  transaction = v6->_transaction;
  v6->_transaction = (OS_os_transaction *)v8;

  v6->_cachedExposureWindowMetadataCount = 0;
  v10 = ($7ADA1EF68C37A8F83EC2BAFA30593E49 *)malloc_type_calloc(v6->_scanInstanceBufferSize, 0x18uLL, 0x100004034E20058uLL);
  v6->_exposureWindowMetadataBuffer = v10;
  if (!v10)
  {
    if (gLogCategory__ENExposureCalculationSession > 90
      || gLogCategory__ENExposureCalculationSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
LABEL_14:
    LogPrintF_safe();
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  v6->_cachedExposureWindowCount = 0;
  v11 = ($6B14AE857B43CEDA041F2BA42EED81B6 *)malloc_type_calloc(v6->_scanInstanceBufferSize, 0x10uLL, 0x1000040451B5BE8uLL);
  v6->_scanInstanceBuffer = v11;
  if (!v11)
  {
    if (gLogCategory__ENExposureCalculationSession > 90
      || gLogCategory__ENExposureCalculationSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  *(_DWORD *)v6->_attenuationDurationThresholds = -47566;
  allowedRPIBroadcastDuration = v6->_allowedRPIBroadcastDuration;
  v6->_allowedRPIBroadcastDuration = (NSNumber *)&unk_1E87EE228;

  advertisementSampleCountThreshold = v6->_advertisementSampleCountThreshold;
  v6->_advertisementSampleCountThreshold = (NSNumber *)&unk_1E87EE198;

LABEL_8:
  v14 = v6;
LABEL_19:

  return v14;
}

- (void)dealloc
{
  void *v3;
  int v4;
  id v5;
  OS_os_transaction *transaction;
  objc_super v7;

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSensitiveLoggingAllowed");

  if (v4
    && gLogCategory_ENExposureCalculationSession <= 50
    && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
  {
    -[ENExposureConfiguration description](self->_exposureConfiguration, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "UTF8String");
    LogPrintF_safe();

  }
  free(self->_exposureWindowMetadataBuffer);
  free(self->_scanInstanceBuffer);
  transaction = self->_transaction;
  self->_transaction = 0;

  v7.receiver = self;
  v7.super_class = (Class)ENExposureCalculationSession;
  -[ENExposureCalculationSession dealloc](&v7, sel_dealloc);
}

- (void)setExposureConfiguration:(id)a3
{
  ENExposureConfiguration *v4;
  ENExposureConfiguration *exposureConfiguration;
  void *v6;
  int v7;
  id v8;
  unsigned __int8 v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *attenuationDurationThresholds;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v4 = (ENExposureConfiguration *)objc_msgSend(a3, "copy");
  exposureConfiguration = self->_exposureConfiguration;
  self->_exposureConfiguration = v4;

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSensitiveLoggingAllowed");

  if (v7
    && gLogCategory_ENExposureCalculationSession <= 50
    && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
  {
    -[ENExposureConfiguration description](self->_exposureConfiguration, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v8, "UTF8String");
    LogPrintF_safe();

  }
  -[ENExposureConfiguration attenuationDurationThresholds](self->_exposureConfiguration, "attenuationDurationThresholds", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v21, "count");
  if ((v9 & 0xFE) == 2)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSensitiveLoggingAllowed");

    if (v11
      && gLogCategory_ENExposureCalculationSession <= 50
      && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(", "));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v14 = v9;
    v12 = v21;
    if (v9)
    {
      v15 = 0;
      attenuationDurationThresholds = self->_attenuationDurationThresholds;
      do
      {
        objc_msgSend(v12, "objectAtIndex:", v15, v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "unsignedIntValue");

        v12 = v21;
        attenuationDurationThresholds[v15++] = v18;
      }
      while (v14 != v15);
    }
  }
  else
  {
    v12 = v21;
    if (gLogCategory__ENExposureCalculationSession <= 90)
    {
      if (gLogCategory__ENExposureCalculationSession != -1 || (v13 = _LogCategory_Initialize(), v12 = v21, v13))
      {
        LogPrintF_safe();
        v12 = v21;
      }
    }
  }

}

- (unsigned)weightedAttenuationValueForDurations:(unsigned int *)a3
{
  void *v4;
  id v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  double v9;
  unsigned int v10;
  void *v11;
  double v12;
  double v13;
  unsigned int v14;
  double v15;
  double v16;
  int v17;
  uint64_t v19;

  -[ENExposureConfiguration attenuationLevelValues](self->_exposureConfiguration, "attenuationLevelValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 8)
  {
    v5 = v4;
  }
  else
  {
    if (gLogCategory__ENExposureCalculationSession <= 90
      && (gLogCategory__ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
    {
      v19 = objc_msgSend(v4, "count");
      LogPrintF_safe();
    }
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
    v6 = 8;
    do
    {
      objc_msgSend(v5, "addObject:", &unk_1E87EE238, v19);
      --v6;
    }
    while (v6);

  }
  v7 = 0;
  v8 = 0;
  v9 = 0.0;
  do
  {
    v10 = a3[v7];
    objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12 * (double)v10;

    if (v13 == 0.0)
      v14 = 0;
    else
      v14 = v10;
    v8 += v14;
    v15 = -0.0;
    if (v13 != 0.0)
      v15 = v13;
    v9 = v9 + v15;
    ++v7;
  }
  while (v7 != 8);
  if (v8)
    v9 = round(v9 / (double)v8);
  v16 = 255.0;
  if (v9 <= 255.0)
    v16 = v9;
  v17 = (int)v16;

  return v17;
}

- (id)exposureInfoForExposureWindows:(id)a3 key:(id)a4
{
  id v6;
  unsigned int v7;
  unsigned __int8 *attenuationDurationThresholds;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  uint64_t j;
  int v26;
  void *v27;
  unsigned int v28;
  int v29;
  void *v30;
  id v31;
  ENExposureCalculationSession *v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _OWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = a4;
  obj = v6;
  v50[0] = 0;
  v50[1] = 0;
  memset(v49, 0, sizeof(v49));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v37 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  v33 = self;
  v7 = 0;
  if (v37)
  {
    v36 = *(_QWORD *)v44;
    attenuationDurationThresholds = self->_attenuationDurationThresholds;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(v6);
        v38 = v9;
        v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v9);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v10, "scanInstances", v33);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v40 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              v17 = (unsigned __int16)objc_msgSend(v16, "secondsSinceLastScan");
              v7 += v17;
              v18 = objc_msgSend(v16, "typicalAttenuation");
              v19 = 0;
              while (v18 > attenuationDurationThresholds[v19])
              {
                if (++v19 == 4)
                  goto LABEL_16;
              }
              *((_DWORD *)v50 + v19) += v17;
LABEL_16:
              v20 = &byte_1CC251340;
              v21 = 28;
              while (1)
              {
                v22 = *v20++;
                if (v18 <= v22)
                  break;
                v21 -= 4;
                if (v21 == -4)
                  goto LABEL_21;
              }
              *(_DWORD *)((char *)v49 + v21) += v17;
LABEL_21:
              ;
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v13);
        }

        v9 = v38 + 1;
      }
      while (v38 + 1 != v37);
      v37 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v37);
  }
  v23 = -[ENExposureCalculationSession weightedAttenuationValueForDurations:](v33, "weightedAttenuationValueForDurations:", v49, v33);
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  for (j = 0; j != 16; j += 4)
  {
    if (*(_DWORD *)((char *)v50 + j) >= 0xFFFFu)
      v26 = 0xFFFF;
    else
      v26 = *(_DWORD *)((char *)v50 + j);
    *(_DWORD *)((char *)v50 + j) = v26;
    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v27);

  }
  if (v7 >= 0xFFFF)
    v28 = 0xFFFF;
  else
    v28 = v7;
  v29 = objc_msgSend(v34, "rollingStartNumber");
  objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", (double)(86400 * (600 * v29 / 0x15180u)));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc_init(MEMORY[0x1E0CAA340]);
  objc_msgSend(v31, "setDate:", v30);
  objc_msgSend(v31, "setAttenuationValue:", v23);
  objc_msgSend(v31, "setDuration:", (double)v28);
  objc_msgSend(v31, "setAttenuationDurations:", v24);
  objc_msgSend(v31, "setTransmissionRiskLevel:", objc_msgSend(v34, "transmissionRiskLevel"));
  objc_msgSend(v31, "setDiagnosisReportType:", objc_msgSend(v34, "diagnosisReportType"));
  objc_msgSend(v31, "setDaysSinceOnsetOfSymptoms:", objc_msgSend(v34, "daysSinceOnsetOfSymptoms"));

  return v31;
}

- (id)exposureInfosForEachExposureWindow:(id)a3 key:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  uint64_t j;
  int v24;
  void *v25;
  unsigned int v26;
  int v27;
  void *v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  void *v34;
  id v35;
  id obj;
  uint64_t v37;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _OWORD v53[2];
  _QWORD v54[2];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v40 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE0], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v5;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v41)
  {
    v37 = *(_QWORD *)v49;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v49 != v37)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v6);
        v54[0] = 0;
        v54[1] = 0;
        memset(v53, 0, sizeof(v53));
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v42 = v7;
        v43 = v6;
        objc_msgSend(v7, "scanInstances");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v45;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v45 != v12)
                objc_enumerationMutation(v8);
              v14 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              v15 = (unsigned __int16)objc_msgSend(v14, "secondsSinceLastScan");
              v11 += v15;
              v16 = objc_msgSend(v14, "typicalAttenuation");
              v17 = 0;
              while (v16 > self->_attenuationDurationThresholds[v17])
              {
                if (++v17 == 4)
                  goto LABEL_16;
              }
              *((_DWORD *)v54 + v17) += v15;
LABEL_16:
              v18 = &byte_1CC251340;
              v19 = 28;
              while (1)
              {
                v20 = *v18++;
                if (v16 <= v20)
                  break;
                v19 -= 4;
                if (v19 == -4)
                  goto LABEL_21;
              }
              *(_DWORD *)((char *)v53 + v19) += v15;
LABEL_21:
              ;
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v10);
        }
        else
        {
          v11 = 0;
        }

        v21 = -[ENExposureCalculationSession weightedAttenuationValueForDurations:](self, "weightedAttenuationValueForDurations:", v53);
        v22 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
        for (j = 0; j != 16; j += 4)
        {
          if (*(_DWORD *)((char *)v54 + j) >= 0xFFFFu)
            v24 = 0xFFFF;
          else
            v24 = *(_DWORD *)((char *)v54 + j);
          *(_DWORD *)((char *)v54 + j) = v24;
          objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInt:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v25);

        }
        if (v11 >= 0xFFFF)
          v26 = 0xFFFF;
        else
          v26 = v11;
        v27 = objc_msgSend(v40, "rollingStartNumber");
        objc_msgSend(MEMORY[0x1E0C99D60], "dateWithTimeIntervalSince1970:", (double)(86400 * (600 * v27 / 0x15180u)));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_alloc_init(MEMORY[0x1E0CAA340]);
        objc_msgSend(v29, "setDate:", v28);
        objc_msgSend(v29, "setAttenuationValue:", v21);
        objc_msgSend(v29, "setDuration:", (double)v26);
        objc_msgSend(v29, "setAttenuationDurations:", v22);
        objc_msgSend(v29, "setTransmissionRiskLevel:", objc_msgSend(v40, "transmissionRiskLevel"));
        objc_msgSend(v29, "setDiagnosisReportType:", objc_msgSend(v40, "diagnosisReportType"));
        objc_msgSend(v29, "setDaysSinceOnsetOfSymptoms:", objc_msgSend(v40, "daysSinceOnsetOfSymptoms"));
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isSensitiveLoggingAllowed");

        if ((v31 & 1) != 0
          && gLogCategory_ENExposureCalculationSession <= 10
          && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
        {
          v34 = v42;
          v35 = v29;
          LogPrintF_safe();
        }
        objc_msgSend(v39, "addObject:", v29, v34, v35);

        v6 = v43 + 1;
      }
      while (v43 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v41);
  }

  v32 = (void *)objc_msgSend(v39, "copy");
  return v32;
}

- (id)exposureInfoForMatchedAdvertisements:(id)a3 key:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[ENExposureCalculationSession exposureWindowsForMatchedAdvertisements:key:options:](self, "exposureWindowsForMatchedAdvertisements:key:options:", a3, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ENExposureCalculationSession exposureInfoForExposureWindows:key:](self, "exposureInfoForExposureWindows:key:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)cachedExposureInfoCount
{
  return self->_cachedExposureWindowMetadataCount;
}

- (void)enumerateCachedExposureInfo:(id)a3
{
  -[ENExposureCalculationSession enumerateCachedExposureInfo:withBatchSize:](self, "enumerateCachedExposureInfo:withBatchSize:", a3, 1024);
}

- (void)enumerateCachedExposureInfo:(id)a3 withBatchSize:(unsigned int)a4
{
  -[ENExposureCalculationSession enumerateCachedExposureInfo:inRange:withBatchSize:](self, "enumerateCachedExposureInfo:inRange:withBatchSize:", a3, 0, self->_cachedExposureWindowMetadataCount, *(_QWORD *)&a4);
}

- (void)enumerateCachedExposureInfo:(id)a3 inRange:(_NSRange)a4 withBatchSize:(unsigned int)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger cachedScanInstanceCount;
  NSUInteger v11;
  $6B14AE857B43CEDA041F2BA42EED81B6 *scanInstanceBuffer;
  unsigned int var0;
  uint64_t v14;
  NSUInteger cachedExposureWindowMetadataCount;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  unsigned int *v20;
  unsigned int v21;
  $7ADA1EF68C37A8F83EC2BAFA30593E49 *v22;
  int64_t var1;
  uint64_t var2;
  uint64_t var3;
  unsigned __int8 var4;
  uint64_t var5;
  int v28;
  uint64_t *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SEL v36;
  NSUInteger v37;
  NSUInteger v38;
  void (**v39)(id, id, _QWORD);
  void *context;
  NSUInteger v41;
  id v42;
  unsigned int v43;
  __int128 v44;
  char v45;
  char v46;
  unsigned __int8 v47;
  char v48;
  int v49;

  length = a4.length;
  location = a4.location;
  v39 = (void (**)(id, id, _QWORD))a3;
  if (length)
  {
    cachedScanInstanceCount = self->_cachedScanInstanceCount;
    if (location >= cachedScanInstanceCount)
    {
      objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENExposureCalculationSession.m"), 599, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.location < _cachedScanInstanceCount"));

      cachedScanInstanceCount = self->_cachedScanInstanceCount;
    }
    v36 = a2;
    v11 = 0;
    if ((_DWORD)cachedScanInstanceCount)
    {
      scanInstanceBuffer = self->_scanInstanceBuffer;
      while (1)
      {
        var0 = scanInstanceBuffer->var0;
        scanInstanceBuffer = ($6B14AE857B43CEDA041F2BA42EED81B6 *)((char *)scanInstanceBuffer + 16);
        if (location <= var0)
          break;
        if (cachedScanInstanceCount == ++v11)
        {
          v11 = cachedScanInstanceCount;
          break;
        }
      }
    }
    v42 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
    v38 = location + length;
    if (location < location + length)
    {
      v37 = a5;
      do
      {
        v14 = MEMORY[0x1D17A7CB8]();
        cachedExposureWindowMetadataCount = self->_cachedExposureWindowMetadataCount;
        context = (void *)v14;
        v41 = location + v37;
        if (location + v37 <= cachedExposureWindowMetadataCount)
          v16 = v37;
        else
          v16 = cachedExposureWindowMetadataCount - location;
        v17 = v16 + location;
        if (location >= v16 + location)
        {
          v18 = v11;
        }
        else
        {
          v18 = v11;
          do
          {
            v19 = self->_cachedScanInstanceCount;
            if (v11 < v19)
            {
              v20 = &self->_scanInstanceBuffer->var0 + 4 * v11;
              v18 = v11;
              while (1)
              {
                v21 = *v20;
                v20 += 4;
                if (location != v21)
                  break;
                if (v19 == ++v18)
                {
                  v18 = self->_cachedScanInstanceCount;
                  break;
                }
              }
            }
            if (location >= self->_cachedExposureWindowMetadataCount)
            {
              objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v36, self, CFSTR("ENExposureCalculationSession.m"), 626, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadataIndex < _cachedExposureWindowMetadataCount"));

            }
            v22 = &self->_exposureWindowMetadataBuffer[location];
            var1 = v22->var1;
            var2 = v22->var2;
            var3 = v22->var3;
            var4 = v22->var4;
            var5 = v22->var5;
            v28 = *(_DWORD *)(&v22->var5 + 1);
            v29 = (uint64_t *)((char *)self->_scanInstanceBuffer + 16 * v11);
            *(_QWORD *)&v44 = *(_QWORD *)&v22->var0;
            v43 = v44;
            *((_QWORD *)&v44 + 1) = var1;
            v45 = var2;
            v46 = var3;
            v47 = var4;
            v48 = var5;
            v49 = v28;
            exposureWindowsForScanInstances(v29, (unsigned __int16)(v18 - v11), &v44, 0, 0, 1800.0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_alloc_init(MEMORY[0x1E0CAA3D0]);
            objc_msgSend(v31, "setRollingStartNumber:", v43);
            objc_msgSend(v31, "setTransmissionRiskLevel:", var2);
            objc_msgSend(v31, "setDaysSinceOnsetOfSymptoms:", var1);
            objc_msgSend(v31, "setDiagnosisReportType:", var3);
            objc_msgSend(v31, "setVariantOfConcernType:", var5);
            -[ENExposureCalculationSession exposureConfiguration](self, "exposureConfiguration");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(var3) = objc_msgSend(v32, "flags");

            if ((var3 & 2) != 0)
            {
              if (gLogCategory__ENExposureCalculationSession <= 50
                && (gLogCategory__ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              -[ENExposureCalculationSession exposureInfosForEachExposureWindow:key:](self, "exposureInfosForEachExposureWindow:key:", v30, v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObjectsFromArray:", v33);
            }
            else
            {
              -[ENExposureCalculationSession exposureInfoForExposureWindows:key:](self, "exposureInfoForExposureWindows:key:", v30, v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObject:", v33);
            }

            ++location;
            v11 = v18;
          }
          while (location < v17);
        }
        v39[2](v39, v42, 0);
        objc_msgSend(v42, "removeAllObjects");
        objc_autoreleasePoolPop(context);
        location = v41;
        v11 = v18;
      }
      while (v41 < v38);
    }

  }
}

- (id)filterAdvertisements:(id)a3 fromKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  __int128 *v12;
  __int128 *v13;
  uint64_t v14;
  id v15;
  __int128 *v16;
  __int128 v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  int v40;
  void *v41;
  int v42;
  uint64_t v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  void *v56;
  int v57;
  id v58;
  float v59;
  float v60;
  double v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  int v77;
  void *v78;
  int v79;
  void *v80;
  int v81;
  uint64_t v83;
  double v84;
  uint64_t v85;
  ENExposureCalculationSession *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id obj;
  id obja;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  __int128 v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "rollingPeriod");
  v9 = (void *)v8;
  if (v8 >= 0x91)
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSensitiveLoggingAllowed");

    if (v11
      && gLogCategory_ENExposureCalculationSession <= 50
      && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "isRPILoggingAllowed");

    if (!v81
      || gLogCategory_ENExposureCalculationSession > 50
      || gLogCategory_ENExposureCalculationSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_117;
    }
LABEL_113:
    LogPrintF_safe();
LABEL_117:
    v90 = (id)MEMORY[0x1E0C9AA58];
    goto LABEL_118;
  }
  v12 = (__int128 *)malloc_type_malloc((16 * v8), 0xADD90807uLL);
  if (!v12)
  {
    if (gLogCategory__ENExposureCalculationSession > 90
      || gLogCategory__ENExposureCalculationSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_117;
    }
    goto LABEL_113;
  }
  v13 = v12;
  v86 = self;
  v14 = v9;
  v88 = v7;
  objc_msgSend(v7, "deriveRollingProximityIdentifiersWithBuffer:count:", v12, v9);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  obj = v9;
  if ((_DWORD)v9)
  {
    v16 = v13;
    do
    {
      v17 = *v16++;
      v109 = v17;
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D58]), "initWithBytes:length:", &v109, 16);
      objc_msgSend(v15, "addObject:", v18);

      --v14;
    }
    while (v14);
  }
  v93 = v15;
  free(v13);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v87 = v6;
  v20 = v6;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v102, v108, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v103 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
        objc_msgSend(v25, "rpi", v83);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v93, "containsObject:", v26);

        if ((v27 & 1) != 0)
        {
          objc_msgSend(v19, "addObject:", v25);
        }
        else
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isSensitiveLoggingAllowed");

          if (v29
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isRPILoggingAllowed");

          if (v31
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            v83 = (uint64_t)obj;
            LogPrintF_safe();
          }
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v102, v108, 16);
    }
    while (v22);
  }

  v89 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  obja = v19;
  v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v99;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v99 != v34)
          objc_enumerationMutation(obja);
        v36 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
        objc_msgSend(v36, "decryptedMetadataForTemporaryExposureKey:", v88, v83, v85);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "saturated");
        v39 = objc_msgSend(v37, "attenuationForRSSI:saturated:", objc_msgSend(v36, "typicalRSSI"), v38);
        v40 = objc_msgSend(v37, "attenuationForRSSI:saturated:", objc_msgSend(v36, "maxRSSI"), v38);
        if ((int)objc_msgSend(v37, "txPower") >= -60 && (int)objc_msgSend(v37, "txPower") < 21)
        {
          if (v39)
          {
            if (v40)
            {
              v43 = objc_msgSend(v36, "counter");
              v44 = -[NSNumber unsignedShortValue](v86->_advertisementSampleCountThreshold, "unsignedShortValue");
              if (v43 >= v44)
              {
                objc_msgSend(v89, "addObject:", v36);
              }
              else
              {
                v45 = v44;
                +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v46, "isSensitiveLoggingAllowed");

                if (v47
                  && gLogCategory_ENExposureCalculationSession <= 50
                  && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
                {
                  v83 = v43;
                  v85 = v45;
LABEL_56:
                  LogPrintF_safe();
                }
              }
            }
            else
            {
              +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v52, "isSensitiveLoggingAllowed");

              if (v53
                && gLogCategory_ENExposureCalculationSession <= 50
                && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = objc_msgSend(v56, "isRPILoggingAllowed");

              if (v57
                && gLogCategory_ENExposureCalculationSession <= 50
                && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
              {
                v83 = 0;
                goto LABEL_56;
              }
            }
          }
          else
          {
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "isSensitiveLoggingAllowed");

            if (v49
              && gLogCategory_ENExposureCalculationSession <= 50
              && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "isRPILoggingAllowed");

            if (v55
              && gLogCategory_ENExposureCalculationSession <= 50
              && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
            {
              v83 = 0;
              goto LABEL_56;
            }
          }
        }
        else
        {
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "isSensitiveLoggingAllowed");

          if (v42
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "isRPILoggingAllowed");

          if (v51
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            v83 = (int)objc_msgSend(v37, "txPower");
            goto LABEL_56;
          }
        }

      }
      v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v98, v107, 16);
    }
    while (v33);
  }

  v58 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  v90 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  -[NSNumber floatValue](v86->_allowedRPIBroadcastDuration, "floatValue");
  if (v59 >= 1200.0)
  {
    v61 = 1200.0;
  }
  else
  {
    -[NSNumber floatValue](v86->_allowedRPIBroadcastDuration, "floatValue");
    v61 = v60;
  }
  objc_msgSend(v89, "sortedArrayUsingComparator:", &__block_literal_global_7, v83);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v95;
    do
    {
      for (k = 0; k != v64; ++k)
      {
        if (*(_QWORD *)v95 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * k);
        objc_msgSend(v67, "rpi", *(_QWORD *)&v84);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKey:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v69)
        {
          v70 = (void *)MEMORY[0x1E0C99D60];
          objc_msgSend(v67, "timestamp");
          objc_msgSend(v70, "dateWithTimeIntervalSince1970:");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "rpi");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setObject:forKey:", v69, v71);

        }
        v72 = (void *)MEMORY[0x1E0C99D60];
        objc_msgSend(v67, "timestamp");
        objc_msgSend(v72, "dateWithTimeIntervalSince1970:");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "timeIntervalSinceDate:", v69);
        if (v74 <= v61)
        {
          objc_msgSend(v90, "addObject:", v67);
        }
        else
        {
          v75 = v74;
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "isSensitiveLoggingAllowed");

          if (v77
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "isRPILoggingAllowed");

          if (v79
            && gLogCategory_ENExposureCalculationSession <= 50
            && (gLogCategory_ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            v84 = v75;
            LogPrintF_safe();
          }
        }

      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v94, v106, 16);
    }
    while (v64);
  }

  v6 = v87;
  v7 = v88;
LABEL_118:

  return v90;
}

- ($6B14AE857B43CEDA041F2BA42EED81B6)scanInstanceFromAdvertisement:(SEL)a3 key:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  $6B14AE857B43CEDA041F2BA42EED81B6 *v11;

  v6 = a4;
  objc_msgSend(v6, "decryptedMetadataForTemporaryExposureKey:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "saturated");
  objc_msgSend(v7, "attenuationForRSSI:saturated:", objc_msgSend(v6, "typicalRSSI"), v8);
  objc_msgSend(v7, "attenuationForRSSI:saturated:", objc_msgSend(v6, "maxRSSI"), v8);
  LODWORD(v11) = 0;
  objc_msgSend(v6, "timestamp");
  HIDWORD(v11) = v9;
  objc_msgSend(v6, "scanInterval");

  return v11;
}

- (id)exposureWindowsForMatchedAdvertisements:(id)a3 key:(id)a4
{
  return -[ENExposureCalculationSession exposureWindowsForMatchedAdvertisements:key:options:](self, "exposureWindowsForMatchedAdvertisements:key:options:", a3, a4, 0);
}

- (id)exposureWindowsForMatchedAdvertisements:(id)a3 key:(id)a4 options:(int64_t)a5
{
  char v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  double v22;
  id v23;
  unint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unsigned __int16 v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  unsigned int v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  double v47;
  unsigned int cachedExposureWindowMetadataCount;
  $7ADA1EF68C37A8F83EC2BAFA30593E49 *v49;
  void *v50;
  uint64_t v51;
  int v52;
  int v53;
  ENExposureConfiguration *exposureConfiguration;
  unsigned __int8 v56;
  unsigned __int8 v57;
  uint64_t v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  _QWORD v63[6];
  unsigned int v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  int v71;
  uint64_t v72;

  v5 = a5;
  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v62 = v8;
  if (-[ENExposureCalculationSession _shouldMatchKey:](self, "_shouldMatchKey:", v9))
  {
    v60 = v5;
    -[ENExposureCalculationSession filterAdvertisements:fromKey:](self, "filterAdvertisements:fromKey:", v8, v9);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v61;
    if (!objc_msgSend(v61, "count"))
    {
      v50 = 0;
LABEL_57:

      goto LABEL_58;
    }
    v11 = v61;
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v14 = v12;
    v15 = 0;
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, &v69, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v66 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          if (v15
            && (objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "timestamp"),
                v21 = v20,
                objc_msgSend(v15, "timestamp"),
                v21 - v22 <= 4.0))
          {
            objc_msgSend(v15, "combineWithAdvertisement:", v19);
          }
          else
          {
            objc_msgSend(v13, "addObject:", v19);
            v23 = v19;

            v15 = v23;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, &v69, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v13, "count") != 1)
    {
      v24 = 0;
      do
      {
        objc_msgSend(v13, "objectAtIndex:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", ++v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timestamp");
        v28 = v27;
        objc_msgSend(v26, "timestamp");
        if (v28 > v29 - (double)objc_msgSend(v26, "scanInterval"))
        {
          objc_msgSend(v26, "timestamp");
          v31 = v30;
          objc_msgSend(v25, "timestamp");
          objc_msgSend(v26, "setScanInterval:", (int)(v31 - v32));
        }

      }
      while (v24 < objc_msgSend(v13, "count") - 1);
    }

    if (objc_msgSend(v13, "count"))
    {
      v33 = objc_msgSend(v13, "count");
      v34 = (uint64_t *)malloc_type_calloc(v33, 0x10uLL, 0x1000040451B5BE8uLL);
      v35 = v34;
      if (v34)
      {
        if (v33)
        {
          v36 = 0;
          v37 = v34 + 1;
          do
          {
            v38 = (void *)MEMORY[0x1D17A7CB8]();
            objc_msgSend(v13, "objectAtIndex:", v36);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(v37 - 1) = -[ENExposureCalculationSession scanInstanceFromAdvertisement:key:](self, "scanInstanceFromAdvertisement:key:", v39, v9);
            *v37 = v40;

            objc_autoreleasePoolPop(v38);
            ++v36;
            v37 += 2;
          }
          while (v33 != v36);
        }
        objc_msgSend(v13, "lastObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "decryptedMetadataForTemporaryExposureKey:", v9);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v9;
        v43 = objc_msgSend(v42, "rollingStartNumber");
        v58 = objc_msgSend(v42, "daysSinceOnsetOfSymptoms");
        v57 = objc_msgSend(v42, "transmissionRiskLevel");
        v56 = objc_msgSend(v42, "diagnosisReportType");
        v44 = objc_msgSend(v42, "variantOfConcernType");

        v45 = objc_msgSend(v59, "calibrationConfidence");
        v46 = v45;
        if ((v60 & 2) != 0)
          v47 = INFINITY;
        else
          v47 = 1800.0;
        if (!self->_cacheExposureWindows && !self->_cacheExposureInfo)
          goto LABEL_55;
        *(_QWORD *)&v69 = 0;
        *((_QWORD *)&v69 + 1) = &v69;
        v70 = 0x2020000000;
        v71 = 0;
        if (self->_cachedScanInstanceCount >= self->_scanInstanceBufferSize)
        {
          if (gLogCategory__ENExposureCalculationSession <= 90
            && (gLogCategory__ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          v51 = *((_QWORD *)&v69 + 1);
          v52 = *(_DWORD *)(*((_QWORD *)&v69 + 1) + 24) + v33;
          *(_DWORD *)(*((_QWORD *)&v69 + 1) + 24) = v52;
          if (!v52)
            goto LABEL_54;
        }
        else
        {
          cachedExposureWindowMetadataCount = self->_cachedExposureWindowMetadataCount;
          self->_cachedExposureWindowMetadataCount = cachedExposureWindowMetadataCount + 1;
          v49 = &self->_exposureWindowMetadataBuffer[cachedExposureWindowMetadataCount];
          v49->var0 = v43;
          *(&v49->var0 + 1) = 0;
          v49->var1 = v58;
          v49->var2 = v57;
          v49->var3 = v56;
          v49->var4 = v45;
          v49->var5 = v44;
          *(_DWORD *)(&v49->var5 + 1) = 0;
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __84__ENExposureCalculationSession_exposureWindowsForMatchedAdvertisements_key_options___block_invoke;
          v63[3] = &unk_1E87DB8F8;
          v64 = cachedExposureWindowMetadataCount;
          v63[4] = self;
          v63[5] = &v69;
          groupScanInstances(v35, v33, v63, v47);
          if (*(_DWORD *)(*((_QWORD *)&v69 + 1) + 24)
            && gLogCategory__ENExposureCalculationSession <= 90
            && (gLogCategory__ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          v51 = *((_QWORD *)&v69 + 1);
          if (!*(_DWORD *)(*((_QWORD *)&v69 + 1) + 24))
            goto LABEL_54;
        }
        if (gLogCategory__ENExposureCalculationSession <= 90)
        {
          if (gLogCategory__ENExposureCalculationSession != -1
            || (v53 = _LogCategory_Initialize(), v51 = *((_QWORD *)&v69 + 1), v53))
          {
            LogPrintF_safe();
            v51 = *((_QWORD *)&v69 + 1);
          }
        }
        self->_droppedScanInstanceCount += *(_DWORD *)(v51 + 24);
LABEL_54:
        _Block_object_dispose(&v69, 8);
LABEL_55:
        exposureConfiguration = self->_exposureConfiguration;
        *(_QWORD *)&v69 = v43;
        *((_QWORD *)&v69 + 1) = v58;
        LOBYTE(v70) = v57;
        BYTE1(v70) = v56;
        BYTE2(v70) = v46;
        BYTE3(v70) = v44;
        HIDWORD(v70) = 0;
        exposureWindowsForScanInstances(v35, v33, &v69, (v60 & 1) == 0, exposureConfiguration, v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        free(v35);

        goto LABEL_56;
      }
      if (gLogCategory__ENExposureCalculationSession <= 90
        && (gLogCategory__ENExposureCalculationSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    v50 = 0;
LABEL_56:

    v10 = v61;
    goto LABEL_57;
  }
  v50 = 0;
LABEL_58:

  return v50;
}

uint64_t __84__ENExposureCalculationSession_exposureWindowsForMatchedAdvertisements_key_options___block_invoke(uint64_t result, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 88);
  if (a3)
  {
    v3 = a3;
    v4 = (uint64_t *)(a2 + 4);
    do
    {
      v8 = *v4;
      v9 = *((_DWORD *)v4 + 2);
      v5 = *(_QWORD *)(result + 32);
      v6 = *(unsigned int *)(v5 + 48);
      if (v6 >= *(_DWORD *)(v5 + 20))
      {
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
      }
      else
      {
        v7 = *(_QWORD *)(v5 + 40) + 16 * v6;
        *(_DWORD *)v7 = *(_DWORD *)(result + 48);
        *(_QWORD *)(v7 + 4) = v8;
        *(_DWORD *)(v7 + 12) = v9;
        ++*(_DWORD *)(*(_QWORD *)(result + 32) + 48);
      }
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  return result;
}

- (BOOL)_shouldMatchKey:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "diagnosisReportType");
  if (v4 == 5)
    return 0;
  if (v4 == 4)
    return self->_allowRecursiveReportType;
  return 1;
}

- (void)enumerateCachedExposureWindows:(id)a3 inRange:(_NSRange)a4 withBatchSize:(unsigned int)a5
{
  -[ENExposureCalculationSession enumerateCachedExposureWindows:inRange:withBatchSize:options:](self, "enumerateCachedExposureWindows:inRange:withBatchSize:options:", a3, a4.location, a4.length, *(_QWORD *)&a5, 0);
}

- (void)enumerateCachedExposureWindows:(id)a3 inRange:(_NSRange)a4 withBatchSize:(unsigned int)a5 options:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  void (**v12)(id, id, _QWORD);
  unint64_t cachedExposureWindowCount;
  double v14;
  NSUInteger v15;
  unint64_t v16;
  $6B14AE857B43CEDA041F2BA42EED81B6 *scanInstanceBuffer;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  $6B14AE857B43CEDA041F2BA42EED81B6 *v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t cachedScanInstanceCount;
  int64_t v31;
  uint64_t v32;
  uint64_t *v33;
  $7ADA1EF68C37A8F83EC2BAFA30593E49 *v34;
  void *v35;
  void *v36;
  SEL v37;
  unint64_t v38;
  unint64_t v39;
  NSUInteger v40;
  void (**v41)(id, id, _QWORD);
  void *context;
  unsigned int v43;
  NSUInteger v44;
  $6B14AE857B43CEDA041F2BA42EED81B6 *v45;
  unint64_t v46;
  __int128 v47;
  uint64_t v48;

  length = a4.length;
  location = a4.location;
  v12 = (void (**)(id, id, _QWORD))a3;
  cachedExposureWindowCount = self->_cachedExposureWindowCount;
  if (location + length <= cachedExposureWindowCount)
  {
    v40 = location + length;
    v41 = v12;
    if ((a6 & 2) != 0)
      v14 = INFINITY;
    else
      v14 = 1800.0;
    if ((a6 & 2) != 0)
      cachedExposureWindowCount = self->_cachedExposureWindowMetadataCount;
    v43 = a5;
    v39 = cachedExposureWindowCount;
    v37 = a2;
    if (location)
    {
      v15 = 0;
      v16 = 0;
      scanInstanceBuffer = self->_scanInstanceBuffer;
      v18 = *(_QWORD *)&scanInstanceBuffer->var1;
      v45 = scanInstanceBuffer;
      v19 = *(_QWORD *)&scanInstanceBuffer->var0;
      v20 = HIDWORD(*(_QWORD *)&scanInstanceBuffer->var0);
      do
      {
        v21 = (uint64_t *)((char *)v45 + 16 * v16);
        v23 = *v21;
        v22 = v21[1];
        if (scanInstancesInDifferentWindows(v19 | (v20 << 32), v18, *v21, v22, v14))
        {
          v19 = v23;
          v20 = HIDWORD(v23);
          ++v15;
          v18 = v22;
        }
        if (v15 != location)
          ++v16;
      }
      while (v15 < location);
    }
    else
    {
      v16 = 0;
    }
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
    if (location < v40)
    {
      v38 = v43;
      do
      {
        context = (void *)MEMORY[0x1D17A7CB8]();
        v44 = location + v38;
        if (location + v38 <= v39)
          v25 = v38;
        else
          v25 = v39 - location;
        if (objc_msgSend(v24, "count") >= v25)
        {
          v26 = v16;
        }
        else
        {
          v26 = v16;
          v46 = v25;
          do
          {
            v27 = self->_scanInstanceBuffer;
            v28 = (uint64_t *)((char *)v27 + 16 * v16);
            v29 = *v28;
            cachedScanInstanceCount = self->_cachedScanInstanceCount;
            if (v16 < cachedScanInstanceCount)
            {
              v31 = a6;
              v32 = v28[1];
              v33 = v28 + 1;
              v26 = v16;
              while (!scanInstancesInDifferentWindows(v29, v32, *(v33 - 1), *v33, v14))
              {
                v33 += 2;
                if (cachedScanInstanceCount == ++v26)
                {
                  v26 = cachedScanInstanceCount;
                  break;
                }
              }
              a6 = v31;
              v25 = v46;
            }
            if (self->_cachedExposureWindowMetadataCount <= v29)
            {
              objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v37, self, CFSTR("ENExposureCalculationSession.m"), 967, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadataIndex < _cachedExposureWindowMetadataCount"));

              v25 = v46;
              v27 = self->_scanInstanceBuffer;
            }
            v34 = &self->_exposureWindowMetadataBuffer[v29];
            v47 = *(_OWORD *)&v34->var0;
            v48 = *(_QWORD *)&v34->var2;
            exposureWindowsForScanInstances((uint64_t *)v27 + 2 * v16, (unsigned __int16)(v26 - v16), &v47, (a6 & 1) == 0, self->_exposureConfiguration, v14);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObjectsFromArray:", v35);

            v16 = v26;
          }
          while (objc_msgSend(v24, "count") < v25);
        }
        v41[2](v41, v24, 0);
        objc_msgSend(v24, "removeAllObjects");
        objc_autoreleasePoolPop(context);
        location = v44;
        v16 = v26;
      }
      while (v44 < v40);
    }

    v12 = v41;
  }

}

- (id)groupExposureWindowsByDay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D40], "calendarWithIdentifier:", *MEMORY[0x1E0C996C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E78], "timeZoneForSecondsFromGMT:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:");
  objc_msgSend(MEMORY[0x1E0C99D60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  objc_msgSend(v4, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v8 = 7;
  do
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
    objc_msgSend(v7, "addObject:", v9);

    --v8;
  }
  while (v8);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeIntervalSinceDate:", v15);
        v17 = (unint64_t)v16 / 0x15180;

        v18 = 0;
        do
        {
          v19 = v18 + 1;
          v20 = v17 < qword_1CC251348[v18] || v18 == 6;
          ++v18;
        }
        while (!v20);
        objc_msgSend(v7, "objectAtIndex:", v19 - 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v14);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v11);
  }

  return v7;
}

- (id)groupExposureWindowsByInfectiousness:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v5 = 3;
  do
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
    objc_msgSend(v4, "addObject:", v6);

    --v5;
  }
  while (v5);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = 0;
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        while (qword_1CC251380[v12] < (unint64_t)objc_msgSend(v13, "infectiousness", (_QWORD)v16))
        {
          if (++v12 == 3)
          {
            v12 = 0;
            break;
          }
        }
        objc_msgSend(v4, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v13);

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v4;
}

- (id)attenuationDurationMapDataForExposureWindows:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _OWORD v37[4];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v9), "scanInstances");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  memset(v37, 0, sizeof(v37));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = 0;
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v15);
        do
        {
          v18 = v16 * 8 + 8;
          if (qword_1CC251398[v16] >= (unint64_t)objc_msgSend(v17, "typicalAttenuation", (_QWORD)v28))break;
        }
        while (v16++ != 7);
        *(_QWORD *)&v36[v18 + 120] += objc_msgSend(v17, "secondsSinceLastScan");
        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v13);
  }

  v20 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
  v21 = 0;
  v22 = v20;
  do
  {
    v23 = 0;
    v24 = *((_QWORD *)v37 + v21);
    v25 = (double)v24;
    while (!v24 || dbl_1CC2513D8[v23] < v25)
    {
      if (++v23 == 8)
        goto LABEL_26;
    }
    v22[v23] = 1;
LABEL_26:
    ++v21;
    v22 += 8;
  }
  while (v21 != 8);
  objc_msgSend(MEMORY[0x1E0C99D58], "dataWithBytesNoCopy:length:", v20, 64, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)cachedExposuresDifferentialPrivacyRiskParameters
{
  unint64_t cachedExposureWindowCount;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__8;
  v30 = __Block_byref_object_dispose__8;
  v31 = 0;
  cachedExposureWindowCount = self->_cachedExposureWindowCount;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __80__ENExposureCalculationSession_cachedExposuresDifferentialPrivacyRiskParameters__block_invoke;
  v25[3] = &unk_1E87DB920;
  v25[4] = &v26;
  -[ENExposureCalculationSession enumerateCachedExposureWindows:inRange:withBatchSize:options:](self, "enumerateCachedExposureWindows:inRange:withBatchSize:options:", v25, 0, cachedExposureWindowCount, cachedExposureWindowCount, 3);
  -[ENExposureCalculationSession groupExposureWindowsByDay:](self, "groupExposureWindowsByDay:", v27[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DF8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        -[ENExposureCalculationSession groupExposureWindowsByInfectiousness:](self, "groupExposureWindowsByInfectiousness:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v32, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v18;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(v10);
              -[ENExposureCalculationSession attenuationDurationMapDataForExposureWindows:](self, "attenuationDurationMapDataForExposureWindows:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "appendData:", v14);

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v32, 16);
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v6);
  }

  _Block_object_dispose(&v26, 8);
  return v5;
}

void __80__ENExposureCalculationSession_cachedExposuresDifferentialPrivacyRiskParameters__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unsigned)droppedScanInstanceCount
{
  return self->_droppedScanInstanceCount;
}

- (BOOL)allowRecursiveReportType
{
  return self->_allowRecursiveReportType;
}

- (void)setAllowRecursiveReportType:(BOOL)a3
{
  self->_allowRecursiveReportType = a3;
}

- (ENExposureConfiguration)exposureConfiguration
{
  return self->_exposureConfiguration;
}

- (NSNumber)allowedRPIBroadcastDuration
{
  return self->_allowedRPIBroadcastDuration;
}

- (void)setAllowedRPIBroadcastDuration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)advertisementSampleCountThreshold
{
  return self->_advertisementSampleCountThreshold;
}

- (void)setAdvertisementSampleCountThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)cacheExposureInfo
{
  return self->_cacheExposureInfo;
}

- (void)setCacheExposureInfo:(BOOL)a3
{
  self->_cacheExposureInfo = a3;
}

- (BOOL)cacheExposureWindows
{
  return self->_cacheExposureWindows;
}

- (void)setCacheExposureWindows:(BOOL)a3
{
  self->_cacheExposureWindows = a3;
}

- (unint64_t)cachedExposureWindowCount
{
  return self->_cachedExposureWindowCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementSampleCountThreshold, 0);
  objc_storeStrong((id *)&self->_allowedRPIBroadcastDuration, 0);
  objc_storeStrong((id *)&self->_exposureConfiguration, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
