@implementation TKSmartCardSessionEngine

- (TKSmartCardSessionEngine)initWithSlot:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  TKSmartCardSessionEngine *v9;
  TKSmartCardSessionEngine *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TKSmartCardSessionEngine;
  v9 = -[TKSmartCardSessionEngine init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slot, a3);
    objc_storeWeak((id *)&v10->_connection, v8);
    v10->_valid = 1;
  }

  return v10;
}

- (void)transmit:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  TKSmartCardSlotEngine **p_slot;
  TKSmartCardSlotEngine *slot;
  void *v13;
  void *v14;
  TKSmartCardSlotEngine *v15;
  void *v16;
  NSObject *v17;
  void *v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (self->_transmitting)
  {
    TK_LOG_token_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[TKSmartCardSessionEngine transmit:reply:].cold.2((uint64_t)self);

    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -2;
    goto LABEL_9;
  }
  if (!-[TKSmartCardSessionEngine valid](self, "valid"))
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -7;
LABEL_9:
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), v10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v16);

    goto LABEL_10;
  }
  slot = self->_slot;
  p_slot = &self->_slot;
  -[TKSmartCardSlotEngine setApduSentSinceLastReset:](slot, "setApduSentSinceLastReset:", 1);
  *((_BYTE *)p_slot + 8) = 1;
  -[TKSmartCardSlotEngine logWithBytes:handler:](*p_slot, "logWithBytes:handler:", v6, &__block_literal_global_362);
  -[TKSmartCardSlotEngine delegate](*p_slot, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "engine:transmit:", *p_slot, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  *((_BYTE *)p_slot + 8) = 0;
  v15 = *p_slot;
  if (v14)
  {
    -[TKSmartCardSlotEngine logWithBytes:handler:](v15, "logWithBytes:handler:", v14, &__block_literal_global_364);
    ((void (**)(id, void *, void *))v7)[2](v7, v14, 0);
  }
  else
  {
    -[TKSmartCardSlotEngine logWithBytes:handler:](v15, "logWithBytes:handler:", 0, &__block_literal_global_366);
    TK_LOG_token_0();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[TKSmartCardSessionEngine transmit:reply:].cold.1((id *)p_slot);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -2, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v18);

  }
LABEL_10:

}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_cold_1();
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_363(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_363_cold_1();
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_365(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_365_cold_1();
}

- (void)setSessionEndPolicy:(int64_t)a3
{
  self->_endPolicy = a3;
}

- (void)terminateWithReply:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (self->_active)
    -[TKSmartCardSlotEngine leaveSession:](self->_slot, "leaveSession:", self);
  v4[2]();

}

- (void)dealloc
{
  objc_super v3;

  -[TKSmartCardSessionEngine terminateWithReply:](self, "terminateWithReply:", &__block_literal_global_367);
  v3.receiver = self;
  v3.super_class = (Class)TKSmartCardSessionEngine;
  -[TKSmartCardSessionEngine dealloc](&v3, sel_dealloc);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int64_t)endPolicy
{
  return self->_endPolicy;
}

- (void)setEndPolicy:(int64_t)a3
{
  self->_endPolicy = a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_slot, 0);
}

- (void)transmit:(id *)a1 reply:.cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_14(&dword_1B9768000, v2, v3, "%@: failed to transmit APDU", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

- (void)transmit:(uint64_t)a1 reply:.cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 8), "name");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_14(&dword_1B9768000, v2, v3, "%{public}@: refusing to send APDU while another is in progress.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "APDU ->%{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_363_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B9768000, v0, v1, "APDU <-%{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_365_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "APDU FAILED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
