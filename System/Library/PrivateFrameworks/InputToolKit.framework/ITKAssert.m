@implementation ITKAssert

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 alertMessage:(id)a7 format:(id)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  objc_class *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 isInternalBuild;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;

  v8 = a6;
  v9 = a5;
  v41 = *MEMORY[0x24BDAC8D0];
  v12 = (objc_class *)MEMORY[0x24BDD17C8];
  v13 = a8;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &v42);

  v15 = os_log_create("com.apple.VisionKit", "Assert");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v36 = a3;
    v37 = 2080;
    v38 = a4;
    v39 = 2112;
    v40 = v14;
    _os_log_error_impl(&dword_23F0CB000, v15, OS_LOG_TYPE_ERROR, "Failed assertion (%s) in %s: %@", buf, 0x20u);
  }

  if (v9)
  {
    v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      +[ITKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:].cold.1((uint64_t)v14, v16, v17, v18, v19, v20, v21, v22);

  }
  if (v8)
  {
    isInternalBuild = itk_isInternalBuild();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "environment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("SuppressAssertionAlerts"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    if (isInternalBuild && (v27 & 1) == 0 && !v9)
    {
      v28 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        +[ITKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:].cold.1((uint64_t)v14, v28, v29, v30, v31, v32, v33, v34);

    }
  }

}

+ (void)handleFailedAssertWithCondition:(const char *)a3 functionName:(const char *)a4 simulateCrash:(BOOL)a5 showAlert:(BOOL)a6 format:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  objc_class *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v7 = a6;
  v8 = a5;
  v12 = (objc_class *)MEMORY[0x24BDD17C8];
  v13 = a7;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithFormat:arguments:", v13, &v15);

  objc_msgSend(a1, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:", a3, a4, v8, v7, CFSTR("You encountered a serious bug in Notes. Will you please file a Radar?"), CFSTR("%@"), v14);
}

+ (void)handleFailedAssertWithCondition:(uint64_t)a3 functionName:(uint64_t)a4 simulateCrash:(uint64_t)a5 showAlert:(uint64_t)a6 alertMessage:(uint64_t)a7 format:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23F0CB000, a2, a3, "%@", a5, a6, a7, a8, 2u);
}

@end
