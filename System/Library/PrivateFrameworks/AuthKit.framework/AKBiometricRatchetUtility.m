@implementation AKBiometricRatchetUtility

+ (id)stateFromLARatchetState:(id)a3
{
  id v3;
  double v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  double v15;
  AKRatchetStateData *v16;
  AKRatchetState *v17;

  v3 = a3;
  v4 = 0.0;
  switch(objc_msgSend(v3, "rawValue"))
  {
    case 0:
    case 1:
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      v7 = 1;
      if ((v6 & 1) != 0)
        goto LABEL_10;
      break;
    case 2:
      objc_msgSend(v3, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      v7 = 2;
      if ((v9 & 1) != 0)
        goto LABEL_10;
      break;
    case 3:
      objc_msgSend(v3, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      v7 = 3;
      if ((v11 & 1) != 0)
        goto LABEL_10;
      break;
    case 4:
      objc_msgSend(v3, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      v7 = 4;
      if ((v13 & 1) != 0)
      {
LABEL_10:
        objc_msgSend(v3, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "duration");
        v4 = v15;

      }
      break;
    default:
      v7 = 0;
      break;
  }
  v16 = -[AKRatchetStateData initWithDuration:]([AKRatchetStateData alloc], "initWithDuration:", v4);
  v17 = -[AKRatchetState initWithRawState:data:]([AKRatchetState alloc], "initWithRawState:data:", v7, v16);

  return v17;
}

+ (unint64_t)armingMethodFromRatchetResult:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E2E9A3A0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E2E9A3B8);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v8 = 3;
  }
  else if (objc_msgSend(v7, "BOOLValue"))
  {
    v8 = 2;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)ratchetIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("AKBiometricRatchetIdentifierKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF0ED0], "bundleIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (void)setRatchetIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  const __CFString *v5;

  v3 = a3;
  _AKLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[AKBiometricRatchetUtility setRatchetIdentifier:].cold.1(v4);

  v5 = (const __CFString *)*MEMORY[0x1E0C9B228];
  CFPreferencesSetAppValue(CFSTR("AKBiometricRatchetIdentifierKey"), v3, (CFStringRef)*MEMORY[0x1E0C9B228]);

  CFPreferencesSynchronize(v5, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

+ (id)resultForSuccessfulArmingFromResponse:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  AKBiometricRatchetResult *v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E2E9A3D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[AKBiometricRatchetUtility resultForSuccessfulArmingFromResponse:].cold.1((uint64_t)v4, v5);

  v6 = +[AKBiometricRatchetUtility armingMethodFromRatchetResult:](AKBiometricRatchetUtility, "armingMethodFromRatchetResult:", v3);
  +[AKBiometricRatchetUtility stateFromLARatchetState:](AKBiometricRatchetUtility, "stateFromLARatchetState:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AKBiometricRatchetResult initWithRatchetState:armingMethod:]([AKBiometricRatchetResult alloc], "initWithRatchetState:armingMethod:", v7, v6);

  return v8;
}

+ (id)resultForNonArmingFromError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  AKBiometricRatchetResult *v8;
  NSObject *v10;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CC1288]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _AKLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[AKBiometricRatchetUtility resultForNonArmingFromError:].cold.2((uint64_t)v3, (uint64_t)v5, v6);

  if (objc_msgSend(v3, "code") || !v5)
  {
    if (objc_msgSend(v3, "code") == 3)
    {
      _AKLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        +[AKBiometricRatchetUtility resultForNonArmingFromError:].cold.1(v10);

      exit(0);
    }
    v8 = 0;
  }
  else
  {
    +[AKBiometricRatchetUtility stateFromLARatchetState:](AKBiometricRatchetUtility, "stateFromLARatchetState:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AKBiometricRatchetResult initWithRatchetState:armingMethod:]([AKBiometricRatchetResult alloc], "initWithRatchetState:armingMethod:", v7, 1);

  }
  return v8;
}

+ (void)setRatchetIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "+[AKBiometricRatchetUtility setRatchetIdentifier:]";
  v3 = 1024;
  v4 = 107;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "%s (%d) called", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

+ (void)resultForSuccessfulArmingFromResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "Ratchet is armed with state: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)resultForNonArmingFromError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "User selected Quick Exit, calling exit(0) on purpose", v1, 2u);
}

+ (void)resultForNonArmingFromError:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "Ratchet is not armed - error: %@, ratchet state: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
