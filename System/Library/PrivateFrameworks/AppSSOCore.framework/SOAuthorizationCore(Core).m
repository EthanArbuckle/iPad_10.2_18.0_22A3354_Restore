@implementation SOAuthorizationCore(Core)

- (void)beginAuthorizationWithRequestParameters:()Core completion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7[6];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315650;
  OUTLINED_FUNCTION_6_0();
  v8 = a2;
  OUTLINED_FUNCTION_5(&dword_1CF39B000, a3, v6, "%s requestIdentifier = %{public}@ on %@", (uint8_t *)v7);

}

- (void)performBlockOnDelegateQueue:()Core .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(const __CFString **)(a1 + 40);
  v5 = "-[SOAuthorizationCore(Core) performBlockOnDelegateQueue:]";
  v4 = 136315650;
  if (!v3)
    v3 = CFSTR("main_queue");
  v6 = 2114;
  v7 = v3;
  v8 = 2112;
  v9 = a1;
  OUTLINED_FUNCTION_5(&dword_1CF39B000, a2, a3, "%s queue = %{public}@ on %@", (uint8_t *)&v4);
}

- (void)finishAuthorization:()Core completion:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SOAuthorizationCore(Core) finishAuthorization:completion:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1CF39B000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)createSecKeysFromSecKeyProxyEndpoints:()Core error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CF39B000, a2, a3, "failed to create SecKey from SecKeyProxyEndpoint: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createSecKeysFromSecKeyProxyEndpoints:()Core error:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  int v2[6];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_6_0();
  v3 = v0;
  OUTLINED_FUNCTION_5(&dword_1CF39B000, v1, (uint64_t)v1, "%s %{public}@ on %@", (uint8_t *)v2);
}

@end
