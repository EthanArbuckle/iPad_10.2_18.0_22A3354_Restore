@implementation ASTTestAttributes

- (ASTTestAttributes)init
{
  void *v3;
  void *v4;
  ASTTestAttributes *v5;

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ASTTestAttributes initWithTestId:version:](self, "initWithTestId:version:", v3, v4);

  return v5;
}

- (ASTTestAttributes)initWithTestId:(id)a3 version:(id)a4
{
  id v7;
  id v8;
  ASTTestAttributes *v9;
  ASTTestAttributes *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASTTestAttributes;
  v9 = -[ASTTestAttributes init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_testId, a3);
    objc_storeStrong((id *)&v10->_version, a4);
  }

  return v10;
}

+ (id)attributesWithTestId:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTestId:version:", v7, v6);

  return v8;
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("testId");
  -[ASTTestAttributes testId](self, "testId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("version");
  v8[0] = v3;
  -[ASTTestAttributes version](self, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ASTTestAttributes testId](self, "testId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASTTestAttributes version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Test Id: %@, Version: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)testId
{
  return self->_testId;
}

- (void)setTestId:(id)a3
{
  objc_storeStrong((id *)&self->_testId, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_testId, 0);
}

@end
