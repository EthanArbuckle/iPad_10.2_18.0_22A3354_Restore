@implementation ERLogging

+ (void)log:(id)a3 withType:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (log_withType__onceToken != -1)
    dispatch_once(&log_withType__onceToken, &__block_literal_global_0);
  switch(a4)
  {
    case 1uLL:
      v6 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_ERROR))
        +[ERLogging log:withType:].cold.1((uint64_t)v5, v6);
      break;
    case 2uLL:
      v10 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_INFO))
      {
        v13 = 138543362;
        v14 = v5;
        v8 = v10;
        v9 = OS_LOG_TYPE_INFO;
        goto LABEL_10;
      }
      break;
    case 3uLL:
      v11 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_DEBUG))
        +[ERLogging log:withType:].cold.2((uint64_t)v5, v11);
      break;
    case 4uLL:
      v12 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_FAULT))
        +[ERLogging log:withType:].cold.3((uint64_t)v5, v12);
      break;
    default:
      v7 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = v5;
        v8 = v7;
        v9 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl(&dword_23A958000, v8, v9, "%{public}@", (uint8_t *)&v13, 0xCu);
      }
      break;
  }

}

void __26__ERLogging_log_withType___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.eyerelief", "EyeRelief");
  v1 = (void *)osLogHandle;
  osLogHandle = (uint64_t)v0;

}

+ (void)log:(uint64_t)a1 withType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_23A958000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

+ (void)log:(uint64_t)a1 withType:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_23A958000, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

+ (void)log:(uint64_t)a1 withType:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_23A958000, a2, OS_LOG_TYPE_FAULT, "%{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0();
}

@end
