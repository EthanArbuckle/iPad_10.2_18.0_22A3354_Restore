@implementation AASigningSessionResponse

- (AASigningSessionResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AASigningSessionResponse *v5;
  AASigningSessionResponse *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *p_super;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AASigningSessionResponse;
  v5 = -[AAResponse initWithHTTPResponse:data:bodyIsPlist:](&v17, sel_initWithHTTPResponse_data_bodyIsPlist_, a3, a4, 0);
  v6 = v5;
  if (v5)
  {
    if (a4)
    {
      -[NSDictionary objectForKey:](v5->super._responseDictionary, "objectForKey:", CFSTR("session-info"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
        p_super = &v6->_sessionData->super;
        v6->_sessionData = (NSData *)v8;
      }
      else
      {
        _AALogSystem();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[AASigningSessionResponse initWithHTTPResponse:data:].cold.2((uint64_t)&v6->super._responseDictionary, p_super, v10, v11, v12, v13, v14, v15);
      }

    }
    else
    {
      _AALogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[AASigningSessionResponse initWithHTTPResponse:data:].cold.1(v7);
    }

  }
  return v6;
}

- (NSData)sessionData
{
  return self->_sessionData;
}

- (void)setSessionData:(id)a3
{
  objc_storeStrong((id *)&self->_sessionData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionData, 0);
}

- (void)initWithHTTPResponse:(os_log_t)log data:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19EACA000, log, OS_LOG_TYPE_ERROR, "Error: No data for AASigningSessionResponse!", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithHTTPResponse:(uint64_t)a3 data:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19EACA000, a2, a3, "Error: session-info not present in response: %@", a5, a6, a7, a8, 2u);
}

@end
