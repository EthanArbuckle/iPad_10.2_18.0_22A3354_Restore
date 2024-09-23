@implementation FCCKContentFetchOperation

void __45__FCCKContentFetchOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_msgSend(*(id *)(a1 + 32), "relativePriority");
  v5 = 300;
  if (!v4)
    v5 = 200;
  if (v4 == -1)
    v5 = 100;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%lu"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("X-Apple-CloudKit-Request-Priority"));

  v7 = *(_QWORD *)(a1 + 32);
  if (v7 && *(_BYTE *)(v7 + 368))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("X-Apple-Permanent-Asset-URLs"));

}

- (BOOL)validateOperation
{
  FCCKContentFetchOperation *v2;
  FCCKContentDatabase *v3;
  NSArray *recordIDs;
  FCCKContentDatabase *v5;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v2 = self;
  v16 = *MEMORY[0x1E0C80C00];
  if (!self || (v3 = self->_database) == 0 || (recordIDs = v2->_recordIDs, v3, !recordIDs))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid operation"));
      v8 = 136315906;
      v9 = "-[FCCKContentFetchOperation validateOperation]";
      v10 = 2080;
      v11 = "FCCKContentFetchOperation.m";
      v12 = 1024;
      v13 = 60;
      v14 = 2114;
      v15 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);

      if (!v2)
        return (char)v2;
    }
    else if (!v2)
    {
      return (char)v2;
    }
  }
  v5 = v2->_database;
  if (v5)
  {
    LOBYTE(v2) = v2->_recordIDs != 0;

  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return (char)v2;
}

void __45__FCCKContentFetchOperation_performOperation__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  id *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id WeakRetained;
  void *v39;
  void *v40;
  id v41;
  const char *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  char *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  void *v64;
  id v65;
  uint64_t v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v50 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v48 = v7;
    obj = v7;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v54;
      v13 = &OBJC_IVAR___FCPrivateDataContext__userEventHistory;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v54 != v12)
            objc_enumerationMutation(obj);
          v15 = *(id **)(*((_QWORD *)&v53 + 1) + 8 * v14);
          v16 = *(void **)(a1 + 32);
          if (v15)
          {
            v17 = *(id *)((char *)v15 + v13[701]);
            v18 = v17;
            if (v17)
            {
              v19 = (void *)*((_QWORD *)v17 + 1);
              goto LABEL_10;
            }
          }
          else
          {
            v18 = 0;
          }
          v19 = 0;
LABEL_10:
          v20 = v19;
          objc_msgSend(v16, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
            goto LABEL_25;
          if (!v15)
          {
            v23 = 0;
LABEL_30:
            v24 = 0;
            goto LABEL_14;
          }
          v22 = *(id *)((char *)v15 + v13[701]);
          v23 = v22;
          if (!v22)
            goto LABEL_30;
          v24 = (void *)*((_QWORD *)v22 + 1);
LABEL_14:
          v25 = v24;
          objc_msgSend(v8, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            objc_msgSend(v51, "setObject:forKey:", v26, v21);
            v27 = 0;
          }
          else
          {
            +[FCCKProtocolTranslator sharedInstance]();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCCKPResponseOperation recordRetrieveResponse](v15);
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = (void *)v29;
            if (v29)
              v31 = *(void **)(v29 + 8);
            else
              v31 = 0;
            v32 = v31;
            -[FCCKProtocolTranslator recordFromPRecord:]((uint64_t)v28, v32);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
              objc_msgSend(v49, "setObject:forKey:", v27, v21);
            v8 = v50;
          }
          v33 = *(_QWORD *)(a1 + 40);
          if (v33)
          {
            v34 = *(_QWORD *)(v33 + 408);
            if (v34)
              (*(void (**)(uint64_t, void *, void *, void *))(v34 + 16))(v34, v27, v21, v26);
          }

          v13 = &OBJC_IVAR___FCPrivateDataContext__userEventHistory;
LABEL_25:

          ++v14;
        }
        while (v11 != v14);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
        v11 = v35;
      }
      while (v35);
    }

    -[FCCKContentFetchOperation setResultRecordsByRecordID:](*(_QWORD *)(a1 + 40), v49);
    if (objc_msgSend(v51, "count"))
    {
      v66 = *MEMORY[0x1E0C94940];
      v67 = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94EA8], "errorWithCode:userInfo:format:", 1011, v36, CFSTR("Failed to fetch some records"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "CKClientSuitableError");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    v7 = v48;

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v39 = WeakRetained;
  if (WeakRetained)
    v40 = (void *)*((_QWORD *)WeakRetained + 57);
  else
    v40 = 0;
  v41 = v40;
  v65 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *(void **)(a1 + 40);
  if (v44)
    objc_setProperty_nonatomic_copy(v44, v42, v43, 424);

  objc_msgSend(v9, "domain");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0C94878]);

  if (v46 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't return errors from the internal domain"));
    *(_DWORD *)buf = 136315906;
    v58 = "-[FCCKContentFetchOperation performOperation]_block_invoke_6";
    v59 = 2080;
    v60 = "FCCKContentFetchOperation.m";
    v61 = 1024;
    v62 = 176;
    v63 = 2114;
    v64 = v47;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishedPerformingOperationWithError:", v9);

}

- (void)setResultRecordsByRecordID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 432), a2);
}

- (void)performOperation
{
  FCCKContentDatabase *database;
  id v3;
  FCCKContentFetchOperation *v4;
  id perRecordCompletionBlock;
  BOOL v6;
  FCCKContentDatabase *v7;
  NSArray *recordIDs;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _BYTE *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  FCCKDirectRequestOperation *v39;
  FCCKContentDatabase *v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  FCCKContentDatabase *v45;
  const char *v46;
  void *v47;
  BOOL v48;
  const char *v49;
  SEL v50;
  FCCKContentFetchOperation *v51;
  FCCKContentDatabase *v52;
  BOOL v53;
  void *v54;
  const char *v55;
  int networkEventType;
  id v57;
  const char *v58;
  void *v59;
  const char *v60;
  void *v61;
  char v62;
  const char *v63;
  SEL v64;
  id v65;
  id v66;
  NSArray *obj;
  uint64_t v68;
  void *v69;
  id newValue;
  uint64_t v71;
  uint64_t v72;
  id v74;
  _QWORD v75[4];
  id v76;
  FCCKContentFetchOperation *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  id location[19];

  location[16] = *(id *)MEMORY[0x1E0C80C00];
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __45__FCCKContentFetchOperation_performOperation__block_invoke;
  v85[3] = &unk_1E463AA78;
  v85[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionary:", v85);
  v65 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
    database = self->_database;
  else
    database = 0;
  if (-[FCCKContentDatabase shouldUseCloudd](database, "shouldUseCloudd", v65))
  {
    v3 = objc_alloc(MEMORY[0x1E0C94E18]);
    if (self)
    {
      newValue = (id)objc_msgSend(v3, "initWithRecordIDs:", self->_recordIDs);
      objc_msgSend(newValue, "setRecordIDsToETags:", self->_recordIDsToETags);
      objc_msgSend(newValue, "setDesiredKeys:", self->_desiredKeys);
      v4 = self;
      perRecordCompletionBlock = self->_perRecordCompletionBlock;
    }
    else
    {
      newValue = (id)objc_msgSend(v3, "initWithRecordIDs:", 0);
      objc_msgSend(newValue, "setRecordIDsToETags:", 0);
      objc_msgSend(newValue, "setDesiredKeys:", 0);
      perRecordCompletionBlock = 0;
      v4 = 0;
    }
    v6 = v4 == 0;
    objc_msgSend(newValue, "setPerRecordCompletionBlock:", perRecordCompletionBlock);
    objc_msgSend(newValue, "setAdditionalRequestHTTPHeaders:", v66);
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __45__FCCKContentFetchOperation_performOperation__block_invoke_2;
    v84[3] = &unk_1E463D040;
    v84[4] = self;
    objc_msgSend(newValue, "setFetchRecordsCompletionBlock:", v84);
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __45__FCCKContentFetchOperation_performOperation__block_invoke_3;
    v83[3] = &unk_1E4643350;
    v83[4] = self;
    objc_msgSend(newValue, "setRequestCompletedBlock:", v83);
    -[FCOperation associateChildOperation:](self, "associateChildOperation:", newValue);
    if (v6)
      v7 = 0;
    else
      v7 = self->_database;
    -[FCCKContentDatabase addOperation:](v7, "addOperation:", newValue);
    goto LABEL_66;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  newValue = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  if (self)
    recordIDs = self->_recordIDs;
  else
    recordIDs = 0;
  obj = recordIDs;
  v71 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
  if (v71)
  {
    v68 = *(_QWORD *)v80;
    do
    {
      v72 = 0;
      do
      {
        if (*(_QWORD *)v80 != v68)
          objc_enumerationMutation(obj);
        v74 = *(id *)(*((_QWORD *)&v79 + 1) + 8 * v72);
        if (self)
        {
          v9 = (id *)objc_opt_new();
          v10 = (void *)objc_opt_new();
          -[FCCKPRequestOperation setRequest:]((uint64_t)v9, v10);

          CKCreateGUID();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v9)
          {
            v13 = v9[4];
            -[FCCKPOperation setOperationUUID:]((uint64_t)v13, v12);

            v14 = v9[4];
            if (v14)
            {
              v14[24] |= 1u;
              *((_DWORD *)v14 + 4) = 211;
            }
          }
          else
          {

            v14 = 0;
          }

          v15 = (void *)objc_opt_new();
          -[FCCKPRequestOperation setRecordRetrieveRequest:]((uint64_t)v9, v15);

          +[FCCKProtocolTranslator sharedInstance]();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCKProtocolTranslator pRecordIdentifierFromRecordID:]((uint64_t)v16, v74);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCKPRequestOperation recordRetrieveRequest](v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCKPRecordRetrieveRequest setRecordIdentifier:]((uint64_t)v18, v17);

          -[NSDictionary objectForKeyedSubscript:](self->_recordIDsToETags, "objectForKeyedSubscript:", v74);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCKPRequestOperation recordRetrieveRequest](v9);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCKPRecordRetrieveRequest setClientVersionETag:]((uint64_t)v20, v19);

          if (self->_desiredKeys)
          {
            v21 = (void *)objc_opt_new();
            -[FCCKPRequestOperation recordRetrieveRequest](v9);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[FCCKPRecordRetrieveRequest setRequestedFields:]((uint64_t)v22, v21);

            v88 = 0u;
            v89 = 0u;
            v86 = 0u;
            v87 = 0u;
            v23 = self->_desiredKeys;
            v24 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v86, location, 16);
            if (v24)
            {
              v25 = *(_QWORD *)v87;
              do
              {
                v26 = 0;
                do
                {
                  if (*(_QWORD *)v87 != v25)
                    objc_enumerationMutation(v23);
                  v27 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v26);
                  v28 = (void *)objc_opt_new();
                  objc_msgSend(v28, "setName:", v27);
                  -[FCCKPRequestOperation recordRetrieveRequest](v9);
                  v29 = objc_claimAutoreleasedReturnValue();
                  v30 = (void *)v29;
                  if (v29)
                    v31 = *(void **)(v29 + 24);
                  else
                    v31 = 0;
                  v32 = v31;
                  -[FCCKPRequestedFields addFields:]((uint64_t)v32, v28);

                  ++v26;
                }
                while (v24 != v26);
                v33 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v86, location, 16);
                v24 = v33;
              }
              while (v33);
            }

          }
        }
        else
        {
          v9 = 0;
        }

        objc_msgSend(newValue, "addObject:", v9);
        if (v9)
        {
          v34 = v9[4];
          v35 = v34;
          if (v34)
          {
            v36 = (void *)*((_QWORD *)v34 + 1);
            goto LABEL_36;
          }
        }
        else
        {
          v35 = 0;
        }
        v36 = 0;
LABEL_36:
        v37 = v36;
        objc_msgSend(v69, "setObject:forKey:", v74, v37);

        ++v72;
      }
      while (v72 != v71);
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
      v71 = v38;
    }
    while (v38);
  }

  v39 = [FCCKDirectRequestOperation alloc];
  if (self)
    v40 = self->_database;
  else
    v40 = 0;
  -[FCCKContentDatabase networkReachability](v40, "networkReachability");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[FCCKDirectRequestOperation initWithNetworkReachability:](v39, "initWithNetworkReachability:", v41);

  if (v42)
    *(_QWORD *)(v42 + 408) = 1;
  if (self)
  {
    -[FCCKContentDatabase baseURLForRecordFetch](self->_database, "baseURLForRecordFetch");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      objc_setProperty_nonatomic_copy((id)v42, v43, v44, 392);

    v45 = self->_database;
  }
  else
  {
    objc_msgSend(0, "baseURLForRecordFetch");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
      objc_setProperty_nonatomic_copy((id)v42, v60, v61, 392);

    v45 = 0;
  }
  -[FCCKContentDatabase containerIdentifier](v45, "containerIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
    objc_setProperty_nonatomic_copy((id)v42, v46, v47, 400);

  if (self)
  {
    v48 = -[FCCKContentDatabase isProductionEnvironment](self->_database, "isProductionEnvironment");
    if (v42)
    {
      *(_BYTE *)(v42 + 376) = v48;
      objc_setProperty_nonatomic_copy((id)v42, v49, newValue, 384);
      objc_setProperty_nonatomic_copy((id)v42, v50, v66, 416);
    }
    v51 = self;
    v52 = self->_database;
  }
  else
  {
    v62 = objc_msgSend(0, "isProductionEnvironment");
    if (v42)
    {
      *(_BYTE *)(v42 + 376) = v62;
      objc_setProperty_nonatomic_copy((id)v42, v63, newValue, 384);
      objc_setProperty_nonatomic_copy((id)v42, v64, v66, 416);
    }
    v52 = 0;
    v51 = 0;
  }
  v53 = v51 == 0;
  -[FCCKContentDatabase networkBehaviorMonitor](v52, "networkBehaviorMonitor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKDirectRequestOperation setNetworkBehaviorMonitor:](v42, v54);

  if (v53)
  {
    networkEventType = 0;
    if (!v42)
      goto LABEL_60;
    goto LABEL_59;
  }
  networkEventType = self->_networkEventType;
  if (v42)
  {
LABEL_59:
    *(_DWORD *)(v42 + 380) = networkEventType;
    objc_setProperty_nonatomic_copy((id)v42, v55, &__block_literal_global_17_4, 440);
  }
LABEL_60:
  objc_initWeak(location, (id)v42);
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __45__FCCKContentFetchOperation_performOperation__block_invoke_6;
  v75[3] = &unk_1E464B388;
  v57 = v69;
  v76 = v57;
  v77 = self;
  objc_copyWeak(&v78, location);
  if (v42)
    objc_setProperty_nonatomic_copy((id)v42, v58, v75, 448);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v42);
  if (-[FCOperation relativePriority](self, "relativePriority") < 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_throttledCKRequestOperationQueue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addOperation:", v42);

  }
  else
  {
    objc_msgSend((id)v42, "start");
  }
  objc_destroyWeak(&v78);

  objc_destroyWeak(location);
LABEL_66:

}

- (id)throttleGroup
{
  if (self)
    self = (FCCKContentFetchOperation *)self->_database;
  return (id)-[FCCKContentFetchOperation containerIdentifier](self, "containerIdentifier");
}

- (void)operationWillFinishWithError:(id)a3
{
  FCCKContentDatabase *database;
  id v5;
  id fetchRecordsCompletionBlock;
  void (**v7)(id, NSDictionary *, id);
  id v8;

  if (self)
    database = self->_database;
  else
    database = 0;
  v5 = a3;
  -[FCCKContentDatabase maximumRetryAfterForCK](database, "maximumRetryAfterForCK");
  objc_msgSend(v5, "fc_errorWithMaximumRetryAfter:");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (self)
  {
    fetchRecordsCompletionBlock = self->_fetchRecordsCompletionBlock;
    if (fetchRecordsCompletionBlock)
    {
      v7 = (void (**)(id, NSDictionary *, id))fetchRecordsCompletionBlock;
      v7[2](v7, self->_resultRecordsByRecordID, v8);

    }
  }

}

BOOL __45__FCCKContentFetchOperation_performOperation__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "code") == 2006;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRecordsByRecordID, 0);
  objc_storeStrong((id *)&self->_requestUUIDs, 0);
  objc_storeStrong(&self->_fetchRecordsCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordCompletionBlock, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordIDsToETags, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)setDatabase:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 376), a2);
}

- (FCCKContentFetchOperation)init
{
  FCCKContentFetchOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCCKContentFetchOperation;
  result = -[FCOperation init](&v3, sel_init);
  if (result)
    result->_networkEventType = 9;
  return result;
}

- (void)setRecordIDsToETags:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 392), a2);
}

void __45__FCCKContentFetchOperation_performOperation__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  -[FCCKContentFetchOperation setResultRecordsByRecordID:](v5, a2);
  objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v6);

}

void __45__FCCKContentFetchOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  const char *v11;
  void *v12;
  char v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "requestUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)(a1 + 32);
    if (v6 && (v7 = *(id *)(v6 + 424)) != 0)
    {
      v8 = v7;
      v9 = *(_QWORD **)(a1 + 32);
      if (v9)
        v9 = (_QWORD *)v9[53];
      v10 = v9;
      objc_msgSend(v10, "arrayByAddingObject:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
    }
    else
    {
      v15[0] = v5;
      v13 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      v12 = v10;
    }
    v14 = *(void **)(a1 + 32);
    if (v14)
      objc_setProperty_nonatomic_copy(v14, v11, v12, 424);
    if ((v13 & 1) == 0)

  }
}

@end
