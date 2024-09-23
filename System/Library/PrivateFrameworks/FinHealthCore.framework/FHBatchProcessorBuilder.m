@implementation FHBatchProcessorBuilder

- (FHBatchProcessorBuilder)init
{
  FHBatchProcessorBuilder *v2;
  FHBatchProcessorBuilder *v3;
  FHDatabaseManager *databaseManager;
  NSDate *startDate;
  NSDate *endDate;
  uint64_t v7;
  NSMutableSet *internalStates;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FHBatchProcessorBuilder;
  v2 = -[FHBatchProcessorBuilder init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    databaseManager = v2->_databaseManager;
    v2->_databaseManager = 0;

    v3->_computeMerchantCounts = 0;
    startDate = v3->_startDate;
    v3->_startDate = 0;

    endDate = v3->_endDate;
    v3->_endDate = 0;

    v7 = objc_opt_new();
    internalStates = v3->_internalStates;
    v3->_internalStates = (NSMutableSet *)v7;

  }
  return v3;
}

- (void)addInternalState:(unint64_t)a3
{
  NSMutableSet *internalStates;
  id v4;

  internalStates = self->_internalStates;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](internalStates, "addObject:", v4);

}

- (void)enableMerchantCounts
{
  self->_computeMerchantCounts = 1;
}

- (FHDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
  objc_storeStrong((id *)&self->_databaseManager, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)mostRecentTransactionFromDatabase
{
  return self->_mostRecentTransactionFromDatabase;
}

- (void)setMostRecentTransactionFromDatabase:(unint64_t)a3
{
  self->_mostRecentTransactionFromDatabase = a3;
}

- (NSMutableSet)internalStates
{
  return self->_internalStates;
}

- (void)setInternalStates:(id)a3
{
  objc_storeStrong((id *)&self->_internalStates, a3);
}

- (BOOL)computeMerchantCounts
{
  return self->_computeMerchantCounts;
}

- (void)setComputeMerchantCounts:(BOOL)a3
{
  self->_computeMerchantCounts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_internalStates, 0);
}

@end
