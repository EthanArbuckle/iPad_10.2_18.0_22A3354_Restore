@implementation ASTSuiteResultStatus

- (ASTSuiteResultStatus)initWithStatus:(id)a3 statusCode:(id)a4
{
  id v7;
  id v8;
  ASTSuiteResultStatus *v9;
  ASTSuiteResultStatus *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASTSuiteResultStatus;
  v9 = -[ASTSuiteResultStatus init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_status, a3);
    objc_storeStrong((id *)&v10->_statusCode, a4);
  }

  return v10;
}

- (ASTSuiteResultStatus)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  ASTSuiteResultStatus *v7;
  NSString *v8;
  NSNumber *v9;
  NSObject *v10;
  ASTSuiteResultStatus *v11;
  NSString *status;
  NSString *v13;
  NSNumber *statusCode;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASTSuiteResultStatus;
  v7 = -[ASTSuiteResultStatus init](&v16, sel_init);
  if (!v7)
    goto LABEL_10;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("statusCode"));
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      status = v7->_status;
      v7->_status = v8;
      v13 = v8;

      statusCode = v7->_statusCode;
      v7->_statusCode = v9;

LABEL_10:
      v11 = v7;
      goto LABEL_11;
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

  v11 = 0;
LABEL_11:

  return v11;
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
  objc_storeStrong((id *)&self->_statusCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCode, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
