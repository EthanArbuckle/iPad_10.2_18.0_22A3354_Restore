@implementation MCWAPIIdentityCertificatePayload

+ (id)typeStrings
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("com.apple.security.wapi-identity"));
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

  return MCLocalizedFormat(CFSTR("WAPI_IDENTITY_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("WAPI_IDENTITY_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCWAPIIdentityCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCWAPIIdentityCertificatePayload *v10;
  id v11;
  uint64_t v12;
  NSData *pemData;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MCWAPIIdentityCertificatePayload;
  v10 = -[MCCertificatePayload initWithDictionary:profile:outError:](&v26, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (v10)
  {
    if ((objc_msgSend(v9, "isStub") & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      v25 = 0;
      +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PEMData"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1002, CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v25);
      v12 = objc_claimAutoreleasedReturnValue();
      v11 = v25;
      pemData = v10->_pemData;
      v10->_pemData = (NSData *)v12;

    }
    if (objc_msgSend(v8, "count"))
    {
      v14 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        -[MCPayload friendlyName](v10, "friendlyName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v16;
        v29 = 2114;
        v30 = v8;
        _os_log_impl(&dword_19ECC4000, v15, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);

      }
    }
    if (v11)
    {
      -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a5)
        *a5 = objc_retainAutorelease(v17);
      v19 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        v21 = (void *)objc_opt_class();
        v22 = v21;
        objc_msgSend(v18, "MCVerboseDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v21;
        v29 = 2114;
        v30 = v23;
        _os_log_impl(&dword_19ECC4000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

      }
      v10 = 0;
    }

  }
  return v10;
}

- (__SecCertificate)copyCertificate
{
  __SecCertificate *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCWAPIIdentityCertificatePayload;
  result = -[MCCertificatePayload copyCertificate](&v4, sel_copyCertificate);
  if (!result)
  {
    if (self->_pemData)
      return +[MCCrypto copyCertificateRefFromPEMData:](MCCrypto, "copyCertificateRefFromPEMData:");
    else
      return 0;
  }
  return result;
}

- (__SecIdentity)copyIdentityFromKeychain
{
  return 0;
}

- (BOOL)isIdentity
{
  return 1;
}

- (id)verboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)MCWAPIIdentityCertificatePayload;
  -[MCCertificatePayload verboseDescription](&v8, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCWAPIIdentityCertificatePayload pemData](self, "pemData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v5, "appendFormat:", CFSTR("PEM Data    : Present\n"));
  return v5;
}

- (NSData)pemData
{
  return self->_pemData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pemData, 0);
}

@end
