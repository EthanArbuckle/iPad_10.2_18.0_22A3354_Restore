@implementation BiometricKitUIEnrollViewController

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *properties;

  v6 = a3;
  v7 = a4;
  if (!self->_properties)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    properties = self->_properties;
    self->_properties = v8;

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[BiometricKitUIEnrollViewController setProperty:forKey:].cold.1();
  -[NSMutableDictionary setValue:forKey:](self->_properties, "setValue:forKey:", v6, v7);

}

- (id)propertyForKey:(id)a3
{
  id v4;
  NSMutableDictionary *properties;
  void *v6;

  v4 = a3;
  properties = self->_properties;
  if (properties)
  {
    -[NSMutableDictionary valueForKey:](properties, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[BiometricKitUIEnrollViewController propertyForKey:].cold.1();

  return v6;
}

- (void)startEnroll
{
  __assert_rtn("-[BiometricKitUIEnrollViewController startEnroll]", "BiometricKitUIEnrollViewController.m", 34, "0");
}

- (void)startEnrollOperation
{
  __assert_rtn("-[BiometricKitUIEnrollViewController startEnrollOperation]", "BiometricKitUIEnrollViewController.m", 38, "0");
}

- (void)cancelEnroll
{
  __assert_rtn("-[BiometricKitUIEnrollViewController cancelEnroll]", "BiometricKitUIEnrollViewController.m", 42, "0");
}

- (void)restartEnroll
{
  __assert_rtn("-[BiometricKitUIEnrollViewController restartEnroll]", "BiometricKitUIEnrollViewController.m", 46, "0");
}

- (BiometricKit)biometricKit
{
  return self->_biometricKit;
}

- (void)setBiometricKit:(id)a3
{
  objc_storeStrong((id *)&self->_biometricKit, a3);
}

- (BiometricKitUIEnrollResultDelegate)delegate
{
  return (BiometricKitUIEnrollResultDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_biometricKit, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (void)setProperty:forKey:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1DB281000, MEMORY[0x1E0C81028], v0, "BiometricKitUI: Set new property key: \"%@\" value: \"%@\", v1, v2, v3, v4, v5);
}

- (void)propertyForKey:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1DB281000, MEMORY[0x1E0C81028], v0, "BiometricKitUI: Property value: \"%@\" of key: \"%@\", v1, v2, v3, v4, v5);
}

@end
