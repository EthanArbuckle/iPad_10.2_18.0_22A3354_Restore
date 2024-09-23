@implementation MCPlainCertificatePayload

+ (id)typeStrings
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.security.root");
  v3[1] = CFSTR("com.apple.security.pkcs12");
  v3[2] = CFSTR("com.apple.security.pkcs1");
  v3[3] = CFSTR("com.apple.security.pem");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
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

  return MCLocalizedFormat(CFSTR("CERTIFICATE_DESCRIPTION_SINGULAR_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return MCLocalizedFormat(CFSTR("CERTIFICATE_DESCRIPTION_PLURAL_FORMAT"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCPlainCertificatePayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  MCPlainCertificatePayload *v10;
  uint64_t v11;
  id v12;
  NSData *certificateData;
  void *v14;
  int v15;
  uint64_t v16;
  NSString *password;
  uint64_t v18;
  NSString *certificateFileName;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MCPlainCertificatePayload;
  v10 = -[MCCertificatePayload initWithDictionary:profile:outError:](&v34, sel_initWithDictionary_profile_outError_, v8, v9, a5);
  if (!v10)
    goto LABEL_19;
  if (!objc_msgSend(v9, "isStub"))
  {
    v33 = 0;
    +[MCProfile removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeRequiredObjectInDictionary:key:type:errorDomain:missingDataCode:missingDataErrorString:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadContent"), objc_opt_class(), CFSTR("MCProfileErrorDomain"), 1002, CFSTR("ERROR_PROFILE_REQUIRED_FIELD_MISSING_P_FIELD"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v33);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v33;
    certificateData = v10->_certificateData;
    v10->_certificateData = (NSData *)v11;

    -[MCPayload type](v10, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.security.pkcs12"));

    if (v15)
    {
      v10->_dataEncoding = 1;
      if (v12)
        goto LABEL_9;
      v32 = 0;
      +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("Password"), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v32);
      v16 = objc_claimAutoreleasedReturnValue();
      v12 = v32;
      password = v10->_password;
      v10->_password = (NSString *)v16;

      if (v12)
        goto LABEL_9;
    }
    else
    {
      v10->_dataEncoding = 0;
      if (v12)
        goto LABEL_9;
    }
  }
  v31 = 0;
  +[MCProfile removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:](MCProfile, "removeOptionalNonZeroLengthStringInDictionary:key:errorDomain:invalidDataCode:invalidDataErrorString:outError:", v8, CFSTR("PayloadCertificateFileName"), CFSTR("MCProfileErrorDomain"), 1003, CFSTR("ERROR_PROFILE_FIELD_INVALID_P_FIELD"), &v31);
  v18 = objc_claimAutoreleasedReturnValue();
  v12 = v31;
  certificateFileName = v10->_certificateFileName;
  v10->_certificateFileName = (NSString *)v18;

LABEL_9:
  if (objc_msgSend(v8, "count"))
  {
    v20 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v21 = v20;
      -[MCPayload friendlyName](v10, "friendlyName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v22;
      v37 = 2114;
      v38 = v8;
      _os_log_impl(&dword_19ECC4000, v21, OS_LOG_TYPE_INFO, "Payload “%{public}@” has fields that we are ignoring. They are: %{public}@", buf, 0x16u);

    }
  }
  if (v12)
  {
    -[MCPayload malformedPayloadErrorWithError:](v10, "malformedPayloadErrorWithError:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a5)
      *a5 = objc_retainAutorelease(v23);
    v25 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v26 = v25;
      v27 = (void *)objc_opt_class();
      v28 = v27;
      objc_msgSend(v24, "MCVerboseDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2114;
      v38 = v29;
      _os_log_impl(&dword_19ECC4000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);

    }
    v10 = 0;
  }

LABEL_19:
  return v10;
}

- (BOOL)isSigned
{
  void *v3;
  int dataEncoding;

  -[MCPayload profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isStub") & 1) != 0)
  {

  }
  else
  {
    dataEncoding = self->_dataEncoding;

    if (dataEncoding == 1)
      return 0;
  }
  return 1;
}

- (id)installationWarnings
{
  __SecCertificate *v3;
  __SecCertificate *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  if (-[MCCertificatePayload isRoot](self, "isRoot")
    && (v3 = -[MCPlainCertificatePayload copyCertificate](self, "copyCertificate")) != 0)
  {
    v4 = v3;
    SecTrustStoreForDomain();
    if (SecTrustStoreContains())
    {
      v5 = 0;
    }
    else
    {
      v6 = (void *)SecCertificateCopySubjectSummary(v4);
      if (!v6)
      {
        -[MCPayload friendlyName](self, "friendlyName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[MCPayload profile](self, "profile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "containsPayloadOfClass:", objc_opt_class());
      v9 = (void *)MEMORY[0x1E0C99D20];
      if (v8)
      {
        MCLocalizedString(CFSTR("INSTALL_WARNING_ROOT_CERT_TITLE"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        MCLocalizedFormatByDevice(CFSTR("INSTALL_WARNING_ROOT_CERT_P_CERT"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v6);
      }
      else
      {
        MCLocalizedString(CFSTR("INSTALL_WARNING_UNMANAGED_ROOT_CERT_TITLE"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        MCLocalizedFormatByDevice(CFSTR("INSTALL_WARNING_UNMANAGED_ROOT_CERT_P_CERT"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)v6);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCProfileWarning warningWithLocalizedTitle:localizedBody:isLongForm:](MCProfileWarning, "warningWithLocalizedTitle:localizedBody:isLongForm:", v10, v25, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithObject:", v26);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (__SecCertificate)copyCertificate
{
  __SecCertificate *result;
  int dataEncoding;
  NSString *password;
  const __CFDictionary *v6;
  const __CFDictionary *ValueAtIndex;
  __SecIdentity *Value;
  CFArrayRef items;
  objc_super v10;
  SecCertificateRef certificateRef;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)MCPlainCertificatePayload;
  result = -[MCCertificatePayload copyCertificate](&v10, sel_copyCertificate);
  certificateRef = result;
  if (!result)
  {
    if (!self->_certificateData)
      return 0;
    dataEncoding = self->_dataEncoding;
    if (dataEncoding != 1)
    {
      if (!dataEncoding)
      {
        result = +[MCCrypto copyCertificateRefFromPKCS1Data:](MCCrypto, "copyCertificateRefFromPKCS1Data:");
        if (!result)
          return +[MCCrypto copyCertificateRefFromPEMData:](MCCrypto, "copyCertificateRefFromPEMData:", self->_certificateData);
        return result;
      }
      return 0;
    }
    result = -[NSString length](self->_password, "length");
    if (result)
    {
      items = 0;
      password = self->_password;
      v12 = *MEMORY[0x1E0CD6D58];
      v13[0] = password;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      if (!SecPKCS12Import((CFDataRef)self->_certificateData, v6, &items) && CFArrayGetCount(items) == 1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items, 0);
        Value = (__SecIdentity *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E0CD6D60]);
        SecIdentityCopyCertificate(Value, &certificateRef);
      }
      if (items)
        CFRelease(items);

      return certificateRef;
    }
  }
  return result;
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
  v8.super_class = (Class)MCPlainCertificatePayload;
  -[MCCertificatePayload verboseDescription](&v8, sel_verboseDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_certificateFileName)
    objc_msgSend(v5, "appendFormat:", CFSTR("File name   : %@\n"), self->_certificateFileName);
  if (self->_certificateData)
    objc_msgSend(v5, "appendFormat:", CFSTR("Cert data   : Present\n"));
  MCStringForBool(-[MCCertificatePayload isRoot](self, "isRoot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Is root cert: %@\n"), v6);

  return v5;
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

- (BOOL)isIdentity
{
  void *v3;
  char v4;
  objc_super v6;

  -[MCPayload profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStub");

  if ((v4 & 1) == 0)
    return self->_dataEncoding == 1;
  v6.receiver = self;
  v6.super_class = (Class)MCPlainCertificatePayload;
  return -[MCCertificatePayload isIdentity](&v6, sel_isIdentity);
}

- (NSString)certificateFileName
{
  return self->_certificateFileName;
}

- (int)dataEncoding
{
  return self->_dataEncoding;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_certificateFileName, 0);
}

@end
