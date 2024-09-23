@implementation MCCrypto

+ (__SecCertificate)copyCertificateRefFromPKCS1Data:(id)a3
{
  return SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDataRef)a3);
}

+ (__SecCertificate)copyCertificateRefFromPEMData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __SecCertificate *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  const __CFData *v13;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 1);

  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("-----BEGIN CERTIFICATE-----"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_2:
    v8 = 0;
    goto LABEL_9;
  }
  v9 = v6 + v7;
  v10 = objc_msgSend(v5, "rangeOfString:options:range:", CFSTR("-----END CERTIFICATE-----"), 0, v9, objc_msgSend(v5, "length") - v9);
  v8 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v10 != v9)
  {
    objc_msgSend(v5, "substringWithRange:", v9, v10 - v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v12, 1);

    if (v13)
    {
      v8 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v13);

      goto LABEL_9;
    }
    goto LABEL_2;
  }
LABEL_9:

  return v8;
}

+ (BOOL)isValidPKCS12Data:(id)a3
{
  CFArrayRef items;

  items = 0;
  return SecPKCS12Import((CFDataRef)a3, MEMORY[0x1E0C9AA70], &items) != -26275;
}

+ (id)_decryptionFailedErrorWithUnderlyingError:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a3;
  MCErrorArray(CFSTR("DECRYPTION_FAILED"), v5, v6, v7, v8, v9, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MCLocalizedErrorString(CFSTR("DECRYPTION_FAILED_SUGGESTION"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MCUSEnglishErrorString(CFSTR("DECRYPTION_FAILED_SUGGESTION"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCErrorWithDomain:code:descriptionArray:suggestion:USEnglishSuggestion:underlyingError:errorType:", CFSTR("MCProfileErrorDomain"), 1006, v12, v13, v14, v4, CFSTR("MCFatalError"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)objectFromEncryptedData:(id)a3 outCertificate:(__SecCertificate *)a4 outError:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v26;
  CFTypeRef cf;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v8 = (void *)MEMORY[0x1E0C99DF0];
  v9 = a3;
  objc_msgSend(v8, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = SecCMSDecryptEnvelopedData();

  if (v11)
  {
    v12 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v11;
      _os_log_impl(&dword_19ECC4000, v12, OS_LOG_TYPE_ERROR, "Decryption failed (CMS error): %d", buf, 8u);
    }
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v14 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
    objc_msgSend(a1, "_decryptionFailedErrorWithUnderlyingError:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v19 = 0;
    goto LABEL_14;
  }
  if (objc_msgSend(v10, "length"))
    v16 = cf == 0;
  else
    v16 = 1;
  if (v16)
  {
    v17 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19ECC4000, v17, OS_LOG_TYPE_ERROR, "Decryption failed (profile data was empty)", buf, 2u);
    }
    objc_msgSend(a1, "_decryptionFailedErrorWithUnderlyingError:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v10, 2, 0, &v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v26;
  v21 = v20;
  v15 = 0;
  if (!v19)
  {
    v22 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v23 = v22;
      objc_msgSend(v21, "MCVerboseDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v24;
      _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_ERROR, "Decryption failed (profile data error): %{public}@", buf, 0xCu);

    }
    objc_msgSend(a1, "_decryptionFailedErrorWithUnderlyingError:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_14:
  if (v15)
  {
    v18 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v15);
  }
  else
  {
    if (a4)
    {
      *a4 = (__SecCertificate *)cf;
    }
    else if (cf)
    {
      CFRelease(cf);
    }
    v18 = v19;
  }

  return v18;
}

+ (id)createAndStoreNewActivationLockBypassCodeAndHashIfNeeded
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "storedActivationLockBypassCodeHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "createAndStoreNewActivationLockBypassCodeAndHash");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)createAndStoreNewActivationLockBypassCodeAndHash
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v11;
  void *v12;
  _OWORD v13[2];
  _QWORD v14[2];
  _OWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[MCCrypto createNewActivationLockBypassCodeOutCode:outRawBytes:outHash:](MCCrypto, "createNewActivationLockBypassCodeOutCode:outRawBytes:outHash:", v15, v14, v13);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v15, 31, 1, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v13, 32, 0);
  +[MCCrypto storeActivationLockBypassCode:hash:](MCCrypto, "storeActivationLockBypassCode:hash:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v15, 0, sizeof(v15));
  v14[0] = 0;
  v14[1] = 0;
  memset(v13, 0, sizeof(v13));
  v5 = _MCLogObjects;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v4;
      v6 = "Could not store activation lock bypass code. Error: %{public}@";
      v7 = v5;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 12;
LABEL_6:
      _os_log_impl(&dword_19ECC4000, v7, v8, v6, (uint8_t *)&v11, v9);
    }
  }
  else if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    v6 = "Successfully created and stored new activation lock bypass code.";
    v7 = v5;
    v8 = OS_LOG_TYPE_INFO;
    v9 = 2;
    goto LABEL_6;
  }
  return v4;
}

+ (void)createNewActivationLockBypassCodeOutCode:(char *)a3 outRawBytes:(char *)a4 outHash:(char *)a5
{
  char *v5;
  int v7;
  int *v8;
  int i;
  unsigned int v10;
  int v11;
  int v12;

  v5 = a4;
  arc4random_buf(a4, 0x10uLL);
  pbkdf2();
  v7 = 0;
  v8 = &createNewActivationLockBypassCodeOutCode_outRawBytes_outHash__kDashPositions;
  for (i = 1; i != 26; ++i)
  {
    if (v7 >= 3)
      v10 = 8 - v7;
    else
      v10 = 5;
    v11 = (*v5 << v7) >> (8 - v10);
    if (v7 <= 2)
    {
      v12 = 5;
    }
    else
    {
      ++v5;
      v12 = -3;
    }
    if (v10 <= 4)
      v11 = (*v5 >> (v10 + 3)) | (v11 << (5 - v10));
    *a3 = createNewActivationLockBypassCodeOutCode_outRawBytes_outHash__kSymbols[v11];
    if (i == *v8)
    {
      ++v8;
      a3[1] = 45;
      a3 += 2;
    }
    else
    {
      ++a3;
    }
    v7 += v12;
  }
  *a3 = createNewActivationLockBypassCodeOutCode_outRawBytes_outHash__kSymbols[*v5 & 7];
  a3[1] = 0;
}

+ (id)storeActivationLockBypassCode:(id)a3 hash:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  v8 = (uint64_t *)MEMORY[0x1E0CD68B0];
  if (!v7
    || (v9 = *MEMORY[0x1E0CD68B0],
        v15 = 0,
        LOWORD(v13) = 1,
        +[MCKeychain setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setString:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v5, CFSTR("com.apple.managedconfiguration.alescrow"), CFSTR("escrowCode"), 0, 0, v9, CFSTR("apple"), v13, &v15), (v10 = v15) == 0))
  {
    if (!objc_msgSend(v6, "length")
      || (v11 = *v8,
          v14 = 0,
          LOWORD(v13) = 1,
          +[MCKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](MCKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v6, CFSTR("com.apple.managedconfiguration.alescrow"), CFSTR("escrowHash"), 0, 0, v11, CFSTR("apple"), v13, &v14), (v10 = v14) == 0))
    {
      MCSendActivationLockBypassCodeWasStoredNotification();
      v10 = 0;
    }
  }

  return v10;
}

+ (id)storedActivationLockBypassCodeWithOutError:(id *)a3
{
  return +[MCKeychain stringFromService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "stringFromService:account:label:description:group:useSystemKeychain:outError:", CFSTR("com.apple.managedconfiguration.alescrow"), CFSTR("escrowCode"), 0, 0, CFSTR("apple"), 1, a3);
}

+ (void)clearStoredActivationLockBypassCode
{
  +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", CFSTR("com.apple.managedconfiguration.alescrow"), CFSTR("escrowCode"), 0, 0, 1, CFSTR("apple"));
}

+ (void)clearStoredActivationLockHash
{
  +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", CFSTR("com.apple.managedconfiguration.alescrow"), CFSTR("escrowHash"), 0, 0, 1, CFSTR("apple"));
}

+ (id)storedActivationLockBypassCodeHash
{
  return +[MCKeychain dataFromService:account:label:description:group:useSystemKeychain:outError:](MCKeychain, "dataFromService:account:label:description:group:useSystemKeychain:outError:", CFSTR("com.apple.managedconfiguration.alescrow"), CFSTR("escrowHash"), 0, 0, CFSTR("apple"), 1, 0);
}

@end
