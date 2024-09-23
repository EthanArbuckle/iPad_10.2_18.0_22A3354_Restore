@implementation DAEASOpenIDMetadataResponse

- (DAEASOpenIDMetadataResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  DAEASOpenIDMetadataResponse *v11;
  DAEASOpenIDMetadataResponse *v12;
  NSError **p_error;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  os_log_type_t v17;
  int64_t statusCode;
  void *v19;
  NSError *v20;
  NSError *v21;
  NSObject *v22;
  NSObject *v23;
  os_log_type_t v24;
  os_log_type_t v25;
  void *v26;
  char isKindOfClass;
  uint64_t v28;
  NSString *errorMessage;
  os_log_type_t v30;
  NSString *v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint32_t v35;
  uint64_t v36;
  NSString *tokenRequestURI;
  uint64_t v38;
  NSString *authorizationURI;
  uint64_t v40;
  NSString *jwksURI;
  uint64_t v42;
  NSString *issuer;
  NSString *v44;
  NSString *v45;
  NSString *v46;
  NSString *v47;
  os_log_type_t v48;
  id v50;
  objc_super v51;
  uint8_t buf[4];
  NSObject *v53;
  __int16 v54;
  NSString *v55;
  __int16 v56;
  NSString *v57;
  __int16 v58;
  NSString *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v51.receiver = self;
  v51.super_class = (Class)DAEASOpenIDMetadataResponse;
  v11 = -[DAEASOpenIDMetadataResponse init](&v51, sel_init);
  v12 = v11;
  if (v11)
  {
    p_error = &v11->_error;
    objc_storeStrong((id *)&v11->_error, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      DALoggingwithCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      v25 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v14, v25))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21EC86000, v14, v25, "DAEASOpenIDMetadataResponse response is not NSHTTPURLResponse. Game over.", buf, 2u);
      }
      goto LABEL_22;
    }
    v14 = v9;
    v12->_statusCode = -[NSObject statusCode](v14, "statusCode");
    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BE2AD38];
    v17 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
    if (os_log_type_enabled(v15, v17))
    {
      statusCode = v12->_statusCode;
      *(_DWORD *)buf = 134217984;
      v53 = statusCode;
      _os_log_impl(&dword_21EC86000, v15, v17, "DAEASOpenIDMetadataResponse httpResponse status code %ld", buf, 0xCu);
    }

    if (*p_error)
    {
LABEL_22:

      goto LABEL_23;
    }
    v50 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v50);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (NSError *)v50;
    if (v20)
    {
      v21 = *p_error;
      *p_error = v20;
      v22 = v20;

      DALoggingwithCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_BYTE *)(v16 + 3);
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v22;
        _os_log_impl(&dword_21EC86000, v23, v24, "DAEASOAuthTokenResponse response JSON data does not represent NSDictionary. Game over. %@", buf, 0xCu);
      }

      goto LABEL_21;
    }
    objc_storeStrong((id *)&v12->_data, v19);
    -[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("error"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("error_code"));
      v28 = objc_claimAutoreleasedReturnValue();
      errorMessage = v12->_errorMessage;
      v12->_errorMessage = (NSString *)v28;

      DALoggingwithCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      v30 = *(_BYTE *)(v16 + 3);
      if (os_log_type_enabled(v22, v30))
      {
        v31 = v12->_errorMessage;
        *(_DWORD *)buf = 138412546;
        v53 = v31;
        v54 = 2112;
        v55 = (NSString *)v19;
        v32 = "DAEASOpenIDMetadataResponse received an error: %@ %@";
        v33 = v22;
        v34 = v30;
        v35 = 22;
LABEL_20:
        _os_log_impl(&dword_21EC86000, v33, v34, v32, buf, v35);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("token_endpoint"));
        v36 = objc_claimAutoreleasedReturnValue();
        tokenRequestURI = v12->_tokenRequestURI;
        v12->_tokenRequestURI = (NSString *)v36;

        -[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("authorization_endpoint"));
        v38 = objc_claimAutoreleasedReturnValue();
        authorizationURI = v12->_authorizationURI;
        v12->_authorizationURI = (NSString *)v38;

        -[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("jwks_uri"));
        v40 = objc_claimAutoreleasedReturnValue();
        jwksURI = v12->_jwksURI;
        v12->_jwksURI = (NSString *)v40;

        -[NSDictionary objectForKeyedSubscript:](v12->_data, "objectForKeyedSubscript:", CFSTR("issuer"));
        v42 = objc_claimAutoreleasedReturnValue();
        issuer = v12->_issuer;
        v12->_issuer = (NSString *)v42;

        DALoggingwithCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, v17))
        {
          v44 = v12->_tokenRequestURI;
          v45 = v12->_authorizationURI;
          v46 = v12->_jwksURI;
          v47 = v12->_issuer;
          *(_DWORD *)buf = 138413058;
          v53 = v44;
          v54 = 2112;
          v55 = v45;
          v56 = 2112;
          v57 = v46;
          v58 = 2112;
          v59 = v47;
          v32 = "DAEASOpenIDMetadataResponse response token_endpoint: %@, authorization_endpoint: %@, jwks_uri: %@, issuer: %@";
          v33 = v22;
          v34 = v17;
          v35 = 42;
          goto LABEL_20;
        }
      }
      else
      {
        DALoggingwithCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        v48 = *(_BYTE *)(v16 + 3);
        if (os_log_type_enabled(v22, v48))
        {
          *(_WORD *)buf = 0;
          v32 = "DAEASOpenIDMetadataResponse response JSON data does not represent NSDictionary.";
          v33 = v22;
          v34 = v48;
          v35 = 2;
          goto LABEL_20;
        }
      }
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_23:

  return v12;
}

- (NSString)tokenRequestURI
{
  return self->_tokenRequestURI;
}

- (NSString)authorizationURI
{
  return self->_authorizationURI;
}

- (NSString)jwksURI
{
  return self->_jwksURI;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSDictionary)data
{
  return self->_data;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_jwksURI, 0);
  objc_storeStrong((id *)&self->_authorizationURI, 0);
  objc_storeStrong((id *)&self->_tokenRequestURI, 0);
}

@end
