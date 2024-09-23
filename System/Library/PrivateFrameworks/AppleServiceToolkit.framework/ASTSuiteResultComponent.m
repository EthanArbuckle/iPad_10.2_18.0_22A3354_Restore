@implementation ASTSuiteResultComponent

- (ASTSuiteResultComponent)initWithName:(id)a3 assetLocator:(id)a4 status:(id)a5 sections:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ASTSuiteResultComponent *v15;
  ASTSuiteResultComponent *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ASTSuiteResultComponent;
  v15 = -[ASTSuiteResultComponent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_assetLocator, a4);
    objc_storeStrong((id *)&v16->_status, a5);
    objc_storeStrong((id *)&v16->_sections, a6);
  }

  return v16;
}

- (ASTSuiteResultComponent)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  ASTSuiteResultComponent *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  ASTSuiteResultComponent *v14;
  ASTSuiteResultStatus *v16;
  ASTSuiteResultStatus *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  ASTSuiteResultSection *v22;
  ASTSuiteResultSection *v23;
  void *v24;
  NSArray *v25;
  NSArray *sections;
  ASTSuiteResultStatus *v27;
  void *v28;
  NSArray *obj;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ASTSuiteResultComponent;
  v7 = -[ASTSuiteResultComponent init](&v35, sel_init);
  if (!v7)
    goto LABEL_13;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("assetLocator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    ASTLogHandleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ASTSuiteResult initWithDictionary:error:].cold.1((uint64_t)v7, v12);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -7000, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = 1;
  }
  else
  {
    v16 = -[ASTSuiteResultStatus initWithDictionary:error:]([ASTSuiteResultStatus alloc], "initWithDictionary:error:", v11, a4);
    v17 = v16;
    if (v16)
    {
      v27 = v16;
      v28 = v11;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      obj = v10;
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v32;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(obj);
            v22 = -[ASTSuiteResultSection initWithDictionary:error:]([ASTSuiteResultSection alloc], "initWithDictionary:error:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), a4);
            if (!v22)
            {
              v13 = 1;
              v17 = v27;
              sections = obj;
              v24 = v30;
              goto LABEL_26;
            }
            v23 = v22;
            objc_msgSend(v30, "addObject:", v22);

          }
          v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
          if (v19)
            continue;
          break;
        }
      }

      objc_storeStrong((id *)&v7->_name, v8);
      objc_storeStrong((id *)&v7->_assetLocator, v9);
      v17 = v27;
      objc_storeStrong((id *)&v7->_status, v27);
      v24 = v30;
      v25 = v30;
      v13 = 0;
      sections = v7->_sections;
      v7->_sections = v25;
LABEL_26:

      v11 = v28;
    }
    else
    {
      v13 = 1;
    }

  }
  if (v13)
    v14 = 0;
  else
LABEL_13:
    v14 = v7;

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)assetLocator
{
  return self->_assetLocator;
}

- (void)setAssetLocator:(id)a3
{
  objc_storeStrong((id *)&self->_assetLocator, a3);
}

- (ASTSuiteResultStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_assetLocator, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
