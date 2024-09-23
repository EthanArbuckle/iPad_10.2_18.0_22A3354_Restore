@implementation AAURLSessionConfigurationTask

void __71___AAURLSessionConfigurationTask__unfairLock_initiateConfigurationTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BYTE *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_BYTE **)(a1 + 32);
  if ((v6[20] & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_invokeCompletionWithData:response:error:", 0, 0, v7);

  }
  else if (v9)
  {
    objc_msgSend(v6, "_initiateSessionTaskWithConfiguration:");
  }
  else
  {
    if (v5)
      v8 = v5;
    else
      v8 = 0;
    objc_msgSend(v6, "_invokeCompletionWithData:response:error:", 0, 0, v8);
  }

}

void __72___AAURLSessionConfigurationTask__initiateSessionTaskWithConfiguration___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __72___AAURLSessionConfigurationTask__initiateSessionTaskWithConfiguration___block_invoke_cold_1(a1, (uint64_t)v9, v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "_invokeCompletionWithData:response:error:", v7, v8, v9);

}

void __41___AAURLSessionConfigurationTask_suspend__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (v3 || (v3 = *(void **)(v2 + 24)) != 0)
  {
    objc_msgSend(v3, "suspend");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("AAURLSessionConfigurationTask.m"), 139, CFSTR("Attempt to suspend inactive task!"));

  }
}

uint64_t __40___AAURLSessionConfigurationTask_resume__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = (void *)v1[4];
  if (v2)
    return objc_msgSend(v2, "resume");
  v2 = (void *)v1[3];
  if (v2)
    return objc_msgSend(v2, "resume");
  else
    return objc_msgSend(v1, "_unfairLock_initiateConfigurationTask");
}

__CFString *__45___AAURLSessionConfigurationTask_description__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  if (!v2)
  {
    v2 = *(void **)(v1 + 24);
    if (!v2)
      return CFSTR("< Inactive AAURLSessionConfigurationTask >");
  }
  objc_msgSend(v2, "description");
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void __72___AAURLSessionConfigurationTask__initiateSessionTaskWithConfiguration___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_19EACA000, log, OS_LOG_TYPE_ERROR, "_sessionTask %{public}@ completed with error:%@", (uint8_t *)&v4, 0x16u);
}

@end
