@implementation BCSAppRanker

+ (id)orderApps:(id)a3 forLastUsedApp:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint8_t *v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") <= 1 || !v6)
    goto LABEL_6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSAppRanker: Found last used app for scanned URL", buf, 2u);
  }
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  if (!v9)
  {
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v24 = 0;
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __41__BCSAppRanker_orderApps_forLastUsedApp___block_invoke;
    v16 = &unk_24D787740;
    v17 = v6;
    v18 = buf;
    v12 = objc_msgSend(v5, "indexOfObjectPassingTest:", &v13);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v5;
    }
    else
    {
      v10 = (id)objc_msgSend(v5, "mutableCopy", v13, v14, v15, v16);
      objc_msgSend(v10, "removeObjectAtIndex:", v12);
      objc_msgSend(v10, "insertObject:atIndex:", *((_QWORD *)v20 + 5), 0);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
LABEL_6:
    v10 = v5;
  }

  return v10;
}

uint64_t __41__BCSAppRanker_orderApps_forLastUsedApp___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((_DWORD)v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

  return v10;
}

+ (void)setLastUsedApp:(id)a3 forURL:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_bcs_isUPIURL"))
  {
    objc_msgSend(v5, "scheme");
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = CFSTR("schemesToLastUsedApps");
    v6 = (void *)v7;
  }
  else
  {
    v8 = CFSTR("hostsToLastUsedApps");
  }
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "bcs_barcodeSupportDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 != v14 && (objc_msgSend(v11, "isEqualToString:", v14) & 1) == 0)
    {
      if (v10)
      {
        v12 = (void *)objc_msgSend(v10, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;
      if (v14)
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v6);
      else
        objc_msgSend(v12, "removeObjectForKey:", v6);
      objc_msgSend(v9, "setObject:forKey:", v13, v8);
      objc_msgSend(v9, "synchronize");

    }
  }

}

+ (id)bundleIdentifierOfLastUsedAppForURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_bcs_isUPIURL"))
  {
    objc_msgSend(v3, "scheme");
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = CFSTR("schemesToLastUsedApps");
    v4 = (void *)v5;
  }
  else
  {
    v6 = CFSTR("hostsToLastUsedApps");
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "bcs_barcodeSupportDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v4, "length"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
