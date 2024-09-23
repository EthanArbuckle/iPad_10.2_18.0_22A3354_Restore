@implementation CertInfoBasicTrustDescription

- (CertInfoBasicTrustDescription)initWithTrust:(__SecTrust *)a3 action:(int)a4
{
  CertInfoBasicTrustDescription *v6;
  objc_super v8;

  if (!a3)
    -[CertInfoBasicTrustDescription initWithTrust:action:].cold.1();
  v8.receiver = self;
  v8.super_class = (Class)CertInfoBasicTrustDescription;
  v6 = -[CertInfoBasicTrustDescription init](&v8, sel_init);
  if (v6)
  {
    v6->_trust = (__SecTrust *)CFRetain(a3);
    v6->_action = a4;
  }
  return v6;
}

- (void)dealloc
{
  __SecTrust *trust;
  objc_super v4;

  trust = self->_trust;
  if (trust)
    CFRelease(trust);
  v4.receiver = self;
  v4.super_class = (Class)CertInfoBasicTrustDescription;
  -[CertInfoBasicTrustDescription dealloc](&v4, sel_dealloc);
}

- (id)summaryTitle
{
  __SecCertificate *CertificateAtIndex;
  __CFString *v4;

  if (SecTrustGetCertificateCount(self->_trust) < 1)
  {
    v4 = 0;
  }
  else
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, 0);
    v4 = (__CFString *)SecCertificateCopySubjectSummary(CertificateAtIndex);
  }
  return v4;
}

- (id)summarySubtitle
{
  CFIndex CertificateCount;
  __SecCertificate *CertificateAtIndex;
  __CFString *v5;

  CertificateCount = SecTrustGetCertificateCount(self->_trust);
  if (CertificateCount < 1)
  {
    v5 = 0;
  }
  else
  {
    CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, CertificateCount - 1);
    v5 = (__CFString *)SecCertificateCopySubjectSummary(CertificateAtIndex);
  }
  return v5;
}

- (id)summaryDescriptionItems
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CertInfoBasicTrustDescription _expirationDate](self, "_expirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v4, 2, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "timeIntervalSinceNow");
      v7 = v6;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CertInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7 >= 0.0)
        v10 = CFSTR("EXPIRES");
      else
        v10 = CFSTR("EXPIRED");
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24C813780, CFSTR("CertInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v11);

      objc_msgSend(v3, "addObject:", v5);
    }

  }
  return v3;
}

- (BOOL)isTrusted
{
  return self->_action == 1;
}

- (BOOL)isRootCertificate
{
  if (SecTrustGetCertificateCount(self->_trust) < 1)
    return 0;
  SecTrustGetCertificateAtIndex(self->_trust, 0);
  return SecCertificateIsSelfSignedCA();
}

- (unint64_t)certificateCount
{
  unint64_t result;

  result = (unint64_t)self->_trust;
  if (result)
    return SecTrustGetCertificateCount((SecTrustRef)result);
  return result;
}

- (id)certificateSubjectSummaryAtIndex:(unint64_t)a3
{
  __SecCertificate *CertificateAtIndex;

  CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, a3);
  if (CertificateAtIndex)
    CertificateAtIndex = (__SecCertificate *)SecCertificateCopySubjectSummary(CertificateAtIndex);
  return CertificateAtIndex;
}

- (id)certificateIssuerSummaryAtIndex:(unint64_t)a3
{
  void *CertificateAtIndex;

  CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, a3);
  if (CertificateAtIndex)
    CertificateAtIndex = (void *)SecCertificateCopyIssuerSummary();
  return CertificateAtIndex;
}

- (id)certificateExpirationDateAtIndex:(unint64_t)a3
{
  SecCertificateRef CertificateAtIndex;
  CFAbsoluteTime v4;

  CertificateAtIndex = SecTrustGetCertificateAtIndex(self->_trust, a3);
  if (CertificateAtIndex)
  {
    SecCertificateNotValidAfter();
    CertificateAtIndex = CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v4);
  }
  return CertificateAtIndex;
}

- (id)certificatePropertiesAtIndex:(unint64_t)a3
{
  return (id)SecTrustCopyDetailedPropertiesAtIndex();
}

- (id)_expirationDate
{
  CFIndex CertificateCount;
  CFIndex v4;
  CFIndex v5;
  int v6;
  double v7;
  double v8;
  int v9;
  CFDateRef v10;

  CertificateCount = SecTrustGetCertificateCount(self->_trust);
  if (CertificateCount < 1)
    goto LABEL_10;
  v4 = CertificateCount;
  v5 = 0;
  v6 = 0;
  v7 = *MEMORY[0x24BDBD230];
  do
  {
    if (SecTrustGetCertificateAtIndex(self->_trust, v5))
    {
      SecCertificateNotValidAfter();
      v9 = v6 ^ 1 | (v8 < v7);
      if ((v6 ^ 1) & 1 | (v8 < v7))
        v7 = v8;
      v6 |= v9;
    }
    ++v5;
  }
  while (v4 != v5);
  if ((v6 & 1) != 0)
    v10 = CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v7);
  else
LABEL_10:
    v10 = 0;
  return v10;
}

- (void)initWithTrust:action:.cold.1()
{
  __assert_rtn("-[CertInfoBasicTrustDescription initWithTrust:action:]", "CertInfoTrustDescription.m", 31, "NULL != trust");
}

@end
