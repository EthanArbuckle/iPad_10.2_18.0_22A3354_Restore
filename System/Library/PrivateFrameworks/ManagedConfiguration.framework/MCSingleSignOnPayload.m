@implementation MCSingleSignOnPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.sso");
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

  return MCLocalizedFormat(CFSTR("SSO_SINGULAR"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("SSO_"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCSingleSignOnPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCSingleSignOnPayload *v10;
  uint64_t v11;
  id v12;
  NSString *humanReadableName;
  void *v14;
  id v15;
  MCSingleSignOnPayloadKerberosInfo *v16;
  void *v17;
  uint64_t v18;
  MCSingleSignOnPayloadKerberosInfo *kerberosInfo;
  uint64_t v20;
  NSString *v21;
  MCSingleSignOnPayloadKerberosInfo *v22;
  void *v23;
  uint64_t v24;
  MCSingleSignOnPayloadKerberosInfo *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v43.receiver = self;
  v43.super_class = (Class)MCSingleSignOnPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v43, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_23;
  if (objc_msgSend(v9, "isStub"))
  {
    v42 = 0;
    +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Name"), CFSTR("MCPayloadErrorDomain"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v42);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v42;
    humanReadableName = v10->_humanReadableName;
    v10->_humanReadableName = (NSString *)v11;

    if (!v12)
    {
      v41 = 0;
      +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Kerberos"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v41);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v41;
      if (!v15)
      {
        v16 = [MCSingleSignOnPayloadKerberosInfo alloc];
        v17 = (void *)objc_msgSend(v14, "mutableCopy");
        v40 = 0;
        v18 = -[MCSingleSignOnPayloadKerberosInfo initWithDictionary:profile:outError:](v16, "initWithDictionary:profile:outError:", v17, v9, &v40);
        v12 = v40;
        kerberosInfo = v10->_kerberosInfo;
        v10->_kerberosInfo = (MCSingleSignOnPayloadKerberosInfo *)v18;

        goto LABEL_13;
      }
      goto LABEL_8;
    }
LABEL_14:
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a5)
      *a5 = objc_retainAutorelease(v26);
    v28 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v29 = v28;
      v30 = (void *)objc_opt_class();
      v31 = v30;
      objc_msgSend(v27, "MCVerboseDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v30;
      v46 = 2114;
      v47 = v32;
      _os_log_impl(&dword_19ECC4000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
    goto LABEL_19;
  }
  v39 = 0;
  +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Name"), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v39);
  v20 = objc_claimAutoreleasedReturnValue();
  v12 = v39;
  v21 = v10->_humanReadableName;
  v10->_humanReadableName = (NSString *)v20;

  if (v12)
    goto LABEL_14;
  v38 = 0;
  +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Kerberos"), objc_opt_class(), CFSTR("MCPayloadErrorDomain"), 2002, CFSTR("ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD"), 2003, CFSTR("ERROR_PAYLOAD_FIELD_INVALID_P_FIELD"), &v38);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v38;
  if (v15)
  {
LABEL_8:
    v12 = v15;
    goto LABEL_13;
  }
  v22 = [MCSingleSignOnPayloadKerberosInfo alloc];
  v23 = (void *)objc_msgSend(v14, "mutableCopy");
  v37 = 0;
  v24 = -[MCSingleSignOnPayloadKerberosInfo initWithDictionary:profile:outError:](v22, "initWithDictionary:profile:outError:", v23, v9, &v37);
  v12 = v37;
  v25 = v10->_kerberosInfo;
  v10->_kerberosInfo = (MCSingleSignOnPayloadKerberosInfo *)v24;

  if (!v12)
  {
    if (v10->_kerberosInfo)
    {
      v12 = 0;
    }
    else
    {
      +[MCProfile missingFieldErrorWithField:](MCProfile, "missingFieldErrorWithField:", CFSTR("Kerberos"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_13:

  if (v12)
    goto LABEL_14;
LABEL_19:
  if (objc_msgSend(v8, "count"))
  {
    v33 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v34 = v33;
      -[MCPayload friendlyName](v10, "friendlyName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v35;
      v46 = 2114;
      v47 = v8;
      _os_log_impl(&dword_19ECC4000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_23:
  return v10;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCSingleSignOnPayload;
  -[MCPayload description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[MCSingleSignOnPayload humanReadableName](self, "humanReadableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MCSingleSignOnPayload humanReadableName](self, "humanReadableName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Name          : %@\n"), v6);

  }
  -[MCSingleSignOnPayload kerberosInfo](self, "kerberosInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MCSingleSignOnPayload kerberosInfo](self, "kerberosInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Kerberos Info:\n%@\n"), v8);

  }
  return v4;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCSingleSignOnPayload;
  -[MCPayload stubDictionary](&v10, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCSingleSignOnPayload humanReadableName](self, "humanReadableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCSingleSignOnPayload humanReadableName](self, "humanReadableName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("Name"));

  }
  -[MCSingleSignOnPayload kerberosInfo](self, "kerberosInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCSingleSignOnPayload kerberosInfo](self, "kerberosInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stubDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("Kerberos"));

  }
  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  MCKeyValue *v7;
  void *v8;
  void *v9;
  MCKeyValue *v10;
  void *v11;
  MCKeyValue *v12;
  void *v13;
  void *v14;
  MCKeyValue *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MCKeyValue *v20;
  void *v21;
  MCKeyValue *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[MCSingleSignOnPayload kerberosInfo](self, "kerberosInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "principalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = [MCKeyValue alloc];
    objc_msgSend(v5, "principalName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("PRINCIPAL_NAME"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MCKeyValue initWithLocalizedString:localizedKey:](v7, "initWithLocalizedString:localizedKey:", v8, v9);

    objc_msgSend(v4, "addObject:", v10);
  }
  objc_msgSend(v5, "realm");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [MCKeyValue alloc];
    objc_msgSend(v5, "realm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("REALM"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MCKeyValue initWithLocalizedString:localizedKey:](v12, "initWithLocalizedString:localizedKey:", v13, v14);

    objc_msgSend(v4, "addObject:", v15);
  }
  objc_msgSend(v5, "certificateUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MCPayload profile](self, "profile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "certificateUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "subjectSummaryFromCertificatePayloadWithUUID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "length"))
    {
      v20 = [MCKeyValue alloc];
      MCLocalizedString(CFSTR("SSO_CERTIFICATE"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[MCKeyValue initWithLocalizedString:localizedKey:](v20, "initWithLocalizedString:localizedKey:", v19, v21);

      objc_msgSend(v4, "addObject:", v22);
    }

  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  objc_msgSend(v5, "URLPrefixMatches");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    objc_msgSend(v5, "URLPrefixMatches");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("URL_PREFIX_MATCHES"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v26, v27, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v28);
  }
  objc_msgSend(v5, "appIdentifierMatches");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30)
  {
    objc_msgSend(v5, "appIdentifierMatches");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("APP_MATCHES"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v31, v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v33);
  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (NSString)humanReadableName
{
  return self->_humanReadableName;
}

- (void)setHumanReadableName:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableName, a3);
}

- (MCSingleSignOnPayloadKerberosInfo)kerberosInfo
{
  return self->_kerberosInfo;
}

- (void)setKerberosInfo:(id)a3
{
  objc_storeStrong((id *)&self->_kerberosInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kerberosInfo, 0);
  objc_storeStrong((id *)&self->_humanReadableName, 0);
}

@end
