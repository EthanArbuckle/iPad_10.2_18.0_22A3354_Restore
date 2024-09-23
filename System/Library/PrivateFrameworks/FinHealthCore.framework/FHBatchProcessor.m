@implementation FHBatchProcessor

+ (FHBatchProcessor)initWithBuilder:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  id v5;

  v3 = (void (**)(id, void *))a3;
  v4 = (void *)objc_opt_new();
  v3[2](v3, v4);

  v5 = -[FHBatchProcessor _init:]([FHBatchProcessor alloc], "_init:", v4);
  return (FHBatchProcessor *)v5;
}

- (id)_init:(id)a3
{
  id v4;
  FHBatchProcessor *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDecimalNumber *secondsInDay;
  uint64_t v10;
  NSMutableArray *merchantWithTimeStampPairs;
  uint64_t v12;
  NSMutableArray *indexedAmountArray;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSPredicate *predicates;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSDate *startDate;
  uint64_t v36;
  NSDate *endDate;
  uint64_t v38;
  NSMutableArray *resultArray;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)FHBatchProcessor;
  v5 = -[FHBatchProcessor init](&v46, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD1518];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 86400);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decimalNumberWithString:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    secondsInDay = v5->_secondsInDay;
    v5->_secondsInDay = (NSDecimalNumber *)v8;

    v10 = objc_opt_new();
    merchantWithTimeStampPairs = v5->_merchantWithTimeStampPairs;
    v5->_merchantWithTimeStampPairs = (NSMutableArray *)v10;

    v12 = objc_opt_new();
    indexedAmountArray = v5->_indexedAmountArray;
    v5->_indexedAmountArray = (NSMutableArray *)v12;

    v14 = (void *)objc_opt_new();
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v41 = v4;
    objc_msgSend(v4, "internalStates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.%K == %lu"), CFSTR("transactionInternalState"), objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "integerValue"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v17);
    }

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.%K != nil"), CFSTR("displayName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "orPredicateWithSubpredicates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.%K == %lu AND SELF.%K == %lu AND SELF.%K == %lu"), CFSTR("transactionStatus"), 1, CFSTR("transactionType"), 0, CFSTR("accountType"), 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x24BDD14C0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v21, v24, v25, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "andPredicateWithSubpredicates:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    predicates = v5->_predicates;
    v5->_predicates = (NSPredicate *)v28;

    v4 = v41;
    objc_msgSend(v41, "databaseManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_databaseManager, v30);

    objc_msgSend(v41, "startDate");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      objc_msgSend(v41, "endDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v41, "startDate");
        v34 = objc_claimAutoreleasedReturnValue();
        startDate = v5->_startDate;
        v5->_startDate = (NSDate *)v34;

        objc_msgSend(v41, "endDate");
        v36 = objc_claimAutoreleasedReturnValue();
        endDate = v5->_endDate;
        v5->_endDate = (NSDate *)v36;

        v38 = objc_opt_new();
        resultArray = v5->_resultArray;
        v5->_resultArray = (NSMutableArray *)v38;

      }
    }
    v5->_computeMerchantCounts = objc_msgSend(v41, "computeMerchantCounts");

  }
  return v5;
}

- (void)fetchAndProcessInBatchMode
{
  id WeakRetained;
  id v4;

  -[NSMutableArray removeAllObjects](self->_resultArray, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_indexedAmountArray, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_merchantWithTimeStampPairs, "removeAllObjects");
  WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManager);
  objc_msgSend(WeakRetained, "setDelegate:", self);

  v4 = objc_loadWeakRetained((id *)&self->_databaseManager);
  objc_msgSend(v4, "retrieveAll");

}

- (NSSet)merchantsWithSignificantCount
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  void *v30;
  NSMutableArray *obj;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  context = (void *)MEMORY[0x23B865790]();
  v4 = (void *)MEMORY[0x24BDD1518];
  v5 = (void *)MEMORY[0x24BDD17C8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_databaseManager);
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(WeakRetained, "mostRecentTransactionDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decimalNumberWithString:", v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  FinHealthLogObject(CFSTR("FinHealthCore"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v30, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v9;
    _os_log_impl(&dword_23B4A2000, v8, OS_LOG_TYPE_DEBUG, "mostRecentDate %@", buf, 0xCu);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_merchantWithTimeStampPairs;
  v10 = v30;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v33)
  {
    v11 = 0;
    v32 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        v13 = v3;
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "featureRank");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "decimalNumberBySubtracting:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "decimalNumberByDividingBy:", self->_secondsInDay);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableArray objectAtIndex:](self->_indexedAmountArray, "objectAtIndex:", v11 + i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v19;

        objc_msgSend(v17, "doubleValue");
        if (v20 > 0.0 && v20 * exp(v21 * -0.074) >= 0.1)
        {
          objc_msgSend(v14, "featureLabel");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            objc_msgSend(MEMORY[0x24BDD1518], "zero");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(MEMORY[0x24BDD1518], "one");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "decimalNumberByAdding:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "featureLabel");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setValue:forKey:", v25, v26);

          v10 = v30;
        }

        v3 = v13;
      }
      v11 += i;
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v33);
  }

  objc_msgSend(v3, "keysOfEntriesPassingTest:", &__block_literal_global_3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return (NSSet *)v27;
}

BOOL __49__FHBatchProcessor_merchantsWithSignificantCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return (int)objc_msgSend(a3, "intValue") > 1;
}

- (void)processBatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  FHSmartCompoundFeatureRankedValue *v19;
  void *v20;
  FHSmartCompoundFeatureRankedValue *v21;
  NSMutableArray *indexedAmountArray;
  void *v23;
  NSDate *startDate;
  NSDate *endDate;
  NSMutableArray *resultArray;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "filteredArrayUsingPredicate:", self->_predicates);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_computeMerchantCounts)
  {
    v30 = v5;
    v31 = v4;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v11, "transactionDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSinceReferenceDate");
          v14 = (unint64_t)v13;

          v15 = (void *)MEMORY[0x23B865790]();
          v16 = (void *)MEMORY[0x24BDD1518];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "decimalNumberWithString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = [FHSmartCompoundFeatureRankedValue alloc];
          objc_msgSend(v11, "displayName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[FHSmartCompoundFeatureRankedValue initWithLabelAndRank:featureRank:](v19, "initWithLabelAndRank:featureRank:", v20, v18);

          -[NSMutableArray addObject:](self->_merchantWithTimeStampPairs, "addObject:", v21);
          indexedAmountArray = self->_indexedAmountArray;
          objc_msgSend(v11, "amount");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](indexedAmountArray, "addObject:", v23);

          objc_autoreleasePoolPop(v15);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v8);
    }

    v6 = v30;
    v4 = v31;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    endDate = self->_endDate;
    if (endDate)
    {
      resultArray = self->_resultArray;
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(SELF.%K >= %@) AND (SELF.%K <= %@)"), CFSTR("transactionDate"), startDate, CFSTR("transactionDate"), endDate);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "filteredArrayUsingPredicate:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "valueForKey:", CFSTR("amountFromDatabase"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObjectsFromArray:](resultArray, "addObjectsFromArray:", v29);

    }
  }

}

- (NSArray)filteredTransaction
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", self->_resultArray);
}

- (FHDatabaseManager)databaseManager
{
  return (FHDatabaseManager *)objc_loadWeakRetained((id *)&self->_databaseManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_databaseManager);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_secondsInDay, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_resultArray, 0);
  objc_storeStrong((id *)&self->_indexedAmountArray, 0);
  objc_storeStrong((id *)&self->_merchantWithTimeStampPairs, 0);
}

@end
