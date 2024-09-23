@implementation FIStandardFitnessDefaultActivityTypes

void __FIStandardFitnessDefaultActivityTypes_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 52, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 52, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 37, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 37, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v6);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 13, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v8);

  if (*(_BYTE *)(a1 + 32))
  {
    +[FIWorkoutActivityType swimmingOptimizedActivityTypes](FIWorkoutActivityType, "swimmingOptimizedActivityTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v9);

  }
  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 82, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v10);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 24, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v11);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 16, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v12);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 44, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v13);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 35, _os_feature_enabled_impl());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v14);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 63, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v15);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 65, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v16);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 20, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v17);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 59, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v18);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 57, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v19);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 66, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v20);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 77, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v21);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 72, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v22);

  +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:](FIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:", 80, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v23);

  v24 = (void *)FIStandardFitnessDefaultActivityTypes_activityTypes;
  FIStandardFitnessDefaultActivityTypes_activityTypes = (uint64_t)v2;
  v25 = v2;

  +[FIWorkoutActivityType wheelchairActivityTypes](FIWorkoutActivityType, "wheelchairActivityTypes");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "arrayByAddingObjectsFromArray:", FIStandardFitnessDefaultActivityTypes_activityTypes);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)FIStandardFitnessDefaultActivityTypes_wheelchairActivityTypes;
  FIStandardFitnessDefaultActivityTypes_wheelchairActivityTypes = v26;

}

@end
