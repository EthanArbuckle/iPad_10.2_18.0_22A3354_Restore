@implementation EDSearchableIndexBudgetConfiguration

- (int64_t)numberOfItemsToIndexOnResume
{
  return self->_numberOfItemsToIndexOnResume;
}

- (BOOL)enableActivityBasedScheduling
{
  return self->_enableActivityBasedScheduling;
}

- (NSString)ef_publicDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[EDSearchableIndexBudgetConfiguration periodDuration](self, "periodDuration");
  v5 = v4;
  -[EDSearchableIndexBudgetConfiguration periodDuration](self, "periodDuration");
  v7 = v6 / 60.0 / 60.0;
  -[EDSearchableIndexBudgetConfiguration time](self, "time");
  v9 = v8;
  -[EDSearchableIndexBudgetConfiguration time](self, "time");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("Budget Period:%lfs (%.1fh) Time:%fs (min:%.1fm) numberOfItemsToIndexOnResume:%ld"), v5, *(_QWORD *)&v7, v9, v10 / 60.0, -[EDSearchableIndexBudgetConfiguration numberOfItemsToIndexOnResume](self, "numberOfItemsToIndexOnResume"));
}

- (double)time
{
  return self->_time;
}

- (double)periodDuration
{
  return self->_periodDuration;
}

+ (id)defaultConfiguration
{
  return objc_alloc_init(EDSearchableIndexBudgetConfiguration);
}

- (EDSearchableIndexBudgetConfiguration)init
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  EDSearchableIndexBudgetConfiguration *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("IndexingBudgetInSeconds");
  v10[1] = CFSTR("IndexingBudgetPeriodInSeconds");
  v11[0] = &unk_1E94E57D0;
  v11[1] = &unk_1E94E57E0;
  v10[2] = CFSTR("IndexingBudgetNumberOfItemsToIndexOnResume");
  v11[2] = &unk_1E94E4A00;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", v4);
  objc_msgSend(v3, "doubleForKey:", CFSTR("IndexingBudgetInSeconds"));
  v6 = v5;
  objc_msgSend(v3, "doubleForKey:", CFSTR("IndexingBudgetPeriodInSeconds"));
  v8 = -[EDSearchableIndexBudgetConfiguration initWithTime:periodDuration:numberOfItemsToIndexOnResume:](self, "initWithTime:periodDuration:numberOfItemsToIndexOnResume:", objc_msgSend(v3, "integerForKey:", CFSTR("IndexingBudgetNumberOfItemsToIndexOnResume")), v6, v7);

  return v8;
}

- (EDSearchableIndexBudgetConfiguration)initWithTime:(double)a3 periodDuration:(double)a4 numberOfItemsToIndexOnResume:(int64_t)a5
{
  EDSearchableIndexBudgetConfiguration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EDSearchableIndexBudgetConfiguration;
  result = -[EDSearchableIndexBudgetConfiguration init](&v9, sel_init);
  if (result)
  {
    result->_time = a3;
    result->_periodDuration = a4;
    result->_numberOfItemsToIndexOnResume = a5;
    *(_WORD *)&result->_enableActivityBasedScheduling = 1;
    result->_allowBacklogIndexingOnPower = 0;
  }
  return result;
}

+ (id)nonSchedulingBudgetConfiguration
{
  return -[EDSearchableIndexBudgetConfiguration initWithTime:periodDuration:numberOfItemsToIndexOnResume:enableActivityBasedScheduling:autoStartMaintenanceIndexing:allowBacklogIndexingOnPower:]([EDSearchableIndexBudgetConfiguration alloc], "initWithTime:periodDuration:numberOfItemsToIndexOnResume:enableActivityBasedScheduling:autoStartMaintenanceIndexing:allowBacklogIndexingOnPower:", 0, 0, 0, 0, 0.0, 0.0);
}

- (EDSearchableIndexBudgetConfiguration)initWithTime:(double)a3 periodDuration:(double)a4 numberOfItemsToIndexOnResume:(int64_t)a5 enableActivityBasedScheduling:(BOOL)a6 autoStartMaintenanceIndexing:(BOOL)a7 allowBacklogIndexingOnPower:(BOOL)a8
{
  EDSearchableIndexBudgetConfiguration *result;

  result = -[EDSearchableIndexBudgetConfiguration initWithTime:periodDuration:numberOfItemsToIndexOnResume:](self, "initWithTime:periodDuration:numberOfItemsToIndexOnResume:", a5, a3, a4);
  if (result)
  {
    result->_enableActivityBasedScheduling = a6;
    result->_autoStartMaintenanceIndexing = a7;
    result->_allowBacklogIndexingOnPower = a8;
  }
  return result;
}

- (void)setEnableActivityBasedScheduling:(BOOL)a3
{
  self->_enableActivityBasedScheduling = a3;
}

- (BOOL)autoStartMaintenanceIndexing
{
  return self->_autoStartMaintenanceIndexing;
}

- (void)setAutoStartMaintenanceIndexing:(BOOL)a3
{
  self->_autoStartMaintenanceIndexing = a3;
}

- (BOOL)allowBacklogIndexingOnPower
{
  return self->_allowBacklogIndexingOnPower;
}

- (void)setAllowBacklogIndexingOnPower:(BOOL)a3
{
  self->_allowBacklogIndexingOnPower = a3;
}

@end
