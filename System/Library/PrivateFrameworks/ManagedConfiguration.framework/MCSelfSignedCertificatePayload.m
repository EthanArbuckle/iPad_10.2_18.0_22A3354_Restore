@implementation MCSelfSignedCertificatePayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.security.selfsignedcertificate"));
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

  return MCLocalizedFormat(CFSTR("SELF_SIGNED_CERTIFICATE_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("SELF_SIGNED_CERTIFICATE_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)validateExtendedKeyUsage:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (!v4)
  {
    v16 = 0;
    goto LABEL_29;
  }
  v5 = v4;
  v6 = *(_QWORD *)v24;
LABEL_3:
  v7 = 0;
LABEL_4:
  if (*(_QWORD *)v24 != v6)
    objc_enumerationMutation(v3);
  v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("ExtendedKeyUsage"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    v9 = v8;
    if (!objc_msgSend(v9, "count"))
      goto LABEL_30;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v9;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (!v10)
      goto LABEL_20;
    v11 = v10;
    v12 = *(_QWORD *)v20;
    v18 = v6;
LABEL_13:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      v15 = v14;
      if (!objc_msgSend(v15, "length"))
      {
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("ExtendedKeyUsage"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_27;
      }

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        v6 = v18;
        if (v11)
          goto LABEL_13;
LABEL_20:

LABEL_21:
        if (++v7 == v5)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          v16 = 0;
          if (!v5)
            goto LABEL_29;
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
    +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("ExtendedKeyUsage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

    goto LABEL_28;
  }
  v9 = v8;
  if (objc_msgSend(v9, "length"))
    goto LABEL_21;
LABEL_30:
  +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("ExtendedKeyUsage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

LABEL_29:
  return v16;
}

- (MCSelfSignedCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCSelfSignedCertificatePayload *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;
  NSString *keyType;
  void *v23;
  id v24;
  void *v25;
  unsigned int v26;
  NSArray *extendedKeyUsage;
  void *v28;
  uint64_t v29;
  unint64_t keySize;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v44.receiver = self;
  v44.super_class = (Class)MCSelfSignedCertificatePayload;
  v10 = -[MCCertificatePayload initWithDictionary:profile:outError:](&v44, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (v10)
  {
    v43 = 0;
    +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("HardwareBound"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1002, CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v43);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v43;
    if (v12)
      goto LABEL_3;
    v10->_isHardwareBound = objc_msgSend(v11, "BOOLValue");
    if ((objc_msgSend(v9, "isStub") & 1) != 0)
    {
LABEL_9:

      goto LABEL_10;
    }
    v42 = 0;
    +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("KeyType"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1002, CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v42);
    v21 = objc_claimAutoreleasedReturnValue();
    v12 = v42;
    keyType = v10->_keyType;
    v10->_keyType = (NSString *)v21;

    if (v12)
    {
LABEL_3:

      v11 = v12;
LABEL_4:
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      v15 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = (void *)objc_opt_class();
        v18 = v17;
        objc_msgSend(v14, "MCVerboseDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v17;
        v47 = 2114;
        v48 = v19;
        _os_log_impl(&dword_19ECC4000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
      goto LABEL_9;
    }
    if (!-[NSString isEqualToString:](v10->_keyType, "isEqualToString:", CFSTR("RSA"))
      && !-[NSString isEqualToString:](v10->_keyType, "isEqualToString:", CFSTR("ECSECPrimeRandom")))
    {
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("KeyType"));
      v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

      v11 = v24;
      if (!v24)
        goto LABEL_10;
      goto LABEL_4;
    }
    v41 = 0;
    +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("KeySize"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1002, CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v41);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v41;
    if (v24)
    {
LABEL_18:

      goto LABEL_20;
    }
    v37 = v23;
    v10->_keySize = objc_msgSend(v23, "unsignedIntegerValue");
    v40 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("KeyUsage"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v40);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v40;
    if (v24)
    {
LABEL_17:

      v23 = v37;
      goto LABEL_18;
    }
    if (v25)
    {
      v26 = objc_msgSend(v25, "unsignedIntValue");
      v10->_keyUsage = v26;
      if ((v26 & 0xFFFFFFFA) != 0)
      {
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("KeyUsage"));
        v24 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    else
    {
      v25 = 0;
      v10->_keyUsage = 1;
    }
    v39 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("ExtendedKeyUsage"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v39);
    v36 = objc_claimAutoreleasedReturnValue();
    v24 = v39;
    extendedKeyUsage = v10->_extendedKeyUsage;
    v10->_extendedKeyUsage = (NSArray *)v36;

    if (v24)
      goto LABEL_17;
    -[MCSelfSignedCertificatePayload validateExtendedKeyUsage:](v10, "validateExtendedKeyUsage:", v10->_extendedKeyUsage);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (v24)
      goto LABEL_17;
    v38 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Lifetime"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v38);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v38;
    if (v24)
    {
LABEL_53:

      goto LABEL_17;
    }
    if (v28)
      v29 = objc_msgSend(v28, "unsignedIntegerValue");
    else
      v29 = 315576000;
    v10->_lifetime = v29;
    if (v10->_isHardwareBound)
    {
      if (!-[NSString isEqualToString:](v10->_keyType, "isEqualToString:", CFSTR("ECSECPrimeRandom")))
      {
        v31 = CFSTR("KeyType");
        goto LABEL_40;
      }
      if ((v10->_keySize | 0x80) != 0x180)
      {
LABEL_38:
        v31 = CFSTR("KeySize");
LABEL_40:
        +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", v31);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_53;
      }
    }
    if (-[NSString isEqualToString:](v10->_keyType, "isEqualToString:", CFSTR("RSA")))
    {
      keySize = v10->_keySize;
      if ((keySize & 7) != 0 || keySize - 4097 <= 0xFFFFFFFFFFFFF3FELL)
        goto LABEL_38;
    }
    else if (-[NSString isEqualToString:](v10->_keyType, "isEqualToString:", CFSTR("ECSECPrimeRandom")))
    {
      v32 = v10->_keySize;
      if (v32 > 383)
      {
        if (v32 == 384 || v32 == 521)
          goto LABEL_49;
      }
      else if (v32 == 192 || v32 == 256)
      {
        goto LABEL_49;
      }
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", CFSTR("KeySize"));
      v24 = (id)objc_claimAutoreleasedReturnValue();
      if (v24)
        goto LABEL_53;
    }
LABEL_49:
    if (objc_msgSend(v8, "count"))
    {
      v33 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v34 = v33;
        -[MCPayload friendlyName](v10, "friendlyName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v35;
        v47 = 2114;
        v48 = v8;
        _os_log_impl(&dword_19ECC4000, v34, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);

      }
    }
    v24 = 0;
    goto LABEL_53;
  }
LABEL_10:

  return v10;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCSelfSignedCertificatePayload;
  -[MCCertificatePayload stubDictionary](&v6, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isHardwareBound);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("HardwareBound"));

  return v3;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __SecCertificate *v7;
  __SecCertificate *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v10.receiver = self;
  v10.super_class = (Class)MCSelfSignedCertificatePayload;
  -[MCCertificatePayload verboseDescription](&v10, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isHardwareBound)
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  objc_msgSend(v5, "appendFormat:", CFSTR("Hardware bound : %@\n"), v6);
  v7 = -[MCCertificatePayload copyCertificate](self, "copyCertificate");
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v5, "appendFormat:", CFSTR("Identity       : Present\n"));
    CFRelease(v8);
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("Identity       : Missing\n"));
  }
  return v5;
}

- (id)subtitle1Description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;

  -[MCCertificatePayload issuer](self, "issuer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MCPayload profile](self, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isStub");

    if (v7)
      v8 = CFSTR("ISSUED_BY_MISSING");
    else
      v8 = CFSTR("IDENTITY_INSTALL_DESCRIPTION_UNKNOWN");
    MCLocalizedString(v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v5;

  return v9;
}

- (id)persistentResourceID
{
  void *v2;
  void *v3;

  -[MCCertificatePayload certificatePersistentID](self, "certificatePersistentID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MCHexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isRoot
{
  return 0;
}

- (BOOL)isIdentity
{
  return 1;
}

- (BOOL)isHardwareBound
{
  return self->_isHardwareBound;
}

- (NSString)keyType
{
  return self->_keyType;
}

- (unint64_t)keySize
{
  return self->_keySize;
}

- (unsigned)keyUsage
{
  return self->_keyUsage;
}

- (NSArray)extendedKeyUsage
{
  return self->_extendedKeyUsage;
}

- (unint64_t)lifetime
{
  return self->_lifetime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedKeyUsage, 0);
  objc_storeStrong((id *)&self->_keyType, 0);
}

@end
