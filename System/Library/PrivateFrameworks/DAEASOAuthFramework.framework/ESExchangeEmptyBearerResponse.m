@implementation ESExchangeEmptyBearerResponse

- (ESExchangeEmptyBearerResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  ESExchangeEmptyBearerResponse *v9;
  ESExchangeEmptyBearerResponse *v10;
  NSError **p_error;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  int64_t statusCode;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *authURI;
  os_log_type_t v28;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  uint8_t v38[128];
  uint8_t buf[4];
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v37.receiver = self;
  v37.super_class = (Class)ESExchangeEmptyBearerResponse;
  v9 = -[ESExchangeEmptyBearerResponse init](&v37, sel_init);
  v10 = v9;
  if (v9)
  {
    p_error = &v9->_error;
    objc_storeStrong((id *)&v9->_error, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v7;
      v10->_statusCode = -[NSObject statusCode](v12, "statusCode");
      DALoggingwithCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 6);
      if (os_log_type_enabled(v13, v14))
      {
        statusCode = v10->_statusCode;
        *(_DWORD *)buf = 134217984;
        v40 = statusCode;
        _os_log_impl(&dword_21EC86000, v13, v14, "ESExchangeEmptyBearerResponse httpResponse status code %ld", buf, 0xCu);
      }

      if (!*p_error)
      {
        v31 = v8;
        v32 = v7;
        -[NSObject valueForHTTPHeaderField:](v12, "valueForHTTPHeaderField:", CFSTR("Www-Authenticate"));
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsSeparatedByString:", CFSTR(","));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v34 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v23, "hasPrefix:", CFSTR("authorization_uri")))
              {
                objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("="));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), &stru_24E370C58);
                v26 = objc_claimAutoreleasedReturnValue();
                authURI = v10->_authURI;
                v10->_authURI = (NSString *)v26;

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          }
          while (v18);
        }

        v8 = v31;
        v7 = v32;
      }
    }
    else
    {
      DALoggingwithCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      v28 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v12, v28))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21EC86000, v12, v28, "ESExchangeEmptyBearerResponse response is not an NSHTTPURLResponse.", buf, 2u);
      }
    }

  }
  return v10;
}

- (NSString)authURI
{
  return self->_authURI;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_authURI, 0);
}

@end
