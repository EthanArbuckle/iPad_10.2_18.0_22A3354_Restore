@implementation ASTSuiteResultSection

- (ASTSuiteResultSection)initWithTitle:(id)a3 tests:(id)a4
{
  id v7;
  id v8;
  ASTSuiteResultSection *v9;
  ASTSuiteResultSection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASTSuiteResultSection;
  v9 = -[ASTSuiteResultSection init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_tests, a4);
  }

  return v10;
}

- (ASTSuiteResultSection)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  ASTSuiteResultSection *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  ASTSuiteResultSection *v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ASTSuiteResultTest *v18;
  ASTSuiteResultTest *v19;
  NSString *title;
  id v21;
  NSArray *tests;
  id v24;
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
  v29.super_class = (Class)ASTSuiteResultSection;
  v7 = -[ASTSuiteResultSection init](&v29, sel_init);
  if (!v7)
  {
LABEL_19:
    v11 = v7;
    goto LABEL_21;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v8 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tests"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = v6;
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
          v18 = -[ASTSuiteResultTest initWithDictionary:error:]([ASTSuiteResultTest alloc], "initWithDictionary:error:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v17), a4);
          if (!v18)
          {

            v11 = 0;
            v6 = v24;
            goto LABEL_21;
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

    title = v7->_title;
    v7->_title = (NSString *)v8;
    v21 = v8;

    tests = v7->_tests;
    v7->_tests = v12;

    v6 = v24;
    goto LABEL_19;
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

  v11 = 0;
LABEL_21:

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSArray)tests
{
  return self->_tests;
}

- (void)setTests:(id)a3
{
  objc_storeStrong((id *)&self->_tests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tests, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
