@implementation CRKConcreteTrust

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_underlyingTrust);
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteTrust;
  -[CRKConcreteTrust dealloc](&v3, sel_dealloc);
}

- (CRKConcreteTrust)initWithTrust:(__SecTrust *)a3
{
  CRKConcreteTrust *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKConcreteTrust;
  v4 = -[CRKConcreteTrust init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_underlyingTrust = a3;
  }
  return v4;
}

- (CRKCertificate)leafCertificate
{
  CFArrayRef v2;
  void *v3;
  CRKConcreteCertificate *v4;

  v2 = SecTrustCopyCertificateChain(-[CRKConcreteTrust underlyingTrust](objc_retainAutorelease(self), "underlyingTrust"));
  if (-[__CFArray count](v2, "count"))
  {
    -[__CFArray firstObject](v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[CRKConcreteCertificate initWithCertificate:]([CRKConcreteCertificate alloc], "initWithCertificate:", v3);

  }
  else
  {
    v4 = 0;
  }

  return (CRKCertificate *)v4;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  CRKConcreteTrust *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = objc_retainAutorelease(self);
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { underlyingTrust = %@ }"), v4, v5, -[CRKConcreteTrust underlyingTrust](v5, "underlyingTrust"));
}

- (__SecTrust)underlyingTrust
{
  return self->_underlyingTrust;
}

@end
