@implementation AuthTokenResponse

- (AuthTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  AuthTokenResponse *v11;
  AuthTokenResponse *v12;
  NSError **p_error;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSString *token;
  uint64_t v21;
  NSString *refreshToken;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDate *expiryDate;
  void *v27;
  uint64_t v28;
  id v30;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)AuthTokenResponse;
  v11 = -[AuthTokenResponse init](&v31, "init");
  v12 = v11;
  if (v11)
  {
    p_error = &v11->_error;
    objc_storeStrong((id *)&v11->_error, a5);
    v14 = objc_opt_class(NSHTTPURLResponse);
    if ((objc_opt_isKindOfClass(v9, v14) & 1) != 0)
      v12->_statusCode = (int64_t)objc_msgSend(v9, "statusCode");
    if (v8 && !*p_error)
    {
      v30 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v8, 0, &v30));
      v16 = v30;
      v17 = v30;
      if (v17)
        objc_storeStrong((id *)&v12->_error, v16);
      if (v15)
      {
        v18 = objc_opt_class(NSDictionary);
        if ((objc_opt_isKindOfClass(v15, v18) & 1) != 0)
        {
          objc_storeStrong((id *)&v12->_data, v15);
          v19 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("access_token")));
          token = v12->_token;
          v12->_token = (NSString *)v19;

          v21 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("refresh_token")));
          refreshToken = v12->_refreshToken;
          v12->_refreshToken = (NSString *)v21;

          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("expires_in")));
          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("expires_in")));
            v25 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)objc_msgSend(v24, "integerValue")));
            expiryDate = v12->_expiryDate;
            v12->_expiryDate = (NSDate *)v25;

          }
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("error")));
          v28 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
            objc_storeStrong((id *)&v12->_errorDescription, v27);

        }
      }

    }
  }

  return v12;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSDictionary)data
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)refreshToken
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)expiryDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)errorDescription
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
