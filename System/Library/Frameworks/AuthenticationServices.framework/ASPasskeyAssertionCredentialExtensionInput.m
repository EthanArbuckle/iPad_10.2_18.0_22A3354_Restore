@implementation ASPasskeyAssertionCredentialExtensionInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)largeBlob
{
  ASPasskeyAssertionCredentialExtensionInput *v2;
  id v3;

  v2 = self;
  v3 = sub_20E52E76C();

  return (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *)v3;
}

- (ASPasskeyAssertionCredentialExtensionInput)initWithCoreExtensions:(id)a3
{
  objc_class *v4;
  ASPasskeyAssertionCredentialExtensionInput *v5;
  void *v6;

  v4 = (objc_class *)a3;
  v5 = -[ASPasskeyAssertionCredentialExtensionInput init](self, sel_init);
  v6 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions) = v4;

  return v5;
}

- (ASPasskeyAssertionCredentialExtensionInput)initWithCoder:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  ASPasskeyAssertionCredentialExtensionInput *v8;

  sub_20E557008();
  v5 = a3;
  v6 = sub_20E557398();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[ASPasskeyAssertionCredentialExtensionInput initWithCoreExtensions:](self, sel_initWithCoreExtensions_, v6);

    return v8;
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  ASPasskeyAssertionCredentialExtensionInput *v6;
  id v7;
  id v8;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions);
  v5 = a3;
  v6 = self;
  v7 = v4;
  v8 = (id)sub_20E5572A8();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (id)copyWithZone:(void *)a3
{
  return objc_msgSend(objc_allocWithZone((Class)ASPasskeyAssertionCredentialExtensionInput), sel_initWithCoreExtensions_, *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions));
}

- (ASPasskeyAssertionCredentialExtensionInput)init
{
  uint64_t v3;
  id v4;
  ASPasskeyAssertionCredentialExtensionInput *v5;
  objc_super v7;

  v3 = OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions;
  v4 = objc_allocWithZone((Class)sub_20E557008());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)ASPasskeyAssertionCredentialExtensionInput;
  return -[ASPasskeyAssertionCredentialExtensionInput init](&v7, sel_init);
}

- (void).cxx_destruct
{

}

@end
