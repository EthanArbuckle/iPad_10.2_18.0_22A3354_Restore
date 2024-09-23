@implementation CATTaskMessage

- (CATTaskMessage)initWithTaskUUID:(id)a3
{
  id v6;
  CATTaskMessage *v7;
  CATTaskMessage *v8;
  void *v10;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskMessage.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskUUID"));

  }
  v7 = -[CATMessage init](self, "init");
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_taskUUID, a3);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskMessage)initWithCoder:(id)a3
{
  id v4;
  CATTaskMessage *v5;
  void *v6;
  uint64_t v7;
  NSUUID *taskUUID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATTaskMessage;
  v5 = -[CATMessage initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("taskUUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    taskUUID = v5->_taskUUID;
    v5->_taskUUID = (NSUUID *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CATTaskMessage;
  v4 = a3;
  -[CATMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CATTaskMessage taskUUID](self, "taskUUID", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("taskUUID"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[CATMessage messageUUID](self, "messageUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CATTaskMessage taskUUID](self, "taskUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { messageUUID = '%@', taskUUID = '%@' }>"), v4, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)taskUUID
{
  return self->_taskUUID;
}

- (void)setTaskUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskUUID, 0);
}

@end
