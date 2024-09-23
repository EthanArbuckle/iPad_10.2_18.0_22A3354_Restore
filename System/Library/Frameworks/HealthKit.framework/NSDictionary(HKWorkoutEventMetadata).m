@implementation NSDictionary(HKWorkoutEventMetadata)

- (BOOL)hk_validateMetadataKeysAndValuesForWorkoutEvent:()HKWorkoutEventMetadata applicationSDKVersionToken:error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v9 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__30;
  v23 = __Block_byref_object_dispose__30;
  v24 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __121__NSDictionary_HKWorkoutEventMetadata__hk_validateMetadataKeysAndValuesForWorkoutEvent_applicationSDKVersionToken_error___block_invoke;
  v14[3] = &unk_1E37F0B88;
  v16 = &v19;
  v17 = a2;
  v14[4] = a1;
  v10 = v9;
  v15 = v10;
  v18 = a4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v14);
  v11 = (id)v20[5];
  v12 = v11;
  if (v11)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError(v11);
  }

  _Block_object_dispose(&v19, 8);
  return v12 == 0;
}

- (BOOL)_hk_validateBaseMetadataValueForWorkoutEvent:()HKWorkoutEventMetadata valueContent:key:error:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!objc_msgSend(CFSTR("HKSwimmingStrokeStyle"), "isEqualToString:", v11))
  {
    v13 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_assignError:code:format:", a6, 3, CFSTR("Invalid class %@ for metadata key: %@. Expected %@."), v16, v11, v18);

LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v12 = objc_msgSend(v9, "type");
  if (v12 != 3)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    _HKWorkoutEventTypeName(v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_assignError:code:format:", a6, 3, CFSTR("Invalid metadata key %@ for %@"), CFSTR("HKSwimmingStrokeStyle"), v20);

    goto LABEL_8;
  }
  v13 = +[HKMetadataValidationUtilities hk_validateSwimmingStrokeStyleMetadataValue:error:](HKMetadataValidationUtilities, "hk_validateSwimmingStrokeStyleMetadataValue:error:", v10, a6);
LABEL_9:

  return v13;
}

- (BOOL)_hk_validateYukonMetadataValueForWorkoutEvent:()HKWorkoutEventMetadata valueContent:key:error:
{
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v18;
  id v19;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (_hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error__onceToken != -1)
    dispatch_once(&_hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error__onceToken, &__block_literal_global_71);
  if (+[HKMetadataValidationUtilities hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:](HKMetadataValidationUtilities, "hk_validateMetadataValueClass:forKey:expectedClassLookupTable:error:", v10, v11, _hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error__supportedWorkoutKeyLookupTableYukon, a6))
  {
    v12 = CFSTR("HKElevationAscended");
    if (objc_msgSend(CFSTR("HKElevationAscended"), "isEqualToString:", v11)
      || (v12 = CFSTR("HKElevationDescended"),
          objc_msgSend(CFSTR("HKElevationDescended"), "isEqualToString:", v11)))
    {
      v13 = objc_msgSend(v9, "type");
      v14 = v10;
      if (HKValidateWorkoutEventTypeSegment(v13, v12, a6))
      {
        +[HKUnit meterUnit](HKUnit, "meterUnit");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:value:compatibleUnit:error:](HKMetadataValidationUtilities, "hk_validateQuantityMetadataValue:value:compatibleUnit:error:", v12, v14, v15, a6);

      }
      else
      {
        v16 = 0;
      }

    }
    else if (objc_msgSend(CFSTR("HKAverageSpeed"), "isEqualToString:", v11)
           || objc_msgSend(CFSTR("HKMaximumSpeed"), "isEqualToString:", v11))
    {
      v18 = objc_msgSend(v9, "type");
      v19 = v10;
      if (HKValidateWorkoutEventTypeSegment(v18, CFSTR("HKAverageSpeed"), a6))
      {
        +[HKUnit unitFromString:](HKUnit, "unitFromString:", CFSTR("m/s"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:value:compatibleUnit:error:](HKMetadataValidationUtilities, "hk_validateQuantityMetadataValue:value:compatibleUnit:error:", CFSTR("HKAverageSpeed"), v19, v20, a6);

      }
      else
      {
        v16 = 0;
      }

    }
    else if (objc_msgSend(CFSTR("HKAlpineSlopeGrade"), "isEqualToString:", v11))
    {
      v16 = HKWorkoutEventValidateAlpineSlopeGradeMetadata(objc_msgSend(v9, "type"), v10, a6);
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (uint64_t)_hk_validateMetadataValueForWorkoutEvent:()HKWorkoutEventMetadata valueContent:forKey:applicationSDKVersionToken:error:
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (objc_msgSend(a1, "_hk_validateBaseMetadataValueForWorkoutEvent:valueContent:key:error:", v12, v13, v14, a7))
  {
    if (HKProgramSDKTokenAtLeast(a6, 0x7E40901FFFFFFFFLL))
      v15 = objc_msgSend(a1, "_hk_validateYukonMetadataValueForWorkoutEvent:valueContent:key:error:", v12, v13, v14, a7);
    else
      v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
