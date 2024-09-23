@implementation DEPDeviceUploadRequestType

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEPDeviceUploadRequestType)initWithCode:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  DEPDeviceUploadRequestType *v9;
  DEPDeviceUploadRequestType *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DEPDeviceUploadRequestType;
  v9 = -[DEPDeviceUploadRequestType init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_code, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *code;
  id v5;

  code = self->_code;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", code, CFSTR("code"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));

}

- (DEPDeviceUploadRequestType)initWithCoder:(id)a3
{
  id v4;
  DEPDeviceUploadRequestType *v5;
  uint64_t v6;
  NSString *code;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DEPDeviceUploadRequestType;
  v5 = -[DEPDeviceUploadRequestType init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("code"));
    v6 = objc_claimAutoreleasedReturnValue();
    code = v5->_code;
    v5->_code = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

  }
  return v5;
}

- (NSString)code
{
  return self->_code;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end
