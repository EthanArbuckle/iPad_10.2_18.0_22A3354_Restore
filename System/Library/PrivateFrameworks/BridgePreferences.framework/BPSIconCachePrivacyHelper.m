@implementation BPSIconCachePrivacyHelper

+ (id)saltedHashForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_perDeviceSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_naiveHashForString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_naiveHashForString:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA1((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);

  return v4;
}

+ (id)_perDeviceSalt
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__BPSIconCachePrivacyHelper__perDeviceSalt__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_perDeviceSalt_onceToken != -1)
    dispatch_once(&_perDeviceSalt_onceToken, block);
  return (id)_perDeviceSalt_saltString;
}

+ (void)setCachePath:(id)a3
{
  objc_storeStrong((id *)&_cacheDirectoryPath, a3);
}

void __43__BPSIconCachePrivacyHelper__perDeviceSalt__block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = (id)_cacheDirectoryPath;
  if (!v2)
  {
    bps_utility_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21147E000, v3, OS_LOG_TYPE_DEFAULT, "ERROR!! cacheDir was not set!", buf, 2u);
    }

  }
  v4 = (void *)MGCopyAnswer();
  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_naiveHashForString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v11, 4, &v34);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v34;
  v14 = (void *)_perDeviceSalt_saltString;
  _perDeviceSalt_saltString = v12;

  if (v13)
  {
    v28 = v4;
    bps_utility_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v13;
      _os_log_impl(&dword_21147E000, v15, OS_LOG_TYPE_DEFAULT, "Read Error (let's clear the cache). Error %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentsOfDirectoryAtPath:error:", v2, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v31 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v2, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeItemAtPath:error:", v22, 0);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v19);
    }

    v4 = v28;
  }
  if (!objc_msgSend((id)_perDeviceSalt_saltString, "length"))
  {
    v23 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(v23, "UUIDString");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)_perDeviceSalt_saltString;
    _perDeviceSalt_saltString = v24;

    v29 = 0;
    objc_msgSend((id)_perDeviceSalt_saltString, "writeToFile:atomically:encoding:error:", v11, 1, 4, &v29);
    v26 = v29;
    if (v26)
    {
      bps_utility_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v26;
        _os_log_impl(&dword_21147E000, v27, OS_LOG_TYPE_DEFAULT, "Write Error: %@", buf, 0xCu);
      }

    }
  }

}

@end
