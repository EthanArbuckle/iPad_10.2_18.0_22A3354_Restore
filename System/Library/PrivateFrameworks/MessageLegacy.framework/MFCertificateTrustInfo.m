@implementation MFCertificateTrustInfo

- (MFCertificateTrustInfo)initWithCertificateType:(unint64_t)a3 trust:(__SecTrust *)a4 sender:(id)a5
{
  id v9;
  MFCertificateTrustInfo *v10;
  MFCertificateTrustInfo *v11;
  uint64_t v12;
  NSString *sender;
  uint64_t v14;
  NSString *uncommentedSender;
  void *v17;
  objc_super v18;

  v9 = a5;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFCertificateTrustInfo.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trust"));

  }
  v18.receiver = self;
  v18.super_class = (Class)MFCertificateTrustInfo;
  v10 = -[MFCertificateTrustInfo init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_certificateType = a3;
    v10->_trust = (__SecTrust *)CFRetain(a4);
    v12 = objc_msgSend(v9, "copy");
    sender = v11->_sender;
    v11->_sender = (NSString *)v12;

    v14 = objc_msgSend(v9, "mf_copyUncommentedAddress");
    uncommentedSender = v11->_uncommentedSender;
    v11->_uncommentedSender = (NSString *)v14;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_trust);
  v3.receiver = self;
  v3.super_class = (Class)MFCertificateTrustInfo;
  -[MFCertificateTrustInfo dealloc](&v3, sel_dealloc);
}

- (__SecCertificate)certificate
{
  return SecTrustGetCertificateAtIndex(self->_trust, 0);
}

- (int)action
{
  id v3;

  v3 = +[MFMessageKeychainManager newTrustManager](MFMessageKeychainManager, "newTrustManager");
  LODWORD(self) = objc_msgSend(v3, "actionForSMIMETrust:sender:", self->_trust, self->_uncommentedSender);

  return (int)self;
}

- (NSString)commonName
{
  void *v2;
  void *v3;
  void *v4;

  -[MFCertificateTrustInfo certificate](self, "certificate");
  v2 = (void *)SecCertificateCopyCommonNames();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)emailAddress
{
  void *v2;
  void *v3;
  void *v4;

  -[MFCertificateTrustInfo certificate](self, "certificate");
  v2 = (void *)SecCertificateCopyRFC822Names();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)hasTrustException
{
  id v3;

  v3 = +[MFMessageKeychainManager newTrustManager](MFMessageKeychainManager, "newTrustManager");
  LOBYTE(self) = objc_msgSend(v3, "_hasExceptionsForSMIMETrust:sender:", self->_trust, self->_uncommentedSender);

  return (char)self;
}

- (void)addTrustException
{
  id v3;
  NSObject *v4;
  NSString *sender;
  void *v6;
  int v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = +[MFMessageKeychainManager newTrustManager](MFMessageKeychainManager, "newTrustManager");
  objc_msgSend(v3, "addSMIMETrust:sender:", self->_trust, self->_uncommentedSender);
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sender = self->_sender;
    v7 = 138412290;
    v8 = sender;
    _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_INFO, "#SMIMEErrors Added trust exception for %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("MFCertificateTrustInfoTrustDidChangeNotification"), self);

}

- (void)removeTrustException
{
  id v3;
  NSObject *v4;
  NSString *sender;
  void *v6;
  CFArrayRef policies;
  uint8_t buf[4];
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = +[MFMessageKeychainManager newTrustManager](MFMessageKeychainManager, "newTrustManager");
  objc_msgSend(v3, "removeSMIMETrust:sender:", self->_trust, self->_uncommentedSender);
  policies = 0;
  if (!SecTrustCopyPolicies(self->_trust, &policies))
  {
    SecTrustSetPolicies(self->_trust, MEMORY[0x1E0C9AA60]);
    SecTrustSetPolicies(self->_trust, policies);
    CFRelease(policies);
  }
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    sender = self->_sender;
    *(_DWORD *)buf = 138412290;
    v9 = sender;
    _os_log_impl(&dword_1C8839000, v4, OS_LOG_TYPE_INFO, "#SMIMEErrors Removed trust exception for %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("MFCertificateTrustInfoTrustDidChangeNotification"), self);

}

- (BOOL)canSaveCertificateToKeychain
{
  return self->_certificateType == 1;
}

- (unint64_t)keychainStatus
{
  NSString *sender;
  uint64_t *p_sender;
  __SecCertificate *v5;
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  id v11;

  if (self->_certificateType != 1)
    return 0;
  p_sender = (uint64_t *)&self->_sender;
  sender = self->_sender;
  v11 = 0;
  v5 = +[MFMessageKeychainManager copyEncryptionCertificateForAddress:error:](MFMessageKeychainManager, "copyEncryptionCertificateForAddress:error:", sender, &v11);
  v6 = v11;
  v7 = v6;
  if (v5)
  {
    if (CFEqual(-[MFCertificateTrustInfo certificate](self, "certificate"), v5))
      v8 = 1;
    else
      v8 = 2;
    CFRelease(v5);
  }
  else
  {
    if (v6)
    {
      MFLogGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[MFCertificateTrustInfo keychainStatus].cold.1(p_sender, v7, v9);

    }
    v8 = 0;
  }

  return v8;
}

- (void)saveCertificateToKeychain
{
  id v2;

  if (self->_certificateType == 1)
    v2 = +[MFMessageKeychainManager saveEncryptionCertificate:forAddress:](MFMessageKeychainManager, "saveEncryptionCertificate:forAddress:", -[MFCertificateTrustInfo certificate](self, "certificate"), self->_sender);
}

- (void)removeCertificateFromKeychain
{
  id v2;

  if (self->_certificateType == 1)
    v2 = +[MFMessageKeychainManager saveEncryptionCertificate:forAddress:](MFMessageKeychainManager, "saveEncryptionCertificate:forAddress:", 0, self->_sender);
}

- (unint64_t)certificateType
{
  return self->_certificateType;
}

- (NSString)sender
{
  return self->_sender;
}

- (__SecTrust)trust
{
  return self->_trust;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_uncommentedSender, 0);
}

- (void)keychainStatus
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "ef_publicDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1C8839000, a3, OS_LOG_TYPE_ERROR, "#SMIMEErrors Error when retrieving encryption certificate for %@: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
