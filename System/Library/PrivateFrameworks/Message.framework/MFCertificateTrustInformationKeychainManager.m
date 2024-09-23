@implementation MFCertificateTrustInformationKeychainManager

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MFCertificateTrustInformationKeychainManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1)
    dispatch_once(&log_onceToken_10, block);
  return (OS_os_log *)(id)log_log_10;
}

void __51__MFCertificateTrustInformationKeychainManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;

}

- (MFCertificateTrustInformationKeychainManager)initWithTrustInformation:(id)a3
{
  id v5;
  MFCertificateTrustInformationKeychainManager *v6;
  MFCertificateTrustInformationKeychainManager *v7;
  CertUITrustManager *v8;
  CertUITrustManager *keychainManager;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *addressForSaving;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MFCertificateTrustInformationKeychainManager;
  v6 = -[MFCertificateTrustInformationKeychainManager init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trustInformation, a3);
    v8 = +[MFMessageKeychainManager newTrustManager](MFMessageKeychainManager, "newTrustManager");
    keychainManager = v7->_keychainManager;
    v7->_keychainManager = v8;

    -[EMCertificateTrustInformation sender](v7->_trustInformation, "sender");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emailAddressValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "simpleAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v10, "stringValue");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    addressForSaving = v7->_addressForSaving;
    v7->_addressForSaving = v15;

  }
  return v7;
}

- (BOOL)canSaveCertificateToKeychain
{
  if (self)
    self = (MFCertificateTrustInformationKeychainManager *)self->_trustInformation;
  return -[MFCertificateTrustInformationKeychainManager certificateType](self, "certificateType") == 1;
}

- (int)action
{
  CertUITrustManager *v3;
  EMCertificateTrustInformation *trustInformation;
  EMCertificateTrustInformation *v5;
  uint64_t v6;
  void *v7;

  if (self)
  {
    v3 = self->_keychainManager;
    trustInformation = self->_trustInformation;
  }
  else
  {
    v3 = 0;
    trustInformation = 0;
  }
  v5 = trustInformation;
  v6 = -[EMCertificateTrustInformation trust](v5, "trust");
  -[MFCertificateTrustInformationKeychainManager addressForSaving](self, "addressForSaving");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[CertUITrustManager actionForSMIMETrust:sender:](v3, "actionForSMIMETrust:sender:", v6, v7);

  return v6;
}

- (BOOL)hasTrustException
{
  CertUITrustManager *v3;
  EMCertificateTrustInformation *trustInformation;
  EMCertificateTrustInformation *v5;
  uint64_t v6;
  void *v7;

  if (self)
  {
    v3 = self->_keychainManager;
    trustInformation = self->_trustInformation;
  }
  else
  {
    v3 = 0;
    trustInformation = 0;
  }
  v5 = trustInformation;
  v6 = -[EMCertificateTrustInformation trust](v5, "trust");
  -[MFCertificateTrustInformationKeychainManager addressForSaving](self, "addressForSaving");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = -[CertUITrustManager _hasExceptionsForSMIMETrust:sender:](v3, "_hasExceptionsForSMIMETrust:sender:", v6, v7);

  return v6;
}

- (void)addTrustException
{
  CertUITrustManager *v3;
  EMCertificateTrustInformation *trustInformation;
  EMCertificateTrustInformation *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v3 = self->_keychainManager;
    trustInformation = self->_trustInformation;
  }
  else
  {
    v3 = 0;
    trustInformation = 0;
  }
  v5 = trustInformation;
  v6 = -[EMCertificateTrustInformation trust](v5, "trust");
  -[MFCertificateTrustInformationKeychainManager addressForSaving](self, "addressForSaving");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUITrustManager addSMIMETrust:sender:](v3, "addSMIMETrust:sender:", v6, v7);

  +[MFCertificateTrustInformationKeychainManager log](MFCertificateTrustInformationKeychainManager, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[MFCertificateTrustInformationKeychainManager addressForSaving](self, "addressForSaving");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "Added trust exception for %@", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("MFCertificateTrustDidChangeNotification"), self);

}

- (void)removeTrustException
{
  MFCertificateTrustInformationKeychainManager *v2;
  __SecTrust *v3;
  CertUITrustManager *keychainManager;
  CertUITrustManager *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  CFArrayRef policies;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v2 = self;
  v13 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (MFCertificateTrustInformationKeychainManager *)self->_trustInformation;
  v3 = (__SecTrust *)-[MFCertificateTrustInformationKeychainManager trust](self, "trust");
  if (v2)
    keychainManager = v2->_keychainManager;
  else
    keychainManager = 0;
  v5 = keychainManager;
  -[MFCertificateTrustInformationKeychainManager addressForSaving](v2, "addressForSaving");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertUITrustManager removeSMIMETrust:sender:](v5, "removeSMIMETrust:sender:", v3, v6);

  policies = 0;
  if (!SecTrustCopyPolicies(v3, &policies))
  {
    SecTrustSetPolicies(v3, MEMORY[0x1E0C9AA60]);
    SecTrustSetPolicies(v3, policies);
    CFRelease(policies);
  }
  +[MFCertificateTrustInformationKeychainManager log](MFCertificateTrustInformationKeychainManager, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[MFCertificateTrustInformationKeychainManager addressForSaving](v2, "addressForSaving");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Removed trust exception for %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("MFCertificateTrustDidChangeNotification"), v2);

}

- (void)saveCertificateToKeychain
{
  EMCertificateTrustInformation *trustInformation;
  uint64_t v4;
  void *v5;
  id v6;
  EMCertificateTrustInformation *v7;

  if (-[MFCertificateTrustInformationKeychainManager canSaveCertificateToKeychain](self, "canSaveCertificateToKeychain"))
  {
    if (self)
      trustInformation = self->_trustInformation;
    else
      trustInformation = 0;
    v7 = trustInformation;
    v4 = -[EMCertificateTrustInformation certificate](v7, "certificate");
    -[MFCertificateTrustInformationKeychainManager addressForSaving](self, "addressForSaving");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[MFMessageKeychainManager saveEncryptionCertificate:forAddress:](MFMessageKeychainManager, "saveEncryptionCertificate:forAddress:", v4, v5);

  }
}

- (void)removeCertificateFromKeychain
{
  id v3;
  id v4;

  if (-[MFCertificateTrustInformationKeychainManager canSaveCertificateToKeychain](self, "canSaveCertificateToKeychain"))
  {
    -[MFCertificateTrustInformationKeychainManager addressForSaving](self, "addressForSaving");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = +[MFMessageKeychainManager saveEncryptionCertificate:forAddress:](MFMessageKeychainManager, "saveEncryptionCertificate:forAddress:", 0);

  }
}

- (unint64_t)keychainStatus
{
  MFCertificateTrustInformationKeychainManager *v2;
  void *v3;
  __SecCertificate *v4;
  id v5;
  EMCertificateTrustInformation *trustInformation;
  EMCertificateTrustInformation *v7;
  int v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v14;
  uint8_t buf[24];
  uint64_t v16;

  v2 = self;
  v16 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (MFCertificateTrustInformationKeychainManager *)self->_trustInformation;
  if (-[MFCertificateTrustInformationKeychainManager certificateType](self, "certificateType") != 1)
    return 0;
  -[MFCertificateTrustInformationKeychainManager addressForSaving](v2, "addressForSaving");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v4 = +[MFMessageKeychainManager copyEncryptionCertificateForAddress:error:](MFMessageKeychainManager, "copyEncryptionCertificateForAddress:error:", v3, &v14);
  v5 = v14;

  if (v4)
  {
    if (v2)
      trustInformation = v2->_trustInformation;
    else
      trustInformation = 0;
    v7 = trustInformation;
    v8 = CFEqual((CFTypeRef)-[EMCertificateTrustInformation certificate](v7, "certificate"), v4);

    CFRelease(v4);
    if (v8)
      v9 = 1;
    else
      v9 = 2;
  }
  else
  {
    if (v5)
    {
      +[MFCertificateTrustInformationKeychainManager log](MFCertificateTrustInformationKeychainManager, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        -[MFCertificateTrustInformationKeychainManager addressForSaving](v2, "addressForSaving");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ef_publicDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFCertificateTrustInformationKeychainManager keychainStatus].cold.1(v11, v12, buf, v10);
      }

    }
    v9 = 0;
  }

  return v9;
}

- (NSString)addressForSaving
{
  return self->_addressForSaving;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainManager, 0);
  objc_storeStrong((id *)&self->_trustInformation, 0);
  objc_storeStrong((id *)&self->_addressForSaving, 0);
}

- (void)keychainStatus
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "Error when retrieving encryption certificate for %@: %{public}@", buf, 0x16u);

}

@end
