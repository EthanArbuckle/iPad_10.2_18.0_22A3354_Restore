@implementation DCPresentmentSession

- (DCPresentmentSession)initWithPartitions:(id)a3 presentmentType:(unint64_t)a4 options:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  DCPresentmentSession *v11;
  DCPresentmentSession *v12;
  DCPresentmentClient *v13;
  DCPresentmentClient *client;
  uint64_t v15;
  NSArray *partitions;
  uint64_t v17;
  DCPresentmentSessionOptions *options;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  DC_LOG_CLIENT_3();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession initWithPartitions:presentmentType:options:].cold.1();

  v20.receiver = self;
  v20.super_class = (Class)DCPresentmentSession;
  v11 = -[DCPresentmentSession init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v13 = objc_alloc_init(DCPresentmentClient);
    client = v12->_client;
    v12->_client = v13;

    v15 = objc_msgSend(v8, "copy");
    partitions = v12->_partitions;
    v12->_partitions = (NSArray *)v15;

    v12->_presentmentType = a4;
    v12->_hasBeenConfigured = 0;
    v17 = objc_msgSend(v9, "copy");
    options = v12->_options;
    v12->_options = (DCPresentmentSessionOptions *)v17;

  }
  return v12;
}

- (DCPresentmentSession)initWithPartitions:(id)a3 presentmentType:(unint64_t)a4
{
  return -[DCPresentmentSession initWithPartitions:presentmentType:options:](self, "initWithPartitions:presentmentType:options:", a3, a4, 0);
}

- (void)configureIfNeededWithContinuation:(id)a3 errorHandler:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  void (**v16)(_QWORD);

  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  if (-[DCPresentmentSession hasBeenConfigured](self, "hasBeenConfigured"))
  {
LABEL_9:
    v6[2](v6);
    goto LABEL_10;
  }
  DC_LOG_CLIENT_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession configureIfNeededWithContinuation:errorHandler:].cold.2();

  if (!self->_client)
  {
    DC_LOG_CLIENT_3();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[DCPresentmentSession configureIfNeededWithContinuation:errorHandler:].cold.1();

    goto LABEL_9;
  }
  -[DCPresentmentSession client](self, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCPresentmentSession partitions](self, "partitions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DCPresentmentSession presentmentType](self, "presentmentType");
  -[DCPresentmentSession options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke;
  v14[3] = &unk_24C306778;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  objc_msgSend(v9, "configureWithPartitions:presentmentType:options:completion:", v10, v11, v12, v14);

LABEL_10:
}

void __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;

  v3 = a2;
  DC_LOG_CLIENT_3();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_2(v3, v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
      __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "finishConfiguration");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)finishConfiguration
{
  -[DCPresentmentSession setHasBeenConfigured:](self, "setHasBeenConfigured:", 1);
}

- (void)generateTransportKeyForSpecification:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;

  v6 = a4;
  DC_LOG_CLIENT_3();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession generateTransportKeyForSpecification:completion:].cold.1();

  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__DCPresentmentSession_generateTransportKeyForSpecification_completion___block_invoke;
  v12[3] = &unk_24C306890;
  v12[4] = self;
  v14 = a3;
  v13 = v6;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __72__DCPresentmentSession_generateTransportKeyForSpecification_completion___block_invoke_3;
  v10[3] = &unk_24C306078;
  v11 = v13;
  v9 = v13;
  -[DCPresentmentSession configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v12, v10);

}

void __72__DCPresentmentSession_generateTransportKeyForSpecification_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession generateTransportKeyForSpecification:completion:].cold.1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateTransportKeyForSpecification:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __72__DCPresentmentSession_generateTransportKeyForSpecification_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)interpretRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  DC_LOG_CLIENT_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession interpretRequest:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__DCPresentmentSession_interpretRequest_completion___block_invoke;
  v14[3] = &unk_24C3067C8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __52__DCPresentmentSession_interpretRequest_completion___block_invoke_4;
  v12[3] = &unk_24C306078;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[DCPresentmentSession configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v14, v12);

}

void __52__DCPresentmentSession_interpretRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession interpretRequest:completion:].cold.1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interpretRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __52__DCPresentmentSession_interpretRequest_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)buildResponseForSelection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  DC_LOG_CLIENT_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession buildResponseForSelection:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__DCPresentmentSession_buildResponseForSelection_completion___block_invoke;
  v14[3] = &unk_24C3067C8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __61__DCPresentmentSession_buildResponseForSelection_completion___block_invoke_5;
  v12[3] = &unk_24C306078;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[DCPresentmentSession configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v14, v12);

}

void __61__DCPresentmentSession_buildResponseForSelection_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession buildResponseForSelection:completion:].cold.1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildResponseForSelection:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __61__DCPresentmentSession_buildResponseForSelection_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)buildCredentialResponseForSelection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  DC_LOG_CLIENT_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession buildCredentialResponseForSelection:completion:].cold.1();

  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__DCPresentmentSession_buildCredentialResponseForSelection_completion___block_invoke;
  v14[3] = &unk_24C3067C8;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __71__DCPresentmentSession_buildCredentialResponseForSelection_completion___block_invoke_6;
  v12[3] = &unk_24C306078;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[DCPresentmentSession configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v14, v12);

}

void __71__DCPresentmentSession_buildCredentialResponseForSelection_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession buildCredentialResponseForSelection:completion:].cold.1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildCredentialResponseForSelection:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __71__DCPresentmentSession_buildCredentialResponseForSelection_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)buildErrorResponseWithStatus:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;

  v6 = a4;
  DC_LOG_CLIENT_3();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession buildErrorResponseWithStatus:completion:].cold.1();

  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__DCPresentmentSession_buildErrorResponseWithStatus_completion___block_invoke;
  v12[3] = &unk_24C306890;
  v12[4] = self;
  v14 = a3;
  v13 = v6;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __64__DCPresentmentSession_buildErrorResponseWithStatus_completion___block_invoke_7;
  v10[3] = &unk_24C306078;
  v11 = v13;
  v9 = v13;
  -[DCPresentmentSession configureIfNeededWithContinuation:errorHandler:](self, "configureIfNeededWithContinuation:errorHandler:", v12, v10);

}

void __64__DCPresentmentSession_buildErrorResponseWithStatus_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  DC_LOG_CLIENT_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[DCPresentmentSession buildResponseForSelection:completion:].cold.1();

  objc_msgSend(*(id *)(a1 + 32), "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildErrorResponseWithStatus:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __64__DCPresentmentSession_buildErrorResponseWithStatus_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)hasBeenConfigured
{
  DCPresentmentSession *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasBeenConfigured;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasBeenConfigured:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasBeenConfigured = a3;
  os_unfair_lock_unlock(p_lock);
}

- (DCPresentmentClient)client
{
  return self->_client;
}

- (NSArray)partitions
{
  return self->_partitions;
}

- (unint64_t)presentmentType
{
  return self->_presentmentType;
}

- (DCPresentmentSessionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_partitions, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)initWithPartitions:presentmentType:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentSession init called", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureIfNeededWithContinuation:errorHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentSession configureIfNeeded no client set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureIfNeededWithContinuation:errorHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentSession configure needed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentSession configure completed successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_20A40D000, a2, OS_LOG_TYPE_DEBUG, "DCPresentmentSession configure return error %{error}@", (uint8_t *)&v4, 0xCu);

}

- (void)generateTransportKeyForSpecification:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentSession generateTransportKey", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)interpretRequest:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentSession interpretRequest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)buildResponseForSelection:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentSession buildResponse", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)buildCredentialResponseForSelection:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentSession buildCredentialResponse", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)buildErrorResponseWithStatus:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20A40D000, v0, v1, "DCPresentmentSession buildErrorResponse", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
