@implementation APSXPCConnectionSetEventHandlers

void __APSXPCConnectionSetEventHandlers_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;

  v3 = a2;
  v4 = MEMORY[0x1A1AC945C]();
  if (v4 != MEMORY[0x1E0C81310])
  {
    if (v4 != MEMORY[0x1E0C812F8])
    {
      +[APSLog xpc](APSLog, "xpc");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        __APSXPCConnectionSetEventHandlers_block_invoke_cold_4((uint64_t)a1, (uint64_t)v3, v5);
LABEL_9:

      goto LABEL_21;
    }
    v8 = a1[7];
    if (!v8)
      goto LABEL_21;
    v9 = *(void (**)(void))(v8 + 16);
LABEL_20:
    v9();
    goto LABEL_21;
  }
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    +[APSLog xpc](APSLog, "xpc");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __APSXPCConnectionSetEventHandlers_block_invoke_cold_1((uint64_t)a1, v10);

    v11 = a1[5];
    if (v11)
    {
LABEL_19:
      v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_20;
    }
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81260];
    +[APSLog xpc](APSLog, "xpc");
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v3 != v6)
    {
      if (v7)
        __APSXPCConnectionSetEventHandlers_block_invoke_cold_3((uint64_t)a1, v3, v5);
      goto LABEL_9;
    }
    if (v7)
      __APSXPCConnectionSetEventHandlers_block_invoke_cold_2((uint64_t)a1, v5);

    v11 = a1[6];
    if (v11)
      goto LABEL_19;
  }
LABEL_21:

}

void __APSXPCConnectionSetEventHandlers_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_0_1(a1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_19BBC2000, a2, v3, "Interrupted connection to service %s", v4);
  OUTLINED_FUNCTION_5_0();
}

void __APSXPCConnectionSetEventHandlers_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_0_1(a1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_19BBC2000, a2, v3, "Connection Invalid for service %s", v4);
  OUTLINED_FUNCTION_5_0();
}

void __APSXPCConnectionSetEventHandlers_block_invoke_cold_3(uint64_t a1, void *a2, NSObject *a3)
{
  const char *v5;
  const char *string;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;

  v5 = OUTLINED_FUNCTION_0_1(a1);
  string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
  v8 = 136315394;
  v9 = v5;
  v10 = 2080;
  v11 = string;
  OUTLINED_FUNCTION_3(&dword_19BBC2000, a3, v7, "Unexpected error for service %s: %s", (uint8_t *)&v8);
}

void __APSXPCConnectionSetEventHandlers_block_invoke_cold_4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;

  v5 = 136315394;
  v6 = OUTLINED_FUNCTION_0_1(a1);
  v7 = 2112;
  v8 = a2;
  _os_log_fault_impl(&dword_19BBC2000, a3, OS_LOG_TYPE_FAULT, "Received unexpected event in hander for service %s: %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_5_0();
}

@end
