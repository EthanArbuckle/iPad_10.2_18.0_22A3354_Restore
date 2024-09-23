@implementation HDProtectedKeyValueEntity

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)userCharacteristicForType:(id)a3 profile:(id)a4 entity:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  +[HDProtectedKeyValueEntity _keyForDataType:error:]((uint64_t)a1, v10, (uint64_t)a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_16:
    v16 = 0;
    goto LABEL_17;
  }
  v13 = objc_msgSend(v10, "code");
  if (v13 > 174)
  {
    if ((unint64_t)(v13 - 175) < 2)
      goto LABEL_13;
    if (v13 != 218 && v13 != 177)
    {
LABEL_14:
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      {
        v20 = v18;
        *(_DWORD *)buf = 134217984;
        v22 = objc_msgSend(v10, "code");
        _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Unexpected characteristic type %ld", buf, 0xCu);

      }
      goto LABEL_16;
    }
LABEL_11:
    objc_msgSend(a1, "numberForKey:domain:category:profile:entity:error:", v12, &stru_1E6D11BB8, 101, v11, a5, a6);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v14 = v13 - 64;
  if ((unint64_t)(v13 - 64) > 0x27)
    goto LABEL_14;
  if (((1 << v14) & 0x8001000005) != 0)
    goto LABEL_11;
  if (((1 << v14) & 0x700000) != 0)
  {
LABEL_13:
    objc_msgSend(v10, "_canoncialUnit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "quantityForKey:unit:domain:category:profile:entity:error:", v12, v17, &stru_1E6D11BB8, 101, v11, a5, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (v13 != 65)
    goto LABEL_14;
  objc_msgSend(a1, "dateComponentsForKey:domain:category:profile:entity:error:", v12, &stru_1E6D11BB8, 101, v11, a5, a6);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v16 = (void *)v15;
LABEL_17:

  return v16;
}

+ (int64_t)_deviceLocalCategory
{
  return 100;
}

+ (const)_keyForDataType:(uint64_t)a3 error:
{
  id v4;
  uint64_t v5;
  const __CFString *v6;

  v4 = a2;
  objc_opt_self();
  v5 = objc_msgSend(v4, "code");
  if (v5 > 102)
  {
    if (v5 <= 175)
    {
      if (v5 == 103)
      {
        v6 = CFSTR("wheelchair_use");
        goto LABEL_26;
      }
      if (v5 == 175)
      {
        v6 = CFSTR("user_entered_menstrual_cycle_length");
        goto LABEL_26;
      }
    }
    else
    {
      switch(v5)
      {
        case 176:
          v6 = CFSTR("user_entered_period_cycle_length");
          goto LABEL_26;
        case 177:
          v6 = CFSTR("activity_move_mode");
          goto LABEL_26;
        case 218:
          v6 = CFSTR("cardio_fitness_medications_use");
          goto LABEL_26;
      }
    }
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Invalid characteristic type %@"), v4);
    v6 = 0;
    goto LABEL_26;
  }
  if (v5 <= 83)
  {
    switch(v5)
    {
      case '@':
        v6 = CFSTR("sex");
        goto LABEL_26;
      case 'A':
        v6 = CFSTR("birthdate");
        goto LABEL_26;
      case 'B':
        v6 = CFSTR("blood_type");
        goto LABEL_26;
    }
    goto LABEL_25;
  }
  switch(v5)
  {
    case 'T':
      v6 = CFSTR("body_mass");
      break;
    case 'U':
      v6 = CFSTR("lean_body_mass");
      break;
    case 'V':
      v6 = CFSTR("height");
      break;
    case 'X':
      v6 = CFSTR("fitzpatrick_skin_type");
      break;
    default:
      goto LABEL_25;
  }
LABEL_26:

  return v6;
}

+ (id)modificationDateForCharacteristicWithType:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  +[HDProtectedKeyValueEntity _keyForDataType:error:]((uint64_t)a1, a3, (uint64_t)a5);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "modificationDatesForKeys:domain:category:profile:error:", v11, &stru_1E6D11BB8, 101, v8, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)setUserCharacteristic:(id)a3 forType:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(v11, "_validateCharacteristic:error:", v10, a6) & 1) != 0)
  {
    +[HDProtectedKeyValueEntity _keyForDataType:error:]((uint64_t)a1, v11, (uint64_t)a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
LABEL_20:
      v18 = 0;
      goto LABEL_21;
    }
    v14 = objc_msgSend(v11, "code");
    if (v14 > 174)
    {
      if ((unint64_t)(v14 - 175) < 2)
        goto LABEL_17;
      if (v14 == 218 || v14 == 177)
      {
LABEL_15:
        v16 = objc_msgSend(a1, "setNumber:forKey:domain:category:profile:error:", v10, v13, &stru_1E6D11BB8, 101, v12, a6);
        goto LABEL_16;
      }
    }
    else
    {
      v15 = v14 - 64;
      if ((unint64_t)(v14 - 64) <= 0x27)
      {
        if (((1 << v15) & 0x8001000005) == 0)
        {
          if (((1 << v15) & 0x700000) == 0)
          {
            if (v14 == 65)
            {
              v16 = objc_msgSend(a1, "setDateComponents:forKey:domain:category:profile:error:", v10, v13, &stru_1E6D11BB8, 101, v12, a6);
LABEL_16:
              v18 = v16;
LABEL_21:

              goto LABEL_22;
            }
            goto LABEL_18;
          }
LABEL_17:
          objc_msgSend(v11, "_canoncialUnit");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(a1, "setQuantity:unit:forKey:domain:category:profile:error:", v10, v19, v13, &stru_1E6D11BB8, 101, v12, a6);

          goto LABEL_21;
        }
        goto LABEL_15;
      }
    }
LABEL_18:
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    {
      v23 = v21;
      *(_DWORD *)buf = 134217984;
      v25 = objc_msgSend(v11, "code");
      _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "Unexpected characteristic type %ld", buf, 0xCu);

    }
    goto LABEL_20;
  }
  _HKInitializeLogging();
  v17 = (void *)*MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
  {
    v20 = v17;
    *(_DWORD *)buf = 134217984;
    v25 = objc_msgSend(v11, "code");
    _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Failed to validate characteristic for type %ld", buf, 0xCu);

  }
  v18 = 0;
LABEL_22:

  return v18;
}

+ (id)keyForUserCharacteristicType:(id)a3
{
  return (id)+[HDProtectedKeyValueEntity _keyForDataType:error:]((uint64_t)a1, a3, 0);
}

+ (id)databaseTable
{
  return CFSTR("key_value_secure");
}

+ (const)_insertStatementKey
{
  return (const char *)&_insertStatementKey_key;
}

@end
