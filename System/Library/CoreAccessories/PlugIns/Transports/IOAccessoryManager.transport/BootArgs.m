@implementation BootArgs

- (BootArgs)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_configuredBootArgs);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

+ (id)configuredBootArgs
{
  if (configuredBootArgs_onceToken != -1)
    dispatch_once(&configuredBootArgs_onceToken, &__block_literal_global_2);
  return (id)configuredBootArgs_bootArgsDict;
}

void __30__BootArgs_configuredBootArgs__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  +[BootArgs configuredBootArgsString](BootArgs, "configuredBootArgsString");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "componentsSeparatedByString:", CFSTR(" "));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
    {
      v15 = v1;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v14 = v2;
      v4 = v2;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v17;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v17 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "componentsSeparatedByString:", CFSTR("="), v14);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v9, "count"))
            {
              if ((unint64_t)objc_msgSend(v9, "count") < 2)
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              else
                objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);

            }
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v6);
      }

      v12 = objc_msgSend(v3, "copy");
      v13 = (void *)configuredBootArgs_bootArgsDict;
      configuredBootArgs_bootArgsDict = v12;

      v2 = v14;
      v1 = v15;
    }

  }
}

+ (id)configuredBootArgsString
{
  if (configuredBootArgsString_onceToken != -1)
    dispatch_once(&configuredBootArgsString_onceToken, &__block_literal_global_9);
  return (id)configuredBootArgsString_bootArgsString;
}

void __36__BootArgs_configuredBootArgsString__block_invoke()
{
  io_registry_entry_t v0;
  io_object_t v1;
  void *CFProperty;
  CFTypeID v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v0 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], "IODeviceTree:/options");
  if (v0)
  {
    v1 = v0;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v0, CFSTR("boot-args"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    IOObjectRelease(v1);
    if (CFProperty)
    {
      v3 = CFGetTypeID(CFProperty);
      if (v3 == CFStringGetTypeID())
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFProperty, "stringByTrimmingCharactersInSet:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)configuredBootArgsString_bootArgsString;
        configuredBootArgsString_bootArgsString = v5;

      }
      CFRelease(CFProperty);
    }
  }
}

+ (id)stringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[BootArgs configuredBootArgs](BootArgs, "configuredBootArgs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)numberForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unsigned int v8;

  +[BootArgs stringForKey:](BootArgs, "stringForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v4, "setNumberStyle:", 1);
    objc_msgSend(v4, "numberFromString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -1431655766;
      if (objc_msgSend(v6, "scanHexInt:", &v8))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)BOOLForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[BootArgs numberForKey:](BootArgs, "numberForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    +[BootArgs stringForKey:](BootArgs, "stringForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v6 = v7
      && (!objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("true"))
       || !objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("yes")));

  }
  return v6;
}

+ (int64_t)integerForKey:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  +[BootArgs numberForKey:](BootArgs, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

+ (int)intForKey:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  +[BootArgs numberForKey:](BootArgs, "numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "intValue");
  else
    v5 = 0;

  return v5;
}

@end
