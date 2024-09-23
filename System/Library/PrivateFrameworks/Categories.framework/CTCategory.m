@implementation CTCategory

void __65__CTCategory_categoryForBundleID_platform_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)systemCategoryIDWithPatternMatching:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;

  v3 = (void *)MEMORY[0x24BDD1798];
  v4 = a3;
  objc_msgSend(v3, "regularExpressionWithPattern:options:error:", CFSTR("com.apple.InstallAssistant.*"), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  if (v6)
    v7 = CFSTR("DH0011");
  else
    v7 = 0;

  return (id)v7;
}

+ (void)categoryForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v7;
  id v8;
  __CFString *v9;

  v9 = CFSTR("CTOSPlatformiOS");
  v7 = a4;
  v8 = a3;
  objc_msgSend(a1, "categoryForBundleID:platform:withCompletionHandler:", v8, v9, v7);

}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_3;
  v6[3] = &unk_24C1BBEF0;
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_msgSend(0, "code");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)_getEquivalentBundleIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCEE0];
  v4 = a3;
  objc_msgSend(v3, "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__CTCategory__getEquivalentBundleIdentifiers___block_invoke;
  v8[3] = &unk_24C1BC180;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (id)_getAssociatedDomainsForHostNames:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCEE0];
  v4 = a3;
  objc_msgSend(v3, "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__CTCategory__getAssociatedDomainsForHostNames___block_invoke;
  v8[3] = &unk_24C1BC238;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (id)_overrideEquivalentIdentifiers:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  if (_overrideEquivalentIdentifiers_forBundleID__onceToken != -1)
    dispatch_once(&_overrideEquivalentIdentifiers_forBundleID__onceToken, &__block_literal_global_158);
  objc_msgSend((id)_overrideEquivalentIdentifiers_forBundleID___equivalentBundleIDsOverrides, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v8)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "removeObjectsInArray:", v8);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v11 = 136315651;
      v12 = "+[CTCategory _overrideEquivalentIdentifiers:forBundleID:]";
      v13 = 2113;
      v14 = v7;
      v15 = 2113;
      v16 = v9;
      _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s %{private}@ -> %{private}@", (uint8_t *)&v11, 0x20u);
    }

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryWebDomain, 0);
  objc_storeStrong((id *)&self->_webDomains, 0);
  objc_storeStrong((id *)&self->_equivalentBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_canonicalBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)_identifierForContextResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "error"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "level1Topics", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v12, "topicId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("DH"));

          if (v14)
          {
            objc_msgSend(v12, "topicId");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_relatedItemsForContextResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "error"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "level2Topics", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "relatedItems");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {
            objc_msgSend(v10, "relatedItems");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_14;
          }
        }
        v6 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)equivalentIdentifiersForBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CTCategory _equivalentBundleIDsWithSchemesRemovedMapping](CTCategory, "_equivalentBundleIDsWithSchemesRemovedMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = 0;
    goto LABEL_16;
  }
  v18 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v5;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v7)
    goto LABEL_14;
  v8 = v7;
  v9 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(obj);
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "host");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", v3) & 1) == 0)
      {

LABEL_11:
        objc_msgSend(v11, "host");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

        goto LABEL_12;
      }
      objc_msgSend(v11, "scheme");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("ios"));

      if (v14)
        goto LABEL_11;
LABEL_12:

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v8);
LABEL_14:

  v5 = v17;
  v4 = v18;
LABEL_16:

  return v6;
}

+ (id)parentAppBundleIdentifierForAppRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "entitlements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    objc_msgSend(v5, "objectForKey:ofClass:valuesOfClass:", CFSTR("com.apple.developer.on-demand-install-capable"), v6, objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    v9 = objc_opt_class();
    objc_msgSend(v5, "objectForKey:ofClass:valuesOfClass:", CFSTR("com.apple.developer.parent-application-identifiers"), v9, objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8 && objc_msgSend(v10, "count"))
    {
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hasPrefix:", CFSTR("com."));

      objc_msgSend(v11, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138478083;
          v23 = v16;
          v24 = 2113;
          v25 = v11;
          v17 = MEMORY[0x24BDACB70];
          v18 = "APPSHACK CLIP app %{private}@ parentAppIDs: %{private}@";
LABEL_14:
          _os_log_impl(&dword_209572000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0x16u);

          goto LABEL_10;
        }
        goto LABEL_10;
      }
      v19 = objc_msgSend(v14, "rangeOfString:", CFSTR("."));

      if (v19 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v11, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "substringFromIndex:", v19 + 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138478083;
          v23 = v16;
          v24 = 2113;
          v25 = v11;
          v17 = MEMORY[0x24BDACB70];
          v18 = "CLIP app %{private}@ parentAppIDs: %{private}@";
          goto LABEL_14;
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    v15 = 0;
    goto LABEL_10;
  }
  v15 = 0;
  v11 = 0;
LABEL_11:

  return v15;
}

- (CTCategory)initWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6 primaryWebDomain:(id)a7 canonicalBundleIdentifier:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CTCategory *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CTCategory;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[CTCategory init](&v21, sel_init);
  -[CTCategory _ctCategoryCommonInitWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:canonicalBundleIdentifier:](v19, "_ctCategoryCommonInitWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:canonicalBundleIdentifier:", v18, v17, v16, v15, v14, v13, v21.receiver, v21.super_class);

  return v19;
}

void __48__CTCategory__getAssociatedDomainsForHostNames___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a2;
  v6 = objc_msgSend(v29, "hasPrefix:", CFSTR("app://"));
  v7 = v29;
  if ((v6 & 1) == 0)
  {
    v8 = v29;
    v9 = objc_msgSend(v8, "rangeOfString:options:range:", CFSTR("."), 2, 0, objc_msgSend(v8, "length"));
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
      v11 = 0;
    }
    else
    {
      objc_msgSend(v8, "substringToIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v12;
      if (v12)
      {
        objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v12, "length") + 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
LABEL_8:
        v14 = objc_msgSend(v10, "length");
        if (!v11 || !v14)
        {
          *a4 = 1;
LABEL_20:

          v7 = v29;
          goto LABEL_21;
        }
        if (objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("www")))
        {
          if ((v13 & 1) != 0)
          {
LABEL_14:
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
            v15 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("www.%@"), v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v16);

            v17 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("m.%@"), v8);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v18);

            v19 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mobile.%@"), v8);
LABEL_19:
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v24);

            goto LABEL_20;
          }
          if (objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("m")))
          {
            if (!objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("mobile")))
            {
              objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
              v25 = *(void **)(a1 + 32);
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("www.%@"), v10);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v26);

              v27 = *(void **)(a1 + 32);
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("m.%@"), v10);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v28);

              objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
              goto LABEL_20;
            }
            goto LABEL_14;
          }
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
          v22 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("www.%@"), v10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v23);

          objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
          v20 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("m.%@"), v10);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v21);

        }
        v19 = *(void **)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mobile.%@"), v10);
        goto LABEL_19;
      }
      v10 = 0;
    }
    v13 = 1;
    goto LABEL_8;
  }
LABEL_21:

}

+ (id)_appBundleIdentifierStringFor:(id)a3 categoryIdentifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("app://%@?level1.id=%@"), a3, a4);
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[5];
  id v34;

  v5 = a2;
  v6 = a3;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__0;
  v33[4] = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__0;
    v31 = __Block_byref_object_dispose__0;
    v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_143;
    v26[3] = &unk_24C1BBEC8;
    v15 = *(_QWORD *)(a1 + 40);
    v26[4] = &v27;
    v26[5] = v15;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v26);
    v16 = (void *)objc_msgSend((id)_client, "newRequest");
    v17 = (void *)objc_msgSend((id)v28[5], "copy");
    objc_msgSend(v16, "setUrls:", v17);

    objc_msgSend(v16, "setIncludeHigherLevelTopics:", 1);
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_24C1BBF18;
    v18 = v5;
    v19 = *(void **)(a1 + 32);
    v20 = *(_QWORD *)(a1 + 40);
    v22 = v18;
    v24 = v33;
    v25 = v20;
    v23 = v19;
    objc_msgSend(v16, "executeCategorizationRequestWithReply:", v21);

    _Block_object_dispose(&v27, 8);
  }
  _Block_object_dispose(v33, 8);

}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  __CFString *v29;
  void *v30;
  void *v31;
  CTCategory *v32;
  __CFString *v33;
  void *v34;
  CTCategory *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v45 = a2;
  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("DH1009");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  objc_msgSend((id)objc_opt_class(), "_appBundleIdentifierStringFor:categoryIdentifier:", v45, v9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_relatedItemsForContextResponse:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v10;
  objc_msgSend((id)objc_opt_class(), "_identifierForContextResponse:", v10);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v12, "length"))
  {
    v40 = v12;
  }
  else
  {
    v13 = v9;

    v40 = v13;
  }
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v15 = *(void **)(a1 + 48);
    objc_msgSend(v11, "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_getAssociatedDomainsForHostNames:", v16);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *(void **)(a1 + 48);
    objc_msgSend(v11, "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_getEquivalentBundleIdentifiers:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "count"))
      objc_msgSend(v14, "unionOrderedSet:", v19);

  }
  else
  {
    v38 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "equivalentIdentifiersForBundleID:", v45);
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v14, "unionOrderedSet:", v20);
  v21 = objc_msgSend(v5, "count");
  v22 = (void *)MEMORY[0x24BDBCEE0];
  v44 = v5;
  if (v21 > 1)
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 1, objc_msgSend(v5, "count", v20) - 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectsAtIndexes:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "orderedSetWithArray:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v23, "count"))
    objc_msgSend(v14, "unionOrderedSet:", v23);
  v37 = a1;
  v41 = v11;
  v39 = v9;
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v14, "firstObject");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = v45;
  }
  else
  {
    v28 = v45;
    v27 = v45;
    v26 = v28;
  }
  objc_msgSend(v14, "addObject:", v27);
  +[CTCategory systemAppCategoryIdentifierForBundleIdentifier:](CTCategory, "systemAppCategoryIdentifierForBundleIdentifier:", v45);
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[CTCategory _overrideEquivalentIdentifiers:forBundleID:](CTCategory, "_overrideEquivalentIdentifiers:forBundleID:", v30, v45);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = [CTCategory alloc];
  if (v29)
    v33 = v29;
  else
    v33 = v40;
  objc_msgSend(v38, "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[CTCategory initWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:](v32, "initWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:", v33, v31, v34, v45);

  -[CTCategory setCanonicalBundleIdentifier:](v35, "setCanonicalBundleIdentifier:", v26);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v37 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v35, v45);

}

- (void)_ctCategoryCommonInitWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6 primaryWebDomain:(id)a7 canonicalBundleIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSString *v19;
  NSString *identifier;
  NSString *v21;
  NSString *bundleIdentifier;
  NSArray *v23;
  NSArray *equivalentBundleIdentifiers;
  NSArray *v25;
  NSArray *webDomains;
  NSString *v27;
  NSString *primaryWebDomain;
  NSString *v29;
  NSString *canonicalBundleIdentifier;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v19;

  v21 = (NSString *)objc_msgSend(v16, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v21;

  v23 = (NSArray *)objc_msgSend(v18, "copy");
  equivalentBundleIdentifiers = self->_equivalentBundleIdentifiers;
  self->_equivalentBundleIdentifiers = v23;

  v25 = (NSArray *)objc_msgSend(v17, "copy");
  webDomains = self->_webDomains;
  self->_webDomains = v25;

  v27 = (NSString *)objc_msgSend(v15, "copy");
  primaryWebDomain = self->_primaryWebDomain;
  self->_primaryWebDomain = v27;

  v29 = (NSString *)objc_msgSend(v14, "copy");
  canonicalBundleIdentifier = self->_canonicalBundleIdentifier;
  self->_canonicalBundleIdentifier = v29;

}

+ (id)systemAppCategoryIdentifierForBundleIdentifier:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;

  v4 = a3;
  objc_msgSend(a1, "systemCategoryIDWithPatternMatching:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[CTCategories systemHiddenBundleIdentifiersForDeviceFamily:](CTCategories, "systemHiddenBundleIdentifiersForDeviceFamily:", 102);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v4);

    if ((v7 & 1) != 0)
    {
      v5 = CFSTR("DH0011");
    }
    else
    {
      +[CTCategories systemBlockableBundleIdentifiersForDeviceFamily:](CTCategories, "systemBlockableBundleIdentifiersForDeviceFamily:", 102);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v4);

      if ((v9 & 1) != 0)
      {
        v5 = CFSTR("DH0012");
      }
      else
      {
        +[CTCategories systemUnblockableBundleIdentifiersForDeviceFamily:](CTCategories, "systemUnblockableBundleIdentifiersForDeviceFamily:", 102);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v4);

        if (v11)
          v5 = CFSTR("DH0013");
        else
          v5 = 0;
      }
    }
  }

  return v5;
}

+ (void)categoryForBundleID:(id)a3 platform:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v18[0] = v8;
  v10 = (void *)MEMORY[0x24BDBCE30];
  v11 = a4;
  objc_msgSend(v10, "arrayWithObjects:count:", v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__CTCategory_categoryForBundleID_platform_withCompletionHandler___block_invoke;
  v15[3] = &unk_24C1BBEA0;
  v16 = v8;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  objc_msgSend(a1, "categoryForBundleIdentifiers:platform:withCompletionHandler:", v12, v11, v15);

}

+ (void)categoryForBundleIdentifiers:(id)a3 platform:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke;
  v36[3] = &unk_24C1BBF40;
  v12 = v10;
  v37 = v12;
  v38 = a1;
  v13 = (void *)MEMORY[0x20BD0FA94](v36);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__0;
  v34[4] = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__0;
  v32[4] = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__0;
  v30[4] = __Block_byref_object_dispose__0;
  v31 = 0;
  +[CTCategory _xpcConnection](CTCategory, "_xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_147;
  v28[3] = &unk_24C1BBF68;
  v15 = v12;
  v29 = v15;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_149;
  v20[3] = &unk_24C1BBFE0;
  v17 = v9;
  v21 = v17;
  v24 = v32;
  v25 = v30;
  v26 = v34;
  v18 = v8;
  v22 = v18;
  v19 = v13;
  v23 = v19;
  v27 = a1;
  objc_msgSend(v16, "genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:replyHandler:", v18, v20);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
}

+ (id)_xpcConnection
{
  id v2;
  id v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (id)_connection;
  if (!v3)
  {
    v3 = (id)objc_msgSend(v2, "_newXpcConnection");
    objc_storeStrong((id *)&_connection, v3);
  }
  objc_sync_exit(v2);

  return v3;
}

void __46__CTCategory__getEquivalentBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "hasPrefix:", CFSTR("app://"));
  v4 = v7;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "host");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

    v4 = v7;
  }

}

- (void)setCanonicalBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CTCategory)initWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6 primaryWebDomain:(id)a7
{
  return -[CTCategory initWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:canonicalBundleIdentifier:](self, "initWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:canonicalBundleIdentifier:", a3, a4, a5, a6, a7, 0);
}

- (CTCategory)initWithIdentifier:(id)a3 equivalentBundleIdentifiers:(id)a4 webDomains:(id)a5 bundleIdentifier:(id)a6
{
  return -[CTCategory initWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:](self, "initWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:", a3, a4, a5, a6, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)_equivalentBundleIDsMapping
{
  if (_equivalentBundleIDsMapping_onceToken != -1)
    dispatch_once(&_equivalentBundleIDsMapping_onceToken, &__block_literal_global_355);
  return (id)_equivalentBundleIDsMapping__mapping;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE199B8], "clientWithDefaultRequestType:", 6);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_client;
  _client = v2;

  objc_msgSend((id)_client, "indexVersionId");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_currentIndexVersionId;
  _currentIndexVersionId = v4;

  objc_msgSend((id)_client, "registerConfigurationUpdateHandler:", &__block_literal_global);
}

void __24__CTCategory_initialize__block_invoke()
{
  void *v0;
  id obj;

  if (!+[CTUtilities isClassCLocked](CTUtilities, "isClassCLocked"))
  {
    objc_msgSend((id)_client, "indexVersionId");
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(obj, "length"))
    {
      if ((objc_msgSend((id)_currentIndexVersionId, "isEqualToString:", obj) & 1) == 0)
      {
        objc_storeStrong((id *)&_currentIndexVersionId, obj);
        objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
        v0 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "postNotificationName:object:userInfo:", CTCategoriesDidChangeNotification, 0, 0);

      }
    }

  }
}

+ (id)_newXpcConnection
{
  void *v2;
  void *v3;
  uint8_t v5[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "CTCategory::_newXpcConnection", v5, 2u);
  }
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.ctcategories.service"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545A4280);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);
  objc_msgSend(v2, "resume");

  return v2;
}

- (CTCategory)initWithIdentifier:(id)a3 webDomains:(id)a4 bundleIdentifier:(id)a5
{
  return -[CTCategory initWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:](self, "initWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:", a3, 0, a4, a5, 0);
}

- (CTCategory)initWithIdentifier:(id)a3 webDomains:(id)a4 bundleIdentifier:(id)a5 primaryWebDomain:(id)a6
{
  return -[CTCategory initWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:](self, "initWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:", a3, 0, a4, a5, a6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *equivalentBundleIdentifiers;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("CTPrimaryIdenfier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_equivalentBundleIdentifiers, CFSTR("CTEquivalentBundleIdentifiers"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_webDomains, CFSTR("CTWebdomains"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("CTBundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_primaryWebDomain, CFSTR("CTPrimayWebDomain"));
  equivalentBundleIdentifiers = self->_equivalentBundleIdentifiers;
  if (equivalentBundleIdentifiers)
  {
    -[NSArray firstObject](equivalentBundleIdentifiers, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("CTCanonicalBundleIdentifier"));

  }
  else
  {
    objc_msgSend(v6, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("CTCanonicalBundleIdentifier"));
  }

}

- (CTCategory)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CTCategory *v15;
  CTCategory *v16;
  objc_super v18;

  v4 = (objc_class *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CTPrimaryIdenfier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("CTWebdomains"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CTBundleIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CTPrimayWebDomain"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("CTEquivalentBundleIdentifiers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CTCanonicalBundleIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)CTCategory;
    v15 = -[CTCategory init](&v18, sel_init);
    -[CTCategory _ctCategoryCommonInitWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:canonicalBundleIdentifier:](v15, "_ctCategoryCommonInitWithIdentifier:equivalentBundleIdentifiers:webDomains:bundleIdentifier:primaryWebDomain:canonicalBundleIdentifier:", v9, v13, v10, v11, v12, v14);
    self = v15;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)localizedNameForIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_DHIDtoCategoryDisplayNameMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24C1BD858, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)shortLocalizedNameForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "_DHIDtoCategoryDisplayNameMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("_Short"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_24C1BD858, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)localizedName
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[CTCategory identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedNameForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CTCategory identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCategory bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCategory canonicalBundleIdentifier](self, "canonicalBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCategory equivalentBundleIdentifiers](self, "equivalentBundleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCategory primaryWebDomain](self, "primaryWebDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCategory webDomains](self, "webDomains");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - { bundle identifier: %@, canonicalBundleIdentifier: %@, equivalent bundle IDs: %@ } domain info:{ primaryWebDomain: %@ <-> webDomains: %@ }"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqualToCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v20;
  void *v21;

  v4 = a3;
  -[CTCategory identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[CTCategory equivalentBundleIdentifiers](self, "equivalentBundleIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "equivalentBundleIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9 || objc_msgSend(v8, "isEqual:", v9))
    {
      -[CTCategory webDomains](self, "webDomains");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "webDomains");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11 || objc_msgSend(v10, "isEqual:", v11))
      {
        -[CTCategory primaryWebDomain](self, "primaryWebDomain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "primaryWebDomain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 == v13 || objc_msgSend(v12, "isEqual:", v13))
        {
          -[CTCategory bundleIdentifier](self, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14 == v15 || objc_msgSend(v14, "isEqual:", v15))
          {
            -[CTCategory canonicalBundleIdentifier](self, "canonicalBundleIdentifier", v14, v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "canonicalBundleIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v16 == v17 || objc_msgSend(v16, "isEqual:", v17);

            v14 = v20;
            v12 = v21;
          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CTCategory isEqualToCategory:](self, "isEqualToCategory:", v4);

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CTCategory;
  v3 = -[CTCategory hash](&v17, sel_hash);
  -[CTCategory identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[CTCategory bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[CTCategory equivalentBundleIdentifiers](self, "equivalentBundleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  -[CTCategory canonicalBundleIdentifier](self, "canonicalBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[CTCategory webDomains](self, "webDomains");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash") ^ v3;
  -[CTCategory primaryWebDomain](self, "primaryWebDomain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (BOOL)isSystemBundleIdentifier
{
  void *v2;
  char v3;

  -[CTCategory identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("DH00"));

  return v3;
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_143(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;

  v5 = a2;
  objc_msgSend(a3, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("DH1009");
  if (v6)
    v8 = (__CFString *)v6;
  v10 = v8;

  objc_msgSend(*(id *)(a1 + 40), "_appBundleIdentifierStringFor:categoryIdentifier:", v5, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v9);

}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_147(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_147_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  const __CFString *v47;
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412803;
    v50 = v7;
    v51 = 2113;
    v52 = v5;
    v53 = 2112;
    v54 = v6;
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "genreIDsAndCounterpartIdentifiersForInstalledBundleIDs:completionHandler: platform: %@, %{private}@ error:%@", buf, 0x20u);
  }
  if (!v6)
  {
    v8 = objc_msgSend(v5, "mutableCopy");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
  v11 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectsInArray:", v15);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    *(_DWORD *)buf = 138477827;
    v50 = v16;
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "notInstalledBundleIdentifiers: %{private}@", buf, 0xCu);
  }
  v17 = CFSTR("CTOSPlatformiOS");
  v18 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("CTOSPlatformwatchOS"));

  if (v18)
  {
    v34 = v5;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v19 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v44 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          v47 = CFSTR("DH1009");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1, v34);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v25, v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v21);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v5 = v34;
  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
  {
    v26 = MEMORY[0x24BDAC760];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_150;
    v40[3] = &unk_24C1BBF90;
    v42 = *(_QWORD *)(a1 + 56);
    v41 = *(id *)(a1 + 40);
    v27 = (void *)MEMORY[0x20BD0FA94](v40);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138477827;
      v50 = v28;
      _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "NotInstalledBundleIdentifiers: %{private}@ ", buf, 0xCu);
    }
    v29 = *(void **)(a1 + 80);
    v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v36[0] = v26;
    v36[1] = 3221225472;
    v36[2] = __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_152;
    v36[3] = &unk_24C1BBFB8;
    v38 = v27;
    v35 = *(_OWORD *)(a1 + 48);
    v31 = (id)v35;
    v39 = v35;
    v37 = *(id *)(a1 + 32);
    v32 = v27;
    objc_msgSend(v29, "_lookupAppStoreUsing:platform:withCompletionHandler:", v30, CFSTR("CTOSPlatformAll"), v36);

  }
  else
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      v33 = 0;
    else
      v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v33);
  }

}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_150(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  const __CFString *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "minusSet:", v9);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
          v23 = CFSTR("DH1009");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1, (_QWORD)v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v16, v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
      }
      while (v12);
    }

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v22 = v10;
      _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "fallbackToDefaultValueHandler - notInstalledBundleIdentifiers: %{private}@", buf, 0xCu);
    }

  }
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_152(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (*v6)(void);
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addEntriesFromDictionary:", a3);
  if (objc_msgSend(v5, "code") == -3001)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("CTOSPlatformAll")))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v8 = 138412546;
        v9 = v5;
        v10 = 2112;
        v11 = v7;
        _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "ERROR %@ categoryForBundleIdentifiers: %@", (uint8_t *)&v8, 0x16u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();

}

+ (void)categoryForDomainURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__CTCategory_categoryForDomainURL_withCompletionHandler___block_invoke;
  v10[3] = &unk_24C1BBCA0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(a1, "categoryForDomainNames:withCompletionHandler:", v8, v10);

}

void __57__CTCategory_categoryForDomainURL_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v6, v5);

}

+ (void)categoryForDomainURLs:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _BYTE *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE buf[24];
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[CTCategory categoryForDomainURLs:withCompletionHandler:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v6, "count");
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "START %s :%lu", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "host");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v10);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __58__CTCategory_categoryForDomainURLs_withCompletionHandler___block_invoke;
  v16[3] = &unk_24C1BC030;
  v14 = v9;
  v17 = v14;
  v19 = buf;
  v15 = v7;
  v18 = v15;
  objc_msgSend(a1, "categoryForDomainNames:withCompletionHandler:", v8, v16);

  _Block_object_dispose(buf, 8);
}

void __58__CTCategory_categoryForDomainURLs_withCompletionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (void *)a1[4];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__CTCategory_categoryForDomainURLs_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_24C1BC008;
  v7 = a1[6];
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "+[CTCategory categoryForDomainURLs:withCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DONE %s", buf, 0xCu);
  }
  (*(void (**)(_QWORD, _QWORD, id, uint64_t))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), v9, v10);

}

void __58__CTCategory_categoryForDomainURLs_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7 = v3;
  objc_msgSend(v3, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v6, v7);

}

+ (void)categoryForDomainName:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v13[0] = a3;
  v7 = (void *)MEMORY[0x24BDBCE30];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__CTCategory_categoryForDomainName_withCompletionHandler___block_invoke;
  v11[3] = &unk_24C1BBCA0;
  v12 = v6;
  v10 = v6;
  objc_msgSend(a1, "categoryForDomainNames:withCompletionHandler:", v9, v11);

}

void __58__CTCategory_categoryForDomainName_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v6, v5);

}

+ (void)categoryForDomainNames:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "+[CTCategory categoryForDomainNames:withCompletionHandler:]";
      v17 = 2048;
      v18 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "START %s :%lu", buf, 0x16u);
    }
    objc_msgSend(a1, "_urlStringsForHostNames:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend((id)_client, "newRequest");
    v10 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v9, "setUrls:", v10);

    objc_msgSend(v9, "setIncludeHigherLevelTopics:", 1);
    objc_initWeak((id *)buf, a1);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke;
    v11[3] = &unk_24C1BC0A8;
    objc_copyWeak(&v14, (id *)buf);
    v13 = v7;
    v12 = v6;
    objc_msgSend(v9, "executeCategorizationRequestWithReply:", v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CTCategory *v26;
  void *v27;
  void *v28;
  CTCategory *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id obj;
  __CFString *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id WeakRetained;
  _QWORD v41[4];
  id v42;
  id v43;
  uint64_t *v44;
  _QWORD *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD v56[5];
  id v57;
  uint8_t buf[4];
  const char *v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v38 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v32 = v5;
  if (!WeakRetained)
  {
    v6 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
  v31 = a1;
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
LABEL_5:
    (*(void (**)(uint64_t, _QWORD, id))(v6 + 16))(v6, 0, v5);
    goto LABEL_31;
  }
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__0;
  v56[4] = __Block_byref_object_dispose__0;
  v57 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__0;
  v54 = __Block_byref_object_dispose__0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = *(id *)(a1 + 32);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
  v8 = WeakRetained;
  if (v7)
  {
    v37 = *(_QWORD *)v47;
    do
    {
      v39 = v7;
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v47 != v37)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v8, "_urlComponentsForHostName:", v10, v31, v32);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "error");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (v16)
          {
            objc_msgSend(WeakRetained, "_identifierForContextResponse:", v14);
            v17 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "_bundleIdentifierForContextResponse:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            v20 = CFSTR("DH1009");
            if (v17)
              v20 = (const __CFString *)v17;
            v36 = (__CFString *)v20;
            if (objc_msgSend(v18, "length"))
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v19, v10);
            if (!objc_msgSend(v19, "length"))
            {
              objc_msgSend(v11, "host");
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = (void *)v21;
              if (v21)
                v23 = (void *)v21;
              else
                v23 = v10;
              v34 = v23;

              v60 = v34;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(WeakRetained, "_getAssociatedDomainsForHostNames:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v26 = [CTCategory alloc];
              objc_msgSend(v25, "array");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "firstObject");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = -[CTCategory initWithIdentifier:webDomains:bundleIdentifier:primaryWebDomain:](v26, "initWithIdentifier:webDomains:bundleIdentifier:primaryWebDomain:", v36, v27, 0, v28);

              objc_msgSend((id)v51[5], "setObject:forKeyedSubscript:", v29, v10);
            }

          }
        }

        v8 = WeakRetained;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v61, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v33, "count"))
  {
    objc_msgSend(v33, "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke_155;
    v41[3] = &unk_24C1BC080;
    v42 = v33;
    v44 = &v50;
    v45 = v56;
    v43 = *(id *)(v31 + 40);
    objc_msgSend(WeakRetained, "categoryForBundleIdentifiers:platform:withCompletionHandler:", v30, CFSTR("CTOSPlatformAll"), v41);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v59 = "+[CTCategory categoryForDomainNames:withCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DONE %s", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(v31 + 40) + 16))();
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(v56, 8);

LABEL_31:
}

void __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  __int128 v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_24C1BC058;
  v14 = *(_OWORD *)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "+[CTCategory categoryForDomainNames:withCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "DONE %s", buf, 0xCu);
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v10);

}

void __59__CTCategory_categoryForDomainNames_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v5, v6);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));

}

void __57__CTCategory__overrideEquivalentIdentifiers_forBundleID___block_invoke()
{
  void *v0;

  v0 = (void *)_overrideEquivalentIdentifiers_forBundleID___equivalentBundleIDsOverrides;
  _overrideEquivalentIdentifiers_forBundleID___equivalentBundleIDsOverrides = (uint64_t)&unk_24C1C1228;

}

+ (void)_getCategoryTypeForDomainName:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "+[CTCategory _getCategoryTypeForDomainName:withCompletionHandler:]";
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  objc_msgSend((id)objc_opt_class(), "_urlComponentsForHostName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_msgSend((id)_client, "newRequest");
    objc_msgSend(v9, "setIncludeHigherLevelTopics:", 1);
    objc_msgSend(v9, "setUrl:", v8);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__CTCategory__getCategoryTypeForDomainName_withCompletionHandler___block_invoke;
    v10[3] = &unk_24C1BBEA0;
    v11 = v8;
    v12 = v6;
    objc_msgSend(v9, "executeCategorizationRequestWithReply:", v10);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v6 + 2))(v6, 5001, 0);
  }

}

void __66__CTCategory__getCategoryTypeForDomainName_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v9 || !v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_identifierForContextResponse:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      v8 = 5000;
    else
      v8 = 5001;
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8, 0);

  }
}

+ (id)_DHIDtoCategoryDisplayNameMap
{
  if (_DHIDtoCategoryDisplayNameMap_onceToken != -1)
    dispatch_once(&_DHIDtoCategoryDisplayNameMap_onceToken, &__block_literal_global_174);
  return (id)_DHIDtoCategoryDisplayNameMap_DHCategories;
}

void __43__CTCategory__DHIDtoCategoryDisplayNameMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[15];
  _QWORD v3[16];

  v3[15] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("DH1001");
  v2[1] = CFSTR("DH1002");
  v3[0] = CFSTR("Games");
  v3[1] = CFSTR("Social Networking");
  v2[2] = CFSTR("DH1003");
  v2[3] = CFSTR("DH1004");
  v3[2] = CFSTR("Entertainment");
  v3[3] = CFSTR("Creativity");
  v2[4] = CFSTR("DH1005");
  v2[5] = CFSTR("DH1006");
  v3[4] = CFSTR("Productivity");
  v3[5] = CFSTR("Education");
  v2[6] = CFSTR("DH1007");
  v2[7] = CFSTR("DH1008");
  v3[6] = CFSTR("Reading & Reference");
  v3[7] = CFSTR("Health & Fitness");
  v2[8] = CFSTR("DH1009");
  v2[9] = CFSTR("DH1011");
  v3[8] = CFSTR("Other");
  v3[9] = CFSTR("Utilities");
  v2[10] = CFSTR("DH1012");
  v2[11] = CFSTR("DH1013");
  v3[10] = CFSTR("Shopping & Food");
  v3[11] = CFSTR("Travel");
  v2[12] = CFSTR("DH0013");
  v2[13] = CFSTR("DH0012");
  v3[12] = CFSTR("System Unblockable Applications");
  v3[13] = CFSTR("System Blockable Applications");
  v2[14] = CFSTR("DH0011");
  v3[14] = CFSTR("System Hidden Applications");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_DHIDtoCategoryDisplayNameMap_DHCategories;
  _DHIDtoCategoryDisplayNameMap_DHCategories = v0;

}

+ (id)schemeStringForPlatform:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CTOSPlatformiOS")) & 1) != 0)
  {
    v5 = CFSTR("ios");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CTOSPlatformmacOS")) & 1) != 0)
  {
    v5 = CFSTR("macos");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CTOSPlatformwatchOS")) & 1) != 0)
  {
    v5 = CFSTR("watchos");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CTOSPlatformtvOS")) & 1) != 0)
  {
    v5 = CFSTR("tvos");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("CTOSPlatformAll")) & 1) != 0)
  {
    v5 = CFSTR("all");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("CTOSPlatformCurrent")))
  {
    v6 = CFSTR("CTOSPlatformiOS");
    objc_msgSend(a1, "schemeStringForPlatform:", v6);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)bundleIDForPlatform:(id)a3 fromBundleID:(id)a4 platform:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(a1, "schemeStringForPlatform:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setScheme:", v12);

  objc_msgSend(v11, "setHost:", v9);
  objc_msgSend(v11, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  +[CTCategory _equivalentBundleIDsMapping](CTCategory, "_equivalentBundleIDsMapping");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(a1, "schemeStringForPlatform:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __56__CTCategory_bundleIDForPlatform_fromBundleID_platform___block_invoke;
    v21[3] = &unk_24C1BC110;
    v18 = v17;
    v22 = v18;
    v23 = &v24;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v21);

  }
  v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v19;
}

void __56__CTCategory_bundleIDForPlatform_fromBundleID_platform___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(v11, "host");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

+ (id)_DHToAppStoreCategoriesMap
{
  if (_DHToAppStoreCategoriesMap_onceToken != -1)
    dispatch_once(&_DHToAppStoreCategoriesMap_onceToken, &__block_literal_global_189);
  return (id)_DHToAppStoreCategoriesMap_DHToAppStoreCategoriesMap;
}

void __40__CTCategory__DHToAppStoreCategoriesMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[2];
  _QWORD v19[5];
  _QWORD v20[2];
  _QWORD v21[4];
  _QWORD v22[2];
  _QWORD v23[3];
  const __CFString *v24;
  _QWORD v25[2];
  _QWORD v26[12];
  _QWORD v27[14];

  v27[12] = *MEMORY[0x24BDAC8D0];
  v25[0] = CFSTR("Games");
  v25[1] = CFSTR("Stickers");
  v26[0] = CFSTR("Games");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  v26[1] = CFSTR("Social Networking");
  v24 = CFSTR("Social Networking");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v12;
  v26[2] = CFSTR("Entertainment");
  v23[0] = CFSTR("Entertainment");
  v23[1] = CFSTR("Music");
  v23[2] = CFSTR("Sports");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v0;
  v26[3] = CFSTR("Creativity");
  v22[0] = CFSTR("Photo & Video");
  v22[1] = CFSTR("Graphics & Design");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v1;
  v26[4] = CFSTR("Productivity");
  v21[0] = CFSTR("Productivity");
  v21[1] = CFSTR("Business");
  v21[2] = CFSTR("Finance");
  v21[3] = CFSTR("Developer Tools");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v2;
  v26[5] = CFSTR("Education");
  v20[0] = CFSTR("Education");
  v20[1] = CFSTR("Kids");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v3;
  v26[6] = CFSTR("Reading & Reference");
  v19[0] = CFSTR("Book");
  v19[1] = CFSTR("Reference");
  v19[2] = CFSTR("News");
  v19[3] = CFSTR("Weather");
  v19[4] = CFSTR("Magazines & Newspapers");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v4;
  v26[7] = CFSTR("Health & Fitness");
  v18[0] = CFSTR("Health & Fitness");
  v18[1] = CFSTR("Medical");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v5;
  v26[8] = CFSTR("Other");
  v17 = CFSTR("Miscellaneous");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v6;
  v26[9] = CFSTR("Utilities");
  v16 = CFSTR("Utilities");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v7;
  v26[10] = CFSTR("Shopping & Food");
  v15[0] = CFSTR("Food & Drink");
  v15[1] = CFSTR("Shopping");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v8;
  v26[11] = CFSTR("Travel");
  v14[0] = CFSTR("Travel");
  v14[1] = CFSTR("Navigation");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_DHToAppStoreCategoriesMap_DHToAppStoreCategoriesMap;
  _DHToAppStoreCategoriesMap_DHToAppStoreCategoriesMap = v10;

}

+ (void)_lookupAppStoreUsing:(id)a3 platform:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD activity_block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "_lookupAppStoreUsing %@", buf, 0xCu);
  }
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke;
  activity_block[3] = &unk_24C1BC158;
  v15 = v8;
  v16 = v9;
  v14 = v7;
  v10 = v8;
  v11 = v7;
  v12 = v9;
  _os_activity_initiate(&dword_209572000, "CTCategory _lookupAppStoreUsing:withCompletionHandler:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  +[CTCategory _xpcConnection](CTCategory, "_xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_24C1BBF68;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke_190;
  v7[3] = &unk_24C1BBEA0;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "lookupAppStoreForBundleIDs:platform:replyHandler:", v6, v8, v7);

}

void __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "lookupAppStoreForBundleID:completionHandler: %@", (uint8_t *)&v4, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __66__CTCategory__lookupAppStoreUsing_platform_withCompletionHandler___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138412547;
    v10 = v7;
    v11 = 2113;
    v12 = v5;
    _os_log_impl(&dword_209572000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "lookupAppStoreForBundleID:completionHandler: platform: %@, %{private}@", (uint8_t *)&v9, 0x16u);
  }
  if (v6)
    v8 = 0;
  else
    v8 = v5;
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, v8);

}

+ (id)itemWith:(id)a3 platform:(id)a4 array:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, _BYTE *);
  uint64_t *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  __CFString *v19;
  id v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  uint64_t v27;
  id *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  v11 = v10;
  v27 = 0;
  v28 = (id *)&v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  if (CFSTR("CTOSPlatformAll") == v9)
  {
    v14 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v10, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLWithString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "host");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v28[5];
    v28[5] = (id)v17;

    goto LABEL_14;
  }
  if (CFSTR("CTOSPlatformCurrent") == v9)
  {
    v19 = CFSTR("CTOSPlatformiOS");

    goto LABEL_10;
  }
  if (CFSTR("CTOSPlatformiOS") == v9)
  {
LABEL_10:
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __38__CTCategory_itemWith_platform_array___block_invoke;
    v26[3] = &unk_24C1BC1A8;
    v26[4] = &v27;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v26);
    v9 = CFSTR("CTOSPlatformiOS");
    goto LABEL_14;
  }
  if (CFSTR("CTOSPlatformmacOS") == v9)
  {
    v25 = MEMORY[0x24BDAC760];
    v12 = __38__CTCategory_itemWith_platform_array___block_invoke_2;
    v13 = &v25;
  }
  else if (CFSTR("CTOSPlatformtvOS") == v9)
  {
    v24 = MEMORY[0x24BDAC760];
    v12 = __38__CTCategory_itemWith_platform_array___block_invoke_3;
    v13 = &v24;
  }
  else
  {
    if (CFSTR("CTOSPlatformwatchOS") != v9)
      goto LABEL_14;
    v23 = MEMORY[0x24BDAC760];
    v12 = __38__CTCategory_itemWith_platform_array___block_invoke_4;
    v13 = &v23;
  }
  v13[1] = 3221225472;
  v13[2] = (uint64_t)v12;
  v13[3] = (uint64_t)&unk_24C1BC1A8;
  v13[4] = (uint64_t)&v27;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v23);
LABEL_14:
  v20 = v28[5];
  if (!v20)
  {
    objc_storeStrong(v28 + 5, a3);
    v20 = v28[5];
  }
  v21 = v20;
  _Block_object_dispose(&v27, 8);

  return v21;
}

void __38__CTCategory_itemWith_platform_array___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ios://"));

  if (v7)
  {
    objc_msgSend(v11, "host");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

void __38__CTCategory_itemWith_platform_array___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("macos://")))
  {

LABEL_4:
    objc_msgSend(v12, "host");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v12, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("iosmac://"));

  if (v8)
    goto LABEL_4;
LABEL_5:

}

void __38__CTCategory_itemWith_platform_array___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("tvos://"));

  if (v7)
  {
    objc_msgSend(v11, "host");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

void __38__CTCategory_itemWith_platform_array___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("watchos://"));

  if (v7)
  {
    objc_msgSend(v11, "host");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

+ (id)_equivalentBundleIDsMappingForWatchOSBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (_equivalentBundleIDsMappingForWatchOSBundleID__onceToken != -1)
    dispatch_once(&_equivalentBundleIDsMappingForWatchOSBundleID__onceToken, &__block_literal_global_204);
  objc_msgSend((id)_equivalentBundleIDsMappingForWatchOSBundleID___equivalentBundleIDsMappingForWatchOS, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x24BDBCF00];
    objc_msgSend((id)_equivalentBundleIDsMappingForWatchOSBundleID___equivalentBundleIDsMappingForWatchOS, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "orderedSetWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __60__CTCategory__equivalentBundleIDsMappingForWatchOSBundleID___block_invoke()
{
  void *v0;

  v0 = (void *)_equivalentBundleIDsMappingForWatchOSBundleID___equivalentBundleIDsMappingForWatchOS;
  _equivalentBundleIDsMappingForWatchOSBundleID___equivalentBundleIDsMappingForWatchOS = (uint64_t)&unk_24C1C1250;

}

void __41__CTCategory__equivalentBundleIDsMapping__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v1 = objc_msgSend(&unk_24C1C1210, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v17;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v17 != v3)
          objc_enumerationMutation(&unk_24C1C1210);
        v5 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v4);
        v12 = 0u;
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v6 = v5;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v13;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v13 != v9)
                objc_enumerationMutation(v6);
              objc_msgSend(v0, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
          }
          while (v8);
        }

        ++v4;
      }
      while (v4 != v2);
      v2 = objc_msgSend(&unk_24C1C1210, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v2);
  }
  v11 = (void *)_equivalentBundleIDsMapping__mapping;
  _equivalentBundleIDsMapping__mapping = (uint64_t)v0;

}

+ (id)_equivalentBundleIDsWithSchemesRemovedMapping
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CTCategory__equivalentBundleIDsWithSchemesRemovedMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_equivalentBundleIDsWithSchemesRemovedMapping_onceToken != -1)
    dispatch_once(&_equivalentBundleIDsWithSchemesRemovedMapping_onceToken, block);
  return (id)_equivalentBundleIDsWithSchemesRemovedMapping__mapping;
}

void __59__CTCategory__equivalentBundleIDsWithSchemesRemovedMapping__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 32), "_equivalentBundleIDsMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__CTCategory__equivalentBundleIDsWithSchemesRemovedMapping__block_invoke_2;
  v7[3] = &unk_24C1BC210;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  v5 = (void *)_equivalentBundleIDsWithSchemesRemovedMapping__mapping;
  _equivalentBundleIDsWithSchemesRemovedMapping__mapping = (uint64_t)v4;
  v6 = v4;

}

void __59__CTCategory__equivalentBundleIDsWithSchemesRemovedMapping__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDBCF48];
  v6 = a3;
  objc_msgSend(v5, "URLWithString:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "host");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v8);
}

+ (id)_bundleIdentifierForContextResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "error"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    objc_msgSend(a1, "_relatedItemsForContextResponse:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x3032000000;
      v14 = __Block_byref_object_copy__0;
      v15 = __Block_byref_object_dispose__0;
      v16 = 0;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __50__CTCategory__bundleIdentifierForContextResponse___block_invoke;
      v10[3] = &unk_24C1BC260;
      v10[4] = &v11;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
      v7 = (id)v12[5];
      _Block_object_dispose(&v11, 8);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __50__CTCategory__bundleIdentifierForContextResponse___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = objc_msgSend(v10, "hasPrefix:", CFSTR("app://"));
  v7 = v10;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "host");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v9);
      *a4 = 1;
    }

    v7 = v10;
  }

}

+ (id)_urlStringsForHostNames:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_urlComponentsForHostName:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
          objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_urlComponentsForHostName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1808]);
    objc_msgSend(v4, "setHost:", v3);
    objc_msgSend(v4, "setScheme:", CFSTR("http"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)canonicalBundleIdentifier
{
  return self->_canonicalBundleIdentifier;
}

- (NSArray)equivalentBundleIdentifiers
{
  return self->_equivalentBundleIdentifiers;
}

- (NSArray)webDomains
{
  return self->_webDomains;
}

- (void)setWebDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)primaryWebDomain
{
  return self->_primaryWebDomain;
}

- (void)setPrimaryWebDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209572000, MEMORY[0x24BDACB70], a3, "Failed to get category for bundle identifiers: %{public}@", a5, a6, a7, a8, 2u);
}

void __74__CTCategory_categoryForBundleIdentifiers_platform_withCompletionHandler___block_invoke_147_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209572000, MEMORY[0x24BDACB70], a3, "remoteObjectProxyWithErrorHandler: %@", a5, a6, a7, a8, 2u);
}

@end
