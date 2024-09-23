@implementation CKDSaveUserPrivacySettingsURLRequest

- (CKDSaveUserPrivacySettingsURLRequest)initWithOperation:(id)a3
{
  CKDSaveUserPrivacySettingsURLRequest *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDSaveUserPrivacySettingsURLRequest;
  result = -[CKDURLRequest initWithOperation:](&v4, sel_initWithOperation_, a3);
  if (result)
    result->_discoverableTrinary = -1;
  return result;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKDSaveUserPrivacySettingsURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v12, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend_discoverableTrinary(self, v6, v7, v12.receiver, v12.super_class);
  objc_msgSend_numberWithInteger_(v5, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, (uint64_t)v10, CFSTR("discoverable"));

}

- (void)setDiscoverable:(BOOL)a3
{
  uint64_t v4;

  v4 = CKTernaryFromBOOL();
  MEMORY[0x1E0DE7D20](self, sel_setDiscoverableTrinary_, v4);
}

- (int64_t)databaseScope
{
  return 1;
}

- (id)requestOperationClasses
{
  const char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requiresTokenRegistration
{
  return 0;
}

- (id)generateRequestOperations
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_operationType(self, a2, v2);
  objc_msgSend_operationRequestWithType_(self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend_setUserPrivacySettingsUpdateRequest_(v6, v8, (uint64_t)v7);

  v9 = (void *)objc_opt_new();
  objc_msgSend_userPrivacySettingsUpdateRequest(v6, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserPrivacySettings_(v12, v13, (uint64_t)v9);

  if (objc_msgSend_discoverableTrinary(self, v14, v15) != -1)
  {
    objc_msgSend_discoverableTrinary(self, v16, v17);
    v18 = CKBoolFromCKTernary();
    objc_msgSend_userPrivacySettingsUpdateRequest(v6, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_userPrivacySettings(v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDiscoverable_(v24, v25, v18);

  }
  v28[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)v28, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  return 0;
}

- (int64_t)discoverableTrinary
{
  return self->_discoverableTrinary;
}

- (void)setDiscoverableTrinary:(int64_t)a3
{
  self->_discoverableTrinary = a3;
}

@end
