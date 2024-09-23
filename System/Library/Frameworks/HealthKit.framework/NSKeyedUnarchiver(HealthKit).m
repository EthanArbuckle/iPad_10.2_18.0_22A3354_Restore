@implementation NSKeyedUnarchiver(HealthKit)

+ (id)hk_unarchivedObjectOfClass:()HealthKit forKey:data:error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v10 = a4;
  v11 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__13;
  v24 = __Block_byref_object_dispose__13;
  v25 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__NSKeyedUnarchiver_HealthKit__hk_unarchivedObjectOfClass_forKey_data_error___block_invoke;
  v16[3] = &unk_1E37EBD90;
  v18 = &v20;
  v19 = a3;
  v12 = v10;
  v17 = v12;
  if (objc_msgSend(a1, "_hk_performUnarchivingWithData:error:handler:", v11, a6, v16))
    v13 = (void *)v21[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v20, 8);
  return v14;
}

+ (id)hk_unarchivedObjectOfClasses:()HealthKit forKey:data:error:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__13;
  v26 = __Block_byref_object_dispose__13;
  v27 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__NSKeyedUnarchiver_HealthKit__hk_unarchivedObjectOfClasses_forKey_data_error___block_invoke;
  v18[3] = &unk_1E37EBDB8;
  v21 = &v22;
  v13 = v10;
  v19 = v13;
  v14 = v11;
  v20 = v14;
  if (objc_msgSend(a1, "_hk_performUnarchivingWithData:error:handler:", v12, a6, v18))
    v15 = (void *)v23[5];
  else
    v15 = 0;
  v16 = v15;

  _Block_object_dispose(&v22, 8);
  return v16;
}

+ (uint64_t)_hk_performUnarchivingWithData:()HealthKit error:handler:
{
  void (**v7)(id, void *);
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0CB3710];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initForReadingFromData:error:", v9, a4);

  if (!v10)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v7[2](v7, v10);
  objc_msgSend(v10, "finishDecoding");
  objc_msgSend(v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "error");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError(v12);
    }

    goto LABEL_9;
  }
  v14 = 1;
LABEL_10:

  return v14;
}

@end
