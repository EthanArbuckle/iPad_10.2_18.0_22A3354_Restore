@implementation FIUIWeeklyGoalModel

- (FIUIWeeklyGoalModel)init
{
  return -[FIUIWeeklyGoalModel initWithHealthStore:](self, "initWithHealthStore:", 0);
}

- (FIUIWeeklyGoalModel)initWithHealthStore:(id)a3
{
  id v5;
  FIUIWeeklyGoalModel *v6;
  FIUIWeeklyGoalModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIWeeklyGoalModel;
  v6 = -[FIUIWeeklyGoalModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_healthStore, a3);

  return v7;
}

- (void)fetchMostRecentWeeklyGoalWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("startDate <= %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3718], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x24BDD3F00]);
    objc_msgSend(MEMORY[0x24BDD3DC0], "calorieGoal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __63__FIUIWeeklyGoalModel_fetchMostRecentWeeklyGoalWithCompletion___block_invoke;
    v13[3] = &unk_24CF31868;
    v14 = v4;
    v12 = (void *)objc_msgSend(v9, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v10, v7, 1, v11, v13);

    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v12);
  }

}

void __63__FIUIWeeklyGoalModel_fetchMostRecentWeeklyGoalWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "lastObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)saveNewWeeklyGoal:(id)a3 forDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD3DC0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "calorieGoal");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIWeeklyGoalModel saveNewWeeklyGoal:quantityType:forDate:completion:](self, "saveNewWeeklyGoal:quantityType:forDate:completion:", v8, v9, v7, 0);

}

- (void)saveNewWeeklyGoal:(id)a3 forDate:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (void *)MEMORY[0x24BDD3DC0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "calorieGoal");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[FIUIWeeklyGoalModel saveNewWeeklyGoal:quantityType:forDate:completion:](self, "saveNewWeeklyGoal:quantityType:forDate:completion:", v11, v12, v10, v9);

}

- (void)saveNewWeeklyGoal:(id)a3 quantityType:(id)a4 forDate:(id)a5 completion:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  HKHealthStore *healthStore;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  objc_msgSend(MEMORY[0x24BDD3E68], "quantitySampleWithType:quantity:startDate:endDate:", a4, a3, a5, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEBUG))
    -[FIUIWeeklyGoalModel saveNewWeeklyGoal:quantityType:forDate:completion:].cold.1(v12, (uint64_t)v11, (uint64_t)self);
  healthStore = self->_healthStore;
  v18[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke;
  v16[3] = &unk_24CF318B8;
  v17 = v10;
  v15 = v10;
  -[HKHealthStore saveObjects:withCompletion:](healthStore, "saveObjects:withCompletion:", v14, v16);

}

void __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke_2;
  v8[3] = &unk_24CF31890;
  v10 = a2;
  v6 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v6);

}

void __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[16];

  v2 = *(unsigned __int8 *)(a1 + 40);
  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD2FA8];
  v4 = *MEMORY[0x24BDD2FA8];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21307C000, v3, OS_LOG_TYPE_DEFAULT, "Successfully saved new weekly goal", v11, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke_2_cold_1(a1, v3, v5, v6, v7, v8, v9, v10);
  }
}

- (void)saveNewWeeklyGoals:(id)a3
{
  -[HKHealthStore saveObjects:withCompletion:](self->_healthStore, "saveObjects:withCompletion:", a3, &__block_literal_global_19);
}

void __42__FIUIWeeklyGoalModel_saveNewWeeklyGoals___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__FIUIWeeklyGoalModel_saveNewWeeklyGoals___block_invoke_2;
  v6[3] = &unk_24CF31890;
  v8 = a2;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __42__FIUIWeeklyGoalModel_saveNewWeeklyGoals___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[16];

  v2 = *(unsigned __int8 *)(a1 + 40);
  _HKInitializeLogging();
  v3 = *MEMORY[0x24BDD2FA8];
  v4 = *MEMORY[0x24BDD2FA8];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21307C000, v3, OS_LOG_TYPE_DEFAULT, "Successfully saved new weekly goal", v11, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __42__FIUIWeeklyGoalModel_saveNewWeeklyGoals___block_invoke_2_cold_1(a1, v3, v5, v6, v7, v8, v9, v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)saveNewWeeklyGoal:(uint64_t)a3 quantityType:forDate:completion:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  HKLogSafeDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a3 + 8);
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_21307C000, v4, OS_LOG_TYPE_DEBUG, "Saving weekly goal, quantity sample = %@. healthStore = %@", (uint8_t *)&v7, 0x16u);

}

void __73__FIUIWeeklyGoalModel_saveNewWeeklyGoal_quantityType_forDate_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21307C000, a2, a3, "Could not save weekly goal to HealthKit database: %{public}@", a5, a6, a7, a8, 2u);
}

void __42__FIUIWeeklyGoalModel_saveNewWeeklyGoals___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_21307C000, a2, a3, "Could not save weekly goals to HealthKit database: %{public}@", a5, a6, a7, a8, 2u);
}

@end
