@implementation SLGoogleOAuth2TokenResponse

- (SLGoogleOAuth2TokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;
  SLGoogleOAuth2TokenResponse *v12;
  SLGoogleOAuth2TokenResponse *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  NSString *token;
  uint64_t v21;
  NSString *refreshToken;
  uint64_t v23;
  NSString *idToken;
  void *v25;
  void *v26;
  uint64_t v27;
  NSDate *expiryDate;
  void *v29;
  void *v30;
  uint64_t v31;
  NSArray *grantedDataclasses;
  void *v33;
  char isKindOfClass;
  uint64_t v35;
  NSString *errorMessage;
  void *v38;
  void *v39;
  id v40;
  objc_super v41;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v5, 7, CFSTR("SLGoogleOAuth2TokenResponse initWithData: %@ length urlResponse: %@ error: %@"));

  v41.receiver = self;
  v41.super_class = (Class)SLGoogleOAuth2TokenResponse;
  v12 = -[SLGoogleOAuth2TokenResponse init](&v41, sel_init, v38, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v10;
      v15 = objc_msgSend(v14, "statusCode");
      v13->_statusCode = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v5, 7, CFSTR("SLGoogleOAuth2TokenResponse httpResponse status code %@"));

      if (!v13->_error)
      {
        v40 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v40, v39);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v40;
        v18 = v40;
        if (v18)
          objc_storeStrong((id *)&v13->_error, v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)&v13->_data, v16);
          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("access_token"));
          v19 = objc_claimAutoreleasedReturnValue();
          token = v13->_token;
          v13->_token = (NSString *)v19;

          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("refresh_token"));
          v21 = objc_claimAutoreleasedReturnValue();
          refreshToken = v13->_refreshToken;
          v13->_refreshToken = (NSString *)v21;

          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("id_token"));
          v23 = objc_claimAutoreleasedReturnValue();
          idToken = v13->_idToken;
          v13->_idToken = (NSString *)v23;

          v25 = (void *)MEMORY[0x1E0C99D68];
          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("expires_in"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v26, "integerValue"));
          v27 = objc_claimAutoreleasedReturnValue();
          expiryDate = v13->_expiryDate;
          v13->_expiryDate = (NSDate *)v27;

          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("scope"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "componentsSeparatedByString:", CFSTR(" "));
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          +[SLGoogleWebClient dataclassesForScopes:](SLGoogleWebClient, "dataclassesForScopes:", v30);
          v31 = objc_claimAutoreleasedReturnValue();
          grantedDataclasses = v13->_grantedDataclasses;
          v13->_grantedDataclasses = (NSArray *)v31;

          -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("error"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            -[NSDictionary objectForKeyedSubscript:](v13->_data, "objectForKeyedSubscript:", CFSTR("error"));
            v35 = objc_claimAutoreleasedReturnValue();
            errorMessage = v13->_errorMessage;
            v13->_errorMessage = (NSString *)v35;

          }
        }
        else
        {
          _SLLog(v5, 7, CFSTR("SLGoogleOAuth2TokenResponse response JSON data does not represent NSDictionary. Game over."));
        }

      }
    }
    else
    {
      _SLLog(v5, 7, CFSTR("SLGoogleOAuth2TokenResponse response is not NSHTTPURLResponse. Game over."));
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
