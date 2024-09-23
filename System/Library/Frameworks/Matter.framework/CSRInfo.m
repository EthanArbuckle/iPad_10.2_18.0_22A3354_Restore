@implementation CSRInfo

- (CSRInfo)initWithNonce:(NSData *)nonce elements:(NSData *)elements elementsSignature:(NSData *)elementsSignature csr:(NSData *)csr
{
  NSData *v11;
  NSData *v12;
  NSData *v13;
  NSData *v14;
  CSRInfo *v15;
  CSRInfo *v16;
  objc_super v18;

  v11 = nonce;
  v12 = elements;
  v13 = elementsSignature;
  v14 = csr;
  v18.receiver = self;
  v18.super_class = (Class)CSRInfo;
  v15 = -[CSRInfo init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_nonce, nonce);
    objc_storeStrong((id *)&v16->_elements, elements);
    objc_storeStrong((id *)&v16->_elementsSignature, elementsSignature);
    objc_storeStrong((id *)&v16->_csr, csr);
  }

  return v16;
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(NSData *)nonce
{
  objc_setProperty_nonatomic_copy(self, a2, nonce, 8);
}

- (NSData)elements
{
  return self->_elements;
}

- (void)setElements:(NSData *)elements
{
  objc_setProperty_nonatomic_copy(self, a2, elements, 16);
}

- (NSData)elementsSignature
{
  return self->_elementsSignature;
}

- (void)setElementsSignature:(NSData *)elementsSignature
{
  objc_setProperty_nonatomic_copy(self, a2, elementsSignature, 24);
}

- (NSData)csr
{
  return self->_csr;
}

- (void)setCsr:(NSData *)csr
{
  objc_setProperty_nonatomic_copy(self, a2, csr, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csr, 0);
  objc_storeStrong((id *)&self->_elementsSignature, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end
