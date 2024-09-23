@implementation HMBSQLStatement

- (HMBSQLStatement)initWithContext:(id)a3 statement:(sqlite3_stmt *)a4 queryPlans:(id)a5
{
  id v8;
  id v9;
  HMBSQLStatement *v10;
  HMBSQLStatement *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMBSQLStatement;
  v10 = -[HMBSQLStatement init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_context, v8);
    v11->_statement = a4;
    objc_storeStrong((id *)&v11->_queryPlans, a5);
  }

  return v11;
}

- (HMBSQLStatement)initWithContext:(id)a3 statement:(id)a4
{
  id v6;
  id v7;
  HMBSQLStatement *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (HMBSQLStatement *)objc_msgSend((id)objc_opt_class(), "sqlStatementForContext:statement:", v6, v7);
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "queryPlansForContext:statement:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HMBSQLStatement initWithContext:statement:queryPlans:](self, "initWithContext:statement:queryPlans:", v6, v8, v9);

    v8 = self;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  HMBSQLStatement *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  const char *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (self->_statement)
  {
    v15 = "<NO LOCK>";
    -[HMBSQLStatement context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __26__HMBSQLStatement_dealloc__block_invoke;
    v11[3] = &unk_1E8931208;
    v11[4] = self;
    v11[5] = &v12;
    objc_msgSend(v4, "performBlock:", v11);

    if (v13[3])
    {
      v5 = (void *)MEMORY[0x1D17B6230]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v13[3];
        *(_DWORD *)buf = 138543618;
        v17 = v8;
        v18 = 2080;
        v19 = v9;
        _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_ERROR, "%{public}@Deallocation called on %s without finalize.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
    }
  }
  _Block_object_dispose(&v12, 8);
  v10.receiver = self;
  v10.super_class = (Class)HMBSQLStatement;
  -[HMBSQLStatement dealloc](&v10, sel_dealloc);
}

- (void)finalize
{
  void *v3;
  void *v4;

  if (self->_statement)
  {
    -[HMBSQLStatement context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertOwner");

    sqlite3_finalize(self->_statement);
    self->_statement = 0;
  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMBSQLStatement context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMBSQLContext)context
{
  return (HMBSQLContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (void)setStatement:(sqlite3_stmt *)a3
{
  self->_statement = a3;
}

- (NSArray)queryPlans
{
  return self->_queryPlans;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryPlans, 0);
  objc_destroyWeak((id *)&self->_context);
}

uint64_t __26__HMBSQLStatement_dealloc__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sqlite3_sql(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32)
                                                                                             + 16));
  return objc_msgSend(*(id *)(a1 + 32), "finalize");
}

+ (BOOL)explainStatements
{
  return _explainStatements;
}

+ (void)setExplainStatements:(BOOL)a3
{
  _explainStatements = a3;
}

+ (sqlite3_stmt)sqlStatementForContext:(id)a3 statement:(id)a4
{
  id v6;
  id v7;
  sqlite3 *v8;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (sqlite3 *)objc_msgSend(v6, "context");
  v9 = objc_retainAutorelease(v7);
  v23 = 0;
  v10 = prepareSQLite3(v8, (const char *)objc_msgSend(v9, "UTF8String"), &v23);
  v11 = v23;
  v12 = (void *)MEMORY[0x1D17B6230]();
  v13 = a1;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v10)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = sqlite3_sql(v10);
      *(_DWORD *)buf = 138543618;
      v25 = v16;
      v26 = 2080;
      v27 = v17;
      v18 = "%{public}@Prepared SQL statement: %s";
      v19 = v15;
      v20 = OS_LOG_TYPE_DEBUG;
      v21 = 22;
LABEL_6:
      _os_log_impl(&dword_1CCD48000, v19, v20, v18, buf, v21);

    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v16;
    v26 = 2112;
    v27 = (const char *)v9;
    v28 = 2112;
    v29 = v11;
    v18 = "%{public}@Unable to prepare SQL statement '%@': %@";
    v19 = v15;
    v20 = OS_LOG_TYPE_ERROR;
    v21 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v12);
  return v10;
}

+ (id)queryPlansForContext:(id)a3 statement:(id)a4
{
  id v6;
  id v7;
  sqlite3 *v8;
  id v9;
  const char *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "explainStatements"))
  {
    v8 = (sqlite3 *)objc_msgSend(v6, "context");
    objc_msgSend(CFSTR("EXPLAIN QUERY PLAN "), "stringByAppendingString:", v7);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v19 = 0;
    selectSQLite3(v8, v10, MEMORY[0x1E0C9AA70], &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;

    if (v11)
    {
      objc_msgSend(v11, "na_map:", &__block_literal_global);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x1D17B6230]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v21 = v17;
        v22 = 2112;
        v23 = v7;
        v24 = 2112;
        v25 = v12;
        _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to explain statement '%@': %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4 != -1)
    dispatch_once(&logCategory__hmf_once_t4, &__block_literal_global_36);
  return (id)logCategory__hmf_once_v5;
}

void __30__HMBSQLStatement_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5;
  logCategory__hmf_once_v5 = v0;

}

HMBSQLStatementQueryPlanTuple *__50__HMBSQLStatement_queryPlansForContext_statement___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMBSQLStatementQueryPlanTuple *v3;

  v2 = a2;
  v3 = -[HMBSQLStatementQueryPlanTuple initWithRow:]([HMBSQLStatementQueryPlanTuple alloc], "initWithRow:", v2);

  return v3;
}

@end
