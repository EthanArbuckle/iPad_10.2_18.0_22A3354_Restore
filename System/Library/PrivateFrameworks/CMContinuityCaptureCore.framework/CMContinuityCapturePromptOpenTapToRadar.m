@implementation CMContinuityCapturePromptOpenTapToRadar

void __CMContinuityCapturePromptOpenTapToRadar_block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  CFOptionFlags v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CFOptionFlags responseFlags;
  uint8_t buf[4];
  CFOptionFlags v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 48), 0.0, &responseFlags);
  CMContinuityCaptureLog(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = responseFlags;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "Response Flags: %ld", buf, 0xCu);
  }

  if (!responseFlags)
  {
    CMContinuityCaptureLog(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v4;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "Opening Tap-to-Radar! Title: \"%@\", Description: \"%@\", buf, 0x16u);
    }

    v6 = (void *)MGCopyAnswer();
    v7 = (void *)MGCopyAnswer();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@: %@"), v6, v7, *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v9, "setScheme:", CFSTR("tap-to-radar"));
    objc_msgSend(v9, "setHost:", CFSTR("new"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Title"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Description"), *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Continuity Camera (New Bugs)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("all"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("1576972"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v15);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Serious Bug"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v17);

    objc_msgSend(v9, "setQueryItems:", v10);
    objc_msgSend(v9, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "openURL:configuration:completionHandler:", v18, 0, &__block_literal_global_198);

    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __CMContinuityCapturePromptOpenTapToRadar_block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  CMContinuityCaptureLog(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "Open Tap-to-Radar result: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __CMContinuityCapturePromptOpenTapToRadar_block_invoke_196_cold_1((uint64_t)v5, v7);
  }

}

void __CMContinuityCapturePromptOpenTapToRadar_block_invoke_196_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_227C5D000, a2, OS_LOG_TYPE_ERROR, "Error opening Tap-To-Radar URL: %@", (uint8_t *)&v2, 0xCu);
}

@end
