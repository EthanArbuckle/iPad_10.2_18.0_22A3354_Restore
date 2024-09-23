@implementation WFHealthKitAccessResource

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.Health");
}

- (id)localizedProtectedResourceDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("your Health data"), CFSTR("your Health data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (WFHealthKitAccessResource)initWithDefinition:(id)a3
{
  WFHealthKitAccessResource *v3;
  uint64_t v4;
  HKHealthStore *healthStore;
  WFHealthKitAccessResource *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFHealthKitAccessResource;
  v3 = -[WFAccessResource initWithDefinition:](&v8, sel_initWithDefinition_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD3C40], "wf_shortcutsAppHealthStore");
    v4 = objc_claimAutoreleasedReturnValue();
    healthStore = v3->_healthStore;
    v3->_healthStore = (HKHealthStore *)v4;

    v6 = v3;
  }

  return v3;
}

- (id)objectTypesForAccessType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v41 = (id)objc_opt_new();
  -[WFResource definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Resources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[WFResource definition](self, "definition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WFResource definition](self, "definition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v47;
    v45 = *MEMORY[0x24BDD33A8];
    v42 = *MEMORY[0x24BDD33A0];
    v43 = *(_QWORD *)v47;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v13);
        v15 = objc_opt_class();
        WFEnforceClass(v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          if (!v4
            || (objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AccessType")),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v18, "isEqualToString:", v4),
                v18,
                v19))
          {
            v20 = v17;
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ObjectType"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {

              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ReadableType"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ReadableObjectTypeIdentifier"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ReadableObjectTypeIdentifier"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v24 = v23 != 0;
                if (objc_msgSend(v22, "isEqualToString:", CFSTR("Quantity")) && v23)
                {
                  +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v23);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", v25);
                  v26 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_27;
                }
              }
              else
              {

                objc_msgSend(v22, "isEqualToString:", CFSTR("Quantity"));
                v24 = 0;
                v23 = 0;
              }
              if (objc_msgSend(v22, "isEqualToString:", CFSTR("Workout")))
              {
                objc_msgSend(MEMORY[0x24BDD3DC0], "workoutType");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_28;
              }
              if ((objc_msgSend(v22, "isEqualToString:", CFSTR("Characteristic")) & v24) == 1)
              {
                +[WFHealthKitHelper characteristicTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "characteristicTypeIdentifierFromReadableTypeIdentifier:", v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD3DC0], "characteristicTypeForIdentifier:", v25);
                v26 = objc_claimAutoreleasedReturnValue();
                goto LABEL_27;
              }
              if (objc_msgSend(v22, "isEqualToString:", CFSTR("Category")))
              {
                +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v23);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", v25);
                v26 = objc_claimAutoreleasedReturnValue();
LABEL_27:
                v21 = (void *)v26;

              }
              else
              {
                if (objc_msgSend(v22, "isEqualToString:", CFSTR("Correlation")))
                {
                  v37 = (void *)MEMORY[0x24BDD17C8];
                  WFLocalizedString(CFSTR("%@ types are not implemented"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "localizedStringWithFormat:", v38, v22);
                  v39 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v39, 0);
                  v40 = (id)objc_claimAutoreleasedReturnValue();
                  objc_exception_throw(v40);
                }
                v21 = 0;
              }
LABEL_28:

            }
            if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Write"))
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v27 = v21;
              objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", v27, 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v29, "isEqualToString:", v45))
              {

                goto LABEL_34;
              }
              objc_msgSend(v27, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "isEqualToString:", v42);

              if (v31)
              {
LABEL_34:
                objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v42);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v32);

                objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v45);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "addObject:", v33);

              }
              v34 = (void *)objc_msgSend(v28, "copy");

              objc_msgSend(v41, "unionSet:", v34);
            }

            v12 = v43;
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      v11 = v35;
    }
    while (v35);
  }

  return v41;
}

- (id)objectTypes
{
  return -[WFHealthKitAccessResource objectTypesForAccessType:](self, "objectTypesForAccessType:", 0);
}

- (id)readTypes
{
  return -[WFHealthKitAccessResource objectTypesForAccessType:](self, "objectTypesForAccessType:", CFSTR("Read"));
}

- (id)writeTypes
{
  return -[WFHealthKitAccessResource objectTypesForAccessType:](self, "objectTypesForAccessType:", CFSTR("Write"));
}

- (id)readableUnauthorizedResourceDescription
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t (**v7)(void *, void *, uint64_t);
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *, uint64_t);
  void *v17;
  id v18;
  id v19;

  -[WFHealthKitAccessResource healthStore](self, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __68__WFHealthKitAccessResource_readableUnauthorizedResourceDescription__block_invoke;
  v17 = &unk_24F8B0100;
  v5 = v3;
  v18 = v5;
  v6 = v4;
  v19 = v6;
  v7 = (uint64_t (**)(void *, void *, uint64_t))_Block_copy(&v14);
  -[WFHealthKitAccessResource readTypes](self, "readTypes", v14, v15, v16, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7[2](v7, v8, 2) & 1) == 0)
  {

    goto LABEL_5;
  }
  -[WFHealthKitAccessResource writeTypes](self, "writeTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7[2](v7, v9, 1);

  if ((v10 & 1) == 0)
  {
LABEL_5:
    WFLocalizedString(CFSTR("Health"));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v6);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = (void *)v11;

  return v12;
}

- (void)refreshAvailability
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  uint64_t *v17;
  unint64_t v18;
  dispatch_semaphore_t v19;
  NSObject *v20;
  dispatch_time_t v21;
  objc_super v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[WFHealthKitAccessResource objectTypes](self, "objectTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[WFHealthKitAccessResource healthStore](self, "healthStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHealthKitAccessResource writeTypes](self, "writeTypes");
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v35;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addIndex:", objc_msgSend(v4, "authorizationStatusForType:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v9++)));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHealthKitAccessResource readTypes](self, "readTypes");
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v31;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addIndex:", objc_msgSend(v4, "authorizationStatusForType:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14++)));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v12);
    }

    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 1;
    if (objc_msgSend(v5, "containsIndex:", 1))
      v27[3] = 3;
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToIndexSet:", v15))
    {
      v16 = objc_msgSend(v11, "count") == 0;

      v17 = v27;
      if (v16)
        v27[3] = 4;
    }
    else
    {

      v17 = v27;
    }
    v18 = v17[3];
    if (v18 == 1)
    {
      v19 = dispatch_semaphore_create(0);
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __48__WFHealthKitAccessResource_refreshAvailability__block_invoke;
      v23[3] = &unk_24F8B0128;
      v25 = &v26;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v4, "getRequestStatusForAuthorizationToShareTypes:readTypes:completion:", v6, v3, v23);
      v21 = dispatch_time(0, 2000000000);
      dispatch_semaphore_wait(v20, v21);

      v18 = v27[3];
    }
    self->_status = v18;
    v22.receiver = self;
    v22.super_class = (Class)WFHealthKitAccessResource;
    -[WFAccessResource refreshAvailability](&v22, sel_refreshAvailability);
    _Block_object_dispose(&v26, 8);

  }
  else
  {
    self->_status = 4;
    v38.receiver = self;
    v38.super_class = (Class)WFHealthKitAccessResource;
    -[WFAccessResource refreshAvailability](&v38, sel_refreshAvailability);
  }

}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  if (!objc_msgSend(a3, "isRunningWithSiriUI"))
  {
    -[WFHealthKitAccessResource objectTypes](self, "objectTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      -[WFHealthKitAccessResource healthStore](self, "healthStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHealthKitAccessResource writeTypes](self, "writeTypes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __78__WFHealthKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
      v10[3] = &unk_24F8B8FC0;
      v10[4] = self;
      v11 = v6;
      objc_msgSend(v8, "requestAuthorizationToShareTypes:readTypes:completion:", v9, v7, v10);

    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 1, 0);
    }
    goto LABEL_9;
  }
  if (self->_status != 4)
  {
    -[WFResource refreshAvailabilityWithNotification](self, "refreshAvailabilityWithNotification");
    if (self->_status != 4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v7);
LABEL_9:

      goto LABEL_10;
    }
  }
  (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 1, 0);
LABEL_10:

}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  -[WFHealthKitAccessResource readableUnauthorizedResourceDescription](self, "readableUnauthorizedResourceDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    if (a3 == 3)
      v6 = CFSTR("Health access to %@ is off. You can turn on health data categories in the Health app.");
    else
      v6 = CFSTR("Shortcuts does not have access to your %@ data.");
    WFLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)importErrorReasonForStatus:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFHealthKitAccessResource readableUnauthorizedResourceDescription](self, "readableUnauthorizedResourceDescription", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("In order to answer this question, Shortcuts needs access to your %@ data."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3
{
  void *v3;
  void **v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a3 == 3)
  {
    WFLocalizedString(CFSTR("Open Health"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v4 = (void **)v8;
  }
  else
  {
    WFLocalizedString(CFSTR("Allow Access"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v3;
    v4 = &v7;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)attemptRecoveryFromErrorWithOptionIndex:(unint64_t)a3 userInterface:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  v8 = a5;
  if (-[WFHealthKitAccessResource status](self, "status") == 3)
  {
    objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("x-apple-health://"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __101__WFHealthKitAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke;
    v11[3] = &unk_24F8B4CD0;
    v12 = v8;
    objc_msgSend(v9, "openURL:withBundleIdentifier:userInterface:completionHandler:", v10, CFSTR("com.apple.Health"), v7, v11);

  }
  else
  {
    -[WFHealthKitAccessResource makeAvailableWithUserInterface:completionHandler:](self, "makeAvailableWithUserInterface:completionHandler:", v7, v8);
  }

}

- (unint64_t)status
{
  return self->_status;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
}

uint64_t __101__WFHealthKitAccessResource_attemptRecoveryFromErrorWithOptionIndex_userInterface_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__WFHealthKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__WFHealthKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
  v8[3] = &unk_24F8B3990;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __78__WFHealthKitAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithForcedNotification");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

intptr_t __48__WFHealthKitAccessResource_refreshAvailability__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __68__WFHealthKitAccessResource_readableUnauthorizedResourceDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;

  objc_msgSend(a2, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = sel_hk_localizedName;
    v8 = 0x24BDD3000uLL;
    v9 = 0x24BDD4000uLL;
    v10 = CFSTR("Workout");
    v22 = a3;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 32), "authorizationStatusForType:", v11);
      if (a3 == 1 && v12 == 2)
        goto LABEL_13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          objc_msgSend(v11, "identifier");
          v15 = v7;
          v16 = v8;
          v17 = v9;
          v18 = v10;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:](WFHealthKitHelper, "readableSampleTypeIdentifierFromSampleTypeIdentifier:", v19);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v18;
          v9 = v17;
          v8 = v16;
          v7 = v15;
          a3 = v22;
          goto LABEL_12;
        }
        objc_msgSend(v11, "hk_localizedName");
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v20 = 0;
          goto LABEL_15;
        }
        WFLocalizedString(v10);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)v13;
LABEL_12:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

LABEL_13:
      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }
  v20 = 1;
LABEL_15:

  return v20;
}

+ (BOOL)alwaysMakeAvailable
{
  return 1;
}

+ (BOOL)isSystemResource
{
  return 1;
}

@end
