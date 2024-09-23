@implementation ASTContext

- (ASTContext)init
{
  ASTIdentity *v3;
  ASTContext *v4;

  v3 = objc_alloc_init(ASTIdentity);
  v4 = -[ASTContext initWithIdentity:](self, "initWithIdentity:", v3);

  return v4;
}

- (ASTContext)initWithIdentity:(id)a3
{
  id v5;
  ASTContext *v6;
  ASTContext *v7;
  ASTControlCommand *v8;
  ASTControlCommand *controlCommand;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASTContext;
  v6 = -[ASTContext init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identity, a3);
    v8 = objc_alloc_init(ASTControlCommand);
    controlCommand = v7->_controlCommand;
    v7->_controlCommand = v8;

    v7->_testSuiteRunning = 0;
    v7->_clientStatus = 0;
    v7->_command = 0;
  }

  return v7;
}

- (ASTContext)initWithCoder:(id)a3
{
  id v4;
  ASTContext *v5;
  uint64_t v6;
  ASTIdentity *identity;
  uint64_t v8;
  ASTControlCommand *controlCommand;

  v4 = a3;
  v5 = -[ASTContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
    v6 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (ASTIdentity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("controlCommand"));
    v8 = objc_claimAutoreleasedReturnValue();
    controlCommand = v5->_controlCommand;
    v5->_controlCommand = (ASTControlCommand *)v8;

    v5->_clientStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientStatus"));
    v5->_command = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("command"));
    v5->_testSuiteRunning = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("testSuiteRunning"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[ASTContext identity](self, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("identity"));

  -[ASTContext controlCommand](self, "controlCommand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("controlCommand"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[ASTContext clientStatus](self, "clientStatus"), CFSTR("clientStatus"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[ASTContext command](self, "command"), CFSTR("command"));
  objc_msgSend(v6, "encodeBool:forKey:", -[ASTContext testSuiteRunning](self, "testSuiteRunning"), CFSTR("testSuiteRunning"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[ASTIdentity copyWithZone:](self->_identity, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    v8 = -[ASTControlCommand copyWithZone:](self->_controlCommand, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v8;

    *(_QWORD *)(v5 + 24) = self->_clientStatus;
    *(_QWORD *)(v5 + 32) = self->_command;
    *(_BYTE *)(v5 + 8) = self->_testSuiteRunning;
  }
  return (id)v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTContext identity](self, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASTRequest stringFromClientStatus:](ASTRequest, "stringFromClientStatus:", -[ASTContext clientStatus](self, "clientStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASTResponse stringFromCommand:](ASTResponse, "stringFromCommand:", -[ASTContext command](self, "command"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTContext controlCommand](self, "controlCommand");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identity = %@, clientStatus = %@, command = %@, controlCommand = %@, testSuiteRunning = %d>"),
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    -[ASTContext testSuiteRunning](self, "testSuiteRunning"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (ASTIdentity)identity
{
  return self->_identity;
}

- (int64_t)clientStatus
{
  return self->_clientStatus;
}

- (void)setClientStatus:(int64_t)a3
{
  self->_clientStatus = a3;
}

- (int64_t)command
{
  return self->_command;
}

- (void)setCommand:(int64_t)a3
{
  self->_command = a3;
}

- (BOOL)testSuiteRunning
{
  return self->_testSuiteRunning;
}

- (void)setTestSuiteRunning:(BOOL)a3
{
  self->_testSuiteRunning = a3;
}

- (ASTControlCommand)controlCommand
{
  return self->_controlCommand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlCommand, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
