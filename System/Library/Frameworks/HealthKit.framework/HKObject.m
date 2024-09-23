@implementation HKObject

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("Metadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceBundleIdentifier, CFSTR("SourceBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceRevision, CFSTR("SourceRevision"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_device, CFSTR("Device"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("CTS"), self->_creationTimestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_contributor, CFSTR("Contributor"));

}

- (NSDictionary)metadata
{
  return self->_metadata;
}

+ (id)_newDataObjectWithMetadata:(id)a3 device:(id)a4 config:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD *);
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;

  v9 = a4;
  v10 = (void (**)(id, _QWORD *))a5;
  v11 = a3;
  if ((objc_msgSend(a1, "_isConcreteObjectClass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKObject.m"), 103, CFSTR("%@ should not be used for abstract class %@"), v21, v22);

  }
  v12 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v12[1];
  v12[1] = v13;

  v15 = (void *)v12[3];
  v12[3] = v9;
  v16 = v9;

  v17 = objc_msgSend(v11, "copy");
  v18 = (void *)v12[4];
  v12[4] = v17;

  if (v10)
    v10[2](v10, v12);
  objc_msgSend(v12, "_validateForCreation");

  return v12;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKObject;
  result = -[HKObject init](&v3, sel_init);
  if (result)
    *((_QWORD *)result + 7) = 0x10000000000000;
  return result;
}

- (void)_validateForCreation
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_19A0E6000, v3, OS_LOG_TYPE_FAULT, "_validateForCreation encountered an error: %@", (uint8_t *)&v5, 0xCu);

}

- (id)_validateConfiguration
{
  return -[HKObject _validateWithConfiguration:](self, "_validateWithConfiguration:", 0, HKApplicationSDKVersionToken());
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)_setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (HKSourceRevision)sourceRevision
{
  return (HKSourceRevision *)objc_getProperty(self, a2, 16, 1);
}

- (void)_setCreationTimestamp:(double)a3
{
  self->_creationTimestamp = a3;
}

- (void)_setSourceBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)_setSourceRevision:(id)a3
{
  objc_storeStrong((id *)&self->_sourceRevision, a3);
}

- (NSString)_sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (double)_creationTimestamp
{
  return self->_creationTimestamp;
}

- (BOOL)_shouldNotifyOnInsert
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contributor, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_healthd_use_only_dataOriginProvenance, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_sourceRevision, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)_setMetadata:(id)a3
{
  NSDictionary *v4;
  NSDictionary *metadata;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  metadata = self->_metadata;
  self->_metadata = v4;

}

- (void)_setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[3];

  -[HKObject _valueDescription](self, "_valueDescription");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E37FD4C0;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0CB37A0];
  -[HKObject UUID](self, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ %@ "), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKObject sourceRevision](self, "sourceRevision");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NSUUID UUIDString](self->_UUID, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "version");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "productType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "operatingSystemVersion");
    HKNSOperatingSystemVersionString(v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("%@, (%@), \"%@\" (%@)"), v11, v12, v13, v14);

  }
  -[HKObject device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(" \"%@\" "), v17);

  }
  -[HKObject metadata](self, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && objc_msgSend(v18, "count"))
    objc_msgSend(v9, "appendFormat:", CFSTR("metadata: %@"), v19);
  -[HKObject contributor](self, "contributor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "appleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR(", contributor %@"), v22);

  }
  return (NSString *)v9;
}

- (HKDevice)device
{
  return (HKDevice *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)_creationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_creationTimestamp);
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_UUID, "hash");
}

- (id)_source
{
  return -[HKSourceRevision source](self->_sourceRevision, "source");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSUUID *UUID;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    UUID = self->_UUID;
    objc_msgSend(v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSUUID isEqual:](UUID, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HKObject)initWithCoder:(id)a3
{
  id v4;
  HKObject *v5;
  uint64_t v6;
  NSUUID *UUID;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *metadata;
  uint64_t v12;
  NSString *sourceBundleIdentifier;
  uint64_t v14;
  HKSourceRevision *sourceRevision;
  void *v16;
  HKSourceRevision *v17;
  HKSourceRevision *v18;
  uint64_t v19;
  HKDevice *device;
  double v21;
  void *v22;
  double v23;
  uint64_t v24;
  HKContributor *contributor;

  v4 = a3;
  v5 = -[HKObject _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(MEMORY[0x1E0C99D80], "hk_secureCodingClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_replaceKeysFromSharedStringCache");
    v10 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceBundleID"));
    v12 = objc_claimAutoreleasedReturnValue();
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceRevision"));
    v14 = objc_claimAutoreleasedReturnValue();
    sourceRevision = v5->_sourceRevision;
    v5->_sourceRevision = (HKSourceRevision *)v14;

    if (!v5->_sourceRevision)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Source"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = -[HKSourceRevision _initWithSource:]([HKSourceRevision alloc], "_initWithSource:", v16);
        v18 = v5->_sourceRevision;
        v5->_sourceRevision = v17;

      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Device"));
    v19 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (HKDevice *)v19;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("CTS")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("CTS"));
      v5->_creationTimestamp = v21;
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CreationDate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceReferenceDate");
      v5->_creationTimestamp = v23;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Contributor"));
    v24 = objc_claimAutoreleasedReturnValue();
    contributor = v5->_contributor;
    v5->_contributor = (HKContributor *)v24;

  }
  return v5;
}

- (HKObject)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (id)_copyByArchiving
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_isConcreteObjectClass
{
  return 0;
}

- (NSString)attachmentObjectIdentifier
{
  return -[NSUUID UUIDString](self->_UUID, "UUIDString");
}

- (NSString)attachmentSchemaIdentifier
{
  return (NSString *)CFSTR("HKObject");
}

- (BOOL)_validateForSavingWithClientEntitlements:(id)a3 applicationSDKVersionToken:(unint64_t)a4 isAppleWatch:(BOOL)a5 error:(id *)a6
{
  id v7;
  void *v8;

  -[HKObject _validateConfigurationAllowingPrivateMetadata:applicationSDKVersionToken:](self, "_validateConfigurationAllowingPrivateMetadata:applicationSDKVersionToken:", objc_msgSend(a3, "hasPrivateMetadataAccess"), a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError(v7);
  }

  return v8 == 0;
}

- (BOOL)prepareForSaving:(id *)a3
{
  return 1;
}

- (BOOL)prepareForDelivery:(id *)a3
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v3;

  if (self->_UUID)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("%@: UUID must not be nil"), self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_validateConfigurationAllowingPrivateMetadata:(BOOL)a3 applicationSDKVersionToken:(unint64_t)a4
{
  _BOOL8 v5;
  uint64_t v7;
  id v8;
  NSDictionary *metadata;
  id v11;

  v5 = a3;
  if (a3)
    v7 = 8;
  else
    v7 = 0;
  -[HKObject _validateWithConfiguration:](self, "_validateWithConfiguration:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    metadata = self->_metadata;
    v11 = 0;
    -[NSDictionary hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:](metadata, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", v5, a4, &v11);
    v8 = v11;
  }
  return v8;
}

- (id)_valueDescription
{
  return 0;
}

- (int64_t)_externalSyncObjectCode
{
  return -1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_setContributor:(id)a3
{
  objc_storeStrong((id *)&self->_contributor, a3);
}

- (void)_setCreationDate:(id)a3
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  self->_creationTimestamp = v4;
}

- (NSString)_timeZoneName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("HKTimeZone"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("_HKPrivateAutomaticTimeZone"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (HDDataOriginProvenance)healthd_use_only_dataOriginProvenance
{
  return self->_healthd_use_only_dataOriginProvenance;
}

- (void)setHealthd_use_only_dataOriginProvenance:(id)a3
{
  objc_storeStrong((id *)&self->_healthd_use_only_dataOriginProvenance, a3);
}

- (HKContributor)contributor
{
  return self->_contributor;
}

- (int64_t)hk_integerValue
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ is being performed on an HKObject that it is not compatible with. This is probably a mistake.", (uint8_t *)&v7, 0xCu);

  }
  return 0;
}

- (id)asJSONObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("class"));

  -[HKObject UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("UUID"));

  -[HKObject sourceRevision](self, "sourceRevision");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asJSONObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("sourceRevision"));

  -[HKObject metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKObject metadata](self, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __33__HKObject_HK_JSON__asJSONObject__block_invoke;
    v14[3] = &unk_1E37EC520;
    v15 = v10;
    v12 = v10;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("metadata"));
  }
  return v3;
}

void __33__HKObject_HK_JSON__asJSONObject__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "asJSONObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v7;
  if (v7)
    v8 = (id)v7;
  else
    v8 = v5;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);

}

@end
