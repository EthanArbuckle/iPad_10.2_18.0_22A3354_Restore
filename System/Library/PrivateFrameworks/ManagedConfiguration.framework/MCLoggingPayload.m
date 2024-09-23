@implementation MCLoggingPayload

+ (id)typeStrings
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.system.logging");
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

  return MCLocalizedFormat(CFSTR("LOGGING_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("LOGGING_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (BOOL)isAllowedToWriteLogging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v8;

  v8 = 0;
  -[MCPayload profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signatureVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCPayload profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signerCertificates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCProfile evaluateTrustOfCertificateChain:signatureVersion:outIsAllowedToWriteDefaults:](MCProfile, "evaluateTrustOfCertificateChain:signatureVersion:outIsAllowedToWriteDefaults:", v6, v4, &v8);

  LOBYTE(v5) = v8;
  return (char)v5;
}

- (MCLoggingPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCLoggingPayload *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  NSDictionary *loggingPayload;
  char v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  objc_super v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v67.receiver = self;
  v67.super_class = (Class)MCLoggingPayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v67, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_41;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Processes"), 0, &v66);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v66;
  if (v13)
  {
    v14 = v13;

LABEL_32:
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v14);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (a5)
      *a5 = objc_retainAutorelease(v49);
    v51 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v52 = v51;
      v53 = (void *)objc_opt_class();
      v54 = v53;
      objc_msgSend(v50, "MCVerboseDescription");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v53;
      v70 = 2114;
      v71 = v55;
      _os_log_impl(&dword_19ECC4000, v52, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
    goto LABEL_37;
  }
  if (v12)
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("Processes"));
  v62 = v11;
  v65 = 0;
  objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("Subsystems"), 0, &v65);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v65;
  if (!v14)
  {
    if (v15)
      objc_msgSend(v62, "setObject:forKey:", v15, CFSTR("Subsystems"));
    v64 = 0;
    objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("System"), 0, &v64);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v64;
    if (v17)
    {
      v14 = v17;
      v18 = v16;
LABEL_30:

      goto LABEL_31;
    }
    -[MCPayload profile](v10, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isStub");

    if ((v20 & 1) != 0)
    {
      v18 = v16;
    }
    else
    {
      if (v16)
      {
        v21 = (void *)objc_msgSend(v16, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v18 = v21;
      objc_msgSend(v21, "objectForKey:", CFSTR("Enable-Logging"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        objc_msgSend(v18, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Enable-Logging"));

    }
    if (v18)
      objc_msgSend(v62, "setObject:forKey:", v18, CFSTR("System"));
    -[MCPayload profile](v10, "profile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isStub");

    if ((v24 & 1) != 0)
      goto LABEL_22;
    v63 = 0;
    v27 = MCOSLogValidateProfilePayload(v62, (uint64_t)&v63);
    loggingPayload = (NSDictionary *)v63;
    if ((v27 & 1) != 0)
    {
      if (-[MCLoggingPayload isAllowedToWriteLogging](v10, "isAllowedToWriteLogging"))
      {

LABEL_22:
        v25 = objc_msgSend(v62, "copy");
        v14 = 0;
        loggingPayload = v10->_loggingPayload;
        v10->_loggingPayload = (NSDictionary *)v25;
LABEL_29:

        goto LABEL_30;
      }
      v39 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v9, "friendlyName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_PROFILE_DEFAULTS_BAD_SIGNATURE_P_ID"), v40, v41, v42, v43, v44, v45, v46, v61);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = v39;
      v38 = (void *)v47;
      objc_msgSend(v48, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCLoggingSettingsErrorDomain"), 49000);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (id)objc_msgSend(v60, "MCCopyAsPrimaryError");

    }
    else
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      -[MCPayload identifier](v10, "identifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      MCErrorArray(CFSTR("ERROR_LOGGING_INVALID_CONFIGURATION_P_ID"), v29, v30, v31, v32, v33, v34, v35, v61);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v28;
      v38 = (void *)v36;
      objc_msgSend(v37, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", CFSTR("MCLoggingSettingsErrorDomain"), 49001);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_29;
  }
LABEL_31:

  if (v14)
    goto LABEL_32;
LABEL_37:
  if (objc_msgSend(v8, "count"))
  {
    v56 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v57 = v56;
      -[MCPayload friendlyName](v10, "friendlyName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v69 = v58;
      v70 = 2114;
      v71 = v8;
      _os_log_impl(&dword_19ECC4000, v57, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);

    }
  }

LABEL_41:
  return v10;
}

- (id)stubDictionary
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MCLoggingPayload;
  -[MCPayload stubDictionary](&v5, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", self->_loggingPayload);
  return v3;
}

- (id)title
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  MCLocalizedString(CFSTR("LOGGING_DESCRIPTION_SINGULAR_FORMAT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSDictionary)loggingPayload
{
  return self->_loggingPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingPayload, 0);
}

@end
