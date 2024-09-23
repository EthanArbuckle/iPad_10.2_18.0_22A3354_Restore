@implementation _LSCanOpenURLManager(PrivateSchemeChecking)

- (void)writeSchemesMap
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_182882000, v0, v1, "should not write schemes map in system lsd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

- (void)copySchemesMap
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_182882000, v0, OS_LOG_TYPE_ERROR, "Scheme mapping file appears to be corrupt, creating new file.", v1, 2u);
  OUTLINED_FUNCTION_33();
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_0(&dword_182882000, v0, v1, "should not query whether bundles can check schemes in system lsd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "LSTesting: app %@ has not asked about any schemes before %@, creating map and allowing");
  OUTLINED_FUNCTION_1();
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "LSTesting: app %@ has previously asked about %@, allowing");
  OUTLINED_FUNCTION_1();
}

- (void)legacy_isBundleID:()PrivateSchemeChecking bundleData:context:allowedToCheckScheme:error:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(*(_QWORD *)a2 + 40);
  OUTLINED_FUNCTION_1_0(&dword_182882000, a2, a3, "LSTesting: app %@ has exceeded their schemes quota. Schemes queried:\n%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

@end
