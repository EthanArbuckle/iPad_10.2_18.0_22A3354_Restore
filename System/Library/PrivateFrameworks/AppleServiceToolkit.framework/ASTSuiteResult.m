@implementation ASTSuiteResult

- (ASTSuiteResult)initWithName:(id)a3 components:(id)a4
{
  id v7;
  id v8;
  ASTSuiteResult *v9;
  ASTSuiteResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASTSuiteResult;
  v9 = -[ASTSuiteResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suiteName, a3);
    objc_storeStrong((id *)&v10->_components, a4);
  }

  return v10;
}

- (ASTSuiteResult)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  ASTSuiteResult *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  ASTSuiteResult *v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ASTSuiteResultComponent *v18;
  ASTSuiteResultComponent *v19;
  NSString *suiteName;
  id v21;
  NSArray *components;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ASTSuiteResult;
  v7 = -[ASTSuiteResult init](&v29, sel_init);
  if (!v7)
  {
LABEL_19:
    v11 = v7;
    goto LABEL_20;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suiteName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("components"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = v8;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = v9;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        while (2)
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = -[ASTSuiteResultComponent initWithDictionary:error:]([ASTSuiteResultComponent alloc], "initWithDictionary:error:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17), a4);
            if (!v18)
            {

              goto LABEL_9;
            }
            v19 = v18;
            -[NSArray addObject:](v12, "addObject:", v18);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          if (v15)
            continue;
          break;
        }
      }

      suiteName = v7->_suiteName;
      v7->_suiteName = (NSString *)v24;
      v21 = v24;

      components = v7->_components;
      v7->_components = v12;

      goto LABEL_19;
    }
  }
  ASTLogHandleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[ASTSuiteResult initWithDictionary:error:].cold.1((uint64_t)v7, v10);

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -7000, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  v11 = 0;
LABEL_20:

  return v11;
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
  objc_storeStrong((id *)&self->_suiteName, a3);
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
  objc_storeStrong((id *)&self->_components, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_suiteName, 0);
}

- (void)initWithDictionary:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_22D91B000, a2, OS_LOG_TYPE_ERROR, "[%@] Bad dictionary format", (uint8_t *)&v4, 0xCu);

}

@end
