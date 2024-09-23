@implementation WFConfigureAudioRoutesForUserInterface

void __WFConfigureAudioRoutesForUserInterface_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    getWFIntentExecutionLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "WFConfigureAudioRoutesForUserInterface_block_invoke";
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_ERROR, "%s Failed to set AirPlay output device: %{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
