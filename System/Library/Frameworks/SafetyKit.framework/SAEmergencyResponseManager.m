@implementation SAEmergencyResponseManager

- (SAEmergencyResponseManager)init
{
  SAEmergencyResponseManager *v2;
  SAEmergencyResponseManager *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SAEmergencyResponseManager;
  v2 = -[SAEmergencyResponseManager init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SAEmergencyResponseManager client](v2, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEmergencyResponseClientDelegate:", v3);

  }
  return v3;
}

- (void)dialVoiceCallToPhoneNumber:(NSString *)phoneNumber completionHandler:(void *)handler
{
  NSString *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = phoneNumber;
  v7 = handler;
  sa_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SAEmergencyResponseManager dialVoiceCallToPhoneNumber:completionHandler:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  -[SAEmergencyResponseManager client](self, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dialVoiceCallToPhoneNumber:completionHandler:", v6, v7);

}

- (SAClient)client
{
  return +[SAClient sharedInstance](SAClient, "sharedInstance");
}

- (void)updateVoiceCallStatus:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  sa_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SAEmergencyResponseManager updateVoiceCallStatus:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);

  -[SAEmergencyResponseManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "emergencyResponseManager:didUpdateVoiceCallStatus:", self, a3);

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)dialVoiceCallToPhoneNumber:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_23457A000, a2, a3, "%s, phoneNumber: %@", a5, a6, a7, a8, 2u);
}

- (void)updateVoiceCallStatus:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_23457A000, a2, a3, "%s, status: %ld", a5, a6, a7, a8, 2u);
}

@end
