@implementation HMAccessorySettingsController

void __131__HMAccessorySettingsController_HFAdditions__hf_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_settingValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory(0x25uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v12 = 138413058;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Error updating setting [%@] for accessoryID: [%@] with value [%@] with error: [%@]", (uint8_t *)&v12, 0x2Au);
    }

    objc_msgSend(*(id *)(a1 + 56), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "finishWithNoResult");
  }
  HFLogForCategory(0x25uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 48);
    v12 = 138412802;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_debug_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEBUG, "Finished update for setting [%@] for accessoryID: [%@] with value [%@]", (uint8_t *)&v12, 0x20u);
  }

}

@end
