@implementation MCCertificateWrapperProfile

- (id)_certificatePayload
{
  void *v2;
  void *v3;

  -[MCConfigurationProfile payloads](self, "payloads");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (MCCertificateWrapperProfile)initWithDictionary:(id)a3 signerCerts:(id)a4 allowEmptyPayload:(BOOL)a5 outError:(id *)a6
{
  MCCertificateWrapperProfile *v7;
  MCCertificateWrapperProfile *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)MCCertificateWrapperProfile;
  v7 = -[MCConfigurationProfile initWithDictionary:options:signerCerts:allowEmptyPayload:outError:](&v27, sel_initWithDictionary_options_signerCerts_allowEmptyPayload_outError_, a3, 0, a4, a5, a6);
  v8 = v7;
  if (v7)
  {
    -[MCConfigurationProfile payloads](v7, "payloads");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 1)
    {
      -[MCConfigurationProfile payloads](v8, "payloads");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[MCConfigurationProfile payloads](v8, "payloads");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v14, "copyCertificate");
        if (v15)
        {
          v16 = (const void *)v15;
          v28[0] = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCProfile setSignerCertificates:](v8, "setSignerCertificates:", v17);

          CFRelease(v16);
        }
LABEL_9:

        return v8;
      }
    }
    else
    {

    }
    if (!a6)
      return 0;
    v25 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArray(CFSTR("MALFORMED_PAYLOAD_ERROR_DESCRIPTION"), v18, v19, v20, v21, v22, v23, v24, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCProfileErrorDomain"), 1000, v14, CFSTR("MCFatalError"));
    v8 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  return v8;
}

- (id)stubDictionary
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCCertificateWrapperProfile;
  -[MCConfigurationProfile stubDictionary](&v4, sel_stubDictionary);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", CFSTR("CertificateWrapper"), CFSTR("PayloadType"));
  return v2;
}

- (int)trustLevel
{
  void *v2;
  uint64_t v3;
  const void *v4;
  int v5;
  SecPolicyRef BasicX509;
  CFTypeRef cf;
  SecTrustRef trust;

  -[MCCertificateWrapperProfile _certificatePayload](self, "_certificatePayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copyCertificate");
  if (v3)
  {
    v4 = (const void *)v3;
    if (SecCertificateIsSelfSignedCA())
    {
      v5 = 2;
      if (!+[MCKeychain itemExistsInKeychain:useSystemKeychain:](MCKeychain, "itemExistsInKeychain:useSystemKeychain:", v4, 1))
      {
        if (+[MCKeychain itemExistsInKeychain:useSystemKeychain:](MCKeychain, "itemExistsInKeychain:useSystemKeychain:", v4, 0))
        {
          v5 = 2;
        }
        else
        {
          v5 = 0;
        }
      }
    }
    else
    {
      BasicX509 = SecPolicyCreateBasicX509();
      trust = 0;
      if (SecTrustCreateWithCertificates((CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4), BasicX509, &trust))
      {
        v5 = 0;
      }
      else
      {
        cf = 0;
        if (SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
        {
          v5 = 2;
        }
        else
        {
          CFRelease(cf);
          v5 = 0;
        }
        if (trust)
          CFRelease(trust);
      }
      if (BasicX509)
        CFRelease(BasicX509);
      CFRelease(v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isSigned
{
  void *v2;
  char v3;

  -[MCCertificateWrapperProfile _certificatePayload](self, "_certificatePayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSigned");

  return v3;
}

- (id)earliestCertificateExpiryDate
{
  void *v2;
  void *v3;

  -[MCCertificateWrapperProfile _certificatePayload](self, "_certificatePayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expiry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_identifierHashFromData:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  unsigned __int8 md[32];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);
  objc_msgSend(v4, "appendString:", CFSTR("a"));

  return v4;
}

+ (id)_wrapperPayloadDictWithCertData:(id)a3 fileName:(id)a4 name:(id)a5 identifier:(id)a6 type:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = a7;
  v15 = a6;
  v16 = a3;
  objc_msgSend(v13, "MCMakeUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCPayload wrapperPayloadDictionary](MCPayload, "wrapperPayloadDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v14, CFSTR("PayloadType"));

  objc_msgSend(v18, "setObject:forKey:", v15, CFSTR("PayloadIdentifier"));
  objc_msgSend(v18, "setObject:forKey:", v17, CFSTR("PayloadUUID"));
  objc_msgSend(v18, "setObject:forKey:", v12, CFSTR("PayloadDisplayName"));
  if (v11)
    v19 = v11;
  else
    v19 = v12;
  objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("PayloadCertificateFileName"));
  objc_msgSend(v18, "setObject:forKey:", v16, CFSTR("PayloadContent"));

  return v18;
}

+ (id)_wrapperWAPIPayloadDictWithPEMData:(id)a3 fileName:(id)a4 name:(id)a5 identifier:(id)a6
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v8, "MCMakeUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCPayload wrapperPayloadDictionary](MCPayload, "wrapperPayloadDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", CFSTR("com.apple.security.wapi-identity"), CFSTR("PayloadType"));
  objc_msgSend(v13, "setObject:forKey:", v9, CFSTR("PayloadIdentifier"));

  objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("PayloadUUID"));
  objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("PayloadDisplayName"));

  objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("PEMData"));
  return v13;
}

+ (id)_basicWrapperProfileDictForCertificateName:(id)a3 fileName:(id)a4 identifier:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a5;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("PayloadVersion"));

  objc_msgSend(v9, "setObject:forKey:", CFSTR("CertificateWrapper"), CFSTR("PayloadType"));
  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("PayloadIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB3940], "MCMakeUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("PayloadUUID"));

  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("PayloadDisplayName"));
  return v9;
}

+ (id)_wrapperProfileDictForCertificate:(__SecCertificate *)a3 fileName:(id)a4 certData:(id)a5 type:(id)a6
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (__CFString *)SecCertificateCopySubjectSummary(a3);
  objc_msgSend(a1, "_identifierHashFromData:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_basicWrapperProfileDictForCertificateName:fileName:identifier:", v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_wrapperPayloadDictWithCertData:fileName:name:identifier:type:", v11, v12, v13, v14, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "addObject:", v17);
  objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("PayloadContent"));

  return v15;
}

+ (id)_wrapperProfileForWAPICertificate:(__SecCertificate *)a3 fileName:(id)a4 PEMData:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = (__CFString *)SecCertificateCopySubjectSummary(a3);
  objc_msgSend(a1, "_identifierHashFromData:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_basicWrapperProfileDictForCertificateName:fileName:identifier:", v10, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_wrapperWAPIPayloadDictWithPEMData:fileName:name:identifier:", v8, v9, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", v14);
  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("PayloadContent"));

  return v12;
}

+ (id)wrapperProfileDictionaryWithCertificateData:(id)a3 fileName:(id)a4 outSignerCerts:(id *)a5
{
  id v8;
  id v9;
  __SecCertificate *v10;
  __SecCertificate *v11;
  void *v12;
  void *v13;
  __SecCertificate *v14;
  __SecCertificate *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  CFDataRef v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  __SecCertificate *v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = +[MCCrypto copyCertificateRefFromPEMData:](MCCrypto, "copyCertificateRefFromPEMData:", v8);
    if (v10)
    {
      v11 = v10;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 1);
      if (objc_msgSend(v12, "rangeOfString:", CFSTR("-----BEGIN EC PRIVATE KEY-----")) == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(a1, "_wrapperProfileDictForCertificate:fileName:certData:type:", v11, v9, v8, CFSTR("com.apple.security.pem"));
      else
        objc_msgSend(a1, "_wrapperProfileForWAPICertificate:fileName:PEMData:", v11, v9, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v11);

    }
    else
    {
      v14 = +[MCCrypto copyCertificateRefFromPKCS1Data:](MCCrypto, "copyCertificateRefFromPKCS1Data:", v8);
      if (v14)
      {
        v15 = v14;
        objc_msgSend(a1, "_wrapperProfileDictForCertificate:fileName:certData:type:", v14, v9, v8, CFSTR("com.apple.security.pkcs1"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v15);
      }
      else
      {
        if (+[MCCrypto isValidPKCS12Data:](MCCrypto, "isValidPKCS12Data:", v8))
        {
          MCLocalizedString(CFSTR("PKCS12_CERTIFICATE_DESCRIPTION_SINGULAR_FORMAT"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_identifierHashFromData:", v8);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_basicWrapperProfileDictForCertificateName:fileName:identifier:", v25, v9, v26);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_wrapperPayloadDictWithCertData:fileName:name:identifier:type:", v8, v9, v25, v26, CFSTR("com.apple.security.pkcs12"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v28);
          objc_msgSend(v13, "setObject:forKey:", v27, CFSTR("PayloadContent"));

        }
        else
        {
          v13 = 0;
        }
        v16 = 0;
      }
    }
    if (objc_msgSend(v16, "count"))
    {
      v29 = a5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v18 = v16;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v31 != v21)
              objc_enumerationMutation(v18);
            v23 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v30 + 1) + 8 * i));
            if (v23)
              objc_msgSend(v17, "addObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v20);
      }

      if (v29)
        *v29 = objc_retainAutorelease(v17);

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
