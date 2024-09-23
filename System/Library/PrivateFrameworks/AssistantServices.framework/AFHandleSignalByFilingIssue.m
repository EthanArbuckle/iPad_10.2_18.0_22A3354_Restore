@implementation AFHandleSignalByFilingIssue

void ___AFHandleSignalByFilingIssue_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  int v6;
  const char *v7;
  __int16 v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id)AFSiriLogContextUtility;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (v3)
    {
      objc_msgSend(v3, "description");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("no error");
    }
    v6 = 136315394;
    v7 = "_AFHandleSignalByFilingIssue_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Filed a radar, result: %@", (uint8_t *)&v6, 0x16u);
    if (v3)

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
