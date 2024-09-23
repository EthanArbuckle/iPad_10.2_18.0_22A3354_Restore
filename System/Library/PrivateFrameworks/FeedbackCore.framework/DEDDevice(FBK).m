@implementation DEDDevice(FBK)

- (id)displayName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (FBKIsEmptyString(v2))
    objc_msgSend(a1, "displayType");
  else
    objc_msgSend(a1, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (__CFString)displayType
{
  void *v2;
  BOOL v3;
  void *v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;

  objc_msgSend(a1, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = FBKIsEmptyString(v2);

  if (v3)
  {
    objc_msgSend(a1, "productType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = FBKIsEmptyString(v4);

    if (v5)
    {
      objc_msgSend(a1, "deviceClass");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = FBKIsEmptyString(v6);

      if (v7)
      {
        v8 = 0;
        goto LABEL_9;
      }
      objc_msgSend(a1, "deviceClass");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "productType");
      v9 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(a1, "model");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (__CFString *)v9;
LABEL_9:
  if (v8)
    v10 = v8;
  else
    v10 = CFSTR("Unknown");
  v11 = v10;

  return v11;
}

- (BOOL)isFBKPaired
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  objc_msgSend(a1, "deviceDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addressFBKKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1, "deviceDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addressFBKKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

    objc_msgSend(a1, "pairToFBK");
  }
  objc_msgSend(a1, "deviceDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "FBKKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  return v10;
}

- (void)pairToFBK
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "deviceDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serialize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "FBKKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

- (void)removeFBKPairing
{
  void *v2;
  id v3;

  objc_msgSend(a1, "deviceDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "FBKKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

- (uint64_t)isVisibleToDED
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BE2CA50], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasDevice:", a1);

  return v3;
}

+ (id)FBKKnownDevices
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "devicesData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x24BE2C9D0];
    *(_QWORD *)&v5 = 138543362;
    v16 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v8, v16, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE2CA40], "deviceWithDictionary:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v2, "addObject:", v12);
        }
        else
        {
          +[FBKLog ded](FBKLog, "ded");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_error_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_ERROR, "Could not build device from [%{public}@]", buf, 0xCu);
          }

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)updateStoredCopyIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "publicLogDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_DEBUG, "Device [%{public}@] has not changed", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_2_1();
}

- (id)debugDetails
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\nSERIALIZED:\n"));
  v3 = (void *)MEMORY[0x24BE2CA40];
  objc_msgSend(a1, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jsonWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v5);

  objc_msgSend(v2, "appendFormat:", CFSTR("\n\nDESCRIPTION:\n"));
  objc_msgSend(a1, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)jsonWithObject:()FBK
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 1, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Got an error: %@"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

+ (id)devicesData
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "deviceDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
  objc_msgSend(v2, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF BEGINSWITH %@"), CFSTR("fba-device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v3, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)inspectFBKPairing
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "devicesData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "jsonWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)FBKKey
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@-%li"), CFSTR("fba-device"), v3, objc_msgSend(a1, "remoteTransport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)addressFBKKey
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("fba-device"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)deviceDefaults
{
  return objc_msgSend((id)objc_opt_class(), "deviceDefaults");
}

+ (id)deviceDefaults
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)_FBKDEDDeviceDefaults;
  if (!_FBKDEDDeviceDefaults)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.fba.devices"));
    v2 = (void *)_FBKDEDDeviceDefaults;
    _FBKDEDDeviceDefaults = v1;

    v0 = (void *)_FBKDEDDeviceDefaults;
  }
  return v0;
}

@end
