@implementation EMHMERecipientCreationResponse

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EMHMERecipientCreationResponse_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_68 != -1)
    dispatch_once(&log_onceToken_68, block);
  return (id)log_log_67;
}

void __37__EMHMERecipientCreationResponse_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_67;
  log_log_67 = (uint64_t)v1;

}

- (EMHMERecipientCreationResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  EMHMERecipientCreationResponse *v8;
  EMHMERecipientCreationResponse *v9;
  uint64_t *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSString *replyToAddress;
  id v26;
  objc_super v27;
  uint8_t buf[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)EMHMERecipientCreationResponse;
  v8 = -[AAResponse initWithHTTPResponse:data:](&v27, sel_initWithHTTPResponse_data_, v6, v7);
  v9 = v8;
  if (v8)
  {
    v10 = (uint64_t *)((char *)v8 + (int)*MEMORY[0x1E0CFAD90]);
    if (objc_msgSend((id)*v10, "statusCode") == 200)
    {
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v26;
      if (v12)
      {
        +[EMHMERecipientCreationRequest log](EMHMERecipientCreationRequest, "log");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[EMHMERecipientCreationRequest _httpBody].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

        v20 = (int)*MEMORY[0x1E0CFAD88];
        v21 = v12;
        v22 = *(NSObject **)((char *)&v9->super.super.isa + v20);
        *(Class *)((char *)&v9->super.super.isa + v20) = (Class)v21;
      }
      else
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("replyToAddress"));
        v23 = objc_claimAutoreleasedReturnValue();
        replyToAddress = v9->_replyToAddress;
        v9->_replyToAddress = (NSString *)v23;

        +[EMHMERecipientCreationRequest log](EMHMERecipientCreationRequest, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[EMHMERecipientCreationResponse initWithHTTPResponse:data:].cold.1((uint64_t *)&v9->_replyToAddress, (uint64_t)v11, v22);
      }

    }
    else
    {
      +[EMHMERecipientCreationResponse log](EMHMERecipientCreationResponse, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[EMHMERecipientCreationResponse initWithHTTPResponse:data:].cold.3(v10, buf, objc_msgSend((id)*v10, "statusCode"), v12);
    }

  }
  return v9;
}

- (NSString)replyToAddress
{
  return self->_replyToAddress;
}

- (void)setReplyToAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyToAddress, 0);
}

- (void)initWithHTTPResponse:(os_log_t)log data:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1B99BB000, log, OS_LOG_TYPE_DEBUG, "Received _replyToAddress:%@ from jsonData: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithHTTPResponse:(uint64_t)a3 data:(os_log_t)log .cold.3(uint64_t *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4;

  v4 = *a1;
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = v4;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "EMHMERecipientCreationResponse has non-200 status code: %zd for response: %@", buf, 0x16u);
}

@end
