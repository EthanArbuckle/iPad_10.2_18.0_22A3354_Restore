@implementation MCGlobalEthernetPayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.globalethernet.managed"));
}

+ (id)localizedSingularForm
{
  return MCLocalizedString(CFSTR("GLOBAL_ETHERNET_SINGULAR_FORMAT"));
}

+ (id)localizedPluralForm
{
  return MCLocalizedString(CFSTR("GLOBAL_ETHERNET_PLURAL_FORMAT"));
}

- (MCGlobalEthernetPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  MCGlobalEthernetPayload *v9;
  MCGlobalEthernetPayload *v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  NSString *username;
  uint64_t v17;
  NSString *password;
  void *v19;
  uint64_t v20;
  NSArray *eapTypes;
  uint64_t v22;
  id v23;
  NSArray *payloadCertificateAnchorUUIDs;
  uint64_t v25;
  NSString *certificateUUID;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MCGlobalEthernetPayload;
  v9 = -[MCPayload initWithDictionary:profile:outError:](&v40, sel_initWithDictionary_profile_outError_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    v39 = 0;
    -[MCGlobalEthernetPayload _payloadIsValid:error:](v9, "_payloadIsValid:error:", v8, &v39);
    v11 = v39;
    if (v11)
    {
      v12 = v11;
      v13 = 0;
    }
    else
    {
      v38 = 0;
      objc_msgSend(v8, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPClientConfiguration"), 1, &v38);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v38;
      if (!v12)
      {
        if (v13)
        {
          v37 = 0;
          v14 = -[MCGlobalEthernetPayload _eapConfigIsValid:error:](v10, "_eapConfigIsValid:error:", v13, &v37);
          v12 = v37;
          if (v14)
          {
            -[MCGlobalEthernetPayload _eapUsernameFromConfig:isRequired:](v10, "_eapUsernameFromConfig:isRequired:", v13, &v10->_usernameRequired);
            v15 = objc_claimAutoreleasedReturnValue();
            username = v10->_username;
            v10->_username = (NSString *)v15;

            -[MCGlobalEthernetPayload _eapPasswordFromConfig:isRequired:](v10, "_eapPasswordFromConfig:isRequired:", v13, &v10->_passwordRequired);
            v17 = objc_claimAutoreleasedReturnValue();
            password = v10->_password;
            v10->_password = (NSString *)v17;

            v19 = (void *)objc_msgSend(v13, "mutableCopy");
            objc_msgSend(v13, "objectForKey:", CFSTR("AcceptEAPTypes"));
            v20 = objc_claimAutoreleasedReturnValue();
            eapTypes = v10->_eapTypes;
            v10->_eapTypes = (NSArray *)v20;

            v36 = v12;
            objc_msgSend(v19, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("PayloadCertificateAnchorUUID"), 0, &v36);
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = v36;

            payloadCertificateAnchorUUIDs = v10->_payloadCertificateAnchorUUIDs;
            v10->_payloadCertificateAnchorUUIDs = (NSArray *)v22;

            v12 = v23;
            if (!v23)
            {
              v35 = 0;
              objc_msgSend(v8, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("PayloadCertificateUUID"), 0, &v35);
              v25 = objc_claimAutoreleasedReturnValue();
              v12 = v35;
              certificateUUID = v10->_certificateUUID;
              v10->_certificateUUID = (NSString *)v25;

              if (!v12)
                objc_storeStrong((id *)&v10->_eapClientConfiguration, v19);
            }

          }
        }
      }
      if (!v12)
        goto LABEL_17;
    }
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a5)
      *a5 = objc_retainAutorelease(v27);
    v29 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v30 = v29;
      v31 = (void *)objc_opt_class();
      v32 = v31;
      objc_msgSend(v28, "MCVerboseDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v31;
      v43 = 2114;
      v44 = v33;
      _os_log_impl(&dword_19ECC4000, v30, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
LABEL_17:
    v10 = v10;

  }
  return v10;
}

- (BOOL)_payloadIsValid:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSString *v8;
  NSString *interface;
  NSArray *v10;
  NSArray *setupModes;
  NSArray *v12;
  _BOOL4 isSystemMode;
  BOOL v14;
  id v15;
  void *v16;
  _QWORD v18[5];

  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("Interface"), 1, a4);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  interface = self->_interface;
  self->_interface = v8;

  if (!self->_interface
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !-[NSString isEqualToString:](self->_interface, "isEqualToString:", CFSTR("GlobalEthernet")))
  {
    if (a4)
    {
      +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("Interface"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v15 = v16;
      v14 = 0;
      goto LABEL_11;
    }
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("SetupModes"));
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  setupModes = self->_setupModes;
  self->_setupModes = v10;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("SetupModes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_14;
  }
  self->_isSystemMode = 0;
  v12 = self->_setupModes;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__MCGlobalEthernetPayload__payloadIsValid_error___block_invoke;
  v18[3] = &unk_1E41E38B0;
  v18[4] = self;
  -[NSArray enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v18);
  isSystemMode = self->_isSystemMode;
  v14 = self->_isSystemMode;
  if (a4 && !isSystemMode)
  {
    +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("SetupModes"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    *a4 = v15;
  }
LABEL_15:

  return v14;
}

void __49__MCGlobalEthernetPayload__payloadIsValid_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isEqualToString:", CFSTR("System")))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 90) = 1;
    *a4 = 1;
  }

}

- (id)_eapUsernameFromConfig:(id)a3 isRequired:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("AcceptEAPTypes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsObject:", v8);

      if (a4)
      {
        if ((v9 & 1) == 0)
          *a4 = 1;
      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("UserName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_eapPasswordFromConfig:(id)a3 isRequired:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("AcceptEAPTypes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsObject:", v8);

      if (a4)
      {
        if ((v9 & 1) == 0)
          *a4 = 1;
      }
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("UserPassword"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_eapConfigIsValid:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  const __CFString *v41;
  id v42;
  unint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  id v61;
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  _QWORD v67[4];
  _QWORD v68[5];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v62 = 0;
  v7 = (id)objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("UserName"), 0, &v62);
  v8 = v62;
  if (v8
    || (v61 = 0,
        v9 = (id)objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("UserPassword"), 0, &v61), (v8 = v61) != 0))
  {
    v10 = v8;
    v11 = 0;
    v12 = 0;
LABEL_4:
    v13 = 0;
LABEL_5:
    v14 = 0;
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
  v60 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("AcceptEAPTypes"), 1, &v60);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v17 = v60;
  if (v17)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E4212CB8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v12 = v12;
  v19 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v57;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v57 != v21)
          objc_enumerationMutation(v12);
        if (!objc_msgSend(v18, "containsObject:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i)))
        {
          +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("AcceptEAPTypes"));
          v10 = (id)objc_claimAutoreleasedReturnValue();

          v15 = 0;
          v14 = 0;
          v13 = 0;
          goto LABEL_27;
        }
      }
      v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      if (v20)
        continue;
      break;
    }
  }

  v55 = 0;
  v23 = (id)objc_msgSend(v6, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("PayloadCertificateUUID"), 0, &v55);
  v17 = v55;
  if (v17)
    goto LABEL_11;
  v54 = 0;
  v24 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("TLSTrustedCertificates"), 0, &v54);
  v17 = v54;
  if (v17
    || (v53 = 0,
        v25 = (id)objc_msgSend(v6, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("TLSTrustedServerNames"), 0, &v53), (v17 = v53) != 0)|| (v52 = 0, v26 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("TLSCertificateIsRequired"), 0, &v52), (v17 = v52) != 0))
  {
LABEL_11:
    v10 = v17;
    v11 = 0;
    goto LABEL_4;
  }
  v51 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("TTLSInnerAuthentication"), 0, &v51);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v51;
  if (v27)
  {
    v10 = v27;
    v11 = 0;
    goto LABEL_5;
  }
  if (v13)
  {
    v31 = (void *)MEMORY[0x1E0C99E60];
    v68[0] = CFSTR("PAP");
    v68[1] = CFSTR("CHAP");
    v68[2] = CFSTR("MSCHAP");
    v68[3] = CFSTR("MSCHAPv2");
    v68[4] = CFSTR("EAP");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setWithArray:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v33, "containsObject:", v13))
    {
      +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", CFSTR("TTLSInnerAuthentication"));
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v15 = 0;
      v14 = 0;
      goto LABEL_27;
    }

  }
  v50 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("TLSMinimumVersion"), 0, &v50);
  v14 = objc_claimAutoreleasedReturnValue();
  v34 = v50;
  if (v34)
  {
    v10 = v34;
    v11 = 0;
    goto LABEL_6;
  }
  v49 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("TLSMaximumVersion"), 0, &v49);
  v15 = objc_claimAutoreleasedReturnValue();
  v35 = v49;
  if (v35)
  {
LABEL_52:
    v10 = v35;
    goto LABEL_28;
  }
  if (v14 | v15)
  {
    v67[0] = CFSTR("1.0");
    v67[1] = CFSTR("1.1");
    v67[2] = CFSTR("1.2");
    v67[3] = CFSTR("1.3");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_msgSend(v44, "containsObject:", v14) & 1) == 0)
    {
      v41 = CFSTR("TLSMinimumVersion");
    }
    else
    {
      if (!v15)
      {
LABEL_48:

        goto LABEL_49;
      }
      if ((objc_msgSend(v44, "containsObject:", v15) & 1) != 0)
      {
        if (v14)
        {
          v43 = objc_msgSend(v36, "indexOfObject:", v14);
          if (v43 > objc_msgSend(v36, "indexOfObject:", v15))
          {
            +[MCPayload conflictingFieldValueErrorWithUnderlyingError:](MCPayload, "conflictingFieldValueErrorWithUnderlyingError:", 0, CFSTR("TLSMinimumVersion"), CFSTR("TLSMaximumVersion"), v14, v15, 0);
            v37 = objc_claimAutoreleasedReturnValue();
LABEL_56:
            v10 = (id)v37;

            goto LABEL_27;
          }
        }
        goto LABEL_48;
      }
      v41 = CFSTR("TLSMaximumVersion");
    }
    +[MCPayload badFieldValueErrorWithField:](MCPayload, "badFieldValueErrorWithField:", v41);
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
LABEL_49:
  v48 = 0;
  v38 = (id)objc_msgSend(v6, "MCValidateAndRemoveNonZeroLengthStringWithKey:isRequired:outError:", CFSTR("OuterIdentity"), 0, &v48);
  v35 = v48;
  if (v35)
    goto LABEL_52;
  v47 = 0;
  v39 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPFASTUsePAC"), 0, &v47);
  v35 = v47;
  if (v35)
    goto LABEL_52;
  v46 = 0;
  v40 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPFASTProvisionPAC"), 0, &v46);
  v35 = v46;
  if (v35)
    goto LABEL_52;
  v45 = 0;
  v42 = (id)objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("EAPFASTProvisionPACAnonymously"), 0, &v45);
  v10 = v45;
LABEL_27:
  if (v10)
  {
LABEL_28:
    v11 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "count"))
  {
    v28 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      -[MCPayload friendlyName](self, "friendlyName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v30;
      v65 = 2114;
      v66 = v6;
      _os_log_impl(&dword_19ECC4000, v29, OS_LOG_TYPE_DEFAULT, "Payload “%{public}@” contains unexpected fields in EAP Configuration. They are: %{public}@", buf, 0x16u);

    }
  }
  v10 = 0;
  v11 = 1;
LABEL_7:
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v11;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  NSString *interface;
  NSArray *setupModes;
  NSString *certificateUUID;
  NSDictionary *eapClientConfiguration;
  void *v9;
  void *v10;
  NSArray *payloadCertificateAnchorUUIDs;
  NSDictionary *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MCGlobalEthernetPayload;
  -[MCPayload stubDictionary](&v17, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  interface = self->_interface;
  if (interface)
    objc_msgSend(v3, "setObject:forKey:", interface, CFSTR("Interface"));
  setupModes = self->_setupModes;
  if (setupModes)
    objc_msgSend(v4, "setObject:forKey:", setupModes, CFSTR("SetupModes"));
  certificateUUID = self->_certificateUUID;
  if (certificateUUID)
    objc_msgSend(v4, "setObject:forKey:", certificateUUID, CFSTR("PayloadCertificateUUID"));
  eapClientConfiguration = self->_eapClientConfiguration;
  if (eapClientConfiguration)
  {
    v9 = (void *)-[NSDictionary mutableCopy](eapClientConfiguration, "mutableCopy");
    v10 = v9;
    payloadCertificateAnchorUUIDs = self->_payloadCertificateAnchorUUIDs;
    if (payloadCertificateAnchorUUIDs)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", payloadCertificateAnchorUUIDs, CFSTR("PayloadCertificateAnchorUUID"));
    v12 = self->_eapClientConfiguration;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__MCGlobalEthernetPayload_stubDictionary__block_invoke;
    v15[3] = &unk_1E41E34E0;
    v16 = v10;
    v13 = v10;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", v15);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("EAPClientConfiguration"));

  }
  return v4;
}

void __41__MCGlobalEthernetPayload_stubDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  +[MCGlobalEthernetPayload nonPrivateEAPKeys](MCGlobalEthernetPayload, "nonPrivateEAPKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v5);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", CFSTR("(present)"), v5);

}

+ (id)nonPrivateEAPKeys
{
  if (nonPrivateEAPKeys_onceToken != -1)
    dispatch_once(&nonPrivateEAPKeys_onceToken, &__block_literal_global_28);
  return (id)nonPrivateEAPKeys_keys;
}

void __44__MCGlobalEthernetPayload_nonPrivateEAPKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[12];

  v4[11] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("AcceptEAPTypes");
  v4[1] = CFSTR("PayloadCertificateAnchorUUID");
  v4[2] = CFSTR("TLSTrustedCertificates");
  v4[3] = CFSTR("TLSTrustedServerNames");
  v4[4] = CFSTR("TLSCertificateIsRequired");
  v4[5] = CFSTR("TTLSInnerAuthentication");
  v4[6] = CFSTR("TLSMinimumVersion");
  v4[7] = CFSTR("TLSMaximumVersion");
  v4[8] = CFSTR("EAPFASTUsePAC");
  v4[9] = CFSTR("EAPFASTProvisionPAC");
  v4[10] = CFSTR("EAPFASTProvisionPACAnonymously");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 11);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)nonPrivateEAPKeys_keys;
  nonPrivateEAPKeys_keys = v2;

}

- (id)eapSettingsSection
{
  void *v3;
  void *v4;
  void *v5;
  MCKeyValue *v6;
  void *v7;
  void *v8;
  MCKeyValue *v9;
  void *v10;
  MCKeyValue *v11;
  void *v12;
  void *v13;
  MCKeyValue *v14;
  void *v15;
  MCKeyValue *v16;
  void *v17;
  void *v18;
  MCKeyValue *v19;
  void *v20;
  uint64_t v21;
  MCKeyValue *v22;
  void *v23;
  void *v24;
  MCKeyValue *v25;
  void *v26;
  MCKeyValue *v27;
  void *v28;
  void *v29;
  MCKeyValue *v30;
  void *v31;
  MCKeyValue *v32;
  void *v33;
  MCKeyValue *v34;
  void *v35;
  MCKeyValue *v36;
  void *v37;
  MCKeyValue *v38;

  v3 = (void *)objc_opt_new();
  -[NSDictionary objectForKey:](self->_eapClientConfiguration, "objectForKey:", CFSTR("UserName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v6 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("GLOBAL_ETHERNET_EAP_USERNAME"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MCKeyValue initWithLocalizedString:localizedKey:](v6, "initWithLocalizedString:localizedKey:", v7, v8);

    objc_msgSend(v3, "addObject:", v9);
  }
  -[NSDictionary objectForKey:](self->_eapClientConfiguration, "objectForKey:", CFSTR("UserPassword"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "length"))
  {
    v11 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("GLOBAL_ETHERNET_EAP_PASSWORD"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MCKeyValue initWithLocalizedString:localizedKey:](v11, "initWithLocalizedString:localizedKey:", v12, v13);

    objc_msgSend(v3, "addObject:", v14);
  }
  -[MCGlobalEthernetPayload certificateUUID](self, "certificateUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("GLOBAL_ETHERNET_EAP_IDENTITY"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MCKeyValue initWithLocalizedString:localizedKey:](v16, "initWithLocalizedString:localizedKey:", v17, v18);

    objc_msgSend(v3, "addObject:", v19);
  }
  -[MCGlobalEthernetPayload payloadCertificateAnchorUUIDs](self, "payloadCertificateAnchorUUIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v22 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("GLOBAL_ETHERNET_EAP_TRUSTED_SERVER_CERTS"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MCKeyValue initWithLocalizedString:localizedKey:](v22, "initWithLocalizedString:localizedKey:", v23, v24);

    objc_msgSend(v3, "addObject:", v25);
  }
  -[NSDictionary objectForKey:](self->_eapClientConfiguration, "objectForKey:", CFSTR("TLSTrustedServerNames"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "count"))
  {
    v27 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("PRESENT"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    MCLocalizedString(CFSTR("GLOBAL_ETHERNET_EAP_TRUSTED_SERVER_NAMES"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[MCKeyValue initWithLocalizedString:localizedKey:](v27, "initWithLocalizedString:localizedKey:", v28, v29);

    objc_msgSend(v3, "addObject:", v30);
  }
  -[NSDictionary objectForKey:](self->_eapClientConfiguration, "objectForKey:", CFSTR("TLSMinimumVersion"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("GLOBAL_ETHERNET_EAP_TLS_MIN_VERSION"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MCKeyValue initWithLocalizedString:localizedKey:](v32, "initWithLocalizedString:localizedKey:", v31, v33);

    objc_msgSend(v3, "addObject:", v34);
  }
  -[NSDictionary objectForKey:](self->_eapClientConfiguration, "objectForKey:", CFSTR("TLSMaximumVersion"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("GLOBAL_ETHERNET_EAP_TLS_MAX_VERSION"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[MCKeyValue initWithLocalizedString:localizedKey:](v36, "initWithLocalizedString:localizedKey:", v35, v37);

    objc_msgSend(v3, "addObject:", v38);
  }

  return v3;
}

- (id)payloadDescriptionKeyValueSections
{
  void *v3;
  void *v4;
  MCKeyValue *v5;
  void *v6;
  MCKeyValue *v7;
  NSDictionary *eapClientConfiguration;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  int v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  if (-[MCGlobalEthernetPayload isSystemMode](self, "isSystemMode"))
  {
    v5 = [MCKeyValue alloc];
    MCLocalizedString(CFSTR("GLOBAL_ETHERNET_SETUP_MODE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MCKeyValue initWithLocalizedString:localizedKey:](v5, "initWithLocalizedString:localizedKey:", CFSTR("System"), v6);

    objc_msgSend(v4, "addObject:", v7);
  }
  eapClientConfiguration = self->_eapClientConfiguration;
  if (eapClientConfiguration)
  {
    -[NSDictionary allKeys](eapClientConfiguration, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      -[MCGlobalEthernetPayload eapSettingsSection](self, "eapSettingsSection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
        objc_msgSend(v4, "addObjectsFromArray:", v11);

    }
  }
  if (objc_msgSend(v4, "count"))
  {
    +[MCKeyValueSection sectionWithKeyValues:](MCKeyValueSection, "sectionWithKeyValues:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  -[MCGlobalEthernetPayload eapTypes](self, "eapTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[MCGlobalEthernetPayload eapTypes](self, "eapTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (!v17)
      goto LABEL_29;
    v18 = v17;
    v19 = *(_QWORD *)v27;
    while (1)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "intValue");
        if (v21 <= 20)
        {
          v22 = CFSTR("EAP-TLS");
          if (v21 == 13)
            goto LABEL_27;
          if (v21 == 17)
          {
            v22 = CFSTR("LEAP");
            goto LABEL_27;
          }
        }
        else
        {
          switch(v21)
          {
            case 21:
              v22 = CFSTR("EAP-TTLS");
              goto LABEL_27;
            case 43:
              v22 = CFSTR("EAP-FAST");
              goto LABEL_27;
            case 25:
              v22 = CFSTR("PEAP");
              goto LABEL_27;
          }
        }
        v22 = CFSTR("Unknown");
LABEL_27:
        objc_msgSend(v15, "addObject:", v22);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v18)
      {
LABEL_29:

        MCLocalizedString(CFSTR("GLOBAL_ETHERNET_EAP_TYPES"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[MCKeyValueSection sectionWithLocalizedArray:title:footer:](MCKeyValueSection, "sectionWithLocalizedArray:title:footer:", v15, v23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "addObject:", v24);
        break;
      }
    }
  }
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v15.receiver = self;
  v15.super_class = (Class)MCGlobalEthernetPayload;
  -[MCPayload verboseDescription](&v15, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MCGlobalEthernetPayload isSystemMode](self, "isSystemMode"))
    objc_msgSend(v5, "appendString:", CFSTR("Setup Mode : System\n"));
  -[MCGlobalEthernetPayload interface](self, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCGlobalEthernetPayload interface](self, "interface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Interface : %@\n"), v7);

  }
  -[MCPayload displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MCPayload displayName](self, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Display Name : %@\n"), v9);

  }
  -[MCPayload description](self, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCPayload description](self, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Description: %@\n"), v11);

  }
  -[MCGlobalEthernetPayload eapClientConfiguration](self, "eapClientConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MCGlobalEthernetPayload eapClientConfiguration](self, "eapClientConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("EAP Configuration : %@\n"), v13);

  }
  return v5;
}

- (NSDictionary)eapClientConfiguration
{
  return self->_eapClientConfiguration;
}

- (void)setEapClientConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_eapClientConfiguration, a3);
}

- (NSString)certificateUUID
{
  return self->_certificateUUID;
}

- (void)setCertificateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_certificateUUID, a3);
}

- (NSArray)payloadCertificateAnchorUUIDs
{
  return self->_payloadCertificateAnchorUUIDs;
}

- (void)setPayloadCertificateAnchorUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_payloadCertificateAnchorUUIDs, a3);
}

- (BOOL)passwordRequired
{
  return self->_passwordRequired;
}

- (void)setPasswordRequired:(BOOL)a3
{
  self->_passwordRequired = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (BOOL)usernameRequired
{
  return self->_usernameRequired;
}

- (void)setUsernameRequired:(BOOL)a3
{
  self->_usernameRequired = a3;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSString)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (NSArray)setupModes
{
  return self->_setupModes;
}

- (void)setSetupModes:(id)a3
{
  objc_storeStrong((id *)&self->_setupModes, a3);
}

- (BOOL)isSystemMode
{
  return self->_isSystemMode;
}

- (void)setIsSystemMode:(BOOL)a3
{
  self->_isSystemMode = a3;
}

- (NSArray)eapTypes
{
  return self->_eapTypes;
}

- (void)setEapTypes:(id)a3
{
  objc_storeStrong((id *)&self->_eapTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eapTypes, 0);
  objc_storeStrong((id *)&self->_setupModes, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_payloadCertificateAnchorUUIDs, 0);
  objc_storeStrong((id *)&self->_certificateUUID, 0);
  objc_storeStrong((id *)&self->_eapClientConfiguration, 0);
}

@end
