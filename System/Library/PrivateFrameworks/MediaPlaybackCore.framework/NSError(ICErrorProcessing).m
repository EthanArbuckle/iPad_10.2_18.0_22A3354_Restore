@implementation NSError(ICErrorProcessing)

+ (id)errorForICError:()ICErrorProcessing response:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  int v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "conformsToProtocol:", &unk_254AEBFB0) & 1) != 0)
  {
    objc_msgSend(v7, "serverError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "domain");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "code");
      objc_msgSend(v6, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");
      v14 = v13;
      if (v13)
        v15 = v13;
      else
        v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v17 = v15;

      objc_msgSend(v7, "dialog");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "responseDictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "count"))
        objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("MPCErrorUserInfoKeyStoreDialogDictionary"));
      if (objc_msgSend(a1, "_isAgeVerificationError:", v9))
      {
        v20 = CFSTR("MPCError");

        objc_msgSend(v17, "removeObjectForKey:", CFSTR("MPCErrorUserInfoKeyStoreDialogDictionary"));
        v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x24BEC8668]);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          v24 = CFSTR("Unspecified explanation");
          if (v22)
            v24 = (const __CFString *)v22;
          v26 = 138543362;
          v27 = v24;
          _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_ERROR, "Playback failed due to age verification requirement: %{public}@", (uint8_t *)&v26, 0xCu);

        }
        v10 = CFSTR("MPCError");
        v11 = 40;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v10, v11, v17);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = v6;
    }

  }
  else
  {
    v16 = v6;
  }

  return v16;
}

+ (BOOL)_isAgeVerificationError:()ICErrorProcessing
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL8 v7;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BEC86C0];

  v6 = objc_msgSend(v3, "code") == 3770 || objc_msgSend(v3, "code") == 3771 || objc_msgSend(v3, "code") == 3772;
  v7 = v4 == v5 && v6;

  return v7;
}

@end
