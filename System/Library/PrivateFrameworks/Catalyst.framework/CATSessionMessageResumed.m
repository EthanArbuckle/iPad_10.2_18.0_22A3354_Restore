@implementation CATSessionMessageResumed

- (CATSessionMessageResumed)initWithSessionUUID:(id)a3
{
  id v5;
  CATSessionMessageResumed *v6;
  CATSessionMessageResumed *v7;
  NSArray *pendingRemoteTaskUUIDs;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATSessionMessageResumed;
  v6 = -[CATMessage init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionUUID, a3);
    pendingRemoteTaskUUIDs = v7->_pendingRemoteTaskUUIDs;
    v7->_pendingRemoteTaskUUIDs = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATSessionMessageResumed)initWithCoder:(id)a3
{
  id v4;
  CATSessionMessageResumed *v5;
  void *v6;
  uint64_t v7;
  NSUUID *sessionUUID;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *pendingRemoteTaskUUIDs;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSDictionary *serverUserInfo;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CATSessionMessageResumed;
  v5 = -[CATMessage initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sessionUUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v7;

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("pendingRemoteTaskUUIDs"));
    v12 = objc_claimAutoreleasedReturnValue();
    pendingRemoteTaskUUIDs = v5->_pendingRemoteTaskUUIDs;
    v5->_pendingRemoteTaskUUIDs = (NSArray *)v12;

    v28 = (void *)MEMORY[0x24BDBCF20];
    v27 = objc_opt_class();
    v26 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v27, v26, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("serverUserInfo"));
    v23 = objc_claimAutoreleasedReturnValue();
    serverUserInfo = v5->_serverUserInfo;
    v5->_serverUserInfo = (NSDictionary *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CATSessionMessageResumed;
  v4 = a3;
  -[CATMessage encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CATSessionMessageResumed sessionUUID](self, "sessionUUID", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionUUID"));

  -[CATSessionMessageResumed pendingRemoteTaskUUIDs](self, "pendingRemoteTaskUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pendingRemoteTaskUUIDs"));

  -[CATSessionMessageResumed serverUserInfo](self, "serverUserInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("serverUserInfo"));

}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)serverUserInfo
{
  return self->_serverUserInfo;
}

- (void)setServerUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)pendingRemoteTaskUUIDs
{
  return self->_pendingRemoteTaskUUIDs;
}

- (void)setPendingRemoteTaskUUIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRemoteTaskUUIDs, 0);
  objc_storeStrong((id *)&self->_serverUserInfo, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
