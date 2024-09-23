@implementation DMTCertificatePayload

+ (NSSet)supportedPayloadTypes
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.security.pem"), CFSTR("com.apple.security.pkcs1"), CFSTR("com.apple.security.pkcs12"), CFSTR("com.apple.security.root"), 0);
}

- (DMTCertificatePayload)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  DMTCertificatePayload *v7;
  uint64_t v8;
  NSString *certificateFileName;
  uint64_t v10;
  NSData *content;
  DMTCertificatePayload *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSString *password;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMTCertificatePayload;
  v7 = -[DMTConfigurationPrimitive initWithDictionary:error:](&v18, sel_initWithDictionary_error_, v6, a4);
  if (v7)
  {
    DMTValidateProfileString(v6, CFSTR("PayloadCertificateFileName"), 1, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    certificateFileName = v7->_certificateFileName;
    v7->_certificateFileName = (NSString *)v8;

    DMTValidateProfileData(v6, CFSTR("PayloadContent"), 0, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    content = v7->_content;
    v7->_content = (NSData *)v10;

    v12 = 0;
    if (!*a4)
    {
      -[DMTConfigurationPrimitive type](v7, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.security.pkcs12"));

      if (!v14
        || (DMTValidateProfileString(v6, CFSTR("Password"), 0, a4),
            v15 = objc_claimAutoreleasedReturnValue(),
            password = v7->_password,
            v7->_password = (NSString *)v15,
            password,
            v12 = 0,
            !*a4))
      {
        v12 = v7;
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)certificateFileName
{
  return self->_certificateFileName;
}

- (NSData)content
{
  return self->_content;
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_certificateFileName, 0);
}

@end
