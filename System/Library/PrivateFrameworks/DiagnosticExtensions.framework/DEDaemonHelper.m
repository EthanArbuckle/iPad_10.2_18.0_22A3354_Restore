@implementation DEDaemonHelper

+ (id)generateSandboxExtensionWithDestinationDir:(id)a3 pingTarget:(id)a4
{
  id v5;
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  intptr_t (*v38)(uint64_t, int);
  void *v39;
  NSObject *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;

  v5 = a3;
  v6 = a4;
  v7 = dispatch_semaphore_create(0);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = MEMORY[0x1E0C809B0];
  v37 = 3221225472;
  v38 = __72__DEDaemonHelper_generateSandboxExtensionWithDestinationDir_pingTarget___block_invoke;
  v39 = &unk_1E4E35708;
  v41 = &v42;
  v8 = v7;
  v40 = v8;
  objc_msgSend(v6, "ping:", &v36);
  v9 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    Log_1();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[DEDaemonHelper generateSandboxExtensionWithDestinationDir:pingTarget:].cold.3(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  else if (*((_DWORD *)v43 + 6))
  {
    objc_msgSend(v5, "generateSandboxExtensionForProcess:", v36, v37, v38, v39);
    v20 = objc_claimAutoreleasedReturnValue();
    v10 = v20;
    if (v20 && -[NSObject length](v20, "length"))
    {
      v10 = v10;
      v18 = v10;
      goto LABEL_5;
    }
    Log_1();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[DEDaemonHelper generateSandboxExtensionWithDestinationDir:pingTarget:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);

  }
  else
  {
    Log_1();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[DEDaemonHelper generateSandboxExtensionWithDestinationDir:pingTarget:].cold.1(v10, v29, v30, v31, v32, v33, v34, v35);
  }
  v18 = 0;
LABEL_5:

  _Block_object_dispose(&v42, 8);
  return v18;
}

intptr_t __72__DEDaemonHelper_generateSandboxExtensionWithDestinationDir_pingTarget___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)generateSandboxExtensionWithDestinationDir:(uint64_t)a3 pingTarget:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4EEE000, a1, a3, "Failed to get helper pid", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

+ (void)generateSandboxExtensionWithDestinationDir:(uint64_t)a3 pingTarget:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4EEE000, a1, a3, "Failed to generate sandbox extension", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

+ (void)generateSandboxExtensionWithDestinationDir:(uint64_t)a3 pingTarget:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4EEE000, a1, a3, "pingSemaphore timed out.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
