@implementation HDAppleExerciseTimeDataAggregator

- (id)objectType
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A50]);
}

- (Class)sensorDatumClass
{
  return (Class)objc_opt_class();
}

- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDAppleExerciseTimeDataAggregator.m"), 37, CFSTR("Expected a quantity"));

  }
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A50]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "canonicalUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isCompatibleWithUnit:", v10);

  if ((v11 & 1) != 0)
  {
    v38 = v8;
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v14, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dateInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v7;
    objc_msgSend(v7, "dateInterval");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "components:fromDate:toDate:options:", 64, v17, v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v20;
    v21 = objc_msgSend(v20, "minute");
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "quantityWithUnit:doubleValue:", v24, 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 >= 1)
    {
      v26 = 0;
      do
      {
        objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 64, v26, v15, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dateByAddingUnit:value:toDate:options:", 64, ++v26, v15, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:", v9, v25, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v29);

      }
      while (v21 != v26);
    }

    v8 = v38;
    v7 = v39;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v9, "canonicalUnit");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hk_assignError:code:format:", a4, 3, CFSTR("Invalid quantity type %@ (expected compatibility with %@)"), v8, v31);

    _HKInitializeLogging();
    v32 = (void *)*MEMORY[0x1E0CB52A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_ERROR))
    {
      v34 = v32;
      objc_msgSend(v9, "canonicalUnit");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v41 = v8;
      v42 = 2114;
      v43 = v35;
      _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "Rejecting datum of unexpected quantity type %{private}@ (expected compatibility with %{public}@)", buf, 0x16u);

    }
    v22 = 0;
  }

  return v22;
}

@end
