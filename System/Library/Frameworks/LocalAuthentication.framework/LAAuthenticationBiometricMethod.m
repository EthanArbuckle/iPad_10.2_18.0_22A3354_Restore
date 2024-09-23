@implementation LAAuthenticationBiometricMethod

- (unint64_t)lockoutStateFromError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.LocalAuthentication")))
  {

    goto LABEL_6;
  }
  v5 = objc_msgSend(v3, "code");

  if (v5 != -8)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v3, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Subcode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if ((unint64_t)(v8 - 1) >= 5)
    v9 = 4;
  else
    v9 = qword_1B9753D38[v8 - 1];
LABEL_7:

  return v9;
}

- (LAAuthenticationBiometricMethod)initWithConfiguration:(id)a3
{
  id v4;
  LAAuthenticationBiometricMethod *v5;
  LAContext *v6;
  LAContext *v7;
  LAAuthenticationBiometricMethodState *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)LAAuthenticationBiometricMethod;
  v5 = -[LAAuthenticationMethod initWithConfiguration:](&v37, sel_initWithConfiguration_, v4);
  if (v5)
  {
    objc_msgSend(v4, "authenticationContext");
    v6 = (LAContext *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      v7 = objc_alloc_init(LAContext);
    objc_storeStrong((id *)&v5->_context, v7);
    if (!v6)

    v8 = -[LAAuthenticationMethodState initWithAvailableUsers:]([LAAuthenticationBiometricMethodState alloc], "initWithAvailableUsers:", 0);
    -[LAAuthenticationBiometricMethod setCurrentState:](v5, "setCurrentState:", v8);

    v5->_isDevicePresent = 1;
    -[LAAuthenticationBiometricMethod context](v5, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = &unk_1E7087F78;
    v41[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v9, "evaluatePolicy:options:error:", 1, v10, &v36);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v36;
    v13 = v12;
    if (v11)
    {

LABEL_8:
      LA_LOG_laabio();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[LAAuthenticationBiometricMethod initWithConfiguration:].cold.1(v14);

      v5->_isEnrolled = 1;
LABEL_11:
      -[LAAuthenticationBiometricMethod context](v5, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "biometryType") == 1;
      -[LAAuthenticationBiometricMethod currentState](v5, "currentState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setIsTouchID:", v16);

      -[LAAuthenticationBiometricMethod context](v5, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "biometryType") == 2;
      -[LAAuthenticationBiometricMethod currentState](v5, "currentState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setIsFaceID:", v19);

      v5->_isAllowed = v5->_isEnrolled;
      goto LABEL_12;
    }
    objc_msgSend(v12, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.LocalAuthentication")))
    {
      v23 = objc_msgSend(v13, "code");

      if (v23 == -1004)
        goto LABEL_8;
    }
    else
    {

    }
    LA_LOG_laabio();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[LAAuthenticationBiometricMethod initWithConfiguration:].cold.2((uint64_t)v13, v24, v25, v26, v27, v28, v29, v30);

    objc_msgSend(v13, "domain");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.LocalAuthentication"));

    if (v32)
    {
      switch(objc_msgSend(v13, "code"))
      {
        case -8:
          v5->_isEnrolled = 1;
          v33 = -[LAAuthenticationBiometricMethod lockoutStateFromError:](v5, "lockoutStateFromError:", v13);
          -[LAAuthenticationBiometricMethod currentState](v5, "currentState");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setLockoutState:", v33);

          break;
        case -7:
        case -5:
          goto LABEL_11;
        case -6:
          goto LABEL_25;
        default:
          LA_LOG_laabio();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v13;
            _os_log_impl(&dword_1B971E000, v35, OS_LOG_TYPE_DEFAULT, "unhandled error for canEvaluate: %@", buf, 0xCu);
          }

LABEL_25:
          v5->_isDevicePresent = 0;
          break;
      }
    }
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (BOOL)start
{
  _BOOL4 v3;
  void *v4;
  _QWORD v6[5];
  objc_super v7;

  v3 = -[LAAuthenticationBiometricMethod isDevicePresent](self, "isDevicePresent");
  if (v3)
  {
    v3 = -[LAAuthenticationBiometricMethod isEnrolled](self, "isEnrolled");
    if (v3)
    {
      v3 = -[LAAuthenticationBiometricMethod isAllowed](self, "isAllowed");
      if (v3)
      {
        v7.receiver = self;
        v7.super_class = (Class)LAAuthenticationBiometricMethod;
        v3 = -[LAAuthenticationMethod start](&v7, sel_start);
        if (v3)
        {
          v6[0] = MEMORY[0x1E0C809B0];
          v6[1] = 3221225472;
          v6[2] = __40__LAAuthenticationBiometricMethod_start__block_invoke;
          v6[3] = &unk_1E707A270;
          v6[4] = self;
          -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:](self, "forEachObserverWithProtocol:selector:invoke:", &unk_1EF235030, sel_authenticationMethod_didStartWithState_, v6);
          -[LAAuthenticationBiometricMethod context](self, "context");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setUiDelegate:", self);

          -[LAAuthenticationBiometricMethod runBiometricOperation](self, "runBiometricOperation");
          LOBYTE(v3) = 1;
        }
      }
    }
  }
  return v3;
}

void __40__LAAuthenticationBiometricMethod_start__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticationMethod:didStartWithState:", v2, v4);

}

- (void)distributeBiometricFeedback:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__LAAuthenticationBiometricMethod_distributeBiometricFeedback___block_invoke;
  v3[3] = &unk_1E707A298;
  v3[4] = self;
  v3[5] = a3;
  -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:](self, "forEachObserverWithProtocol:selector:invoke:", &unk_1EF235100, sel_authenticationBiometricsMethod_didReceiveFeedback_, v3);
}

uint64_t __63__LAAuthenticationBiometricMethod_distributeBiometricFeedback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "authenticationBiometricsMethod:didReceiveFeedback:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)distributeStateChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __56__LAAuthenticationBiometricMethod_distributeStateChange__block_invoke;
  v2[3] = &unk_1E707A270;
  v2[4] = self;
  -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:](self, "forEachObserverWithProtocol:selector:invoke:", &unk_1EF235100, sel_authenticationMethod_didChangeState_, v2);
}

void __56__LAAuthenticationBiometricMethod_distributeStateChange__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticationMethod:didChangeState:", v2, v4);

}

- (void)runBiometricOperation
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  -[LAAuthenticationBiometricMethod currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lockoutState");

  if (!v4)
  {
    -[LAAuthenticationBiometricMethod context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke;
    v6[3] = &unk_1E707A2E8;
    v6[4] = self;
    objc_msgSend(v5, "evaluatePolicy:options:reply:", 1, MEMORY[0x1E0C9AA70], v6);

  }
}

void __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  LAAuthenticationMethodResult *v15;
  void *v16;
  LAAuthenticationMethodResult *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  LAAuthenticationMethodResult *v25;

  v5 = a2;
  v6 = a3;
  LA_LOG_laabio();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_2((uint64_t)v5, v7, v9, v10, v11, v12, v13, v14);

    v15 = -[LAAuthenticationMethodResult initWithAuthenticatedUser:authenticationMethod:]([LAAuthenticationMethodResult alloc], "initWithAuthenticatedUser:authenticationMethod:", &stru_1E707B3F8, *(_QWORD *)(a1 + 32));
    v16 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_110;
    v24[3] = &unk_1E707A2C0;
    v24[4] = v16;
    v25 = v15;
    v17 = v15;
    objc_msgSend(v16, "forEachObserverWithProtocol:selector:invoke:", &unk_1EF235030, sel_authenticationMethod_didAuthenticateWithResult_, v24);

  }
  else
  {
    if (v8)
      __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_1((uint64_t)v6, v7, v9, v10, v11, v12, v13, v14);

    objc_msgSend(v6, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.LocalAuthentication"));

    if (v19)
    {
      v20 = objc_msgSend(v6, "code");
      if (v20 == -8)
      {
        v22 = objc_msgSend(*(id *)(a1 + 32), "lockoutStateFromError:", v6);
        objc_msgSend(*(id *)(a1 + 32), "currentState");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setLockoutState:", v22);

        objc_msgSend(*(id *)(a1 + 32), "distributeStateChange");
      }
      else if (v20 == -1)
      {
        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "autoRetry"))
          objc_msgSend(*(id *)(a1 + 32), "runBiometricOperation");

      }
    }
  }

}

uint64_t __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_110(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "authenticationMethod:didAuthenticateWithResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  LAAuthenticationBiometricMethod *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  _QWORD v21[5];

  v7 = a4;
  LA_LOG_laabio();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[LAAuthenticationBiometricMethod event:params:reply:].cold.5();

  -[LAAuthenticationBiometricMethod currentState](self, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUserPresent");

  if (a3 > 6)
  {
    if (a3 == 7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E7087FA8);
      v16 = objc_claimAutoreleasedReturnValue();
      v12 = v16;
      if (v16)
      {
        switch(-[NSObject integerValue](v16, "integerValue"))
        {
          case 0:
LABEL_16:
            v10 = 1;
            break;
          case 1:
LABEL_19:
            v10 = 0;
            break;
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
            goto LABEL_40;
          case 8:
            v14 = self;
            v15 = 13;
LABEL_39:
            -[LAAuthenticationBiometricMethod distributeBiometricFeedback:](v14, "distributeBiometricFeedback:", v15);
            break;
          default:
            LA_LOG_laabio();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              -[LAAuthenticationBiometricMethod event:params:reply:].cold.3();
LABEL_37:

            break;
        }
      }
      goto LABEL_40;
    }
    if (a3 == 12)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E7087FC0);
      v13 = objc_claimAutoreleasedReturnValue();
      v12 = v13;
      if (v13)
      {
        switch(-[NSObject integerValue](v13, "integerValue"))
        {
          case 1:
            v14 = self;
            v15 = 12;
            goto LABEL_39;
          case 2:
            v14 = self;
            v15 = 0;
            goto LABEL_39;
          case 3:
            v14 = self;
            v15 = 1;
            goto LABEL_39;
          case 4:
            v14 = self;
            v15 = 2;
            goto LABEL_39;
          case 5:
            v14 = self;
            v15 = 3;
            goto LABEL_39;
          case 6:
            v14 = self;
            v15 = 4;
            goto LABEL_39;
          case 7:
          case 11:
            v14 = self;
            v15 = 5;
            goto LABEL_39;
          case 8:
            v14 = self;
            v15 = 6;
            goto LABEL_39;
          case 9:
            v14 = self;
            v15 = 7;
            goto LABEL_39;
          case 10:
            v14 = self;
            v15 = 8;
            goto LABEL_39;
          case 12:
            v14 = self;
            v15 = 10;
            goto LABEL_39;
          case 13:
            v14 = self;
            v15 = 11;
            goto LABEL_39;
          default:
            LA_LOG_laabio();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              -[LAAuthenticationBiometricMethod event:params:reply:].cold.4();
            goto LABEL_37;
        }
      }
      goto LABEL_40;
    }
    goto LABEL_17;
  }
  if (!a3)
    goto LABEL_41;
  if (a3 != 1)
  {
LABEL_17:
    LA_LOG_laabio();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[LAAuthenticationBiometricMethod event:params:reply:].cold.1();
    goto LABEL_40;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E7087F90);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    switch(-[NSObject integerValue](v11, "integerValue"))
    {
      case 0:
        goto LABEL_16;
      case 1:
        goto LABEL_19;
      case 2:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
        break;
      case 3:
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __54__LAAuthenticationBiometricMethod_event_params_reply___block_invoke;
        v21[3] = &unk_1E707A270;
        v21[4] = self;
        -[LAAuthenticationMethod forEachObserverWithProtocol:selector:invoke:](self, "forEachObserverWithProtocol:selector:invoke:", &unk_1EF235100, sel_authenticationBiometricsMethodDidReceiveNoMatch_, v21);
        break;
      default:
        LA_LOG_laabio();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[LAAuthenticationBiometricMethod event:params:reply:].cold.2();
        goto LABEL_37;
    }
  }
LABEL_40:

LABEL_41:
  -[LAAuthenticationBiometricMethod currentState](self, "currentState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isUserPresent");

  if ((_DWORD)v10 != v19)
  {
    -[LAAuthenticationBiometricMethod currentState](self, "currentState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIsUserPresent:", v10);

    -[LAAuthenticationBiometricMethod distributeStateChange](self, "distributeStateChange");
  }

}

uint64_t __54__LAAuthenticationBiometricMethod_event_params_reply___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "authenticationBiometricsMethodDidReceiveNoMatch:", *(_QWORD *)(a1 + 32));
}

- (void)terminate
{
  void *v3;
  objc_super v4;

  -[LAAuthenticationBiometricMethod context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)LAAuthenticationBiometricMethod;
  -[LAAuthenticationMethod terminate](&v4, sel_terminate);
}

- (BOOL)isDevicePresent
{
  return self->_isDevicePresent;
}

- (BOOL)isEnrolled
{
  return self->_isEnrolled;
}

- (BOOL)isAllowed
{
  return self->_isAllowed;
}

- (LAContext)context
{
  return self->_context;
}

- (LAAuthenticationBiometricMethodState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithConfiguration:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B971E000, log, OS_LOG_TYPE_DEBUG, "initial evaluatePolicy succeeded", v1, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithConfiguration:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B971E000, a2, a3, "initial evaluatePolicy failed, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B971E000, a2, a3, "evaluatePolicy finished with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

void __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B971E000, a2, a3, "evaluatePolicy finished with result: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)event:params:reply:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B971E000, v0, v1, "unhandled bioevent: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)event:params:reply:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B971E000, v0, v1, "unknown LATouchIDSimpleStatus %d received, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)event:params:reply:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B971E000, v0, v1, "unknown LAEventParamPearlSimpleStatus %d received, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)event:params:reply:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B971E000, v0, v1, "unknown LAEventParamCoachingFeedback %d received, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)event:params:reply:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1B971E000, v1, OS_LOG_TYPE_DEBUG, "got bio event: %d (%@)", v2, 0x12u);
  OUTLINED_FUNCTION_4_0();
}

@end
