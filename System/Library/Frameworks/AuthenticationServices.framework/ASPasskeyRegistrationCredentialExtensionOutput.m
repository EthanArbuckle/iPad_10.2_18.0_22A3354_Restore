@implementation ASPasskeyRegistrationCredentialExtensionOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPasskeyRegistrationCredentialExtensionOutput)initWithLargeBlobOutput:(id)a3
{
  id v4;

  v4 = a3;
  return (ASPasskeyRegistrationCredentialExtensionOutput *)sub_20E531188(a3);
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput)largeBlobRegistrationOutput
{
  ASPasskeyRegistrationCredentialExtensionOutput *v2;
  id v3;

  v2 = self;
  v3 = sub_20E531324();

  return (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *)v3;
}

- (ASPasskeyRegistrationCredentialExtensionOutput)initWithCoder:(id)a3
{
  return (ASPasskeyRegistrationCredentialExtensionOutput *)ASPasskeyRegistrationCredentialExtensionOutput.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  ASPasskeyRegistrationCredentialExtensionOutput *v6;
  id v7;
  id v8;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions);
  v5 = a3;
  v6 = self;
  v7 = v4;
  v8 = (id)sub_20E5572A8();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (id)copyWithZone:(void *)a3
{
  void *v4;
  id v5;
  ASPasskeyRegistrationCredentialExtensionOutput *v6;
  id v7;
  char *v8;
  void *v9;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions);
  v5 = objc_allocWithZone((Class)ASPasskeyRegistrationCredentialExtensionOutput);
  v6 = self;
  v7 = v4;
  v8 = (char *)objc_msgSend(v5, sel_init);
  v9 = *(void **)&v8[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions];
  *(_QWORD *)&v8[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions] = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions));
}

@end
