@implementation ASPurchaseBatch

- (id)copyFilteredItemsFromItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = -[ASPurchaseBatch _copyItemsByStorefrontFromItems:](self, "_copyItemsByStorefrontFromItems:");
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "storeFrontIdentifier");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
  if (!v6)
    goto LABEL_23;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v25;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
      if ((objc_msgSend(v5, "hasPrefix:", v11) & 1) != 0)
      {
        v8 = v11;
        goto LABEL_14;
      }
      if (!v8 || objc_msgSend(v11, "compare:", v8) == -1)
        v8 = v11;
    }
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    if (v7)
      continue;
    break;
  }
LABEL_14:
  if (v8)
  {
    v12 = (id)objc_msgSend(v4, "objectForKey:", v8);
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v13, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v15 &= 2u;
    if (v15)
    {
      v16 = objc_opt_class();
      v17 = objc_msgSend(v4, "count");
      v18 = objc_msgSend(v12, "count");
      v19 = objc_msgSend(a3, "count");
      v28 = 138413314;
      v29 = v16;
      v30 = 2112;
      v31 = v8;
      v32 = 2048;
      v33 = v17;
      v34 = 2048;
      v35 = v18;
      v36 = 2048;
      v37 = v19;
      LODWORD(v23) = 52;
      v20 = _os_log_send_and_compose_impl();
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, &v28, v23);
        free(v21);
        SSFileLog();
      }
    }
  }
  else
  {
LABEL_23:
    v12 = 0;
  }

  return v12;
}

- (void)errorEqualCallback
{
  return __ASPurchaseBatchErrorEqual;
}

- (id)everythingFailedErrorForError:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v7;

  v4 = (void *)objc_msgSend(a3, "domain");
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BEB24A0]))
    return a3;
  v5 = objc_msgSend(a3, "code");
  if (v5 == 105)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)ASAppStoreUIBundle(), "localizedStringForKey:value:table:", CFSTR("INCOMPATIBLE_DEVICE_ERROR_BODY_ALL"), &stru_24F9637E0, 0), objc_msgSend(v7, "systemName"));
    objc_msgSend(a3, "code");
    objc_msgSend((id)ASAppStoreUIBundle(), "localizedStringForKey:value:table:", CFSTR("INCOMPATIBLE_UPDATE_ERROR_TITLE_ALL"), &stru_24F9637E0, 0);
    return (id)SSError();
  }
  if (v5 != 103)
    return a3;
  objc_msgSend((id)ASAppStoreUIBundle(), "localizedStringForKey:value:table:", CFSTR("NOT_ENOUGH_SPACE_FOR_ALL_APPS"), &stru_24F9637E0, 0);
  return (id)SSError();
}

- (id)mergedErrorForError:(id)a3 withCount:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v10;

  if (a4 < 2)
    return a3;
  v7 = (void *)objc_msgSend(a3, "domain");
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB24A0]))
    return a3;
  v8 = objc_msgSend(a3, "code");
  if (v8 == 102)
    return -[ASPurchaseBatch _tooBigForNetworkErrorForError:withCount:](self, "_tooBigForNetworkErrorForError:withCount:", a3, a4);
  if (v8 == 105)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)ASAppStoreUIBundle(), "localizedStringForKey:value:table:", CFSTR("INCOMPATIBLE_DEVICE_ERROR_BODY_SOME"), &stru_24F9637E0, 0), objc_msgSend(v10, "systemName"));
    objc_msgSend(a3, "code");
    objc_msgSend((id)ASAppStoreUIBundle(), "localizedStringForKey:value:table:", CFSTR("INCOMPATIBLE_UPDATE_ERROR_TITLE_SOME"), &stru_24F9637E0, 0);
    return (id)SSError();
  }
  if (v8 != 103)
    return a3;
  objc_msgSend((id)ASAppStoreUIBundle(), "localizedStringForKey:value:table:", CFSTR("NOT_ENOUGH_SPACE_FOR_SOME_APPS"), &stru_24F9637E0, 0);
  return (id)SSError();
}

- (id)_copyItemsByStorefrontFromItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = (void *)objc_msgSend(MEMORY[0x24BEC8C20], "loadedMap");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = (const __CFString *)objc_msgSend(v10, "itemIdentifier");
        if (v11)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithItemIdentifier:", v11);
          v11 = (const __CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "applicationForItemIdentifier:", v12), "storeFrontIdentifier"), "stringValue");

        }
        if (!v11)
          v11 = &stru_24F9637E0;
        v13 = (id)objc_msgSend(v4, "objectForKey:", v11);
        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v4, "setObject:forKey:", v13, v11);

        }
        objc_msgSend(v13, "addObject:", v10);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  return v4;
}

- (id)_tooBigForNetworkErrorForError:(id)a3 withCount:(int64_t)a4
{
  void *v6;
  const __CFString *v7;
  int v8;
  void *v9;
  uint64_t v10;

  if (MGGetBoolAnswer())
  {
    v6 = (void *)ASAppStoreUIBundle();
    v7 = CFSTR("TOO_BIG_FOR_NETWORK_BODY_FOR_APPS_WLAN");
  }
  else
  {
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB1DE8], "currentDevice"), "supportsDeviceCapability:", 0);
    v6 = (void *)ASAppStoreUIBundle();
    if (v8)
      v7 = CFSTR("TOO_BIG_FOR_NETWORK_BODY_FOR_APPS");
    else
      v7 = CFSTR("TOO_BIG_FOR_NETWORK_BODY_FOR_APPS_NO_WIFI");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_24F9637E0, 0);
  v9 = (void *)objc_msgSend(a3, "userInfo");
  v10 = objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEB24B0]);
  if (v10)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)ASAppStoreUIBundle(), "localizedStringForKey:value:table:", CFSTR("TOO_BIG_FOR_NETWORK_TITLE_FOR_APPS"), &stru_24F9637E0, 0), a4, v10);
  objc_msgSend(a3, "domain");
  objc_msgSend(a3, "code");
  return (id)SSError();
}

@end
