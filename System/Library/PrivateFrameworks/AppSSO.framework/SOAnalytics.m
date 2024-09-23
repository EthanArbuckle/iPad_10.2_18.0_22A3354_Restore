@implementation SOAnalytics

+ (void)analyticsForMDMProfiles:(id)a3 reason:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v12 = v6;
        AnalyticsSendEventLazy();

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v10, 3221225472, __46__SOAnalytics_analyticsForMDMProfiles_reason___block_invoke, &unk_24C80CC58);
    }
    while (v8);
  }

}

id __46__SOAnalytics_analyticsForMDMProfiles_reason___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  _QWORD v29[8];

  v29[6] = *MEMORY[0x24BDAC8D0];
  v29[0] = *(_QWORD *)(a1 + 32);
  v28[0] = CFSTR("reason");
  v28[1] = CFSTR("type");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v2 = (void *)getSOFullProfileClass_softClass_0;
  v27 = getSOFullProfileClass_softClass_0;
  if (!getSOFullProfileClass_softClass_0)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __getSOFullProfileClass_block_invoke_0;
    v23[3] = &unk_24C80C0B8;
    v23[4] = &v24;
    __getSOFullProfileClass_block_invoke_0((uint64_t)v23);
    v2 = (void *)v25[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v24, 8);
  v5 = *(void **)(a1 + 40);
  v4 = (id *)(a1 + 40);
  objc_msgSend(v3, "stringWithProfileType:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v6;
  v28[2] = CFSTR("isKerberosExtension");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*v4, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.AppSSOKerberos.KerberosExtension")));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v9;
  v28[3] = CFSTR("authenticationMethod");
  objc_msgSend(*v4, "platformSSO");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AuthenticationMethod"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_24C80D4A8;
  if (v11)
    v13 = (const __CFString *)v11;
  v29[3] = v13;
  v28[4] = CFSTR("hasRegistrationToken");
  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*v4, "pssoRegistrationToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "length") != 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v16;
  v28[5] = CFSTR("sharedDeviceKeys");
  objc_msgSend(*v4, "platformSSO");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("UseSharedDeviceKeys"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = &unk_24C813070;
  if (v18)
    v20 = (void *)v18;
  v29[5] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

@end
