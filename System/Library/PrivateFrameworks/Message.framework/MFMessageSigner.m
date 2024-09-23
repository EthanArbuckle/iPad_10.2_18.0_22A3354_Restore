@implementation MFMessageSigner

- (MFMessageSigner)initWithSender:(id)a3 signingTrust:(__SecTrust *)a4 encryptionTrust:(__SecTrust *)a5 verification:(int)a6
{
  id v11;
  MFMessageSigner *v12;
  MFMessageSigner *v13;
  MFCertificateTrustInfo *v14;
  MFCertificateTrustInfo *signingCertificateTrustInfo;
  MFCertificateTrustInfo *v16;
  MFCertificateTrustInfo *encryptionCertificateTrustInfo;

  v11 = a3;
  v12 = -[MFMessageSigner init](self, "init");
  v13 = v12;
  if (v12)
  {
    v12->_status = a6;
    objc_storeStrong((id *)&v12->_sender, a3);
    if (a4)
    {
      v14 = -[MFCertificateTrustInfo initWithCertificateType:trust:sender:]([MFCertificateTrustInfo alloc], "initWithCertificateType:trust:sender:", 0, a4, v11);
      signingCertificateTrustInfo = v13->_signingCertificateTrustInfo;
      v13->_signingCertificateTrustInfo = v14;

    }
    if (a5)
    {
      v16 = -[MFCertificateTrustInfo initWithCertificateType:trust:sender:]([MFCertificateTrustInfo alloc], "initWithCertificateType:trust:sender:", 1, a5, v11);
      encryptionCertificateTrustInfo = v13->_encryptionCertificateTrustInfo;
      v13->_encryptionCertificateTrustInfo = v16;

    }
  }

  return v13;
}

- (MFError)error
{
  void *v2;
  unsigned int status;
  int v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v2 = 0;
  v18 = *MEMORY[0x1E0C80C00];
  status = self->_status;
  if (status > 0xC)
  {
    v12 = 0;
    goto LABEL_9;
  }
  v5 = 1 << status;
  if ((v5 & 0x1DFC) != 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    MFLookupLocalizedString(CFSTR("SMIME_DAMAGED_SIG"), CFSTR("The digital signature for this message is incorrect. The message may have been tampered with or corrupted since being signed by “%@”."), CFSTR("Delayed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFCertificateTrustInfo sender](self->_signingCertificateTrustInfo, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v6, "initWithFormat:", v7, v8);

    MFLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_6;
    v10 = self->_status;
    *(_DWORD *)buf = 134217984;
    v17 = v10;
    v11 = "#SMIMEErrors Verification was not good (%ld)";
    goto LABEL_5;
  }
  v12 = 0;
  if ((v5 & 0x201) == 0)
    goto LABEL_9;
  MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MFLogGeneral();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v15 = self->_status;
    *(_DWORD *)buf = 134217984;
    v17 = v15;
    v11 = "#SMIMEErrors Verification went south (%ld)";
LABEL_5:
    _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_INFO, v11, buf, 0xCu);
  }
LABEL_6:

  if (v2)
  {
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShortDescription:", v13);

    objc_msgSend(v12, "setUserInfoObject:forKey:", self, CFSTR("MFSignerInfoErrorKey"));
  }
  else
  {
    v12 = 0;
  }
LABEL_9:

  return (MFError *)v12;
}

- (MFCertificateTrustInfo)signingCertificateTrustInfo
{
  return self->_signingCertificateTrustInfo;
}

- (MFCertificateTrustInfo)encryptionCertificateTrustInfo
{
  return self->_encryptionCertificateTrustInfo;
}

- (NSString)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_encryptionCertificateTrustInfo, 0);
  objc_storeStrong((id *)&self->_signingCertificateTrustInfo, 0);
}

@end
