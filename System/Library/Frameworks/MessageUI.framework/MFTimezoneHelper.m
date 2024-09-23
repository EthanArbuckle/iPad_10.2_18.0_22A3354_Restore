@implementation MFTimezoneHelper

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__MFTimezoneHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_12 != -1)
    dispatch_once(&log_onceToken_12, block);
  return (id)log_log_12;
}

void __23__MFTimezoneHelper_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_12;
  log_log_12 = (uint64_t)v1;

}

+ (id)cityForTimeZone:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  MFCity *v6;
  void *v7;
  void *v8;
  MFCity *v9;
  NSObject *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultCityForTimeZone:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [MFCity alloc];
    objc_msgSend(v5, "displayNameIncludingCountry:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayNameIncludingCountry:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MFCity initWithCityName:displayName:timeZone:](v6, "initWithCityName:displayName:timeZone:", v7, v8, v3);

  }
  else
  {
    +[MFTimezoneHelper log](MFTimezoneHelper, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MFTimezoneHelper cityForTimeZone:].cold.1((uint64_t)v3, v10);

    v9 = 0;
  }

  return v9;
}

+ (id)citiesMatchingName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "citiesMatchingName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_map:", &__block_literal_global_36);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v6);
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

MFCity *__39__MFTimezoneHelper_citiesMatchingName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MFCity *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  MFCity *v9;

  v2 = a2;
  v3 = [MFCity alloc];
  objc_msgSend(v2, "displayNameIncludingCountry:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayNameIncludingCountry:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E80]);
  objc_msgSend(v2, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:", v7);
  v9 = -[MFCity initWithCityName:displayName:timeZone:](v3, "initWithCityName:displayName:timeZone:", v4, v5, v8);

  return v9;
}

uint64_t __39__MFTimezoneHelper_citiesMatchingName___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);

  return v7;
}

+ (void)cityForTimeZone:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1AB96A000, a2, OS_LOG_TYPE_ERROR, "The city for a time zone (%{public}@) does not exist.", (uint8_t *)&v2, 0xCu);
}

@end
