@implementation _EXRunningUIExtension(_UIViewServiceSessionManagerDelegate)

- (void)viewServiceSessionManager:()_UIViewServiceSessionManagerDelegate didCreateViewController:contextToken:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_20AE73000, a2, OS_LOG_TYPE_ERROR, "Session is not found for %{public}@ context token", (uint8_t *)&v2, 0xCu);
}

- (void)viewServiceSessionManager:()_UIViewServiceSessionManagerDelegate didCreateViewController:contextToken:.cold.2(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  _DWORD v7[7];
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136316162;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  v7[6] = 88;
  v8 = 2114;
  v9 = a1;
  v10 = 2114;
  v11 = v6;

}

- (void)viewServiceSessionManager:()_UIViewServiceSessionManagerDelegate didCreateViewController:contextToken:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  _DWORD v5[7];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  v5[0] = 136315906;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1();
  v5[6] = 84;
  v6 = 2114;
  v7 = v3;
  OUTLINED_FUNCTION_3();
}

- (void)viewServiceSessionManager:()_UIViewServiceSessionManagerDelegate didCreateViewController:contextToken:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "Received UI session root view controller from UIKit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)installRunloopObserverToPingLaunchdAfterEvent
{
  __assert_rtn("-[_EXRunningUIExtension(_UIViewServiceSessionManagerDelegate) installRunloopObserverToPingLaunchdAfterEvent]", "EXRunningUIExtension.m", 130, "mainRunLoop != NULL");
}

@end
