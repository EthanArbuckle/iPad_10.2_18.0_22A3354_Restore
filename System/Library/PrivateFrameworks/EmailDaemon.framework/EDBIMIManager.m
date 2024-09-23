@implementation EDBIMIManager

- (EDBIMIManager)initWithMessagePersistence:(id)a3 urlSession:(id)a4
{
  id v7;
  id v8;
  EDBIMIManager *v9;
  EDBIMIManager *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *activeDataTasksByRequest;
  uint64_t v13;
  EFScheduler *downloadScheduler;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EDBIMIManager;
  v9 = -[EDBIMIManager init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messagePersistence, a3);
    objc_storeStrong((id *)&v10->_urlSession, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    activeDataTasksByRequest = v10->_activeDataTasksByRequest;
    v10->_activeDataTasksByRequest = v11;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("EDBIMIManager.downloadScheduler"), 17);
    v13 = objc_claimAutoreleasedReturnValue();
    downloadScheduler = v10->_downloadScheduler;
    v10->_downloadScheduler = (EFScheduler *)v13;

  }
  return v10;
}

void ___ef_log_EDBIMIManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDBIMIManager");
  v1 = (void *)_ef_log_EDBIMIManager_log;
  _ef_log_EDBIMIManager_log = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_activeDataTasksByRequest, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_22);
  v3.receiver = self;
  v3.super_class = (Class)EDBIMIManager;
  -[EDBIMIManager dealloc](&v3, sel_dealloc);
}

uint64_t __24__EDBIMIManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

- (void)scheduleRecurringActivity
{
  NSObject *v3;
  uint8_t v4[16];

  _ef_log_EDBIMIManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling initial download", v4, 2u);
  }

  -[EDBIMIManager _downloadUndownloadedIndicators](self);
}

- (void)_downloadUndownloadedIndicators
{
  id v1;
  id location;

  if (val)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, val);
    objc_copyWeak(&v1, &location);
    EMPrivacyProxyIsDisabledForNetwork();
    objc_destroyWeak(&v1);
    objc_destroyWeak(&location);
  }
}

- (void)test_tearDown
{
  id v4;
  id v5;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDBIMIManager.m"), 80, CFSTR("%s can only be called from unit tests"), "-[EDBIMIManager test_tearDown]");

  }
  -[EDBIMIManager downloadScheduler](self, "downloadScheduler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSyncBlock:", &__block_literal_global_30);

}

- (id)processBIMIHeadersForMessages:(id)a3
{
  uint64_t v3;
  uint64_t i;
  void *v5;
  __int16 v6;
  NSObject *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int IsAllowlisted;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  char v47;
  void *v48;
  int v49;
  void (**v50)(void *, id, void *, void *, uint64_t);
  id obj;
  void *v52;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t v57[16];
  _QWORD v58[5];
  id v59;
  id v60;
  _BYTE *v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD aBlock[5];
  _BYTE buf[24];
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__EDBIMIManager_processBIMIHeadersForMessages___block_invoke;
  aBlock[3] = &unk_1E949B550;
  aBlock[4] = self;
  v50 = (void (**)(void *, id, void *, void *, uint64_t))_Block_copy(aBlock);
  v47 = objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 22);
  v49 = objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 23);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v39;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (v3)
  {
    v55 = *(_QWORD *)v65;
    do
    {
      v56 = v3;
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v65 != v55)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v6 = objc_msgSend(v5, "authenticationState");
        if ((v6 & 0xE08) != 0x408 || (v6 & 0x30) == 16)
        {
          _ef_log_EDBIMIManager();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v5;
            _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Skipping BIMI due to on-device message authentication failure for message %@", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v5, "headers");
          v8 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D1E708], "authenticationResultsForHeaders:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = 0;
          v63 = 0;
          v10 = -[EDBIMIManager _bimiPassedWithAuthenticationResults:authenticationServiceIdentifier:bimiStatement:]((uint64_t)self, v9, &v63, &v62);
          v11 = v63;
          v12 = v62;
          v13 = v12;
          if ((v10 & 1) != 0)
          {
            -[NSObject encodedHeaders](v8, "encodedHeaders");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            EMRecodeDataToNetwork();
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0D1E690], "bimiDataForHeaders:", v8);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v5, "account");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "hostname");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "ef_urlWithString:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "ef_highLevelDomain");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if ((v47 & 1) != 0)
              IsAllowlisted = 0;
            else
              IsAllowlisted = EMBIMIIncomingServerHighLevelDomainIsAllowlisted();
            v21 = -[EDBIMIManager _validateDKIMSignatureAndAuthenticationResultsDomainForMessage:withHeaderData:incomingMailServerDomain:authenticationServiceIdentifier:allAuthenticationResults:logFailure:]((uint64_t)self, v5, v52, v19, v11, v9, v49 & ~IsAllowlisted);
            if (((IsAllowlisted | v49 & v21) & 1) != 0)
            {
              objc_msgSend(v54, "location");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "evidenceLocation");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22 && v48)
              {
                objc_msgSend(v54, "indicator");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "objectForKeyedSubscript:", v22);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v44
                  || v45
                  && (objc_msgSend(v44, "indicator"),
                      v23 = (void *)objc_claimAutoreleasedReturnValue(),
                      v24 = v23 == 0,
                      v23,
                      v24))
                {
                  objc_msgSend(v43, "setObject:forKeyedSubscript:", v54, v22);
                }
                objc_msgSend(v41, "objectForKeyedSubscript:", v22);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v25;
                if (v25)
                {
                  objc_msgSend(v25, "addObject:", v5);
                }
                else
                {
                  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, 0);
                  objc_msgSend(v41, "setObject:forKeyedSubscript:", v26, v22);
                }
                v50[2](v50, v11, v13, v54, v21);
                _ef_log_EDBIMIManager();
                v46 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = v22;
                  if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
                  {
                    objc_msgSend(v42, "absoluteString");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v29 = (void *)MEMORY[0x1E0D1EF48];
                    objc_msgSend(v42, "absoluteString");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "fullyRedactedStringForString:", v40);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  *(_DWORD *)buf = 138543874;
                  v30 = CFSTR(" and indicator");
                  if (!v45)
                    v30 = &stru_1E94A4508;
                  *(_QWORD *)&buf[4] = v28;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v30;
                  *(_WORD *)&buf[22] = 2114;
                  v70 = v5;
                  _os_log_impl(&dword_1D2F2C000, v46, OS_LOG_TYPE_DEFAULT, "Adding BIMI url (%{public}@)%@ for message: %{public}@", buf, 0x20u);

                }
              }
              else
              {
                v50[2](v50, v11, v13, v54, v21);
              }

            }
            else
            {
              if ((v49 & 1) == 0)
              {
                _ef_log_EDBIMIManager();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v5;
                  _os_log_impl(&dword_1D2F2C000, v27, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because mail provider is not allowlisted for message %@", buf, 0xCu);
                }

              }
              v50[2](v50, v11, v13, v54, v21);
            }

          }
          else
          {
            v50[2](v50, v11, v12, 0, 0);
          }

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    }
    while (v3);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v70) = 0;
  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __47__EDBIMIManager_processBIMIHeadersForMessages___block_invoke_67;
  v58[3] = &unk_1E949B578;
  v58[4] = self;
  v32 = v31;
  v59 = v32;
  v33 = v41;
  v60 = v33;
  v61 = buf;
  objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v58);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    _ef_log_EDBIMIManager();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_1D2F2C000, v34, OS_LOG_TYPE_DEFAULT, "May have undownloaded indicators, downloading now", v57, 2u);
    }

    -[EDBIMIManager _downloadUndownloadedIndicators](self);
  }
  else if (objc_msgSend(v43, "count"))
  {
    _ef_log_EDBIMIManager();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_1D2F2C000, v35, OS_LOG_TYPE_DEFAULT, "All BIMI messages have embedded indicators", v57, 2u);
    }

  }
  v36 = v60;
  v37 = v32;

  _Block_object_dispose(buf, 8);
  return v37;
}

void __47__EDBIMIManager_processBIMIHeadersForMessages___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v6 = a2;
  v7 = a3;
  v11 = a4;
  v8 = v11;
  v9 = v7;
  v10 = v6;
  AnalyticsSendEventLazy();

}

id __47__EDBIMIManager_processBIMIHeadersForMessages___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[10];
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v29 = *(void **)(a1 + 32);
  v2 = v29;
  v30[0] = CFSTR("authservID");
  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v31 = v2;
  v30[1] = CFSTR("hasBIMIResult");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)(a1 + 40) != 0);
  v32 = objc_claimAutoreleasedReturnValue();
  v30[2] = CFSTR("bimiResult");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 48);
  v27 = (void *)v32;
  objc_msgSend(*(id *)(a1 + 40), "result");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", -[EDBIMIManager _analyticsValueForResultString:isBIMIStatementResult:](v4, v28, 1));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v25;
  v30[3] = CFSTR("vmcResult");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "valueForPropertyType:property:", *MEMORY[0x1E0D1E4E8], CFSTR("authority"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", -[EDBIMIManager _analyticsValueForResultString:isBIMIStatementResult:](v6, v26, 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v24;
  v30[4] = CFSTR("hasLocation");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 56), "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", v23 != 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v22;
  v30[5] = CFSTR("hasEvidenceLocation");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 56), "evidenceLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", v21 != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v9;
  v30[6] = CFSTR("hasIndicator");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 56), "indicator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", v11 != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v12;
  v30[7] = CFSTR("hasIndicatorHash");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 56), "indicatorHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInt:", v14 != 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v15;
  v30[8] = CFSTR("indicatorHashAlgorithm");
  objc_msgSend(*(id *)(a1 + 56), "hashAlgorithm");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39 = v17;
  v30[9] = CFSTR("hasDKIMSignature");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, v30, 10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  if (!v29)

  return v19;
}

- (uint64_t)_analyticsValueForResultString:(char)a3 isBIMIStatementResult:
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  char v9;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("pass")) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("fail"));
      v9 = v8 | a3 ^ 1;
      if (v8)
        v7 = 2;
      else
        v7 = 0;
      if ((v9 & 1) == 0)
      {
        if ((objc_msgSend(v6, "isEqualToString:", CFSTR("temperror")) & 1) != 0)
        {
          v7 = 3;
        }
        else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("declined")) & 1) != 0)
        {
          v7 = 4;
        }
        else if (objc_msgSend(v6, "isEqualToString:", CFSTR("skipped")))
        {
          v7 = 5;
        }
        else
        {
          v7 = 0;
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)_bimiPassedWithAuthenticationResults:(_QWORD *)a3 authenticationServiceIdentifier:(_QWORD *)a4 bimiStatement:
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (a1)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v20 = a3;
      v11 = v8;
      v12 = a4;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v15, "firstStatementForMethod:", CFSTR("bimi"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v15, "authenticationServiceIdentifier");
            a4 = v12;
            v8 = v11;
            a3 = v20;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v10)
          continue;
        break;
      }
      v17 = 0;
      v16 = 0;
      a4 = v12;
      v8 = v11;
      a3 = v20;
    }
    else
    {
      v17 = 0;
      v16 = 0;
    }
LABEL_13:

    objc_msgSend(v16, "result");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("pass")))
      a1 = -[EDBIMIManager _vmcWasVerifiedWithBIMIStatement:](a1, v16);
    else
      a1 = 0;

    if (a3)
      *a3 = objc_retainAutorelease(v17);
    if (a4)
      *a4 = objc_retainAutorelease(v16);

  }
  return a1;
}

- (uint64_t)_validateDKIMSignatureAndAuthenticationResultsDomainForMessage:(void *)a3 withHeaderData:(void *)a4 incomingMailServerDomain:(void *)a5 authenticationServiceIdentifier:(void *)a6 allAuthenticationResults:(int)a7 logFailure:
{
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v35;
  char v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  int v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  unsigned __int8 v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v57 = a2;
  v58 = a3;
  v13 = a4;
  v52 = a5;
  v55 = a6;
  if (!a1)
  {
    v33 = 0;
    goto LABEL_30;
  }
  v64 = 0;
  v53 = objc_alloc_init(MEMORY[0x1E0D1E6B0]);
  objc_msgSend(v53, "verificationContextForMessageData:error:", v58, &v64);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v64;
  v54 = v14;
  if (v14)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v14, "dkimSignatureHeaders");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = a1;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    v51 = a7;
    if (v16)
    {
      v17 = *(_QWORD *)v61;
LABEL_5:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v61 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v19, "signingDomainIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "ef_urlWithString:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "ef_highLevelDomain");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v23, "ef_caseInsensitiveIsEqualToString:", v13) & 1) != 0)
          break;

        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
          if (v16)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
      v24 = v19;

      if (!v24)
        goto LABEL_20;
      objc_msgSend(v24, "bodyLength");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25
        || (objc_msgSend(v24, "bodyLength"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v27 = objc_msgSend(v26, "unsignedIntegerValue") == 0,
            v26,
            v25,
            !v27))
      {
        if (v51)
        {
          _ef_log_EDBIMIManager();
          v28 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v24, "bodyLength");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v67 = v29;
            v68 = 2112;
            v69 = v57;
            _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because DKIM body length was non-zero (%@) for message %@", buf, 0x16u);

          }
        }
LABEL_19:
        v65 = 0;

        goto LABEL_29;
      }
      v35 = -[EDBIMIManager _authenticationResultsCountSignedByDKIMHeader:](v50, v24);
      if (v35 != objc_msgSend(v55, "count"))
      {
        if (v51)
        {
          _ef_log_EDBIMIManager();
          v45 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v56, "ef_publicDescription");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v67 = v57;
            v68 = 2114;
            v69 = v46;
            _os_log_impl(&dword_1D2F2C000, v45, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because DKIM signature does not include all authentication-results for message %@: %{public}@", buf, 0x16u);

          }
        }
        goto LABEL_19;
      }
      v59 = 0;
      v36 = objc_msgSend(v53, "verifyMessageWithContext:options:error:", v54, 1, &v59);
      v37 = v59;

      if ((v36 & 1) == 0)
      {
        if (v51)
        {
          _ef_log_EDBIMIManager();
          v47 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v37, "ef_publicDescription");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v67 = v57;
            v68 = 2114;
            v69 = v48;
            _os_log_impl(&dword_1D2F2C000, v47, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because DKIM verification failed for message %@: %{public}@", buf, 0x16u);

          }
        }
        v65 = 0;

        goto LABEL_53;
      }

      objc_msgSend(MEMORY[0x1E0C99E98], "ef_urlWithString:", v52);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "ef_highLevelDomain");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v39, "ef_caseInsensitiveIsEqualToString:", v13) & 1) == 0)
      {
        objc_msgSend(v55, "firstObject");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v40, "authenticationServiceIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "ef_urlWithString:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "ef_highLevelDomain");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v39, "ef_caseInsensitiveIsEqualToString:", v44) & 1) == 0)
        {
          if (v51)
          {
            _ef_log_EDBIMIManager();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413058;
              v67 = v39;
              v68 = 2112;
              v69 = v13;
              v70 = 2112;
              v71 = v44;
              v72 = 2112;
              v73 = v57;
              _os_log_impl(&dword_1D2F2C000, v49, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because authserv-id of BIMI statement (%@) does not match mail server domain %@ or first authserv-id (%@) for message %@", buf, 0x2Au);
            }

          }
          v65 = 0;

          goto LABEL_52;
        }

      }
      v65 = 1;
LABEL_52:

LABEL_53:
      v56 = v37;
      goto LABEL_29;
    }
LABEL_11:

LABEL_20:
    if (v51)
    {
      _ef_log_EDBIMIManager();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v57;
        _os_log_impl(&dword_1D2F2C000, v30, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because no DKIM signature with correct domain was found for message %@", buf, 0xCu);
      }

    }
  }
  else if (a7)
  {
    _ef_log_EDBIMIManager();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v56, "ef_publicDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v67 = v57;
      v68 = 2114;
      v69 = v32;
      _os_log_impl(&dword_1D2F2C000, v31, OS_LOG_TYPE_DEFAULT, "Blocking BIMI because header could not be parsed for message %@: %{public}@", buf, 0x16u);

    }
  }
  v65 = 0;
LABEL_29:

  v33 = v65;
LABEL_30:

  return v33;
}

void __47__EDBIMIManager_processBIMIHeadersForMessages___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "addBrandIndicatorWithData:", v5);

  if (v7 != *MEMORY[0x1E0D1DC08])
  {
    v8 = objc_alloc(MEMORY[0x1E0D1EF38]);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFirst:second:", v14, v9);
    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  }
  objc_msgSend(v5, "indicator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

}

- (uint64_t)_authenticationResultsCountSignedByDKIMHeader:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "signedHeaderFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_filter:", &__block_literal_global_72);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __63__EDBIMIManager__authenticationResultsCountSignedByDKIMHeader___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_caseInsensitiveIsEqualToString:", *MEMORY[0x1E0D1E508]);
}

- (uint64_t)_vmcWasVerifiedWithBIMIStatement:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "valueForPropertyType:property:", *MEMORY[0x1E0D1E4E8], CFSTR("authority"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("pass"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _ef_log_EDBIMIManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("enabled");
    if (a2)
      v5 = CFSTR("disabled");
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Scheduling indicator download, privacy proxy is %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "downloadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_77;
  v7[3] = &unk_1E949B608;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v9 = a2;
  objc_msgSend(v6, "performBlock:", v7);

  objc_destroyWeak(&v8);
}

void __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_77(uint64_t a1)
{
  char *WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  void *v23;
  char *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[6];
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v24 = WeakRetained;
    objc_msgSend(WeakRetained, "messagePersistence");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "urlSession");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "undownloadedBrandIndicatorsWithLimit:", 10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _ef_log_EDBIMIManager();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v37 = objc_msgSend(v19, "count");
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Downloading %lu indicators", buf, 0xCu);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v19;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v4)
    {
      v21 = *(_QWORD *)v32;
      v5 = (os_unfair_lock_s *)(v24 + 16);
      do
      {
        v26 = v4;
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v7, "location");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = *(unsigned __int8 *)(a1 + 40);
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_79;
          v27[3] = &unk_1E949B5E0;
          v27[4] = v24;
          v27[5] = v7;
          v28 = v25;
          v11 = v8;
          v29 = v11;
          v12 = v9;
          v30 = v12;
          objc_msgSend(v23, "dataTaskWithRequest:isSynthetic:allowProxying:failOpen:completionHandler:", v12, 1, 1, v10, v27);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_lock(v5);
          objc_msgSend(*((id *)v24 + 1), "setObject:forKeyedSubscript:", v13, v12);
          os_unfair_lock_unlock(v5);
          objc_msgSend(v13, "resume");
          _ef_log_EDBIMIManager();
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v11;
            if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13))
            {
              objc_msgSend(v15, "absoluteString");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v17 = (void *)MEMORY[0x1E0D1EF48];
              objc_msgSend(v15, "absoluteString");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "fullyRedactedStringForString:", v18);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

            }
            *(_DWORD *)buf = 138543362;
            v37 = (uint64_t)v16;
            _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Requesting indicator data for URL: %{public}@", buf, 0xCu);

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v4);
    }

    v2 = v24;
  }

}

void __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_79(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  os_unfair_lock_s *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  id (*v37)(unsigned __int8 *);
  void *v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    v11 = -[EDBIMIManager _indicatorIsValid:forBIMIData:](v10, v7, *(void **)(a1 + 40));
    v12 = *(void **)(a1 + 48);
    if (v11)
    {
      objc_msgSend(v12, "setBrandIndicator:forURL:", v7, *(_QWORD *)(a1 + 56));
      *(_QWORD *)&v36 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v36 + 1) = 3221225472;
      v37 = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_3;
      v38 = &__block_descriptor_35_e19___NSDictionary_8__0l;
      LOWORD(v39) = 257;
      BYTE2(v39) = 1;
      AnalyticsSendEventLazy();
      _ef_log_EDBIMIManager();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(id *)(a1 + 56);
        if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13, (_QWORD)v36, *((_QWORD *)&v36 + 1), v37, v38, v39, v40))
        {
          objc_msgSend(v14, "absoluteString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = (void *)MEMORY[0x1E0D1EF48];
          objc_msgSend(v14, "absoluteString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "fullyRedactedStringForString:", v24);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        LODWORD(v36) = 138543362;
        *(_QWORD *)((char *)&v36 + 4) = v15;
        _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Persisted indicator data for URL: %{public}@", (uint8_t *)&v36, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v12, "removeBrandIndicatorForURL:", *(_QWORD *)(a1 + 56));
      *(_QWORD *)&v36 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v36 + 1) = 3221225472;
      v37 = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_3;
      v38 = &__block_descriptor_35_e19___NSDictionary_8__0l;
      LOWORD(v39) = 1;
      BYTE2(v39) = 1;
      AnalyticsSendEventLazy();
      _ef_log_EDBIMIManager();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(id *)(a1 + 56);
        if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13, (_QWORD)v36, *((_QWORD *)&v36 + 1), v37, v38, v39, v40))
        {
          objc_msgSend(v19, "absoluteString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v25 = (void *)MEMORY[0x1E0D1EF48];
          objc_msgSend(v19, "absoluteString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "fullyRedactedStringForString:", v26);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        LODWORD(v36) = 138543362;
        *(_QWORD *)((char *)&v36 + 4) = v20;
        _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Removed invalid indicator URL: %{public}@", (uint8_t *)&v36, 0xCu);

      }
    }

    v27 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 16);
    os_unfair_lock_lock(v27);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 64));
    v28 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
    os_unfair_lock_unlock(v27);
    if (!v28 && -[EDBIMIManager _shouldScheduleAnotherDownloadBatch](*(void **)(a1 + 32)))
    {
      _ef_log_EDBIMIManager();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_1D2F2C000, v29, OS_LOG_TYPE_DEFAULT, "Scheduling another download batch", (uint8_t *)&v36, 2u);
      }

      -[EDBIMIManager _downloadUndownloadedIndicators](*(id *)(a1 + 32));
    }
  }
  else
  {
    if (-[EDBIMIManager _isRecoverableError:](v10, v9))
    {
      *(_QWORD *)&v36 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v36 + 1) = 3221225472;
      v37 = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_3;
      v38 = &__block_descriptor_35_e19___NSDictionary_8__0l;
      LOWORD(v39) = 0;
      BYTE2(v39) = 1;
      AnalyticsSendEventLazy();
      _ef_log_EDBIMIManager();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = *(id *)(a1 + 56);
        if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13, (_QWORD)v36, *((_QWORD *)&v36 + 1), v37, v38, v39, v40))
        {
          objc_msgSend(v17, "absoluteString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = (void *)MEMORY[0x1E0D1EF48];
          objc_msgSend(v17, "absoluteString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "fullyRedactedStringForString:", v31);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v32 = v18;
        objc_msgSend(v9, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_79_cold_1();
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "removeBrandIndicatorForURL:", *(_QWORD *)(a1 + 56));
      *(_QWORD *)&v36 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v36 + 1) = 3221225472;
      v37 = __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_3;
      v38 = &__block_descriptor_35_e19___NSDictionary_8__0l;
      LOWORD(v39) = 0;
      BYTE2(v39) = 1;
      AnalyticsSendEventLazy();
      _ef_log_EDBIMIManager();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v21 = *(id *)(a1 + 56);
        if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 13, (_QWORD)v36, *((_QWORD *)&v36 + 1), v37, v38, v39, v40))
        {
          objc_msgSend(v21, "absoluteString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v33 = (void *)MEMORY[0x1E0D1EF48];
          objc_msgSend(v21, "absoluteString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "fullyRedactedStringForString:", v34);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v35 = v22;
        objc_msgSend(v9, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_79_cold_2();
      }
    }

  }
}

id __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_3(unsigned __int8 *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("downloadSucceeded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[32]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("indicatorIsValid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[33]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("usedPrivacyProxy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[34]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)_indicatorIsValid:(void *)a3 forBIMIData:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  __int128 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1)
  {
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v6, "hashAlgorithm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("sha256"));

  if (!v9)
  {
    _ef_log_EDBIMIManager();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[EDBIMIManager _indicatorIsValid:forBIMIData:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);

    goto LABEL_11;
  }
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33 = v10;
  v34 = v10;
  v11 = objc_retainAutorelease(v5);
  CC_SHA256((const void *)objc_msgSend(v11, "bytes", v33, v34), objc_msgSend(v11, "length"), (unsigned __int8 *)&v33);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v33, 32);
  objc_msgSend(v12, "base64EncodedStringWithOptions:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indicatorHash");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    _ef_log_EDBIMIManager();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[EDBIMIManager _indicatorIsValid:forBIMIData:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  }
LABEL_12:

  return v15;
}

- (BOOL)_shouldScheduleAnotherDownloadBatch
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  objc_msgSend(a1, "messagePersistence");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "undownloadedBrandIndicatorsWithLimit:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (uint64_t)_isRecoverableError:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  unint64_t v7;
  unsigned int v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

    if (v6)
    {
      v7 = __ROR8__(objc_msgSend(v4, "code") + 1009, 1);
      v8 = (0x35u >> v7) & 1;
      if (v7 >= 6)
        a1 = 0;
      else
        a1 = v8;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EMRemoteContentURLSession)urlSession
{
  return self->_urlSession;
}

- (EFScheduler)downloadScheduler
{
  return self->_downloadScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadScheduler, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_activeDataTasksByRequest, 0);
}

void __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_79_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Temporarily unable to request indicator data for URL: %{public}@ due to error: %{public}@", v5, v6);

}

void __48__EDBIMIManager__downloadUndownloadedIndicators__block_invoke_79_cold_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Permanently unable to request indicator data for URL: %{public}@ due to error: %{public}@", v5, v6);

}

- (void)_indicatorIsValid:(uint64_t)a3 forBIMIData:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "BIMI indicator does not have expected hash", a5, a6, a7, a8, 0);
}

- (void)_indicatorIsValid:(uint64_t)a3 forBIMIData:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "BIMI indicator hash is using unsupported algorithm", a5, a6, a7, a8, 0);
}

@end
