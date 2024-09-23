@implementation MCCertificatePayload

- (MCCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCCertificatePayload *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSString *installedOnDeviceID;
  uint64_t v25;
  NSNumber *isIdentity;
  uint64_t v27;
  NSNumber *isRoot;
  uint64_t v29;
  NSNumber *expiryInterval;
  uint64_t v31;
  NSString *certSubject;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v41;
  NSString *certIssuer;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v49.receiver = self;
  v49.super_class = (Class)MCCertificatePayload;
  v10 = -[MCPayload initWithDictionary:profile:outError:](&v49, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10 || !objc_msgSend(v9, "isStub"))
    goto LABEL_21;
  objc_msgSend(v8, "objectForKey:", CFSTR("PERSISTENT_REF"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&v10->_certificatePersistentID, v11);
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("PERSISTENT_REF"));
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      MCErrorArray(CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), v13, v14, v15, v16, v17, v18, v19, CFSTR("PERSISTENT_REF"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1003, v21, CFSTR("MCFatalError"));
      v22 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "removeObjectForKey:", CFSTR("PERSISTENT_REF"));
      if (v22)
        goto LABEL_15;
    }
  }
  v48 = 0;
  +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("UDID"), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v48);
  v23 = objc_claimAutoreleasedReturnValue();
  v22 = v48;
  installedOnDeviceID = v10->_installedOnDeviceID;
  v10->_installedOnDeviceID = (NSString *)v23;

  if (!v22)
  {
    v47 = 0;
    +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("IsIdentity"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v47);
    v25 = objc_claimAutoreleasedReturnValue();
    v22 = v47;
    isIdentity = v10->_isIdentity;
    v10->_isIdentity = (NSNumber *)v25;

    if (!v22)
    {
      v46 = 0;
      +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("IsRoot"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v46);
      v27 = objc_claimAutoreleasedReturnValue();
      v22 = v46;
      isRoot = v10->_isRoot;
      v10->_isRoot = (NSNumber *)v27;

      if (!v22)
      {
        v45 = 0;
        +[MCProfile removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalObjectInDictionary:key:type:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Expiry"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v45);
        v29 = objc_claimAutoreleasedReturnValue();
        v22 = v45;
        expiryInterval = v10->_expiryInterval;
        v10->_expiryInterval = (NSNumber *)v29;

        if (!v22)
        {
          v44 = 0;
          +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("CertSubject"), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v44);
          v31 = objc_claimAutoreleasedReturnValue();
          v22 = v44;
          certSubject = v10->_certSubject;
          v10->_certSubject = (NSString *)v31;

          if (!v22)
          {
            v43 = 0;
            +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Issuer"), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v43);
            v41 = objc_claimAutoreleasedReturnValue();
            v22 = v43;
            certIssuer = v10->_certIssuer;
            v10->_certIssuer = (NSString *)v41;

            if (!v22)
              goto LABEL_21;
            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_15:

LABEL_16:
  -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v22);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (a5)
    *a5 = objc_retainAutorelease(v33);
  v35 = (void *)_MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
  {
    v36 = v35;
    v37 = (void *)objc_opt_class();
    v38 = v37;
    objc_msgSend(v34, "MCVerboseDescription");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v37;
    v52 = 2114;
    v53 = v39;
    _os_log_impl(&dword_19ECC4000, v36, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

  }
  v10 = 0;
LABEL_21:

  return v10;
}

- (BOOL)isSigned
{
  return 1;
}

- (id)stubDictionary
{
  void *v3;
  void *v4;
  __SecCertificate *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MCCertificatePayload;
  -[MCPayload stubDictionary](&v16, sel_stubDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCSetObjectIfNotNil:forKey:", self->_certificatePersistentID, CFSTR("PERSISTENT_REF"));
  MCGestaltGetDeviceUUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("UDID"));

  v5 = -[MCCertificatePayload copyCertificate](self, "copyCertificate");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCCertificatePayload isIdentity](self, "isIdentity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("IsIdentity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MCCertificatePayload isRoot](self, "isRoot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("IsRoot"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[MCCertificatePayload expiry](self, "expiry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("Expiry"));

  if (v5)
  {
    v11 = (__CFString *)SecCertificateCopySubjectSummary(v5);
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("CertSubject"));
    }
    else
    {
      MCLocalizedString(CFSTR("CERTIFICATE_UNKNOWN_SUMMARY"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("CertSubject"));

    }
    v13 = (void *)SecCertificateCopyIssuerSummary();
    if (v13)
    {
      objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("Issuer"));
    }
    else
    {
      MCLocalizedString(CFSTR("CERTIFICATE_UNKNOWN_ISSUER"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("Issuer"));

    }
    CFRelease(v5);
  }
  return v3;
}

- (__SecCertificate)copyCertificate
{
  NSData *certificatePersistentID;
  __SecCertificate *result;

  certificatePersistentID = self->_certificatePersistentID;
  if (!certificatePersistentID)
    return 0;
  result = +[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:](MCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:", certificatePersistentID, 1);
  if (!result)
    return +[MCKeychain copyCertificateWithPersistentID:useSystemKeychain:](MCKeychain, "copyCertificateWithPersistentID:useSystemKeychain:", self->_certificatePersistentID, 0);
  return result;
}

- (__SecIdentity)copyIdentityFromKeychain
{
  NSData *certificatePersistentID;
  __SecIdentity *result;

  certificatePersistentID = self->_certificatePersistentID;
  if (!certificatePersistentID)
    return 0;
  result = +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", certificatePersistentID, 1);
  if (!result)
    return +[MCKeychain copyIdentityWithPersistentID:useSystemKeychain:](MCKeychain, "copyIdentityWithPersistentID:useSystemKeychain:", self->_certificatePersistentID, 0);
  return result;
}

- (BOOL)isRoot
{
  void *v3;
  NSNumber *isRoot;
  __SecCertificate *v5;
  __SecCertificate *v6;
  char IsSelfSignedCA;

  -[MCPayload profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isStub"))
  {
    isRoot = self->_isRoot;

    if (isRoot)
    {
      LOBYTE(v5) = -[NSNumber BOOLValue](self->_isRoot, "BOOLValue");
      return (char)v5;
    }
  }
  else
  {

  }
  v5 = -[MCCertificatePayload copyCertificate](self, "copyCertificate");
  if (v5)
  {
    v6 = v5;
    IsSelfSignedCA = SecCertificateIsSelfSignedCA();
    CFRelease(v6);
    LOBYTE(v5) = IsSelfSignedCA;
  }
  return (char)v5;
}

- (BOOL)isFullyTrustedRootCert
{
  __SecCertificate *v2;
  __SecCertificate *v3;

  v2 = -[MCCertificatePayload copyCertificate](self, "copyCertificate");
  if (v2)
  {
    v3 = v2;
    if (SecCertificateIsSelfSignedCA())
    {
      SecTrustStoreForDomain();
      SecTrustStoreCopyUsageConstraints();
    }
    CFRelease(v3);
  }
  return 0;
}

- (BOOL)isIdentity
{
  void *v3;
  NSNumber *isIdentity;
  __SecIdentity *v5;

  -[MCPayload profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isStub"))
  {
    isIdentity = self->_isIdentity;

    if (isIdentity)
    {
      LOBYTE(v5) = -[NSNumber BOOLValue](self->_isIdentity, "BOOLValue");
      return (char)v5;
    }
  }
  else
  {

  }
  v5 = -[MCCertificatePayload copyIdentityFromKeychain](self, "copyIdentityFromKeychain");
  if (v5)
  {
    CFRelease(v5);
    LOBYTE(v5) = 1;
  }
  return (char)v5;
}

- (BOOL)isMDMClientIdentity
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MCPayload profile](self, "profile", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "identityUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCPayload UUID](self, "UUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v11, "isEqualToString:", v12);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSString)SMIMEEmailAddress
{
  __SecCertificate *v2;
  __SecCertificate *v3;
  CFDataRef v4;
  const __CFArray *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  void *v9;
  CFRange v11;

  v2 = -[MCCertificatePayload copyCertificate](self, "copyCertificate");
  if (v2)
  {
    v3 = v2;
    v4 = CFDataCreate(0, SMIMEEmailAddress_emailProtectionOID, 8);
    v5 = (const __CFArray *)SecCertificateCopyExtendedKeyUsage();
    if (v5)
    {
      v6 = v5;
      v11.length = CFArrayGetCount(v5);
      v11.location = 0;
      if (CFArrayContainsValue(v6, v11, v4) && (v7 = (const __CFArray *)SecCertificateCopyRFC822Names()) != 0)
      {
        v8 = v7;
        if (CFArrayGetCount(v7) == 1)
        {
          CFArrayGetValueAtIndex(v8, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        CFRelease(v8);
      }
      else
      {
        v9 = 0;
      }
      CFRelease(v6);
      if (!v4)
        goto LABEL_15;
    }
    else
    {
      v9 = 0;
      if (!v4)
        goto LABEL_15;
    }
    CFRelease(v4);
LABEL_15:
    CFRelease(v3);
    return (NSString *)v9;
  }
  v9 = 0;
  return (NSString *)v9;
}

- (BOOL)isHardwareBound
{
  return 0;
}

- (id)title
{
  void *v3;
  char v4;
  void *v5;
  objc_super v7;

  if (-[MCCertificatePayload isIdentity](self, "isIdentity")
    && (-[MCPayload profile](self, "profile"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isStub"),
        v3,
        (v4 & 1) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)MCCertificatePayload;
    -[MCPayload title](&v7, sel_title);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MCCertificatePayload certificateSubject](self, "certificateSubject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)subtitle1Label
{
  void *v3;
  int v4;
  void *v5;

  if (-[MCCertificatePayload isIdentity](self, "isIdentity")
    && (-[MCPayload profile](self, "profile"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isStub"),
        v3,
        !v4))
  {
    v5 = 0;
  }
  else
  {
    MCLocalizedString(CFSTR("ISSUED_BY_COLON"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)subtitle1Description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
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

    if ((v7 & 1) != 0)
      v8 = CFSTR("ISSUED_BY_MISSING");
    else
      v8 = CFSTR("IDENTITY_CERTIFICATE_INSTALL_DESCRIPTION");
    MCLocalizedString(v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v5;

  return v9;
}

- (id)subtitle2Label
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;

  if (-[MCCertificatePayload isIdentity](self, "isIdentity")
    && (-[MCPayload profile](self, "profile"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isStub"),
        v3,
        !v4))
  {
    v10 = 0;
  }
  else
  {
    -[MCCertificatePayload subtitle2Description](self, "subtitle2Description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MCCertificatePayload expiry](self, "expiry");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "earlierDate:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 == v6)
          v9 = CFSTR("EXPIRED_COLON");
        else
          v9 = CFSTR("EXPIRES_COLON");
        MCLocalizedString(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      MCLocalizedString(CFSTR("EXPIRATION_DATE_MISSING"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v10;
}

- (id)subtitle2Description
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  if (-[MCCertificatePayload isIdentity](self, "isIdentity")
    && (-[MCPayload profile](self, "profile"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isStub"),
        v3,
        !v4))
  {
    v8 = 0;
  }
  else
  {
    -[MCCertificatePayload expiry](self, "expiry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLocale:", v7);

      objc_msgSend(v6, "setDateStyle:", 3);
      objc_msgSend(v6, "setTimeStyle:", 0);
      objc_msgSend(v6, "stringFromDate:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
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
  __SecIdentity *v13;
  __SecIdentity *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v19.receiver = self;
  v19.super_class = (Class)MCCertificatePayload;
  -[MCPayload verboseDescription](&v19, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCCertificatePayload installedOnDeviceID](self, "installedOnDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCCertificatePayload installedOnDeviceID](self, "installedOnDeviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("DeviceID    : %@\n"), v7);

  }
  -[MCCertificatePayload certificatePersistentID](self, "certificatePersistentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "MCHexString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MCCertificatePayload certificatePersistentID](self, "certificatePersistentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MCHexString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Persist ID  : %@\n"), v11);

  }
  MCStringForBool(-[MCCertificatePayload isIdentity](self, "isIdentity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Is identity : %@\n"), v12);

  v13 = -[MCCertificatePayload copyIdentityFromKeychain](self, "copyIdentityFromKeychain");
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v5, "appendFormat:", CFSTR("Private key : Present\n"));
    CFRelease(v14);
  }
  MCStringForBool(-[MCCertificatePayload isRoot](self, "isRoot"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Is root cert: %@\n"), v15);

  -[MCCertificatePayload expiry](self, "expiry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MCCertificatePayload expiry](self, "expiry");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Expires     : %@\n"), v17);

  }
  return v5;
}

- (NSDate)expiry
{
  void *v3;
  NSNumber *expiryInterval;
  void *v5;
  void *v6;
  __SecCertificate *v7;
  __SecCertificate *v8;

  -[MCPayload profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isStub"))
  {
    expiryInterval = self->_expiryInterval;

    if (expiryInterval)
    {
      v5 = (void *)MEMORY[0x1E0C99D68];
      -[NSNumber doubleValue](self->_expiryInterval, "doubleValue");
      objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSDate *)v6;
    }
  }
  else
  {

  }
  v7 = -[MCCertificatePayload copyCertificate](self, "copyCertificate");
  if (v7)
  {
    v8 = v7;
    SecCertificateNotValidAfter();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v8);
  }
  else
  {
    v6 = 0;
  }
  return (NSDate *)v6;
}

- (id)certificateSubject
{
  void *v3;
  NSString *certSubject;
  __CFString *v5;
  __SecCertificate *v6;
  __SecCertificate *v7;

  -[MCPayload profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isStub"))
  {
    certSubject = self->_certSubject;

    if (certSubject)
    {
      v5 = self->_certSubject;
      return v5;
    }
  }
  else
  {

  }
  v6 = -[MCCertificatePayload copyCertificate](self, "copyCertificate");
  if (v6)
  {
    v7 = v6;
    v5 = (__CFString *)SecCertificateCopySubjectSummary(v6);
    CFRelease(v7);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)issuer
{
  void *v3;
  NSString *certIssuer;
  NSString *v5;
  __SecCertificate *v6;
  __SecCertificate *v7;

  -[MCPayload profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isStub"))
  {
    certIssuer = self->_certIssuer;

    if (certIssuer)
    {
      v5 = self->_certIssuer;
      return v5;
    }
  }
  else
  {

  }
  v6 = -[MCCertificatePayload copyCertificate](self, "copyCertificate");
  if (v6)
  {
    v7 = v6;
    v5 = (NSString *)SecCertificateCopyIssuerSummary();
    CFRelease(v7);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (NSData)certificatePersistentID
{
  return self->_certificatePersistentID;
}

- (void)setCertificatePersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_certificatePersistentID, a3);
}

- (NSString)installedOnDeviceID
{
  return self->_installedOnDeviceID;
}

- (void)setInstalledOnDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certIssuer, 0);
  objc_storeStrong((id *)&self->_certSubject, 0);
  objc_storeStrong((id *)&self->_expiryInterval, 0);
  objc_storeStrong((id *)&self->_isRoot, 0);
  objc_storeStrong((id *)&self->_isIdentity, 0);
  objc_storeStrong((id *)&self->_installedOnDeviceID, 0);
  objc_storeStrong((id *)&self->_certificatePersistentID, 0);
}

@end
