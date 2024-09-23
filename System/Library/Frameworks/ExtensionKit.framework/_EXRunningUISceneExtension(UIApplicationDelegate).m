@implementation _EXRunningUISceneExtension(UIApplicationDelegate)

- (void)applicationWillResignActive:()UIApplicationDelegate .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = "-[_EXRunningUISceneExtension(UIApplicationDelegate) applicationWillResignActive:]";
  OUTLINED_FUNCTION_0_0(&dword_20AE73000, a1, a3, "Received: %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

- (void)applicationDidBecomeActive:()UIApplicationDelegate .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = "-[_EXRunningUISceneExtension(UIApplicationDelegate) applicationDidBecomeActive:]";
  OUTLINED_FUNCTION_0_0(&dword_20AE73000, a1, a3, "Received: %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

- (void)application:()UIApplicationDelegate configurationForConnectingSceneSession:options:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sourceApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_20AE73000, a2, v4, "Received scene connection request from host: %{public}@", (uint8_t *)&v5);

}

- (void)application:()UIApplicationDelegate configurationForConnectingSceneSession:options:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = "-[_EXRunningUISceneExtension(UIApplicationDelegate) application:configurationForConnectingSceneSession:options:]";
  OUTLINED_FUNCTION_0_0(&dword_20AE73000, a1, a3, "%{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

@end
