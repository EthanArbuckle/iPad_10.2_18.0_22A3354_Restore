@implementation AAMessagingDestination

- (AAMessagingDestination)initWithEmail:(id)a3
{
  id v4;
  AAMessagingDestination *v5;
  AAMessagingDestination *v6;
  uint64_t v7;
  NSString *destination;
  uint64_t v9;
  NSString *destinationURI;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAMessagingDestination;
  v5 = -[AAMessagingDestination init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_destinationType = 1;
    v7 = objc_msgSend(v4, "copy");
    destination = v6->_destination;
    v6->_destination = (NSString *)v7;

    v9 = _SIDSCopyIDForEmailAddress(v4);
    destinationURI = v6->_destinationURI;
    v6->_destinationURI = (NSString *)v9;

  }
  return v6;
}

- (AAMessagingDestination)initWithPhoneNumber:(id)a3
{
  id v4;
  AAMessagingDestination *v5;
  AAMessagingDestination *v6;
  uint64_t v7;
  NSString *destination;
  uint64_t v9;
  NSString *destinationURI;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAMessagingDestination;
  v5 = -[AAMessagingDestination init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_destinationType = 2;
    v7 = objc_msgSend(v4, "copy");
    destination = v6->_destination;
    v6->_destination = (NSString *)v7;

    _SIDSCopyIDForPhoneNumberWithOptions(v4, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    destinationURI = v6->_destinationURI;
    v6->_destinationURI = (NSString *)v9;

  }
  return v6;
}

- (AAMessagingDestination)initWithHandle:(id)a3
{
  id v4;
  AAMessagingDestination *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *destinationURI;
  uint64_t v11;
  OS_dispatch_queue *idsQueue;
  AAMessagingDestination *v13;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSString *destination;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AAMessagingDestination;
  v5 = -[AAMessagingDestination init](&v27, sel_init);
  if (!v5)
    goto LABEL_8;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("token:")) & 1) != 0
    || objc_msgSend(v4, "hasPrefix:", CFSTR("self-token:")))
  {
    _AALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AAMessagingDestination initWithHandle:].cold.1(v6, v7, v8);

    v5->_destinationType = 3;
    v9 = objc_msgSend(v4, "copy");
LABEL_7:
    destinationURI = v5->_destinationURI;
    v5->_destinationURI = (NSString *)v9;

LABEL_8:
    dispatch_get_global_queue(33, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    idsQueue = v5->_idsQueue;
    v5->_idsQueue = (OS_dispatch_queue *)v11;

    v13 = v5;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "aa_appearsToBeEmail"))
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AAMessagingDestination initWithHandle:].cold.2(v15, v16, v17);

    v5->_destinationType = 1;
    v18 = objc_msgSend(v4, "copy");
    destination = v5->_destination;
    v5->_destination = (NSString *)v18;

    v9 = _SIDSCopyIDForEmailAddress(v4);
    goto LABEL_7;
  }
  v20 = objc_msgSend(v4, "aa_appearsToBePhoneNumber");
  _AALogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v20)
  {
    if (v22)
      -[AAMessagingDestination initWithHandle:].cold.3(v21, v23, v24);

    v5->_destinationType = 2;
    v25 = objc_msgSend(v4, "copy");
    v26 = v5->_destination;
    v5->_destination = (NSString *)v25;

    _SIDSCopyIDForPhoneNumberWithOptions(v4, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v22)
    -[AAMessagingDestination initWithHandle:].cold.4((uint64_t)v4, v21, v24);

  v13 = 0;
LABEL_9:

  return v13;
}

- (void)isRegisteredToiMessageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSString *destinationURI;
  void *v8;
  void *v9;
  OS_dispatch_queue *idsQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  AAMessagingDestination *v15;
  id v16;
  id v17;
  id location;

  v4 = a3;
  objc_msgSend(getIDSIDQueryControllerClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AAMessagingDestination isRegisteredToiMessageWithCompletion:].cold.1(self, v6);

  objc_initWeak(&location, self);
  destinationURI = self->_destinationURI;
  getIDSServiceNameiMessage();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getIDSServiceNameiMessage();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  idsQueue = self->_idsQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke;
  v13[3] = &unk_1E416FDE8;
  objc_copyWeak(&v17, &location);
  v11 = v5;
  v14 = v11;
  v12 = v4;
  v15 = self;
  v16 = v12;
  objc_msgSend(v11, "currentIDStatusForDestination:service:listenerID:queue:completionBlock:", destinationURI, v8, v9, idsQueue, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  _QWORD *v14;
  uint64_t v15;
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v6)
      __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_cold_2();

    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a2 == 1);
  }
  else
  {
    if (v6)
      __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_cold_1(v5);

    v7 = *(void **)(a1 + 32);
    v8 = WeakRetained[4];
    getIDSServiceNameiMessage();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    getIDSServiceNameiMessage();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = WeakRetained[1];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_25;
    v13[3] = &unk_1E416FDC0;
    v14 = WeakRetained;
    v12 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = v12;
    objc_msgSend(v7, "refreshIDStatusForDestination:service:listenerID:queue:completionBlock:", v8, v9, v10, v11, v13);

  }
}

uint64_t __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_25(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_25_cold_1();

  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a2 == 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_destination, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (int64_t)destinationType
{
  return self->_destinationType;
}

- (NSString)destination
{
  return self->_destination;
}

- (NSString)destinationURI
{
  return self->_destinationURI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURI, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
}

- (void)initWithHandle:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AAMessagingDestination initWithHandle:]";
  OUTLINED_FUNCTION_6(&dword_19EACA000, a1, a3, "%s Initializing with token handle", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithHandle:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AAMessagingDestination initWithHandle:]";
  OUTLINED_FUNCTION_6(&dword_19EACA000, a1, a3, "%s Initializing with email", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithHandle:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AAMessagingDestination initWithHandle:]";
  OUTLINED_FUNCTION_6(&dword_19EACA000, a1, a3, "%s Initializing with phone number", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithHandle:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "-[AAMessagingDestination initWithHandle:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_2_0(&dword_19EACA000, a2, a3, "%s unable to initialize with handle %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)isRegisteredToiMessageWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "destinationURI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_6(&dword_19EACA000, a2, v4, "Checking if %@ is reachable via iMessage.", (uint8_t *)&v5);

}

void __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19EACA000, log, OS_LOG_TYPE_DEBUG, "IDS status is unknown. Forcing refresh.", v1, 2u);
}

void __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_19EACA000, v0, (uint64_t)v0, "Known IDS status for %@ is %ld", v1);
  OUTLINED_FUNCTION_1_0();
}

void __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_25_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_19EACA000, v0, (uint64_t)v0, "IDS status for %@ is %ld", v1);
  OUTLINED_FUNCTION_1_0();
}

@end
