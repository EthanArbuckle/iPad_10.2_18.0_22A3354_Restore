@implementation HMDFetchedSettingsUtilities

+ (int64_t)_outputGenderFromString:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("m")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("f")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("n")) & 1) != 0)
  {
    v5 = 3;
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unknown gender option %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

+ (id)_outputGenderStringFromAFVoiceGender:(int64_t)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 1) < 3)
    return off_24E787110[a3 - 1];
  v5 = (void *)MEMORY[0x227676638](a1, a2);
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Unknown Voice Gender Value", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  return CFSTR("?");
}

+ (id)languageValueFromHPLanguageValue:(id)a3
{
  void *v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD7670];
  v4 = (objc_class *)MEMORY[0x24BDD7978];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "recognitionLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDFetchedSettingsUtilities _outputGenderStringFromAFVoiceGender:](HMDFetchedSettingsUtilities, "_outputGenderStringFromAFVoiceGender:", objc_msgSend(v5, "gender"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voiceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v6, "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v7, v8, v9, v10);
  objc_msgSend(v3, "cachedInstanceForLanguageSettingValue:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)transformHPLanguageItemsToLanguageListValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "na_map:", &__block_literal_global_130545);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Empty language item list", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

id __75__HMDFetchedSettingsUtilities_transformHPLanguageItemsToLanguageListValue___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HMDFetchedSettingsUtilities languageValueFromHPLanguageValue:](HMDFetchedSettingsUtilities, "languageValueFromHPLanguageValue:", a2);
}

@end
