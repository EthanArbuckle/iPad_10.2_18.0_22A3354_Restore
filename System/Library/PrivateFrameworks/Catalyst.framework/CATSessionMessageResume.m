@implementation CATSessionMessageResume

- (CATSessionMessageResume)initWithSessionUUID:(id)a3
{
  id v5;
  CATSessionMessageResume *v6;
  CATSessionMessageResume *v7;

  v5 = a3;
  v6 = -[CATMessage init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sessionUUID, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATSessionMessageResume)initWithCoder:(id)a3
{
  id v4;
  CATSessionMessageResume *v5;
  void *v6;
  uint64_t v7;
  NSUUID *sessionUUID;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *clientUserInfo;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CATSessionMessageResume;
  v5 = -[CATMessage initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sessionUUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v7;

    v23 = (void *)MEMORY[0x24BDBCF20];
    v22 = objc_opt_class();
    v21 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v22, v21, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("clientUserInfo"));
    v18 = objc_claimAutoreleasedReturnValue();
    clientUserInfo = v5->_clientUserInfo;
    v5->_clientUserInfo = (NSDictionary *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CATSessionMessageResume;
  v4 = a3;
  -[CATMessage encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CATSessionMessageResume sessionUUID](self, "sessionUUID", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionUUID"));

  -[CATSessionMessageResume clientUserInfo](self, "clientUserInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("clientUserInfo"));

}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
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
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
