@implementation ASTSuiteResultTest

- (ASTSuiteResultTest)initWithTestID:(id)a3 name:(id)a4 value:(id)a5 status:(id)a6 result:(id)a7 description:(id)a8
{
  id v15;
  id v16;
  id v17;
  ASTSuiteResultTest *v18;
  ASTSuiteResultTest *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ASTSuiteResultTest;
  v18 = -[ASTSuiteResultTest init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_testID, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_value, a5);
    objc_storeStrong((id *)&v19->_status, a6);
    objc_storeStrong((id *)&v19->_result, a7);
    objc_storeStrong((id *)&v19->_testDescription, a8);
  }

  return v19;
}

- (ASTSuiteResultTest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  ASTSuiteResultTest *v7;
  NSNumber *v8;
  uint64_t v9;
  void *v10;
  ASTSuiteResultStatus *v11;
  NSString *v12;
  NSString *v13;
  NSNumber *testID;
  NSString *name;
  NSString *v16;
  NSString *value;
  id v18;
  ASTSuiteResultStatus *status;
  ASTSuiteResultStatus *v20;
  NSString *v21;
  NSString *v22;
  NSString *testDescription;
  ASTSuiteResultTest *v24;
  NSObject *v25;
  NSNumber *v27;
  NSString *v28;
  objc_super v29;

  v6 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ASTSuiteResultTest;
  v7 = -[ASTSuiteResultTest init](&v29, sel_init);
  if (!v7)
    goto LABEL_15;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("testID"));
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v9 = 0;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v10 = 0;
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  if (!v10)
    goto LABEL_8;
  v11 = -[ASTSuiteResultStatus initWithDictionary:error:]([ASTSuiteResultStatus alloc], "initWithDictionary:error:", v10, a4);
LABEL_9:
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("summary"));
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("testDescription"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v9 | (unint64_t)v11)
          {
            testID = v7->_testID;
            v7->_testID = v8;
            v27 = v8;

            name = v7->_name;
            v7->_name = v28;
            v16 = v28;

            value = v7->_value;
            v7->_value = (NSString *)v9;
            v18 = (id)v9;

            status = v7->_status;
            v7->_status = v11;
            v20 = v11;

            v21 = v7->_result;
            v7->_result = v12;
            v22 = v12;

            testDescription = v7->_testDescription;
            v7->_testDescription = v13;

LABEL_15:
            v24 = v7;
            goto LABEL_21;
          }
        }
      }
    }
  }
  ASTLogHandleForCategory(0);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[ASTSuiteResult initWithDictionary:error:].cold.1((uint64_t)v7, v25);

  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -7000, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v24 = 0;
LABEL_21:

  return v24;
}

- (NSNumber)testID
{
  return self->_testID;
}

- (void)setTestID:(id)a3
{
  objc_storeStrong((id *)&self->_testID, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (ASTSuiteResultStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSString)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (NSString)testDescription
{
  return self->_testDescription;
}

- (void)setTestDescription:(id)a3
{
  objc_storeStrong((id *)&self->_testDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDescription, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_testID, 0);
}

@end
