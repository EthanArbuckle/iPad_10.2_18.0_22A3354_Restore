@implementation AAUpgradeiOSTermsResponse

- (AAUpgradeiOSTermsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  AAUpgradeiOSTermsResponse *v8;
  NSData *v9;
  NSObject *p_super;
  uint64_t v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AAUpgradeiOSTermsResponse;
  v8 = -[AAResponse initWithHTTPResponse:data:bodyIsPlist:](&v13, sel_initWithHTTPResponse_data_bodyIsPlist_, v6, v7, 0);
  if (v8)
  {
    if (objc_msgSend(v7, "length"))
    {
      v9 = (NSData *)v7;
      p_super = &v8->_xmlUIData->super;
      v8->_xmlUIData = v9;
    }
    else
    {
      _AALogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(v6, "statusCode");
        *(_DWORD *)buf = 134217984;
        v15 = v11;
        _os_log_impl(&dword_19EACA000, p_super, OS_LOG_TYPE_DEFAULT, "Empty response for iOS Terms XMLUI, HTTP response: %ld", buf, 0xCu);
      }
    }

  }
  return v8;
}

- (BOOL)bodyIsPlist
{
  return 0;
}

- (NSData)xmlUIData
{
  return self->_xmlUIData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmlUIData, 0);
}

@end
