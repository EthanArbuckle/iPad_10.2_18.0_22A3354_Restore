@implementation CKDFetchUserPrivacySettingsURLRequest

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDFetchUserPrivacySettingsURLRequest;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v3, sel_fillOutEquivalencyPropertiesBuilder_, a3);
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

- (id)generateRequestOperations
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_operationType(self, a2, v2);
  objc_msgSend_operationRequestWithType_(self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend_setUserPrivacySettingsRetrieveRequest_(v6, v8, (uint64_t)v7);

  v12[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int hasUserPrivacySettings;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = a3;
  objc_msgSend_setUserPrivacySettings_(self, v5, 0);
  if (objc_msgSend_hasUserPrivacySettingsRetrieveResponse(v4, v6, v7))
  {
    objc_msgSend_userPrivacySettingsRetrieveResponse(v4, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    hasUserPrivacySettings = objc_msgSend_hasUserPrivacySettings(v10, v11, v12);

    if (hasUserPrivacySettings)
    {
      objc_msgSend_userPrivacySettingsRetrieveResponse(v4, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userPrivacySettings(v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUserPrivacySettings_(self, v20, (uint64_t)v19);

    }
  }

  return 0;
}

- (CKDPUserPrivacySettings)userPrivacySettings
{
  return self->_userPrivacySettings;
}

- (void)setUserPrivacySettings:(id)a3
{
  objc_storeStrong((id *)&self->_userPrivacySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPrivacySettings, 0);
}

@end
