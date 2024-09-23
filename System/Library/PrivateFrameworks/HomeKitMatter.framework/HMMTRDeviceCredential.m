@implementation HMMTRDeviceCredential

- (HMMTRDeviceCredential)initWithCertificationDeclaration:(id)a3 deviceAttestationCertificate:(id)a4 productAttestationIntermediateCertificate:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMTRDeviceCredential *v12;
  HMMTRDeviceCredential *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRDeviceCredential;
  v12 = -[HMMTRDeviceCredential init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_certificationDeclaration, a3);
    objc_storeStrong((id *)&v13->_deviceAttestationCertificate, a4);
    objc_storeStrong((id *)&v13->_productAttestationIntermediateCertificate, a5);
  }

  return v13;
}

- (NSData)certificationDeclaration
{
  return self->_certificationDeclaration;
}

- (NSData)deviceAttestationCertificate
{
  return self->_deviceAttestationCertificate;
}

- (NSData)productAttestationIntermediateCertificate
{
  return self->_productAttestationIntermediateCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productAttestationIntermediateCertificate, 0);
  objc_storeStrong((id *)&self->_deviceAttestationCertificate, 0);
  objc_storeStrong((id *)&self->_certificationDeclaration, 0);
}

@end
