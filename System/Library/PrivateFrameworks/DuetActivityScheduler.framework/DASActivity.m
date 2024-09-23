@implementation DASActivity

void __30___DASActivity_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v10, "isEqual:", CFSTR("progress")))
    {
      objc_msgSend(v5, "ns");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v10, "dk_dedup");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    }
    else
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v10, "dk_dedup");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v6);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v10);
  }

}

uint64_t __48___DASActivity_setConstraintsWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t value;
  unint64_t v9;
  double v10;
  void *v12;
  const char *string_ptr;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("MotionState")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setMotionState:", xpc_int64_get_value(v5));
    goto LABEL_19;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("MagneticInterferenceSensitivity")))
    goto LABEL_4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("MinBatteryLevel")))
  {
    value = xpc_int64_get_value(v5);
    if (value <= 0x64)
      v9 = value;
    else
      v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v9);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("MinDataBudgetPercentage")))
  {
    v10 = xpc_double_get_value(v5);
    if (v10 < 0.0 || v10 > 1.0)
      v10 = 0.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("MailFetch"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("BypassBatteryAging"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("UserRequestedBackupActivity")))
  {
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("DataBudgetName")))
  {
    string_ptr = xpc_string_get_string_ptr(v5);
    if (!string_ptr)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string_ptr);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setClientDataBudgetName:", v12);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("BypassPeakPower"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("BeforeApplicationLaunch")))
  {
    goto LABEL_4;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.das.overrideRateLimiting")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", xpc_BOOL_get_value(v5));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 40);
    objc_msgSend(v6, "dk_dedup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v16);

    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("ActivityType")))
  {
    v17 = xpc_string_get_string_ptr(v5);
    if (!v17)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setActivityType:", v12);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Backlogged")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setBacklogged:", xpc_BOOL_get_value(v5));
    goto LABEL_19;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("BlockRebootActivitiesForSU"))
    || objc_msgSend(v6, "isEqualToString:", CFSTR("UseStatisticalModelForTriggersRestart")))
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", xpc_BOOL_get_value(v5));
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v12 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("RemoteDevice")))
  {
    v18 = xpc_string_get_string_ptr(v5);
    if (!v18)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRemoteDevice:", v12);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("RateLimitConfiguration")))
  {
    v19 = xpc_string_get_string_ptr(v5);
    if (!v19)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRateLimitConfigurationName:", v12);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("ServiceName")))
  {
    v20 = xpc_string_get_string_ptr(v5);
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setServiceName:", v12);
      goto LABEL_18;
    }
  }
LABEL_19:

  return 1;
}

void __37___DASActivity_ckPushContentMatches___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;

  v13 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sid"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = *(void **)(a1 + 32);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __37___DASActivity_ckPushContentMatches___block_invoke_2;
        v14[3] = &unk_1E624B8B0;
        v11 = v8;
        v12 = *(_QWORD *)(a1 + 40);
        v15 = v11;
        v16 = v12;
        v17 = a4;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);

      }
    }

    v7 = v13;
  }

}

void __37___DASActivity_ckPushContentMatches___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sid"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sid"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("sid"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
        {
          v14 = 1;
LABEL_8:
          **(_BYTE **)(a1 + 48) = 1;
          *a4 = 1;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v14;
          goto LABEL_9;
        }
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sid"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v14 = 0;
        goto LABEL_8;
      }
    }
LABEL_9:

    v7 = v16;
  }

}

void __28___DASActivity_policyScores__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(a3, "score");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __52___DASActivity_validClassesForUserInfoSerialization__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v15, v14, v13, v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)validClassesForUserInfoSerialization_validClasses;
  validClassesForUserInfoSerialization_validClasses = v10;

}

void __35___DASActivity_sharedDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)sharedDateFormatter_formatter;
  sharedDateFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)sharedDateFormatter_formatter, "setDateStyle:", 1);
  objc_msgSend((id)sharedDateFormatter_formatter, "setTimeStyle:", 2);
  v2 = (void *)sharedDateFormatter_formatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

@end
