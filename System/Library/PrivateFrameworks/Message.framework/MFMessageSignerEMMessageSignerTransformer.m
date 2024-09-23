@implementation MFMessageSignerEMMessageSignerTransformer

+ (id)messageSignerFromMFMessageSigner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "signingCertificateTrustInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFCertificateTrustInfoEMCertificateTrustInformationTransformer certificateTrustInformationFromMFCertificateTrustInfo:](MFCertificateTrustInfoEMCertificateTrustInformationTransformer, "certificateTrustInformationFromMFCertificateTrustInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "encryptionCertificateTrustInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[MFCertificateTrustInfoEMCertificateTrustInformationTransformer certificateTrustInformationFromMFCertificateTrustInfo:](MFCertificateTrustInfoEMCertificateTrustInformationTransformer, "certificateTrustInformationFromMFCertificateTrustInfo:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E278]), "initWithSigningTrust:encryptionTrust:", v5, v7);

  return v8;
}

@end
