@implementation ACHActivitySummaryUtility

- (ACHActivitySummaryUtility)initWithProfile:(id)a3 shouldIncludePrivateProperties:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  ACHActivitySummaryUtility *v7;
  ACHActivitySummaryUtility *v8;
  uint64_t v9;
  HDActivitySummaryBuilder *summaryBuilder;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACHActivitySummaryUtility;
  v7 = -[ACHActivitySummaryUtility init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_profile, v6);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE40A10]), "initWithProfile:", v6);
    summaryBuilder = v8->_summaryBuilder;
    v8->_summaryBuilder = (HDActivitySummaryBuilder *)v9;

    -[HDActivitySummaryBuilder setShouldIncludePrivateProperties:](v8->_summaryBuilder, "setShouldIncludePrivateProperties:", v4);
  }

  return v8;
}

- (void)setDatabaseContext:(id)a3
{
  -[HDActivitySummaryBuilder setDatabaseTransactionContext:](self->_summaryBuilder, "setDatabaseTransactionContext:", a3);
}

- (HDDatabaseTransactionContext)databaseContext
{
  return (HDDatabaseTransactionContext *)-[HDActivitySummaryBuilder databaseTransactionContext](self->_summaryBuilder, "databaseTransactionContext");
}

- (void)enumerateActivitySummariesForDateComponentInterval:(id)a3 handler:(id)a4
{
  uint64_t v4;

  v4 = 0;
  -[ACHActivitySummaryUtility _enumerateActivitySummariesForDateComponentInterval:handler:error:](self, "_enumerateActivitySummariesForDateComponentInterval:handler:error:", a3, a4, &v4);
}

- (BOOL)_enumerateActivitySummariesForDateComponentInterval:(id)a3 handler:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "startDateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDateComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  HDActivityCacheEntityPredicateForCachesInDateComponentsRange();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHActivitySummaryUtility summaryBuilder](self, "summaryBuilder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __95__ACHActivitySummaryUtility__enumerateActivitySummariesForDateComponentInterval_handler_error___block_invoke;
  v18[3] = &unk_24D13C598;
  v14 = v8;
  v19 = v14;
  v15 = objc_msgSend(v13, "enumerateActivitySummariesWithPredicate:error:handler:", v12, a5, v18);

  if ((v15 & 1) == 0)
  {
    ACHLogDefault();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ACHActivitySummaryUtility _enumerateActivitySummariesForDateComponentInterval:handler:error:].cold.1((uint64_t *)a5, v16);

  }
  return v15;
}

uint64_t __95__ACHActivitySummaryUtility__enumerateActivitySummariesForDateComponentInterval_handler_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)newEmptyActivitySummaryFromSummary:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDD38E8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "_setActivitySummaryIndex:", objc_msgSend(v4, "_activitySummaryIndex"));
  objc_msgSend(v5, "setActivityMoveMode:", objc_msgSend(v4, "activityMoveMode"));
  objc_msgSend(v4, "activeEnergyBurnedGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveEnergyBurnedGoal:", v6);

  objc_msgSend(v4, "appleMoveTimeGoal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppleMoveTimeGoal:", v7);

  objc_msgSend(v4, "appleStandHoursGoal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppleStandHoursGoal:", v8);

  objc_msgSend(v4, "appleExerciseTimeGoal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAppleExerciseTimeGoal:", v9);
  return v5;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (HDActivitySummaryBuilder)summaryBuilder
{
  return self->_summaryBuilder;
}

- (void)setSummaryBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_summaryBuilder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryBuilder, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)_enumerateActivitySummariesForDateComponentInterval:(uint64_t *)a1 handler:(NSObject *)a2 error:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21407B000, a2, OS_LOG_TYPE_ERROR, "Error enumerating activity summaries: %@", (uint8_t *)&v3, 0xCu);
}

@end
