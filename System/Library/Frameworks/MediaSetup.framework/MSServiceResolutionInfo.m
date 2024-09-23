@implementation MSServiceResolutionInfo

- (MSServiceResolutionInfo)initWithServiceAppInfo:(id)a3 userAccountInfo:(id)a4
{
  id v7;
  id v8;
  MSServiceResolutionInfo *v9;
  id *p_isa;
  MSServiceResolutionInfo *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSServiceResolutionInfo;
  v9 = -[MSServiceResolutionInfo init](&v13, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (!v9)
    goto LABEL_5;
  v11 = 0;
  if (v7 && v8)
  {
    objc_storeStrong((id *)&v9->_serviceAppInfo, a3);
    objc_storeStrong(p_isa + 2, a4);
LABEL_5:
    v11 = p_isa;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MSServiceResolutionInfo: ThirdPartyAppInfo: %@ UserAccountInfo: %@>"), self->_serviceAppInfo, self->_userAccountInfo);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MSServiceAppInfo *serviceAppInfo;
  id v5;

  serviceAppInfo = self->_serviceAppInfo;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceAppInfo, CFSTR("MSSRAppInfoEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userAccountInfo, CFSTR("MSSRUserAccountEncodedKey"));

}

- (MSServiceResolutionInfo)initWithCoder:(id)a3
{
  id v4;
  MSServiceAppInfo *v5;
  MSServiceAppInfo *serviceAppInfo;
  MSUserAccountInfo *v7;
  MSUserAccountInfo *userAccountInfo;
  MSServiceResolutionInfo *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSRAppInfoEncodedKey"));
  v5 = (MSServiceAppInfo *)objc_claimAutoreleasedReturnValue();
  serviceAppInfo = self->_serviceAppInfo;
  self->_serviceAppInfo = v5;

  if (self->_serviceAppInfo
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MSSRUserAccountEncodedKey")),
        v7 = (MSUserAccountInfo *)objc_claimAutoreleasedReturnValue(),
        userAccountInfo = self->_userAccountInfo,
        self->_userAccountInfo = v7,
        userAccountInfo,
        self->_userAccountInfo))
  {
    self = -[MSServiceResolutionInfo initWithServiceAppInfo:userAccountInfo:](self, "initWithServiceAppInfo:userAccountInfo:", self->_serviceAppInfo);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (MSServiceAppInfo)serviceAppInfo
{
  return self->_serviceAppInfo;
}

- (MSUserAccountInfo)userAccountInfo
{
  return self->_userAccountInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAccountInfo, 0);
  objc_storeStrong((id *)&self->_serviceAppInfo, 0);
}

@end
