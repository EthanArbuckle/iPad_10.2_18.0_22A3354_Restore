@implementation CKFetchRecordZoneChangesConfiguration

- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
  objc_setProperty_atomic_copy(self, a2, previousServerChangeToken, 24);
}

- (NSUInteger)resultsLimit
{
  return self->_resultsLimit;
}

- (CKServerChangeToken)previousServerChangeToken
{
  return (CKServerChangeToken *)objc_getProperty(self, a2, 24, 1);
}

- (CKFetchRecordZoneChangesConfiguration)init
{
  CKFetchRecordZoneChangesConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordZoneChangesConfiguration;
  result = -[CKFetchRecordZoneChangesConfiguration init](&v3, sel_init);
  if (result)
    result->_fetchChangesMadeByThisDevice = 1;
  return result;
}

- (CKFetchRecordZoneChangesConfiguration)initWithCoder:(id)a3
{
  id v4;
  CKFetchRecordZoneChangesConfiguration *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CKServerChangeToken *previousServerChangeToken;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSArray *desiredKeys;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CKFetchRecordZoneChangesConfiguration;
  v5 = -[CKFetchRecordZoneChangesConfiguration init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("previousServerChangeToken"));
    v9 = objc_claimAutoreleasedReturnValue();
    previousServerChangeToken = v5->_previousServerChangeToken;
    v5->_previousServerChangeToken = (CKServerChangeToken *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend_setWithObjects_(v11, v14, v12, v15, v13, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v17, (uint64_t)v16, (uint64_t)CFSTR("desiredKeys"));
    v18 = objc_claimAutoreleasedReturnValue();
    desiredKeys = v5->_desiredKeys;
    v5->_desiredKeys = (NSArray *)v18;

    v5->_resultsLimit = objc_msgSend_decodeIntegerForKey_(v4, v20, (uint64_t)CFSTR("resultsLimit"), v21);
    v5->_fetchNewestChangesFirst = objc_msgSend_decodeBoolForKey_(v4, v22, (uint64_t)CFSTR("newestFirst"), v23);
    v5->_fetchChangesMadeByThisDevice = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)CFSTR("fetchChangesMadeByThisDevice"), v25);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (BOOL)fetchNewestChangesFirst
{
  return self->_fetchNewestChangesFirst;
}

- (BOOL)fetchChangesMadeByThisDevice
{
  return self->_fetchChangesMadeByThisDevice;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t NewestChangesFirst;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t ChangesMadeByThisDevice;
  const char *v29;
  id v30;

  v30 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v30, v9, (uint64_t)v8, (uint64_t)CFSTR("previousServerChangeToken"));

  objc_msgSend_desiredKeys(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v30, v14, (uint64_t)v13, (uint64_t)CFSTR("desiredKeys"));

  v18 = objc_msgSend_resultsLimit(self, v15, v16, v17);
  objc_msgSend_encodeInteger_forKey_(v30, v19, v18, (uint64_t)CFSTR("resultsLimit"));
  NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(self, v20, v21, v22);
  objc_msgSend_encodeBool_forKey_(v30, v24, NewestChangesFirst, (uint64_t)CFSTR("newestFirst"));
  ChangesMadeByThisDevice = objc_msgSend_fetchChangesMadeByThisDevice(self, v25, v26, v27);
  objc_msgSend_encodeBool_forKey_(v30, v29, ChangesMadeByThisDevice, (uint64_t)CFSTR("fetchChangesMadeByThisDevice"));
  objc_autoreleasePoolPop(v4);

}

- (NSArray)desiredKeys
{
  CKFetchRecordZoneChangesConfiguration *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_desiredKeys;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

- (id)description
{
  return (id)((uint64_t (*)(CKFetchRecordZoneChangesConfiguration *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  const char *v9;
  uint64_t v10;
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
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;

  v5 = a4;
  v6 = a3;
  objc_msgSend_desiredKeys(self, a2, a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E0C99E08], v9, 5, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend_previousServerChangeToken(self, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v16, (uint64_t)CFSTR("previousChangeToken"), (uint64_t)v15);

    if (objc_msgSend_count(v8, v17, v18, v19))
      objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v11, (uint64_t)CFSTR("desiredKeys"), (uint64_t)v8);
  }
  if (v6)
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v21 = objc_msgSend_resultsLimit(self, v11, v12, v13);
    objc_msgSend_numberWithUnsignedInteger_(v20, v22, v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v25, (uint64_t)CFSTR("resultsLimit"), (uint64_t)v24);

    if (v8)
    {
      if (!objc_msgSend_count(v8, v26, v27, v28))
        objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v29, (uint64_t)CFSTR("desiredKeys"), (uint64_t)CFSTR("[system fields only]"));
    }
    else
    {
      objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v26, (uint64_t)CFSTR("desiredKeys"), (uint64_t)CFSTR("[all keys]"));
    }
    if (objc_msgSend_fetchNewestChangesFirst(self, v29, v30, v31))
      objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v32, (uint64_t)CFSTR("fetchNewestChangesFirst"), (uint64_t)CFSTR("true"));
    if (objc_msgSend_fetchChangesMadeByThisDevice(self, v32, v33, v34))
      objc_msgSend_CKAddPropertySafelyForKey_value_(v14, v35, (uint64_t)CFSTR("fetchChangesMadeByThisDevice"), (uint64_t)CFSTR("true"));
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKFetchRecordZoneChangesConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CKServerChangeToken *previousServerChangeToken;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *desiredKeys;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = objc_alloc_init(CKFetchRecordZoneChangesConfiguration);
  objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_copy(v8, v9, v10, v11);
  previousServerChangeToken = v4->_previousServerChangeToken;
  v4->_previousServerChangeToken = (CKServerChangeToken *)v12;

  v4->_resultsLimit = objc_msgSend_resultsLimit(self, v14, v15, v16);
  objc_msgSend_desiredKeys(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v20, v21, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  desiredKeys = v4->_desiredKeys;
  v4->_desiredKeys = (NSArray *)v24;

  v4->_fetchNewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(self, v26, v27, v28);
  v4->_fetchChangesMadeByThisDevice = objc_msgSend_fetchChangesMadeByThisDevice(self, v29, v30, v31);
  return v4;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
  CKFetchRecordZoneChangesConfiguration *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;

  v10 = desiredKeys;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v4->_desiredKeys;
  v4->_desiredKeys = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (void)setResultsLimit:(NSUInteger)resultsLimit
{
  self->_resultsLimit = resultsLimit;
}

- (void)setFetchNewestChangesFirst:(BOOL)a3
{
  self->_fetchNewestChangesFirst = a3;
}

- (void)setFetchChangesMadeByThisDevice:(BOOL)a3
{
  self->_fetchChangesMadeByThisDevice = a3;
}

@end
