@implementation FCPrivateDataSyncAvailability

uint64_t __60__FCPrivateDataSyncAvailability_isPrivateDataSyncingAllowed__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSatisfied") ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
}

- (BOOL)isPrivateDataSyncingAllowed
{
  void *v2;
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[FCPrivateDataSyncAvailability conditions](self, "conditions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_firstObjectPassingTest:", &__block_literal_global_50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = FCPrivateDataLog;
  v5 = os_log_type_enabled((os_log_t)FCPrivateDataLog, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v10 = 138543362;
      v11 = v3;
      v6 = "private data syncing is not allowed because condition failed: %{public}@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v10) = 0;
    v6 = "private data syncing is allowed";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  return v3 == 0;
}

- (NSArray)conditions
{
  return self->_conditions;
}

+ (id)defaultAvailability
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)objc_opt_class());
  v3 = (void *)objc_opt_new();
  v10[0] = v3;
  v4 = (void *)objc_opt_new();
  v10[1] = v4;
  v5 = (void *)objc_opt_new();
  v10[2] = v5;
  v6 = (void *)objc_opt_new();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithConditions:", v7);

  return v8;
}

- (FCPrivateDataSyncAvailability)initWithConditions:(id)a3
{
  id v4;
  FCPrivateDataSyncAvailability *v5;
  uint64_t v6;
  NSArray *conditions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCPrivateDataSyncAvailability;
  v5 = -[FCPrivateDataSyncAvailability init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    conditions = v5->_conditions;
    v5->_conditions = (NSArray *)v6;

  }
  return v5;
}

+ (id)notAvailable
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc((Class)objc_opt_class());
  v3 = (void *)objc_opt_new();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithConditions:", v4);

  return v5;
}

@end
