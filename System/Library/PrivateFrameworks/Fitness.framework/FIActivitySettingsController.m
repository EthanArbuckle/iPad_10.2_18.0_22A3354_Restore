@implementation FIActivitySettingsController

- (FIActivitySettingsController)init
{
  id v3;
  FIActivitySettingsController *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDD3C40]);
  v4 = -[FIActivitySettingsController initWithHealthStore:](self, "initWithHealthStore:", v3);

  return v4;
}

- (FIActivitySettingsController)initWithHealthStore:(id)a3
{
  id v5;
  FIActivitySettingsController *v6;
  FIActivitySettingsController *v7;
  uint64_t v8;
  NSMutableDictionary *dirtyPropertiesMap;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FIActivitySettingsController;
  v6 = -[FIActivitySettingsController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_opt_new();
    dirtyPropertiesMap = v7->_dirtyPropertiesMap;
    v7->_dirtyPropertiesMap = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)setDateOfBirth:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_dateOfBirth, a3);
  v5 = a3;
  -[FIActivitySettingsController _setUncommitedValue:forPropertyKey:](self, "_setUncommitedValue:forPropertyKey:", v5, CFSTR("dateOfBirth"));

}

- (void)setHeight:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_height, a3);
  v5 = a3;
  -[FIActivitySettingsController _setUncommitedValue:forPropertyKey:](self, "_setUncommitedValue:forPropertyKey:", v5, CFSTR("height"));

}

- (void)setWeight:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_weight, a3);
  v5 = a3;
  -[FIActivitySettingsController _setUncommitedValue:forPropertyKey:](self, "_setUncommitedValue:forPropertyKey:", self->_weight, CFSTR("weight"));

}

- (void)setBiologicalSex:(int64_t)a3
{
  id v4;

  self->_biologicalSex = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FIActivitySettingsController _setUncommitedValue:forPropertyKey:](self, "_setUncommitedValue:forPropertyKey:", v4, CFSTR("biologicalSexObject"));

}

- (void)setWheelchairUse:(int64_t)a3
{
  id v4;

  self->_wheelchairUse = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FIActivitySettingsController _setUncommitedValue:forPropertyKey:](self, "_setUncommitedValue:forPropertyKey:", v4, CFSTR("wheelchairUse"));

}

- (BOOL)_hasDirtyPropertyForPropertyKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_dirtyPropertiesMap, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)_setUncommitedValue:(id)a3 forPropertyKey:(id)a4
{
  void (**updateHandler)(void);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dirtyPropertiesMap, "setObject:forKeyedSubscript:", a3, a4);
  updateHandler = (void (**)(void))self->_updateHandler;
  if (updateHandler)
    updateHandler[2]();
}

- (BOOL)_commitValue:(id)a3 forPropertyKey:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  _QWORD v27[4];
  id v28;
  FIActivitySettingsController *v29;
  __int128 *v30;
  _QWORD v31[4];
  id v32;
  FIActivitySettingsController *v33;
  __int128 *v34;
  _QWORD v35[4];
  id v36;
  FIActivitySettingsController *v37;
  __int128 *v38;
  _QWORD v39[5];
  id v40;
  __int128 *v41;
  _QWORD aBlock[5];
  id v43;
  __int128 *p_buf;
  _QWORD v45[5];
  _QWORD v46[5];
  __int128 buf;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _HKInitializeLogging();
  v9 = *MEMORY[0x24BDD2FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_21168F000, v9, OS_LOG_TYPE_DEFAULT, "Storing property %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__4;
  v50 = __Block_byref_object_dispose__4;
  v51 = 0;
  v10 = MEMORY[0x24BDAC760];
  v45[0] = CFSTR("height");
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke;
  aBlock[3] = &unk_24CC4EB60;
  aBlock[4] = self;
  v11 = v7;
  v43 = v11;
  p_buf = &buf;
  v12 = _Block_copy(aBlock);
  v46[0] = v12;
  v45[1] = CFSTR("weight");
  v39[0] = v10;
  v39[1] = 3221225472;
  v39[2] = __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_2;
  v39[3] = &unk_24CC4EB60;
  v39[4] = self;
  v13 = v11;
  v40 = v13;
  v41 = &buf;
  v14 = _Block_copy(v39);
  v46[1] = v14;
  v45[2] = CFSTR("dateOfBirth");
  v35[0] = v10;
  v35[1] = 3221225472;
  v35[2] = __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_3;
  v35[3] = &unk_24CC4EB60;
  v15 = v13;
  v36 = v15;
  v37 = self;
  v38 = &buf;
  v16 = _Block_copy(v35);
  v46[2] = v16;
  v45[3] = CFSTR("biologicalSexObject");
  v31[0] = v10;
  v31[1] = 3221225472;
  v31[2] = __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_4;
  v31[3] = &unk_24CC4EB60;
  v17 = v15;
  v32 = v17;
  v33 = self;
  v34 = &buf;
  v18 = _Block_copy(v31);
  v46[3] = v18;
  v45[4] = CFSTR("wheelchairUse");
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_5;
  v27[3] = &unk_24CC4EB60;
  v19 = v17;
  v28 = v19;
  v29 = self;
  v30 = &buf;
  v20 = _Block_copy(v27);
  v46[4] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "objectForKeyedSubscript:", v8);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("No action defined for unknown property key %@"), v8);
    goto LABEL_10;
  }
  (*(void (**)(uint64_t))(v22 + 16))(v22);
  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
LABEL_10:
    v24 = 1;
    goto LABEL_11;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
    -[FIActivitySettingsController _commitValue:forPropertyKey:error:].cold.1();
  v24 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
LABEL_11:

  _Block_object_dispose(&buf, 8);
  return v24;
}

void __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_setHeightCharacteristicQuantity:error:", v1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_2(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id obj;

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "_setBodyMassCharacteristicQuantity:error:", v1, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

void __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id obj;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_canonicalDateOfBirthDateComponentsWithDate:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1[5] + 8);
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "_setDateOfBirthComponents:error:", v2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

}

void __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id obj;

  v2 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "_setBiologicalSex:error:", v2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
}

void __66__FIActivitySettingsController__commitValue_forPropertyKey_error___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id obj;

  v2 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "_setWheelchairUse:error:", v2, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (void)populateExistingCharacteristics
{
  HKHealthStore *healthStore;
  void *v4;
  id v5;
  void *v6;
  NSDate *v7;
  NSDate *dateOfBirth;
  id v9;
  HKHealthStore *v10;
  HKQuantity *v11;
  id v12;
  HKQuantity *height;
  id v14;
  HKHealthStore *v15;
  HKQuantity *v16;
  id v17;
  HKQuantity *weight;
  id v19;
  HKHealthStore *v20;
  void *v21;
  id v22;
  id v23;
  HKHealthStore *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;

  healthStore = self->_healthStore;
  v37 = 0;
  -[HKHealthStore dateOfBirthComponentsWithError:](healthStore, "dateOfBirthComponentsWithError:", &v37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v37;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromComponents:", v4);
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateOfBirth = self->_dateOfBirth;
    self->_dateOfBirth = v7;

  }
  v36 = v5;
  -[FIActivitySettingsController _logAndNilError:operationDescription:](self, "_logAndNilError:operationDescription:", &v36, CFSTR("fetch birth date"));
  v9 = v36;

  v10 = self->_healthStore;
  v35 = v9;
  -[HKHealthStore _heightCharacteristicQuantityWithError:](v10, "_heightCharacteristicQuantityWithError:", &v35);
  v11 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
  v12 = v35;

  height = self->_height;
  self->_height = v11;

  v34 = v12;
  -[FIActivitySettingsController _logAndNilError:operationDescription:](self, "_logAndNilError:operationDescription:", &v34, CFSTR("fetch height"));
  v14 = v34;

  v15 = self->_healthStore;
  v33 = v14;
  -[HKHealthStore _bodyMassCharacteristicQuantityWithError:](v15, "_bodyMassCharacteristicQuantityWithError:", &v33);
  v16 = (HKQuantity *)objc_claimAutoreleasedReturnValue();
  v17 = v33;

  weight = self->_weight;
  self->_weight = v16;

  v32 = v17;
  -[FIActivitySettingsController _logAndNilError:operationDescription:](self, "_logAndNilError:operationDescription:", &v32, CFSTR("fetch weight"));
  v19 = v32;

  v20 = self->_healthStore;
  v31 = v19;
  -[HKHealthStore biologicalSexWithError:](v20, "biologicalSexWithError:", &v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v31;

  self->_biologicalSex = objc_msgSend(v21, "biologicalSex");
  v30 = v22;
  -[FIActivitySettingsController _logAndNilError:operationDescription:](self, "_logAndNilError:operationDescription:", &v30, CFSTR("fetch sex"));
  v23 = v30;

  v24 = self->_healthStore;
  v29 = v23;
  -[HKHealthStore wheelchairUseWithError:](v24, "wheelchairUseWithError:", &v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v29;

  self->_wheelchairUse = objc_msgSend(v25, "wheelchairUse");
  v28 = v26;
  -[FIActivitySettingsController _logAndNilError:operationDescription:](self, "_logAndNilError:operationDescription:", &v28, CFSTR("fetch wheelchair use"));
  v27 = v28;

  -[NSMutableDictionary removeAllObjects](self->_dirtyPropertiesMap, "removeAllObjects");
  if (!self->_wheelchairUse)
    -[FIActivitySettingsController setWheelchairUse:](self, "setWheelchairUse:", 1);

}

- (BOOL)_logAndNilError:(id *)a3 operationDescription:(id)a4
{
  id v5;
  BOOL v6;
  NSObject *v7;

  v5 = a4;
  if (a3)
  {
    v6 = *a3 == 0;
    if (*a3)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
        -[FIActivitySettingsController _logAndNilError:operationDescription:].cold.2();
    }
    *a3 = 0;
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      -[FIActivitySettingsController _logAndNilError:operationDescription:].cold.1((uint64_t)v5, v7);
    v6 = 0;
  }

  return v6;
}

- (BOOL)commmitWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allKeys](self->_dirtyPropertiesMap, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_dirtyPropertiesMap, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v11;
        -[FIActivitySettingsController _commitValue:forPropertyKey:error:](self, "_commitValue:forPropertyKey:error:", v13, v12, &v16);
        v8 = v16;

        if (a3 && v8)
        {
          v8 = objc_retainAutorelease(v8);
          *a3 = v8;

          v14 = 0;
          goto LABEL_14;
        }
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }

  -[NSMutableDictionary removeAllObjects](self->_dirtyPropertiesMap, "removeAllObjects");
  v14 = 1;
LABEL_14:

  return v14;
}

- (unint64_t)experienceType
{
  unint64_t result;

  result = FIExperienceTypeWithHealthStore(self->_healthStore);
  if (result <= 1)
    return 1;
  return result;
}

- (HKQuantity)leanBodyMass
{
  void *v3;
  void *v4;
  dispatch_semaphore_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  intptr_t (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD35E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3718], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v6 = objc_alloc(MEMORY[0x24BDD3F00]);
  v26[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __44__FIActivitySettingsController_leanBodyMass__block_invoke;
  v17 = &unk_24CC4EB88;
  v19 = &v20;
  v8 = v5;
  v18 = v8;
  v9 = (void *)objc_msgSend(v6, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v3, 0, 1, v7, &v14);

  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v9, v14, v15, v16, v17);
  v10 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v10))
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
      -[FIActivitySettingsController leanBodyMass].cold.1(v11);
  }
  v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return (HKQuantity *)v12;
}

intptr_t __44__FIActivitySettingsController_leanBodyMass__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quantity");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  FIActivitySettingsController *v4;
  uint64_t v5;
  NSMutableDictionary *dirtyPropertiesMap;
  void *v7;
  id updateHandler;

  v4 = -[FIActivitySettingsController initWithHealthStore:]([FIActivitySettingsController alloc], "initWithHealthStore:", self->_healthStore);
  objc_storeStrong((id *)&v4->_dateOfBirth, self->_dateOfBirth);
  objc_storeStrong((id *)&v4->_height, self->_height);
  objc_storeStrong((id *)&v4->_weight, self->_weight);
  v4->_biologicalSex = self->_biologicalSex;
  v4->_wheelchairUse = self->_wheelchairUse;
  v5 = -[NSMutableDictionary mutableCopy](self->_dirtyPropertiesMap, "mutableCopy");
  dirtyPropertiesMap = v4->_dirtyPropertiesMap;
  v4->_dirtyPropertiesMap = (NSMutableDictionary *)v5;

  v7 = _Block_copy(self->_updateHandler);
  updateHandler = v4->_updateHandler;
  v4->_updateHandler = v7;

  return v4;
}

- (NSDate)dateOfBirth
{
  return self->_dateOfBirth;
}

- (HKQuantity)height
{
  return self->_height;
}

- (HKQuantity)weight
{
  return self->_weight;
}

- (int64_t)biologicalSex
{
  return self->_biologicalSex;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_weight, 0);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_dirtyPropertiesMap, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_commitValue:forPropertyKey:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21168F000, v0, v1, "[HealthSettings] Failed to store characteristic %@ with error %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_logAndNilError:(uint64_t)a1 operationDescription:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21168F000, a2, OS_LOG_TYPE_ERROR, "[HealthSettings] Internal error: no error argument passed for operation %{public}@, assuming the worst", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)_logAndNilError:operationDescription:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21168F000, v0, v1, "[HealthSettings] Failed operation: %{public}@ with error %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)leanBodyMass
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21168F000, log, OS_LOG_TYPE_ERROR, "[HealthSettings] Fetching lean body mass timed out", v1, 2u);
}

@end
