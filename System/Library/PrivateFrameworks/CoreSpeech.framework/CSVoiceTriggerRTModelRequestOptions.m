@implementation CSVoiceTriggerRTModelRequestOptions

- (CSVoiceTriggerRTModelRequestOptions)initWithMutableBuilder:(id)a3
{
  void (**v4)(id, CSVoiceTriggerRTModelRequestOptionsMutable *);
  CSVoiceTriggerRTModelRequestOptions *v5;
  CSVoiceTriggerRTModelRequestOptionsMutable *v6;
  uint64_t v7;
  NSString *siriLocale;
  uint64_t v9;
  NSUUID *endpointId;
  uint64_t v11;
  NSNumber *engineMajorVersion;
  uint64_t v13;
  NSNumber *engineMinorVersion;
  uint64_t v15;
  NSNumber *accessoryModelType;
  void *v17;
  uint64_t v18;
  CSCoreSpeechServicesAccessoryInfo *accessoryInfo;
  objc_super v21;

  v4 = (void (**)(id, CSVoiceTriggerRTModelRequestOptionsMutable *))a3;
  v21.receiver = self;
  v21.super_class = (Class)CSVoiceTriggerRTModelRequestOptions;
  v5 = -[CSVoiceTriggerRTModelRequestOptions init](&v21, sel_init);
  v6 = objc_alloc_init(CSVoiceTriggerRTModelRequestOptionsMutable);
  if (v5)
  {
    if (v4)
      v4[2](v4, v6);
    -[CSVoiceTriggerRTModelRequestOptionsMutable mSiriLocale](v6, "mSiriLocale");
    v7 = objc_claimAutoreleasedReturnValue();
    siriLocale = v5->_siriLocale;
    v5->_siriLocale = (NSString *)v7;

    v5->_allowMph = -[CSVoiceTriggerRTModelRequestOptionsMutable mAllowMph](v6, "mAllowMph");
    v5->_userSelectedPhraseType = (NSNumber *)-[CSVoiceTriggerRTModelRequestOptionsMutable mUserSelectedPhrasetype](v6, "mUserSelectedPhrasetype");
    -[CSVoiceTriggerRTModelRequestOptionsMutable mEndpointId](v6, "mEndpointId");
    v9 = objc_claimAutoreleasedReturnValue();
    endpointId = v5->_endpointId;
    v5->_endpointId = (NSUUID *)v9;

    -[CSVoiceTriggerRTModelRequestOptionsMutable mEngineMajorVersion](v6, "mEngineMajorVersion");
    v11 = objc_claimAutoreleasedReturnValue();
    engineMajorVersion = v5->_engineMajorVersion;
    v5->_engineMajorVersion = (NSNumber *)v11;

    -[CSVoiceTriggerRTModelRequestOptionsMutable mEngineMinorVersion](v6, "mEngineMinorVersion");
    v13 = objc_claimAutoreleasedReturnValue();
    engineMinorVersion = v5->_engineMinorVersion;
    v5->_engineMinorVersion = (NSNumber *)v13;

    -[CSVoiceTriggerRTModelRequestOptionsMutable mAccessoryModelType](v6, "mAccessoryModelType");
    v15 = objc_claimAutoreleasedReturnValue();
    accessoryModelType = v5->_accessoryModelType;
    v5->_accessoryModelType = (NSNumber *)v15;

    -[CSVoiceTriggerRTModelRequestOptionsMutable mAccessoryInfo](v6, "mAccessoryInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    accessoryInfo = v5->_accessoryInfo;
    v5->_accessoryInfo = (CSCoreSpeechServicesAccessoryInfo *)v18;

  }
  return v5;
}

- (CSVoiceTriggerRTModelRequestOptions)initWithCSRTModelRequestOptions:(id)a3 builder:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  CSVoiceTriggerRTModelRequestOptions *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__CSVoiceTriggerRTModelRequestOptions_initWithCSRTModelRequestOptions_builder___block_invoke;
  v12[3] = &unk_1E7C27938;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:](self, "initWithMutableBuilder:", v12);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CSVoiceTriggerRTModelRequestOptions *v4;
  CSVoiceTriggerRTModelRequestOptions *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v4 = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CSVoiceTriggerRTModelRequestOptions_copyWithZone___block_invoke;
  v7[3] = &unk_1E7C27960;
  objc_copyWeak(&v8, &location);
  v5 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:](v4, "initWithMutableBuilder:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

- (CSVoiceTriggerRTModelRequestOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CSVoiceTriggerRTModelRequestOptions *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSRTModelRequestOptionsSiriLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CSRTModelRequestOptionsAllowMph"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSRTModelRequestOptionsUserSelectedPhraseType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSRTModelRequestOptionsEndpointId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSRTModelRequestOptionsngineMajorVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSRTModelRequestOptionsEngineMinorVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSRTModelRequestOptionsAccessoryModelType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSRTModelRequestOptionsAccessoryInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__CSVoiceTriggerRTModelRequestOptions_initWithCoder___block_invoke;
  v22[3] = &unk_1E7C27988;
  v30 = v6;
  v23 = v5;
  v24 = v7;
  v25 = v8;
  v26 = v9;
  v27 = v10;
  v28 = v11;
  v29 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  v19 = v5;
  v20 = -[CSVoiceTriggerRTModelRequestOptions initWithMutableBuilder:](self, "initWithMutableBuilder:", v22);

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *siriLocale;
  id v5;

  siriLocale = self->_siriLocale;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", siriLocale, CFSTR("CSRTModelRequestOptionsSiriLocale"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowMph, CFSTR("CSRTModelRequestOptionsAllowMph"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userSelectedPhraseType, CFSTR("CSRTModelRequestOptionsUserSelectedPhraseType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endpointId, CFSTR("CSRTModelRequestOptionsEndpointId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_engineMajorVersion, CFSTR("CSRTModelRequestOptionsngineMajorVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_engineMinorVersion, CFSTR("CSRTModelRequestOptionsEngineMinorVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryModelType, CFSTR("CSRTModelRequestOptionsAccessoryModelType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryInfo, CFSTR("CSRTModelRequestOptionsAccessoryInfo"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("siriLocale: %@, allowMph: %d, phraseType: %@, endpointId: %@, engineMajorVersion: %@, engineMinorVersion: %@, accessoryModelType:%@, accessoryInfo: %@"), self->_siriLocale, self->_allowMph, self->_userSelectedPhraseType, self->_endpointId, self->_engineMajorVersion, self->_engineMinorVersion, self->_accessoryModelType, self->_accessoryInfo);
}

- (BOOL)allowMph
{
  return self->_allowMph;
}

- (NSNumber)userSelectedPhraseType
{
  return self->_userSelectedPhraseType;
}

- (NSUUID)endpointId
{
  return self->_endpointId;
}

- (NSNumber)engineMajorVersion
{
  return self->_engineMajorVersion;
}

- (NSNumber)engineMinorVersion
{
  return self->_engineMinorVersion;
}

- (NSNumber)accessoryModelType
{
  return self->_accessoryModelType;
}

- (NSString)siriLocale
{
  return self->_siriLocale;
}

- (CSCoreSpeechServicesAccessoryInfo)accessoryInfo
{
  return self->_accessoryInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_storeStrong((id *)&self->_siriLocale, 0);
  objc_storeStrong((id *)&self->_accessoryModelType, 0);
  objc_storeStrong((id *)&self->_engineMinorVersion, 0);
  objc_storeStrong((id *)&self->_engineMajorVersion, 0);
  objc_storeStrong((id *)&self->_endpointId, 0);
}

void __53__CSVoiceTriggerRTModelRequestOptions_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSiriLocale:", v3);
  objc_msgSend(v4, "setAllowMph:", *(unsigned __int8 *)(a1 + 88));
  objc_msgSend(v4, "setUserSelectedPhraseType:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setEndpointId:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setEngineMajorVersion:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setEngineMinorVersion:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setAccessoryModelType:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setCSCoreSpeechServicesAccessoryInfo:", *(_QWORD *)(a1 + 80));

}

void __52__CSVoiceTriggerRTModelRequestOptions_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "siriLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSiriLocale:", v5);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "setAllowMph:", objc_msgSend(v6, "allowMph"));

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "userSelectedPhraseType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserSelectedPhraseType:", v8);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "endpointId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEndpointId:", v10);

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "engineMajorVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEngineMajorVersion:", v12);

  v13 = objc_loadWeakRetained(v2);
  objc_msgSend(v13, "engineMinorVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEngineMinorVersion:", v14);

  v15 = objc_loadWeakRetained(v2);
  objc_msgSend(v15, "accessoryModelType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessoryModelType:", v16);

  v18 = objc_loadWeakRetained(v2);
  objc_msgSend(v18, "accessoryInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCSCoreSpeechServicesAccessoryInfo:", v17);

}

void __79__CSVoiceTriggerRTModelRequestOptions_initWithCSRTModelRequestOptions_builder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "siriLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSiriLocale:", v3);

  objc_msgSend(v11, "setAllowMph:", objc_msgSend(*(id *)(a1 + 32), "allowMph"));
  objc_msgSend(*(id *)(a1 + 32), "userSelectedPhraseType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserSelectedPhraseType:", v4);

  objc_msgSend(*(id *)(a1 + 32), "endpointId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEndpointId:", v5);

  objc_msgSend(*(id *)(a1 + 32), "engineMajorVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEngineMajorVersion:", v6);

  objc_msgSend(*(id *)(a1 + 32), "engineMinorVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEngineMinorVersion:", v7);

  objc_msgSend(*(id *)(a1 + 32), "accessoryModelType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessoryModelType:", v8);

  objc_msgSend(*(id *)(a1 + 32), "accessoryInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCSCoreSpeechServicesAccessoryInfo:", v9);

  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
