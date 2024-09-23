@implementation HTFenceAssertion

- (HTFenceAssertion)initWithFenceName:(unint64_t)a3
{
  HTFenceAssertion *v4;
  HTFenceAssertion *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  NSObject *v10;
  HTFenceAssertion *v11;
  NSObject *v12;
  _QWORD block[4];
  HTFenceAssertion *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HTFenceAssertion;
  v4 = -[HTFenceAssertion init](&v16, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  v4->__name = a3;
  v4->__startTime = mach_absolute_time();
  if (setupPrefs_onceToken != -1)
    dispatch_once(&setupPrefs_onceToken, &__block_literal_global_96);
  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hangtracerDaemonEnabled");

  if ((v7 & 1) == 0)
  {
    shared_ht_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[HTFenceAssertion initWithFenceName:].cold.2();
    goto LABEL_12;
  }
  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fenceTrackingEnabled");

  if ((v9 & 1) == 0)
  {
    shared_ht_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[HTFenceAssertion initWithFenceName:].cold.1();
LABEL_12:

    v11 = 0;
    goto LABEL_13;
  }
  connectToHangTracer();
  HTConnectionQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HTFenceAssertion_initWithFenceName___block_invoke;
  block[3] = &unk_1E5FAA390;
  v15 = v5;
  dispatch_async(v10, block);

LABEL_7:
  v11 = v5;
LABEL_13:

  return v11;
}

void __38__HTFenceAssertion_initWithFenceName___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t i;
  xpc_object_t values[3];
  char *keys[2];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E5FAA370;
    v6 = "startTime";
    values[0] = xpc_int64_create(6);
    values[1] = xpc_uint64_create(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    values[2] = xpc_uint64_create(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v2 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (i = 2; i != -1; --i)
  }
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = mach_absolute_time();
  HTConnectionQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__HTFenceAssertion_invalidate__block_invoke;
  v5[3] = &unk_1E5FAA3B8;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);

}

void __30__HTFenceAssertion_invalidate__block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t i;
  xpc_object_t v4[4];
  char *keys[2];
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E5FAA3D8;
    v6 = *(_OWORD *)off_1E5FAA3E8;
    v4[0] = xpc_int64_create(7);
    v4[1] = xpc_uint64_create(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4[2] = xpc_uint64_create(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v4[3] = xpc_uint64_create(*(_QWORD *)(a1 + 40));
    v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (i = 3; i != -1; --i)
  }
}

- (void)blown
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = mach_absolute_time();
  HTConnectionQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__HTFenceAssertion_blown__block_invoke;
  v5[3] = &unk_1E5FAA3B8;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);

}

void __25__HTFenceAssertion_blown__block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t i;
  xpc_object_t v4[4];
  char *keys[2];
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E5FAA3D8;
    v6 = *(_OWORD *)off_1E5FAA3E8;
    v4[0] = xpc_int64_create(8);
    v4[1] = xpc_uint64_create(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v4[2] = xpc_uint64_create(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v4[3] = xpc_uint64_create(*(_QWORD *)(a1 + 40));
    v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (i = 3; i != -1; --i)
  }
}

- (void)initWithFenceName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "Fence tracking is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithFenceName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AF62F000, v0, v1, "HTFenceAssertion init: Daemon Mode HangTracing is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
