@implementation NSDictionary(DMLastMigrationResults)

+ (id)dmlmr_lastMigrationResultsWithSuccess:()DMLastMigrationResults buildVersion:
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
  objc_msgSend(a1, "dmlmr_buildVersionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v13[0] = v6;
  objc_msgSend(a1, "dmlmr_successKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)dmlmr_success
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D80], "dmlmr_successKey");
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

- (id)dmlmr_buildVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D80], "dmlmr_buildVersionKey");
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

+ (const)dmlmr_successKey
{
  return CFSTR("success");
}

+ (const)dmlmr_buildVersionKey
{
  return CFSTR("buildVersion");
}

@end
