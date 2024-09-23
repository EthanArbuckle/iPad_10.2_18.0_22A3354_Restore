@implementation ENAdvertisementDatabaseQuerySession

- (ENAdvertisementDatabaseQuerySession)initWithDatabase:(id)a3 attenuationThreshold:(unsigned __int8)a4 advertisementCount:(unsigned int)a5 queue:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  ENAdvertisementDatabaseQuerySession *v13;
  ENAdvertisementDatabaseQuerySession *v14;
  ENAdvertisementDatabase *database;
  void *v16;
  objc_super v18;

  v8 = a4;
  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ENAdvertisementDatabaseQuerySession;
  v13 = -[ENAdvertisementDatabaseQuerySession init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_attenuationThreshold = v8;
    objc_storeStrong((id *)&v13->_database, a3);
    objc_storeStrong((id *)&v14->_queue, a6);
    v14->_storedAdvertisementCount = a5;
    v14->_tekCount = 0;
    database = v14->_database;
    -[ENAdvertisementDatabase queryFilterWithBufferSize:hashCount:attenuationThreshold:](database, "queryFilterWithBufferSize:hashCount:attenuationThreshold:", 1638400, 3, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENAdvertisementDatabase setInlineQueryFilter:](database, "setInlineQueryFilter:", v16);

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  int v4;
  uint64_t tekCount;
  objc_super v6;

  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSensitiveLoggingAllowed");

  if (v4
    && gLogCategory_ENAdvertisementDatabaseQuerySession <= 50
    && (gLogCategory_ENAdvertisementDatabaseQuerySession != -1 || _LogCategory_Initialize()))
  {
    tekCount = self->_tekCount;
    LogPrintF_safe();
  }
  -[ENAdvertisementDatabaseQuerySession invalidate](self, "invalidate", tekCount);
  v6.receiver = self;
  v6.super_class = (Class)ENAdvertisementDatabaseQuerySession;
  -[ENAdvertisementDatabaseQuerySession dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  -[ENAdvertisementDatabase setInlineQueryFilter:](self->_database, "setInlineQueryFilter:", 0);
}

- (BOOL)enumerateAdvertisementsMatchingKeys:(id)a3 attenuationThreshold:(unsigned __int8)a4 timestampTolerance:(double)a5 error:(id *)a6 handler:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *queue;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  int v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  int v32;
  uint64_t v33;
  ENAdvertisement *v34;
  ENAdvertisement *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void (**v47)(id, void *, id);
  uint64_t v48;
  void *contexta;
  _QWORD block[5];
  id v52;
  uint64_t *v53;
  double v54;
  unsigned __int8 v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  const __CFString *v67;
  _BYTE v68[28];
  int v69;
  uint64_t v70;
  _OWORD v71[2];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v47 = (void (**)(id, void *, id))a7;
  self->_tekCount += objc_msgSend(v11, "count");
  v12 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v63 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v17, "keyData");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v17, v18);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v14);
  }

  objc_msgSend(v12, "allValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1D17A7CB8]();
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  v61 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __129__ENAdvertisementDatabaseQuerySession_enumerateAdvertisementsMatchingKeys_attenuationThreshold_timestampTolerance_error_handler___block_invoke;
  block[3] = &unk_1E87D9C78;
  v53 = &v56;
  block[4] = self;
  v46 = v19;
  v52 = v46;
  v55 = a4;
  v54 = a5;
  dispatch_sync(queue, block);
  v21 = (void *)v57[5];
  v44 = v21;
  if (v21)
  {
    v48 = objc_msgSend(objc_retainAutorelease(v21), "bytes");
    v22 = 0;
    v23 = objc_msgSend((id)v57[5], "length") / 0x28uLL;
    while (v22 < v23)
    {
      contexta = (void *)MEMORY[0x1D17A7CB8]();
      v24 = v48 + 40 * v22;
      v26 = *(_DWORD *)(v24 + 28);
      v25 = (unsigned int *)(v24 + 28);
      if (v26 == -1)
      {
        v31 = v22 + 1;
      }
      else
      {
        v27 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
        v28 = 0;
        v29 = *v25;
        v30 = (_QWORD *)(v48 + 32 + 40 * v22);
        v31 = v22;
        do
        {
          v71[0] = *((_OWORD *)v30 - 2);
          *(_OWORD *)((char *)v71 + 12) = *(_OWORD *)((char *)v30 - 20);
          v32 = *((_DWORD *)v30 - 1);
          if (v32 == -1)
          {
            v28 = (v28 + 1);
          }
          else
          {
            if (v32 != (_DWORD)v29)
              goto LABEL_19;
            v33 = *v30;
            v34 = [ENAdvertisement alloc];
            *(_OWORD *)v68 = v71[0];
            *(_OWORD *)&v68[12] = *(_OWORD *)((char *)v71 + 12);
            v69 = v29;
            v70 = v33;
            v35 = -[ENAdvertisement initWithStructRepresentation:](v34, "initWithStructRepresentation:", v68);
            objc_msgSend(v27, "addObject:", v35);

          }
          v30 += 5;
          ++v31;
        }
        while (v23 != v31);
        v31 = v23;
LABEL_19:
        +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isSensitiveLoggingAllowed");

        if (v37
          && gLogCategory_ENAdvertisementDatabaseQuerySession <= 10
          && (gLogCategory_ENAdvertisementDatabaseQuerySession != -1 || _LogCategory_Initialize()))
        {
          v42 = v31 - v22;
          v43 = v28;
          v41 = v22;
          LogPrintF_safe();
        }
        objc_msgSend(v46, "objectAtIndexedSubscript:", v29, v41, v42, v43);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v47[2](v47, v38, v27);

      }
      objc_autoreleasePoolPop(contexta);
      v22 = v31;
    }

    _Block_object_dispose(&v56, 8);
    objc_autoreleasePoolPop(v45);
  }
  else
  {

    _Block_object_dispose(&v56, 8);
    objc_autoreleasePoolPop(v45);
    v66 = *MEMORY[0x1E0CB2D58];
    v67 = CFSTR("Error encountered querying database");
    objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C0], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAA290], 16, v39);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v44 != 0;
}

void __129__ENAdvertisementDatabaseQuerySession_enumerateAdvertisementsMatchingKeys_attenuationThreshold_timestampTolerance_error_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "advertisementsBufferMatchingDailyKeys:attenuationThreshold:timestampTolerance:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(double *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)beaconCountMetricsWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *queue;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  ENAdvertisementDatabaseQuerySession *v23;
  id v24;
  id v25;
  uint64_t *v26;
  double v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (self->_database)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    v12 = (void *)MEMORY[0x1D17A7CB8]();
    queue = self->_queue;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __100__ENAdvertisementDatabaseQuerySession_beaconCountMetricsWithStartDate_endDate_windowDuration_error___block_invoke;
    v22 = &unk_1E87D9CA0;
    v26 = &v28;
    v23 = self;
    v24 = v10;
    v25 = v11;
    v27 = a5;
    dispatch_sync(queue, &v19);

    objc_autoreleasePoolPop(v12);
    v14 = (void *)v29[5];
    if (a6 && !v14)
    {
      v34 = *MEMORY[0x1E0CB2D58];
      v35 = CFSTR("Nil beacon count metrics");
      objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1, v19, v20, v21, v22, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C0], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAA290], 11, v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      v14 = (void *)v29[5];
    }
    v16 = v14;
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    v36 = *MEMORY[0x1E0CB2D58];
    v37[0] = CFSTR("Nil advertisement database");
    objc_msgSend(MEMORY[0x1E0C99D88], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C0], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAA290], 11, v17);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    v16 = 0;
  }

  return v16;
}

void __100__ENAdvertisementDatabaseQuerySession_beaconCountMetricsWithStartDate_endDate_windowDuration_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "beaconCountMetricsWithStartDate:endDate:windowDuration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unsigned)attenuationThreshold
{
  return self->_attenuationThreshold;
}

- (ENAdvertisementDatabase)database
{
  return self->_database;
}

- (unsigned)storedAdvertisementCount
{
  return self->_storedAdvertisementCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
