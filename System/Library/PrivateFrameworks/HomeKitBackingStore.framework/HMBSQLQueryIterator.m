@implementation HMBSQLQueryIterator

- (HMBSQLQueryIterator)initWithStatement:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5
{
  return -[HMBSQLQueryIterator initWithStatement:initialSequence:maximumRowsPerSelect:error:](self, "initWithStatement:initialSequence:maximumRowsPerSelect:error:", a3, a4, a5, 0);
}

- (HMBSQLQueryIterator)initWithStatement:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMBSQLQueryIterator *v14;
  HMBSQLQueryIterator *v15;
  NSMutableArray *cachedResults;
  void *v17;
  void *v18;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMBSQLQueryIterator;
  v14 = -[HMBSQLQueryIterator init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_statement, a3);
    cachedResults = v15->_cachedResults;
    v15->_cachedResults = 0;

    objc_storeStrong((id *)&v15->_currentSequence, a4);
    v15->_maximumRowsPerQuery = a5;
    objc_storeStrong((id *)&v15->_error, a6);
    objc_msgSend(v11, "arguments");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hmf_numberForKey:", CFSTR("_sequence_offset"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v15->_sequenceBindOffset = objc_msgSend(v18, "intValue");
  }

  return v15;
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99768];
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (id)fetchRow:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)nextObject
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  HMBSQLQueryIterator *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  HMBSQLQueryIterator *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  HMBSQLQueryIterator *v30;
  NSObject *v31;
  id v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  BOOL v43;
  __int128 v44;
  id v45;
  _QWORD v46[4];
  HMBSQLQueryIterator *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  -[HMBSQLQueryIterator error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_2;
  *(_QWORD *)&v4 = 138543874;
  v44 = v4;
  while (1)
  {
    -[HMBSQLQueryIterator cachedResults](self, "cachedResults", v44);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_9;
    -[HMBSQLQueryIterator cachedResults](self, "cachedResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {

      goto LABEL_31;
    }
    -[HMBSQLQueryIterator currentSequence](self, "currentSequence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (!v10)
    {
LABEL_9:
      v11 = self;
      while (1)
      {
        -[HMBSQLQueryIterator cachedResults](v11, "cachedResults");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[HMBSQLQueryIterator cachedResults](v11, "cachedResults");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count"))
          {

LABEL_30:
            break;
          }
          -[HMBSQLQueryIterator currentSequence](v11, "currentSequence");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
            goto LABEL_30;
        }
        v16 = -[HMBSQLQueryIterator maximumRowsPerQuery](v11, "maximumRowsPerQuery");
        v61 = 0;
        v62 = &v61;
        v63 = 0x3032000000;
        v64 = __Block_byref_object_copy_;
        v65 = __Block_byref_object_dispose_;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v16);
        v66 = (id)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        v58 = &v57;
        v59 = 0x2020000000;
        v60 = 0;
        v53 = 0;
        v54 = &v53;
        v55 = 0x2020000000;
        v56 = 0;
        v17 = -[HMBSQLQueryIterator sequenceBindOffset](v11, "sequenceBindOffset");
        -[HMBSQLQueryIterator statement](v11, "statement");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "context");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = ____fetchNextBatch_block_invoke;
        v46[3] = &unk_1E89312B0;
        v52 = v17;
        v20 = v11;
        v50 = &v61;
        v51 = v16;
        v47 = v20;
        v48 = &v53;
        v49 = &v57;
        objc_msgSend(v19, "sqlBlockWithActivity:block:", 0, v46);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)v62[5];
        if (v22)
        {
          if (*((_BYTE *)v54 + 24) || objc_msgSend(v22, "count"))
          {
            -[HMBSQLQueryIterator currentSequence](v20, "currentSequence");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23 == 0;

            if (!v24)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v58[3]);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMBSQLQueryIterator setCurrentSequence:](v20, "setCurrentSequence:", v25);

            }
            -[HMBSQLQueryIterator cachedResults](v20, "cachedResults");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26 == 0;

            if (v27)
            {
              -[HMBSQLQueryIterator setCachedResults:](v20, "setCachedResults:", v62[5]);
            }
            else
            {
              -[HMBSQLQueryIterator cachedResults](v20, "cachedResults");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObjectsFromArray:", v62[5]);

            }
            v34 = 1;
            goto LABEL_26;
          }
          -[HMBSQLQueryIterator setCurrentSequence:](v20, "setCurrentSequence:", 0);
        }
        else
        {
          v29 = (void *)MEMORY[0x1D17B6230]();
          v30 = v20;
          HMFGetOSLogHandle();
          v31 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v32 = (id)objc_claimAutoreleasedReturnValue();
            -[HMBSQLQueryIterator currentSequence](v30, "currentSequence");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v44;
            v68 = v32;
            v69 = 2112;
            v70 = v33;
            v71 = 2112;
            v72 = v21;
            _os_log_impl(&dword_1CCD48000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch additional items into query enumeration %@: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v29);
          -[HMBSQLQueryIterator setError:](v30, "setError:", v21);
          -[HMBSQLQueryIterator setCurrentSequence:](v30, "setCurrentSequence:", 0);
          -[HMBSQLQueryIterator setCachedResults:](v30, "setCachedResults:", 0);
        }
        v34 = 0;
LABEL_26:

        _Block_object_dispose(&v53, 8);
        _Block_object_dispose(&v57, 8);
        _Block_object_dispose(&v61, 8);

        if ((v34 & 1) == 0)
          goto LABEL_30;
      }
    }
LABEL_31:
    -[HMBSQLQueryIterator cachedResults](self, "cachedResults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v35, "count"))
    {

LABEL_40:
      -[HMBSQLQueryIterator setCurrentSequence:](self, "setCurrentSequence:", 0);
      goto LABEL_2;
    }
    -[HMBSQLQueryIterator error](self, "error");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36 == 0;

    if (!v37)
      goto LABEL_40;
    -[HMBSQLQueryIterator cachedResults](self, "cachedResults");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "hmf_dequeue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0;
    -[HMBSQLQueryIterator fetchRow:error:](self, "fetchRow:error:", v39, &v45);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v45;
    v41 = v40;
    if (v5)
    {

      return v5;
    }
    if (!objc_msgSend(v40, "isHMFError") || objc_msgSend(v41, "code") != 2)
      break;

    -[HMBSQLQueryIterator error](self, "error");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42 == 0;

    if (!v43)
      goto LABEL_2;
  }
  -[HMBSQLQueryIterator setError:](self, "setError:", v41);
  -[HMBSQLQueryIterator setCurrentSequence:](self, "setCurrentSequence:", 0);

LABEL_2:
  v5 = 0;
  return v5;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  char v7;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  v7 = 0;
  do
  {
    v5 = (void *)MEMORY[0x1D17B6230]();
    -[HMBSQLQueryIterator nextObject](self, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v4[2](v4, v6, &v7);

    objc_autoreleasePoolPop(v5);
  }
  while (v6 && !v7);

}

- (BOOL)bindPropertiesToStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  return 1;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (HMBSQLQueryStatement)statement
{
  return self->_statement;
}

- (unint64_t)maximumRowsPerQuery
{
  return self->_maximumRowsPerQuery;
}

- (NSMutableArray)cachedResults
{
  return self->_cachedResults;
}

- (void)setCachedResults:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResults, a3);
}

- (NSNumber)currentSequence
{
  return self->_currentSequence;
}

- (void)setCurrentSequence:(id)a3
{
  objc_storeStrong((id *)&self->_currentSequence, a3);
}

- (int)sequenceBindOffset
{
  return self->_sequenceBindOffset;
}

- (void)setSequenceBindOffset:(int)a3
{
  self->_sequenceBindOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSequence, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_statement, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

+ (unint64_t)maximumRowsPerSelect
{
  return _maximumRowsPerSelect;
}

+ (void)setMaximumRowsPerSelect:(unint64_t)a3
{
  _maximumRowsPerSelect = a3;
}

@end
