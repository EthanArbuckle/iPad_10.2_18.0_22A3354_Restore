@implementation DKCloudUploadResult

+ (id)resultWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v5;
  DKCloudUploadResult *v6;

  v4 = a3;
  v5 = a4;
  v6 = objc_alloc_init(DKCloudUploadResult);
  -[DKCloudUploadResult setSuccess:](v6, "setSuccess:", v4);
  -[DKCloudUploadResult setError:](v6, "setError:", v5);

  return v6;
}

+ (id)resultWithAccount:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  v8 = a3;
  objc_msgSend(a1, "resultWithSuccess:error:", v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUsername:", v10);

  v11 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend(v8, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);

  objc_msgSend(v11, "numberWithBool:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPrimaryAccount:", v13);

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKCloudUploadResult username](self, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKCloudUploadResult isPrimaryAccount](self, "isPrimaryAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DKCloudUploadResult success](self, "success");
  -[DKCloudUploadResult error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> username: %@ isPrimaryAccount: %@ success: %d error: %@"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_storeStrong((id *)&self->_username, a3);
}

- (NSNumber)isPrimaryAccount
{
  return self->_primaryAccount;
}

- (void)setPrimaryAccount:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccount, a3);
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_primaryAccount, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
