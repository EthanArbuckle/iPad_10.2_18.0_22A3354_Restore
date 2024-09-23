@implementation AAAccountManagementUIResponse

- (AAAccountManagementUIResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6;
  AAAccountManagementUIResponse *v7;
  AAAccountManagementUIResponse *v8;
  NSData *v9;
  NSObject *p_super;
  uint8_t v12[16];
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AAAccountManagementUIResponse;
  v7 = -[AAResponse initWithHTTPResponse:data:bodyIsPlist:](&v13, sel_initWithHTTPResponse_data_bodyIsPlist_, a3, v6, 1);
  v8 = v7;
  if (v7 && -[NSHTTPURLResponse statusCode](v7->super._httpResponse, "statusCode") == 200)
  {
    if (v6)
    {
      v9 = (NSData *)v6;
      p_super = &v8->_responseData->super;
      v8->_responseData = v9;
    }
    else
    {
      _AALogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_19EACA000, p_super, OS_LOG_TYPE_DEFAULT, "ERROR: reponse data is nil", v12, 2u);
      }
    }

  }
  return v8;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
}

@end
