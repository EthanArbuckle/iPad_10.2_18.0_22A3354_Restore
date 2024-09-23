@implementation MCProfileServiceProfile

- (id)_badDataTypeErrorWithFieldName:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1003, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_unsupportedValueErrorWithFieldName:(id)a3 value:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0CB35C8];
  MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_VALUE_P_FIELD_P_VALUE"), (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1010, v9, CFSTR("MCFatalError"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (MCProfileServiceProfile)initWithDictionary:(id)a3 signerCerts:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6
{
  id v9;
  MCProfileServiceProfile *v10;
  void *v11;
  char *v12;
  uint64_t v13;
  NSData *enrollmentIdentityPersistentID;
  uint64_t v15;
  id challenge;
  uint64_t v17;
  NSString *URLString;
  uint64_t v19;
  NSArray *deviceAttributes;
  char *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  MCProfileServiceProfile *v31;
  NSArray *v33;
  NSArray *v34;
  uint64_t v35;
  char *i;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  objc_super v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v54.receiver = self;
  v54.super_class = (Class)MCProfileServiceProfile;
  v10 = -[MCProfile initWithDictionary:signerCerts:allowEmptyPayload:outError:](&v54, sel_initWithDictionary_signerCerts_allowEmptyPayload_outError_, v9, a4, 1, a6);
  if (!v10)
    goto LABEL_24;
  v53 = 0;
  +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v9, CFSTR("PayloadContent"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1002, CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v53);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (char *)v53;
  if (-[MCProfile isStub](v10, "isStub"))
  {
    if (v12)
      goto LABEL_12;
    v52 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v11, CFSTR("EnrollmentIdentityPersistentID"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v52);
    v13 = objc_claimAutoreleasedReturnValue();
    v12 = (char *)v52;
    enrollmentIdentityPersistentID = v10->_enrollmentIdentityPersistentID;
    v10->_enrollmentIdentityPersistentID = (NSData *)v13;

    if (v12)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("Challenge"));
    v15 = objc_claimAutoreleasedReturnValue();
    challenge = v10->_challenge;
    v10->_challenge = (id)v15;

    objc_msgSend(v11, "removeObjectForKey:", CFSTR("Challenge"));
    if (v10->_challenge)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[MCProfileServiceProfile _badDataTypeErrorWithFieldName:](v10, "_badDataTypeErrorWithFieldName:", CFSTR("Challenge"));
          v22 = (char *)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
      }
    }
    if (v12)
      goto LABEL_12;
  }
  v51 = 0;
  +[MCProfile removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredNonZeroLengthStringInDictionary:key:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v11, CFSTR("URL"), CFSTR("MCProfileErrorDomain"), 1002, CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v51);
  v17 = objc_claimAutoreleasedReturnValue();
  v12 = (char *)v51;
  URLString = v10->_URLString;
  v10->_URLString = (NSString *)v17;

  if (!v12)
  {
    v50 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v11, CFSTR("DeviceAttributes"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v50);
    v19 = objc_claimAutoreleasedReturnValue();
    v12 = (char *)v50;
    deviceAttributes = v10->_deviceAttributes;
    v10->_deviceAttributes = (NSArray *)v19;

    if (!v12)
    {
      v49 = 0;
      +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v11, CFSTR("ConfirmInstallation"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v49);
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      v12 = (char *)v49;
      goto LABEL_13;
    }
  }
LABEL_12:
  v21 = 0;
LABEL_13:
  v10->_confirmInstallation = objc_msgSend(v21, "BOOLValue");
  if (v12)
  {
    v22 = v12;
  }
  else
  {
    v48 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v11, CFSTR("SupportedServerVersion"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v48);
    v23 = objc_claimAutoreleasedReturnValue();
    v22 = (char *)v48;

    v21 = (char *)v23;
  }
  v10->_supportedServerVersion = objc_msgSend(v21, "BOOLValue");
  if (!v22)
  {
    v33 = v10->_deviceAttributes;
    if (v33)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v34 = v33;
      v22 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
      if (v22)
      {
        v43 = a6;
        v35 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v45 != v35)
              objc_enumerationMutation(v34);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              -[MCProfileServiceProfile _badDataTypeErrorWithFieldName:](v10, "_badDataTypeErrorWithFieldName:", CFSTR("DeviceAttributes"));
              v22 = (char *)objc_claimAutoreleasedReturnValue();
              goto LABEL_37;
            }
          }
          v22 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
          if (v22)
            continue;
          break;
        }
LABEL_37:
        a6 = v43;
      }

    }
    else
    {
      v22 = 0;
    }
    if (objc_msgSend(v11, "count"))
    {
      v37 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v38 = v37;
        -[MCProfile friendlyName](v10, "friendlyName");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v39;
        v57 = 2114;
        v58 = v11;
        _os_log_impl(&dword_19ECC4000, v38, OS_LOG_TYPE_INFO, "PayloadContent for profile “%{public}@” has entries that are being ignored. They are:%{public}@", buf, 0x16u);

      }
    }
    if (objc_msgSend(v9, "count"))
    {
      v40 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v41 = v40;
        -[MCProfile friendlyName](v10, "friendlyName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v42;
        v57 = 2114;
        v58 = v9;
        _os_log_impl(&dword_19ECC4000, v41, OS_LOG_TYPE_INFO, "Profile “%{public}@” has entries that are being ignored. They are:%{public}@", buf, 0x16u);

      }
    }
  }
  v12 = v21;
LABEL_18:

  if (!v22)
  {
LABEL_24:
    v31 = v10;
    goto LABEL_25;
  }
  -[MCProfile malformedProfileErrorWithError:](v10, "malformedProfileErrorWithError:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a6)
    *a6 = objc_retainAutorelease(v24);
  v26 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v27 = v26;
    v28 = (void *)objc_opt_class();
    v29 = v28;
    objc_msgSend(v25, "MCVerboseDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v56 = v28;
    v57 = 2114;
    v58 = v30;
    _os_log_impl(&dword_19ECC4000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse profile: %{public}@", buf, 0x16u);

  }
  v31 = 0;
LABEL_25:

  return v31;
}

- (id)localizedPayloadSummaryByType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  MCLocalizedString(CFSTR("DEVICE_ENROLLMENT_CHALLENGE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)payloads
{
  NSArray *bogusPayloads;
  void *v4;
  MCEncryptedProfileServicePayload *v5;
  NSArray *v6;
  NSArray *v7;

  bogusPayloads = self->_bogusPayloads;
  if (!bogusPayloads)
  {
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = -[MCEncryptedProfileServicePayload initWithURLString:profile:]([MCEncryptedProfileServicePayload alloc], "initWithURLString:profile:", self->_URLString, self);
    objc_msgSend(v4, "arrayWithObject:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_bogusPayloads;
    self->_bogusPayloads = v6;

    bogusPayloads = self->_bogusPayloads;
  }
  return bogusPayloads;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCProfileServiceProfile;
  -[MCProfile stubDictionary](&v7, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", CFSTR("Profile Service"), CFSTR("PayloadType"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MCSetObjectIfNotNil:forKey:", self->_URLString, CFSTR("URL"));
  objc_msgSend(v4, "MCSetObjectIfNotNil:forKey:", self->_deviceAttributes, CFSTR("DeviceAttributes"));
  objc_msgSend(v4, "MCSetObjectIfNotNil:forKey:", self->_enrollmentIdentityPersistentID, CFSTR("EnrollmentIdentityPersistentID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_confirmInstallation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("ConfirmInstallation"));

  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("PayloadContent"));
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  NSArray *deviceAttributes;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCProfileServiceProfile;
  -[MCProfile description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_URLString)
    objc_msgSend(v4, "appendFormat:", CFSTR("URL         : %@\n"), self->_URLString);
  deviceAttributes = self->_deviceAttributes;
  if (deviceAttributes)
  {
    -[NSArray componentsJoinedByString:](deviceAttributes, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR("Device Attr : %@\n"), v6);

  }
  if (self->_challenge)
    objc_msgSend(v4, "appendFormat:", CFSTR("Challenge   : (present)\n"));
  if (self->_enrollmentIdentityPersistentID)
    objc_msgSend(v4, "appendFormat:", CFSTR("Cert Persist: %@\n"), self->_enrollmentIdentityPersistentID);
  MCStringForBool(self->_confirmInstallation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Confirm     : %@"), v7);

  return v4;
}

- (id)serializedDictionary
{
  void *v3;
  void *v4;
  NSString *URLString;
  NSArray *deviceAttributes;
  NSData *enrollmentIdentityPersistentID;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCProfileServiceProfile;
  -[MCProfile serializedDictionary](&v10, sel_serializedDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  URLString = self->_URLString;
  if (URLString)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", URLString, CFSTR("URL"));
  deviceAttributes = self->_deviceAttributes;
  if (deviceAttributes)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", deviceAttributes, CFSTR("Device Attributes"));
  if (self->_challenge)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("(present)"), CFSTR("Challenge"));
  enrollmentIdentityPersistentID = self->_enrollmentIdentityPersistentID;
  if (enrollmentIdentityPersistentID)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", enrollmentIdentityPersistentID, CFSTR("Cert Persist"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_confirmInstallation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("Confirm"));

  return v4;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
  objc_storeStrong((id *)&self->_URLString, a3);
}

- (NSArray)deviceAttributes
{
  return self->_deviceAttributes;
}

- (id)challenge
{
  return self->_challenge;
}

- (NSData)enrollmentIdentityPersistentID
{
  return self->_enrollmentIdentityPersistentID;
}

- (void)setEnrollmentIdentityPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentIdentityPersistentID, a3);
}

- (BOOL)confirmInstallation
{
  return self->_confirmInstallation;
}

- (BOOL)supportedServerVersion
{
  return self->_supportedServerVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bogusPayloads, 0);
  objc_storeStrong((id *)&self->_enrollmentIdentityPersistentID, 0);
  objc_storeStrong(&self->_challenge, 0);
  objc_storeStrong((id *)&self->_deviceAttributes, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
}

@end
