@implementation HDMedicationExposableDoseEventControlTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0D2C520];
}

+ (id)requiredEntitlements
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB5408];
  v4[0] = *MEMORY[0x1E0CB5140];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0D2C458], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0D2C458], "clientInterface");
}

- (void)remote_doseEventsForDateInterval:(id)a3 medicationIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  id v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  -[HDStandardTaskServer client](self, "client");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "authorizationOracle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "clientHasAuthorizationForAllTypes");

  if ((v13 & 1) == 0)
  {
    -[HDStandardTaskServer client](self, "client");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "authorizationOracle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6D58], "userTrackedConceptTypeForIdentifier:", *MEMORY[0x1E0CB60C8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v16, "readAuthorizationStatusForType:error:", v17, &v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v32;

    if (v18)
    {
      if (objc_msgSend(v18, "authorizationStatus") == 103)
      {

        goto LABEL_6;
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = CFSTR("Authorization denied.");
      v30 = 4;
    }
    else
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
        -[HDMedicationExposableDoseEventControlTaskServer remote_doseEventsForDateInterval:medicationIdentifier:completion:].cold.1((uint64_t)v14, v21, v22, v23, v24, v25, v26, v27);
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = CFSTR("Unable to determine authorization.");
      v30 = 5;
    }
    objc_msgSend(v28, "hk_error:description:", v30, v29);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v10[2](v10, 0, v20);
    goto LABEL_12;
  }
  v14 = 0;
LABEL_6:
  -[HDStandardTaskServer profile](self, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v14;
  +[HDMedicationExposableDoseEventEngine doseEventsForDateInterval:medicationIdentifier:profile:error:](HDMedicationExposableDoseEventEngine, "doseEventsForDateInterval:medicationIdentifier:profile:error:", v8, v9, v19, &v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v31;

  ((void (**)(id, void *, id))v10)[2](v10, v18, v20);
LABEL_12:

}

- (void)remote_writeDoseEvents:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  id v29;
  id v30;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  -[HDStandardTaskServer client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationOracle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "clientHasAuthorizationForAllTypes");

  if ((v10 & 1) == 0)
  {
    -[HDStandardTaskServer client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "authorizationOracle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6D58], "userTrackedConceptTypeForIdentifier:", *MEMORY[0x1E0CB60C8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v13, "readAuthorizationStatusForType:error:", v14, &v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v30;

    if (v15)
    {
      if (objc_msgSend(v15, "authorizationStatus") == 103)
      {

        goto LABEL_6;
      }
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = CFSTR("Authorization denied.");
      v28 = 4;
    }
    else
    {
      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
        -[HDMedicationExposableDoseEventControlTaskServer remote_doseEventsForDateInterval:medicationIdentifier:completion:].cold.1((uint64_t)v11, v19, v20, v21, v22, v23, v24, v25);
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = CFSTR("Unable to determine authorization.");
      v28 = 5;
    }
    objc_msgSend(v26, "hk_error:description:", v28, v27);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v18);
    goto LABEL_12;
  }
  v11 = 0;
LABEL_6:
  -[HDStandardTaskServer profile](self, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v11;
  v17 = +[HDMedicationExposableDoseEventEngine writeDoseEvents:profile:error:](HDMedicationExposableDoseEventEngine, "writeDoseEvents:profile:error:", v6, v16, &v29);
  v18 = v29;

  v7[2](v7, v17, v18);
LABEL_12:

}

- (void)remote_deleteDoseEventWithPersistentUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  -[HDStandardTaskServer client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationOracle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "clientHasAuthorizationForAllTypes");

  if ((v10 & 1) == 0)
  {
    -[HDStandardTaskServer client](self, "client");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "authorizationOracle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6D58], "userTrackedConceptTypeForIdentifier:", *MEMORY[0x1E0CB60C8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v13, "readAuthorizationStatusForType:error:", v14, &v32);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v32;

    if (v15)
    {
      if (objc_msgSend(v15, "authorizationStatus") == 103)
      {

        goto LABEL_6;
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = CFSTR("Authorization denied.");
      v30 = 4;
    }
    else
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
        -[HDMedicationExposableDoseEventControlTaskServer remote_doseEventsForDateInterval:medicationIdentifier:completion:].cold.1((uint64_t)v11, v21, v22, v23, v24, v25, v26, v27);
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = CFSTR("Unable to determine authorization.");
      v30 = 5;
    }
    objc_msgSend(v28, "hk_error:description:", v30, v29);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v20);
    goto LABEL_12;
  }
  v11 = 0;
LABEL_6:
  v15 = objc_alloc_init(MEMORY[0x1E0D29480]);
  -[HDStandardTaskServer profile](self, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dataManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v11;
  v19 = objc_msgSend(v17, "deleteObjectsWithUUIDCollection:configuration:error:", v18, v15, &v31);
  v20 = v31;

  v7[2](v7, v19, v20);
LABEL_12:

}

- (void)remote_doseEventsForDateInterval:(uint64_t)a3 medicationIdentifier:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B815E000, a2, a3, "Failed to retrieve authorization status for activity summary type: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
