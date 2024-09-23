@implementation LSApplicationRecord(Intents2)

- (id)in2_supportedIntents
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "applicationExtensionRecords");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "if_objectsPassingTest:", &__block_literal_global_131_12574);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(a1, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v6, "hasPrefix:", *MEMORY[0x24BDD9A28]);

  if ((v3 & 1) != 0)
  {
    v7 = CFSTR("com.apple.WorkflowKit.ShortcutsIntents");
  }
  else
  {
    objc_msgSend(a1, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.mobiletimer"));

    if (!v9)
      goto LABEL_6;
    v7 = CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents");
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v7, 0);
  objc_msgSend(v5, "if_addObjectIfNonNil:", v10);

LABEL_6:
  objc_msgSend(MEMORY[0x24BDBCEF0], "set", a1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    v16 = *MEMORY[0x24BDD98C8];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v18, "if_extensionAttributesDictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "count"))
        {
          objc_msgSend(v18, "extensionPointRecord");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, v22);

          objc_msgSend(v29, "addObjectsFromArray:", v20);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v14);
  }

  v24 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v28, "supportedIntents");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "unionSet:", v29);
  return v26;
}

@end
