@implementation LegacySigningKeyPrivate

- (LegacySigningKeyPrivate)init
{
  LegacySigningKeyPrivate *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SecKeyRef RandomKey;
  id secKeyRef;
  LegacySigningKeyPrivate *v9;
  objc_super v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)LegacySigningKeyPrivate;
  v2 = -[LegacySigningKeyPrivate init](&v11, sel_init);
  v3 = *MEMORY[0x24BDE9060];
  v4 = *MEMORY[0x24BDE9028];
  v12[0] = *MEMORY[0x24BDE9050];
  v12[1] = v4;
  v5 = *MEMORY[0x24BDE9030];
  v13[0] = v3;
  v13[1] = v5;
  v6 = *MEMORY[0x24BDE9018];
  v12[2] = *MEMORY[0x24BDE9048];
  v12[3] = v6;
  v13[2] = &unk_24C4C9108;
  v13[3] = MEMORY[0x24BDBD1C0];
  RandomKey = SecKeyCreateRandomKey((CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4), 0);
  secKeyRef = v2->_secKeyRef;
  v2->_secKeyRef = RandomKey;

  if (v2->_secKeyRef)
    v9 = v2;
  else
    v9 = 0;

  return v9;
}

- (LegacySigningKeyPrivate)initWithData:(id)a3 error:(id *)a4
{
  const __CFData *v4;
  LegacySigningKeyPrivate *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SecKeyRef v10;
  id secKeyRef;
  LegacySigningKeyPrivate *v12;
  LegacySigningKeyPrivate *v13;
  objc_super v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)LegacySigningKeyPrivate;
  v4 = (const __CFData *)a3;
  v5 = -[LegacySigningKeyPrivate init](&v15, sel_init);
  v6 = *MEMORY[0x24BDE9060];
  v7 = *MEMORY[0x24BDE9028];
  v16[0] = *MEMORY[0x24BDE9050];
  v16[1] = v7;
  v8 = *MEMORY[0x24BDE9030];
  v17[0] = v6;
  v17[1] = v8;
  v9 = *MEMORY[0x24BDE9018];
  v16[2] = *MEMORY[0x24BDE9048];
  v16[3] = v9;
  v17[2] = &unk_24C4C9108;
  v17[3] = MEMORY[0x24BDBD1C0];
  v10 = SecKeyCreateWithData(v4, (CFDictionaryRef)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 4), 0);

  secKeyRef = v5->_secKeyRef;
  v5->_secKeyRef = v10;

  if (v5->_secKeyRef)
    v12 = v5;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)signData:(id)a3 error:(id *)a4
{
  return SecKeyCreateSignature((SecKeyRef)self->_secKeyRef, (SecKeyAlgorithm)*MEMORY[0x24BDE92C8], (CFDataRef)a3, 0);
}

- (id)dataRepresentation
{
  return SecKeyCopyExternalRepresentation((SecKeyRef)self->_secKeyRef, 0);
}

- (id)publicKey
{
  __SecKey *v2;
  CFDataRef v3;
  LegacySigningKeyPublic *v4;

  v2 = SecKeyCopyPublicKey((SecKeyRef)self->_secKeyRef);
  v3 = SecKeyCopyExternalRepresentation(v2, 0);
  v4 = -[LegacySigningKeyPublic initWithData:error:]([LegacySigningKeyPublic alloc], "initWithData:error:", v3, 0);

  return v4;
}

- (id)secKeyRef
{
  return self->_secKeyRef;
}

- (void)setSecKeyRef:(id)a3
{
  objc_storeStrong(&self->_secKeyRef, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secKeyRef, 0);
}

@end
