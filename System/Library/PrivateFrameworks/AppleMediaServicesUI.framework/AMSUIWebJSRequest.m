@implementation AMSUIWebJSRequest

- (AMSUIWebJSRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebJSRequest;
  return -[AMSUIWebJSRequest init](&v3, sel_init);
}

- (AMSUIWebJSRequest)initWithServiceName:(id)a3 logKey:(id)a4
{
  id v7;
  id v8;
  AMSUIWebJSRequest *v9;
  NSString *v10;
  NSString *logKey;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebJSRequest;
  v9 = -[AMSUIWebJSRequest init](&v13, sel_init);
  if (v9)
  {
    if (v8)
    {
      v10 = (NSString *)v8;
    }
    else
    {
      AMSGenerateLogCorrelationKey();
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    logKey = v9->_logKey;
    v9->_logKey = v10;

    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AMSUIWebJSRequest logKey](self, "logKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCodingKeyLogKey"));

  -[AMSUIWebJSRequest options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCodingKeyOptions"));

  -[AMSUIWebJSRequest service](self, "service");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCodingKeyService"));

}

- (AMSUIWebJSRequest)initWithCoder:(id)a3
{
  id v4;
  AMSUIWebJSRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *logKey;
  uint64_t v11;
  NSDictionary *options;
  uint64_t v13;
  NSString *service;
  objc_super v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebJSRequest;
  v5 = -[AMSUIWebJSRequest init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyLogKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCodingKeyOptions"));
    v11 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyService"));
    v13 = objc_claimAutoreleasedReturnValue();
    service = v5->_service;
    v5->_service = (NSString *)v13;

  }
  return v5;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end
