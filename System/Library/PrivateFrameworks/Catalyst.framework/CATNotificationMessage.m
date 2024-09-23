@implementation CATNotificationMessage

- (CATNotificationMessage)initWithName:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  CATNotificationMessage *v9;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSDictionary *userInfo;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATNotificationMessage.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  v16.receiver = self;
  v16.super_class = (Class)CATNotificationMessage;
  v9 = -[CATMessage init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    userInfo = v9->_userInfo;
    v9->_userInfo = (NSDictionary *)v12;

  }
  return v9;
}

- (CATNotificationMessage)initWithTaskUUID:(id)a3 name:(id)a4 userInfo:(id)a5
{
  id v10;
  id v11;
  id v12;
  CATNotificationMessage *v13;
  CATNotificationMessage *v14;
  void *v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATNotificationMessage.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskUUID"));

  }
  v13 = -[CATNotificationMessage initWithName:userInfo:](self, "initWithName:userInfo:", v11, v12);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_taskUUID, a3);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATNotificationMessage)initWithCoder:(id)a3
{
  id v4;
  CATNotificationMessage *v5;
  void *v6;
  uint64_t v7;
  NSString *name;
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
  NSDictionary *userInfo;
  void *v20;
  uint64_t v21;
  NSUUID *taskUUID;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CATNotificationMessage;
  v5 = -[CATMessage initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("name"));
    v7 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v26 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    v24 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v25, v24, v9, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("userInfo"));
    v18 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v18;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("taskUUID"));
    v21 = objc_claimAutoreleasedReturnValue();
    taskUUID = v5->_taskUUID;
    v5->_taskUUID = (NSUUID *)v21;

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
  v8.super_class = (Class)CATNotificationMessage;
  v4 = a3;
  -[CATMessage encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CATNotificationMessage name](self, "name", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[CATNotificationMessage userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userInfo"));

  -[CATNotificationMessage taskUUID](self, "taskUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("taskUUID"));

}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (void)setTaskUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);
}

@end
