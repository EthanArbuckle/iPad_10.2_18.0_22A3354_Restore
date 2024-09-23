@implementation ObliterationDeleteAllApplets

void __ObliterationDeleteAllApplets_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const void **v6;
  id v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v7 = a2;
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      objc_msgSend(v5, "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9(3, "%s:%i %s", "ObliterationDeleteAllApplets_block_invoke", 32, (const char *)objc_msgSend(v10, "UTF8String"));

    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "description");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446722;
      v14 = "ObliterationDeleteAllApplets_block_invoke";
      v15 = 1024;
      v16 = 32;
      v17 = 2080;
      v18 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%{public}s:%i %s", buf, 0x1Cu);

    }
  }
  else
  {
    objc_msgSend(a2, "obliterate");
  }
  objc_msgSend(a2, "endSession");

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
