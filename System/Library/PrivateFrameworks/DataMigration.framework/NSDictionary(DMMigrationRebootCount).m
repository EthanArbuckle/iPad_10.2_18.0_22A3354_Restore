@implementation NSDictionary(DMMigrationRebootCount)

+ (id)dm_migrationRebootCountPrefWithRebootCount:()DMMigrationRebootCount buildVersion:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "dm_migrationRebootCountPref_buildVersionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v13[0] = v6;
  objc_msgSend(a1, "dm_migrationRebootCountPref_rebootCountKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)dm_migrationRebootCountPref_rebootCount
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dm_migrationRebootCountPref_rebootCountKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v3)
      return 0;
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)dm_migrationRebootCountPref_buildVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D80], "dm_migrationRebootCountPref_buildVersionKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

+ (const)dm_migrationRebootCountPref_rebootCountKey
{
  return CFSTR("rebootCount");
}

+ (const)dm_migrationRebootCountPref_buildVersionKey
{
  return CFSTR("buildVersion");
}

@end
