@implementation _HKObjectComparisonFilter

+ (BOOL)isSupportedDevicePropertyKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HKDevicePropertyFirmwareVersion")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HKDevicePropertyHardwareVersion")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HKDevicePropertyLocalIdentifier")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HKDevicePropertyManufacturer")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HKDevicePropertyModel")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HKDevicePropertyName")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("HKDevicePropertySoftwareVersion")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HKDevicePropertyUDIDeviceIdentifier"));
  }

  return v4;
}

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v4;
  char v5;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("correlation")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("device")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("source")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("sourceRevision")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("UUID")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("workout")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("appleWatch")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("association")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("ratingOfExertionAssociation")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("OSBuild")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("contributor")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("creationDate")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("productType")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    if (objc_msgSend(v4, "hk_hasDevicePropertyKeyPathPrefix"))
    {
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("device."), "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(a1, "isSupportedDevicePropertyKey:", v7);
    }
    else
    {
      if (!objc_msgSend(v4, "hk_hasMetadataKeyPathPrefix"))
      {
        v5 = 0;
        goto LABEL_15;
      }
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("metadata."), "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "length") != 0;
    }

  }
LABEL_15:

  return v5;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("correlation")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
LABEL_3:
    objc_msgSend(v6, "setWithObject:", objc_opt_class());
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("device"))
    || objc_msgSend(v5, "isEqualToString:", CFSTR("source"))
    || objc_msgSend(v5, "isEqualToString:", CFSTR("sourceRevision"))
    || objc_msgSend(v5, "isEqualToString:", CFSTR("UUID")))
  {
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v7 = (id)objc_msgSend(v8, "initWithObjects:", v9, v10, objc_opt_class(), 0);
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("workout")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    goto LABEL_3;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("appleWatch")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    goto LABEL_3;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("association")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("ratingOfExertionAssociation")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    goto LABEL_3;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("OSBuild")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("productType")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    goto LABEL_3;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("contributor")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    goto LABEL_3;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("creationDate")))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    goto LABEL_3;
  }
  if (objc_msgSend(v5, "hk_hasDevicePropertyKeyPathPrefix"))
  {
    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v14 = objc_opt_class();
    v7 = (id)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0, v21);
  }
  else
  {
    if (objc_msgSend(v5, "hk_hasMetadataKeyPathPrefix"))
    {
      v15 = objc_alloc(MEMORY[0x1E0C99E60]);
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v18 = (void *)objc_msgSend(v15, "initWithObjects:", v16, v17, objc_opt_class(), 0);
      objc_msgSend(MEMORY[0x1E0C99D80], "hk_acceptedPublicMetadataValueClasses");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setByAddingObjectsFromSet:", v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKObjectComparisonFilter.m"), 222, CFSTR("Unreachable code has been executed"));

    v7 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }
LABEL_10:
  v11 = v7;
LABEL_11:

  return v11;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5;
  BOOL v6;
  BOOL v7;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("correlation")))
  {
    v6 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("device")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("source")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("sourceRevision")))
  {
    v6 = a3 == 10 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("UUID")))
  {
    v6 = a3 == 4 || a3 == 10;
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("workout")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("association")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("ratingOfExertionAssociation"))
    || objc_msgSend(v5, "isEqualToString:", CFSTR("appleWatch")))
  {
    goto LABEL_21;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("productType")))
  {
    if (a3 != 7)
      goto LABEL_31;
LABEL_29:
    v7 = 1;
    goto LABEL_12;
  }
  if (!objc_msgSend(v5, "hk_hasDevicePropertyKeyPathPrefix"))
  {
    if (objc_msgSend(v5, "hk_hasMetadataKeyPathPrefix"))
    {
      if (a3 == 10)
        goto LABEL_29;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("contributor")))
    {
LABEL_21:
      v6 = a3 == 4;
      goto LABEL_9;
    }
LABEL_31:
    v7 = +[_HKComparisonFilter isAllowedPredicateOperatorType:forKeyPath:](_HKComparisonFilter, "isAllowedPredicateOperatorType:forKeyPath:", a3, v5);
    goto LABEL_12;
  }
  v6 = a3 == 10;
LABEL_9:
  v7 = v6;
LABEL_12:

  return v7;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  char IsValueValidForDevicePropertyKeyPath;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS____HKObjectComparisonFilter;
  if (objc_msgSendSuper2(&v18, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, a6, a7))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("device"))
      || objc_msgSend(v13, "isEqualToString:", CFSTR("source"))
      || objc_msgSend(v13, "isEqualToString:", CFSTR("sourceRevision"))
      || objc_msgSend(v13, "isEqualToString:", CFSTR("UUID")))
    {
      v15 = objc_opt_class();
      IsValueValidForDevicePropertyKeyPath = HKIsValueOrContainerValidForOperatorType(a5, v12, v15, (uint64_t)a7);
    }
    else if (objc_msgSend(v13, "hk_hasDevicePropertyKeyPathPrefix"))
    {
      IsValueValidForDevicePropertyKeyPath = _IsValueValidForDevicePropertyKeyPath(v12, (uint64_t)a7);
    }
    else
    {
      if (!objc_msgSend(v13, "hk_hasMetadataKeyPathPrefix"))
      {
        v14 = 1;
        goto LABEL_10;
      }
      IsValueValidForDevicePropertyKeyPath = _IsMetadataValueValidForOperatorType(a5, v12, (uint64_t)a7);
    }
    v14 = IsValueValidForDevicePropertyKeyPath;
  }
  else
  {
    v14 = 0;
  }
LABEL_10:

  return v14;
}

+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3
{
  return 1;
}

+ (BOOL)allowsEmptyContainerValuesForKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("device")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("source")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("sourceRevision")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("UUID")) & 1) != 0
    || (objc_msgSend(v3, "hk_hasDevicePropertyKeyPathPrefix") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "hk_hasMetadataKeyPathPrefix");
  }

  return v4;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5;
  int64_t v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("correlation")) & 1) != 0)
  {
    v6 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("device")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("source")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("sourceRevision")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UUID")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("workout")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("appleWatch")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("association")) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", CFSTR("ratingOfExertionAssociation")) & 1) != 0)
  {
    v6 = 7;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("OSBuild")) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("contributor")) & 1) != 0)
  {
    v6 = 13;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("creationDate")) & 1) != 0)
  {
    v6 = 10;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("productType")) & 1) != 0)
  {
    v6 = 9;
  }
  else if ((objc_msgSend(v5, "hk_hasDevicePropertyKeyPathPrefix") & 1) != 0)
  {
    v6 = 11;
  }
  else if ((objc_msgSend(v5, "hk_hasMetadataKeyPathPrefix") & 1) != 0)
  {
    v6 = 12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_HKObjectComparisonFilter.m"), 340, CFSTR("Unreachable code has been executed"));

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKObjectComparisonFilter;
    v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS____HKObjectComparisonFilter;
  if (objc_msgSendSuper2(&v14, sel_areValidTypes_forKeyPath_error_, v8, v9, a5))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60___HKObjectComparisonFilter_areValidTypes_forKeyPath_error___block_invoke;
    v12[3] = &unk_1E37F62E0;
    v13 = v9;
    v10 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)configureInMemoryFilter
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_HKObjectComparisonFilter;
  -[_HKComparisonFilter configureInMemoryFilter](&v9, sel_configureInMemoryFilter);
  -[_HKComparisonFilter keyPath](self, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("source"));

  if (v4)
  {
    -[_HKObjectComparisonFilter _configureForKeyPathSource](self, "_configureForKeyPathSource");
  }
  else
  {
    -[_HKComparisonFilter keyPath](self, "keyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hk_hasDevicePropertyKeyPathPrefix");

    if (v6)
    {
      -[_HKObjectComparisonFilter _configureForKeyPathDeviceProperty](self, "_configureForKeyPathDeviceProperty");
    }
    else
    {
      -[_HKComparisonFilter keyPath](self, "keyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hk_hasMetadataKeyPathPrefix");

      if (v8)
        -[_HKObjectComparisonFilter _configureForMetdataKeyPath](self, "_configureForMetdataKeyPath");
    }
  }
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 1;
    switch(-[_HKComparisonFilter keyPathIntegerValue](self, "keyPathIntegerValue"))
    {
      case 0:
      case 5:
      case 7:
      case 8:
        break;
      case 1:
        objc_msgSend(v4, "device");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 2:
        objc_msgSend(v4, "_source");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_HKObjectComparisonFilter _acceptsDataObjectWithSource:](self, "_acceptsDataObjectWithSource:", v8);
        goto LABEL_16;
      case 3:
        objc_msgSend(v4, "sourceRevision");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 4:
        objc_msgSend(v4, "UUID");
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v8 = (void *)v6;
        v9 = -[_HKObjectComparisonFilter _acceptsDataObjectWithValue:](self, "_acceptsDataObjectWithValue:", v6);
        goto LABEL_16;
      case 6:
        objc_msgSend(v4, "_source");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_HKObjectComparisonFilter _acceptsDataObjectWithAppleWatchSource:](self, "_acceptsDataObjectWithAppleWatchSource:", v8);
        goto LABEL_16;
      case 9:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Product type filter does not support acceptsDataObject: and cannot be used in updating queries."));
        goto LABEL_11;
      case 10:
        objc_msgSend(v4, "_creationTimestamp");
        v5 = -[_HKObjectComparisonFilter _acceptsDataObjectWithCreationTime:](self, "_acceptsDataObjectWithCreationTime:");
        break;
      case 11:
        objc_msgSend(v4, "device");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_HKObjectComparisonFilter _acceptsDataObjectComparingDeviceProperty:](self, "_acceptsDataObjectComparingDeviceProperty:", v8);
        goto LABEL_16;
      case 12:
        objc_msgSend(v4, "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_HKObjectComparisonFilter _acceptsDataObjectWithMetadata:](self, "_acceptsDataObjectWithMetadata:", v8);
        goto LABEL_16;
      case 13:
        objc_msgSend(v4, "contributor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_HKObjectComparisonFilter _acceptsDataObjectWithContributor:](self, "_acceptsDataObjectWithContributor:", v8);
LABEL_16:
        v5 = v9;

        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", 1, self, CFSTR("_HKObjectComparisonFilter.m"), 418, CFSTR("Unreachable code has been executed"));

        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    v5 = 0;
  }

  return v5;
}

- (void)_configureForKeyPathSource
{
  unint64_t v3;
  void *v4;
  char v5;
  id v6;

  v3 = -[_HKComparisonFilter operatorType](self, "operatorType");
  -[_HKComparisonFilter value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3 == 10)
    v5 = objc_msgSend(v4, "hk_containsObjectPassingTest:", &__block_literal_global_139);
  else
    v5 = __55___HKObjectComparisonFilter__configureForKeyPathSource__block_invoke((uint64_t)v4, v4);
  self->_compareForLocalDevice = v5;

}

- (void)_configureForKeyPathDeviceProperty
{
  void *v3;
  void *v4;
  const char *v5;
  __CFString *v6;
  NSString *devicePropertyName;
  void *v8;
  void *v9;
  id v10;

  -[_HKComparisonFilter keyPath](self, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("device."), "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v4;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("HKDevicePropertyFirmwareVersion")))
  {
    v5 = sel_firmwareVersion;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("HKDevicePropertyHardwareVersion")))
  {
    v5 = sel_hardwareVersion;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("HKDevicePropertyLocalIdentifier")))
  {
    v5 = sel_localIdentifier;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("HKDevicePropertyManufacturer")))
  {
    v5 = sel_manufacturer;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("HKDevicePropertyModel")))
  {
    v5 = sel_model;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("HKDevicePropertyName")))
  {
    v5 = sel_name;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("HKDevicePropertySoftwareVersion")))
  {
    v5 = sel_softwareVersion;
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("HKDevicePropertyUDIDeviceIdentifier")))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _DevicePropertyNameForDevicePropertyKey(NSString * _Nonnull __strong)");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_HKObjectComparisonFilter.m"), 109, CFSTR("Unreachable code has been executed"));

      v6 = &stru_1E37FD4C0;
      goto LABEL_18;
    }
    v5 = sel_UDIDeviceIdentifier;
  }
  NSStringFromSelector(v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  devicePropertyName = self->_devicePropertyName;
  self->_devicePropertyName = &v6->isa;

}

- (void)_configureForMetdataKeyPath
{
  NSString *v3;
  NSString *metadataKey;
  id v5;

  -[_HKComparisonFilter keyPath](self, "keyPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("metadata."), "length"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  metadataKey = self->_metadataKey;
  self->_metadataKey = v3;

}

- (BOOL)_acceptsDataObjectWithValue:(id)a3
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  if (-[_HKComparisonFilter operatorType](self, "operatorType") == 10)
  {
    -[_HKComparisonFilter value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);
LABEL_5:
    LOBYTE(self) = v7;
    goto LABEL_6;
  }
  if (-[_HKComparisonFilter operatorType](self, "operatorType") == 4)
  {
    -[_HKComparisonFilter value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v5);
    goto LABEL_5;
  }
  if (-[_HKComparisonFilter operatorType](self, "operatorType") == 5)
  {
    -[_HKComparisonFilter value](self, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(self) = objc_msgSend(v6, "isEqual:", v5) ^ 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_HKObjectComparisonFilter.m"), 461, CFSTR("Unreachable code has been executed"));
    LOBYTE(self) = 0;
  }
LABEL_6:

  return (char)self;
}

- (BOOL)_acceptsDataObjectWithSource:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  if (self->_compareForLocalDevice && objc_msgSend(v4, "_isLocalDevice"))
    v6 = -[_HKComparisonFilter operatorType](self, "operatorType") == 4
      || -[_HKComparisonFilter operatorType](self, "operatorType") == 10;
  else
    v6 = -[_HKObjectComparisonFilter _acceptsDataObjectWithValue:](self, "_acceptsDataObjectWithValue:", v5);

  return v6;
}

- (BOOL)_acceptsDataObjectWithAppleWatchSource:(id)a3
{
  char v4;
  void *v5;
  char v6;

  v4 = objc_msgSend(a3, "_isAppleWatch");
  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "BOOLValue") ^ 1;

  return v6;
}

- (BOOL)_acceptsDataObjectWithCreationTime:(double)a3
{
  _HKObjectComparisonFilter *v4;
  void *v5;
  double v6;
  unint64_t v7;

  v4 = self;
  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = HKCompareDoubles(a3, v6);
  LOBYTE(v4) = HKComparisonResultMatchesPredicateOperator(v7, -[_HKComparisonFilter operatorType](v4, "operatorType"));

  return (char)v4;
}

- (BOOL)_acceptsDataObjectComparingDeviceProperty:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(a3, "valueForKeyPath:", self->_devicePropertyName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = objc_msgSend(v5, "containsObject:", v4);
  else
    v7 = objc_msgSend(v5, "count") == 0;

  return v7;
}

- (BOOL)_acceptsDataObjectWithMetadata:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  unint64_t v13;
  _QWORD v15[5];

  objc_msgSend(a3, "objectForKeyedSubscript:", self->_metadataKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_HKComparisonFilter operatorType](self, "operatorType") == 10)
  {
    if (v4)
    {
      -[_HKComparisonFilter value](self, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsObject:", v4);

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    -[_HKComparisonFilter value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

    }
    else if (-[_HKComparisonFilter operatorType](self, "operatorType") == 5)
    {
      v6 = v4 != 0;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "hk_acceptedPublicMetadataValueClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60___HKObjectComparisonFilter__acceptsDataObjectWithMetadata___block_invoke;
    v15[3] = &unk_1E37F4710;
    v15[4] = self;
    objc_msgSend(v8, "hk_anyObjectPassingTest:", v15);

    -[_HKComparisonFilter value](self, "value");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9 && (v10 = (void *)v9, isKindOfClass = objc_opt_isKindOfClass(), v10, (isKindOfClass & 1) == 0))
    {
      v6 = -[_HKComparisonFilter operatorType](self, "operatorType") == 5;
    }
    else
    {
      -[_HKComparisonFilter value](self, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v4, "compare:", v12);

      v6 = HKComparisonResultMatchesPredicateOperator(v13, -[_HKComparisonFilter operatorType](self, "operatorType"));
    }
  }
LABEL_13:

  return v6;
}

- (BOOL)_acceptsDataObjectWithContributor:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  objc_msgSend(a3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKComparisonFilter value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataKey, 0);
  objc_storeStrong((id *)&self->_devicePropertyName, 0);
}

@end
