@implementation MFMessageSigner

- (MFMessageSigner)initWithSender:(id)a3 signingTrust:(__SecTrust *)a4 encryptionTrust:(__SecTrust *)a5 verification:(int)a6
{
  MFMessageSigner *v10;
  MFMessageSigner *v11;

  v10 = -[MFMessageSigner init](self, "init");
  v11 = v10;
  if (v10)
  {
    v10->_status = a6;
    if (a4)
      v10->_signingCertificateTrustInfo = -[MFCertificateTrustInfo initWithCertificateType:trust:sender:]([MFCertificateTrustInfo alloc], "initWithCertificateType:trust:sender:", 0, a4, a3);
    if (a5)
      v11->_encryptionCertificateTrustInfo = -[MFCertificateTrustInfo initWithCertificateType:trust:sender:]([MFCertificateTrustInfo alloc], "initWithCertificateType:trust:sender:", 1, a5, a3);
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMessageSigner;
  -[MFMessageSigner dealloc](&v3, sel_dealloc);
}

- (BOOL)hasSeparateSigningAndEncryptionCertificates
{
  MFCertificateTrustInfo *signingCertificateTrustInfo;
  __SecTrust *v4;
  __SecTrust *v5;
  SecCertificateRef CertificateAtIndex;
  SecCertificateRef v7;

  signingCertificateTrustInfo = self->_signingCertificateTrustInfo;
  if (signingCertificateTrustInfo)
  {
    if (!self->_encryptionCertificateTrustInfo
      || (v4 = -[MFCertificateTrustInfo trust](signingCertificateTrustInfo, "trust"),
          signingCertificateTrustInfo = -[MFCertificateTrustInfo trust](self->_encryptionCertificateTrustInfo, "trust"),
          v4 == (__SecTrust *)signingCertificateTrustInfo))
    {
      LOBYTE(signingCertificateTrustInfo) = 0;
    }
    else
    {
      v5 = (__SecTrust *)signingCertificateTrustInfo;
      LOBYTE(signingCertificateTrustInfo) = 1;
      if (v4 && v5)
      {
        CertificateAtIndex = SecTrustGetCertificateAtIndex(v4, 0);
        v7 = SecTrustGetCertificateAtIndex(v5, 0);
        LOBYTE(signingCertificateTrustInfo) = CFEqual(CertificateAtIndex, v7) == 0;
      }
    }
  }
  return (char)signingCertificateTrustInfo;
}

- (MFError)error
{
  MFError *v2;
  unsigned int status;
  int v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v2 = 0;
  v14 = *MEMORY[0x1E0C80C00];
  status = self->_status;
  if (status <= 0xC)
  {
    v5 = 1 << status;
    if ((v5 & 0x1DFC) != 0)
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_DAMAGED_SIG"), (uint64_t)CFSTR("The digital signature for this message is incorrect. The message may have been tampered with or corrupted since being signed by “%@”."), CFSTR("Delayed")), -[MFCertificateTrustInfo sender](self->_signingCertificateTrustInfo, "sender"));
      v7 = MFLogGeneral();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_6;
      v8 = self->_status;
      *(_DWORD *)buf = 134217984;
      v13 = v8;
      v9 = "#SMIMEErrors Verification was not good (%ld)";
    }
    else
    {
      if ((v5 & 0x201) == 0)
        return v2;
      v6 = (id)MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
      v7 = MFLogGeneral();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_6;
      v11 = self->_status;
      *(_DWORD *)buf = 134217984;
      v13 = v11;
      v9 = "#SMIMEErrors Verification went south (%ld)";
    }
    _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
LABEL_6:
    if (v6)
    {
      v2 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v6);

      -[MFError setShortDescription:](v2, "setShortDescription:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_SIG_TITLE"), (uint64_t)CFSTR("Unable to verify message signature"), CFSTR("Delayed")));
      -[MFError setUserInfoObject:forKey:](v2, "setUserInfoObject:forKey:", self, CFSTR("MFSignerInfoErrorKey"));
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (MFCertificateTrustInfo)signingCertificateTrustInfo
{
  return self->_signingCertificateTrustInfo;
}

- (MFCertificateTrustInfo)encryptionCertificateTrustInfo
{
  return self->_encryptionCertificateTrustInfo;
}

@end
