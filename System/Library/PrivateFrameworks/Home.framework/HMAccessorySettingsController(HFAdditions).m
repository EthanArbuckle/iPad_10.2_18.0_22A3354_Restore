@implementation HMAccessorySettingsController(HFAdditions)

- (id)hf_updateAccessorySettingWithHomeIdentifier:()HFAdditions accessoryIdentifier:keyPath:settingValue:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "homeManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hf_homeWithIdentifier:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "hf_accessoryWithIdentifier:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hf_onboardSiriEndpointIfNeededWithSettingKeyPath:settingValue:", v12, v13);
  HFLogForCategory(0x25uLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v33 = v12;
    v34 = 2112;
    v35 = v11;
    v36 = 2112;
    v37 = v13;
    _os_log_debug_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEBUG, "Kicking off update for setting [%@] for accessoryID: [%@] with value [%@]", buf, 0x20u);
  }

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __131__HMAccessorySettingsController_HFAdditions__hf_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_settingValue___block_invoke;
  v27[3] = &unk_1EA72EDE8;
  v28 = v12;
  v29 = v11;
  v30 = v13;
  v20 = v14;
  v31 = v20;
  v21 = v13;
  v22 = v11;
  v23 = v12;
  objc_msgSend(a1, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:settingValue:completionHandler:", v10, v22, v23, v21, v27);
  v24 = v31;
  v25 = v20;

  return v25;
}

@end
