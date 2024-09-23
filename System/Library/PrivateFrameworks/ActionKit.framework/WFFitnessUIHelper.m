@implementation WFFitnessUIHelper

+ (id)allActivityTypes
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  id result;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v2 = +[WFFitnessUIHelper isWheelchairUser](WFFitnessUIHelper, "isWheelchairUser");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = getFIUIDeviceSupportsSwimmingSymbolLoc_ptr;
  v11 = getFIUIDeviceSupportsSwimmingSymbolLoc_ptr;
  if (!getFIUIDeviceSupportsSwimmingSymbolLoc_ptr)
  {
    v4 = FitnessUILibrary();
    v3 = dlsym(v4, "FIUIDeviceSupportsSwimming");
    v9[3] = (uint64_t)v3;
    getFIUIDeviceSupportsSwimmingSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v8, 8);
  if (v3)
  {
    +[WFFitnessUIHelper allActivityTypesIncludingWheelchairWorkouts:includingSwimmingWorkouts:](WFFitnessUIHelper, "allActivityTypesIncludingWheelchairWorkouts:includingSwimmingWorkouts:", v2, ((uint64_t (*)(void))v3)());
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL WFFIUIDeviceSupportsSwimming(void)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("WFFitnessUIHelper.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

+ (id)allActivityTypesIncludingWheelchairWorkouts:(BOOL)a3 includingSwimmingWorkouts:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[4];

  v4 = a4;
  v5 = a3;
  v20[3] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_opt_new();
  objc_msgSend(getFIUIWorkoutActivityTypeClass(), "optimizedActivityTypesWithIsWheelchairUser:isSwimmingSupported:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getFIUIWorkoutActivityTypeClass(), "nonOptimizedActivityTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc((Class)getFIUIWorkoutActivityTypeClass()), "initWithActivityTypeIdentifier:isIndoor:", 53, 0);
  v20[0] = v9;
  v10 = (void *)objc_msgSend(objc_alloc((Class)getFIUIWorkoutActivityTypeClass()), "initWithActivityTypeIdentifier:isIndoor:", 54, 0);
  v20[1] = v10;
  v11 = (void *)objc_msgSend(objc_alloc((Class)getFIUIWorkoutActivityTypeClass()), "initWithActivityTypeIdentifier:isIndoor:", 55, 0);
  v20[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v8;
  }
  v14 = v13;
  objc_msgSend(v6, "addObjectsFromArray:", v7);
  objc_msgSend(v6, "addObjectsFromArray:", v14);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("localizedName"), 1);
  v19 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)activityTypeForLocalizedActivityName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[WFFitnessUIHelper allActivityTypesIncludingWheelchairWorkouts:includingSwimmingWorkouts:](WFFitnessUIHelper, "allActivityTypesIncludingWheelchairWorkouts:includingSwimmingWorkouts:", 1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(v4, "valueForKey:", CFSTR("localizedName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)isWheelchairUser
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3C40], "wf_shortcutsAppHealthStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "wheelchairUseWithError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = objc_msgSend(v3, "wheelchairUse") == 2;
  }
  else
  {
    getWFGeneralLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "+[WFFitnessUIHelper isWheelchairUser]";
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_ERROR, "%s Failed to fetch wheelchair use: %{public}@", buf, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

+ (void)preferredUnitsForActivityType:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD3C40];
  v8 = a3;
  objc_msgSend(v7, "wf_shortcutsAppHealthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "quantityTypesForActivityType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__WFFitnessUIHelper_preferredUnitsForActivityType_completion___block_invoke;
  v14[3] = &unk_24F8B3910;
  v16 = v6;
  v17 = a1;
  v15 = v10;
  v12 = v6;
  v13 = v10;
  objc_msgSend(v9, "preferredUnitsForQuantityTypes:completion:", v11, v14);

}

+ (id)timeUnits
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD4048], "minuteUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDD4048], "hourUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)quantityTypesForActivityType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id result;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3340]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "identifier") == 13 && (objc_msgSend(v3, "isIndoor") & 1) != 0)
  {
LABEL_9:

    return v5;
  }
  v6 = objc_msgSend(v3, "identifier");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v7 = (void (*)(uint64_t))get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_ptr;
  v16 = get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_ptr;
  if (!get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_ptr)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_block_invoke;
    v12[3] = &unk_24F8BB430;
    v12[4] = &v13;
    __get_HKWorkoutDistanceTypeForActivityTypeSymbolLoc_block_invoke(v12);
    v7 = (void (*)(uint64_t))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (v7)
  {
    v7(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v5, "addObject:", v8);

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "HKQuantityType *WFHKWorkoutDistanceTypeForActivityType(HKWorkoutActivityType)");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("WFFitnessUIHelper.m"), 22, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

void __62__WFFitnessUIHelper_preferredUnitsForActivityType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[WFFitnessUIHelper preferredUnitsForActivityType:completion:]_block_invoke";
      v24 = 2114;
      v25 = v6;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_ERROR, "%s Failed to fetch preferred units for quantity types: %{public}@", buf, 0x16u);
    }

  }
  v8 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(*(id *)(a1 + 48), "timeUnits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = *(id *)(a1 + 32);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
