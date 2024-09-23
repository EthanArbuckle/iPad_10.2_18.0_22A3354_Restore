@implementation CKUploadRequestConfiguration

- (CKUploadRequestConfiguration)initWithSqliteRepresentation:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  CKUploadRequestConfiguration *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *containerIdentifier;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *applicationBundleIdentifierOverride;
  CKRecordZoneID *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  CKRecordZoneID *repairZoneID;
  CKUploadRequestConfiguration *v34;
  NSObject *v35;
  objc_super v37;
  id v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_dataUsingEncoding_(v4, v8, 4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v11, (uint64_t)v10, 0, &v38);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v38;
    if (v13 || !v12)
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v35 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v13;
        _os_log_error_impl(&dword_18A5C5000, v35, OS_LOG_TYPE_ERROR, "Error converting JSON data to CKUploadRequestConfiguration: %@", buf, 0xCu);
      }
      v34 = 0;
    }
    else
    {
      v37.receiver = self;
      v37.super_class = (Class)CKUploadRequestConfiguration;
      v14 = -[CKUploadRequestConfiguration init](&v37, sel_init);
      if (v14)
      {
        NSStringFromSelector(sel_containerIdentifier);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v16, (uint64_t)v15, v17);
        v18 = objc_claimAutoreleasedReturnValue();
        containerIdentifier = v14->_containerIdentifier;
        v14->_containerIdentifier = (NSString *)v18;

        NSStringFromSelector(sel_applicationBundleIdentifierOverride);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v21, (uint64_t)v20, v22);
        v23 = objc_claimAutoreleasedReturnValue();
        applicationBundleIdentifierOverride = v14->_applicationBundleIdentifierOverride;
        v14->_applicationBundleIdentifierOverride = (NSString *)v23;

        v25 = [CKRecordZoneID alloc];
        NSStringFromSelector(sel_repairZoneID);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v12, v27, (uint64_t)v26, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend_initWithSqliteRepresentation_(v25, v30, (uint64_t)v29, v31);
        repairZoneID = v14->_repairZoneID;
        v14->_repairZoneID = (CKRecordZoneID *)v32;

      }
      self = v14;
      v34 = self;
    }

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairZoneID, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)resolvedConfigurationWithBaseContainer:(id)a3 overrides:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;

  v5 = a4;
  v8 = v5;
  if (a3)
  {
    objc_msgSend_configurationFromBaseContainer_(CKUploadRequestConfiguration, v6, (uint64_t)a3, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(v8, v10, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend_setContainerIdentifier_(v9, v13, (uint64_t)v16, v15);
    objc_msgSend_applicationBundleIdentifierOverride(v8, v13, v14, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend_setApplicationBundleIdentifierOverride_(v9, v17, (uint64_t)v20, v19);
    objc_msgSend_repairZoneID(v8, v17, v18, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend_setRepairZoneID_(v9, v21, (uint64_t)v23, v22);

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

+ (id)configurationFromBaseContainer:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v8 = (void *)objc_msgSend_initFromBaseContainer_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (id)initFromBaseContainer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKUploadRequestConfiguration *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSString *containerIdentifier;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSString *applicationBundleIdentifierOverride;
  CKRecordZoneID *v22;
  const char *v23;
  uint64_t v24;
  CKRecordZoneID *repairZoneID;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CKUploadRequestConfiguration;
  v8 = -[CKUploadRequestConfiguration init](&v27, sel_init);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_containerIdentifier(v4, v5, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v9, v11, (uint64_t)CFSTR("com.apple.cloudkit.metadata-%@"), (uint64_t)CFSTR("%@"), 0, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    containerIdentifier = v8->_containerIdentifier;
    v8->_containerIdentifier = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_primaryIdentifier(v4, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v14, v19, (uint64_t)CFSTR("com.apple.upload-request-proxy.%@"), (uint64_t)CFSTR("%@"), 0, v18);
    v20 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverride = v8->_applicationBundleIdentifierOverride;
    v8->_applicationBundleIdentifierOverride = (NSString *)v20;

    v22 = [CKRecordZoneID alloc];
    v24 = objc_msgSend_initWithZoneName_ownerName_(v22, v23, (uint64_t)CFSTR("RepairZone"), (uint64_t)CFSTR("__defaultOwner__"));
    repairZoneID = v8->_repairZoneID;
    v8->_repairZoneID = (CKRecordZoneID *)v24;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKUploadRequestConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *containerIdentifier;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *applicationBundleIdentifierOverride;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CKRecordZoneID *repairZoneID;

  v4 = objc_alloc_init(CKUploadRequestConfiguration);
  objc_msgSend_containerIdentifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_copy(v8, v9, v10, v11);
  containerIdentifier = v4->_containerIdentifier;
  v4->_containerIdentifier = (NSString *)v12;

  objc_msgSend_applicationBundleIdentifierOverride(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_copy(v17, v18, v19, v20);
  applicationBundleIdentifierOverride = v4->_applicationBundleIdentifierOverride;
  v4->_applicationBundleIdentifierOverride = (NSString *)v21;

  objc_msgSend_repairZoneID(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_copy(v26, v27, v28, v29);
  repairZoneID = v4->_repairZoneID;
  v4->_repairZoneID = (CKRecordZoneID *)v30;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  id v23;

  v23 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_containerIdentifier(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v10, (uint64_t)v8, (uint64_t)v9);

  objc_msgSend_applicationBundleIdentifierOverride(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifierOverride);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v16, (uint64_t)v14, (uint64_t)v15);

  objc_msgSend_repairZoneID(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_repairZoneID);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v23, v22, (uint64_t)v20, (uint64_t)v21);

  objc_autoreleasePoolPop(v4);
}

- (CKUploadRequestConfiguration)initWithCoder:(id)a3
{
  id v4;
  CKUploadRequestConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSString *containerIdentifier;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSString *applicationBundleIdentifierOverride;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  CKRecordZoneID *repairZoneID;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKUploadRequestConfiguration;
  v5 = -[CKUploadRequestConfiguration init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    NSStringFromSelector(sel_containerIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    v10 = objc_claimAutoreleasedReturnValue();
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    v12 = objc_opt_class();
    NSStringFromSelector(sel_applicationBundleIdentifierOverride);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverride = v5->_applicationBundleIdentifierOverride;
    v5->_applicationBundleIdentifierOverride = (NSString *)v15;

    v17 = objc_opt_class();
    NSStringFromSelector(sel_repairZoneID);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, (uint64_t)v18);
    v20 = objc_claimAutoreleasedReturnValue();
    repairZoneID = v5->_repairZoneID;
    v5->_repairZoneID = (CKRecordZoneID *)v20;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  objc_msgSend_containerIdentifier(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);

  objc_msgSend_applicationBundleIdentifierOverride(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  CKUploadRequestConfiguration *v4;
  CKUploadRequestConfiguration *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;

  v4 = (CKUploadRequestConfiguration *)a3;
  if (self == v4)
  {
    v32 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_containerIdentifier(v5, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerIdentifier(self, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14
        && (objc_msgSend_applicationBundleIdentifierOverride(v5, v15, v16, v17),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend_applicationBundleIdentifierOverride(self, v19, v20, v21),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = CKObjectsAreBothNilOrEqual(v18, v22),
            v22,
            v18,
            v23))
      {
        objc_msgSend_repairZoneID(v5, v24, v25, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_repairZoneID(self, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }
  }

  return v32;
}

- (id)sqliteRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  const char *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  const char *v31;
  void *v32;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend_containerIdentifier(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v7, (uint64_t)v8);

  objc_msgSend_applicationBundleIdentifierOverride(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_applicationBundleIdentifierOverride);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v13, (uint64_t)v14);

  objc_msgSend_repairZoneID(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sqliteRepresentation(v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_repairZoneID);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v25, (uint64_t)v23, (uint64_t)v24);

  v34 = 0;
  objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E0CB36D8], v26, (uint64_t)v3, 0, &v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v34;
  if (v28)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v29 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v28;
      _os_log_error_impl(&dword_18A5C5000, v29, OS_LOG_TYPE_ERROR, "Error converting CKUploadRequestConfiguration to JSON: %@", buf, 0xCu);
    }
  }
  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
  v32 = (void *)objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v27, 4);

  return v32;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)applicationBundleIdentifierOverride
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplicationBundleIdentifierOverride:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (CKRecordZoneID)repairZoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRepairZoneID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
