@implementation EDSearchableIndexSchedulerState

- (EDSearchableIndexSchedulerState)initWithBudgetedTimeRemaining:(double)a3
{
  EDSearchableIndexSchedulerState *v4;
  NSMutableSet *v5;
  NSMutableSet *indexingEnabledForActivityTypes;
  NSMutableSet *v7;
  NSMutableSet *indexingEnabledForTaskTypes;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EDSearchableIndexSchedulerState;
  v4 = -[EDSearchableIndexSchedulerState init](&v10, sel_init);
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    indexingEnabledForActivityTypes = v4->_indexingEnabledForActivityTypes;
    v4->_indexingEnabledForActivityTypes = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    indexingEnabledForTaskTypes = v4->_indexingEnabledForTaskTypes;
    v4->_indexingEnabledForTaskTypes = v7;

    v4->_budgetedItemCountRemaining = 0;
    v4->_budgetedTimeRemaining = a3;
    *(_OWORD *)&v4->_otherIndexingTime = 0u;
    *(_OWORD *)&v4->_fastPassIndexedItemCount = 0u;
  }
  return v4;
}

- (void)setDataSourceIndexingPermitted:(BOOL)a3
{
  if (self->_dataSourceIndexingPermitted != a3)
  {
    self->_dataSourceIndexingPermitted = a3;
    if (a3)
    {
      -[EDSearchableIndexSchedulerState setOtherIndexingTime:](self, "setOtherIndexingTime:", 0.0);
      -[EDSearchableIndexSchedulerState setFastPassIndexingTime:](self, "setFastPassIndexingTime:", 0.0);
    }
  }
}

- (BOOL)hasAvailableIndexingBudget
{
  return -[EDSearchableIndexSchedulerState budgetedItemCountRemaining](self, "budgetedItemCountRemaining") > 0
      || -[EDSearchableIndexSchedulerState isDataSourceIndexingPermitted](self, "isDataSourceIndexingPermitted");
}

- (BOOL)needsToStopBudgetedIndexing
{
  double v3;

  -[EDSearchableIndexSchedulerState budgetedTimeRemaining](self, "budgetedTimeRemaining");
  return v3 <= 0.0
      && -[EDSearchableIndexSchedulerState isIndexingEnabledForActivityType:](self, "isIndexingEnabledForActivityType:", CFSTR("budgeted"));
}

- (NSDictionary)powerEventData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _QWORD v40[4];
  _QWORD v41[6];

  v41[4] = *MEMORY[0x1E0C80C00];
  v40[0] = CFSTR("budgetedTimeRemaining");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[EDSearchableIndexSchedulerState budgetedTimeRemaining](self, "budgetedTimeRemaining");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v4;
  v40[1] = CFSTR("budgetedItemCountRemaining");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[EDSearchableIndexSchedulerState budgetedItemCountRemaining](self, "budgetedItemCountRemaining"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v5;
  v40[2] = CFSTR("maintenanceIndexingTime");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[EDSearchableIndexSchedulerState maintenanceIndexingTime](self, "maintenanceIndexingTime");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v7;
  v40[3] = CFSTR("extraIndexingTime");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[EDSearchableIndexSchedulerState otherIndexingTime](self, "otherIndexingTime");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  -[EDSearchableIndexSchedulerState fastPassIndexingTime](self, "fastPassIndexingTime");
  if (v12 != 0.0)
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    -[EDSearchableIndexSchedulerState fastPassIndexingTime](self, "fastPassIndexingTime");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("fastPassIndexingTime"));

  }
  if (-[EDSearchableIndexSchedulerState fastPassIndexedItemCount](self, "fastPassIndexedItemCount"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[EDSearchableIndexSchedulerState fastPassIndexedItemCount](self, "fastPassIndexedItemCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("fastPassIndexedItemCount"));

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  +[EDSearchableIndexScheduler activityTypes](EDSearchableIndexScheduler, "activityTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v16);
        v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        v21 = -[EDSearchableIndexSchedulerState isIndexingEnabledForActivityType:](self, "isIndexingEnabledForActivityType:", v20);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, v20);

      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v17);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  +[EDSearchableIndexScheduler taskTypes](EDSearchableIndexScheduler, "taskTypes", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v31;
    v26 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
        if (-[EDSearchableIndexSchedulerState isIndexingEnabledForTaskType:](self, "isIndexingEnabledForTaskType:", v28))
        {
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, v28);
        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v24);
  }

  return (NSDictionary *)v11;
}

- (BOOL)isIndexingEnabledByActivities
{
  void *v2;
  BOOL v3;

  -[EDSearchableIndexSchedulerState indexingEnabledForActivityTypes](self, "indexingEnabledForActivityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_isIndexingEnabledByActivitiesOrTasks
{
  void *v3;
  BOOL v4;
  void *v5;

  -[EDSearchableIndexSchedulerState indexingEnabledForActivityTypes](self, "indexingEnabledForActivityTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[EDSearchableIndexSchedulerState indexingEnabledForTaskTypes](self, "indexingEnabledForTaskTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (BOOL)isIndexingEnabledForActivityType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[EDSearchableIndexSchedulerState indexingEnabledForActivityTypes](self, "indexingEnabledForActivityTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)enableIndexingForActivityType:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableSet addObject:](self->_indexingEnabledForActivityTypes, "addObject:");
  -[EDSearchableIndexSchedulerState setDataSourceIndexingPermitted:](self, "setDataSourceIndexingPermitted:", -[EDSearchableIndexSchedulerState _isIndexingEnabledByActivitiesOrTasks](self, "_isIndexingEnabledByActivitiesOrTasks"));

}

- (void)disableIndexingForActivityType:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableSet removeObject:](self->_indexingEnabledForActivityTypes, "removeObject:");
  -[EDSearchableIndexSchedulerState setDataSourceIndexingPermitted:](self, "setDataSourceIndexingPermitted:", -[EDSearchableIndexSchedulerState _isIndexingEnabledByActivitiesOrTasks](self, "_isIndexingEnabledByActivitiesOrTasks"));

}

- (BOOL)isIndexingEnabledForTaskType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[EDSearchableIndexSchedulerState indexingEnabledForTaskTypes](self, "indexingEnabledForTaskTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)enableIndexingForTaskType:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableSet addObject:](self->_indexingEnabledForTaskTypes, "addObject:");
  -[EDSearchableIndexSchedulerState setDataSourceIndexingPermitted:](self, "setDataSourceIndexingPermitted:", -[EDSearchableIndexSchedulerState _isIndexingEnabledByActivitiesOrTasks](self, "_isIndexingEnabledByActivitiesOrTasks"));

}

- (void)disableIndexingForTaskType:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableSet removeObject:](self->_indexingEnabledForTaskTypes, "removeObject:");
  -[EDSearchableIndexSchedulerState setDataSourceIndexingPermitted:](self, "setDataSourceIndexingPermitted:", -[EDSearchableIndexSchedulerState _isIndexingEnabledByActivitiesOrTasks](self, "_isIndexingEnabledByActivitiesOrTasks"));

}

- (void)didIndexForTime:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  if (-[EDSearchableIndexSchedulerState isIndexingEnabledForActivityType:](self, "isIndexingEnabledForActivityType:", CFSTR("maintenance")))
  {
    -[EDSearchableIndexSchedulerState maintenanceIndexingTime](self, "maintenanceIndexingTime");
    -[EDSearchableIndexSchedulerState setMaintenanceIndexingTime:](self, "setMaintenanceIndexingTime:", v5 + a3);
  }
  else if (-[EDSearchableIndexSchedulerState isIndexingEnabledForActivityType:](self, "isIndexingEnabledForActivityType:", CFSTR("budgeted")))
  {
    -[EDSearchableIndexSchedulerState budgetedTimeRemaining](self, "budgetedTimeRemaining");
    -[EDSearchableIndexSchedulerState setBudgetedTimeRemaining:](self, "setBudgetedTimeRemaining:", v6 - a3);
  }
  if (-[EDSearchableIndexSchedulerState isIndexingEnabledForTaskType:](self, "isIndexingEnabledForTaskType:", CFSTR("fastpass")))
  {
    -[EDSearchableIndexSchedulerState fastPassIndexingTime](self, "fastPassIndexingTime");
    -[EDSearchableIndexSchedulerState setFastPassIndexingTime:](self, "setFastPassIndexingTime:", v7 + a3);
  }
  if (!-[EDSearchableIndexSchedulerState _isIndexingEnabledByActivitiesOrTasks](self, "_isIndexingEnabledByActivitiesOrTasks"))
  {
    -[EDSearchableIndexSchedulerState otherIndexingTime](self, "otherIndexingTime");
    -[EDSearchableIndexSchedulerState setOtherIndexingTime:](self, "setOtherIndexingTime:", v8 + a3);
  }
}

- (void)didIndexItemCount:(int64_t)a3
{
  if (-[EDSearchableIndexSchedulerState isIndexingEnabledForTaskType:](self, "isIndexingEnabledForTaskType:", CFSTR("fastpass")))
  {
    self->_fastPassIndexedItemCount += a3;
  }
  else
  {
    -[EDSearchableIndexSchedulerState setBudgetedItemCountRemaining:](self, "setBudgetedItemCountRemaining:", -[EDSearchableIndexSchedulerState budgetedItemCountRemaining](self, "budgetedItemCountRemaining") - a3);
  }
}

- (NSSet)indexingEnabledForActivityTypes
{
  return &self->_indexingEnabledForActivityTypes->super;
}

- (NSSet)indexingEnabledForTaskTypes
{
  return &self->_indexingEnabledForTaskTypes->super;
}

- (BOOL)isDataSourceIndexingPermitted
{
  return self->_dataSourceIndexingPermitted;
}

- (int64_t)budgetedItemCountRemaining
{
  return self->_budgetedItemCountRemaining;
}

- (void)setBudgetedItemCountRemaining:(int64_t)a3
{
  self->_budgetedItemCountRemaining = a3;
}

- (double)budgetedTimeRemaining
{
  return self->_budgetedTimeRemaining;
}

- (void)setBudgetedTimeRemaining:(double)a3
{
  self->_budgetedTimeRemaining = a3;
}

- (double)otherIndexingTime
{
  return self->_otherIndexingTime;
}

- (void)setOtherIndexingTime:(double)a3
{
  self->_otherIndexingTime = a3;
}

- (double)maintenanceIndexingTime
{
  return self->_maintenanceIndexingTime;
}

- (void)setMaintenanceIndexingTime:(double)a3
{
  self->_maintenanceIndexingTime = a3;
}

- (int64_t)fastPassIndexedItemCount
{
  return self->_fastPassIndexedItemCount;
}

- (double)fastPassIndexingTime
{
  return self->_fastPassIndexingTime;
}

- (void)setFastPassIndexingTime:(double)a3
{
  self->_fastPassIndexingTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingEnabledForTaskTypes, 0);
  objc_storeStrong((id *)&self->_indexingEnabledForActivityTypes, 0);
}

@end
