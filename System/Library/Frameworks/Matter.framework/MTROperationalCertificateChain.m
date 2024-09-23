@implementation MTROperationalCertificateChain

- (MTROperationalCertificateChain)initWithOperationalCertificate:(MTRCertificateDERBytes)operationalCertificate intermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate rootCertificate:(MTRCertificateDERBytes)rootCertificate adminSubject:(NSNumber *)adminSubject
{
  NSData *v11;
  NSData *v12;
  NSData *v13;
  NSNumber *v14;
  MTROperationalCertificateChain *v15;
  MTROperationalCertificateChain *v16;
  objc_super v18;

  v11 = operationalCertificate;
  v12 = intermediateCertificate;
  v13 = rootCertificate;
  v14 = adminSubject;
  v18.receiver = self;
  v18.super_class = (Class)MTROperationalCertificateChain;
  v15 = -[MTROperationalCertificateChain init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_operationalCertificate, operationalCertificate);
    objc_storeStrong((id *)&v16->_intermediateCertificate, intermediateCertificate);
    objc_storeStrong((id *)&v16->_rootCertificate, rootCertificate);
    objc_storeStrong((id *)&v16->_adminSubject, adminSubject);
  }

  return v16;
}

- (MTRCertificateDERBytes)operationalCertificate
{
  return self->_operationalCertificate;
}

- (void)setOperationalCertificate:(MTRCertificateDERBytes)operationalCertificate
{
  objc_setProperty_nonatomic_copy(self, a2, operationalCertificate, 8);
}

- (MTRCertificateDERBytes)intermediateCertificate
{
  return self->_intermediateCertificate;
}

- (void)setIntermediateCertificate:(MTRCertificateDERBytes)intermediateCertificate
{
  objc_setProperty_nonatomic_copy(self, a2, intermediateCertificate, 16);
}

- (MTRCertificateDERBytes)rootCertificate
{
  return self->_rootCertificate;
}

- (void)setRootCertificate:(MTRCertificateDERBytes)rootCertificate
{
  objc_setProperty_nonatomic_copy(self, a2, rootCertificate, 24);
}

- (NSNumber)adminSubject
{
  return self->_adminSubject;
}

- (void)setAdminSubject:(NSNumber *)adminSubject
{
  objc_setProperty_nonatomic_copy(self, a2, adminSubject, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adminSubject, 0);
  objc_storeStrong((id *)&self->_rootCertificate, 0);
  objc_storeStrong((id *)&self->_intermediateCertificate, 0);
  objc_storeStrong((id *)&self->_operationalCertificate, 0);
}

@end
