@implementation SLYahooWebOAuth2TokenResponse

- (SLYahooWebOAuth2TokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;
  SLYahooWebOAuth2TokenResponse *v12;
  SLYahooWebOAuth2TokenResponse *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  NSString *token;
  uint64_t v20;
  NSString *refreshToken;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSDate *expiryDate;
  void *v26;
  uint64_t v27;
  NSString *errorMessage;
  uint64_t v29;
  NSString *GUID;
  void *v32;
  void *v33;
  id v34;
  objc_super v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v5, 7, CFSTR("SLWebOAuth2TokenResponse initWithData: %@ length urlResponse: %@ error: %@"));

  v35.receiver = self;
  v35.super_class = (Class)SLYahooWebOAuth2TokenResponse;
  v12 = -[SLYahooWebOAuth2TokenResponse init](&v35, sel_init, v32, v10, v11);
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
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v5, 7, CFSTR("SLWebOAuth2TokenResponse httpResponse status code %@"));

      if (!v13->_error)
      {
        v34 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v34, v33);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v34;
        v17 = v34;
        if (v17)
          objc_storeStrong((id *)&v13->_error, v16);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)&v13->_data, v15);
          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("access_token"));
          v18 = objc_claimAutoreleasedReturnValue();
          token = v13->_token;
          v13->_token = (NSString *)v18;

          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("refresh_token"));
          v20 = objc_claimAutoreleasedReturnValue();
          refreshToken = v13->_refreshToken;
          v13->_refreshToken = (NSString *)v20;

          v22 = (void *)MEMORY[0x1E0C99D68];
          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("expires_in"));
          v23 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend((id)v23, "integerValue"));
          v24 = objc_claimAutoreleasedReturnValue();
          expiryDate = v13->_expiryDate;
          v13->_expiryDate = (NSDate *)v24;

          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("error"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          LOBYTE(v23) = objc_opt_isKindOfClass();

          if ((v23 & 1) != 0)
          {
            -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("error"));
            v27 = objc_claimAutoreleasedReturnValue();
            errorMessage = v13->_errorMessage;
            v13->_errorMessage = (NSString *)v27;

          }
          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("xoauth_yahoo_guid"));
          v29 = objc_claimAutoreleasedReturnValue();
          GUID = v13->_GUID;
          v13->_GUID = (NSString *)v29;

        }
        else
        {
          _SLLog(v5, 7, CFSTR("SLWebOAuth2TokenResponse response JSON data does not represent NSDictionary. Game over."));
        }

      }
    }
    else
    {
      _SLLog(v5, 7, CFSTR("SLWebOAuth2TokenResponse response is not NSHTTPURLResponse. Game over."));
    }
  }

  return v13;
}

- (NSDictionary)data
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)errorMessage
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)expiryDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)GUID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)refreshToken
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)idToken
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)grantedDataclasses
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grantedDataclasses, 0);
  objc_storeStrong((id *)&self->_idToken, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
