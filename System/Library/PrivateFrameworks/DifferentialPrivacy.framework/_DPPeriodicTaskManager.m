@implementation _DPPeriodicTaskManager

+ (void)registerTask:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  _QWORD handler[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_DPLog framework](_DPLog, "framework");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1D3FAA000, v4, OS_LOG_TYPE_INFO, "Registered CTS task %@", buf, 0xCu);

  }
  objc_msgSend(v3, "name");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  v8 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __39___DPPeriodicTaskManager_registerTask___block_invoke;
  handler[3] = &unk_1E95D8FC0;
  v11 = v3;
  v9 = v3;
  xpc_activity_register(v7, v8, handler);

}

+ (void)unregisterTask:(id)a3
{
  id v3;

  objc_msgSend(a3, "name");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_activity_unregister((const char *)objc_msgSend(v3, "UTF8String"));

}

@end
