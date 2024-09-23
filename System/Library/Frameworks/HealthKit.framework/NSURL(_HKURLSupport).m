@implementation NSURL(_HKURLSupport)

+ (id)_hk_urlForViewHealthRecords
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v0, "setScheme:", CFSTR("x-apple-health"));
  objc_msgSend(v0, "setHost:", CFSTR("ViewHealthRecords"));
  objc_msgSend(v0, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_hk_urlForHealthRecordsProviderSearch
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v0, "setScheme:", CFSTR("x-apple-health"));
  objc_msgSend(v0, "setHost:", CFSTR("ViewHealthRecords"));
  objc_msgSend(v0, "setPath:", CFSTR("/ProviderSearch"));
  objc_msgSend(v0, "URL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_hk_urlForElectrocardiogramType
{
  void *v0;
  void *v1;

  +[HKObjectType electrocardiogramType](HKElectrocardiogramType, "electrocardiogramType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _HKCreateURLForSampleType(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_hk_urlForAtrialFibrillationEventType
{
  void *v0;
  void *v1;

  +[HKObjectType atrialFibrillationEventType](HKObjectType, "atrialFibrillationEventType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _HKCreateURLForSampleType(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_hk_urlForBloodPressureType
{
  void *v0;
  void *v1;

  +[HKObjectType bloodPressureType](HKObjectType, "bloodPressureType");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _HKCreateURLForSampleType(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_hk_urlForHKProfileIdentifier:()_HKURLSupport
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("x-apple-health"));
  objc_msgSend(v5, "setHost:", CFSTR("sharing"));
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_hk_appendQueryParameterToURL:forHKProfileIdentifier:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_hk_appendQueryParameterToURL:()_HKURLSupport forHKProfileIdentifier:
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithURL:resolvingAgainstBaseURL:", v7, 0);

  objc_msgSend(v8, "queryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (!v10)
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("pi"), v16);
    objc_msgSend(v10, "addObject:", v17);
    objc_msgSend(v8, "setQueryItems:", v10);
    objc_msgSend(v8, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v12)
    {
      _HKInitializeLogging();
      v19 = HKLogDefault;
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
        +[NSURL(_HKURLSupport) _hk_appendQueryParameterToURL:forHKProfileIdentifier:].cold.1((uint64_t)v13, v19, v20, v21, v22, v23, v24, v25);
    }
    v18 = 0;
  }

  return v18;
}

- (id)_hk_extractEncodedHKProfileIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  objc_msgSend(v1, "queryItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_firstObjectPassingTest:", &__block_literal_global_81);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByRemovingPercentEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 0);
    if (v6)
    {
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v19);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v19;
      v9 = v8;
      if (v7)
      {
        v10 = v7;
      }
      else if (v8)
      {
        _HKInitializeLogging();
        v11 = HKLogDefault;
        if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR))
          -[NSURL(_HKURLSupport) _hk_extractEncodedHKProfileIdentifier].cold.1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)_hk_appendQueryParameterToURL:()_HKURLSupport forHKProfileIdentifier:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Error decoding profile information from URL: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_hk_extractEncodedHKProfileIdentifier
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "Error decodeding profile information from URL: %{public}@", a5, a6, a7, a8, 2u);
}

@end
