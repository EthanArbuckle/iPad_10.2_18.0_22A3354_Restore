@implementation MCCommunicationServiceRulesUtilities

+ (id)validServiceTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AudioCall");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)validatedCommunicationServiceRules:(id)a3 outError:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v26;
  id *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  v33 = 0;
  objc_msgSend(v6, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", objc_opt_class(), CFSTR("DefaultServiceHandlers"), 0, &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v33;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v8)
  {

    v10 = 0;
  }
  else
  {
    v26 = v6;
    v27 = a4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(a1, "validServiceTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v19 = objc_opt_class();
          v28 = 0;
          objc_msgSend(v9, "MCValidateAndRemoveObjectOfClass:withKey:isRequired:outError:", v19, v18, 0, &v28);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v28;
          if (v21)
          {
            v8 = v21;

            v10 = 0;
            v11 = 0;
            v6 = v26;
            a4 = v27;
            goto LABEL_23;
          }
          if (v20)
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v15)
          continue;
        break;
      }
    }

    if (objc_msgSend(v9, "count"))
    {
      v22 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v37 = v9;
        _os_log_impl(&dword_19ECC4000, v22, OS_LOG_TYPE_ERROR, "The following communication service default handlers were not understood & ignored: %{public}@", buf, 0xCu);
      }
    }
    if (objc_msgSend(v12, "count"))
    {
      v34 = CFSTR("DefaultServiceHandlers");
      v35 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v6 = v26;

    a4 = v27;
    if (objc_msgSend(v10, "count"))
    {
      v10 = v10;
      v8 = 0;
      v11 = v10;
      goto LABEL_23;
    }
    v8 = 0;
  }
  v11 = 0;
LABEL_23:
  if (objc_msgSend(v6, "count"))
  {
    v23 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v6;
      _os_log_impl(&dword_19ECC4000, v23, OS_LOG_TYPE_ERROR, "The following communication service rules were not understood & ignored: %{public}@", buf, 0xCu);
    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);
  v24 = v11;

  return v24;
}

+ (id)restrictionsForValidatedCommunicationServiceRules:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKey:", CFSTR("DefaultServiceHandlers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("AudioCall"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MCSetUnionRestriction:values:", CFSTR("audioCallDefaultHandlerAppBundleIDs"), v8);

  }
  if (!objc_msgSend(v4, "count"))
  {

    v4 = 0;
  }

  return v4;
}

+ (id)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C8F2B8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountWithIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "communicationServiceRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DefaultServiceHandlers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
