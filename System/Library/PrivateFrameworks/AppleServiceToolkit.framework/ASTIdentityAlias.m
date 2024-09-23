@implementation ASTIdentityAlias

+ (id)identityAliasWithSerialNumber:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSerialNumber:", v4);

  return v5;
}

- (ASTIdentityAlias)initWithSerialNumber:(id)a3
{
  id v4;
  ASTIdentityAlias *v5;
  ASTIdentityAlias *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ASTIdentityAlias init](self, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v16[0] = CFSTR("type");
      v16[1] = CFSTR("serialNumber");
      v17[0] = CFSTR("FGSN");
      v17[1] = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      if (+[ASTIdentityAlias isCoreRepairFrameworkAvailable](ASTIdentityAlias, "isCoreRepairFrameworkAvailable"))
      {
        v15 = 0;
        -[objc_class isServicePartWithError:](NSClassFromString(CFSTR("CRRepairStatus")), "isServicePartWithError:", &v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
          v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("1"));
        else
          v11 = 0;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("isServicePart"));

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ASTIdentityAlias diagnosticMode](v6, "diagnosticMode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("isDiagnosticMode"));

      -[ASTIdentityAlias setDictionary:](v6, "setDictionary:", v8);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

+ (BOOL)isCoreRepairFrameworkAvailable
{
  char v2;
  _QWORD block[4];
  __CFString *v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ASTIdentityAlias_FGSN__isCoreRepairFrameworkAvailable__block_invoke;
  block[3] = &unk_24F969AE0;
  v5 = CFSTR("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit");
  if (isCoreRepairFrameworkAvailable_coreRepairToken != -1)
    dispatch_once(&isCoreRepairFrameworkAvailable_coreRepairToken, block);
  v2 = isCoreRepairFrameworkAvailable_isCoreRepairAvailable;

  return v2;
}

void *__56__ASTIdentityAlias_FGSN__isCoreRepairFrameworkAvailable__block_invoke(uint64_t a1)
{
  void *result;

  result = dlopen((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), 1);
  isCoreRepairFrameworkAvailable_isCoreRepairAvailable = result != 0;
  return result;
}

+ (id)identityAliasWithMainLogicBoardSerialNumber:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMainLogicBoardSerialNumber:", v4);

  return v5;
}

- (ASTIdentityAlias)initWithMainLogicBoardSerialNumber:(id)a3
{
  id v4;
  ASTIdentityAlias *v5;
  ASTIdentityAlias *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[ASTIdentityAlias init](self, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v10[0] = CFSTR("type");
      v10[1] = CFSTR("serialNumber");
      v11[0] = CFSTR("MLBSN");
      v11[1] = v4;
      v10[2] = CFSTR("isDiagnosticMode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ASTIdentityAlias diagnosticMode](v5, "diagnosticMode"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTIdentityAlias setDictionary:](v6, "setDictionary:", v8);

    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (ASTIdentityAlias)init
{
  ASTIdentityAlias *v2;
  void *v3;
  uint64_t v4;
  NSDictionary *dictionary;
  void *v6;
  NSDictionary *v7;
  void *v8;
  NSDictionary *v9;
  char v10;
  objc_super v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)ASTIdentityAlias;
  v2 = -[ASTIdentityAlias init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    v13[0] = CFSTR("type");
    v13[1] = CFSTR("serialNumber");
    v14[0] = CFSTR("FGSN");
    v14[1] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v4 = objc_claimAutoreleasedReturnValue();
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSDictionary *)v4;

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.AppleServiceToolkit"));
    if (+[ASTEnvironment isInternalBuild](ASTEnvironment, "isInternalBuild"))
    {
      v7 = (NSDictionary *)-[NSDictionary mutableCopy](v2->_dictionary, "mutableCopy");
      objc_msgSend(v6, "objectForKey:", CFSTR("TimberLorrySession"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setValue:forKey:](v7, "setValue:forKey:", v8, CFSTR("isTimberLorryTestSession"));
      v9 = v2->_dictionary;
      v2->_dictionary = v7;

    }
    if ((objc_msgSend(v6, "BOOLForKey:", CFSTR("DiagnosticMode")) & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(MEMORY[0x24BE15A68], "isCheckerBoardActive");
    v2->_diagnosticMode = v10;

  }
  return v2;
}

- (ASTIdentityAlias)initWithCoder:(id)a3
{
  id v4;
  ASTIdentityAlias *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *dictionary;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASTIdentityAlias;
  v5 = -[ASTIdentityAlias init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("dictionary"));
    v12 = objc_claimAutoreleasedReturnValue();
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASTIdentityAlias dictionary](self, "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionary"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDictionary copyWithZone:](self->_dictionary, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (BOOL)diagnosticMode
{
  return self->_diagnosticMode;
}

- (void)setDiagnosticMode:(BOOL)a3
{
  self->_diagnosticMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

+ (id)identityAliasWithChipId:(id)a3 uniqueChipId:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithChipId:uniqueChipId:", v7, v6);

  return v8;
}

- (ASTIdentityAlias)initWithChipId:(id)a3 uniqueChipId:(id)a4
{
  id v6;
  id v7;
  ASTIdentityAlias *v8;
  ASTIdentityAlias *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[ASTIdentityAlias init](self, "init");
  v9 = v8;
  if (v8)
  {
    if (v6 && v7)
    {
      v16[0] = CFSTR("ECID");
      v15[0] = CFSTR("type");
      v15[1] = CFSTR("chipId");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%08llX"), objc_msgSend(v6, "unsignedLongLongValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v10;
      v15[2] = CFSTR("ECID");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%016llX"), objc_msgSend(v7, "unsignedLongLongValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v11;
      v15[3] = CFSTR("isDiagnosticMode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ASTIdentityAlias diagnosticMode](v9, "diagnosticMode"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[3] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASTIdentityAlias setDictionary:](v9, "setDictionary:", v13);

    }
    else
    {

      v9 = 0;
    }
  }

  return v9;
}

@end
