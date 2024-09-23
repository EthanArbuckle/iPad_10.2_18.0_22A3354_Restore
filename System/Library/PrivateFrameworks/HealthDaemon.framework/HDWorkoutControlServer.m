@implementation HDWorkoutControlServer

- (void)remote_finishAllWorkoutsWithCompletion:(id)a3
{
  HDWorkoutManager *workoutManager;
  void (**v5)(id, uint64_t, id);
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  workoutManager = self->_workoutManager;
  v5 = (void (**)(id, uint64_t, id))a3;
  -[HDStandardTaskServer client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v7 = -[HDWorkoutManager finishAllWorkoutsForClient:error:](workoutManager, "finishAllWorkoutsForClient:error:", v6, &v9);
  v8 = v9;

  v5[2](v5, v7, v8);
}

- (void)remote_generatePauseOrResumeRequestAllowingBackgroundRuntime:(BOOL)a3 completion:(id)a4
{
  -[HDWorkoutManager generatePauseOrResumeRequestAllowingBackgroundRuntime:completion:](self->_workoutManager, "generatePauseOrResumeRequestAllowingBackgroundRuntime:completion:", a3, a4);
}

- (void)remote_generateFakeDataForActivityType:(int64_t)a3 minutes:(double)a4 completion:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, _QWORD, void *);

  v11 = (void (**)(id, _QWORD, void *))a5;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataCollectionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "generateFakeDataForActivityType:minutes:completion:", a3, v11, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v10);

  }
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HDWorkoutControlServer *v17;
  HDWorkoutManager *v18;
  HDWorkoutManager *workoutManager;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "workoutManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:]([HDWorkoutControlServer alloc], "initWithUUID:configuration:client:delegate:", v11, v12, v13, v14);
    v18 = v16;
    workoutManager = v17->_workoutManager;
    v17->_workoutManager = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    workoutManager = (HDWorkoutManager *)(id)objc_claimAutoreleasedReturnValue();
    if (workoutManager)
    {
      if (a7)
        *a7 = objc_retainAutorelease(workoutManager);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  return v17;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6E28], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutManager, 0);
}

@end
