@implementation BLSHTailspinLogWriter

- (BLSHTailspinLogWriter)initWithReason:(id)a3
{
  id v4;
  BLSHTailspinLogWriter *v5;
  uint64_t v6;
  NSString *reason;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHTailspinLogWriter;
  v5 = -[BLSHTailspinLogWriter init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;

    if (initWithReason__onceToken != -1)
      dispatch_once(&initWithReason__onceToken, &__block_literal_global_19);
  }

  return v5;
}

void __40__BLSHTailspinLogWriter_initWithReason___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create_with_target_V2("com.apple.backlightservices.tailspinLogWriter", 0, v2);
  v1 = (void *)__queue;
  __queue = (uint64_t)v0;

}

- (id)_tailspinFilesDirectory
{
  return (id)objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter"), "stringByAppendingPathComponent:", *MEMORY[0x24BE0B7B8]);
}

+ (BOOL)isTailspinAvailable
{
  if (isTailspinAvailable_onceToken != -1)
    dispatch_once(&isTailspinAvailable_onceToken, &__block_literal_global_43);
  return isTailspinAvailable___tailspinAvailable;
}

void __44__BLSHTailspinLogWriter_isTailspinAvailable__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  isTailspinAvailable___tailspinAvailable = dlopen_preflight("/usr/lib/libtailspin.dylib");
  if ((isTailspinAvailable___tailspinAvailable & 1) == 0)
  {
    bls_diagnostics_log();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_2145AC000, v0, OS_LOG_TYPE_INFO, "dlopen_preflight failed - libtailspin is not available", v1, 2u);
    }

  }
}

- (void)writeTailspinLogWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id completion;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const char *v15;
  id v16;
  char v17;
  id v18;
  NSObject *v19;
  int v20;
  NSString *p_isa;
  unint64_t v22;
  const __CFString *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSString *v29;
  NSString *v30;
  BLSHTailspinLogWriter *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  NSString *v37;
  uint8_t buf[8];
  id v39;
  _QWORD v40[2];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self->_completion)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("can't call writeTailspinLogWithCompletion while we have a tailspin in flight"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHTailspinLogWriter writeTailspinLogWithCompletion:].cold.5(a2);
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145F90B8);
  }
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BLSHTailspinLogWriter requires a completion"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BLSHTailspinLogWriter writeTailspinLogWithCompletion:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x2145F9110);
  }
  v7 = (void *)objc_msgSend(v5, "copy");
  completion = self->_completion;
  self->_completion = v7;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bls_fileNameString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BacklightServices-%@.tailspin"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLSHTailspinLogWriter _tailspinFilesDirectory](self, "_tailspinFilesDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = objc_msgSend(v13, "cStringUsingEncoding:", 4);
  if (v14)
  {
    v15 = (const char *)v14;
    v16 = objc_alloc_init(MEMORY[0x24BDD1580]);
    v39 = 0;
    v17 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v39);
    v18 = v39;
    if ((v17 & 1) == 0)
    {
      bls_diagnostics_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[BLSHTailspinLogWriter writeTailspinLogWithCompletion:].cold.4((uint64_t)v12, (uint64_t)v18, v19);

    }
    v35 = v18;
    v20 = open(v15, 1538, 432);
    if (v20 < 0)
    {
      bls_diagnostics_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[BLSHTailspinLogWriter writeTailspinLogWithCompletion:].cold.3((uint64_t)v13, v20, v25);

      -[BLSHTailspinLogWriter _finish:](self, "_finish:", 0);
      goto LABEL_23;
    }
    v34 = v16;
    p_isa = self->_reason;
    v22 = -[NSString length](p_isa, "length");
    if (v22)
    {
      if (v22 < 0x8D)
      {
LABEL_20:
        v26 = *MEMORY[0x24BEDE420];
        v40[0] = *MEMORY[0x24BEDE410];
        v40[1] = v26;
        v41[0] = p_isa;
        v41[1] = MEMORY[0x24BDBD1C0];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        bls_diagnostics_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2145AC000, v28, OS_LOG_TYPE_DEFAULT, "dumping tailspin", buf, 2u);
        }

        v29 = self->_reason;
        v36 = v13;
        v37 = v29;
        v30 = v29;
        v31 = self;
        tailspin_dump_output_with_options();

        v16 = v34;
LABEL_23:

        goto LABEL_24;
      }
      -[NSString substringToIndex:](p_isa, "substringToIndex:", 139);
      v23 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = CFSTR("BLS Watchdog");
    }

    p_isa = &v23->isa;
    goto LABEL_20;
  }
  bls_diagnostics_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[BLSHTailspinLogWriter writeTailspinLogWithCompletion:].cold.2((uint64_t)v13, v24);

  -[BLSHTailspinLogWriter _finish:](self, "_finish:", 0);
LABEL_24:

}

void __56__BLSHTailspinLogWriter_writeTailspinLogWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = *(id *)(a1 + 32);
  bls_diagnostics_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_2145AC000, v6, OS_LOG_TYPE_DEFAULT, "Wrote tailspin file to path %{public}@ for reason \"%{public}@\", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __56__BLSHTailspinLogWriter_writeTailspinLogWithCompletion___block_invoke_cold_1(a1, v6, v9);
  }

  close(*(_DWORD *)(a1 + 56));
  objc_msgSend(v4, "_finish:", a2);

}

- (void)_finish:(BOOL)a3
{
  BSDispatchMain();
}

void __33__BLSHTailspinLogWriter__finish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)writeTailspinLogWithCompletion:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)writeTailspinLogWithCompletion:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2145AC000, a2, OS_LOG_TYPE_ERROR, "Could not get filepath for %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)writeTailspinLogWithCompletion:(os_log_t)log .cold.3(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_2145AC000, log, OS_LOG_TYPE_ERROR, "Failed to open file descriptor for diagnostics:%d, %{public}@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)writeTailspinLogWithCompletion:(NSObject *)a3 .cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_12(&dword_2145AC000, a3, (uint64_t)a3, "failed to create dir %@:%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)writeTailspinLogWithCompletion:(const char *)a1 .cold.5(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __56__BLSHTailspinLogWriter_writeTailspinLogWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  OUTLINED_FUNCTION_12(&dword_2145AC000, a2, a3, "Failed to write tailspin file to path %{public}@ for reason \"%{public}@\", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2();
}

@end
