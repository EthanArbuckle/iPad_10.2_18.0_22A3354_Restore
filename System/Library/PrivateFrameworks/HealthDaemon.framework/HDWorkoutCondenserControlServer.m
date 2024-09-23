@implementation HDWorkoutCondenserControlServer

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6E18], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB4A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_condenserWithError:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t v11[16];

  if (!a1)
  {
LABEL_10:
    v7 = 0;
    return v7;
  }
  objc_msgSend(a1, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workoutCondenser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v8);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "Asked for condenser on profile other than the primary profile", v11, 2u);
    }
    goto LABEL_10;
  }
  objc_msgSend(a1, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workoutCondenser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)remote_condenseWorkoutsForReason:(int64_t)a3 workoutBatchLimit:(int64_t)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD, id);
  void *v9;
  id v10;
  id v11;

  v11 = 0;
  v8 = (void (**)(id, _QWORD, id))a5;
  -[HDWorkoutCondenserControlServer _condenserWithError:](self, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  if (v9)
    objc_msgSend(v9, "condenseWorkoutsForReason:workoutBatchLimit:completion:", a3, a4, v8);
  else
    v8[2](v8, 0, v10);

}

- (void)remote_condenseWorkoutWithUUID:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, uint64_t, id))a4;
  -[HDStandardTaskServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[HDDataEntity objectWithUUID:encodingOptions:profile:error:](HDWorkoutEntity, "objectWithUUID:encodingOptions:profile:error:", v7, 0, v9, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;

  if (v10)
  {
    v18 = 0;
    -[HDWorkoutCondenserControlServer _condenserWithError:](self, &v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v18;
    v14 = v13;
    if (v12)
    {
      v17 = v13;
      v15 = objc_msgSend(v12, "condenseWorkout:error:", v10, &v17);
      v16 = v17;

      v8[2](v8, v15, v16);
      v14 = v16;
    }
    else
    {
      v8[2](v8, 0, v13);
    }

  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("No workout found with UUID %@"), v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8[2](v8, 0, v11);
  }

}

- (void)remote_condensedWorkoutsWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v4 = (void (**)(id, void *, id))a3;
  v11 = 0;
  -[HDWorkoutCondenserControlServer _condenserWithError:](self, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v6;
  if (v5)
  {
    v10 = v6;
    objc_msgSend(v5, "condensedWorkoutsWithError:", &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    v4[2](v4, v8, v9);
    v7 = v9;
  }
  else
  {
    v4[2](v4, 0, v6);
  }

}

- (void)remote_condensableWorkoutsWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v4 = (void (**)(id, void *, id))a3;
  v11 = 0;
  -[HDWorkoutCondenserControlServer _condenserWithError:](self, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v6;
  if (v5)
  {
    v10 = v6;
    objc_msgSend(v5, "condensableWorkoutsWithError:", &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    v4[2](v4, v8, v9);
    v7 = v9;
  }
  else
  {
    v4[2](v4, 0, v6);
  }

}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6E18], "serverInterface");
}

- (id)remoteInterface
{
  return 0;
}

@end
