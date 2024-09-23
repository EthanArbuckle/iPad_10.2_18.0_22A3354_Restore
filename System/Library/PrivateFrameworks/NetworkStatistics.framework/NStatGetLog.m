@implementation NStatGetLog

void __NStatGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;
  void *v2;
  void *v3;
  pid_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[132];
  _BYTE buffer[100];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v0 = os_log_create("com.apple.networkstatistics", "NetworkStatistics");
  v1 = (void *)sNstatLogHandle;
  sNstatLogHandle = (uint64_t)v0;

  if (sNstatLogHandle)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", CFSTR("/Library/Preferences/com.apple.NetworkStatistics.plist"));
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v2, 0, 0, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v4 = getpid();
        if (proc_name(v4, buffer, 0x64u))
        {
          v25 = v2;
          v5 = 0x24BDD1000uLL;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buffer);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v24 = v3;
          v7 = v3;
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v29;
            v26 = v6;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v29 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                objc_msgSend(v7, "valueForKey:", v12);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (objc_msgSend(v12, "isEqualToString:", CFSTR("log_level")))
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "integerValue") >= 7)
                      defaultMgrFlags |= 0x10u;
                  }
                  else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("all")) & 1) != 0
                         || objc_msgSend(v12, "isEqualToString:", v6))
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v27 = v6;
                      v14 = v5;
                      v15 = v13;
                      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("traceFilePrefix"));
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("logVerbose"));
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("traceVerbose"));
                      v18 = (void *)objc_claimAutoreleasedReturnValue();

                      v5 = v14;
                      if (v16)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v19 = *(void **)(v14 + 1992);
                          v23 = getpid();
                          v20 = v19;
                          v5 = v14;
                          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@.%@.%d"), v16, v27, v23);
                          v21 = objc_claimAutoreleasedReturnValue();
                          v22 = (void *)traceFilePrefix;
                          traceFilePrefix = v21;

                        }
                      }
                      if (v17)
                        defaultMgrFlags |= 0x10u;
                      if (v18)
                        defaultMgrFlags |= 0x80u;

                      v6 = v26;
                    }
                  }
                }

              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            }
            while (v9);
          }

          v3 = v24;
          v2 = v25;
        }
      }

    }
  }
}

@end
