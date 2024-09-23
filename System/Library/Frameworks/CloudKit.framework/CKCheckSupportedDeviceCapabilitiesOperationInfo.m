@implementation CKCheckSupportedDeviceCapabilitiesOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  objc_super v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v21.receiver = self;
  v21.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v21, sel_encodeWithCoder_, v4);
  objc_msgSend_zoneIDs(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, (uint64_t)CFSTR("recordZoneIDs"));

  objc_msgSend_desiredCapabilitySets(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("desiredCapabilitySets"));

  objc_msgSend_options(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, (uint64_t)CFSTR("options"));

  objc_autoreleasePoolPop(v5);
}

- (CKCheckSupportedDeviceCapabilitiesOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKCheckSupportedDeviceCapabilitiesOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  NSArray *zoneIDs;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSArray *desiredCapabilitySets;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  CKDeviceCapabilityCheckOptions *options;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v32, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("recordZoneIDs"));
    v14 = objc_claimAutoreleasedReturnValue();
    zoneIDs = v5->_zoneIDs;
    v5->_zoneIDs = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v21, v17, v22, v18, v19, v20, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("desiredCapabilitySets"));
    v25 = objc_claimAutoreleasedReturnValue();
    desiredCapabilitySets = v5->_desiredCapabilitySets;
    v5->_desiredCapabilitySets = (NSArray *)v25;

    v27 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, (uint64_t)CFSTR("options"));
    v29 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (CKDeviceCapabilityCheckOptions *)v29;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (void)setZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_zoneIDs, a3);
}

- (NSArray)desiredCapabilitySets
{
  return self->_desiredCapabilitySets;
}

- (void)setDesiredCapabilitySets:(id)a3
{
  objc_storeStrong((id *)&self->_desiredCapabilitySets, a3);
}

- (CKDeviceCapabilityCheckOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_desiredCapabilitySets, 0);
  objc_storeStrong((id *)&self->_zoneIDs, 0);
}

@end
