@implementation CKDFetchServerCertificatesURLRequest

- (CKDFetchServerCertificatesURLRequest)initWithOperation:(id)a3 verifyWithPolicy:(__SecPolicy *)a4
{
  CKDFetchServerCertificatesURLRequest *v5;
  CKDFetchServerCertificatesURLRequest *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDFetchServerCertificatesURLRequest;
  v5 = -[CKDURLRequest initWithOperation:](&v8, sel_initWithOperation_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_certificateTrustPolicy = a4;
    if (a4)
      CFRetain(a4);
  }
  return v6;
}

- (void)dealloc
{
  __SecPolicy *certificateTrustPolicy;
  objc_super v4;

  certificateTrustPolicy = self->_certificateTrustPolicy;
  if (certificateTrustPolicy)
  {
    CFRelease(certificateTrustPolicy);
    self->_certificateTrustPolicy = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKDFetchServerCertificatesURLRequest;
  -[CKDURLRequest dealloc](&v4, sel_dealloc);
}

- (BOOL)requiresConfiguration
{
  return 0;
}

- (BOOL)requiresDeviceID
{
  return 0;
}

- (BOOL)requiresTokenRegistration
{
  return 0;
}

- (BOOL)allowsAnonymousAccount
{
  return 1;
}

- (int64_t)serverType
{
  return 5;
}

- (int64_t)partitionType
{
  return 3;
}

- (id)httpMethod
{
  return CFSTR("GET");
}

- (BOOL)hasRequestBody
{
  return 0;
}

- (id)url
{
  return (id)objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], a2, (uint64_t)CFSTR("https://gateway.icloud.com/config/server-signature-verification.plist"));
}

- (void)requestDidParsePlistObject:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t TrustEvalFromCertificateList_verifiedWithPolicy;
  const char *v31;
  const void *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  NSObject *v52;
  const char *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  const char *v57;
  __int128 v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;
  _QWORD v66[3];

  v66[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend_serverResponseIsComplete_(v5, v6, (uint64_t)v4) & 1) != 0)
  {
    v8 = (void *)objc_opt_class();
    objc_msgSend_certificateListServerPlist_(v8, v9, (uint64_t)v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend_count(v10, v11, v12))
    {
      v16 = 1;
      *(_QWORD *)&v15 = 138412546;
      v58 = v15;
      v60 = v4;
      do
      {
        v17 = objc_msgSend_count(v10, v13, v14, v58) - 1;
        objc_msgSend_objectAtIndexedSubscript_(v10, v18, v16 - 1);
        v19 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v19;
        if (v16 - 1 >= v17)
        {
          v65 = v19;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v20, (uint64_t)&v65, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v66[0] = v19;
          objc_msgSend_objectAtIndexedSubscript_(v10, v20, v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v66[1] = v22;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)v66, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v25 = (void *)objc_opt_class();
        v28 = objc_msgSend_certificateTrustPolicy(self, v26, v27);
        TrustEvalFromCertificateList_verifiedWithPolicy = objc_msgSend_createTrustEvalFromCertificateList_verifiedWithPolicy_(v25, v29, (uint64_t)v24, v28);
        if (TrustEvalFromCertificateList_verifiedWithPolicy)
        {
          v32 = (const void *)TrustEvalFromCertificateList_verifiedWithPolicy;
          v33 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend_objectForKeyedSubscript_(v4, v31, (uint64_t)CFSTR("expiration"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend_integerValue(v34, v35, v36);
          objc_msgSend_dateWithTimeIntervalSince1970_(v33, v38, v39, (double)v37);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          v41 = (void *)objc_opt_class();
          objc_msgSend_nearestExpirationInCertificateList_(v41, v42, (uint64_t)v24);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_earlierDate_(v40, v44, (uint64_t)v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_date(MEMORY[0x1E0C99D68], v46, v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend_compare_(v45, v49, (uint64_t)v48);

          if (v50 == -1)
          {
            if (*MEMORY[0x1E0C95300] != -1)
              dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v52 = *MEMORY[0x1E0C952B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v58;
              v62 = v40;
              v63 = 2112;
              v64 = v43;
              _os_log_error_impl(&dword_1BE990000, v52, OS_LOG_TYPE_ERROR, "Server signing certificate has expired. Plist cert expiration: %@ Certificate expiration: %@", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend_addObject_(v59, v51, (uint64_t)v32);
          }
          CFRelease(v32);

          v4 = v60;
        }

        v55 = objc_msgSend_count(v10, v53, v54);
        v56 = v16 + 1;
        v16 += 2;
      }
      while (v56 < v55);
    }
    objc_msgSend_setValidatedTrusts_(self, v13, (uint64_t)v59);

  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v7, *MEMORY[0x1E0C94B20], 1005, CFSTR("Invalid server certificates payload"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v57, (uint64_t)v10);
  }

}

+ (BOOL)serverResponseIsComplete:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  int v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)CFSTR("certs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v6 = objc_msgSend_count(v3, v4, v5) != 0;
    v17 = 0u;
    v18 = 0u;
    v7 = v3;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v7);
          objc_opt_class();
          v6 &= objc_opt_isKindOfClass();
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v13, (uint64_t)&v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

+ (id)certificateListServerPlist:(id)a3
{
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)CFSTR("certs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v3, v4, (uint64_t)&unk_1E7835FA8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)nearestExpirationInCertificateList:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_distantFuture(MEMORY[0x1E0C99D68], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      v13 = v6;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        SecCertificateNotValidAfter();
        objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E0C99D68], v14, v15, v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_earlierDate_(v13, v17, (uint64_t)v16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v6;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v18, (uint64_t)&v20, v24, 16);
    }
    while (v10);
  }

  return v6;
}

+ (__SecTrust)createTrustEvalFromCertificateList:(id)a3 verifiedWithPolicy:(__SecPolicy *)a4
{
  OSStatus v4;
  BOOL v5;
  NSObject *v6;
  __SecTrust *result;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  NSObject *v12;
  NSObject *v13;
  CFTypeRef cf;
  SecTrustRef trust;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  trust = 0;
  v4 = SecTrustCreateWithCertificates(a3, a4, &trust);
  if (trust)
    v5 = v4 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v6 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v4;
      _os_log_error_impl(&dword_1BE990000, v6, OS_LOG_TYPE_ERROR, "Failed to create trust from certificates with status code: %i", buf, 8u);
    }
    result = trust;
    if (!trust)
      return result;
LABEL_22:
    CFRelease(result);
    return 0;
  }
  cf = 0;
  v8 = SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf);
  v9 = (void *)*MEMORY[0x1E0C952F8];
  v10 = *MEMORY[0x1E0C95300];
  if (v8 && cf == 0)
  {
    if (v10 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v9);
    v13 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v17 = trust;
      _os_log_debug_impl(&dword_1BE990000, v13, OS_LOG_TYPE_DEBUG, "Successfully evaluated trust policy %{public}@", buf, 0xCu);
    }
    if (cf)
      CFRelease(cf);
    return trust;
  }
  else
  {
    if (v10 != -1)
      dispatch_once(MEMORY[0x1E0C95300], v9);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = (void *)cf;
      _os_log_error_impl(&dword_1BE990000, v12, OS_LOG_TYPE_ERROR, "Failed to evaluate trust policy with error: %@", buf, 0xCu);
    }
    if (trust)
    {
      CFRelease(trust);
      trust = 0;
    }
    result = (__SecTrust *)cf;
    if (cf)
      goto LABEL_22;
  }
  return result;
}

- (NSArray)validatedTrusts
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setValidatedTrusts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (__SecPolicy)certificateTrustPolicy
{
  return self->_certificateTrustPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedTrusts, 0);
}

@end
