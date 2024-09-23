@implementation DSUtilities

+ (id)localizedDetailStringWithTruncationFromArray:(id)a3 withType:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v7, "count") == 2)
        {
          v25[0] = v6;
          v25[1] = CFSTR("DETAIL_TEXT_TRUNCATION");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "componentsJoinedByString:", CFSTR("_"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", v15, &stru_24F082380, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v17, objc_msgSend(v8, "count") - 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v18);

          goto LABEL_11;
        }
        objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)allUserVisibleApps
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "developerType") == 3)
        {
          objc_msgSend(v8, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v2;
}

+ (id)allApps
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)SBSCopyDisplayIdentifiers();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)tccServices
{
  if (tccServices_token != -1)
    dispatch_once(&tccServices_token, &__block_literal_global_211);
  return (id)tccServices_tccServices;
}

void __26__DSUtilities_tccServices__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("DSLocationAlways"), CFSTR("DSLocationWhenInUse"), *MEMORY[0x24BEB3838], *MEMORY[0x24BEB38C0], *MEMORY[0x24BEB3848], *MEMORY[0x24BEB38D8], *MEMORY[0x24BEB38B8], *MEMORY[0x24BEB3998], *MEMORY[0x24BEB3840], *MEMORY[0x24BEB38E8], CFSTR("DSContacts"), CFSTR("DSHealth"), CFSTR("DSLocalNetwork"), *MEMORY[0x24BEB38D0], *MEMORY[0x24BEB3910], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tccServices_tccServices;
  tccServices_tccServices = v0;

}

+ (BOOL)isContactsTCC:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[DSUtilities contactsServices](DSUtilities, "contactsServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (id)contactsServices
{
  if (contactsServices_token != -1)
    dispatch_once(&contactsServices_token, &__block_literal_global_222);
  return (id)contactsServices_contactsTCCs;
}

void __31__DSUtilities_contactsServices__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BEB3830], *MEMORY[0x24BEB3858], *MEMORY[0x24BEB3860], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contactsServices_contactsTCCs;
  contactsServices_contactsTCCs = v0;

}

+ (BOOL)shouldShowBioRatchetFlow
{
  int v2;
  void *v3;
  char v4;

  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDDA950], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isFeatureEnabled");

    LOBYTE(v2) = v4;
  }
  return v2;
}

@end
