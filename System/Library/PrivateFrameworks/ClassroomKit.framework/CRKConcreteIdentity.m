@implementation CRKConcreteIdentity

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_underlyingIdentity);
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteIdentity;
  -[CRKConcreteIdentity dealloc](&v3, sel_dealloc);
}

- (CRKConcreteIdentity)initWithIdentity:(__SecIdentity *)a3
{
  CRKConcreteIdentity *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKConcreteIdentity;
  v4 = -[CRKConcreteIdentity init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_underlyingIdentity = a3;
  }
  return v4;
}

+ (id)identityWithConfiguration:(id)a3
{
  id v4;
  CRKIdentityRefFactory *v5;
  __SecIdentity *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;

  v4 = a3;
  v5 = -[CRKIdentityRefFactory initWithConfiguration:]([CRKIdentityRefFactory alloc], "initWithConfiguration:", v4);

  v11 = 0;
  v6 = -[CRKIdentityRefFactory makeIdentityRefWithError:](v5, "makeIdentityRefWithError:", &v11);
  v7 = v11;
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentity:", v6);
    CFRelease(v6);
  }
  else
  {
    _CRKLogGeneral_12();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CRKConcreteIdentity identityWithConfiguration:].cold.1(v7, v9);

    v8 = 0;
  }

  return v8;
}

+ (id)identityWithCertificate:(id)a3 privateKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  NSObject *v12;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  objc_msgSend(v6, "underlyingCertificate");
  v8 = objc_retainAutorelease(v7);
  objc_msgSend(v8, "underlyingPrivateKey");

  v9 = SecIdentityCreate();
  if (v9)
  {
    v10 = (const void *)v9;
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentity:", v9);
    CFRelease(v10);
  }
  else
  {
    _CRKLogGeneral_12();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[CRKConcreteIdentity identityWithCertificate:privateKey:].cold.1(v12);

    v11 = 0;
  }
  return v11;
}

- (CRKCertificate)certificate
{
  CRKConcreteCertificate *v2;
  CRKConcreteCertificate *v3;
  SecCertificateRef certificateRef;

  certificateRef = 0;
  v2 = 0;
  if (!SecIdentityCopyCertificate(-[CRKConcreteIdentity underlyingIdentity](objc_retainAutorelease(self), "underlyingIdentity"), &certificateRef))
  {
    v3 = [CRKConcreteCertificate alloc];
    v2 = -[CRKConcreteCertificate initWithCertificate:](v3, "initWithCertificate:", certificateRef);
    CFRelease(certificateRef);
  }
  return (CRKCertificate *)v2;
}

- (CRKPrivateKey)privateKey
{
  CRKConcretePrivateKey *v2;
  CRKConcretePrivateKey *v3;
  SecKeyRef privateKeyRef;

  privateKeyRef = 0;
  v2 = 0;
  if (!SecIdentityCopyPrivateKey(-[CRKConcreteIdentity underlyingIdentity](objc_retainAutorelease(self), "underlyingIdentity"), &privateKeyRef))
  {
    v3 = [CRKConcretePrivateKey alloc];
    v2 = -[CRKConcretePrivateKey initWithPrivateKey:](v3, "initWithPrivateKey:", privateKeyRef);
    CFRelease(privateKeyRef);
  }
  return (CRKPrivateKey *)v2;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  CRKConcreteIdentity *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = objc_retainAutorelease(self);
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { underlyingIdentity = %@ }>"), v4, v5, -[CRKConcreteIdentity underlyingIdentity](v5, "underlyingIdentity"));
}

- (__SecIdentity)underlyingIdentity
{
  return self->_underlyingIdentity;
}

+ (void)identityWithConfiguration:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Failed to create identity ref: %{public}@", (uint8_t *)&v4, 0xCu);

}

+ (void)identityWithCertificate:(os_log_t)log privateKey:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "Error creating the identity from certificate and private key", v1, 2u);
}

@end
