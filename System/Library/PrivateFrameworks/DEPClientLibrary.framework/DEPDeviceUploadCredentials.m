@implementation DEPDeviceUploadCredentials

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEPDeviceUploadCredentials)initWithDsid:(id)a3 dsToken:(id)a4
{
  id v7;
  id v8;
  DEPDeviceUploadCredentials *v9;
  DEPDeviceUploadCredentials *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DEPDeviceUploadCredentials;
  v9 = -[DEPDeviceUploadCredentials init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dsid, a3);
    objc_storeStrong((id *)&v10->_dsToken, a4);
  }

  return v10;
}

- (DEPDeviceUploadCredentials)initWithCoder:(id)a3
{
  id v4;
  DEPDeviceUploadCredentials *v5;
  uint64_t v6;
  NSString *dsid;
  uint64_t v8;
  NSString *dsToken;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEPDeviceUploadCredentials;
  v5 = -[DEPDeviceUploadCredentials init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
    v6 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    dsToken = v5->_dsToken;
    v5->_dsToken = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *dsid;
  id v5;

  dsid = self->_dsid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dsid, CFSTR("dsid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dsToken, CFSTR("dsToken"));

}

- (NSString)dsid
{
  return self->_dsid;
}

- (NSString)dsToken
{
  return self->_dsToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsToken, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
