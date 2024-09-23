@implementation DAEASOAuthTokenRefreshResponse

- (DAEASOAuthTokenRefreshResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  os_log_type_t v13;
  DAEASOAuthTokenRefreshResponse *v14;
  DAEASOAuthTokenRefreshResponse *v15;
  NSError **p_error;
  NSObject *v17;
  NSObject *v18;
  int64_t statusCode;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char isKindOfClass;
  uint64_t v25;
  NSString *errorName;
  uint64_t v27;
  NSString *errorMessage;
  NSObject *v29;
  os_log_type_t v30;
  NSString *v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint32_t v35;
  os_log_type_t v36;
  uint64_t v37;
  NSString *accessToken;
  uint64_t v39;
  NSString *refreshToken;
  uint64_t v41;
  NSString *idToken;
  void *v43;
  uint64_t v44;
  NSDate *expiryDate;
  os_log_type_t v46;
  id v48;
  objc_super v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BE2AD38];
  v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v11, v13))
  {
    *(_DWORD *)buf = 134218242;
    v51 = objc_msgSend(v8, "length");
    v52 = 2112;
    v53 = v10;
    _os_log_impl(&dword_21EC86000, v11, v13, "DAEASOAuthTokenRefreshResponse initWithData: (length: %lu, responseError: %@)", buf, 0x16u);
  }

  v49.receiver = self;
  v49.super_class = (Class)DAEASOAuthTokenRefreshResponse;
  v14 = -[DAEASOAuthTokenRefreshResponse init](&v49, sel_init);
  v15 = v14;
  if (v14)
  {
    p_error = &v14->_error;
    objc_storeStrong((id *)&v14->_error, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      DALoggingwithCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      v36 = *(_BYTE *)(v12 + 3);
      if (os_log_type_enabled(v17, v36))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21EC86000, v17, v36, "DAEASOAuthTokenRefreshResponse response is not NSHTTPURLResponse. Game over.", buf, 2u);
      }
      goto LABEL_21;
    }
    v17 = v9;
    v15->_statusCode = -[NSObject statusCode](v17, "statusCode");
    DALoggingwithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, v13))
    {
      statusCode = v15->_statusCode;
      *(_DWORD *)buf = 134217984;
      v51 = statusCode;
      _os_log_impl(&dword_21EC86000, v18, v13, "DAEASOAuthTokenRefreshResponse httpResponse status code %ld", buf, 0xCu);
    }

    if (*p_error)
    {
LABEL_21:

      goto LABEL_22;
    }
    v48 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v48;
    v22 = v48;
    if (v22)
      objc_storeStrong((id *)&v15->_error, v21);
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("error"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("error"));
      v25 = objc_claimAutoreleasedReturnValue();
      errorName = v15->_errorName;
      v15->_errorName = (NSString *)v25;

      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("error_description"));
      v27 = objc_claimAutoreleasedReturnValue();
      errorMessage = v15->_errorMessage;
      v15->_errorMessage = (NSString *)v27;

      DALoggingwithCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_BYTE *)(v12 + 3);
      if (os_log_type_enabled(v29, v30))
      {
        v31 = v15->_errorMessage;
        *(_DWORD *)buf = 138543618;
        v51 = (uint64_t)v31;
        v52 = 2112;
        v53 = v20;
        v32 = "DAEASOAuthTokenRefreshResponse received an error: %{public}@ %@";
        v33 = v29;
        v34 = v30;
        v35 = 22;
LABEL_19:
        _os_log_impl(&dword_21EC86000, v33, v34, v32, buf, v35);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&v15->_responseBody, v20);
        -[NSDictionary objectForKeyedSubscript:](v15->_responseBody, "objectForKeyedSubscript:", CFSTR("access_token"));
        v37 = objc_claimAutoreleasedReturnValue();
        accessToken = v15->_accessToken;
        v15->_accessToken = (NSString *)v37;

        -[NSDictionary objectForKeyedSubscript:](v15->_responseBody, "objectForKeyedSubscript:", CFSTR("refresh_token"));
        v39 = objc_claimAutoreleasedReturnValue();
        refreshToken = v15->_refreshToken;
        v15->_refreshToken = (NSString *)v39;

        -[NSDictionary objectForKeyedSubscript:](v15->_responseBody, "objectForKeyedSubscript:", CFSTR("id_token"));
        v41 = objc_claimAutoreleasedReturnValue();
        idToken = v15->_idToken;
        v15->_idToken = (NSString *)v41;

        v43 = (void *)MEMORY[0x24BDBCE60];
        -[NSDictionary objectForKeyedSubscript:](v15->_responseBody, "objectForKeyedSubscript:", CFSTR("expires_in"));
        v29 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "dateWithTimeIntervalSinceNow:", (double)-[NSObject integerValue](v29, "integerValue"));
        v44 = objc_claimAutoreleasedReturnValue();
        expiryDate = v15->_expiryDate;
        v15->_expiryDate = (NSDate *)v44;

      }
      else
      {
        DALoggingwithCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        v46 = *(_BYTE *)(v12 + 3);
        if (os_log_type_enabled(v29, v46))
        {
          *(_WORD *)buf = 0;
          v32 = "DAEASOAuthTokenRefreshResponse response JSON data does not represent NSDictionary. Game over.";
          v33 = v29;
          v34 = v46;
          v35 = 2;
          goto LABEL_19;
        }
      }
    }

    goto LABEL_21;
  }
LABEL_22:

  return v15;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)errorName
{
  return self->_errorName;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSDictionary)responseBody
{
  return self->_responseBody;
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSString)idToken
{
  return self->_idToken;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_idToken, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorName, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
