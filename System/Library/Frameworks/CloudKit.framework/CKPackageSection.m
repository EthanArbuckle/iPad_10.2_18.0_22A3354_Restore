@implementation CKPackageSection

- (CKPackageSection)initWithIndex:(int64_t)a3 signature:(id)a4 size:(unint64_t)a5 paddedSize:(unint64_t)a6 verificationKey:(id)a7
{
  id v12;
  id v13;
  CKPackageSection *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CKPackageSection *v18;
  uint64_t v19;
  NSData *signature;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSData *verificationKey;
  objc_super v27;

  v12 = a4;
  v13 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CKPackageSection;
  v14 = -[CKPackageSection init](&v27, sel_init);
  v18 = v14;
  if (v14)
  {
    v14->_index = a3;
    v19 = objc_msgSend_copy(v12, v15, v16, v17);
    signature = v18->_signature;
    v18->_signature = (NSData *)v19;

    v24 = objc_msgSend_copy(v13, v21, v22, v23);
    verificationKey = v18->_verificationKey;
    v18->_verificationKey = (NSData *)v24;

    v18->_size = a5;
    v18->_paddedSize = a6;
  }

  return v18;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_index(self, a2, v2, v3);
  v10 = objc_msgSend_size(self, v7, v8, v9);
  objc_msgSend_signature(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_paddedSize(self, v15, v16, v17);
  objc_msgSend_stringWithFormat_(v5, v19, (uint64_t)CFSTR("index=%ld, size=%llu, signature=%@, paddedSize=%llu"), v20, v6, v10, v14, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)description
{
  return (id)((uint64_t (*)(CKPackageSection *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (int64_t)index
{
  return self->_index;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)verificationKey
{
  return self->_verificationKey;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)paddedSize
{
  return self->_paddedSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationKey, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
