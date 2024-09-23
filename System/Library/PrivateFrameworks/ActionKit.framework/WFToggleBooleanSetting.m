@implementation WFToggleBooleanSetting

void __WFToggleBooleanSetting_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    getWFBundledIntentsLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v16 = "WFToggleBooleanSetting_block_invoke";
      v17 = 2114;
      v18 = v7;
      v19 = 2112;
      v20[0] = v5;
      _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_ERROR, "%s Failed to get state for toggling %{public}@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    getWFBundledIntentsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v16 = "WFToggleBooleanSetting_block_invoke";
      v17 = 2114;
      v18 = v9;
      v19 = 1024;
      LODWORD(v20[0]) = a2;
      WORD2(v20[0]) = 1024;
      *(_DWORD *)((char *)v20 + 6) = a2 ^ 1;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s Toggling %{public}@ from %d to %d", buf, 0x22u);
    }

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __WFToggleBooleanSetting_block_invoke_148;
    v11[3] = &unk_24F8B6D28;
    v10 = *(void **)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    v14 = a2 ^ 1;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v10, "setState:completionHandler:", a2 ^ 1u, v11);

  }
}

void __WFToggleBooleanSetting_block_invoke_148(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  void (*v7)(void);
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    getWFBundledIntentsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(unsigned __int8 *)(a1 + 48);
      v8 = 136315906;
      v9 = "WFToggleBooleanSetting_block_invoke";
      v10 = 2114;
      v11 = v5;
      v12 = 1024;
      v13 = v6;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_ERROR, "%s Failed to toggle %{public}@ to %d: %@", (uint8_t *)&v8, 0x26u);
    }

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v7();

}

@end
