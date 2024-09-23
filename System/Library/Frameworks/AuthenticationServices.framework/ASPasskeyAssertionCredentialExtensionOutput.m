@implementation ASPasskeyAssertionCredentialExtensionOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPasskeyAssertionCredentialExtensionOutput)initWithLargeBlobOutput:(id)a3
{
  id v4;

  v4 = a3;
  return (ASPasskeyAssertionCredentialExtensionOutput *)sub_20E5301E0(a3);
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput)largeBlobAssertionOutput
{
  ASPasskeyAssertionCredentialExtensionOutput *v2;
  id v3;

  v2 = self;
  v3 = sub_20E5304B8();

  return (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput *)v3;
}

- (ASPasskeyAssertionCredentialExtensionOutput)initWithCoder:(id)a3
{
  return (ASPasskeyAssertionCredentialExtensionOutput *)ASPasskeyAssertionCredentialExtensionOutput.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  ASPasskeyAssertionCredentialExtensionOutput *v6;
  id v7;
  id v8;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions);
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
  ASPasskeyAssertionCredentialExtensionOutput *v6;
  id v7;
  char *v8;
  void *v9;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions);
  v5 = objc_allocWithZone((Class)ASPasskeyAssertionCredentialExtensionOutput);
  v6 = self;
  v7 = v4;
  v8 = (char *)objc_msgSend(v5, sel_init);
  v9 = *(void **)&v8[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions];
  *(_QWORD *)&v8[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions] = v7;

  return v8;
}

- (void).cxx_destruct
{

}

@end
