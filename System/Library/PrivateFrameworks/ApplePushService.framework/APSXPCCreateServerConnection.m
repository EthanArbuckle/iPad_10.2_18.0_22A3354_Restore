@implementation APSXPCCreateServerConnection

void __APSXPCCreateServerConnection_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(void);
  void (**v12)(void);
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(void);
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  _xpc_connection_s *v29;
  id v30;
  id v31;
  id v32;
  _xpc_connection_s *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  NSObject *v43;
  _QWORD handler[4];
  id v45;
  _xpc_connection_s *v46;
  id v47;

  v3 = a2;
  v4 = MEMORY[0x1A1AC945C]();
  if (v4 == MEMORY[0x1E0C81310])
  {
    v6 = *(void **)(a1 + 48);
    v7 = *(void **)(a1 + 56);
    v8 = *(void **)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    v10 = v3;
    v11 = v6;
    v12 = v7;
    v13 = v8;
    if (v10 == (id)MEMORY[0x1E0C81260])
    {
      +[APSLog xpc](APSLog, "xpc");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        __APSXPCCreateServerConnection_block_invoke_cold_1(v34, v35, v36, v37, v38, v39, v40, v41);

      v22 = v11;
      if (!v11)
        goto LABEL_12;
    }
    else
    {
      if (v10 != (id)MEMORY[0x1E0C81288])
      {
        v42 = MEMORY[0x1A1AC945C](v10);
        +[APSLog xpc](APSLog, "xpc");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          __APSXPCCreateServerConnection_block_invoke_cold_3(v42, v43);

        exit(0);
      }
      +[APSLog xpc](APSLog, "xpc");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __APSXPCCreateServerConnection_block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);

      v22 = v12;
      if (!v12)
        goto LABEL_12;
    }
    v22[2]();
LABEL_12:

    goto LABEL_16;
  }
  if (v4 == MEMORY[0x1E0C812E0])
  {
    v23 = *(void **)(a1 + 64);
    v24 = *(void **)(a1 + 40);
    v25 = *(id *)(a1 + 32);
    v26 = v3;
    v27 = v23;
    v28 = v24;
    v29 = (_xpc_connection_s *)v26;
    if (!v28)
    {
      v28 = MEMORY[0x1E0C80D38];
      v30 = MEMORY[0x1E0C80D38];
    }
    xpc_connection_set_target_queue(v29, v28);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = ___APSXPCHandleMessageConnection_block_invoke;
    handler[3] = &unk_1E3C8C380;
    v46 = v29;
    v47 = v27;
    v45 = v25;
    v31 = v27;
    v32 = v25;
    v33 = v29;
    xpc_connection_set_event_handler(v33, handler);
    xpc_connection_resume(v33);

  }
  else
  {
    +[APSLog xpc](APSLog, "xpc");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __APSXPCCreateServerConnection_block_invoke_cold_4();

  }
LABEL_16:

}

void __APSXPCCreateServerConnection_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19BBC2000, a1, a3, "APS connection went invalid", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __APSXPCCreateServerConnection_block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19BBC2000, a1, a3, "APS connection termination imminent", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __APSXPCCreateServerConnection_block_invoke_cold_3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_19BBC2000, a2, OS_LOG_TYPE_ERROR, "Unknown error type: %d, exiting", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_7();
}

void __APSXPCCreateServerConnection_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_19BBC2000, v0, v1, "Unhandled listener event:  %p", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
