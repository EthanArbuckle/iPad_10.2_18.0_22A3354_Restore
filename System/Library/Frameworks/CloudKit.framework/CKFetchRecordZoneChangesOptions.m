@implementation CKFetchRecordZoneChangesOptions

- (CKFetchRecordZoneChangesOptions)init
{
  CKFetchRecordZoneChangesOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKFetchRecordZoneChangesOptions;
  result = -[CKFetchRecordZoneChangesOptions init](&v3, sel_init);
  if (result)
    result->_fetchChangesMadeByThisDevice = 1;
  return result;
}

- (CKFetchRecordZoneChangesOptions)initWithZoneConfiguration:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CKFetchRecordZoneChangesOptions *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t NewestChangesFirst;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ChangesMadeByThisDevice;
  const char *v37;
  uint64_t v38;

  v4 = a3;
  v11 = (CKFetchRecordZoneChangesOptions *)objc_msgSend_init(self, v5, v6, v7);
  if (v11)
  {
    objc_msgSend_previousServerChangeToken(v4, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPreviousServerChangeToken_(v11, v13, (uint64_t)v12, v14);

    v18 = objc_msgSend_resultsLimit(v4, v15, v16, v17);
    objc_msgSend_setResultsLimit_(v11, v19, v18, v20);
    objc_msgSend_desiredKeys(v4, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDesiredKeys_(v11, v25, (uint64_t)v24, v26);

    NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(v4, v27, v28, v29);
    objc_msgSend_setFetchNewestChangesFirst_(v11, v31, NewestChangesFirst, v32);
    ChangesMadeByThisDevice = objc_msgSend_fetchChangesMadeByThisDevice(v4, v33, v34, v35);
    objc_msgSend_setFetchChangesMadeByThisDevice_(v11, v37, ChangesMadeByThisDevice, v38);
  }

  return v11;
}

- (id)zoneConfiguration
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t NewestChangesFirst;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t ChangesMadeByThisDevice;
  const char *v32;
  uint64_t v33;

  v3 = (void *)objc_opt_new();
  objc_msgSend_previousServerChangeToken(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreviousServerChangeToken_(v3, v8, (uint64_t)v7, v9);

  v13 = objc_msgSend_resultsLimit(self, v10, v11, v12);
  objc_msgSend_setResultsLimit_(v3, v14, v13, v15);
  objc_msgSend_desiredKeys(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesiredKeys_(v3, v20, (uint64_t)v19, v21);

  NewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(self, v22, v23, v24);
  objc_msgSend_setFetchNewestChangesFirst_(v3, v26, NewestChangesFirst, v27);
  ChangesMadeByThisDevice = objc_msgSend_fetchChangesMadeByThisDevice(self, v28, v29, v30);
  objc_msgSend_setFetchChangesMadeByThisDevice_(v3, v32, ChangesMadeByThisDevice, v33);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKFetchRecordZoneChangesOptions *v4;
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

  v4 = objc_alloc_init(CKFetchRecordZoneChangesOptions);
  objc_msgSend_previousServerChangeToken(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_copy(v8, v9, v10, v11);
  previousServerChangeToken = v4->_previousServerChangeToken;
  v4->_previousServerChangeToken = (CKServerChangeToken *)v12;

  v4->_resultsLimit = objc_msgSend_resultsLimit(self, v14, v15, v16);
  objc_msgSend_desiredKeys(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_copy(v20, v21, v22, v23);
  desiredKeys = v4->_desiredKeys;
  v4->_desiredKeys = (NSArray *)v24;

  v4->_fetchNewestChangesFirst = objc_msgSend_fetchNewestChangesFirst(self, v26, v27, v28);
  v4->_fetchChangesMadeByThisDevice = objc_msgSend_fetchChangesMadeByThisDevice(self, v29, v30, v31);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (CKFetchRecordZoneChangesOptions)initWithCoder:(id)a3
{
  id v4;
  CKFetchRecordZoneChangesOptions *v5;
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
  v27.super_class = (Class)CKFetchRecordZoneChangesOptions;
  v5 = -[CKFetchRecordZoneChangesOptions init](&v27, sel_init);
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

- (CKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(CKServerChangeToken *)previousServerChangeToken
{
  objc_setProperty_nonatomic_copy(self, a2, previousServerChangeToken, 16);
}

- (NSUInteger)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(NSUInteger)resultsLimit
{
  self->_resultsLimit = resultsLimit;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
  objc_setProperty_nonatomic_copy(self, a2, desiredKeys, 32);
}

- (BOOL)fetchNewestChangesFirst
{
  return self->_fetchNewestChangesFirst;
}

- (void)setFetchNewestChangesFirst:(BOOL)a3
{
  self->_fetchNewestChangesFirst = a3;
}

- (BOOL)fetchChangesMadeByThisDevice
{
  return self->_fetchChangesMadeByThisDevice;
}

- (void)setFetchChangesMadeByThisDevice:(BOOL)a3
{
  self->_fetchChangesMadeByThisDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

@end
