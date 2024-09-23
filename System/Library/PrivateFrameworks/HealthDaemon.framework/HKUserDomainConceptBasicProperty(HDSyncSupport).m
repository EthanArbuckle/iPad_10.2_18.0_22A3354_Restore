@implementation HKUserDomainConceptBasicProperty(HDSyncSupport)

- (HDCodableUserDomainConceptProperty)codableRepresentationForSync
{
  HDCodableUserDomainConceptProperty *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(HDCodableUserDomainConceptProperty);
  -[HDCodableUserDomainConceptProperty setType:](v2, "setType:", objc_msgSend(a1, "type"));
  -[HDCodableUserDomainConceptProperty setVersion:](v2, "setVersion:", objc_msgSend(a1, "version"));
  objc_msgSend(a1, "timestamp");
  -[HDCodableUserDomainConceptProperty setTimestamp:](v2, "setTimestamp:");
  -[HDCodableUserDomainConceptProperty setValueType:](v2, "setValueType:", objc_msgSend(a1, "valueType"));
  switch(objc_msgSend(a1, "valueType"))
  {
    case 1:
      objc_msgSend(a1, "stringValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableUserDomainConceptProperty setStringValue:](v2, "setStringValue:", v3);
      goto LABEL_10;
    case 2:
      objc_msgSend(a1, "numberValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "doubleValue");
      goto LABEL_7;
    case 3:
      objc_msgSend(a1, "numberValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableUserDomainConceptProperty setIntegerValue:](v2, "setIntegerValue:", objc_msgSend(v3, "integerValue"));
      goto LABEL_10;
    case 4:
      objc_msgSend(a1, "numberValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableUserDomainConceptProperty setBoolValue:](v2, "setBoolValue:", objc_msgSend(v3, "BOOLValue"));
      goto LABEL_10;
    case 5:
      objc_msgSend(a1, "dateValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceReferenceDate");
LABEL_7:
      -[HDCodableUserDomainConceptProperty setDoubleValue:](v2, "setDoubleValue:");
      goto LABEL_10;
    case 6:
      objc_msgSend(a1, "UUIDValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "hk_dataForUUIDBytes");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableUserDomainConceptProperty setDataValue:](v2, "setDataValue:", v4);

      goto LABEL_10;
    case 7:
      objc_msgSend(a1, "dataValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCodableUserDomainConceptProperty setDataValue:](v2, "setDataValue:", v3);
LABEL_10:

      break;
    default:
      return v2;
  }
  return v2;
}

+ (id)createWithCodable:()HDSyncSupport
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = objc_msgSend(v3, "type");
    v5 = objc_msgSend(v3, "version");
    objc_msgSend(v3, "timestamp");
    v7 = v6;
    v8 = objc_msgSend(v3, "valueType");
    switch(v8)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 1:
        objc_msgSend(v3, "stringValue");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 2:
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "doubleValue");
        objc_msgSend(v12, "numberWithDouble:");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "integerValue"));
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 5:
        v13 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v3, "doubleValue");
        objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 6:
        v14 = (void *)MEMORY[0x1E0CB3A28];
        objc_msgSend(v3, "dataValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hk_UUIDWithData:", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          goto LABEL_17;
        goto LABEL_15;
      case 7:
        objc_msgSend(v3, "dataValue");
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v11 = (void *)v9;
        if (!v9)
          goto LABEL_17;
LABEL_15:
        if ((HKIsValidUserDomainConceptPropertyValueType() & 1) != 0)
        {
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:timestamp:valueType:value:", v4, v5, v8, v11, v7);
        }
        else
        {
LABEL_17:
          _HKInitializeLogging();
          HKLogHealthOntology();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

          if (v17)
          {
            HKLogHealthOntology();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = objc_opt_class();
              HKStringFromUserDomainConceptPropertyValueType();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = 138543874;
              v24 = v19;
              v25 = 2114;
              v26 = v20;
              v27 = 2114;
              v28 = (id)objc_opt_class();
              v21 = v28;
              _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "Decoded invalid %{public}@ with valueType = %{public}@, value of class %{public}@", (uint8_t *)&v23, 0x20u);

            }
          }
          v10 = 0;
        }

        break;
      default:
        v11 = 0;
        goto LABEL_17;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
