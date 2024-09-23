@implementation MDMOptionsUtilities

+ (id)validatedMDMOptionsFromOptionsDictionary:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (validatedMDMOptionsFromOptionsDictionary__onceToken != -1)
    dispatch_once(&validatedMDMOptionsFromOptionsDictionary__onceToken, &__block_literal_global_5);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)validatedMDMOptionsFromOptionsDictionary__validKeysAndClasses;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend((id)validatedMDMOptionsFromOptionsDictionary__validKeysAndClasses, "objectForKeyedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v9);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v14;
}

void __64__MDMOptionsUtilities_validatedMDMOptionsFromOptionsDictionary___block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("ActivationLockAllowedWhileSupervised");
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)validatedMDMOptionsFromOptionsDictionary__validKeysAndClasses;
  validatedMDMOptionsFromOptionsDictionary__validKeysAndClasses = v0;

}

+ (id)defaultMDMOptions
{
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("DefaultMDMOptions"), CFSTR("com.apple.devicemanagementclient.notbackedup"));
}

+ (void)setDefaultMDMOptions:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("DefaultMDMOptions"), a3, CFSTR("com.apple.devicemanagementclient.notbackedup"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.devicemanagementclient.notbackedup"));
}

@end
