@implementation FCUIFocusSelectionFooterView

void __42___FCUIFocusSelectionFooterView__openURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  v5 = *MEMORY[0x24BE38320];
  v14[0] = *MEMORY[0x24BE38310];
  v14[1] = v5;
  v15[0] = MEMORY[0x24BDBD1C8];
  v15[1] = MEMORY[0x24BDBD1C8];
  v14[2] = *MEMORY[0x24BE382E0];
  v15[2] = CFSTR("FCUIAppLaunchOriginFocusSelectionViewController");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v2, "openSensitiveURL:withOptions:error:", v4, v6, &v11);
  v8 = v11;

  v9 = FCUILogSelection;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *v3;
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_214772000, v9, OS_LOG_TYPE_DEFAULT, "Launched URL %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_ERROR))
  {
    __42___FCUIFocusSelectionFooterView__openURL___block_invoke_cold_1(v3, (uint64_t)v8, v9);
  }

}

void __42___FCUIFocusSelectionFooterView__openURL___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_214772000, log, OS_LOG_TYPE_ERROR, "Failed to launch URL %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
