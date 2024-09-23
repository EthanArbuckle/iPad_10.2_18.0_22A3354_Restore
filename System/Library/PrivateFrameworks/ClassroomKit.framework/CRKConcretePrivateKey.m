@implementation CRKConcretePrivateKey

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_underlyingPrivateKey);
  v3.receiver = self;
  v3.super_class = (Class)CRKConcretePrivateKey;
  -[CRKConcretePrivateKey dealloc](&v3, sel_dealloc);
}

- (CRKConcretePrivateKey)initWithPrivateKey:(__SecKey *)a3
{
  CRKConcretePrivateKey *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKConcretePrivateKey;
  v4 = -[CRKConcretePrivateKey init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_underlyingPrivateKey = a3;
  }
  return v4;
}

+ (id)privateKeyWithData:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFData *v7;
  const __CFDictionary *v8;
  SecKeyRef v9;
  void *v10;
  CFErrorRef v11;
  NSObject *v12;
  CFErrorRef v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDE9028];
  v15[0] = *MEMORY[0x24BDE9188];
  v15[1] = v4;
  v5 = *MEMORY[0x24BDE9030];
  v16[0] = *MEMORY[0x24BDE9080];
  v16[1] = v5;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = (const __CFData *)a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = SecKeyCreateWithData(v7, v8, &v14);

  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrivateKey:", v9);
    CFRelease(v9);
  }
  else
  {
    v11 = v14;
    _CRKLogGeneral_17();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[CRKConcretePrivateKey privateKeyWithData:].cold.1(v11);

    v10 = 0;
  }

  return v10;
}

- (NSData)dataRepresentation
{
  CFDataRef v2;
  CFErrorRef v3;
  NSObject *v4;
  CFErrorRef error;

  error = 0;
  v2 = SecKeyCopyExternalRepresentation(-[CRKConcretePrivateKey underlyingPrivateKey](objc_retainAutorelease(self), "underlyingPrivateKey"), &error);
  if (!v2)
  {
    v3 = error;
    _CRKLogGeneral_17();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CRKConcretePrivateKey dataRepresentation].cold.1(v3);

  }
  return (NSData *)v2;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  CRKConcretePrivateKey *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = objc_retainAutorelease(self);
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { underlyingPrivateKey = %@ }>"), v4, v5, -[CRKConcretePrivateKey underlyingPrivateKey](v5, "underlyingPrivateKey"));
}

- (__SecKey)underlyingPrivateKey
{
  return self->_underlyingPrivateKey;
}

+ (void)privateKeyWithData:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Error creating private key from data. Error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)dataRepresentation
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Error occurred while getting the private key, %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
