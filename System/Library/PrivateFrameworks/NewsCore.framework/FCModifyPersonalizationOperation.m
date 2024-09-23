@implementation FCModifyPersonalizationOperation

+ (void)applyAggregates:(id)a3 toProfile:(id)a4 maxRatio:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "aggregatesByFeatureKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __87__FCModifyPersonalizationOperation_FCMergeUtility__applyAggregates_toProfile_maxRatio___block_invoke;
  v23[3] = &unk_1E463B520;
  v13 = v11;
  v24 = v13;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v23);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __87__FCModifyPersonalizationOperation_FCMergeUtility__applyAggregates_toProfile_maxRatio___block_invoke_3;
  v18[3] = &unk_1E463B548;
  *(double *)&v18[5] = a5;
  v18[4] = &v19;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
  v14 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v20[3];
    *(_DWORD *)buf = 134217984;
    v26 = v15;
    _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "Adjusted a total of %lu aggregates", buf, 0xCu);
  }
  objc_msgSend(a1, "pruneAggregates:", v13);
  objc_msgSend(v13, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  objc_msgSend(v9, "setAggregates:", v17);

  _Block_object_dispose(&v19, 8);
}

+ (void)pruneAggregates:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  double v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = FCPersonalizationDataMaxAggregates();
  if (objc_msgSend(v3, "count") > v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = (unint64_t)(v6 + v6);

    objc_msgSend(v3, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__FCModifyPersonalizationOperation_FCMergeUtility__pruneAggregates___block_invoke;
    v14[3] = &__block_descriptor_40_e71_q24__0__NTPBPersonalizationAggregate_8__NTPBPersonalizationAggregate_16l;
    v14[4] = v7;
    objc_msgSend(v8, "sortedArrayUsingComparator:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "fc_subarrayWithMaxCount:", objc_msgSend(v3, "count") - v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("kFCPersonalizationDataDidPruneNotification"), v10);

    objc_msgSend(v10, "fc_arrayByTransformingWithBlock:", &__block_literal_global_7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectsForKeys:", v12);
    if (objc_msgSend(v3, "count") > v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to prune personalization aggregates"));
      *(_DWORD *)buf = 136315906;
      v16 = "+[FCModifyPersonalizationOperation(FCMergeUtility) pruneAggregates:]";
      v17 = 2080;
      v18 = "FCModifyPersonalizationOperation.m";
      v19 = 1024;
      v20 = 343;
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }

}

+ (id)personalizationProfileFromRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  char *v13;
  id v14;
  void *v15;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "recordType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PersonalizationProfile"));

    if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid record type for personalization"));
      v18 = 136315906;
      v19 = "+[FCModifyPersonalizationOperation(FCMergeUtility) personalizationProfileFromRecord:]";
      v20 = 2080;
      v21 = "FCModifyPersonalizationOperation.m";
      v22 = 1024;
      v23 = 194;
      v24 = 2114;
      v25 = v17;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v7)
    v10 = v9 == 1;
  else
    v10 = 0;
  if (v10)
  {
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D62780]), "initWithData:", v7);
  }
  else
  {
    if (v9 != 1)
    {
      v11 = (void *)FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("version"));
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v13;
        v20 = 2112;
        v21 = (char *)&unk_1E470A298;
        _os_log_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEFAULT, "ignoring personalization profile from version %@ because we're on version %@", (uint8_t *)&v18, 0x16u);

      }
    }
    v14 = objc_alloc_init(MEMORY[0x1E0D62780]);
  }
  v15 = v14;

  return v15;
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[FCModifyPersonalizationOperation database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have a database to modify the personalization profile"));
    v14 = 136315906;
    v15 = "-[FCModifyPersonalizationOperation validateOperation]";
    v16 = 2080;
    v17 = "FCModifyPersonalizationOperation.m";
    v18 = 1024;
    v19 = 61;
    v20 = 2114;
    v21 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

  }
  -[FCModifyPersonalizationOperation aggregates](self, "aggregates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have aggregates to modify the personalization profile"));
    v14 = 136315906;
    v15 = "-[FCModifyPersonalizationOperation validateOperation]";
    v16 = 2080;
    v17 = "FCModifyPersonalizationOperation.m";
    v18 = 1024;
    v19 = 62;
    v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

  }
  -[FCModifyPersonalizationOperation treatment](self, "treatment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("must have a personalization treatment to modify the personalization profile"));
    v14 = 136315906;
    v15 = "-[FCModifyPersonalizationOperation validateOperation]";
    v16 = 2080;
    v17 = "FCModifyPersonalizationOperation.m";
    v18 = 1024;
    v19 = 63;
    v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v14, 0x26u);

  }
  -[FCModifyPersonalizationOperation database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[FCModifyPersonalizationOperation aggregates](self, "aggregates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[FCModifyPersonalizationOperation treatment](self, "treatment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)performOperation
{
  void *v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  FCCKPrivateFetchRecordsOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(_QWORD);
  _QWORD aBlock[5];
  id v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", CFSTR("SharedPersonalizationProfile"));
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__FCModifyPersonalizationOperation_performOperation__block_invoke;
  aBlock[3] = &unk_1E463AD10;
  aBlock[4] = self;
  v5 = v3;
  v16 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[FCModifyPersonalizationOperation remoteRecord](self, "remoteRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v6[2](v6);
  }
  else
  {
    v8 = objc_alloc_init(FCCKPrivateFetchRecordsOperation);
    v18[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateFetchRecordsOperation setRecordIDs:](v8, "setRecordIDs:", v9);

    v17[0] = CFSTR("data");
    v17[1] = CFSTR("version");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateFetchRecordsOperation setDesiredKeys:](v8, "setDesiredKeys:", v10);

    -[FCOperation setQualityOfService:](v8, "setQualityOfService:", 9);
    -[FCOperation setRelativePriority:](v8, "setRelativePriority:", -1);
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __52__FCModifyPersonalizationOperation_performOperation__block_invoke_2;
    v12[3] = &unk_1E463B4B8;
    v12[4] = self;
    v13 = v5;
    v14 = v6;
    -[FCCKPrivateFetchRecordsOperation setFetchRecordsCompletionBlock:](v8, "setFetchRecordsCompletionBlock:", v12);
    -[FCModifyPersonalizationOperation database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabase addOperation:]((uint64_t)v11, v8);

  }
}

void __52__FCModifyPersonalizationOperation_performOperation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  FCCKPrivateSaveRecordsOperation *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "remoteRecord");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", CFSTR("PersonalizationProfile"), *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E470A298, CFSTR("version"));
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  v6 = *(void **)(a1 + 32);
  if (v5 < 2)
  {
    objc_msgSend((id)objc_opt_class(), "personalizationProfileFromRecord:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "aggregates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "treatment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clicksToImpressionsRatioMaximum");
    objc_msgSend(v9, "applyAggregates:toProfile:maxRatio:", v10, v8);

    objc_msgSend(v8, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("data"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E470A298, CFSTR("version"));
    v13 = (void *)FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v8, "aggregates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v24 = objc_msgSend(v15, "count");
      v25 = 2048;
      v26 = objc_msgSend(v12, "length");
      _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "uploading personalization profile with %lu aggregates for %lu bytes", buf, 0x16u);

    }
    v16 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
    v22 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateSaveRecordsOperation setRecordsToSave:](v16, "setRecordsToSave:", v17);

    -[FCOperation setQualityOfService:](v16, "setQualityOfService:", 9);
    -[FCOperation setRelativePriority:](v16, "setRelativePriority:", -1);
    -[FCCKPrivateSaveRecordsOperation setSavePolicy:](v16, "setSavePolicy:", 0);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __52__FCModifyPersonalizationOperation_performOperation__block_invoke_13;
    v20[3] = &unk_1E463B490;
    v20[4] = *(_QWORD *)(a1 + 32);
    v21 = v8;
    v18 = v8;
    -[FCCKPrivateSaveRecordsOperation setSaveRecordsCompletionBlock:](v16, "setSaveRecordsCompletionBlock:", v20);
    objc_msgSend(*(id *)(a1 + 32), "database");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabase addOperation:]((uint64_t)v19, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_belowMinimumVersionError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishedPerformingOperationWithError:", v7);

  }
}

void __52__FCModifyPersonalizationOperation_performOperation__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setResultError:", a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSavedProfile:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSavedRecord:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a3);

}

void __52__FCModifyPersonalizationOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && !objc_msgSend(v5, "fc_isCKUnknownItemError"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setResultError:", v6);
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRemoteRecord:", v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  -[FCModifyPersonalizationOperation saveCompletionHandler](self, "saveCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCModifyPersonalizationOperation saveCompletionHandler](self, "saveCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCModifyPersonalizationOperation savedProfile](self, "savedProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCModifyPersonalizationOperation savedRecord](self, "savedRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCModifyPersonalizationOperation resultError](self, "resultError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = v8;
    else
      v9 = v10;
    ((void (**)(_QWORD, void *, void *, id))v5)[2](v5, v6, v7, v9);

  }
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  int v5;

  v5 = objc_msgSend(a3, "fc_isCKErrorWithCode:", 14);
  if (v5)
    *a4 = (id)objc_opt_new();
  return v5;
}

- (void)resetForRetry
{
  -[FCModifyPersonalizationOperation setRemoteRecord:](self, "setRemoteRecord:", 0);
  -[FCModifyPersonalizationOperation setResultError:](self, "setResultError:", 0);
}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (NSDictionary)aggregates
{
  return self->_aggregates;
}

- (void)setAggregates:(id)a3
{
  objc_storeStrong((id *)&self->_aggregates, a3);
}

- (FCPersonalizationTreatment)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_treatment, a3);
}

- (CKRecord)remoteRecord
{
  return self->_remoteRecord;
}

- (void)setRemoteRecord:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRecord, a3);
}

- (id)saveCompletionHandler
{
  return self->_saveCompletionHandler;
}

- (void)setSaveCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NTPBPersonalizationProfile)savedProfile
{
  return self->_savedProfile;
}

- (void)setSavedProfile:(id)a3
{
  objc_storeStrong((id *)&self->_savedProfile, a3);
}

- (CKRecord)savedRecord
{
  return self->_savedRecord;
}

- (void)setSavedRecord:(id)a3
{
  objc_storeStrong((id *)&self->_savedRecord, a3);
}

- (NSError)resultError
{
  return self->_resultError;
}

- (void)setResultError:(id)a3
{
  objc_storeStrong((id *)&self->_resultError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong((id *)&self->_savedRecord, 0);
  objc_storeStrong((id *)&self->_savedProfile, 0);
  objc_storeStrong(&self->_saveCompletionHandler, 0);
  objc_storeStrong((id *)&self->_remoteRecord, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_aggregates, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

+ (void)applyChangeGroups:(id)a3 toProfile:(id)a4 treatment:(id)a5 prune:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id obj;
  void *v50;
  void *v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v44 = a6;
  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "aggregatesByFeatureKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v45 = v9;
  objc_msgSend(v9, "historiesByInstanceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v8;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v58;
    v46 = *(_QWORD *)v58;
    v47 = v14;
    do
    {
      v18 = 0;
      v48 = v16;
      do
      {
        if (*(_QWORD *)v58 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v18);
        objc_msgSend(v19, "instanceIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v19, "instanceIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v21);
          v22 = (id)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            v22 = objc_alloc_init(MEMORY[0x1E0D62770]);
            objc_msgSend(v19, "instanceIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setInstanceIdentifier:", v23);

            objc_msgSend(v22, "instanceIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v22, v24);

          }
          v25 = objc_msgSend(v19, "changeNumber");
          if (v25 > objc_msgSend(v22, "lastChangeNumber"))
          {
            v50 = v22;
            v51 = v19;
            v52 = v18;
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            objc_msgSend(v19, "deltas");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v54;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v54 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                  objc_msgSend(v31, "featureKey");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v32)
                  {
                    objc_msgSend(v31, "featureKey");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "objectForKey:", v33);
                    v34 = (id)objc_claimAutoreleasedReturnValue();

                    if (!v34)
                    {
                      v34 = objc_alloc_init(MEMORY[0x1E0D62760]);
                      objc_msgSend(v31, "featureKey");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v34, "setFeatureKey:", v35);

                      objc_msgSend(v34, "featureKey");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "setObject:forKey:", v34, v36);

                    }
                    objc_msgSend(v31, "applyToAggregate:withTreatment:", v34, v10);

                  }
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
              }
              while (v28);
            }

            v37 = objc_msgSend(v51, "changeNumber");
            v22 = v50;
            if (v37 != objc_msgSend(v50, "lastChangeNumber") + 1
              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("looks like we're replaying events out of order"));
              *(_DWORD *)buf = 136315906;
              v62 = "+[FCModifyPersonalizationOperation(FCMergeUtility) applyChangeGroups:toProfile:treatment:prune:]";
              v63 = 2080;
              v64 = "FCModifyPersonalizationOperation.m";
              v65 = 1024;
              v66 = 263;
              v67 = 2114;
              v68 = v38;
              _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

            }
            objc_msgSend(v50, "setLastChangeNumber:", objc_msgSend(v51, "changeNumber"));
            v17 = v46;
            v14 = v47;
            v16 = v48;
            v18 = v52;
          }

        }
        ++v18;
      }
      while (v18 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v16);
  }

  if (v44)
    objc_msgSend(a1, "pruneAggregates:", v12);
  objc_msgSend(v12, "allValues");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");
  objc_msgSend(v45, "setAggregates:", v40);

  objc_msgSend(v14, "allValues");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "mutableCopy");
  objc_msgSend(v45, "setHistories:", v42);

}

+ (void)applyDeltas:(id)a3 toProfile:(id)a4 treatment:(id)a5 prune:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v27 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28 = v9;
  objc_msgSend(v9, "aggregatesByFeatureKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v18, "featureKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v18, "featureKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v20);
          v21 = (id)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v21 = objc_alloc_init(MEMORY[0x1E0D62760]);
            objc_msgSend(v18, "featureKey");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setFeatureKey:", v22);

            objc_msgSend(v21, "featureKey");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKey:", v21, v23);

          }
          objc_msgSend(v18, "applyToAggregate:withTreatment:", v21, v10);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  if (v27)
    objc_msgSend(a1, "pruneAggregates:", v12);
  objc_msgSend(v12, "allValues");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "mutableCopy");
  objc_msgSend(v28, "setAggregates:", v25);

}

uint64_t __68__FCModifyPersonalizationOperation_FCMergeUtility__pruneAggregates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  _BOOL8 v16;
  uint64_t v17;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "timestamp");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = objc_msgSend(v6, "timestamp");

  if (v7 >= v8)
    v10 = v9;
  else
    v10 = 1000 * v9;
  v11 = objc_msgSend(v5, "timestamp");
  v12 = *(_QWORD *)(a1 + 32);
  v13 = objc_msgSend(v5, "timestamp");
  v14 = 1000 * v13;
  if (v11 >= v12)
    v14 = v13;
  v15 = v10 >= v14;
  v16 = v10 > v14;
  if (v15)
    v17 = v16;
  else
    v17 = -1;

  return v17;
}

uint64_t __68__FCModifyPersonalizationOperation_FCMergeUtility__pruneAggregates___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureKey");
}

void __87__FCModifyPersonalizationOperation_FCMergeUtility__applyAggregates_toProfile_maxRatio___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6
    || (v8 = objc_msgSend(v6, "timestamp"), v8 < objc_msgSend(v5, "timestamp"))
    && (v9 = objc_msgSend(v5, "eventCount"), v9 > objc_msgSend(v7, "eventCount")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v10);
  }

}

void __87__FCModifyPersonalizationOperation_FCMergeUtility__applyAggregates_toProfile_maxRatio___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(double *)(a1 + 40) > 0.0)
  {
    objc_msgSend(v6, "clicks");
    v9 = v8;
    objc_msgSend(v7, "impressions");
    if (v9 / v10 > *(double *)(a1 + 40))
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      objc_msgSend(v7, "clicks");
      v11 = *(double *)(a1 + 40);
      v12 = (void *)FCPersonalizationLog;
      v14 = v13 / v11;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
      {
        v15 = v12;
        objc_msgSend(v7, "clicks");
        v17 = v16;
        objc_msgSend(v7, "impressions");
        v19 = 138544130;
        v20 = v5;
        v21 = 2048;
        v22 = v17;
        v23 = 2048;
        v24 = v18;
        v25 = 2048;
        v26 = v14;
        _os_log_debug_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEBUG, "Adjusted aggregate %{public}@ with C: %f I: %f to I: %f", (uint8_t *)&v19, 0x2Au);

      }
      objc_msgSend(v7, "setImpressions:", v14);
    }
  }

}

@end
