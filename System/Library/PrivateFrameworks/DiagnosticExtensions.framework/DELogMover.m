@implementation DELogMover

- (DELogMover)initWithServiceName:(id)a3
{
  id v4;
  DELogMover *v5;
  uint64_t v6;
  NSString *serviceName;
  OS_xpc_object *conn;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DELogMover;
  v5 = -[DELogMover init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    conn = v5->_conn;
    v5->_conn = 0;

  }
  return v5;
}

- (BOOL)sendRequestReturningBooleanResponse:(id)a3 withSuccessKey:(char *)a4
{
  id v6;
  OS_xpc_object *conn;
  xpc_object_t v8;
  uint64_t v9;
  BOOL value;
  OS_xpc_object *mach_service;
  OS_xpc_object *v12;
  void *v13;
  OS_xpc_object *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  OS_xpc_object *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v22;
  _QWORD handler[4];
  id v24;

  v6 = a3;
  conn = self->_conn;
  if (!conn)
  {
    mach_service = xpc_connection_create_mach_service(-[NSString UTF8String](self->_serviceName, "UTF8String"), 0, 0);
    v12 = self->_conn;
    self->_conn = mach_service;

    if (!self->_conn)
    {
      +[DELogging fwHandle](DELogging, "fwHandle");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[DELogMover sendRequestReturningBooleanResponse:withSuccessKey:].cold.1((uint64_t *)&self->_serviceName, v19, v20);
      value = 0;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", self->_serviceName);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_conn;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __65__DELogMover_sendRequestReturningBooleanResponse_withSuccessKey___block_invoke;
    handler[3] = &unk_1E4E35730;
    v24 = v13;
    v15 = v13;
    xpc_connection_set_event_handler(v14, handler);
    xpc_connection_resume(self->_conn);

    conn = self->_conn;
    if (!conn)
    {
      value = 0;
      goto LABEL_20;
    }
  }
  v8 = xpc_connection_send_message_with_reply_sync(conn, v6);
  v9 = MEMORY[0x1A85AB958]();
  if (v9 == MEMORY[0x1E0C81310])
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[DELogMover sendRequestReturningBooleanResponse:withSuccessKey:].cold.2(v8, v16);
  }
  else
  {
    if (v9 != MEMORY[0x1E0C812F8])
    {
      value = 0;
      goto LABEL_14;
    }
    xpc_dictionary_get_value(v8, a4);
    v17 = objc_claimAutoreleasedReturnValue();
    v16 = v17;
    if (v17)
    {
      value = xpc_BOOL_get_value(v17);
      goto LABEL_13;
    }
    +[DELogging fwHandle](DELogging, "fwHandle");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[DELogMover sendRequestReturningBooleanResponse:withSuccessKey:].cold.3(v22);

  }
  value = 0;
LABEL_13:

LABEL_14:
  v18 = self->_conn;
  if (v18)
  {
    xpc_connection_cancel(v18);
    v19 = self->_conn;
    self->_conn = 0;
LABEL_19:

  }
LABEL_20:

  return value;
}

void __65__DELogMover_sendRequestReturningBooleanResponse_withSuccessKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v6;

  v3 = a2;
  if (MEMORY[0x1A85AB958]() == MEMORY[0x1E0C81310] && v3 != (id)MEMORY[0x1E0C81260] && v3 != (id)MEMORY[0x1E0C81258])
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __65__DELogMover_sendRequestReturningBooleanResponse_withSuccessKey___block_invoke_cold_1(a1, v3, v6);

  }
}

+ (void)moveSystemLogsWithExtensions:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;

  v3 = a3;
  if (v3)
    v4 = v3;
  else
    v4 = &unk_1E4E39978;
  v7 = v3;
  v5 = dispatch_queue_create("com.apple.DiagnosticExtensions.log_mover", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__DELogMover_moveSystemLogsWithExtensions___block_invoke;
  block[3] = &unk_1E4E353D0;
  v9 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __43__DELogMover_moveSystemLogsWithExtensions___block_invoke(uint64_t a1)
{
  DELogMover *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = -[DELogMover initWithServiceName:]([DELogMover alloc], "initWithServiceName:", CFSTR("com.apple.crash_mover"));
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("Extensions");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (!-[DELogMover sendRequestReturningBooleanResponse:withSuccessKey:](v2, "sendRequestReturningBooleanResponse:withSuccessKey:", v4, "Success"))
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __43__DELogMover_moveSystemLogsWithExtensions___block_invoke_cold_1(v5);

  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)sendRequestReturningBooleanResponse:(uint64_t)a3 withSuccessKey:.cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, a3, "Failed to create client connection to service '%@'", (uint8_t *)&v4);
}

- (void)sendRequestReturningBooleanResponse:(void *)a1 withSuccessKey:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  const char *string;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E0C81270]);
  v5 = 136315138;
  v6 = string;
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v4, "Error in response from XPC: %s", (uint8_t *)&v5);
  OUTLINED_FUNCTION_0();
}

- (void)sendRequestReturningBooleanResponse:(os_log_t)log withSuccessKey:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4EEE000, log, OS_LOG_TYPE_ERROR, "Missing status in server response, assuming request failed", v1, 2u);
}

void __65__DELogMover_sendRequestReturningBooleanResponse_withSuccessKey___block_invoke_cold_1(uint64_t a1, xpc_object_t xdict, NSObject *a3)
{
  uint64_t v4;
  const char *string;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
  v6 = 138412546;
  v7 = v4;
  v8 = 2080;
  v9 = string;
  _os_log_error_impl(&dword_1A4EEE000, a3, OS_LOG_TYPE_ERROR, "Got unexpected XPC error on connection to service '%@': %s.", (uint8_t *)&v6, 0x16u);
  OUTLINED_FUNCTION_0();
}

void __43__DELogMover_moveSystemLogsWithExtensions___block_invoke_cold_1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_1A4EEE000, log, OS_LOG_TYPE_ERROR, "Moving logs failed %d", (uint8_t *)v1, 8u);
}

@end
