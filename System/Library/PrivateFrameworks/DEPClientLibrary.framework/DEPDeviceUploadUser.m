@implementation DEPDeviceUploadUser

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEPDeviceUploadUser)initWithDsid:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  DEPDeviceUploadUser *v9;
  DEPDeviceUploadUser *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DEPDeviceUploadUser;
  v9 = -[DEPDeviceUploadUser init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dsid, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *dsid;
  id v5;

  dsid = self->_dsid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dsid, CFSTR("dsid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (DEPDeviceUploadUser)initWithCoder:(id)a3
{
  id v4;
  DEPDeviceUploadUser *v5;
  uint64_t v6;
  NSString *dsid;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEPDeviceUploadUser;
  v5 = -[DEPDeviceUploadUser init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
    v6 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

  }
  return v5;
}

- (DEPDeviceUploadUser)initWithApproverDict:(id)a3
{
  id v4;
  DEPDeviceUploadUser *v5;
  uint64_t v6;
  NSString *dsid;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEPDeviceUploadUser;
  v5 = -[DEPDeviceUploadUser init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("approverDsId"));
    v6 = objc_claimAutoreleasedReturnValue();
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("approverName"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

  }
  return v5;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
