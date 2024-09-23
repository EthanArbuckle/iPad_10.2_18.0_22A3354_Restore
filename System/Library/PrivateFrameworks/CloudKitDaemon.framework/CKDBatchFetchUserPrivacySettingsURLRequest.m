@implementation CKDBatchFetchUserPrivacySettingsURLRequest

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDBatchFetchUserPrivacySettingsURLRequest;
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
  const char *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_operationType(self, a2, v2);
  objc_msgSend_operationRequestWithType_(self, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend_setUserPrivacySettingsBatchLookupRequest_(v6, v8, (uint64_t)v7);

  v12[0] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  _QWORD v12[5];

  objc_msgSend_userPrivacySettingsBatchLookupResponse(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerPrivacySettings(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1BEB65024;
  v12[3] = &unk_1E7834DB8;
  v12[4] = self;
  objc_msgSend_CKCompactMap_(v7, v8, (uint64_t)v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContainerPrivacySettings_(self, v10, (uint64_t)v9);

  return 0;
}

- (NSArray)containerPrivacySettings
{
  return self->_containerPrivacySettings;
}

- (void)setContainerPrivacySettings:(id)a3
{
  objc_storeStrong((id *)&self->_containerPrivacySettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPrivacySettings, 0);
}

@end
