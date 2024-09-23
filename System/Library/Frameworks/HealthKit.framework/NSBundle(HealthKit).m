@implementation NSBundle(HealthKit)

- (uint64_t)hk_localizedReadAuthorizationUsageDescription
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("NSHealthShareUsageDescription"));
}

- (uint64_t)hk_localizedWriteAuthorizationUsageDescription
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("NSHealthUpdateUsageDescription"));
}

- (uint64_t)hk_localizedClinicalReadAuthorizationUsageDescription
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("NSHealthClinicalHealthRecordsShareUsageDescription"));
}

- (uint64_t)hk_localizedResearchStudyUsageDescription
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("NSHealthResearchStudyUsageDescription"));
}

- (id)hk_extensionPointIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("NSExtension"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("NSExtensionPointIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)hk_displayName
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE88]);
}

- (uint64_t)hk_name
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE88]);
}

- (id)hk_findContainedBundleWithIdentifier:()HealthKit
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "URLsForResourcesWithExtension:subdirectory:", CFSTR("bundle"), 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

+ (id)hk_findContainedBundleWithIdentifier:()HealthKit directoryURL:
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, 0, 7, 0);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v20 = v7;
    v21 = v6;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v13, "pathExtension", v20, v21, (_QWORD)v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("bundle"));

        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v5);

          if ((v18 & 1) != 0)
            goto LABEL_12;

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
    v16 = 0;
LABEL_12:
    v7 = v20;
    v6 = v21;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
