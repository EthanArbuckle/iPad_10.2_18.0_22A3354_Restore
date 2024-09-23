@implementation WCUserInfo

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCUserInfo userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCUserInfo userInfoData](self, "userInfoData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCUserInfo clientUserInfo](self, "clientUserInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, userInfo: %@, userInfoData: %@, client user info: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)userInfo
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSDictionary *v8;
  NSObject *p_super;
  void *v11;
  id v12;

  v3 = self->_userInfo;
  if (!self->_userInfo)
  {
    -[WCUserInfo userInfoData](self, "userInfoData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[WCUserInfo userInfoData](self, "userInfoData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      WCDeserializePayloadData(v5, &v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;

      if (v6)
      {
        v8 = (NSDictionary *)objc_msgSend(v6, "copy");
        p_super = &self->_userInfo->super;
        self->_userInfo = v8;
      }
      else
      {
        wc_log();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[WCUserInfo userInfo].cold.1((uint64_t)v7, p_super);
      }

    }
    else
    {
      v6 = v3;
    }
    if (self->_userInfo)
      return (NSDictionary *)v6;
    -[WCUserInfo clientUserInfo](self, "clientUserInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      return (NSDictionary *)v6;
    -[WCUserInfo clientUserInfo](self, "clientUserInfo");
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (BOOL)updateUserInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  -[WCUserInfo setClientUserInfo:](self, "setClientUserInfo:", v6);
  WCSerializePayloadDictionary(v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = 7010;
LABEL_8:
      objc_msgSend(v9, "wcErrorWithCode:", v10);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (!WCIsDataAcceptableSizeForType(2, v7))
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = 7009;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[WCUserInfo setUserInfoData:](self, "setUserInfoData:", v7);
  objc_storeStrong((id *)&self->_userInfo, self->_clientUserInfo);
  -[WCUserInfo setClientUserInfo:](self, "setClientUserInfo:", 0);
  v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)updateUserInfoData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[WCUserInfo userInfoData](self, "userInfoData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[WCUserInfo setUserInfoData:](self, "setUserInfoData:", v6);
    v8 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "wcInternalErrorWithCode:", 7501);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v8);
LABEL_4:

  return v7 == 0;
}

- (BOOL)verifyUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  NSDictionary *v8;
  NSDictionary *userInfo;
  id v11;

  -[WCUserInfo userInfoData](self, "userInfoData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[WCUserInfo userInfoData](self, "userInfoData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  WCDeserializePayloadData(v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  v7 = v5 != 0;
  if (v5)
  {
    v8 = (NSDictionary *)objc_msgSend(v5, "copy");
    userInfo = self->_userInfo;
    self->_userInfo = v8;

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_userInfoData, CFSTR("userInfoData"));
}

- (WCUserInfo)initWithCoder:(id)a3
{
  id v4;
  WCUserInfo *v5;
  void *v6;
  uint64_t v7;
  NSData *userInfoData;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WCUserInfo;
  v5 = -[WCUserInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userInfoData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    userInfoData = v5->_userInfoData;
    v5->_userInfoData = (NSData *)v7;

  }
  return v5;
}

- (NSData)userInfoData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserInfoData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)clientUserInfo
{
  return self->_clientUserInfo;
}

- (void)setClientUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientUserInfo, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_userInfoData, 0);
}

- (void)userInfo
{
  void *v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  NSPrintF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446466;
  v5 = "-[WCUserInfo userInfo]";
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_216F21000, a2, OS_LOG_TYPE_ERROR, "%{public}s could not deserialize user info data %{public}@", buf, 0x16u);

}

@end
