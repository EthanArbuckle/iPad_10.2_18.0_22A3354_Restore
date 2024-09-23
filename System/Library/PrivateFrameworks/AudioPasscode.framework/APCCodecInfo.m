@implementation APCCodecInfo

+ (id)supportedDecoders
{
  EchoCodecCapability *v2;
  NullCodecCapability *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(EchoCodecCapability);
  v3 = objc_alloc_init(NullCodecCapability);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)supportedEncoders
{
  EchoCodecCapability *v2;
  NullCodecCapability *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(EchoCodecCapability);
  v3 = objc_alloc_init(NullCodecCapability);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)supportedConfigurationClasses
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  objc_msgSend(v2, "addObject:", objc_opt_class());
  return v2;
}

+ (Class)configurationClassForName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_class *v8;
  id v9;
  void *v10;
  char v11;
  objc_class *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  +[APCCodecInfo supportedConfigurationClasses](APCCodecInfo, "supportedConfigurationClasses", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(objc_class **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = objc_alloc_init(v8);
        objc_msgSend(v9, "algorithmName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if ((v11 & 1) != 0)
        {
          v12 = v8;

          goto LABEL_13;
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("default")))
  {
    objc_opt_class();
    v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  return v12;
}

+ (BOOL)isSupportedCodecCapability:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 0;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }

  return isKindOfClass & 1;
}

+ (BOOL)isSupportedCodecConfiguration:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 0;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }

  return isKindOfClass & 1;
}

@end
