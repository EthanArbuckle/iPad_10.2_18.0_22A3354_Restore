@implementation CertUIPrompt

+ (id)stringForResponse:(int)a3
{
  __CFString *v3;
  __CFString *v4;
  uint64_t i;
  __int128 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v7 = xmmword_24C35DCB0;
  v8 = CFSTR("CertUIResponseAllowPermanently");
  if (a3 > 2)
    v3 = CFSTR("Unknown");
  else
    v3 = (__CFString *)*((_QWORD *)&v7 + a3);
  v4 = v3;
  for (i = 16; i != -8; i -= 8)

  return v4;
}

- (CertUIPrompt)init
{
  CertUIPrompt *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CertUIPrompt;
  v2 = -[CertUIPrompt init](&v4, sel_init);
  if (v2)
    CertUILoggingInitialize();
  return v2;
}

- (void)dealloc
{
  __SecTrust *trust;
  objc_super v4;

  trust = self->_trust;
  if (trust)
  {
    CFRelease(trust);
    self->_trust = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CertUIPrompt;
  -[CertUIPrompt dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CertUIPrompt;
  -[CertUIPrompt description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": host: %@ service: %@"), self->_host, self->_service);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setTrust:(__SecTrust *)a3
{
  __SecTrust *trust;
  __SecTrust *v6;

  trust = self->_trust;
  if (trust != a3)
  {
    if (trust)
    {
      CFRelease(trust);
      self->_trust = 0;
    }
    if (a3)
      v6 = (__SecTrust *)CFRetain(a3);
    else
      v6 = 0;
    self->_trust = v6;
  }
}

- (__SecTrust)trust
{
  return self->_trust;
}

- (NSString)connectionDisplayName
{
  NSString *connectionDisplayName;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;

  connectionDisplayName = self->_connectionDisplayName;
  if (connectionDisplayName)
  {
    v3 = connectionDisplayName;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v3 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processName");
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

+ (id)promptQueue
{
  if (promptQueue_sQueueOnce != -1)
    dispatch_once(&promptQueue_sQueueOnce, &__block_literal_global_1);
  return (id)promptQueue_sPromptQueue;
}

void __27__CertUIPrompt_promptQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.CertUIPromptQueue", 0);
  v1 = (void *)promptQueue_sPromptQueue;
  promptQueue_sPromptQueue = (uint64_t)v0;

}

- (id)_sendablePropertyFromProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDE9480]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDE94B0]))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x24BDE9488];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDE9488]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = (void *)v9;
    objc_msgSend(v6, "setObject:forKey:", v9, v7);

    goto LABEL_6;
  }
  v6 = v4;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDE94A0]))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x24BDE9488];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDE9488]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUIPrompt _sendablePropertiesFromProperties:](self, "_sendablePropertiesFromProperties:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (id)_sendablePropertiesFromProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[CertUIPrompt _sendablePropertyFromProperty:](self, "_sendablePropertyFromProperty:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_copyPropertiesFromTrust:(__SecTrust *)a3
{
  id v4;
  int CertificateCount;
  CFIndex v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;

  if (!a3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount >= 1)
  {
    v6 = 0;
    v7 = CertificateCount;
    do
    {
      SecTrustGetCertificateAtIndex(a3, v6);
      v8 = SecCertificateCopyProperties();
      if (v8)
      {
        v9 = (const void *)v8;
        objc_msgSend(v4, "addObject:", v8);
        CFRelease(v9);
      }
      ++v6;
    }
    while (v7 != v6);
  }
  return v4;
}

- (id)_sendablePropertiesFromTrust:(__SecTrust *)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = -[CertUIPrompt _copyPropertiesFromTrust:](self, "_copyPropertiesFromTrust:", a3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[CertUIPrompt _sendablePropertiesFromProperties:](self, "_sendablePropertiesFromProperties:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_titleFromTrust:(__SecTrust *)a3
{
  __SecCertificate *CertificateAtIndex;
  __CFString *v5;

  if (SecTrustGetCertificateCount(a3) < 1)
  {
    v5 = 0;
  }
  else
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0);
    v5 = (__CFString *)SecCertificateCopySubjectSummary(CertificateAtIndex);
  }
  return v5;
}

- (id)_issuerFromTrust:(__SecTrust *)a3
{
  void *v4;

  if (SecTrustGetCertificateCount(a3) < 1)
  {
    v4 = 0;
  }
  else
  {
    SecTrustGetCertificateAtIndex(a3, 0);
    v4 = (void *)SecCertificateCopyIssuerSummary();
  }
  return v4;
}

- (id)_subtitleFromTrust:(__SecTrust *)a3
{
  CFIndex CertificateCount;
  __SecCertificate *CertificateAtIndex;
  __CFString *v6;

  CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount < 2)
  {
    v6 = 0;
  }
  else
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, CertificateCount - 1);
    v6 = (__CFString *)SecCertificateCopySubjectSummary(CertificateAtIndex);
  }
  return v6;
}

- (id)_propertyNamed:(id)a3 ofType:(id)a4 inProperties:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v20 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    v11 = *MEMORY[0x24BDE9470];
    v12 = *MEMORY[0x24BDE9480];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKey:", v11, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v7) & 1) != 0)
        {
          objc_msgSend(v14, "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v20);

          if (v17)
          {
            objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDE9488]);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }
  v18 = 0;
LABEL_13:

  return v18;
}

- (id)_purposeFromTrustProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertUIPrompt _propertyNamed:ofType:inProperties:](self, "_propertyNamed:ofType:inProperties:", CFSTR("2.5.29.37"), *MEMORY[0x24BDE94A0], v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CertUIPrompt _propertyNamed:ofType:inProperties:](self, "_propertyNamed:ofType:inProperties:", CFSTR("Purpose"), *MEMORY[0x24BDE94A8], v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_expirationFromTrust:(__SecTrust *)a3
{
  CFIndex CertificateCount;
  CFIndex v5;
  CFIndex v6;
  int v7;
  double v8;
  double v9;
  int v10;
  CFDateRef v11;

  CertificateCount = SecTrustGetCertificateCount(a3);
  if (CertificateCount < 1)
    goto LABEL_9;
  v5 = CertificateCount;
  v6 = 0;
  v7 = 0;
  v8 = *MEMORY[0x24BDBD230];
  do
  {
    if (SecTrustGetCertificateAtIndex(a3, v6))
    {
      SecCertificateNotValidAfter();
      v10 = v7 ^ 1 | (v9 < v8);
      v7 |= v10;
      if ((v10 & 1) != 0)
        v8 = v9;
    }
    ++v6;
  }
  while (v5 != v6);
  if ((v7 & 1) != 0)
    v11 = CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v8);
  else
LABEL_9:
    v11 = 0;
  return v11;
}

- (BOOL)_isRootCertificateFromTrust:(__SecTrust *)a3
{
  if (SecTrustGetCertificateCount(self->_trust) < 1)
    return 0;
  SecTrustGetCertificateAtIndex(self->_trust, 0);
  return SecCertificateIsSelfSignedCA();
}

- (id)_digestFromTrust:(__SecTrust *)a3
{
  void *v4;

  if (SecTrustGetCertificateCount(a3) < 1)
  {
    v4 = 0;
  }
  else
  {
    SecTrustGetCertificateAtIndex(a3, 0);
    v4 = (void *)objc_msgSend((id)SecCertificateGetSHA1Digest(), "copy");
  }
  return v4;
}

- (id)_newUserInfoWithHostname:(id)a3 trust:(__SecTrust *)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 12);
  v11 = v10;
  if (v8)
    objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("kCertUITrustHostnameKey"));
  -[CertUIPrompt _sendablePropertiesFromTrust:](self, "_sendablePropertiesFromTrust:", a4);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("kCertUITrustPropertiesKey"));
  -[CertUIPrompt _titleFromTrust:](self, "_titleFromTrust:", a4);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("kCertUITrustTitleKey"));
  -[CertUIPrompt _issuerFromTrust:](self, "_issuerFromTrust:", a4);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("kCertUITrustIssuerKey"));
  -[CertUIPrompt _subtitleFromTrust:](self, "_subtitleFromTrust:", a4);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("kCertUITrustSubtitleKey"));
  -[CertUIPrompt _purposeFromTrustProperties:](self, "_purposeFromTrustProperties:", v12);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("kCertUITrustPurposeKey"));
  v37 = (void *)v14;
  -[CertUIPrompt _expirationFromTrust:](self, "_expirationFromTrust:", a4);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("kCertUITrustExpirationKey"));
  v34 = (void *)v17;
  v18 = -[CertUIPrompt _isRootCertificateFromTrust:](self, "_isRootCertificateFromTrust:", a4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v19, CFSTR("kCertUITrustIsRootCertificateKey"));

  -[CertUIPrompt _digestFromTrust:](self, "_digestFromTrust:", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v11, "setObject:forKey:", v20, CFSTR("kCertUITrustDigestKey"));
  v35 = (void *)v16;
  objc_msgSend(v9, "objectForKey:", CFSTR("allowCertificateTrust"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v13;
  v36 = (void *)v15;
  v22 = (void *)v12;
  if (v21)
  {
    objc_msgSend(v11, "setObject:forKey:", v21, CFSTR("kCertUITrustAllowCertificateTrust"));
    v23 = objc_msgSend(v21, "BOOLValue") ^ 1;
  }
  else
  {
    v23 = 0;
  }
  v24 = v8;
  v25 = v9;
  objc_msgSend(v9, "objectForKey:", CFSTR("showCertificateDetails"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v11, "setObject:forKey:", v26, CFSTR("kCertUITrustShowCertificateDetailsKey"));
    v27 = objc_msgSend(v26, "BOOLValue") ^ 1;
  }
  else
  {
    v27 = 0;
  }
  objc_msgSend(v25, "objectForKey:", CFSTR("showContinue"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if ((v23 | v27) == 1)
  {

    v29 = (void *)MEMORY[0x24BDBD1C0];
    v30 = v24;
    v31 = v33;
LABEL_26:
    objc_msgSend(v11, "setObject:forKey:", v29, CFSTR("kCertUITrustShowContinueKey"));

    goto LABEL_27;
  }
  v30 = v24;
  v31 = v33;
  if (v28)
    goto LABEL_26;
LABEL_27:

  return v11;
}

- (id)_messagingCenter
{
  return (id)objc_msgSend(MEMORY[0x24BE04768], "centerNamed:", CFSTR("com.apple.certui.relay"));
}

- (int)_responseFromReplyDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("kCertUITrustResponseKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v11 = _CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      v8 = "Can't find value for trust response key";
      v9 = v11;
      v10 = 2;
      goto LABEL_7;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("kCertUITrustResponseKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 >= 3)
  {
    v7 = _CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      v13[0] = 67109120;
      v13[1] = v6;
      v8 = "Invalid value for response %d";
      v9 = v7;
      v10 = 8;
LABEL_7:
      _os_log_impl(&dword_20AA96000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v13, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (int)_sendRemoteMessage
{
  return -[CertUIPrompt _sendRemoteMessageWithPromptOptions:](self, "_sendRemoteMessageWithPromptOptions:", 0);
}

- (int)_sendRemoteMessageWithPromptOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = -[CertUIPrompt _newUserInfoWithHostname:trust:options:](self, "_newUserInfoWithHostname:trust:options:", self->_host, self->_trust, a3);
  -[CertUIPrompt _messagingCenter](self, "_messagingCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "sendMessageAndReceiveReplyName:userInfo:error:", CFSTR("kCertUIPresentTrustInfoMessage"), v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v7)
  {
    v8 = _CertUILogObjects;
    if (os_log_type_enabled((os_log_t)_CertUILogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_20AA96000, v8, OS_LOG_TYPE_ERROR, "Error receiving blocking reply from ui app %@", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v9 = -[CertUIPrompt _responseFromReplyDict:](self, "_responseFromReplyDict:", v6);
  }

  return v9;
}

- (void)showPromptWithResponseBlock:(id)a3
{
  -[CertUIPrompt showPromptWithOptions:responseBlock:](self, "showPromptWithOptions:responseBlock:", 0, a3);
}

- (void)showPromptWithOptions:(id)a3 responseBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  +[CertUIPrompt promptQueue](CertUIPrompt, "promptQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CertUIPrompt_showPromptWithOptions_responseBlock___block_invoke;
  block[3] = &unk_24C35DCD0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __52__CertUIPrompt_showPromptWithOptions_responseBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_sendRemoteMessageWithPromptOptions:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_informConsumerOfResponse:(int)a3
{
  id responseBlock;

  (*((void (**)(void))self->_responseBlock + 2))();
  responseBlock = self->_responseBlock;
  self->_responseBlock = 0;

}

- (int)showAndWaitForResponse
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  +[CertUIPrompt promptQueue](CertUIPrompt, "promptQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__CertUIPrompt_showAndWaitForResponse__block_invoke;
  v5[3] = &unk_24C35DCF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

uint64_t __38__CertUIPrompt_showAndWaitForResponse__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_sendRemoteMessage");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
  objc_storeStrong((id *)&self->_host, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void)setConnectionDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_connectionDisplayName, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
