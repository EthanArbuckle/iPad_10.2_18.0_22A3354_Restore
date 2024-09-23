@implementation AKAppleIDProximityAuthenticationContext

- (AKAppleIDProximityAuthenticationContext)init
{
  AKAppleIDProximityAuthenticationContext *v2;
  AKAppleIDProximityAuthenticationContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAppleIDProximityAuthenticationContext;
  v2 = -[AKAppleIDProximityAuthenticationContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AKAppleIDProximityAuthenticationContext set_shouldBroadcastForProximityAuthOnly:](v2, "set_shouldBroadcastForProximityAuthOnly:", 1);
  return v3;
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a3;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[AKAppleIDProximityAuthenticationContext presentBasicLoginUIWithCompletion:].cold.1(v4);

  objc_msgSend(MEMORY[0x1E0CB35C8], "ak_errorWithCode:", -7027);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v3 + 2))(v3, 0, 0, 0, v5);

}

- (void)presentBasicLoginUIWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD795000, log, OS_LOG_TYPE_ERROR, "Client is responsible for presenting their own Login UI.", v1, 2u);
}

@end
