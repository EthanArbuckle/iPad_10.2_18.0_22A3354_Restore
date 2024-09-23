@implementation HTHangReporterService

- (HTHangReporterService)init
{
  HTHangReporterService *v2;
  xpc_connection_t *p_isa;
  xpc_connection_t mach_service;
  xpc_connection_t v5;
  xpc_connection_t v6;
  _xpc_connection_s *v7;
  HTHangReporterService *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HTHangReporterService;
  v2 = -[HTHangReporterService init](&v13, sel_init);
  if (!v2)
    return 0;
  p_isa = &v2->super.isa;
  mach_service = xpc_connection_create_mach_service("com.apple.hangreporter", 0, 0);
  v5 = p_isa[1];
  p_isa[1] = mach_service;

  v6 = p_isa[1];
  if (v6)
  {
    objc_initWeak(&location, v6);
    v7 = p_isa[1];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __29__HTHangReporterService_init__block_invoke;
    v10[3] = &unk_250E634B0;
    objc_copyWeak(&v11, &location);
    xpc_connection_set_event_handler(v7, v10);
    xpc_connection_resume(p_isa[1]);
    v8 = p_isa;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __29__HTHangReporterService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (MEMORY[0x24263959C](v3) != MEMORY[0x24BDACFB8])
  {
    v5 = (void *)MEMORY[0x242639560](v3);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      __29__HTHangReporterService_init__block_invoke_cold_3((uint64_t)v5, v6, v7);
LABEL_4:
    free(v5);
    goto LABEL_5;
  }
  if (v3 != (id)MEMORY[0x24BDACF30])
  {
    if (v3 == (id)MEMORY[0x24BDACF38])
    {
      v5 = (void *)xpc_connection_copy_invalidation_reason();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = v5;
        _os_log_impl(&dword_23DA3F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Connection to hangreporter invalidated: %s", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x242639560](v3);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __29__HTHangReporterService_init__block_invoke_cold_2((uint64_t)v5);
    }
    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __29__HTHangReporterService_init__block_invoke_cold_1();
LABEL_5:

}

- (void)getProcessingHangsWithCompletion:(id)a3
{
  id v4;
  xpc_object_t empty;
  OS_xpc_object *hangReporterConnection;
  id v7;
  _QWORD handler[4];
  id v9;

  v4 = a3;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "message", "get-processing-hangs-list");
  hangReporterConnection = self->_hangReporterConnection;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke;
  handler[3] = &unk_250E634D8;
  v9 = v4;
  v7 = v4;
  xpc_connection_send_message_with_reply(hangReporterConnection, empty, 0, handler);

}

void __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  size_t count;
  size_t v14;
  size_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HTHang *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  uint8_t v28[4];
  _DWORD v29[7];

  *(_QWORD *)&v29[5] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x24263959C]();
  v5 = MEMORY[0x24BDACFA0];
  if (v4 == MEMORY[0x24BDACFA0])
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_array(v3, "hangs");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    count = xpc_array_get_count(v10);
    if (count)
    {
      v14 = count;
      v15 = 0;
      v16 = MEMORY[0x24BDACB70];
      do
      {
        xpc_array_get_value(v10, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (MEMORY[0x24263959C]() == v5)
        {
          v19 = -[HTHang initWithXPCDictionary:]([HTHang alloc], "initWithXPCDictionary:", v17);
          objc_msgSend(v12, "addObject:", v19);

        }
        else
        {
          v18 = (void *)MEMORY[0x242639560](v17);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_cold_1(v28, (uint64_t)v18, v29);
          free(v18);
        }

        ++v15;
      }
      while (v14 != v15);
    }
    dispatch_get_global_queue(21, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_11;
    v22[3] = &unk_250E632F0;
    v21 = *(id *)(a1 + 32);
    v23 = v12;
    v24 = v21;
    v11 = v12;
    dispatch_async(v20, v22);

  }
  else
  {
    v6 = (void *)MEMORY[0x242639560](v3);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
    dispatch_get_global_queue(21, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_2;
    block[3] = &unk_250E632F0;
    v9 = *(id *)(a1 + 32);
    v26 = v7;
    v27 = v9;
    v10 = v7;
    dispatch_async(v8, block);

    v11 = v27;
  }

}

void __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDD1540];
  v2 = *MEMORY[0x24BDD0B88];
  v3 = &stru_250E649A0;
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v3 = *(const __CFString **)(a1 + 32);
  v7 = *MEMORY[0x24BDD0FC8];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "errorWithDomain:code:userInfo:", v2, 4101, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v6);

}

uint64_t __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hangReporterConnection, 0);
}

void __29__HTHangReporterService_init__block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_23DA3F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Connection to hangreporter encountered connection interrupted", v0, 2u);
}

void __29__HTHangReporterService_init__block_invoke_cold_2(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = a1;
  _os_log_error_impl(&dword_23DA3F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Connection to hangreporter encountered error: %s", (uint8_t *)&v1, 0xCu);
}

void __29__HTHangReporterService_init__block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_23DA3F000, MEMORY[0x24BDACB70], a3, "Connection to hangreporter encountered non-error: %s", (uint8_t *)&v3);
}

void __58__HTHangReporterService_getProcessingHangsWithCompletion___block_invoke_cold_1(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a3 = a2;
  OUTLINED_FUNCTION_0_0(&dword_23DA3F000, MEMORY[0x24BDACB70], (uint64_t)a3, "hangs array contains non-dictionary %s", a1);
}

@end
