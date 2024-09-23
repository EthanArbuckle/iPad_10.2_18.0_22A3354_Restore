@implementation HKSample(HDCodingSupport)

- (HDCodableSample)codableRepresentationForSync
{
  HDCodableSample *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  v2 = objc_alloc_init(HDCodableSample);
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EF217FE0;
  objc_msgSendSuper2(&v8, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSample setObject:](v2, "setObject:", v3);

  objc_msgSend(a1, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSample setDataType:](v2, "setDataType:", objc_msgSend(v4, "code"));

  objc_msgSend(a1, "_startTimestamp");
  if (v5 != 2.22507386e-308)
    -[HDCodableSample setStartDate:](v2, "setStartDate:");
  objc_msgSend(a1, "_endTimestamp");
  if (v6 != 2.22507386e-308)
    -[HDCodableSample setEndDate:](v2, "setEndDate:");
  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;
  _BOOL8 v6;

  v4 = a3;
  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EF2225B8))
  {
    objc_msgSend(a1, "codableRepresentationForSync");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;
    if (v5)
      objc_msgSend(v4, "addBinarySamples:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "dataType");

    if (!_HKValidDataTypeCode())
    {
      v13 = 0;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "dataObjectClass")), "_init");
    if ((objc_msgSend(v8, "conformsToProtocol:", &unk_1EF2225B8) & 1) != 0)
    {
      if (objc_msgSend(v4, "applyToObject:", v8))
      {
        v9 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
        objc_msgSend(v8, "_validateWithConfiguration:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          v12 = 0;
        else
          v12 = v8;
        v13 = v12;

        goto LABEL_14;
      }
    }
    else
    {
      _HKInitializeLogging();
      v14 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v16 = v14;
        v18 = 138412290;
        v19 = (id)objc_opt_class();
        v17 = v19;
        _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Class: %@ must either conform to _HKBinarySample or implement creatWithCodable:", (uint8_t *)&v18, 0xCu);

      }
    }
    v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v13 = 0;
LABEL_16:

  return v13;
}

@end
