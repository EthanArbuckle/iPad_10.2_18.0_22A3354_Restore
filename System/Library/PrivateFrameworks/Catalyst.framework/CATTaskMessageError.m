@implementation CATTaskMessageError

- (CATTaskMessageError)initWithTaskUUID:(id)a3 taskError:(id)a4
{
  id v7;
  id v8;
  CATTaskMessageError *v9;
  CATTaskMessageError *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATTaskMessageError.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("taskError"));

  }
  v13.receiver = self;
  v13.super_class = (Class)CATTaskMessageError;
  v9 = -[CATTaskMessage initWithTaskUUID:](&v13, sel_initWithTaskUUID_, v7);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_taskError, a4);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskMessageError)initWithCoder:(id)a3
{
  id v4;
  CATTaskMessageError *v5;
  void *v6;
  uint64_t v7;
  NSError *taskError;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATTaskMessageError;
  v5 = -[CATTaskMessage initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("taskError"));
    v7 = objc_claimAutoreleasedReturnValue();
    taskError = v5->_taskError;
    v5->_taskError = (NSError *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CATTaskMessageError;
  v4 = a3;
  -[CATTaskMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CATTaskMessageError taskError](self, "taskError", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("taskError"));

}

- (NSError)taskError
{
  return self->_taskError;
}

- (void)setTaskError:(id)a3
{
  objc_storeStrong((id *)&self->_taskError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskError, 0);
}

@end
