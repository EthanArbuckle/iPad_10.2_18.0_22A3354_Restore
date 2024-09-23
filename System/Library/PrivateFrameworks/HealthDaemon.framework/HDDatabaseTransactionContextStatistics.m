@implementation HDDatabaseTransactionContextStatistics

- (HDDatabaseTransactionContextStatistics)init
{
  HDDatabaseTransactionContextStatistics *v2;
  NSMutableArray *v3;
  NSMutableArray *transactions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDatabaseTransactionContextStatistics;
  v2 = -[HDDatabaseTransactionContextStatistics init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transactions = v2->_transactions;
    v2->_transactions = v3;

  }
  return v2;
}

- (NSArray)transactions
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_transactions, "copy");
}

- (double)totalDuration
{
  double result;

  -[NSMutableArray hk_sumUsingEvaluationBlock:](self->_transactions, "hk_sumUsingEvaluationBlock:", &__block_literal_global_132);
  return result;
}

uint64_t __55__HDDatabaseTransactionContextStatistics_totalDuration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "duration");
}

- (void)_addTransactionStatistics:(id)a3
{
  -[NSMutableArray addObject:](self->_transactions, "addObject:", a3);
}

- (NSString)shortDescription
{
  id v3;
  NSMutableArray *transactions;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  transactions = self->_transactions;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HDDatabaseTransactionContextStatistics_shortDescription__block_invoke;
  v7[3] = &unk_1E6CFC3A0;
  v7[4] = &v8;
  objc_msgSend(v3, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), transactions, v7);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0lfms [ %@ ]"), v9[3] * 1000.0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v8, 8);
  return (NSString *)v5;
}

uint64_t __58__HDDatabaseTransactionContextStatistics_shortDescription__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  v3 = a2;
  objc_msgSend(v3, "duration");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "duration");
  v7 = v6;

  return objc_msgSend(v5, "stringWithFormat:", CFSTR("%.1lf"), v7 * 1000.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);
}

@end
