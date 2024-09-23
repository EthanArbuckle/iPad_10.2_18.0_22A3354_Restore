@implementation CKDSignedServerPublicKeyURLRequest

- (CKDSignedServerPublicKeyURLRequest)initWithOperation:(id)a3 plistURL:(id)a4 verifyWithPolicy:(__SecPolicy *)a5
{
  id v9;
  CKDSignedServerPublicKeyURLRequest *v10;
  CKDSignedServerPublicKeyURLRequest *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKDSignedServerPublicKeyURLRequest;
  v10 = -[CKDURLRequest initWithOperation:](&v13, sel_initWithOperation_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_plistURL, a4);
    v11->_certificateTrustPolicy = a5;
    if (a5)
      CFRetain(a5);
  }

  return v11;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKDSignedServerPublicKeyURLRequest;
  v4 = a3;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v9, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  objc_msgSend_plistURL(self, v5, v6, v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, CFSTR("plistURL"));

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
  v4.super_class = (Class)CKDSignedServerPublicKeyURLRequest;
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

- (void)requestDidParsePlistObject:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  __SecTrust *TrustEvalFromCertificateList_verifiedWithPolicy;
  const char *v19;
  __SecTrust *v20;
  SecKeyRef v21;
  const char *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const __CFArray *v44;
  const char *v45;
  const __CFArray *v46;
  __SecCertificate *ValueAtIndex;
  CFDataRef v48;
  const char *v49;
  void *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  id v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  void *v67;
  id v68;

  v68 = a3;
  v4 = (void *)objc_opt_class();
  v7 = objc_msgSend_requiresProtectionSource(self, v5, v6);
  if ((objc_msgSend_serverResponseIsComplete_requireProtectionSource_(v4, v8, (uint64_t)v68, v7) & 1) == 0)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C94B20], 1005, CFSTR("Invalid server public key payload"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_finishWithError_(self, v49, (uint64_t)v12);
    goto LABEL_25;
  }
  v10 = (void *)objc_opt_class();
  objc_msgSend_certificateListServerPlist_(v10, v11, (uint64_t)v68);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_class();
  v16 = objc_msgSend_certificateTrustPolicy(self, v14, v15);
  TrustEvalFromCertificateList_verifiedWithPolicy = (__SecTrust *)objc_msgSend_createTrustEvalFromCertificateList_verifiedWithPolicy_(v13, v17, (uint64_t)v12, v16);
  v20 = TrustEvalFromCertificateList_verifiedWithPolicy;
  if (TrustEvalFromCertificateList_verifiedWithPolicy)
  {
    v21 = SecTrustCopyKey(TrustEvalFromCertificateList_verifiedWithPolicy);
    if (objc_msgSend_canVerifySignedPlistValues_withKey_(self, v22, (uint64_t)v68, v21))
    {
      v24 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend_objectForKeyedSubscript_(v68, v23, (uint64_t)CFSTR("expiration"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_doubleValue(v25, v26, v27);
      objc_msgSend_dateWithTimeIntervalSince1970_(v24, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = (void *)objc_opt_class();
      objc_msgSend_nearestExpirationInCertificateList_(v31, v32, (uint64_t)v12);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_earlierDate_(v30, v34, (uint64_t)v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_expirationDateOverride(self, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v66 = v30;
      if (v38)
      {
        objc_msgSend_expirationDateOverride(self, v39, v40, v30);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_earlierDate_(v35, v42, (uint64_t)v41);
        v43 = objc_claimAutoreleasedReturnValue();

        v35 = (void *)v43;
      }
      v44 = SecTrustCopyCertificateChain(v20);
      if (v44)
      {
        v46 = v44;
        if (CFArrayGetCount(v44) < 1)
        {
          v48 = 0;
        }
        else
        {
          ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(v46, 0);
          v48 = SecCertificateCopyData(ValueAtIndex);
        }
        CFRelease(v46);
      }
      else
      {
        v48 = 0;
      }
      objc_msgSend_objectForKeyedSubscript_(v68, v45, (uint64_t)CFSTR("public key"), v66);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v68, v52, (uint64_t)CFSTR("version"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend_integerValue(v53, v54, v55);

      if (objc_msgSend_requiresProtectionSource(self, v57, v58))
      {
        objc_msgSend_objectForKeyedSubscript_(v68, v59, (uint64_t)CFSTR("protection source"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v60 = 0;
      }
      v61 = objc_alloc(MEMORY[0x1E0C95000]);
      v50 = (void *)objc_msgSend_initWithPublicKey_version_expiration_certificateData_protectionSource_(v61, v62, (uint64_t)v51, v56, v35, v48, v60);

      if (v50 && (objc_msgSend_hasExpired(v50, v23, v63) & 1) == 0)
      {
        objc_msgSend_setVerifiedPublicKey_(self, v23, (uint64_t)v50);
        goto LABEL_21;
      }
    }
    else
    {
      v50 = 0;
    }
  }
  else
  {
    objc_msgSend_canVerifySignedPlistValues_withKey_(self, v19, (uint64_t)v68, 0);
    v50 = 0;
    v21 = 0;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v23, *MEMORY[0x1E0C94B20], 4001, CFSTR("Failed to verify public key data."));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishWithError_(self, v65, (uint64_t)v64);

  if (v20)
LABEL_21:
    CFRelease(v20);
  if (v21)
    CFRelease(v21);

LABEL_25:
}

+ (BOOL)serverResponseIsComplete:(id)a3 requireProtectionSource:(BOOL)a4
{
  id v4;
  const char *v5;
  void *v6;
  char isKindOfClass;
  const char *v8;
  void *v9;
  char v10;
  const char *v11;
  void *v12;
  char v13;
  const char *v14;
  void *v15;
  char v16;
  const char *v17;
  void *v18;
  char v19;
  const char *v20;
  void *v21;
  char v22;
  const char *v23;
  void *v24;
  char v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  const char *v35;
  void *v36;
  _BOOL4 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v38 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("public key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend_objectForKeyedSubscript_(v4, v8, (uint64_t)CFSTR("public key signature"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();

  objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)CFSTR("version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();

  objc_msgSend_objectForKeyedSubscript_(v4, v14, (uint64_t)CFSTR("version signature"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();

  objc_msgSend_objectForKeyedSubscript_(v4, v17, (uint64_t)CFSTR("expiration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v19 = objc_opt_isKindOfClass();

  objc_msgSend_objectForKeyedSubscript_(v4, v20, (uint64_t)CFSTR("expiration signature"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  objc_msgSend_objectForKeyedSubscript_(v4, v23, (uint64_t)CFSTR("certs"));
  v28 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v24 = (void *)v28;
  v25 = objc_opt_isKindOfClass();
  LOBYTE(v28) = 0;
  if ((isKindOfClass & 1) == 0
    || (v10 & 1) == 0
    || (v13 & 1) == 0
    || (v16 & 1) == 0
    || (v19 & 1) == 0
    || (v22 & 1) == 0)
  {
    if (!v38)
      goto LABEL_18;
    goto LABEL_17;
  }
  if ((v25 & 1) != 0)
  {
    v39 = 0u;
    v40 = 0u;
    LODWORD(v28) = objc_msgSend_count(v24, v26, v27) != 0;
    v41 = 0u;
    v42 = 0u;
    v29 = v24;
    v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v39, v43, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v40 != v33)
            objc_enumerationMutation(v29);
          objc_opt_class();
          LODWORD(v28) = v28 & objc_opt_isKindOfClass();
        }
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v35, (uint64_t)&v39, v43, 16);
      }
      while (v32);
    }

  }
  if (v38)
  {
LABEL_17:
    objc_msgSend_objectForKeyedSubscript_(v4, v26, (uint64_t)CFSTR("protection source"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v28) = v28 & objc_opt_isKindOfClass();

  }
LABEL_18:

  return v28 & 1;
}

+ (id)certificateListServerPlist:(id)a3
{
  void *v3;
  const char *v4;
  void *v5;

  objc_msgSend_objectForKeyedSubscript_(a3, a2, (uint64_t)CFSTR("certs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKCompactMap_(v3, v4, (uint64_t)&unk_1E7834A78);
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

- (BOOL)canVerifySignedPlistValues:(id)a3 withKey:(__SecKey *)a4
{
  int v4;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  int v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  int v36;
  const char *v37;

  LOBYTE(v4) = 0;
  if (a3 && a4)
  {
    v7 = a3;
    objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)CFSTR("public key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v10, (uint64_t)CFSTR("version"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_longLongValue(v11, v12, v13);

    objc_msgSend_objectForKeyedSubscript_(v7, v15, (uint64_t)CFSTR("expiration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_longLongValue(v16, v17, v18);

    objc_msgSend_objectForKeyedSubscript_(v7, v20, (uint64_t)CFSTR("public key signature"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v22, (uint64_t)CFSTR("version signature"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v7, v24, (uint64_t)CFSTR("expiration signature"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_opt_class();
    LODWORD(v7) = objc_msgSend_verifyData_withSignature_usingKey_(v26, v27, (uint64_t)v9, v21, a4);
    v28 = (void *)objc_opt_class();
    v31 = objc_msgSend_verifyFullIntegers(self, v29, v30);
    LODWORD(v7) = v7 & objc_msgSend_verifyInteger_withSignature_usingKey_verifyFullInteger_(v28, v32, v14, v23, a4, v31 ^ 1u);
    v33 = (void *)objc_opt_class();
    v36 = objc_msgSend_verifyFullIntegers(self, v34, v35);
    v4 = v7 & objc_msgSend_verifyInteger_withSignature_usingKey_verifyFullInteger_(v33, v37, v19, v25, a4, v36 ^ 1u);

  }
  return v4;
}

+ (BOOL)verifyInteger:(int64_t)a3 withSignature:(id)a4 usingKey:(__SecKey *)a5 verifyFullInteger:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  char v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  id v16;
  const char *v17;
  void *v18;
  unint64_t v20;
  unsigned int v21;

  v6 = a6;
  v10 = a4;
  if (a3 == (int)a3 || v6)
  {
    if (v6)
    {
      v21 = bswap32(a3);
      v12 = objc_alloc(MEMORY[0x1E0C99D50]);
      v14 = objc_msgSend_initWithBytes_length_(v12, v13, (uint64_t)&v21, 4, v20);
    }
    else
    {
      v20 = bswap64(a3);
      v16 = objc_alloc(MEMORY[0x1E0C99D50]);
      v14 = objc_msgSend_initWithBytes_length_(v16, v17, (uint64_t)&v20, 8, v20);
    }
    v18 = (void *)v14;
    v11 = objc_msgSend_verifyData_withSignature_usingKey_(a1, v15, v14, v10, a5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)verifyData:(id)a3 withSignature:(id)a4 usingKey:(__SecKey *)a5
{
  return SecKeyVerifySignature(a5, (SecKeyAlgorithm)*MEMORY[0x1E0CD6DF8], (CFDataRef)a3, (CFDataRef)a4, 0) != 0;
}

- (CKPublicKey)verifiedPublicKey
{
  return (CKPublicKey *)objc_getProperty(self, a2, 392, 1);
}

- (void)setVerifiedPublicKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (BOOL)requiresProtectionSource
{
  return self->_requiresProtectionSource;
}

- (void)setRequiresProtectionSource:(BOOL)a3
{
  self->_requiresProtectionSource = a3;
}

- (BOOL)verifyFullIntegers
{
  return self->_verifyFullIntegers;
}

- (void)setVerifyFullIntegers:(BOOL)a3
{
  self->_verifyFullIntegers = a3;
}

- (NSDate)expirationDateOverride
{
  return self->_expirationDateOverride;
}

- (void)setExpirationDateOverride:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDateOverride, a3);
}

- (NSURL)plistURL
{
  return self->_plistURL;
}

- (__SecPolicy)certificateTrustPolicy
{
  return self->_certificateTrustPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistURL, 0);
  objc_storeStrong((id *)&self->_expirationDateOverride, 0);
  objc_storeStrong((id *)&self->_verifiedPublicKey, 0);
}

@end
