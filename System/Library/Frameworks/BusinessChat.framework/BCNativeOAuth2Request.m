@implementation BCNativeOAuth2Request

- (id)_initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BCNativeOAuth2Request *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("oauth2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("oauth2"));
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[BCNativeOAuth2URLProvider URLProviderWithDictionary:](BCNativeOAuth2URLProvider, "URLProviderWithDictionary:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v13.receiver = self;
        v13.super_class = (Class)BCNativeOAuth2Request;
        self = (BCNativeOAuth2Request *)-[BCOAuth2Request _initWithDictionary:URLProvider:](&v13, sel__initWithDictionary_URLProvider_, v4, v9);
        v10 = self;
      }
      else
      {
        LogCategory_Daemon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_21C655000, v11, OS_LOG_TYPE_ERROR, "Unable to create  BCOAuth2Parameters: missing 'oauth2' payload is invalid", buf, 2u);
        }

        v10 = 0;
      }

      goto LABEL_13;
    }
  }
  LogCategory_Daemon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21C655000, v8, OS_LOG_TYPE_ERROR, "Unable to create  BCOAuth2Parameters: missing 'oauth2' in payload", buf, 2u);
  }
  v10 = 0;
LABEL_13:

  return v10;
}

@end
