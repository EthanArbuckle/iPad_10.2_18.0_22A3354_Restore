@implementation HKWorkout(HKMetadataDetail)

- (id)hk_additionalMetadataSectionsWithHealthStore:()HKMetadataDetail displayTypeController:unitController:subsampleDelegate:
{
  id v8;
  id v9;
  id v10;
  HKDataMetadataWorkoutEventSection *v11;
  HKDataMetadataWorkoutActivitySection *v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HKDataMetadataWorkoutEventSection initWithSample:]([HKDataMetadataWorkoutEventSection alloc], "initWithSample:", a1);
  v12 = -[HKDataMetadataWorkoutActivitySection initWithSample:displayTypeController:unitController:healthStore:]([HKDataMetadataWorkoutActivitySection alloc], "initWithSample:displayTypeController:unitController:healthStore:", a1, v9, v8, v10);

  if ((unint64_t)v11 | (unint64_t)v12)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = v14;
    if (v12)
      objc_msgSend(v14, "addObject:", v12);
    if (v11)
      objc_msgSend(v13, "addObject:", v11);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

@end
