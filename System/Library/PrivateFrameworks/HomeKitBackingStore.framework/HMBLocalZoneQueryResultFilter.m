@implementation HMBLocalZoneQueryResultFilter

- (HMBLocalZoneQueryResultFilter)initWithLocalZone:(id)a3 statement:(id)a4 columns:(id)a5 filter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  HMBLocalZoneQueryResultFilter *v16;
  uint64_t v17;
  id filter;
  objc_super v20;

  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect");
  v20.receiver = self;
  v20.super_class = (Class)HMBLocalZoneQueryResultFilter;
  v16 = -[HMBLocalZoneQueryResult initWithLocalZone:statement:initialSequence:arguments:maximumRowsPerSelect:](&v20, sel_initWithLocalZone_statement_initialSequence_arguments_maximumRowsPerSelect_, v14, v13, &unk_1E8947718, MEMORY[0x1E0C9AA70], v15);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_columns, a5);
    v17 = MEMORY[0x1D17B63A4](v12);
    filter = v16->_filter;
    v16->_filter = (id)v17;

  }
  return v16;
}

- (id)fetchRowFromStatement:(sqlite3_stmt *)a3 skip:(BOOL *)a4 updatedSequence:(unint64_t *)a5 error:(id *)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t (**v16)(_QWORD, _QWORD);
  uint64_t v17;
  void *v18;
  void *v19;
  HMBLocalZoneQueryResultFilter *v20;
  NSObject *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  sqlite3_stmt *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = (void *)MEMORY[0x1E0C99E08];
  -[HMBLocalZoneQueryResultFilter columns](self, "columns");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  *a5 = sqlite3_column_int64(a3, 0);
  -[HMBLocalZoneQueryResultFilter columns](self, "columns");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __82__HMBLocalZoneQueryResultFilter_fetchRowFromStatement_skip_updatedSequence_error___block_invoke;
  v27 = &unk_1E89326F0;
  v29 = a3;
  v15 = v13;
  v28 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v24);

  -[HMBLocalZoneQueryResultFilter filter](self, "filter", v24, v25, v26, v27);
  v16 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v17 = ((uint64_t (**)(_QWORD, id))v16)[2](v16, v15);

  if (!v17)
  {
    *a4 = 1;
    v18 = &unk_1E8947718;
    goto LABEL_11;
  }
  if (v17 == 2)
  {
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  if (v17 != 1)
  {
    v19 = (void *)MEMORY[0x1D17B6230]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v22;
      v32 = 2048;
      v33 = v17;
      _os_log_impl(&dword_1CCD48000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unknown filter result received: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v18;
}

- (HMBLocalSQLQueryTableQueryAll)query
{
  return self->_query;
}

- (NSArray)columns
{
  return self->_columns;
}

- (id)filter
{
  return self->_filter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

void __82__HMBLocalZoneQueryResultFilter_fetchRowFromStatement_skip_updatedSequence_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x1E0C99D50], "hmbDataWithSQLite3ColumnNoCopy:column:", *(_QWORD *)(a1 + 40), objc_msgSend(v8, "offset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v8, "modelField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeQueryableValue:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
}

@end
