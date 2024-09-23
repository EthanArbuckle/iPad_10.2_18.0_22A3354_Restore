@implementation HDWorkoutCondenserDiagnosticOperation

- (id)reportFilename
{
  return CFSTR("WorkoutCondenser.txt");
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD4130]), "initWithHealthStore:", v7);
  -[HDWorkoutCondenserDiagnosticOperation _reportCondensedWorkoutsWithTaskClient:](self, "_reportCondensedWorkoutsWithTaskClient:", v3);
  -[HDWorkoutCondenserDiagnosticOperation _reportCondensableWorkoutsWithTaskClient:](self, "_reportCondensableWorkoutsWithTaskClient:", v3);
  -[HDDiagnosticOperation healthDirectoryURL](self, "healthDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("healthdb.sqlite"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDDiagnosticOperation openReadOnlyDatabaseAtURL:](self, "openReadOnlyDatabaseAtURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutCondenserDiagnosticOperation _reportWorkoutCondenserTTRValuesWithDatabase:](self, "_reportWorkoutCondenserTTRValuesWithDatabase:", v6);
  objc_msgSend(v6, "close");

}

- (void)_reportCondensedWorkoutsWithTaskClient:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t);
  void *v11;
  HDWorkoutCondenserDiagnosticOperation *v12;
  NSObject *v13;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __80__HDWorkoutCondenserDiagnosticOperation__reportCondensedWorkoutsWithTaskClient___block_invoke;
  v11 = &unk_24E0D8DA0;
  v12 = self;
  v6 = v5;
  v13 = v6;
  objc_msgSend(v4, "condensedWorkoutsWithCompletion:", &v8);

  v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Timed out attempting to get condensed workouts"), v8, v9, v10, v11, v12);

}

void __80__HDWorkoutCondenserDiagnosticOperation__reportCondensedWorkoutsWithTaskClient___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "appendString:", CFSTR("Condensed Workouts"));
    objc_msgSend(*(id *)(a1 + 32), "appendStrongSeparator");
    objc_msgSend(v5, "workouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD4028], "formatterForCodableCondensedWorkouts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v5, "workouts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(v9, "appendWorkout:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

      v15 = *(void **)(a1 + 32);
      objc_msgSend(v9, "formattedTable");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendString:", v16);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("No condensed workouts found"));
    }
    objc_msgSend(*(id *)(a1 + 32), "appendNewline");
    objc_msgSend(*(id *)(a1 + 32), "appendNewline");
  }
  else
  {
    objc_msgSend(v6, "log:", CFSTR("ERROR: Failed to fetch condensed workouts: %@"), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_reportCondensableWorkoutsWithTaskClient:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t);
  void *v11;
  HDWorkoutCondenserDiagnosticOperation *v12;
  NSObject *v13;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __82__HDWorkoutCondenserDiagnosticOperation__reportCondensableWorkoutsWithTaskClient___block_invoke;
  v11 = &unk_24E0D8DA0;
  v12 = self;
  v6 = v5;
  v13 = v6;
  objc_msgSend(v4, "condensableWorkoutsWithCompletion:", &v8);

  v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Timed out attempting to get condensable workouts"), v8, v9, v10, v11, v12);

}

void __82__HDWorkoutCondenserDiagnosticOperation__reportCondensableWorkoutsWithTaskClient___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "appendString:", CFSTR("Condensable Workouts"));
    objc_msgSend(*(id *)(a1 + 32), "appendStrongSeparator");
    objc_msgSend(v5, "workouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD4028], "formatterForCodableCondensedWorkouts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v5, "workouts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(v9, "appendWorkout:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

      v15 = *(void **)(a1 + 32);
      objc_msgSend(v9, "formattedTable");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendString:", v16);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("No condensable workouts found"));
    }
    objc_msgSend(*(id *)(a1 + 32), "appendNewline");
    objc_msgSend(*(id *)(a1 + 32), "appendNewline");
  }
  else
  {
    objc_msgSend(v6, "log:", CFSTR("ERROR: Failed to fetch condensable workouts: %@"), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_reportWorkoutCondenserTTRValuesWithDatabase:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *MEMORY[0x24BE409E8];
  v8 = 0;
  objc_msgSend(MEMORY[0x24BE40C88], "formattedPersistedValuesForDomainName:database:error:", v4, a3, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  v7 = v6;
  if (v5)
  {
    -[HDDiagnosticOperation appendNewline](self, "appendNewline");
    -[HDDiagnosticOperation appendFormat:](self, "appendFormat:", CFSTR("%@"), v5);
  }
  else
  {
    -[HDDiagnosticOperation log:](self, "log:", CFSTR("ERROR: Failed to get TTR values for domain \"%@\": %@"), v4, v6);
  }

}

@end
