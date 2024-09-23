@implementation ASTConnectionRetrieveSelfServiceSuites

- (ASTConnectionRetrieveSelfServiceSuites)initWithConfigCode:(id)a3
{
  id v5;
  ASTConnectionRetrieveSelfServiceSuites *v6;
  ASTConnectionRetrieveSelfServiceSuites *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASTConnectionRetrieveSelfServiceSuites;
  v6 = -[ASTMaterializedConnection init](&v9, sel_init);
  v7 = v6;
  if (v5 && v6)
    objc_storeStrong((id *)&v6->_configCode, a3);

  return v7;
}

- (id)endpoint
{
  return CFSTR("retrieve/suites");
}

- (id)method
{
  return CFSTR("GET");
}

- (id)parameters
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("configCode");
  -[ASTConnectionRetrieveSelfServiceSuites configCode](self, "configCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)configCode
{
  return self->_configCode;
}

- (void)setConfigCode:(id)a3
{
  objc_storeStrong((id *)&self->_configCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configCode, 0);
}

@end
