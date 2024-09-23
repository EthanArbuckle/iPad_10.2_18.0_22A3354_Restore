@implementation EDSQLQueryStatistics

- (EDSQLQueryStatistics)initWithQuery:(id)a3 transactionLabel:(id)a4 firstRowExecutionTime:(id)a5 timePerRowExecutionTime:(id)a6 totalExecutionTime:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  EDSQLQueryStatistics *v18;
  EDSQLQueryStatistics *v19;
  uint64_t v20;
  NSDictionary *queryCountByTransactionLabel;
  objc_super v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)EDSQLQueryStatistics;
  v18 = -[EDSQLQueryStatistics init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_redactedQuery, a3);
    v24 = v14;
    v25[0] = &unk_1E94E4BF8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    queryCountByTransactionLabel = v19->_queryCountByTransactionLabel;
    v19->_queryCountByTransactionLabel = (NSDictionary *)v20;

    v19->_queryCount = 1;
    v19->_firstRowMinExecutionTime = objc_msgSend(v15, "unsignedIntegerValue");
    v19->_firstRowMaxExecutionTime = objc_msgSend(v15, "unsignedIntegerValue");
    v19->_timePerRowMinExecutionTime = objc_msgSend(v16, "unsignedIntegerValue");
    v19->_timePerRowMaxExecutionTime = objc_msgSend(v16, "unsignedIntegerValue");
    v19->_totalMinExecutionTime = objc_msgSend(v17, "unsignedIntegerValue");
    v19->_totalMaxExecutionTime = objc_msgSend(v17, "unsignedIntegerValue");
  }

  return v19;
}

- (void)addStatisticWithTransactionLabel:(id)a3 firstRowExecutionTime:(id)a4 timePerRowExecutionTime:(id)a5 totalExecutionTime:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)-[NSDictionary mutableCopy](self->_queryCountByTransactionLabel, "mutableCopy");
  objc_msgSend(v13, "objectForKeyedSubscript:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, v17);
  }
  else
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E94E4BF8, v17);
  }
  objc_storeStrong((id *)&self->_queryCountByTransactionLabel, v13);
  self->_queryCount = -[EDSQLQueryStatistics queryCount](self, "queryCount") + 1;
  if (objc_msgSend(v10, "unsignedIntegerValue") >= self->_firstRowMaxExecutionTime)
    self->_firstRowMaxExecutionTime = objc_msgSend(v10, "unsignedIntegerValue");
  if (objc_msgSend(v10, "unsignedIntegerValue") <= self->_firstRowMinExecutionTime)
    self->_firstRowMinExecutionTime = objc_msgSend(v10, "unsignedIntegerValue");
  if (objc_msgSend(v11, "unsignedIntegerValue") >= self->_timePerRowMaxExecutionTime)
    self->_timePerRowMaxExecutionTime = objc_msgSend(v11, "unsignedIntegerValue");
  if (objc_msgSend(v11, "unsignedIntegerValue") <= self->_firstRowMinExecutionTime)
    self->_firstRowMinExecutionTime = objc_msgSend(v11, "unsignedIntegerValue");
  if (objc_msgSend(v12, "unsignedIntegerValue") >= self->_totalMaxExecutionTime)
    self->_totalMaxExecutionTime = objc_msgSend(v12, "unsignedIntegerValue");
  if (objc_msgSend(v12, "unsignedIntegerValue") <= self->_totalMinExecutionTime)
    self->_totalMinExecutionTime = objc_msgSend(v12, "unsignedIntegerValue");

}

- (NSString)redactedQuery
{
  return self->_redactedQuery;
}

- (NSDictionary)queryCountByTransactionLabel
{
  return self->_queryCountByTransactionLabel;
}

- (unint64_t)queryCount
{
  return self->_queryCount;
}

- (unint64_t)firstRowMinExecutionTime
{
  return self->_firstRowMinExecutionTime;
}

- (unint64_t)firstRowMaxExecutionTime
{
  return self->_firstRowMaxExecutionTime;
}

- (unint64_t)firstRowMeanExecutionTime
{
  return self->_firstRowMeanExecutionTime;
}

- (unint64_t)firstRowTwentyPercentileExecutionTime
{
  return self->_firstRowTwentyPercentileExecutionTime;
}

- (unint64_t)firstRowEightyPercentileExecutionTime
{
  return self->_firstRowEightyPercentileExecutionTime;
}

- (unint64_t)timePerRowMinExecutionTime
{
  return self->_timePerRowMinExecutionTime;
}

- (unint64_t)timePerRowMaxExecutionTime
{
  return self->_timePerRowMaxExecutionTime;
}

- (unint64_t)timePerRowMeanExecutionTime
{
  return self->_timePerRowMeanExecutionTime;
}

- (unint64_t)timePerRowTwentyPercentileExecutionTime
{
  return self->_timePerRowTwentyPercentileExecutionTime;
}

- (unint64_t)timePerRowEightyPercentileExecutionTime
{
  return self->_timePerRowEightyPercentileExecutionTime;
}

- (unint64_t)totalMinExecutionTime
{
  return self->_totalMinExecutionTime;
}

- (unint64_t)totalMaxExecutionTime
{
  return self->_totalMaxExecutionTime;
}

- (unint64_t)totalMeanExecutionTime
{
  return self->_totalMeanExecutionTime;
}

- (unint64_t)totalTwentyPercentileExecutionTime
{
  return self->_totalTwentyPercentileExecutionTime;
}

- (unint64_t)totalEightyPercentileExecutionTime
{
  return self->_totalEightyPercentileExecutionTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryCountByTransactionLabel, 0);
  objc_storeStrong((id *)&self->_redactedQuery, 0);
}

@end
