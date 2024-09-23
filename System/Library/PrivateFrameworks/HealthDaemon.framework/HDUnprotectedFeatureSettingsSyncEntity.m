@implementation HDUnprotectedFeatureSettingsSyncEntity

+ (void)didReceiveValuesForDomainNames:(id)a3 profile:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("HDUnprotectedFeatureSettingsSyncEntityDidSyncNotificationDomainNamesKey");
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("HDUnprotectedFeatureSettingsSyncEntityDidSync"), v6, v9);
}

+ (int64_t)category
{
  return 4;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 60);
}

@end
