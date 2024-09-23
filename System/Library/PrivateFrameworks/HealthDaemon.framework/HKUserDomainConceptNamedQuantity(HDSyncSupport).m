@implementation HKUserDomainConceptNamedQuantity(HDSyncSupport)

- (HDCodableUserDomainConceptNamedQuantity)codableRepresentationForSync
{
  HDCodableUserDomainConceptNamedQuantity *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(HDCodableUserDomainConceptNamedQuantity);
  objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConceptNamedQuantity setName:](v2, "setName:", v3);

  objc_msgSend(a1, "quantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_value");
  -[HDCodableUserDomainConceptNamedQuantity setValue:](v2, "setValue:");

  objc_msgSend(a1, "quantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConceptNamedQuantity setUnit:](v2, "setUnit:", v7);

  -[HDCodableUserDomainConceptNamedQuantity setType:](v2, "setType:", objc_msgSend(a1, "type"));
  -[HDCodableUserDomainConceptNamedQuantity setVersion:](v2, "setVersion:", objc_msgSend(a1, "version"));
  objc_msgSend(a1, "timestamp");
  -[HDCodableUserDomainConceptNamedQuantity setTimestamp:](v2, "setTimestamp:");
  -[HDCodableUserDomainConceptNamedQuantity setDeleted:](v2, "setDeleted:", objc_msgSend(a1, "isDeleted"));
  return v2;
}

+ (id)createWithCodable:()HDSyncSupport
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  double v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "value");
    v6 = v5;
    objc_msgSend(v3, "unit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_msgSend(v3, "type");
      v9 = objc_msgSend(v3, "version");
      objc_msgSend(v3, "timestamp");
      v11 = v10;
      v12 = objc_msgSend(v3, "deleted");
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D10]), "initWithName:value:unitString:type:version:timestamp:deleted:", v4, v7, v8, v9, v12, v6, v11);
    }
    else
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

      if (v15)
      {
        HKLogHealthOntology();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v18 = 138543874;
          v19 = objc_opt_class();
          v20 = 2048;
          v21 = v6;
          v22 = 2114;
          v23 = 0;
          _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_INFO, "Decoded invalid %{public}@ with value = %f, unitString = %{public}@", (uint8_t *)&v18, 0x20u);
        }

      }
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
