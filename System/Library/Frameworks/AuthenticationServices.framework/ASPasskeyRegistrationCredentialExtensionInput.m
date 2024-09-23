@implementation ASPasskeyRegistrationCredentialExtensionInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)largeBlob
{
  ASPasskeyRegistrationCredentialExtensionInput *v2;
  id v3;

  v2 = self;
  v3 = sub_20E54F838();

  return (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput *)v3;
}

- (ASPasskeyRegistrationCredentialExtensionInput)initWithCoreExtensions:(id)a3
{
  objc_class *v4;
  ASPasskeyRegistrationCredentialExtensionInput *v5;
  void *v6;

  v4 = (objc_class *)a3;
  v5 = -[ASPasskeyRegistrationCredentialExtensionInput init](self, sel_init);
  v6 = *(Class *)((char *)&v5->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions) = v4;

  return v5;
}

- (ASPasskeyRegistrationCredentialExtensionInput)initWithCoder:(id)a3
{
  return (ASPasskeyRegistrationCredentialExtensionInput *)ASPasskeyRegistrationCredentialExtensionInput.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  ASPasskeyRegistrationCredentialExtensionInput *v6;
  id v7;
  id v8;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions);
  v5 = a3;
  v6 = self;
  v7 = v4;
  v8 = (id)sub_20E5572A8();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (id)copyWithZone:(void *)a3
{
  objc_msgSend(objc_allocWithZone((Class)ASPasskeyRegistrationCredentialExtensionInput), sel_initWithCoreExtensions_, *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions));
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29998);
  return (id)sub_20E55756C();
}

- (ASPasskeyRegistrationCredentialExtensionInput)init
{
  uint64_t v3;
  id v4;
  ASPasskeyRegistrationCredentialExtensionInput *v5;
  objc_super v7;

  v3 = OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions;
  v4 = objc_allocWithZone((Class)sub_20E55714C());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)ASPasskeyRegistrationCredentialExtensionInput;
  return -[ASPasskeyRegistrationCredentialExtensionInput init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions));
}

@end
