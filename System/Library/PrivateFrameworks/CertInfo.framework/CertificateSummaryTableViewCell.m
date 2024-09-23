@implementation CertificateSummaryTableViewCell

- (void)updateWithCertificateTrust:(__SecTrust *)a3
{
  __SecCertificate *CertificateAtIndex;
  __CFString *v6;
  uint64_t IsSelfSignedCA;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  __CFString *v11;

  if (a3 && SecTrustGetCertificateCount(a3) >= 1)
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(a3, 0);
    SecCertificateCopySubjectSummary(CertificateAtIndex);
    v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    SecCertificateCopyIssuerSummary();
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    IsSelfSignedCA = SecCertificateIsSelfSignedCA();
    v8 = v10;
    v9 = IsSelfSignedCA;
  }
  else
  {
    v9 = 0;
    v8 = &stru_24C813780;
    v6 = &stru_24C813780;
  }
  v11 = (__CFString *)v8;
  -[CertificateSummaryTableViewCell setCertificateName:issuer:isRoot:](self, "setCertificateName:issuer:isRoot:", v8, v6, v9);

}

- (void)setCertificateName:(id)a3 issuer:(id)a4 isRoot:(BOOL)a5
{
  __CFString *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v7 = &stru_24C813780;
  if (a3)
    v8 = (const __CFString *)a3;
  else
    v8 = &stru_24C813780;
  v9 = a3;
  -[CertUIItemSummaryCell itemTitleLabel](self, "itemTitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v8);

  if (v15)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ISSUED_BY_LABEL"), &stru_24C813780, CFSTR("CertInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v13, v15);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  -[CertUIItemSummaryCell itemSubtitleLabel](self, "itemSubtitleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v7);

  -[CertificateSummaryTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

@end
