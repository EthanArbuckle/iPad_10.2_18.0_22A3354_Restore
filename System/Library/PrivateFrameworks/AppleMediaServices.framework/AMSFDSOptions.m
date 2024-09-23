@implementation AMSFDSOptions

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_action;
  v6 = -[AMSProcessInfo copyWithZone:](self->_clientInfo, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t action;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  action = self->_action;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", action);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("kCodingKeyAction"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_clientInfo, CFSTR("kCodingKeyClientInfo"));
}

- (AMSFDSOptions)initWithCoder:(id)a3
{
  id v4;
  AMSFDSOptions *v5;
  void *v6;
  uint64_t v7;
  AMSProcessInfo *clientInfo;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSFDSOptions;
  v5 = -[AMSFDSOptions init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyAction"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_action = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyClientInfo"));
    v7 = objc_claimAutoreleasedReturnValue();
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (AMSProcessInfo *)v7;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)bundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[AMSFDSOptions clientInfo](self, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxyAppBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[AMSFDSOptions clientInfo](self, "clientInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end
