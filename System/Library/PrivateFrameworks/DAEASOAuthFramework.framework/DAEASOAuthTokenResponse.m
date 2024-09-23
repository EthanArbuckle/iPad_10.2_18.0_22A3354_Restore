@implementation DAEASOAuthTokenResponse

- (DAEASOAuthTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  os_log_type_t v13;
  DAEASOAuthTokenResponse *v14;
  DAEASOAuthTokenResponse *v15;
  NSError **p_error;
  NSObject *v17;
  NSObject *v18;
  int64_t statusCode;
  void *v20;
  NSError *v21;
  NSError *v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  os_log_type_t v26;
  void *v28;
  char isKindOfClass;
  uint64_t v30;
  NSString *errorMessage;
  os_log_type_t v32;
  NSString *v33;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint32_t v37;
  uint64_t v38;
  NSString *idToken;
  uint64_t v40;
  NSString *user_id;
  uint64_t v42;
  NSString *accessToken;
  uint64_t v44;
  NSString *refreshToken;
  void *v46;
  void *v47;
  uint64_t v48;
  NSDate *expiryDate;
  os_log_type_t v50;
  id v51;
  objc_super v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  DALoggingwithCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BE2AD38];
  v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
  if (os_log_type_enabled(v11, v13))
  {
    *(_DWORD *)buf = 134218498;
    v54 = objc_msgSend(v8, "length");
    v55 = 2112;
    v56 = v9;
    v57 = 2112;
    v58 = v10;
    _os_log_impl(&dword_21EC86000, v11, v13, "DAEASOAuthOAuth2TokenResponse initWithData: %lu length urlResponse: %@ error: %@", buf, 0x20u);
  }

  v52.receiver = self;
  v52.super_class = (Class)DAEASOAuthTokenResponse;
  v14 = -[DAEASOAuthTokenResponse init](&v52, sel_init);
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
      v26 = *(_BYTE *)(v12 + 3);
      if (os_log_type_enabled(v17, v26))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21EC86000, v17, v26, "DAEASOAuthOAuth2TokenResponse response is not NSHTTPURLResponse. Game over.", buf, 2u);
      }
      goto LABEL_15;
    }
    v17 = v9;
    v15->_statusCode = -[NSObject statusCode](v17, "statusCode");
    DALoggingwithCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, v13))
    {
      statusCode = v15->_statusCode;
      *(_DWORD *)buf = 134217984;
      v54 = statusCode;
      _os_log_impl(&dword_21EC86000, v18, v13, "DAEASOAuthOAuth2TokenResponse httpResponse status code %ld", buf, 0xCu);
    }

    if (*p_error)
    {
LABEL_15:

      goto LABEL_16;
    }
    v51 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v51);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (NSError *)v51;
    if (v21)
    {
      v22 = *p_error;
      *p_error = v21;
      v23 = v21;

      DALoggingwithCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_BYTE *)(v12 + 3);
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 138412290;
        v54 = (uint64_t)v23;
        _os_log_impl(&dword_21EC86000, v24, v25, "DAEASOAuthTokenResponse response JSON data does not represent NSDictionary. Game over. %@", buf, 0xCu);
      }

      goto LABEL_12;
    }
    objc_storeStrong((id *)&v15->_data, v20);
    -[NSDictionary objectForKeyedSubscript:](v15->_data, "objectForKeyedSubscript:", CFSTR("error"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](v15->_data, "objectForKeyedSubscript:", CFSTR("error_description"));
      v30 = objc_claimAutoreleasedReturnValue();
      errorMessage = v15->_errorMessage;
      v15->_errorMessage = (NSString *)v30;

      DALoggingwithCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      v32 = *(_BYTE *)(v12 + 3);
      if (os_log_type_enabled(v23, v32))
      {
        v33 = v15->_errorMessage;
        *(_DWORD *)buf = 138543618;
        v54 = (uint64_t)v33;
        v55 = 2112;
        v56 = v20;
        v34 = "DAEASOAuthTokenResponse received an error: %{public}@ %@";
        v35 = v23;
        v36 = v32;
        v37 = 22;
LABEL_25:
        _os_log_impl(&dword_21EC86000, v35, v36, v34, buf, v37);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSDictionary objectForKeyedSubscript:](v15->_data, "objectForKeyedSubscript:", CFSTR("id_token"));
        v23 = objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](v15->_data, "objectForKeyedSubscript:", CFSTR("id_token"));
        v38 = objc_claimAutoreleasedReturnValue();
        idToken = v15->_idToken;
        v15->_idToken = (NSString *)v38;

        if (v23)
        {
          -[DAEASOAuthTokenResponse usernameFromJWTToken:](v15, "usernameFromJWTToken:", v23);
          v40 = objc_claimAutoreleasedReturnValue();
          user_id = v15->_user_id;
          v15->_user_id = (NSString *)v40;

          -[NSDictionary objectForKeyedSubscript:](v15->_data, "objectForKeyedSubscript:", CFSTR("access_token"));
          v42 = objc_claimAutoreleasedReturnValue();
          accessToken = v15->_accessToken;
          v15->_accessToken = (NSString *)v42;

          -[NSDictionary objectForKeyedSubscript:](v15->_data, "objectForKeyedSubscript:", CFSTR("refresh_token"));
          v44 = objc_claimAutoreleasedReturnValue();
          refreshToken = v15->_refreshToken;
          v15->_refreshToken = (NSString *)v44;

          v46 = (void *)MEMORY[0x24BDBCE60];
          -[NSDictionary objectForKeyedSubscript:](v15->_data, "objectForKeyedSubscript:", CFSTR("expires_in"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v47, "integerValue"));
          v48 = objc_claimAutoreleasedReturnValue();
          expiryDate = v15->_expiryDate;
          v15->_expiryDate = (NSDate *)v48;

        }
        goto LABEL_12;
      }
      DALoggingwithCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      v50 = *(_BYTE *)(v12 + 3);
      if (os_log_type_enabled(v23, v50))
      {
        *(_WORD *)buf = 0;
        v34 = "DAEASOAuthOAuth2TokenResponse response JSON data does not represent NSDictionary.";
        v35 = v23;
        v36 = v50;
        v37 = 2;
        goto LABEL_25;
      }
    }
LABEL_12:

    goto LABEL_15;
  }
LABEL_16:

  return v15;
}

- (id)usernameFromJWTToken:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  os_log_type_t v15;
  uint64_t v17;
  uint8_t buf[16];

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "length") & 3) != 0)
  {
    objc_msgSend(&stru_24E370C58, "stringByPaddingToLength:withString:startingAtIndex:", (int)(4 * vcvtpd_s64_f64((double)(unint64_t)objc_msgSend(v4, "length") * 0.25))- objc_msgSend(v4, "length"), CFSTR("="), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("+"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v8, 0);
  if (v9)
  {
    v17 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v9, 0, &v17);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("preferred_username"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 && objc_msgSend(v11, "mf_isLegalEmailAddress"))
    {
      v13 = v12;
    }
    else
    {
      -[NSObject objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("email"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

  }
  else
  {
    DALoggingwithCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v15 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v10, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EC86000, v10, v15, "Can Not Retrieve E-mail address from DAEASOAuthTokenResponse response.", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSDictionary)data
{
  return self->_data;
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

- (NSError)error
{
  return self->_error;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSString)user_id
{
  return self->_user_id;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user_id, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_idToken, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
