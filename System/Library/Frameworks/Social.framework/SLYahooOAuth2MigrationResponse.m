@implementation SLYahooOAuth2MigrationResponse

- (SLYahooOAuth2MigrationResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;
  SLYahooOAuth2MigrationResponse *v12;
  SLYahooOAuth2MigrationResponse *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  NSString *accessToken;
  uint64_t v21;
  NSString *refreshToken;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDate *expiryDate;
  void *v28;
  void *v29;
  id v30;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v5, 7, CFSTR("SLYahooOAuth2MigrationResponse initWithData: %@ length urlResponse: %@ error: %@"));

  v31.receiver = self;
  v31.super_class = (Class)SLYahooOAuth2MigrationResponse;
  v12 = -[SLYahooOAuth2MigrationResponse init](&v31, sel_init, v28, v10, v11);
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
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v5, 7, CFSTR("SLYahooOAuth2MigrationResponse httpResponse status code %@"));

      if (!v13->_error)
      {
        v30 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v30, v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v30;
        v18 = v30;
        if (v18)
          objc_storeStrong((id *)&v13->_error, v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)&v13->_responseBody, v16);
          -[NSDictionary objectForKeyedSubscript:](v13->_responseBody, "objectForKeyedSubscript:", CFSTR("access_token"));
          v19 = objc_claimAutoreleasedReturnValue();
          accessToken = v13->_accessToken;
          v13->_accessToken = (NSString *)v19;

          -[NSDictionary objectForKeyedSubscript:](v13->_responseBody, "objectForKeyedSubscript:", CFSTR("refresh_token"));
          v21 = objc_claimAutoreleasedReturnValue();
          refreshToken = v13->_refreshToken;
          v13->_refreshToken = (NSString *)v21;

          v23 = (void *)MEMORY[0x1E0C99D68];
          -[NSDictionary objectForKeyedSubscript:](v13->_responseBody, "objectForKeyedSubscript:", CFSTR("expires_in"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v24, "integerValue"));
          v25 = objc_claimAutoreleasedReturnValue();
          expiryDate = v13->_expiryDate;
          v13->_expiryDate = (NSDate *)v25;

        }
        else
        {
          _SLLog(v5, 7, CFSTR("SLYahooOAuth2MigrationResponse response JSON data does not represent NSDictionary. Game over."));
        }

      }
    }
    else
    {
      _SLLog(v5, 7, CFSTR("SLYahooOAuth2MigrationResponse response is not NSHTTPURLResponse. Game over."));
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

- (NSDictionary)responseBody
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)accessToken
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)refreshToken
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)expiryDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
