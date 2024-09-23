@implementation _DPPrivacyBudgetManager

- (void)scheduleMaintenanceWithName:(id)a3 database:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64___DPPrivacyBudgetManager_scheduleMaintenanceWithName_database___block_invoke;
  v10[3] = &unk_1E95D8FC0;
  v11 = v5;
  v6 = v5;
  v7 = a3;
  v8 = (void *)MEMORY[0x1D8256D34](v10);
  +[_DPPeriodicTask taskWithName:period:handler:](_DPPeriodicTask, "taskWithName:period:handler:", v7, kSecondsIn12Hours, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DPPeriodicTaskManager registerTask:](_DPPeriodicTaskManager, "registerTask:", v9);
}

@end
