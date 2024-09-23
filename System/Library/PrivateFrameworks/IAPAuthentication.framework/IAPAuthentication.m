uint64_t GetConnectionToAuthDaemon()
{
  _xpc_connection_s *mach_service;

  if (!__iapauthd_connection)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.iapauthd.xpc", 0, 0);
    __iapauthd_connection = (uint64_t)mach_service;
    if (mach_service)
    {
      xpc_connection_set_event_handler(mach_service, &__block_literal_global);
      xpc_connection_resume((xpc_connection_t)__iapauthd_connection);
    }
    else
    {
      syslog(4, "No connection made!\n");
    }
  }
  return __iapauthd_connection;
}

_DWORD *InitSigningContext(int a1)
{
  char *v2;
  _DWORD *v3;

  v2 = (char *)malloc_type_malloc(0x64uLL, 0x100004093FC706DuLL);
  v3 = v2;
  if (v2)
  {
    CC_SHA1_Init((CC_SHA1_CTX *)(v2 + 4));
    *v3 = a1;
  }
  return v3;
}

void EraseSigningContext(void *a1)
{
  if (a1)
    free(a1);
}

BOOL UpdateSigningContext(uint64_t a1, void *data, unint64_t len)
{
  CC_LONG v4;

  if (a1)
  {
    v4 = len;
    if (HIDWORD(len))
      syslog(3, "%s:%s-%d losing integer precision on inLen 0x08%lx", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "UpdateSigningContext", 190, len);
    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 4), data, v4);
  }
  return a1 != 0;
}

uint64_t FinalizeSigningContext()
{
  return 0;
}

uint64_t IapAuthGetAppCert(unsigned int a1, UInt8 **a2, CFIndex *a3)
{
  __SecCertificate *CertForApplicationSync;
  __SecCertificate *v6;
  const __CFData *v7;
  const __CFData *v8;
  size_t Length;
  CFIndex v10;
  UInt8 *v11;
  uint64_t v12;
  CFRange v14;

  if (a2 && a3)
  {
    CertForApplicationSync = (__SecCertificate *)GetCertForApplicationSync(a1);
    if (CertForApplicationSync)
    {
      v6 = CertForApplicationSync;
      v7 = SecCertificateCopyData(CertForApplicationSync);
      if (v7)
      {
        v8 = v7;
        Length = CFDataGetLength(v7);
        v10 = Length;
        v11 = *a2;
        if (*a2)
        {
          if (*a3 < Length)
          {
            syslog(3, "%s ERROR: Cert serial number output buffer size too small, outLen:%04lX < certSerLen:%04lX\n");
LABEL_16:
            v12 = 0;
            goto LABEL_17;
          }
        }
        else
        {
          v11 = (UInt8 *)malloc_type_malloc(Length, 0x4B1B48BDuLL);
          *a2 = v11;
          if (!v11)
          {
            syslog(3, "%s Application auth cert output buffer malloc fail *ppOutBuf:NULL\n");
            goto LABEL_16;
          }
        }
        v14.location = 0;
        v14.length = v10;
        CFDataGetBytes(v8, v14, v11);
        *a3 = v10;
        v12 = 1;
LABEL_17:
        CFRelease(v6);
        CFRelease(v8);
        return v12;
      }
      syslog(3, "%s SecCertificateCopyData returned pCertData:NULL\n", "IapAuthGetAppCert");
      CFRelease(v6);
    }
    else
    {
      syslog(3, "%s GetCertForApplicationSync for appID:%02X returned pCertApp:NULL\n");
    }
  }
  else
  {
    syslog(3, "%s ERROR: Bad input parameter(s): ppOutbuf:%hhx, pOutLen:%hhx\n");
  }
  return 0;
}

uint64_t GetCertForApplicationSync(unsigned int a1)
{
  uint64_t ConnectionToAuthDaemon;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  size_t length;

  ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
  if (ConnectionToAuthDaemon)
  {
    v3 = (_xpc_connection_s *)ConnectionToAuthDaemon;
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "application", a1);
    xpc_dictionary_set_string(v4, "requestType", "cert");
    v5 = xpc_connection_send_message_with_reply_sync(v3, v4);
    if (!v5)
    {
      v7 = 0;
LABEL_14:
      xpc_release(v4);
      return v7;
    }
    v6 = v5;
    if (xpc_dictionary_get_BOOL(v5, "isValid"))
    {
      length = 0;
      xpc_dictionary_get_data(v6, "certData", &length);
      if (length)
      {
        syslog(4, "%s:%s-%d got data from authd, len=%d\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "GetCertForApplicationSync", 245, length);
        v7 = SecCertificateCreateWithBytes();
        if (v7)
          syslog(4, "cert created!\n");
        else
          syslog(4, "cert FAILED!\n");
        goto LABEL_13;
      }
      syslog(4, "%s:%s-%d len is 0!\n");
    }
    else
    {
      syslog(4, "cert FAILED!\n");
    }
    v7 = 0;
LABEL_13:
    xpc_release(v6);
    goto LABEL_14;
  }
  return 0;
}

uint64_t IapAuthGetAppCertP7Sync(unsigned int a1, UInt8 **a2, CFIndex *a3)
{
  uint64_t CertForApplicationSync;
  const void *v6;
  const __CFData *v7;
  const __CFData *v8;
  size_t Length;
  CFIndex v10;
  UInt8 *v11;
  uint64_t v12;
  CFRange v14;

  if (a2 && a3)
  {
    CertForApplicationSync = GetCertForApplicationSync(a1);
    if (CertForApplicationSync)
    {
      v6 = (const void *)CertForApplicationSync;
      v7 = (const __CFData *)SecCMSCreateCertificatesOnlyMessageIAP();
      if (v7)
      {
        v8 = v7;
        Length = CFDataGetLength(v7);
        v10 = Length;
        v11 = *a2;
        if (*a2)
        {
          if (*a3 < Length)
          {
            syslog(3, "%s ERROR: Application P7 cert output buffer size too small, outLen:%04lX < certAppLen:%04lX\n");
LABEL_16:
            v12 = 0;
            goto LABEL_17;
          }
        }
        else
        {
          v11 = (UInt8 *)malloc_type_malloc(Length, 0xDFF7986AuLL);
          *a2 = v11;
          if (!v11)
          {
            syslog(3, "%s Application auth P7 cert output buffer malloc fail *ppOutBuf:NULL\n");
            goto LABEL_16;
          }
        }
        v14.location = 0;
        v14.length = v10;
        CFDataGetBytes(v8, v14, v11);
        *a3 = v10;
        v12 = 1;
LABEL_17:
        CFRelease(v6);
        CFRelease(v8);
        return v12;
      }
      syslog(3, "%s SecCMSCreateCertificatesOnlyMessageIAP returned pCertData:NULL\n", "IapAuthGetAppCertP7Sync");
      CFRelease(v6);
    }
    else
    {
      syslog(3, "%s GetCertForApplicationSync for appID:%02X returned pCertApp:NULL\n");
    }
  }
  else
  {
    syslog(3, "%s ERROR: Bad input parameter(s): ppOutbuf:%hhx, pOutLen:%hhx\n");
  }
  return 0;
}

void IapAuthGetAppCertP7(unsigned int a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t ConnectionToAuthDaemon;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  _QWORD v9[6];
  _QWORD handler[8];
  _QWORD v11[4];

  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = __IapAuthGetAppCertP7_block_invoke;
  v9[3] = &unk_24F53D190;
  v9[4] = a3;
  v9[5] = a2;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2000000000;
  v11[3] = 0;
  ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
  if (ConnectionToAuthDaemon)
  {
    v7 = (_xpc_connection_s *)ConnectionToAuthDaemon;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "application", a1);
    xpc_dictionary_set_string(v8, "requestType", "cert");
    handler[0] = v5;
    handler[1] = 0x40000000;
    handler[2] = ___GetCertForApplication_block_invoke;
    handler[3] = &unk_24F53D230;
    handler[4] = v9;
    handler[5] = v11;
    handler[6] = a2;
    handler[7] = v8;
    xpc_connection_send_message_with_reply(v7, v8, a2, handler);
  }
  _Block_object_dispose(v11, 8);
}

uint64_t IapAuthChallengeRespondSync(const void *a1, size_t a2, void **a3, size_t *a4)
{
  uint64_t ConnectionToAuthDaemon;
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;
  const void *data;
  void *v13;
  size_t v14;
  size_t length;

  ConnectionToAuthDaemon = 0;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
          if (ConnectionToAuthDaemon)
          {
            v9 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_string(v9, "requestType", "key");
            xpc_dictionary_set_data(v9, "inData", a1, a2);
            v10 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)ConnectionToAuthDaemon, v9);
            if (!v10)
            {
              ConnectionToAuthDaemon = 0;
LABEL_17:
              xpc_release(v9);
              return ConnectionToAuthDaemon;
            }
            v11 = v10;
            length = 0;
            if (xpc_dictionary_get_BOOL(v10, "isValid"))
            {
              syslog(6, "%s:%s-%d got valid key output from authd\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "GetAuthChallengeResponseSync", 515);
              data = xpc_dictionary_get_data(v11, "outData", &length);
              v13 = *a3;
              if (*a3)
              {
                v14 = length;
                if (*a4 >= length)
                  goto LABEL_15;
              }
              else
              {
                v13 = malloc_type_malloc(length, 0x7CD8F046uLL);
                *a3 = v13;
                v14 = length;
                *a4 = length;
                if (v13)
                {
LABEL_15:
                  memcpy(v13, data, v14);
                  *a4 = length;
                  ConnectionToAuthDaemon = 1;
                  goto LABEL_16;
                }
              }
            }
            else
            {
              syslog(4, "%s:%s-%d isValid from authd is false!\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "GetAuthChallengeResponseSync", 533);
            }
            ConnectionToAuthDaemon = 0;
LABEL_16:
            xpc_release(v11);
            goto LABEL_17;
          }
        }
      }
    }
  }
  return ConnectionToAuthDaemon;
}

void IapAuthChallengeRespond(const void *a1, size_t a2, NSObject *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t ConnectionToAuthDaemon;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  _QWORD v11[6];
  _QWORD handler[7];

  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = __IapAuthChallengeRespond_block_invoke;
  v11[3] = &unk_24F53D1E0;
  v11[4] = a4;
  v11[5] = a3;
  ConnectionToAuthDaemon = GetConnectionToAuthDaemon();
  if (ConnectionToAuthDaemon)
  {
    v9 = (_xpc_connection_s *)ConnectionToAuthDaemon;
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "requestType", "key");
    xpc_dictionary_set_data(v10, "inData", a1, a2);
    handler[0] = v7;
    handler[1] = 0x40000000;
    handler[2] = ___GetAuthChallengeResponse_block_invoke;
    handler[3] = &unk_24F53D280;
    handler[4] = v11;
    handler[5] = a3;
    handler[6] = v10;
    xpc_connection_send_message_with_reply(v9, v10, a3, handler);
  }
}

uint64_t IapAuthRandomNumber(int *a1)
{
  int v2;
  unsigned int bytes;

  bytes = -1431655766;
  v2 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x24BDE94B8], 4uLL, &bytes);
  if (a1)
    *a1 = v2;
  return bytes;
}

uint64_t IapAuthChallengeVerify(UInt8 *a1, CFIndex a2, const UInt8 *a3, CFIndex a4, const UInt8 *a5, CFIndex a6, int a7)
{
  const void *CertRef;
  __CFArray *Mutable;
  __CFArray *v16;
  __CFArray *v17;
  void *v18;
  const __CFData *v19;
  const __CFData *v20;
  uint64_t v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  void *v30;
  const __CFAllocator *v32;
  const __CFAllocator *v33;
  const __CFData *v34;
  SecKeyAlgorithm *v35;
  const __CFString *v36;
  const __CFString *v37;
  const void *v38;
  int v39;
  CFErrorRef error;
  int v41;
  SecTrustRef trust;

  trust = 0;
  v41 = -1431655766;
  CertRef = GetCertRef(a1, a2);
  if (!CertRef)
  {
    syslog(3, "%s ERROR: GetCertRef returned pCertRef:NULL\n", "IapAuthChallengeVerify");
    v19 = 0;
    v20 = 0;
    v17 = 0;
    v18 = 0;
    v16 = 0;
LABEL_14:
    v21 = 0;
    goto LABEL_45;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v16 = Mutable;
  if (!Mutable)
  {
    syslog(3, "%s ERROR: CFArrayCreateMutable returned pCertArray:NULL\n");
LABEL_13:
    v19 = 0;
    v20 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_14;
  }
  CFArrayAppendValue(Mutable, CertRef);
  CFRelease(CertRef);
  CertRef = (const void *)SecPolicyCreateiAP();
  if (!CertRef)
  {
    syslog(3, "%s ERROR: SecPolicyCreateiAP returned piAPPolicy:NULL\n");
    goto LABEL_13;
  }
  SecTrustCreateWithCertificates(v16, CertRef, &trust);
  if (!trust)
  {
    syslog(3, "%s ERROR: SecTrustCreateWithCertificates returned piAPTrust:NULL\n");
    goto LABEL_41;
  }
  v17 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (v17)
  {
    v39 = a7;
    if (a7 == 2)
    {
      v18 = (void *)SecCertificateCreateWithBytes();
      if (!v18)
      {
        syslog(3, "%s ERROR: SecCertificateCreateWithBytes returned pCertSubCA1:NULL\n");
        goto LABEL_21;
      }
      CFArrayAppendValue(v17, v18);
      CFRelease(v18);
      v18 = (void *)SecCertificateCreateWithBytes();
      if (!v18)
      {
        syslog(3, "%s ERROR: SecCertificateCreateWithBytes returned pCertSubCA2:NULL\n");
LABEL_21:
        v21 = 0;
        goto LABEL_43;
      }
    }
    else
    {
      if (a7 != 3)
        goto LABEL_39;
      v22 = GetCertRef(kiPodAccessoryTestAuth3CA, 667);
      if (v22)
      {
        v23 = v22;
        CFArrayAppendValue(v17, v22);
        CFRelease(v23);
      }
      else
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kiPodAccessoryTestAuth3CA\n", "IapAuthChallengeVerify");
      }
      v24 = GetCertRef(kAuth3ECSSubCADev, 667);
      if (v24)
      {
        v25 = v24;
        CFArrayAppendValue(v17, v24);
        CFRelease(v25);
      }
      else
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCADev\n", "IapAuthChallengeVerify");
      }
      v26 = GetCertRef(kAuth3ECSSubCAProd, 667);
      if (v26)
      {
        v27 = v26;
        CFArrayAppendValue(v17, v26);
        CFRelease(v27);
      }
      else
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCAProd\n", "IapAuthChallengeVerify");
      }
      if (_findDeviceProperties_onceToken != -1)
        dispatch_once(&_findDeviceProperties_onceToken, &__block_literal_global_72);
      if (!(__isInternalBuild | __isDesenseBuild) || !__isInternalDeveloperDevice)
        goto LABEL_39;
      v28 = GetCertRef(kiPodAccessoryTestCAProto, 637);
      if (v28)
      {
        v29 = v28;
        CFArrayAppendValue(v17, v28);
        CFRelease(v29);
      }
      else
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kiPodAccessoryTestCAProto\n", "IapAuthChallengeVerify");
      }
      v30 = (void *)GetCertRef(kAuth3ECSSubCASimu, 667);
      if (!v30)
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCASimu\n", "IapAuthChallengeVerify");
        goto LABEL_39;
      }
      v18 = v30;
    }
    CFArrayAppendValue(v17, v18);
    CFRelease(v18);
LABEL_39:
    SecTrustSetAnchorCertificates(trust, v17);
    CFRelease(v17);
    if (!MEMORY[0x22E2E9530](trust, &v41))
    {
      if (v41 != 1 && v41 != 4)
      {
        if (v41 != 5)
        {
          syslog(3, "%s ERROR: SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X\n");
          goto LABEL_41;
        }
        syslog(3, "%s ERROR: SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X, ignore\n", "IapAuthChallengeVerify", 4, 1, 5);
      }
      v18 = (void *)MEMORY[0x22E2E9518](trust);
      if (v18)
      {
        v38 = CertRef;
        error = 0;
        v32 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v33 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
        v20 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, a4, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
        v34 = CFDataCreateWithBytesNoCopy(v32, a5, a6, v33);
        v19 = v34;
        if (!v20)
        {
          syslog(3, "%s ERROR: Unable to create CFDataRef for challenge", "IapAuthChallengeVerify");
          v21 = 0;
          v17 = 0;
          CertRef = v38;
          goto LABEL_44;
        }
        CertRef = v38;
        if (v34)
        {
          if ((v39 & 0xFFFFFFFE) == 2)
          {
            v35 = (SecKeyAlgorithm *)MEMORY[0x24BDE9330];
            if (v39 != 2)
              v35 = (SecKeyAlgorithm *)MEMORY[0x24BDE92D8];
            if (SecKeyVerifySignature((SecKeyRef)v18, *v35, v20, v34, &error))
            {
              v17 = 0;
              v21 = 1;
              goto LABEL_44;
            }
            if (error && (v36 = CFCopyDescription(error)) != 0)
            {
              v37 = v36;
              CFStringGetCStringPtr(v36, 0x8000100u);
              syslog(3, "%s ERROR: SecKeyVerifySignature returned false for auth version %d\n", "IapAuthChallengeVerify", v39);
              CFRelease(v37);
            }
            else
            {
              syslog(3, "%s ERROR: SecKeyVerifySignature returned false for auth version %d\n");
            }
          }
          else
          {
            syslog(3, "%s ERROR: Unsupported authVersion %d");
          }
        }
        else
        {
          syslog(3, "%s ERROR: Unable to create CFDataRef for response");
        }
        v21 = 0;
        v17 = 0;
        goto LABEL_44;
      }
      syslog(3, "%s ERROR: SecTrustCopyPublicKey returned pAccCertKey:NULL\n", "IapAuthChallengeVerify");
      v21 = 0;
      goto LABEL_42;
    }
    syslog(3, "%s ERROR: SecTrustEvaluate returned status rcOS:%02X\n");
LABEL_41:
    v21 = 0;
    v18 = 0;
LABEL_42:
    v17 = 0;
    goto LABEL_43;
  }
  syslog(3, "%s ERROR: CFArrayCreateMutable returned pCertAnchors:NULL\n", "IapAuthChallengeVerify");
  v21 = 0;
  v18 = 0;
LABEL_43:
  v20 = 0;
  v19 = 0;
LABEL_44:
  CFRelease(CertRef);
  CertRef = 0;
LABEL_45:
  if (trust)
    CFRelease(trust);
  if (v18)
    CFRelease(v18);
  if (CertRef)
    CFRelease(CertRef);
  if (v17)
    CFRelease(v17);
  if (v16)
    CFRelease(v16);
  if (v20)
    CFRelease(v20);
  if (v19)
    CFRelease(v19);
  if ((v21 & 1) == 0)
    PrintCertSerialNumber(a1, a2);
  return v21;
}

const void *GetCertRef(UInt8 *bytes, CFIndex length)
{
  CFDataRef v2;
  CFDataRef v3;
  const __CFArray *v4;
  const __CFArray *v5;
  const void *ValueAtIndex;
  const void *v7;

  v2 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (const __CFArray *)SecCMSCertificatesOnlyMessageCopyCertificates();
  if (v4)
  {
    v5 = v4;
    if (CFArrayGetCount(v4) < 1)
    {
      v7 = 0;
    }
    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, 0);
      v7 = ValueAtIndex;
      if (ValueAtIndex)
        CFRetain(ValueAtIndex);
    }
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

void PrintCertSerialNumber(UInt8 *a1, CFIndex a2)
{
  __int128 v2;
  unsigned __int8 *v3;
  unint64_t v4;
  _OWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v5[0] = v2;
  v5[1] = v2;
  v4 = 32;
  v3 = (unsigned __int8 *)v5;
  if (IapAuthCertSerial(a1, a2, (uint64_t)&v3, &v4))
    PrintSerialNumberBytes(v3, v4);
}

uint64_t IapAuthCertVerifyAuthVersion(UInt8 *a1, CFIndex a2, int a3)
{
  const void *CertRef;
  __CFArray *Mutable;
  __CFArray *v8;
  __CFArray *v9;
  uint64_t v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  int v21;
  SecTrustRef trust;

  trust = 0;
  v21 = -1431655766;
  CertRef = GetCertRef(a1, a2);
  if (!CertRef)
  {
    syslog(3, "%s ERROR: GetCertRef returned pCertRef:NULL\n", "IapAuthCertVerifyAuthVersion");
    v9 = 0;
    v8 = 0;
LABEL_15:
    v10 = 0;
    goto LABEL_44;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v8 = Mutable;
  if (!Mutable)
  {
    syslog(3, "%s ERROR: CFArrayCreateMutable returned pCertArray:NULL\n");
LABEL_14:
    v9 = 0;
    goto LABEL_15;
  }
  CFArrayAppendValue(Mutable, CertRef);
  CFRelease(CertRef);
  CertRef = (const void *)SecPolicyCreateiAP();
  if (!CertRef)
  {
    syslog(3, "%s ERROR: SecPolicyCreateiAP returned piAPPolicy:NULL\n");
    goto LABEL_14;
  }
  SecTrustCreateWithCertificates(v8, CertRef, &trust);
  if (!trust)
  {
    syslog(3, "%s ERROR: SecTrustCreateWithCertificates returned piAPTrust:NULL\n");
    goto LABEL_41;
  }
  v9 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (!v9)
  {
    syslog(3, "%s ERROR: CFArrayCreateMutable returned pCertAnchors:NULL\n", "IapAuthCertVerifyAuthVersion");
    v10 = 0;
    goto LABEL_43;
  }
  if (a3 == 3)
  {
    v11 = GetCertRef(kiPodAccessoryTestAuth3CA, 667);
    if (v11)
    {
      v12 = v11;
      CFArrayAppendValue(v9, v11);
      CFRelease(v12);
    }
    else
    {
      syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kiPodAccessoryTestAuth3CA\n", "IapAuthCertVerifyAuthVersion");
    }
    v13 = GetCertRef(kAuth3ECSSubCADev, 667);
    if (v13)
    {
      v14 = v13;
      CFArrayAppendValue(v9, v13);
      CFRelease(v14);
    }
    else
    {
      syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCADev\n", "IapAuthCertVerifyAuthVersion");
    }
    v15 = GetCertRef(kAuth3ECSSubCAProd, 667);
    if (v15)
    {
      v16 = v15;
      CFArrayAppendValue(v9, v15);
      CFRelease(v16);
    }
    else
    {
      syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCAProd\n", "IapAuthCertVerifyAuthVersion");
    }
    if (_findDeviceProperties_onceToken != -1)
      dispatch_once(&_findDeviceProperties_onceToken, &__block_literal_global_72);
    if (__isInternalBuild | __isDesenseBuild && __isInternalDeveloperDevice)
    {
      v17 = GetCertRef(kiPodAccessoryTestCAProto, 637);
      if (v17)
      {
        v18 = v17;
        CFArrayAppendValue(v9, v17);
        CFRelease(v18);
      }
      else
      {
        syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kiPodAccessoryTestCAProto\n", "IapAuthCertVerifyAuthVersion");
      }
      v19 = GetCertRef(kAuth3ECSSubCASimu, 667);
      if (v19)
      {
        v10 = (uint64_t)v19;
LABEL_37:
        CFArrayAppendValue(v9, (const void *)v10);
        CFRelease((CFTypeRef)v10);
        goto LABEL_39;
      }
      syslog(3, "%s ERROR: GetCertRef returned rcert:NULL for kAuth3ECSSubCASimu\n", "IapAuthCertVerifyAuthVersion");
    }
LABEL_39:
    SecTrustSetAnchorCertificates(trust, v9);
    CFRelease(v9);
    if (MEMORY[0x22E2E9530](trust, &v21))
    {
      syslog(3, "%s ERROR: SecTrustEvaluate returned status rcOS:%02X\n");
    }
    else
    {
      v9 = 0;
      v10 = 1;
      if (v21 == 1 || v21 == 4)
        goto LABEL_43;
      if (v21 == 5)
      {
        v10 = 1;
        syslog(3, "%s ERROR: SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X, ignore\n", "IapAuthCertVerifyAuthVersion", 4, 1, 5);
        goto LABEL_42;
      }
      syslog(3, "%s ERROR: SecTrustEvaluate wrong result, expect:%02X or %02X, actual:%02X\n");
    }
LABEL_41:
    v10 = 0;
LABEL_42:
    v9 = 0;
    goto LABEL_43;
  }
  if (a3 != 2)
    goto LABEL_39;
  v10 = SecCertificateCreateWithBytes();
  if (!v10)
  {
    syslog(3, "%s ERROR: SecCertificateCreateWithBytes returned pCertSubCA1:NULL\n");
    goto LABEL_43;
  }
  CFArrayAppendValue(v9, (const void *)v10);
  CFRelease((CFTypeRef)v10);
  v10 = SecCertificateCreateWithBytes();
  if (v10)
    goto LABEL_37;
  syslog(3, "%s ERROR: SecCertificateCreateWithBytes returned pCertSubCA2:NULL\n");
LABEL_43:
  CFRelease(CertRef);
  CertRef = 0;
LABEL_44:
  if (trust)
    CFRelease(trust);
  if (CertRef)
    CFRelease(CertRef);
  if (v8)
    CFRelease(v8);
  if (v9)
    CFRelease(v9);
  if ((v10 & 1) == 0)
    PrintCertSerialNumber(a1, a2);
  return v10;
}

uint64_t IapAuthCertSerial(UInt8 *a1, CFIndex a2, uint64_t a3, unint64_t *a4)
{
  __SecCertificate *CertRef;
  __SecCertificate *v7;
  const __CFData *v8;
  const __CFData *v9;
  unint64_t Length;
  unint64_t v11;
  unsigned __int8 *BytePtr;
  uint64_t v13;
  void *v15;
  const UInt8 *v16;
  BOOL v17;
  int v18;

  if (!a1 || !a2 || !a3 || !a4)
  {
    syslog(3, "%s ERROR: Invalid parameter(s) pCert:%hhx, certLen:%04lX, ppOutBuf:%hhx, pOutLen:%hhx\n");
    return 0;
  }
  CertRef = (__SecCertificate *)GetCertRef(a1, a2);
  if (!CertRef)
  {
    syslog(3, "%s ERROR: GetCertRef returned pCertRef:NULL\n");
    return 0;
  }
  v7 = CertRef;
  v8 = SecCertificateCopySerialNumber(CertRef);
  if (!v8)
  {
    syslog(3, "%s ERROR: SecCertificateCopySerialNumber returned certificate pSerialNum:NULL\n", "IapAuthCertSerial");
    CFRelease(v7);
    return 0;
  }
  v9 = v8;
  Length = CFDataGetLength(v8);
  v11 = Length;
  if (*a4 < Length)
  {
    syslog(3, "%s ERROR: Cert serial number output buffer size too small, outLen:%04lX < certSerLen:%04lX\n", "IapAuthCertSerial", *a4, Length);
LABEL_9:
    BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v9);
    PrintSerialNumberBytes(BytePtr, v11);
    goto LABEL_10;
  }
  v15 = *(void **)a3;
  if (*(_QWORD *)a3)
  {
    v16 = CFDataGetBytePtr(v9);
    memcpy(v15, v16, v11);
    *a4 = v11;
    if (_findDeviceProperties_onceToken != -1)
      dispatch_once(&_findDeviceProperties_onceToken, &__block_literal_global_72);
    if (__isInternalDeveloperDevice)
      v17 = __isInternalBuild == 0;
    else
      v17 = 1;
    if (!v17 || __isDeveloperBuild)
    {
      v18 = SecCertificateGetiAuthVersion();
      v13 = 1;
      if (v11 == 15 && v18 == 2)
        *(_BYTE *)(*(_QWORD *)a3 + 7) &= ~0x80u;
    }
    else
    {
      v13 = 1;
    }
    goto LABEL_11;
  }
  syslog(3, "%s ERROR: *outBuf pointer is NULL\n", "IapAuthCertSerial");
  if (v11)
    goto LABEL_9;
LABEL_10:
  v13 = 0;
LABEL_11:
  CFRelease(v7);
  CFRelease(v9);
  return v13;
}

void PrintSerialNumberBytes(unsigned __int8 *a1, unint64_t a2)
{
  unint64_t v2;
  char *v4;
  int v5;
  char v6[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[31];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  memset(v20, 0, sizeof(v20));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  *(_OWORD *)v6 = 0u;
  if (a2 > 0x7D)
    PrintSerialNumberBytes_cold_1();
  v2 = a2;
  if (a2)
  {
    v4 = v6;
    while (1)
    {
      v5 = sprintf(v4, "%02X", *a1);
      if (v5 < 1)
        break;
      ++a1;
      v4 += v5;
      if (!--v2)
        goto LABEL_8;
    }
    syslog(3, "%s ERROR: sprintf status:%02X\n", "PrintSerialNumberBytes", v5);
  }
LABEL_8:
  syslog(3, "Certificate serial number: [%s]\n", v6);
}

BOOL IapAuthVerifyCertSerialNumber(UInt8 *a1, CFIndex a2, int a3)
{
  __int128 v3;
  uint64_t v4;
  unint64_t v6;
  unsigned __int8 *v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = v3;
  v8[1] = v3;
  v7 = (unsigned __int8 *)v8;
  v6 = 32;
  if (a3 == 2)
    v4 = 15;
  else
    v4 = 16;
  if (IapAuthCertSerial(a1, a2, (uint64_t)&v7, &v6))
  {
    if (v6 == v4)
      return MFiVerifyCertificateSerialNumber(v7, v4) == 0;
    syslog(3, "%s AuthVer:%1X serial number wrong length, expect:%02lX, actual:%02lX\n");
  }
  else
  {
    syslog(3, "%s AuthVer:%1X IapAuthCertSerial call fail bSerNumValid:%d\n");
  }
  return 0;
}

uint64_t MFiVerifyCertificateSerialNumber(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int NumRevokedAuthICBatches;
  _QWORD *RevokedAuthICBatches;
  int v13;
  int v14;
  unint64_t v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int NumRevokedAuth3Wafers;
  _QWORD *RevokedAuth3Wafers;
  int v25;
  int v26;
  unint64_t v27;
  unsigned __int8 *v29;
  unint64_t v30;
  int v31;
  unsigned int v32;
  char *v33;
  uint64_t v34;
  int v35;
  int v36;
  unsigned int v37;
  int v38;
  int v39;
  int v40;

  if (!a1)
  {
    syslog(3, "%s:%d ERROR NULL serial number pointer\n");
    return 4294967246;
  }
  if (a2 != 16)
  {
    if (a2 == 15)
    {
      v3 = *a1;
      v4 = a1[1];
      v5 = a1[3];
      v6 = a1[4];
      v7 = a1[5];
      v8 = a1[7];
      v9 = a1[9];
      v10 = a1[10];
      v39 = a1[13];
      v40 = a1[12];
      v38 = a1[14];
      NumRevokedAuthICBatches = getNumRevokedAuthICBatches();
      RevokedAuthICBatches = getRevokedAuthICBatches();
      v13 = NumRevokedAuthICBatches - 1;
      if (NumRevokedAuthICBatches < 1)
        return 0;
      v14 = 0;
      v15 = ((v3 << 56) | (v4 << 48) | (v5 << 40) | (v6 << 32) | (v7 << 24) | (v8 << 16) | (v9 << 8)) + v10;
      while (1)
      {
        v16 = v13 + v14;
        if (v13 + v14 >= 0)
          v17 = v13 + v14;
        else
          v17 = v16 + 1;
        v18 = v17 >> 1;
        v19 = (uint64_t)v17 >> 1;
        v20 = RevokedAuthICBatches[3 * v18];
        if (v20 <= v15)
        {
          if (v20 >= v15)
          {
            if ((v16 + 3) >= 2)
            {
              v31 = 0;
              v32 = (v40 << 16) | (v39 << 8) | v38;
              v33 = (char *)&RevokedAuthICBatches[3 * (int)v19];
              v34 = *((_QWORD *)v33 + 2);
              v35 = *((_DWORD *)v33 + 2);
              while (v31 < v35)
              {
                v36 = (v35 - 1 + v31) / 2;
                v37 = (*(unsigned __int8 *)(v34 + 3 * v36) << 16) | (*(unsigned __int8 *)(v34 + 3 * v36 + 1) << 8) | *(unsigned __int8 *)(v34 + 3 * v36 + 2);
                if (v37 > v32)
                {
                  v35 = (v35 - 1 + v31) / 2;
                }
                else
                {
                  v31 = v36 + 1;
                  if (v37 >= v32)
                  {
                    v21 = 4294899610;
                    syslog(3, "%s:%d ERROR: Auth:%02X Revoked certificate match found !\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", 1403, 2);
                    v29 = a1;
                    v30 = 15;
                    goto LABEL_27;
                  }
                }
              }
            }
            return 0;
          }
          v14 = v19 + 1;
        }
        else
        {
          v13 = v19 - 1;
        }
        if (v14 > v13)
          return 0;
      }
    }
    syslog(3, "%s:%d ERROR Unsupported serial number length: %02X\n");
    return 4294967246;
  }
  if ((char)*a1 < 0)
  {
    syslog(3, "%s:%d ERROR Invalid WaferID MSB byte:%02X\n");
    return 4294967246;
  }
  v22 = ((unint64_t)*a1 << 40) | ((unint64_t)a1[1] << 32) | ((unint64_t)a1[2] << 24) | ((unint64_t)a1[3] << 16) | ((unint64_t)a1[4] << 8) | a1[5];
  NumRevokedAuth3Wafers = getNumRevokedAuth3Wafers();
  RevokedAuth3Wafers = getRevokedAuth3Wafers();
  v25 = 0;
  do
  {
    while (1)
    {
      if (v25 >= NumRevokedAuth3Wafers)
        return 0;
      v26 = (NumRevokedAuth3Wafers - 1 + v25) / 2;
      v27 = RevokedAuth3Wafers[v26];
      if (v27 <= v22)
        break;
      NumRevokedAuth3Wafers = (NumRevokedAuth3Wafers - 1 + v25) / 2;
    }
    v25 = v26 + 1;
  }
  while (v27 < v22);
  v21 = 4294899610;
  syslog(3, "%s:%d ERROR: Revoked wafer match found !\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", 1429);
  v29 = a1;
  v30 = 16;
LABEL_27:
  PrintSerialNumberBytes(v29, v30);
  return v21;
}

uint64_t IapAuthGetCertClassAuthV2(UInt8 *a1, CFIndex a2)
{
  uint64_t result;
  unsigned __int8 *v3;
  unint64_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  v5[1] = 0xAAAAAAAAAAAAAAAALL;
  v4 = 16;
  v3 = (unsigned __int8 *)v5;
  if (!IapAuthCertSerial(a1, a2, (uint64_t)&v3, &v4) || v4 != 15)
  {
    if (v4 != 15)
    {
      syslog(3, "%s:%d ERROR (if auth v2, not v3): Certificate serial number size invalid, expect:%02lX, actual:%02lX\n");
      goto LABEL_9;
    }
    if (v3[7] < 0x11u)
      return 0x7FFFFFFFLL;
LABEL_7:
    syslog(3, "%s:%d ERROR (if auth v2, not v3): Certificate serial number class invalid, actual:%02X > maximum:%02X\n");
LABEL_9:
    PrintSerialNumberBytes(v3, v4);
    return 0x7FFFFFFFLL;
  }
  result = v3[7];
  if (result > 0x10)
    goto LABEL_7;
  return result;
}

void ___findDeviceProperties_block_invoke()
{
  const void *v0;
  const void *v1;
  const __CFBoolean *v2;

  __isInternalBuild = 0;
  __isDesenseBuild = 0;
  __isDeveloperBuild = 0;
  __isInternalDeveloperDevice = 0;
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    __isInternalBuild = CFEqual(v0, CFSTR("Internal")) != 0;
    __isDesenseBuild = CFEqual(v1, CFSTR("Desense")) != 0;
    __isDeveloperBuild = CFEqual(v1, CFSTR("Beta")) != 0;
    CFRelease(v1);
  }
  else
  {
    __isInternalBuild = 0;
    __isDesenseBuild = 0;
    __isDeveloperBuild = 0;
  }
  v2 = (const __CFBoolean *)MGCopyAnswer();
  __isInternalDeveloperDevice = CFBooleanGetValue(v2) == 0;
  CFRelease(v2);
}

uint64_t getNumRevokedAuth3Wafers()
{
  return 26;
}

void *getRevokedAuth3Wafers()
{
  return &wafers;
}

uint64_t getNumRevokedAuthICBatches()
{
  return 65;
}

void *getRevokedAuthICBatches()
{
  return &prefix;
}

BOOL VerifyCertSerialNumber(const void *a1)
{
  UInt8 *BytePtr;
  CFIndex Length;
  const void *SecCertRef;
  const void *v5;
  unsigned __int16 v6;
  _BOOL8 v7;

  CFRetain(a1);
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)a1);
  Length = CFDataGetLength((CFDataRef)a1);
  SecCertRef = GetSecCertRef(BytePtr, Length);
  if (SecCertRef)
  {
    v5 = SecCertRef;
    v6 = SecCertificateGetiAuthVersion();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = IapAuthVerifyCertSerialNumber(BytePtr, Length, v6);
  CFRelease(a1);
  return v7;
}

const void *GetSecCertRef(UInt8 *bytes, CFIndex length)
{
  CFDataRef v2;
  CFDataRef v3;
  const __CFArray *v4;
  const __CFArray *v5;
  const void *ValueAtIndex;
  const void *v7;

  v2 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = (const __CFArray *)SecCMSCertificatesOnlyMessageCopyCertificates();
  if (v4)
  {
    v5 = v4;
    if (CFArrayGetCount(v4) < 1)
    {
      v7 = 0;
    }
    else
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v5, 0);
      v7 = ValueAtIndex;
      if (ValueAtIndex)
        CFRetain(ValueAtIndex);
    }
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

uint64_t VerifyCertAuthority(const void *a1)
{
  UInt8 *BytePtr;
  CFIndex Length;
  const void *SecCertRef;
  const void *v5;
  int v6;
  uint64_t v7;

  CFRetain(a1);
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)a1);
  Length = CFDataGetLength((CFDataRef)a1);
  SecCertRef = GetSecCertRef(BytePtr, Length);
  if (SecCertRef)
  {
    v5 = SecCertRef;
    v6 = SecCertificateGetiAuthVersion();
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = IapAuthCertVerifyAuthVersion(BytePtr, Length, v6);
  CFRelease(a1);
  return v7;
}

const __CFData *VerifyCertAuthorityDictionary(const void *a1)
{
  const __CFData *Value;
  const __CFNumber *v3;
  int v4;
  int v5;
  unsigned __int8 v6;
  UInt8 *BytePtr;
  CFIndex Length;
  char valuePtr;

  CFRetain(a1);
  Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("kAuthCertBufferKey"));
  if (Value)
  {
    v3 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("kAuthVersionKey"));
    v4 = 2;
    if (v3)
    {
      valuePtr = 2;
      v5 = CFNumberGetValue(v3, kCFNumberCharType, &valuePtr);
      v6 = valuePtr;
      if (!v5)
        v6 = 2;
      v4 = v6;
    }
    BytePtr = (UInt8 *)CFDataGetBytePtr(Value);
    Length = CFDataGetLength(Value);
    if (IapAuthCertVerifyAuthVersion(BytePtr, Length, v4))
      Value = (const __CFData *)VerifyCertSerialNumber(Value);
    else
      Value = 0;
  }
  CFRelease(a1);
  return Value;
}

uint64_t VerifyNonceSigned(const void *a1)
{
  const __CFData *Value;
  const __CFData *v3;
  const __CFData *v4;
  const __CFData *v5;
  const __CFNumber *v6;
  int v7;
  int v8;
  unsigned __int8 v9;
  const __CFData *v10;
  UInt8 *BytePtr;
  CFIndex Length;
  const UInt8 *v13;
  CFIndex v14;
  const UInt8 *v15;
  CFIndex v16;
  uint64_t v17;
  char valuePtr;

  CFRetain(a1);
  Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("kAuthCertBufferKey"));
  if (Value
    && (v3 = Value,
        (v4 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("kAuthNonceBufferKey"))) != 0))
  {
    v5 = v4;
    v6 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("kAuthVersionKey"));
    v7 = 2;
    if (v6)
    {
      valuePtr = 2;
      v8 = CFNumberGetValue(v6, kCFNumberCharType, &valuePtr);
      v9 = valuePtr;
      if (!v8)
        v9 = 2;
      v7 = v9;
    }
    v10 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("kAuthResponseBufferKey"));
    BytePtr = (UInt8 *)CFDataGetBytePtr(v3);
    Length = CFDataGetLength(v3);
    v13 = CFDataGetBytePtr(v5);
    v14 = CFDataGetLength(v5);
    v15 = CFDataGetBytePtr(v10);
    v16 = CFDataGetLength(v10);
    v17 = IapAuthChallengeVerify(BytePtr, Length, v13, v14, v15, v16, v7);
  }
  else
  {
    v17 = 0;
  }
  CFRelease(a1);
  return v17;
}

uint64_t GetCertClass(const void *a1)
{
  UInt8 *BytePtr;
  CFIndex Length;
  uint64_t CertClassAuthV2;

  CFRetain(a1);
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)a1);
  Length = CFDataGetLength((CFDataRef)a1);
  CertClassAuthV2 = IapAuthGetCertClassAuthV2(BytePtr, Length);
  CFRelease(a1);
  return CertClassAuthV2;
}

void GetRandomDigest(size_t a1, CFDataRef *a2)
{
  void *v4;

  v4 = malloc_type_malloc(a1, 0x5B49ACD2uLL);
  arc4random_buf(v4, a1);
  *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v4, a1);
  free(v4);
}

unint64_t *AllocCapsFromAuthCert(const __CFData *a1, int a2, uint64_t *a3)
{
  unint64_t *v6;
  unint64_t *v7;
  CFIndex Length;
  UInt8 *BytePtr;
  const void *SecCertRef;
  const void *v11;
  unsigned int CertClass;
  const __CFData *v13;
  const __CFData *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v6 = (unint64_t *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
  v7 = v6;
  if (v6)
  {
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    if (a1)
    {
      Length = CFDataGetLength(a1);
      BytePtr = (UInt8 *)CFDataGetBytePtr(a1);
      SecCertRef = GetSecCertRef(BytePtr, Length);
      if (SecCertRef)
      {
        v11 = SecCertRef;
        if (!a2)
          a2 = SecCertificateGetiAuthVersion();
        if (a2 == 3)
        {
          v13 = (const __CFData *)SecCertificateCopyiAPAuthCapabilities();
          if (v13)
          {
            v14 = v13;
            v15 = (unint64_t *)CFDataGetBytePtr(v13);
            if (CFDataGetLength(v14) == 32)
            {
              v16 = bswap64(*v15);
              v17 = bswap64(v15[1]);
              v18 = bswap64(v15[2]);
              v19 = bswap64(v15[3]);
              v20 = v19 & 0xFFFFFFFFFFFFFFFELL;
              if ((v19 & 4) != 0)
                v20 = v19 & 0xFFFFFFFFFFFFF0FELL | 0xF00;
              if ((v19 & 2) != 0)
                v21 = v19 & 0xFFFFFFFFFFFFF0FELL | 0xF00;
              else
                v21 = v20;
              CFRelease(v14);
              *v7 = v21;
              v7[1] = v18;
              v7[2] = v17;
              v7[3] = v16;
              syslog(4, "%s AuthV3 orig authCertCaps0:%08llX -> final authCertCaps0:%08llX\n");
LABEL_21:
              CFRelease(v11);
              v22 = 32;
              if (!a3)
                return v7;
              goto LABEL_28;
            }
            CFRelease(v14);
          }
          else
          {
            syslog(3, "%s No AuthV3 Caps found in cert !\n");
          }
        }
        else if (a2 == 2)
        {
          CertClass = GetCertClass(a1);
          if (CertClass < 0xD)
          {
            *v7 = GetAccessoryCaps_kCertAccessoryCaps[CertClass];
            v7[2] = 0;
            v7[3] = 0;
            v7[1] = 0;
            syslog(4, "%s AuthV2 authCertClass:%02X -> authCertCaps0:%08llX\n");
            goto LABEL_21;
          }
        }
        else
        {
          syslog(3, "%s Unrecognized/unsupported authVerMajor:%02X (pSecCertRef:%04X)\n");
        }
        CFRelease(v11);
      }
      else
      {
        syslog(3, "%s NULL cert reference\n");
      }
    }
    else
    {
      syslog(3, "%s NULL cert data\n");
    }
    syslog(3, "%s GetAccessoryCaps failed bStatus:%d\n", "AllocCapsFromAuthCert", 0);
    free(v7);
    v7 = 0;
  }
  else
  {
    syslog(3, "%s Object allocation failed pAccCaps:%hhx\n", "AllocCapsFromAuthCert", 0);
  }
  v22 = 0;
  if (a3)
LABEL_28:
    *a3 = v22;
  return v7;
}

unsigned __int8 *IsAppleHWModule(unsigned __int8 *result)
{
  if (result)
    return (unsigned __int8 *)((*result >> 3) & 1);
  return result;
}

unsigned __int8 *IsAppleMFiAccessory(unsigned __int8 *result)
{
  if (result)
    return (unsigned __int8 *)((*result >> 4) & 1);
  return result;
}

uint64_t CanChargeHighVoltage(uint64_t result)
{
  if (result)
    return *(_BYTE *)(result + 1) & 1;
  return result;
}

uint64_t CanChargeInductive(uint64_t result)
{
  if (result)
    return (*(unsigned __int8 *)(result + 1) >> 1) & 1;
  return result;
}

uint64_t CanUseAccPwrUHPM(uint64_t result)
{
  if (result)
    return (*(unsigned __int8 *)(result + 1) >> 2) & 1;
  return result;
}

uint64_t CanUseAccPwrLoV(uint64_t result)
{
  if (result)
    return (*(unsigned __int8 *)(result + 1) >> 3) & 1;
  return result;
}

_BYTE *IsAppleAccessory(_BYTE *result)
{
  if (result)
    return (_BYTE *)((*result & 0x18) == 0);
  return result;
}

void PrintSerialNumberBytes_cold_1()
{
  CC_SHA1_CTX *v0;

  _os_assert_log();
  v0 = (CC_SHA1_CTX *)_os_crash();
  __break(1u);
  CC_SHA1_Init(v0);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t SecCMSCertificatesOnlyMessageCopyCertificates()
{
  return MEMORY[0x24BDE8810]();
}

uint64_t SecCMSCreateCertificatesOnlyMessageIAP()
{
  return MEMORY[0x24BDE8818]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

CFDataRef SecCertificateCopySerialNumber(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE88D8](certificate);
}

uint64_t SecCertificateCopyiAPAuthCapabilities()
{
  return MEMORY[0x24BDE8900]();
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x24BDE8910]();
}

uint64_t SecCertificateGetiAuthVersion()
{
  return MEMORY[0x24BDE8950]();
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x24BDE8BA8](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateiAP()
{
  return MEMORY[0x24BDE8C90]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x24BDE8DC8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8DE0](trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x24BDE8E28](trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

