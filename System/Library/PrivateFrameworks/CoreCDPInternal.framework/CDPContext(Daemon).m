@implementation CDPContext(Daemon)

- (void)reauthenticateUserWithCompletion:()Daemon
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id buf[2];

  v4 = a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"Attempting silent re-authentication...\", (uint8_t *)buf, 2u);
  }

  if (objc_msgSend(a1, "idmsRecovery"))
  {
    objc_msgSend(a1, "_authProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_initWeak(buf, a1);
      objc_msgSend(a1, "_authProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke;
      v10[3] = &unk_24C81BFA0;
      objc_copyWeak(&v12, buf);
      v10[4] = a1;
      v11 = v4;
      objc_msgSend(v7, "cdpContext:performSilentRecoveryTokenRenewal:", a1, v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak(buf);
    }
    else if (v4)
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_14;
    v8[3] = &unk_24C81BFC8;
    v8[4] = a1;
    v9 = v4;
    +[CDPAuthenticationHelper silentAuthenticationForContext:withCompletion:](CDPAuthenticationHelper, "silentAuthenticationForContext:withCompletion:", a1, v8);

  }
}

- (void)populateWalrusStatus
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Error populating walrus status on context - %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
