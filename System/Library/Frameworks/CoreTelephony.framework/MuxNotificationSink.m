@implementation MuxNotificationSink

- (id)methodSignatureForSelector:(SEL)a3
{
  BOOL *v4;
  objc_method_description MethodDescription;
  void *v6;

  v4 = (BOOL *)&-[MuxNotificationSink methodSignatureForSelector:]::opts;
  while (1)
  {
    MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1EDD12A88, a3, *v4, v4[1]);
    if (MethodDescription.name)
      break;
    v4 += 2;
    {
      v6 = 0;
      return v6;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", MethodDescription.types);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v5, "sink:handleNotification:", self, v6);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)clientDidTriggerFault:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  v4 = CTLogClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[MuxNotificationSink clientDidTriggerFault:].cold.1();

}

- (void)clientDidTriggerFault:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_18425C000, v0, OS_LOG_TYPE_FAULT, "Fault detected: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (MuxNotificationSinkDelegate)delegate
{
  return (MuxNotificationSinkDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
