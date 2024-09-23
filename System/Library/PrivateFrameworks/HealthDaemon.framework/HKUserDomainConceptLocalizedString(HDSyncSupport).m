@implementation HKUserDomainConceptLocalizedString(HDSyncSupport)

- (HDCodableUserDomainConceptLocalizedStringProperty)codableRepresentationForSync
{
  HDCodableUserDomainConceptLocalizedStringProperty *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(HDCodableUserDomainConceptLocalizedStringProperty);
  -[HDCodableUserDomainConceptLocalizedStringProperty setType:](v2, "setType:", objc_msgSend(a1, "type"));
  -[HDCodableUserDomainConceptLocalizedStringProperty setVersion:](v2, "setVersion:", objc_msgSend(a1, "version"));
  objc_msgSend(a1, "timestamp");
  -[HDCodableUserDomainConceptLocalizedStringProperty setTimestamp:](v2, "setTimestamp:");
  objc_msgSend(a1, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConceptLocalizedStringProperty setStringValue:](v2, "setStringValue:", v3);

  objc_msgSend(a1, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConceptLocalizedStringProperty setLocale:](v2, "setLocale:", v4);

  -[HDCodableUserDomainConceptLocalizedStringProperty setDeleted:](v2, "setDeleted:", objc_msgSend(a1, "isDeleted"));
  return v2;
}

+ (id)createWithCodable:()HDSyncSupport
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = objc_msgSend(v3, "type");
    v5 = objc_msgSend(v3, "version");
    objc_msgSend(v3, "timestamp");
    v7 = v6;
    objc_msgSend(v3, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "deleted");
    if (v8 && v9)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D08]), "initWithType:stringValue:locale:version:timestamp:deleted:", v4, v8, v9, v5, v10, v7);
    }
    else
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

      if (v13)
      {
        HKLogHealthOntology();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v16 = 138543874;
          v17 = objc_opt_class();
          v18 = 2114;
          v19 = v8;
          v20 = 2114;
          v21 = v9;
          _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_INFO, "Decoded invalid %{public}@ with stringValue = %{public}@, locale = %{public}@", (uint8_t *)&v16, 0x20u);
        }

      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
