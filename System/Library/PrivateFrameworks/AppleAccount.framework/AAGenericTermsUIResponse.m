@implementation AAGenericTermsUIResponse

- (AAGenericTermsUIResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v7;
  AAGenericTermsUIResponse *v8;
  AAGenericTermsUIResponse *v9;
  uint64_t v10;
  NSDictionary *responseTermsDictionary;
  uint64_t v12;
  NSString *responseAgreeURL;
  NSObject *v14;
  NSDictionary *responseDictionary;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  objc_super v20;
  uint8_t buf[4];
  NSDictionary *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)AAGenericTermsUIResponse;
  v8 = -[AAResponse initWithHTTPResponse:data:bodyIsPlist:](&v20, sel_initWithHTTPResponse_data_bodyIsPlist_, a3, v7, 1);
  v9 = v8;
  if (v8 && -[NSHTTPURLResponse statusCode](v8->super._httpResponse, "statusCode") == 200)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v9->_responseData, a4);
      -[NSDictionary objectForKey:](v9->super._responseDictionary, "objectForKey:", CFSTR("terms"));
      v10 = objc_claimAutoreleasedReturnValue();
      responseTermsDictionary = v9->_responseTermsDictionary;
      v9->_responseTermsDictionary = (NSDictionary *)v10;

      -[NSDictionary objectForKey:](v9->super._responseDictionary, "objectForKey:", CFSTR("agreeUrl"));
      v12 = objc_claimAutoreleasedReturnValue();
      responseAgreeURL = v9->_responseAgreeURL;
      v9->_responseAgreeURL = (NSString *)v12;

      _AALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        responseDictionary = v9->super._responseDictionary;
        *(_DWORD *)buf = 138412290;
        v22 = responseDictionary;
        v16 = "AAGenericTermsUIResponse _responseDictionary %@";
        v17 = v14;
        v18 = 12;
LABEL_8:
        _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else
    {
      _AALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "ERROR: reponse data is nil";
        v17 = v14;
        v18 = 2;
        goto LABEL_8;
      }
    }

  }
  return v9;
}

- (NSDictionary)termsDictionary
{
  return self->_responseTermsDictionary;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (NSString)agreeURL
{
  return self->_responseAgreeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_responseAgreeURL, 0);
  objc_storeStrong((id *)&self->_responseTermsDictionary, 0);
}

@end
