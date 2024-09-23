@implementation FSClientTaskUpdateHandler

- (void)taskStatusUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  FSClientTaskUpdateHandler *v6;
  void (**v7)(void *, id, _QWORD);
  NSObject *v8;

  v4 = a3;
  fskit_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FSClientTaskUpdateHandler taskStatusUpdate:].cold.2(v4);

  v6 = self;
  objc_sync_enter(v6);
  v7 = (void (**)(void *, id, _QWORD))_Block_copy(v6->_taskHandler);
  objc_sync_exit(v6);

  if (v7)
    v7[2](v7, v4, 0);
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FSClientTaskUpdateHandler taskStatusUpdate:].cold.1(v4);

}

- (id)taskHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setTaskHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskHandler, 0);
}

- (void)taskStatusUpdate:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "taskID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_23B2A6000, v2, v3, "%s:end:taskID(%@):taskState(%d)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_17();
}

- (void)taskStatusUpdate:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "taskID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_23B2A6000, v2, v3, "%s:start:taskID(%@):taskState(%d)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_17();
}

@end
