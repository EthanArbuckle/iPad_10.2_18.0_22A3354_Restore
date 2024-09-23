@implementation HMBLocalZoneQueryResultRecordIDSequence

- (id)nextObject
{
  __int128 v2;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  HMBLocalZoneQueryResultRecordIDSequence *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  HMBLocalZoneQueryResultRecordIDSequence *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  HMBLocalZoneQueryResultRecordIDSequence *v27;
  NSObject *v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  __int128 v41;
  id v42;
  _QWORD v43[4];
  HMBLocalZoneQueryResultRecordIDSequence *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = 138543874;
  v41 = v2;
  while (1)
  {
    -[HMBSQLQueryIterator error](self, "error", v41);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

    if (!v5)
      goto LABEL_38;
    -[HMBSQLQueryIterator cachedResults](self, "cachedResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_7;
    -[HMBSQLQueryIterator cachedResults](self, "cachedResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {

      goto LABEL_29;
    }
    -[HMBLocalZoneQueryResultRecordIDSequence currentSequenceAsData](self, "currentSequenceAsData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (!v9)
    {
LABEL_7:
      v10 = self;
      while (1)
      {
        -[HMBSQLQueryIterator cachedResults](v10, "cachedResults");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[HMBSQLQueryIterator cachedResults](v10, "cachedResults");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {

LABEL_28:
            break;
          }
          -[HMBLocalZoneQueryResultRecordIDSequence currentSequenceAsData](v10, "currentSequenceAsData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13 == 0;

          if (v14)
            goto LABEL_28;
        }
        v15 = -[HMBSQLQueryIterator maximumRowsPerQuery](v10, "maximumRowsPerQuery");
        v58 = 0;
        v59 = &v58;
        v60 = 0x3032000000;
        v61 = __Block_byref_object_copy__4646;
        v62 = __Block_byref_object_dispose__4647;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v15);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        v52 = 0;
        v53 = &v52;
        v54 = 0x3032000000;
        v55 = __Block_byref_object_copy__4646;
        v56 = __Block_byref_object_dispose__4647;
        v57 = 0;
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v51 = 0;
        -[HMBSQLQueryIterator statement](v10, "statement");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "context");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = ____fetchNextBatch_block_invoke_4649;
        v43[3] = &unk_1E8932BB0;
        v18 = v10;
        v44 = v18;
        v45 = &v52;
        v46 = &v48;
        v47 = &v58;
        objc_msgSend(v17, "sqlBlockWithActivity:block:", 0, v43);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)v59[5];
        if (v20)
        {
          if (*((_BYTE *)v49 + 24) || objc_msgSend(v20, "count"))
          {
            -[HMBLocalZoneQueryResultRecordIDSequence currentSequenceAsData](v18, "currentSequenceAsData");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21 == 0;

            if (!v22)
              -[HMBLocalZoneQueryResultRecordIDSequence setCurrentSequenceAsData:](v18, "setCurrentSequenceAsData:", v53[5]);
            -[HMBSQLQueryIterator cachedResults](v18, "cachedResults");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23 == 0;

            if (v24)
            {
              -[HMBSQLQueryIterator setCachedResults:](v18, "setCachedResults:", v59[5]);
            }
            else
            {
              -[HMBSQLQueryIterator cachedResults](v18, "cachedResults");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObjectsFromArray:", v59[5]);

            }
            v31 = 1;
            goto LABEL_24;
          }
          -[HMBLocalZoneQueryResultRecordIDSequence setCurrentSequenceAsData:](v18, "setCurrentSequenceAsData:", 0);
        }
        else
        {
          v26 = (void *)MEMORY[0x1D17B6230]();
          v27 = v18;
          HMFGetOSLogHandle();
          v28 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v29 = (id)objc_claimAutoreleasedReturnValue();
            -[HMBSQLQueryIterator currentSequence](v27, "currentSequence");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v41;
            v65 = v29;
            v66 = 2112;
            v67 = v30;
            v68 = 2112;
            v69 = v19;
            _os_log_impl(&dword_1CCD48000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch additional items into query enumeration %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v26);
          -[HMBSQLQueryIterator setError:](v27, "setError:", v19);
          -[HMBLocalZoneQueryResultRecordIDSequence setCurrentSequenceAsData:](v27, "setCurrentSequenceAsData:", 0);
          -[HMBSQLQueryIterator setCachedResults:](v27, "setCachedResults:", 0);
        }
        v31 = 0;
LABEL_24:

        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v52, 8);

        _Block_object_dispose(&v58, 8);
        if ((v31 & 1) == 0)
          goto LABEL_28;
      }
    }
LABEL_29:
    -[HMBSQLQueryIterator cachedResults](self, "cachedResults");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v32, "count"))
    {

LABEL_36:
      -[HMBLocalZoneQueryResultRecordIDSequence setCurrentSequenceAsData:](self, "setCurrentSequenceAsData:", 0);
      goto LABEL_38;
    }
    -[HMBSQLQueryIterator error](self, "error");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33 == 0;

    if (!v34)
      goto LABEL_36;
    -[HMBSQLQueryIterator cachedResults](self, "cachedResults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "hmf_dequeue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0;
    -[HMBLocalZoneQueryResultRecordIDSequence fetchRow:error:](self, "fetchRow:error:", v36, &v42);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v42;
    v39 = v38;
    if (!v37)
    {
      if (v38)
        break;
    }

    if (v37)
      return v37;
  }
  -[HMBSQLQueryIterator setError:](self, "setError:", v38);
  -[HMBLocalZoneQueryResultRecordIDSequence setCurrentSequenceAsData:](self, "setCurrentSequenceAsData:", 0);

LABEL_38:
  v37 = 0;
  return v37;
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequenceColumn:(id *)a5 error:(id *)a6
{
  sqlite3_int64 v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = sqlite3_column_int64(a3, 0);
  objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3Column:column:", a3, 1);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZoneQueryResultRecordIDSequence lastReturnedSequence](self, "lastReturnedSequence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", *a5);

  if ((v12 & 1) == 0)
  {
    -[HMBLocalZoneQueryResultRecordIDSequence setLastReturnedSequence:](self, "setLastReturnedSequence:", *a5);
    v17 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBLocalZoneQueryResultRecordIDSequence setReturnedIDs:](self, "setReturnedIDs:", v19);
LABEL_6:

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    return v16;
  }
  -[HMBLocalZoneQueryResultRecordIDSequence returnedIDs](self, "returnedIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (!v15)
  {
    -[HMBLocalZoneQueryResultRecordIDSequence returnedIDs](self, "returnedIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);
    goto LABEL_6;
  }
  *a4 = 1;
  v16 = &unk_1E8947760;
  return v16;
}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 currentSequence:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  _QWORD v11[6];

  v8 = a4;
  -[HMBLocalZoneQueryResult arguments](self, "arguments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__HMBLocalZoneQueryResultRecordIDSequence_bindPropertiesToStatement_currentSequence_error___block_invoke;
  v11[3] = &unk_1E8932B60;
  v11[4] = self;
  v11[5] = a3;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  hmbBindDataSQLite3(a3, -[HMBSQLQueryIterator sequenceBindOffset](self, "sequenceBindOffset"), v8, a5);
  hmbBindIntSQLite3(a3, -[HMBLocalZoneQueryResult zoneRowBindOffset](self, "zoneRowBindOffset"), -[HMBLocalZoneQueryResult zoneRow](self, "zoneRow"), a5);
  return 1;
}

- (HMBLocalZoneQueryResultRecordIDSequence)initWithLocalZone:(id)a3 statement:(id)a4 initialSequence:(id)a5 sequenceBindOffset:(unint64_t)a6 arguments:(id)a7 maximumRowsPerSelect:(unint64_t)a8
{
  id v15;
  HMBLocalZoneQueryResultRecordIDSequence *v16;
  HMBLocalZoneQueryResultRecordIDSequence *v17;
  objc_super v19;

  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMBLocalZoneQueryResultRecordIDSequence;
  v16 = -[HMBLocalZoneQueryResult initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:](&v19, sel_initWithLocalZone_statement_initialSequence_arguments_maximumRowsPerSelect_, a3, a4, 0, a7, a8);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_currentSequenceAsData, a5);
    -[HMBSQLQueryIterator setSequenceBindOffset:](v17, "setSequenceBindOffset:", a6);
  }

  return v17;
}

- (id)fetchRow:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  -[HMBLocalZoneQueryResult localZone](self, "localZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v7, "fetchModelWithRecordRow:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)currentSequenceAsData
{
  return self->_currentSequenceAsData;
}

- (void)setCurrentSequenceAsData:(id)a3
{
  objc_storeStrong((id *)&self->_currentSequenceAsData, a3);
}

- (NSData)lastReturnedSequence
{
  return self->_lastReturnedSequence;
}

- (void)setLastReturnedSequence:(id)a3
{
  objc_storeStrong((id *)&self->_lastReturnedSequence, a3);
}

- (NSMutableSet)returnedIDs
{
  return self->_returnedIDs;
}

- (void)setReturnedIDs:(id)a3
{
  objc_storeStrong((id *)&self->_returnedIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnedIDs, 0);
  objc_storeStrong((id *)&self->_lastReturnedSequence, 0);
  objc_storeStrong((id *)&self->_currentSequenceAsData, 0);
}

void __91__HMBLocalZoneQueryResultRecordIDSequence_bindPropertiesToStatement_currentSequence_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  id v6;
  sqlite3_stmt *v7;
  void *v8;
  id *v9;
  uint64_t *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v12 = a3;
  v5 = objc_msgSend(a2, "intValue");
  if (v5 != objc_msgSend(*(id *)(a1 + 32), "sequenceBindOffset"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v7 = *(sqlite3_stmt **)(a1 + 40);
    if (v6 == v12)
    {
      v14 = 0;
      v9 = (id *)&v14;
      v10 = &v14;
      v11 = v5;
      v8 = 0;
    }
    else
    {
      v8 = v12;
      v13 = 0;
      v9 = (id *)&v13;
      v10 = &v13;
      v11 = v5;
    }
    hmbBindDataSQLite3(v7, v11, v8, v10);

  }
}

@end
