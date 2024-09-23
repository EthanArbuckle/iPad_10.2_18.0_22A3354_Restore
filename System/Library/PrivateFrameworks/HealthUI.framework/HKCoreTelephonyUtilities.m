@implementation HKCoreTelephonyUtilities

- (HKCoreTelephonyUtilities)init
{
  HKCoreTelephonyUtilities *v2;
  uint64_t v3;
  OS_dispatch_queue *ctServerQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKCoreTelephonyUtilities;
  v2 = -[HKCoreTelephonyUtilities init](&v6, sel_init);
  if (v2)
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    ctServerQueue = v2->_ctServerQueue;
    v2->_ctServerQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  __CTServerConnection *ctServerConnection;
  objc_super v4;

  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
    CFRelease(ctServerConnection);
  v4.receiver = self;
  v4.super_class = (Class)HKCoreTelephonyUtilities;
  -[HKCoreTelephonyUtilities dealloc](&v4, sel_dealloc);
}

- (BOOL)isEmergencyServicePhoneNumber:(id)a3
{
  id v4;
  __CTServerConnection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  v12 = 0;
  v5 = -[HKCoreTelephonyUtilities ctServerConnection](self, "ctServerConnection");
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v6 = get_CTServerConnectionIsEmergencyNumberSymbolLoc_ptr;
  v16 = get_CTServerConnectionIsEmergencyNumberSymbolLoc_ptr;
  if (!get_CTServerConnectionIsEmergencyNumberSymbolLoc_ptr)
  {
    v7 = (void *)CoreTelephonyLibrary();
    v6 = dlsym(v7, "_CTServerConnectionIsEmergencyNumber");
    v14[3] = (uint64_t)v6;
    get_CTServerConnectionIsEmergencyNumberSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v13, 8);
  if (!v6)
    -[HKCoreTelephonyUtilities isEmergencyServicePhoneNumber:].cold.1();
  v8 = ((uint64_t (*)(__CTServerConnection *, id, char *))v6)(v5, v4, &v12);
  if ((_DWORD)v8)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      -[HKCoreTelephonyUtilities isEmergencyServicePhoneNumber:].cold.2(v8, SHIDWORD(v8), v9);
  }
  v10 = v12 != 0;

  return v10;
}

- (__CTServerConnection)ctServerConnection
{
  __CTServerConnection *ctServerConnection;
  void *v4;
  void *v5;
  OS_dispatch_queue *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  ctServerConnection = self->_ctServerConnection;
  if (!ctServerConnection)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v4 = get_CTServerConnectionAddIdentifierExceptionSymbolLoc_ptr;
    v14 = get_CTServerConnectionAddIdentifierExceptionSymbolLoc_ptr;
    if (!get_CTServerConnectionAddIdentifierExceptionSymbolLoc_ptr)
    {
      v5 = (void *)CoreTelephonyLibrary();
      v4 = dlsym(v5, "_CTServerConnectionAddIdentifierException");
      v12[3] = (uint64_t)v4;
      get_CTServerConnectionAddIdentifierExceptionSymbolLoc_ptr = v4;
    }
    _Block_object_dispose(&v11, 8);
    if (!v4)
      -[HKCoreTelephonyUtilities ctServerConnection].cold.1();
    ((void (*)(const __CFString *))v4)(CFSTR("com.apple.HealthUI.medicalID.ctserver"));
    v6 = self->_ctServerQueue;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v7 = get_CTServerConnectionCreateOnTargetQueueSymbolLoc_ptr;
    v14 = get_CTServerConnectionCreateOnTargetQueueSymbolLoc_ptr;
    if (!get_CTServerConnectionCreateOnTargetQueueSymbolLoc_ptr)
    {
      v8 = (void *)CoreTelephonyLibrary();
      v7 = dlsym(v8, "_CTServerConnectionCreateOnTargetQueue");
      v12[3] = (uint64_t)v7;
      get_CTServerConnectionCreateOnTargetQueueSymbolLoc_ptr = v7;
    }
    _Block_object_dispose(&v11, 8);
    if (!v7)
      -[HKCoreTelephonyUtilities ctServerConnection].cold.2();
    ctServerConnection = (__CTServerConnection *)((uint64_t (*)(_QWORD, const __CFString *, OS_dispatch_queue *, void *))v7)(*MEMORY[0x1E0C9AE00], CFSTR("com.apple.HealthUI.medicalID.ctserver"), v6, &__block_literal_global_36);

    self->_ctServerConnection = ctServerConnection;
    if (!ctServerConnection)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
        -[HKCoreTelephonyUtilities ctServerConnection].cold.3(v9);
      return self->_ctServerConnection;
    }
  }
  return ctServerConnection;
}

void __46__HKCoreTelephonyUtilities_ctServerConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;

  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
    __46__HKCoreTelephonyUtilities_ctServerConnection__block_invoke_cold_1(a2, a3, v5);
}

- (OS_dispatch_queue)ctServerQueue
{
  return self->_ctServerQueue;
}

- (void)setCtServerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_ctServerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctServerQueue, 0);
}

- (void)isEmergencyServicePhoneNumber:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CTError HKCTServerConnectionIsEmergencyNumber(CTServerConnectionRef, CFStringRef, Boolean *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("HKCoreTelephonyUtilities.m"), 17, CFSTR("%s"), OUTLINED_FUNCTION_0_8());

  __break(1u);
}

- (void)isEmergencyServicePhoneNumber:(os_log_t)log .cold.2(int a1, int a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[HKCoreTelephonyUtilities isEmergencyServicePhoneNumber:]";
  v5 = 1024;
  v6 = a1;
  v7 = 1024;
  v8 = a2;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "%s - error from _CTServerConnectionIsEmergencyNumber; domain:%d, error:%d",
    (uint8_t *)&v3,
    0x18u);
}

- (void)ctServerConnection
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[HKCoreTelephonyUtilities ctServerConnection]";
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "%s - unable to create sCTServerConnectionRef", (uint8_t *)&v1, 0xCu);
}

void __46__HKCoreTelephonyUtilities_ctServerConnection__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "-[HKCoreTelephonyUtilities ctServerConnection]_block_invoke";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "%s notification:%@ info:%@", (uint8_t *)&v3, 0x20u);
}

@end
