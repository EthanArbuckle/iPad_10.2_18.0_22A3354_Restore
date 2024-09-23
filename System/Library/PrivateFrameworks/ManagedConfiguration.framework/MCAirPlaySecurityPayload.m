@implementation MCAirPlaySecurityPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.airplay.security");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
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

  return MCLocalizedFormat(CFSTR("AIRPLAY_SECURITY_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("AIRPLAY_SECURITY_"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCAirPlaySecurityPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCAirPlaySecurityPayload *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v26;
  int v27;
  const __CFString **v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  const __CFString *v41;
  const __CFString *v42;
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MCAirPlaySecurityPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v36, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  if (!v9)
    goto LABEL_19;
  v35 = 0;
  +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("AccessType"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;
  if (v11)
  {
    v12 = v11;
LABEL_8:

LABEL_9:
    -[MCPayload malformedPayloadErrorWithError:](v9, "malformedPayloadErrorWithError:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    if (a5)
      *a5 = objc_retainAutorelease(v16);
    v17 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v18 = v17;
      v19 = (void *)objc_opt_class();
      v20 = v19;
      objc_msgSend(v10, "MCVerboseDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v19;
      v39 = 2114;
      v40 = v21;
      _os_log_impl(&dword_19ECC4000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v9 = 0;
    goto LABEL_14;
  }
  v43[0] = CFSTR("ANY");
  v43[1] = CFSTR("WIFI_ONLY");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  +[MCProfile checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:](MCProfile, "checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:", v10, v13, CFSTR("AccessType"), CFSTR("MCPayloadErrorDomain"), 2004, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v34);
  v14 = v34;
  if (v14)
  {
LABEL_5:
    v12 = v14;

    goto LABEL_8;
  }
  -[MCAirPlaySecurityPayload setAccessType:](v9, "setAccessType:", v10);

  v33 = 0;
  +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("SecurityType"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v33;
  if (v15)
    goto LABEL_7;
  -[MCAirPlaySecurityPayload accessType](v9, "accessType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("ANY"));

  if (v27)
  {
    v42 = CFSTR("NONE");
    v28 = &v42;
  }
  else
  {
    v41 = CFSTR("NONE");
    v28 = &v41;
  }
  v28[1] = CFSTR("PASSCODE_ONCE");
  v28[2] = CFSTR("PASSCODE_ALWAYS");
  v28[3] = CFSTR("PASSWORD");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  +[MCProfile checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:](MCProfile, "checkString:isOneOfStrings:key:errorDomain:errorCode:errorString:outError:", v10, v13, CFSTR("SecurityType"), CFSTR("MCPayloadErrorDomain"), 2004, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v32);
  v14 = v32;
  if (v14)
    goto LABEL_5;
  -[MCAirPlaySecurityPayload setSecurityType:](v9, "setSecurityType:", v10);

  v31 = 0;
  +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Password"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v31;
  if (v15)
  {
LABEL_7:
    v12 = v15;
    goto LABEL_8;
  }
  -[MCAirPlaySecurityPayload securityType](v9, "securityType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v29, "isEqual:", CFSTR("PASSWORD")))
  {

    goto LABEL_30;
  }
  v30 = objc_msgSend(v10, "length");

  if (v30)
  {
LABEL_30:
    -[MCAirPlaySecurityPayload setPassword:](v9, "setPassword:", v10);
    v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("Password"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    goto LABEL_9;
LABEL_15:
  if (objc_msgSend(v8, "count"))
  {
    v22 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v23 = v22;
      -[MCPayload friendlyName](v9, "friendlyName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v24;
      v39 = 2114;
      v40 = v8;
      _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_19:
  return v9;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSString *accessType;
  NSString *securityType;
  NSString *password;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCAirPlaySecurityPayload;
  -[MCPayload stubDictionary](&v9, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  accessType = self->_accessType;
  if (accessType)
    objc_msgSend(v3, "setObject:forKey:", accessType, CFSTR("AccessType"));
  securityType = self->_securityType;
  if (securityType)
    objc_msgSend(v4, "setObject:forKey:", securityType, CFSTR("SecurityType"));
  password = self->_password;
  if (password)
    objc_msgSend(v4, "setObject:forKey:", password, CFSTR("Password"));
  return v4;
}

- (id)subtitle1Label
{
  return MCLocalizedString(CFSTR("AIRPLAY_SECURITY_ACCESS_TITLE_COLON"));
}

- (id)subtitle1Description
{
  void *v3;
  void *v4;

  if (-[NSString isEqualToString:](self->_accessType, "isEqualToString:", CFSTR("ANY")))
  {
    MCLocalizedString(CFSTR("AIRPLAY_SECURITY_ACCESS_ANY"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[NSString isEqualToString:](self->_accessType, "isEqualToString:", CFSTR("WIFI_ONLY")))
  {
    objc_msgSend(CFSTR("AIRPLAY_SECURITY_ACCESS_WIFI"), "MCAppendGreenteaSuffix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)subtitle2Label
{
  return MCLocalizedString(CFSTR("AIRPLAY_SECURITY_TITLE_COLON"));
}

- (id)subtitle2Description
{
  __CFString *v3;
  void *v4;

  if (-[NSString isEqualToString:](self->_securityType, "isEqualToString:", CFSTR("NONE")))
  {
    v3 = CFSTR("AIRPLAY_SECURITY_TYPE_NONE");
  }
  else if (-[NSString isEqualToString:](self->_securityType, "isEqualToString:", CFSTR("PASSCODE_ONCE")))
  {
    v3 = CFSTR("AIRPLAY_SECURITY_TYPE_ONCE");
  }
  else if (-[NSString isEqualToString:](self->_securityType, "isEqualToString:", CFSTR("PASSCODE_ALWAYS")))
  {
    v3 = CFSTR("AIRPLAY_SECURITY_TYPE_ALWAYS");
  }
  else
  {
    if (!-[NSString isEqualToString:](self->_securityType, "isEqualToString:", CFSTR("PASSWORD")))
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("AIRPLAY_SECURITY_TYPE_PASSWORD");
  }
  MCLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)MCAirPlaySecurityPayload;
  -[MCPayload verboseDescription](&v7, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("AirPlay Security: %@ (%@)\n"), self->_securityType, self->_accessType);
  return v5;
}

- (NSString)accessType
{
  return self->_accessType;
}

- (void)setAccessType:(id)a3
{
  objc_storeStrong((id *)&self->_accessType, a3);
}

- (NSString)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(id)a3
{
  objc_storeStrong((id *)&self->_securityType, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_securityType, 0);
  objc_storeStrong((id *)&self->_accessType, 0);
}

@end
