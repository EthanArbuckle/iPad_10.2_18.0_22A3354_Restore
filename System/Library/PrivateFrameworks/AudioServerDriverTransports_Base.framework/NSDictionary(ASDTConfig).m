@implementation NSDictionary(ASDTConfig)

- (id)asdtArrayForKey:()ASDTConfig
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSDictionary(ASDTConfig) asdtArrayForKey:].cold.1();
    goto LABEL_6;
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (id)asdtArrayOfDictionariesForKey:()ASDTConfig
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "asdtArrayForKey:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[NSDictionary(ASDTConfig) asdtArrayOfDictionariesForKey:].cold.1();

          v9 = 0;
          goto LABEL_13;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = v5;
LABEL_13:

  return v9;
}

- (id)asdtArrayOfNumbersForKey:()ASDTConfig
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "asdtArrayForKey:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[NSDictionary(ASDTConfig) asdtArrayOfNumbersForKey:].cold.1();

          v9 = 0;
          goto LABEL_13;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = v5;
LABEL_13:

  return v9;
}

- (id)asdtArrayOfStringsForKey:()ASDTConfig
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "asdtArrayForKey:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[NSDictionary(ASDTConfig) asdtArrayOfStringsForKey:].cold.1();

          v9 = 0;
          goto LABEL_13;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = v5;
LABEL_13:

  return v9;
}

- (id)asdtNumberForKey:()ASDTConfig
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSDictionary(ASDTConfig) asdtNumberForKey:].cold.1();
    goto LABEL_6;
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (uint64_t)asdtBoolForKey:()ASDTConfig
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "asdtNumberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (id)asdtStringForKey:()ASDTConfig
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSDictionary(ASDTConfig) asdtStringForKey:].cold.1();
    goto LABEL_6;
  }
  v6 = v5;
LABEL_7:

  return v6;
}

+ (BOOL)asdtGetFourCC:()ASDTConfig forObject:withDefault:
{
  id v7;
  id v8;
  unint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v9 = objc_msgSend(v8, "length");
    v10 = v9 < 5;
    if (v9 < 5)
    {
      v11 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      if (v11)
      {
        v12 = 0;
        a5 = 0;
        do
        {
          if (!*(_BYTE *)(v11 + v12))
            break;
          a5 = *(unsigned __int8 *)(v11 + v12++) | (a5 << 8);
        }
        while ((_DWORD)v12 != 4);
      }
      else
      {
        a5 = 0;
      }
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a5 = objc_msgSend(v7, "unsignedIntValue");
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
  }
  if (a3)
    *a3 = a5;

  return v10;
}

- (uint64_t)asdtFourCCForKey:()ASDTConfig withDefault:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v11;

  v6 = a3;
  v11 = a4;
  v7 = (void *)objc_opt_class();
  objc_msgSend(a1, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asdtGetFourCC:forObject:withDefault:", &v11, v8, a4);

  v9 = v11;
  return v9;
}

- (uint64_t)asdtDevices
{
  return objc_msgSend(a1, "asdtArrayOfDictionariesForKey:", CFSTR("Devices"));
}

- (uint64_t)asdtName
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("Name"));
}

- (id)asdtSubclass
{
  NSString *v1;
  NSString *v2;
  void *v3;

  objc_msgSend(a1, "asdtStringForKey:", CFSTR("Subclass"));
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    NSClassFromString(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)asdtFactorySubclass
{
  NSString *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "asdtStringForKey:", CFSTR("FactorySubclass"));
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "asdtStringForKey:", CFSTR("Subclass"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@Factory"), v4);
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  NSClassFromString(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)asdtServiceID
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "asdtStringForKey:", CFSTR("Identifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "asdtNumberForKey:", CFSTR("ClientType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntValue");

    +[ASDTIOServiceID forIdentifier:andClientType:](ASDTIOServiceID, "forIdentifier:andClientType:", v2, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)asdtFilePath
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("FilePath"));
}

- (uint64_t)asdtBundleResource
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("BundleRes"));
}

- (id)asdtBundleExtension
{
  void *v1;
  void *v2;
  int v3;
  uint64_t v4;

  objc_msgSend(a1, "asdtStringForKey:", CFSTR("BundleExt"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "substringWithRange:", 0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("."));

  if (v3)
  {
    objc_msgSend(v1, "substringFromIndex:", 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v4;
  }
  return v1;
}

- (uint64_t)asdtBundleSubdir
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("BundleSubdir"));
}

- (uint64_t)asdtBundlePath
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("BundlePath"));
}

- (id)asdtBundleClass
{
  NSString *v1;
  NSString *v2;
  void *v3;

  objc_msgSend(a1, "asdtStringForKey:", CFSTR("BundleClass"));
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    NSClassFromString(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)asdtClockDomain
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t DomainForFourCC;
  uint64_t v11;

  objc_msgSend(a1, "asdtStringForKey:", CFSTR("ClockDomain"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v1;
  if (v1)
  {
    v6 = objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
    DomainForFourCC = ASDT::Clock::GetDomainForFourCC(v6, v7, v8, v9);
  }
  else
  {
    DomainForFourCC = ASDT::Clock::GetSynchronousClockDomain(0, v2, v3, v4);
  }
  v11 = DomainForFourCC;

  return v11;
}

- (uint64_t)asdtControls
{
  return objc_msgSend(a1, "asdtArrayOfDictionariesForKey:", CFSTR("Controls"));
}

- (uint64_t)asdtCustomProperties
{
  return objc_msgSend(a1, "asdtArrayOfDictionariesForKey:", CFSTR("CustomProperties"));
}

- (uint64_t)asdtCanBeDefaultInputDevice
{
  return objc_msgSend(a1, "asdtBoolForKey:", CFSTR("CanBeDefaultInput"));
}

- (uint64_t)asdtCanBeDefaultOutputDevice
{
  return objc_msgSend(a1, "asdtBoolForKey:", CFSTR("CanBeDefaultOutput"));
}

- (uint64_t)asdtCanBeDefaultSystemDevice
{
  return objc_msgSend(a1, "asdtBoolForKey:", CFSTR("CanBeDefaultSystem"));
}

- (id)asdtLatenciesForSamplingRates:()ASDTConfig latencyUsKey:latencyDictKey:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v28 = a4;
  v29 = a5;
  v30 = v8;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", v29);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asdtNumericSortAscending:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKey:", v16, v28);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            objc_msgSend(v12, "asdtNearestNumberToNumber:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKey:", v18);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
              continue;
          }
          +[ASDTUtils latencyFramesForSamplingRate:andMicroseconds:](ASDTUtils, "latencyFramesForSamplingRate:andMicroseconds:", v16, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v19, v16);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v13);
    }
  }
  else
  {
    objc_msgSend(a1, "asdtNumberForKey:", v28, v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_23;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v20);
          v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
          +[ASDTUtils latencyFramesForSamplingRate:andMicroseconds:](ASDTUtils, "latencyFramesForSamplingRate:andMicroseconds:", v24, v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v25, v24);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v21);
    }
  }

LABEL_23:
  if (objc_msgSend(v9, "count"))
    v26 = (void *)objc_msgSend(v9, "copy");
  else
    v26 = 0;

  return v26;
}

- (id)asdtInputLatenciesForSamplingRates:()ASDTConfig
{
  objc_msgSend(a1, "asdtLatenciesForSamplingRates:latencyUsKey:latencyDictKey:", a3, CFSTR("InputLatencyUs"), CFSTR("InputLatencies"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)asdtOutputLatenciesForSamplingRates:()ASDTConfig
{
  objc_msgSend(a1, "asdtLatenciesForSamplingRates:latencyUsKey:latencyDictKey:", a3, CFSTR("OutputLatencyUs"), CFSTR("OutputLatencies"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)asdtDeviceModel
{
  void *v2;

  objc_msgSend(a1, "asdtStringForKey:", CFSTR("DeviceModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "asdtStringForKey:", CFSTR("DeviceUID"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (uint64_t)asdtDeviceUID
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("DeviceUID"));
}

- (uint64_t)asdtPMDevices
{
  return objc_msgSend(a1, "asdtArrayOfDictionariesForKey:", CFSTR("PMDevices"));
}

- (uint64_t)asdtPMOrderWithDefaultForPowerUp:()ASDTConfig
{
  unsigned int v4;

  v4 = 1000;
  objc_msgSend(a1, "asdtPMOrder:forPowerUp:allowDefault:", &v4, a3, 1);
  return v4;
}

- (uint64_t)asdtSamplingRate:()ASDTConfig andSamplingRates:withDefault:
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("SamplingRate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "asdtArrayOfNumbersForKey:", CFSTR("SamplingRates"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_8;
  }
  else
  {
    if (v10)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "isEqualToNumber:", v9, (_QWORD)v19) & 1) != 0)
        {

          if (a4)
          {
            objc_msgSend(v9, "doubleValue");
            *a4 = v17;
          }
          if (a5)
            *a5 = objc_retainAutorelease(v12);
          v16 = 1;
          goto LABEL_24;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
        continue;
      break;
    }
  }

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NSDictionary(ASDTConfig) asdtSamplingRate:andSamplingRates:withDefault:].cold.1();
  v16 = 0;
LABEL_24:

  return v16;
}

- (uint64_t)asdtStreams
{
  return objc_msgSend(a1, "asdtArrayOfDictionariesForKey:", CFSTR("Streams"));
}

- (uint64_t)asdtTransportType
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("TransportType"), 0);
}

- (uint64_t)asdtUnderlyingDeviceUID
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("UnderlyingDeviceUID"));
}

- (id)asdtRelatedDeviceUIDs
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "asdtArrayOfStringsForKey:", CFSTR("RelatedDeviceUIDs"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)asdtElement
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("Element"), 0);
}

- (uint64_t)asdtIsSettable
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("IsSettable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (uint64_t)asdtScope
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("Scope"), 1735159650);
}

- (uint64_t)asdtGetSelector:()ASDTConfig
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "objectForKey:", CFSTR("Selector"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "asdtGetFourCC:forObject:withDefault:", a3, v6, 0);

  if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NSDictionary(ASDTConfig) asdtGetSelector:].cold.1();
  return v7;
}

- (id)asdtPropertyAddress
{
  id v2;
  unsigned int v4;

  v4 = 0;
  if (!objc_msgSend(a1, "asdtGetSelector:", &v4))
    return 0;
  v2 = objc_alloc(MEMORY[0x24BE0A260]);
  return (id)objc_msgSend(v2, "initWithSelector:scope:element:", v4, objc_msgSend(a1, "asdtScope"), objc_msgSend(a1, "asdtElement"));
}

- (BOOL)asdtControlClassID:()ASDTConfig
{
  int v4;
  int v5;

  v4 = objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("ClassID"), 0);
  v5 = v4;
  if (v4)
  {
    *a3 = v4;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[NSDictionary(ASDTConfig) asdtControlClassID:].cold.1();
  }
  return v5 != 0;
}

- (uint64_t)asdtSelectorControlItems
{
  return objc_msgSend(a1, "asdtArrayOfDictionariesForKey:", CFSTR("Items"));
}

- (uint64_t)asdtSelectorControlItemValue:()ASDTConfig
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "objectForKey:", CFSTR("Value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "asdtGetFourCC:forObject:withDefault:", a3, v6, 0);

  if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NSDictionary(ASDTConfig) asdtSelectorControlItemValue:].cold.1();
  return v7;
}

- (uint64_t)asdtSelectorControlItemSelected
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("Selected"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)asdtSelectorControlItemKind
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("Kind"), 0);
}

- (uint64_t)asdtPropertyValue
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("Value"));
}

- (uint64_t)asdtPropertyCacheMode
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "asdtStringForKey:", CFSTR("CacheMode"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if (!objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("Never")))
    {
      v3 = 0;
      goto LABEL_10;
    }
    if (!objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("Always")))
    {
      v3 = 2;
      goto LABEL_10;
    }
    if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("Explicit"))
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[NSDictionary(ASDTConfig) asdtPropertyCacheMode].cold.1();
    }
  }
  v3 = 1;
LABEL_10:

  return v3;
}

- (uint64_t)asdtPropertyDataSizeBytes
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("DataSize"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)asdtPropertyIsPList
{
  if (objc_msgSend(a1, "asdtBoolForKey:", CFSTR("IsPList")))
    return 1886155636;
  else
    return 1918990199;
}

- (uint64_t)asdtNumericType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "asdtStringForKey:", CFSTR("NumericType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    goto LABEL_23;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("float")) & 1) == 0)
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("double")) & 1) != 0)
    {
      v3 = 2;
      goto LABEL_24;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("int8_t")) & 1) != 0)
    {
      v3 = 3;
      goto LABEL_24;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("int16_t")) & 1) != 0)
    {
      v3 = 4;
      goto LABEL_24;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("int32_t")) & 1) != 0)
    {
      v3 = 5;
      goto LABEL_24;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("int64_t")) & 1) != 0)
    {
      v3 = 6;
      goto LABEL_24;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("uint8_t")) & 1) != 0)
    {
      v3 = 7;
      goto LABEL_24;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("uint16_t")) & 1) != 0)
    {
      v3 = 8;
      goto LABEL_24;
    }
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("uint32_t")) & 1) == 0)
    {
      if ((objc_msgSend(v2, "isEqualToString:", CFSTR("uint64_t")) & 1) != 0)
      {
        v3 = 10;
        goto LABEL_24;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[NSDictionary(ASDTConfig) asdtNumericType].cold.1();
    }
LABEL_23:
    v3 = 9;
    goto LABEL_24;
  }
  v3 = 1;
LABEL_24:

  return v3;
}

- (uint64_t)asdtNumericCount
{
  void *v1;
  unsigned int v2;
  uint64_t v3;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("NumericCount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");
  if (v2 <= 1)
    v3 = 1;
  else
    v3 = v2;

  return v3;
}

- (uint64_t)asdtNumericIsVectorWithCount:()ASDTConfig
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("NumericIsVector"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = a3 > 1;

  return v6;
}

- (uint64_t)asdtDirection:()ASDTConfig
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;

  if (a3)
  {
    objc_msgSend(a1, "asdtStringForKey:", CFSTR("Direction"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("input")))
      {
        if (objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("output")))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[NSDictionary(ASDTConfig) asdtDirection:].cold.2();
LABEL_10:
          v6 = 0;
LABEL_14:

          return v6;
        }
        v7 = 1869968496;
      }
      else
      {
        v7 = 1768845428;
      }
      *a3 = v7;
      v6 = 1;
      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSDictionary(ASDTConfig) asdtDirection:].cold.1();
    goto LABEL_10;
  }
  return 0;
}

- (id)asdtFormats
{
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "asdtArrayOfDictionariesForKey:", CFSTR("Formats"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      -[NSDictionary(ASDTConfig) asdtFormats].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return v1;
}

- (id)asdtLatenciesForSamplingRates:()ASDTConfig
{
  objc_msgSend(a1, "asdtLatenciesForSamplingRates:latencyUsKey:latencyDictKey:", a3, CFSTR("LatencyUs"), CFSTR("Latencies"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)asdtStartingChannel
{
  void *v1;
  unsigned int v2;
  uint64_t v3;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("StartingChannel"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");
  if (v2 <= 1)
    v3 = 1;
  else
    v3 = v2;

  return v3;
}

- (uint64_t)asdtTerminalType
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("TerminalType"), 0);
}

- (uint64_t)asdtIsolatedUseCaseID
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("IsolatedUseCaseID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedLongLongValue");

  return v2;
}

- (uint64_t)asdtExclavesBufferName
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("ExclavesBufferName"));
}

- (id)asdtFormatsWithSamplingRates:()ASDTConfig
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  double v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  int v18;
  int v19;
  void *v20;
  unsigned int v21;
  unsigned int v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v53;
    v7 = 0.0;
    v8 = INFINITY;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v53 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "doubleValue");
        if (v10 < v8)
          v8 = v10;
        if (v10 > v7)
          v7 = v10;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = INFINITY;
  }

  v46 = 0;
  v47 = xmmword_236D2B7E0;
  v48 = 0;
  v49 = 0;
  v50 = v8;
  v51 = v7;
  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("AlignedHigh"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 && !objc_msgSend(v41, "BOOLValue"))
    v11 = 0;
  else
    v11 = 16;
  DWORD1(v47) = v11;
  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("Channels"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    goto LABEL_22;
  v14 = objc_msgSend(v12, "unsignedIntValue");
  if ((v14 - 33) <= 0xFFFFFFDF)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSDictionary(ASDTConfig) asdtFormatsWithSamplingRates:].cold.3(v14);
LABEL_22:
    v14 = 2;
  }
  objc_msgSend(a1, "asdtStringForKey:", CFSTR("DataFormat"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15 || !objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("lf32")))
  {
LABEL_30:
    v17 = 32;
    v18 = 1;
    goto LABEL_35;
  }
  if (objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("li16")))
  {
    if (objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("li24")))
    {
      if (objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("li32")))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[NSDictionary(ASDTConfig) asdtFormatsWithSamplingRates:].cold.2();
        goto LABEL_30;
      }
      v17 = 32;
    }
    else
    {
      v17 = 24;
    }
  }
  else
  {
    v17 = 16;
  }
  v18 = 4;
LABEL_35:
  v19 = v11 | v18;
  DWORD1(v47) = v11 | v18;
  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("BitsPerSample"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntValue");

  if (v21 <= 0x20 && v21 >= v17)
    v23 = v21;
  else
    v23 = v17;
  if (v17 == v23)
    DWORD1(v47) = v19 | 8;
  HIDWORD(v48) = v14;
  LODWORD(v49) = v17;
  LODWORD(v48) = (v23 >> 3) * v14;
  DWORD2(v47) = v48;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v25 = v4;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v43;
    while (2)
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "doubleValue");
        v46 = v29;
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0A270]), "initWithAudioStreamRangedDescription:", &v46);
        if (!v30)
        {
          v32 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v32)
            -[NSDictionary(ASDTConfig) asdtFormatsWithSamplingRates:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);

          v31 = 0;
          goto LABEL_55;
        }
        objc_msgSend(v24, "addObject:", v30);

      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      if (v26)
        continue;
      break;
    }
  }

  v31 = (void *)objc_msgSend(v24, "copy");
LABEL_55:

  return v31;
}

- (uint64_t)asdtPMOrder:()ASDTConfig forPowerUp:allowDefault:
{
  uint64_t v5;
  __CFString **v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  unsigned int v12;
  BOOL v13;
  int v14;
  int v15;
  void *v16;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  LODWORD(v5) = a5;
  v8 = kASDTConfigKeyDevicePMOrderPowerUp;
  if (!a4)
    v8 = kASDTConfigKeyDevicePMOrderPowerDown;
  v9 = *v8;
  objc_msgSend(a1, "asdtNumberForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v9;
  }
  else
  {
    v11 = CFSTR("PMOrder");

    objc_msgSend(a1, "asdtNumberForKey:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_msgSend(v10, "unsignedIntValue");
  if (v10)
    v13 = v12 >= 0x7D1;
  else
    v13 = 1;
  v14 = !v13;
  if (v13)
    v5 = v5;
  else
    v5 = 1;
  if ((v5 & 1) != 0)
  {
    if (v14)
      v15 = v12;
    else
      v15 = 1000;
    *a3 = v15;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a1, "objectForKey:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary(ASDTConfig) asdtPMOrder:forPowerUp:allowDefault:].cold.1((uint64_t)v11, v16, v18);
  }

  return v5;
}

- (uint64_t)asdtPMOrder:()ASDTConfig forPowerUp:
{
  return objc_msgSend(a1, "asdtPMOrder:forPowerUp:allowDefault:", a3, a4, 0);
}

- (uint64_t)asdtPMNoStateChangeOnFailure
{
  return objc_msgSend(a1, "asdtBoolForKey:", CFSTR("PMNoStateChangeOnFailure"));
}

- (uint64_t)asdtPMActionExecuteTransition
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("ExecuteTransition"), 0);
}

- (uint64_t)asdtPMActionBackgroundTransition
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("BackgroundTransition"), 0);
}

- (uint64_t)asdtPMActionOnce
{
  return objc_msgSend(a1, "asdtBoolForKey:", CFSTR("Once"));
}

- (uint64_t)asdtPMActionWaiterActionName
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("WaiterActionName"));
}

- (uint64_t)asdtPMActionWaiterTimeoutUs
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("WaiterTimeoutUs"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (uint64_t)asdtPMActionAnalyticsEventName
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("EventName"));
}

- (uint64_t)asdtPMActionAnalyticsEventField
{
  return objc_msgSend(a1, "asdtStringForKey:", CFSTR("EventField"));
}

- (uint64_t)asdtPMEnablerEnableTransition
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("EnableTransition"), 1970435438);
}

- (uint64_t)asdtPMEnablerDisableTransition
{
  return objc_msgSend(a1, "asdtFourCCForKey:withDefault:", CFSTR("DisableTransition"), 1685092205);
}

- (objc_class)asdtDeviceManager
{
  NSString *v1;
  NSString *v2;
  Class v3;
  objc_class *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a1, "asdtStringForKey:", CFSTR("DeviceManager"));
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      -[NSDictionary(ASDTConfig) asdtDeviceManager].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_11;
  }
  v3 = NSClassFromString(v1);
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSDictionary(ASDTConfig) asdtDeviceManager].cold.2();
    goto LABEL_11;
  }
  if ((-[objc_class isSubclassOfClass:](v3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NSDictionary(ASDTConfig) asdtDeviceManager].cold.3();
LABEL_11:
    v4 = 0;
    goto LABEL_12;
  }
  v4 = v3;
LABEL_12:

  return v4;
}

- (uint64_t)asdtManagerVerboseLogging
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("VerboseLogging"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (uint64_t)asdtManagerInitializationWaitUs
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("InitializationWaitUs"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "unsignedIntValue");
  else
    v3 = 100000;

  return v3;
}

- (double)asdtManagerRunningLogPeriod
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("RunningLogPeriodSec"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "doubleValue");
    v4 = v3;
  }
  else
  {
    v4 = 60.0;
  }

  return v4;
}

- (uint64_t)asdtManagerAudioObjectMaxCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "asdtNumberForKey:", CFSTR("AudioObjectMaxCount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntValue");

  return v2;
}

- (void)asdtArrayForKey:()ASDTConfig .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%@ configuration value is not an array.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtArrayOfDictionariesForKey:()ASDTConfig .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Array %@ must contain dictionaries; found: %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtArrayOfNumbersForKey:()ASDTConfig .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Array '%@' must contain numbers; found: %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtArrayOfStringsForKey:()ASDTConfig .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Array '%@' must contain strings; found: %@",
    v1,
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtNumberForKey:()ASDTConfig .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%@ configuration value is not a number.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtStringForKey:()ASDTConfig .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%@ configuration value is not a string.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtSamplingRate:()ASDTConfig andSamplingRates:withDefault:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  uint8_t v2[22];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_9();
  v3 = v0;
  v4 = v1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@ array must contain %@ value '%@'", v2, 0x20u);
}

- (void)asdtGetSelector:()ASDTConfig .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Property selector is required in object: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtControlClassID:()ASDTConfig .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Control key %@ is required.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtSelectorControlItemValue:()ASDTConfig .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Selector control key %@ is required.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtPropertyCacheMode
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Bad %@ value: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtNumericType
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Bad numeric type '%@'.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtDirection:()ASDTConfig .cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%@ property is missing.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtDirection:()ASDTConfig .cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_9();
  OUTLINED_FUNCTION_1(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "%@ property invalid value: %@.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtFormats
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "A stream must define at least one format.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)asdtFormatsWithSamplingRates:()ASDTConfig .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_236CEE000, MEMORY[0x24BDACB70], a3, "Error allocating memory for stream format.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)asdtFormatsWithSamplingRates:()ASDTConfig .cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Invalid data format: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)asdtFormatsWithSamplingRates:()ASDTConfig .cold.3(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Invalid number of channels: %u", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_9();
}

- (void)asdtPMOrder:()ASDTConfig forPowerUp:allowDefault:.cold.1(uint64_t a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412802;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 2000;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Invalid %@ value: %@. Valid range: [0 - %u]", buf, 0x1Cu);

}

- (void)asdtDeviceManager
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_236CEE000, MEMORY[0x24BDACB70], v0, "Class '%@' is not a subclass of ASDTDeviceManager.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
