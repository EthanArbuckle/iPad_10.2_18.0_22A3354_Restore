@implementation HMAccessoryNetworkProtectionGroup(HFAdditions)

- (id)hf_networkConfigurationProfiles
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_flatMap:", &__block_literal_global_61);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_home
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_title
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;

  objc_msgSend(a1, "manufacturer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CBA1A8];
  objc_msgSend(a1, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_userFriendlyLocalizedCapitalizedDescription:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HFLocalizedStringWithFormat(CFSTR("HFNetworkProtectionTitleFormat"), CFSTR("%@ %@"), v6, v7, v8, v9, v10, v11, (uint64_t)v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)hf_displayCurrentProtectionMode
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "hf_networkConfigurationProfiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_9_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(&unk_1EA7CDD50, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(&unk_1EA7CDD50);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v3, "containsObject:", v8) & 1) != 0)
        {
          v12 = objc_msgSend(v8, "unsignedIntegerValue");
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(&unk_1EA7CDD50, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
  HFLogForCategory(0x39uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = a1;
    _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Invalid current protection mode for group %@", buf, 0xCu);
  }

  objc_msgSend(a1, "hf_networkConfigurationProfiles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "currentProtectionMode");

LABEL_13:
  return v12;
}

- (id)hf_updateProtectionMode:()HFAdditions
{
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8[2];
  id location;

  objc_initWeak(&location, val);
  v4 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_updateProtectionMode___block_invoke;
  v7[3] = &unk_1EA72E2D0;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  objc_msgSend(v4, "futureWithErrorOnlyHandlerAdapterBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  return v5;
}

+ (id)hf_updateProtectionMode:()HFAdditions forGroups:
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__HMAccessoryNetworkProtectionGroup_HFAdditions__hf_updateProtectionMode_forGroups___block_invoke;
  v9[3] = &__block_descriptor_40_e43__16__0__HMAccessoryNetworkProtectionGroup_8l;
  v9[4] = a3;
  objc_msgSend(a4, "na_map:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "combineAllFutures:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
