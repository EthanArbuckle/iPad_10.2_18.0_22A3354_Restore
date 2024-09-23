@implementation HMAccessoryNetworkProtectionGroup

uint64_t __81__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_networkConfigurationProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_networkConfigurationProfiles");
}

uint64_t __81__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_displayCurrentProtectionMode__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "currentProtectionMode"));
}

void __74__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_updateProtectionMode___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  HFLogForCategory(0x39uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138412546;
    v9 = WeakRetained;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Updating network protection group %@ to protectionMode %li", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(WeakRetained, "updateProtectionMode:completion:", *(_QWORD *)(a1 + 40), v4);
}

uint64_t __84__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_updateProtectionMode_forGroups___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_updateProtectionMode:", *(_QWORD *)(a1 + 32));
}

@end
