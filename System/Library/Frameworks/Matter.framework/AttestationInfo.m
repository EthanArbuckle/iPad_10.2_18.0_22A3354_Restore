@implementation AttestationInfo

- (AttestationInfo)initWithChallenge:(NSData *)challenge nonce:(NSData *)nonce elements:(NSData *)elements elementsSignature:(NSData *)elementsSignature dac:(NSData *)dac pai:(NSData *)pai certificationDeclaration:(NSData *)certificationDeclaration firmwareInfo:(NSData *)firmwareInfo
{
  NSData *v17;
  AttestationInfo *v18;
  AttestationInfo *v19;
  NSData *v21;
  NSData *v22;
  NSData *v23;
  NSData *v24;
  NSData *v25;
  NSData *v26;
  NSData *v27;
  objc_super v28;

  v27 = challenge;
  v26 = nonce;
  v25 = elements;
  v24 = elementsSignature;
  v23 = dac;
  v22 = pai;
  v21 = certificationDeclaration;
  v17 = firmwareInfo;
  v28.receiver = self;
  v28.super_class = (Class)AttestationInfo;
  v18 = -[AttestationInfo init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_challenge, challenge);
    objc_storeStrong((id *)&v19->_nonce, nonce);
    objc_storeStrong((id *)&v19->_elements, elements);
    objc_storeStrong((id *)&v19->_elementsSignature, elementsSignature);
    objc_storeStrong((id *)&v19->_dac, dac);
    objc_storeStrong((id *)&v19->_pai, pai);
    objc_storeStrong((id *)&v19->_certificationDeclaration, certificationDeclaration);
    objc_storeStrong((id *)&v19->_firmwareInfo, firmwareInfo);
  }

  return v19;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(NSData *)challenge
{
  objc_setProperty_nonatomic_copy(self, a2, challenge, 8);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(NSData *)nonce
{
  objc_setProperty_nonatomic_copy(self, a2, nonce, 16);
}

- (NSData)elements
{
  return self->_elements;
}

- (void)setElements:(NSData *)elements
{
  objc_setProperty_nonatomic_copy(self, a2, elements, 24);
}

- (NSData)elementsSignature
{
  return self->_elementsSignature;
}

- (void)setElementsSignature:(NSData *)elementsSignature
{
  objc_setProperty_nonatomic_copy(self, a2, elementsSignature, 32);
}

- (NSData)dac
{
  return self->_dac;
}

- (void)setDac:(NSData *)dac
{
  objc_setProperty_nonatomic_copy(self, a2, dac, 40);
}

- (NSData)pai
{
  return self->_pai;
}

- (void)setPai:(NSData *)pai
{
  objc_setProperty_nonatomic_copy(self, a2, pai, 48);
}

- (NSData)certificationDeclaration
{
  return self->_certificationDeclaration;
}

- (void)setCertificationDeclaration:(NSData *)certificationDeclaration
{
  objc_setProperty_nonatomic_copy(self, a2, certificationDeclaration, 56);
}

- (NSData)firmwareInfo
{
  return self->_firmwareInfo;
}

- (void)setFirmwareInfo:(NSData *)firmwareInfo
{
  objc_setProperty_nonatomic_copy(self, a2, firmwareInfo, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareInfo, 0);
  objc_storeStrong((id *)&self->_certificationDeclaration, 0);
  objc_storeStrong((id *)&self->_pai, 0);
  objc_storeStrong((id *)&self->_dac, 0);
  objc_storeStrong((id *)&self->_elementsSignature, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end
