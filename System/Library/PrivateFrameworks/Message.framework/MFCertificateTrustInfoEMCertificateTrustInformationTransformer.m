@implementation MFCertificateTrustInfoEMCertificateTrustInformationTransformer

+ (id)certificateTrustInformationFromMFCertificateTrustInfo:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFCertificateTrustInfoEMCertificateTrustInformationTransformer.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificateTrustInfo"));

  }
  v6 = objc_alloc(MEMORY[0x1E0D1E118]);
  v7 = objc_msgSend(v5, "trust");
  v8 = objc_msgSend(v5, "certificateType");
  objc_msgSend(v5, "sender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithTrust:certificateType:sender:", v7, v8, v9);

  return v10;
}

@end
