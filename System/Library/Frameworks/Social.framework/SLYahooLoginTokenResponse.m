@implementation SLYahooLoginTokenResponse

- (SLYahooLoginTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;
  SLYahooLoginTokenResponse *v12;
  SLYahooLoginTokenResponse *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *body;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *loginToken;
  void *v23;
  void *v24;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v5, 7, CFSTR("SLYahooLoginTokenResponse initWithData: %@ length urlResponse: %@ error: %@"));

  v25.receiver = self;
  v25.super_class = (Class)SLYahooLoginTokenResponse;
  v12 = -[SLYahooLoginTokenResponse init](&v25, sel_init, v23, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v10, "statusCode");
      v13->_statusCode = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v5, 7, CFSTR("SLYahooLoginTokenResponse httpResponse status code %@"));

      if (!v13->_error)
      {
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4, v24);
        body = v13->_body;
        v13->_body = (NSString *)v15;

        -[NSString componentsSeparatedByString:](v13->_body, "componentsSeparatedByString:", CFSTR("="));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v17, "count") < 2)
        {
          v19 = v17;
        }
        else
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("\n"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v19, "count"))
          {
            objc_msgSend(v19, "firstObject");
            v20 = objc_claimAutoreleasedReturnValue();
            loginToken = v13->_loginToken;
            v13->_loginToken = (NSString *)v20;

          }
        }

      }
    }
    else
    {
      _SLLog(v5, 7, CFSTR("SLYahooLoginTokenResponse response is not NSHTTPURLResponse. Game over."));
    }
  }

  return v13;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)loginToken
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginToken, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
