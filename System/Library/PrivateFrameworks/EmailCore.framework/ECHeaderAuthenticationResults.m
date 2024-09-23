@implementation ECHeaderAuthenticationResults

void ___ef_log_ECHeaderAuthenticationResults_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "ECHeaderAuthenticationResults");
  v1 = (void *)_ef_log_ECHeaderAuthenticationResults_log;
  _ef_log_ECHeaderAuthenticationResults_log = (uint64_t)v0;

}

+ (id)authenticationResultsForHeaders:(id)a3
{
  +[_ECHeaderAuthenticationResultsParser authenticationResultsForHeaders:]((uint64_t)_ECHeaderAuthenticationResultsParser, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)authenticationResultsForRawHeaders:(id)a3
{
  +[_ECHeaderAuthenticationResultsParser authenticationResultsForRawHeaders:]((uint64_t)_ECHeaderAuthenticationResultsParser, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (ECHeaderAuthenticationResults)initWithAuthenticationServiceIdentifier:(id)a3 version:(int64_t)a4 statements:(id)a5
{
  id v9;
  id v10;
  ECHeaderAuthenticationResults *v11;
  ECHeaderAuthenticationResults *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ECHeaderAuthenticationResults;
  v11 = -[ECHeaderAuthenticationResults init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_authenticationServiceIdentifier, a3);
    v12->_version = a4;
    objc_storeStrong((id *)&v12->_statements, a5);
  }

  return v12;
}

- (id)firstStatementForMethod:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[ECHeaderAuthenticationResults statements](self, "statements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ECHeaderAuthenticationResults_firstStatementForMethod___block_invoke;
  v9[3] = &unk_1E7121128;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "ef_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __57__ECHeaderAuthenticationResults_firstStatementForMethod___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "method");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (NSString)authenticationServiceIdentifier
{
  return self->_authenticationServiceIdentifier;
}

- (int64_t)version
{
  return self->_version;
}

- (NSArray)statements
{
  return self->_statements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong((id *)&self->_authenticationServiceIdentifier, 0);
}

@end
