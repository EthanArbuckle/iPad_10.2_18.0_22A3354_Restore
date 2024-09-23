@implementation MCRemovalPasswordPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.profileRemovalPassword"));
}

+ (id)localizedSingularForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("PAYLOAD_REMOVAL_PASSWORD_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return MCLocalizedFormat(CFSTR("PAYLOAD_REMOVAL_PASSWORD_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCRemovalPasswordPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCRemovalPasswordPayload *v10;
  uint64_t v11;
  id v12;
  NSString *removalPasscode;
  uint64_t v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v35.receiver = self;
  v35.super_class = (Class)MCRemovalPasswordPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v35, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (v10)
  {
    if ((objc_msgSend(v9, "isStub") & 1) != 0)
    {
      v33 = 0;
      +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("RemovalPassword"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v33);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v33;
      removalPasscode = v10->_removalPasscode;
      v10->_removalPasscode = (NSString *)v11;

    }
    else
    {
      v34 = 0;
      +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("RemovalPassword"), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v34);
      v14 = objc_claimAutoreleasedReturnValue();
      v12 = v34;
      v15 = v10->_removalPasscode;
      v10->_removalPasscode = (NSString *)v14;

      objc_msgSend(v9, "removalPasscode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v24 = (void *)MEMORY[0x1E0CB35C8];
        MCErrorArray(CFSTR("ERROR_PAYLOAD_MULTIPLE_REMOVAL_PASSCODES"), v17, v18, v19, v20, v21, v22, v23, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCPayloadErrorDomain"), 2000, v25, CFSTR("MCFatalError"));
        v26 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v26;
        if (v26)
          goto LABEL_11;
        goto LABEL_16;
      }
    }
    if (v10->_removalPasscode)
    {
      objc_msgSend(v9, "setRemovalPasscode:");
      objc_msgSend(v9, "setLocked:", 1);
      if (!v12)
        goto LABEL_16;
LABEL_11:
      v27 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v28 = v27;
        v29 = (void *)objc_opt_class();
        v30 = v29;
        objc_msgSend(v12, "MCVerboseDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v29;
        v38 = 2114;
        v39 = v31;
        _os_log_impl(&dword_19ECC4000, v28, OS_LOG_TYPE_ERROR, "Cannot parse payload %{public}@. Error: %{public}@", buf, 0x16u);

      }
      if (a5)
        *a5 = objc_retainAutorelease(v12);

      v10 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v9, "setRemovalPasscode:");
    if (v12)
      goto LABEL_11;
LABEL_16:

  }
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSString *removalPasscode;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCRemovalPasswordPayload;
  -[MCPayload stubDictionary](&v7, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  removalPasscode = self->_removalPasscode;
  if (removalPasscode)
    objc_msgSend(v3, "setObject:forKey:", removalPasscode, CFSTR("RemovalPassword"));
  return v4;
}

- (NSString)removalPasscode
{
  return self->_removalPasscode;
}

- (void)setRemovalPasscode:(id)a3
{
  objc_storeStrong((id *)&self->_removalPasscode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removalPasscode, 0);
}

@end
