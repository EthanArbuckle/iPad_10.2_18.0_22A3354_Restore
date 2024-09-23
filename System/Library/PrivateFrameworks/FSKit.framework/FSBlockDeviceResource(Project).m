@implementation FSBlockDeviceResource(Project)

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: Can't create dispatch queue for IOKit notifications", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9_0(&dword_23B2A6000, v0, v1, "%s: failed to get IOKit media for %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s: Added IOKit notification callback sucessfully", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.5()
{
  int v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_1_0();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_23B2A6000, v1, OS_LOG_TYPE_ERROR, "%s: failed to get IOKit notification for %@ err (%d)", (uint8_t *)v2, 0x1Cu);
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s: Setting dispatch queue (%@) for notification port", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:bsdName:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)startUsingResource:()Project .cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  v7 = 136315650;
  v8 = "-[FSBlockDeviceResource(Project) startUsingResource:]";
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl(&dword_23B2A6000, a3, OS_LOG_TYPE_DEBUG, "%s: started using %@ purpose %@", (uint8_t *)&v7, 0x20u);

}

- (void)startUsingResource:()Project .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_23B2A6000, v0, v1, "%s: failed to register fd with kernel. status: %d.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startUsingResource:()Project .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: default client of isn't from type LiveFSServiceUserClient", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)startUsingResource:()Project .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s: resource already in use by (%@)", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)stopUsingResource:()Project .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s: we didn't start using the resource, so no need to stop using it", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)stopUsingResource:()Project .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s: stopped using %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

- (void)stopUsingResource:()Project .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_23B2A6000, v0, v1, "%s: failed to unregister fd with kernel. status: %d.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)stopUsingResource:()Project .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: default client of isn't from type LiveFSServiceUserClient", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)stopUsingResource:()Project .cold.5()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_18();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_23B2A6000, v2, OS_LOG_TYPE_ERROR, "%s: resource used by purpose (%@) can't stop using resource with given purpose (%@)", (uint8_t *)v3, 0x20u);
}

@end
