@implementation ASTProfileResult

- (ASTProfileResult)init
{
  void *v3;
  ASTProfileResult *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ASTProfileResult initWithIdentity:](self, "initWithIdentity:", v3);

  return v4;
}

- (ASTProfileResult)initWithIdentity:(id)a3
{
  id v5;
  ASTProfileResult *v6;
  ASTProfileResult *v7;
  NSArray *properties;
  NSArray *v9;
  NSArray *tests;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASTProfileResult;
  v6 = -[ASTProfileResult init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identity, a3);
    properties = v7->_properties;
    v9 = (NSArray *)MEMORY[0x24BDBD1A8];
    v7->_properties = (NSArray *)MEMORY[0x24BDBD1A8];

    tests = v7->_tests;
    v7->_tests = v9;

  }
  return v7;
}

+ (id)resultWithIdentity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentity:", v4);

  return v5;
}

- (id)generatePayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[ASTProfileResult tests](self, "tests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ASTProfileResult tests](self, "tests", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

  -[ASTProfileResult identity](self, "identity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hostAppBuild");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  -[ASTProfileResult identity](self, "identity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hostAppVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  -[ASTProfileResult properties](self, "properties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    -[ASTProfileResult properties](self, "properties");
  else
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASTEnvironment currentEnvironment](ASTEnvironment, "currentEnvironment");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "environmentType");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v23, CFSTR("profile"));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v5, CFSTR("tests"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("environment"));

  objc_msgSend(v26, "setObject:forKeyedSubscript:", v16, CFSTR("diagnosticsBuild"));
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, CFSTR("diagnosticsVersion"));
  if ((unint64_t)(v25 - 9) <= 1)
    objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_24F975FB0, CFSTR("context"));
  v28 = (void *)objc_msgSend(v26, "copy");

  return v28;
}

+ (id)sealedProfileResultWithPayload:(id)a3 signature:(id)a4
{
  id v5;
  id v6;
  ASTProfileResult *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ASTSealablePayload initWithPayload:signature:]([ASTProfileResult alloc], "initWithPayload:signature:", v6, v5);

  return v7;
}

- (void)setTests:(id)a3
{
  objc_storeStrong((id *)&self->_tests, a3);
}

- (NSArray)tests
{
  return self->_tests;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (NSArray)properties
{
  return self->_properties;
}

- (ASTIdentity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_tests, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
