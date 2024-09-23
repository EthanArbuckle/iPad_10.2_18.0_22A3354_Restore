@implementation DYMTLDerivedCounterSupport

+ (void)mergeDictionaries:(id)a3 right:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v17 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Version"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Version"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      _DYOLog();
      goto LABEL_21;
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v17;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v11)
    goto LABEL_19;
  v12 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v19 != v12)
        objc_enumerationMutation(v10);
      v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v5, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v14);
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_17;
        objc_msgSend(v15, "addObjectsFromArray:", v16);
        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[DYMTLDerivedCounterSupport mergeDictionaries:right:](DYMTLDerivedCounterSupport, "mergeDictionaries:right:", v15, v16);
LABEL_16:

        }
      }
LABEL_17:

    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v11);
LABEL_19:

LABEL_21:
}

- (BOOL)addAnalysisWithPrefix:(id)a3 andScriptPrefix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSString *analysisScript;
  NSString *v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSString *derivedCounterScript;
  NSString *v21;
  NSString *v22;
  id v24;
  id v25;
  id v26;
  id v27;

  v6 = a4;
  objc_msgSend(a3, "stringByAppendingString:", CFSTR("-counters.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v7, 0, &v27);
  v9 = v27;
  if (v8)
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v8, 1, 0, &v26);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v26;
    if (v11)
    {
      _DYOLog();
    }
    else if (v10)
    {
      +[DYMTLDerivedCounterSupport mergeDictionaries:right:](DYMTLDerivedCounterSupport, "mergeDictionaries:right:", self->_counterDictionary, v10);
    }

    objc_msgSend(v6, "stringByAppendingString:", CFSTR("-analysis.js"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithContentsOfFile:encoding:error:", v12, 4, &v25);
    v14 = v25;
    if (v14)
    {
      _DYOLog();
      analysisScript = self->_analysisScript;
      self->_analysisScript = (NSString *)&stru_2511238E0;
    }
    else
    {
      v16 = self->_analysisScript;
      if (v16)
      {
        -[NSString stringByAppendingString:](v16, "stringByAppendingString:", v13);
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = v13;
      }
      analysisScript = self->_analysisScript;
      self->_analysisScript = v17;
    }

    objc_msgSend(v6, "stringByAppendingString:", CFSTR("-derived.js"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithContentsOfFile:encoding:error:", v18, 4, &v24);
    v9 = v24;
    if (v9)
    {
      _DYOLog();
    }
    else
    {
      derivedCounterScript = self->_derivedCounterScript;
      if (derivedCounterScript)
      {
        -[NSString stringByAppendingString:](derivedCounterScript, "stringByAppendingString:", v19);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = v19;
      }
      v22 = self->_derivedCounterScript;
      self->_derivedCounterScript = v21;

    }
  }

  return v8 != 0;
}

- (void)_loadAnalysis:(id)a3 vendorStringNames:(id)a4 vendorScriptPrefix:(id)a5
{
  NSMutableDictionary *v8;
  NSMutableDictionary *counterDictionary;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t i;
  DYMTLDerivedCounterSupport *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v24 = a4;
  v25 = a5;
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  counterDictionary = self->_counterDictionary;
  v29 = self;
  self->_counterDictionary = v8;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v26 = objc_msgSend(&unk_251127EE8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v26)
  {
    v23 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(&unk_251127EE8);
        v10 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (v25
          && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v30, v25),
              (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v27 = v11;
          objc_msgSend(v11, "stringByStandardizingPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
          v27 = 0;
        }
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v13 = v24;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v32;
LABEL_12:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v16);
            if ((objc_msgSend(v17, "containsString:", CFSTR("autocorr")) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v10, v30, v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "stringByStandardizingPath");
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = (void *)v19;
              v21 = v12 ? v12 : (void *)v19;
              v22 = -[DYMTLDerivedCounterSupport addAnalysisWithPrefix:andScriptPrefix:](v29, "addAnalysisWithPrefix:andScriptPrefix:", v19, v21);

              if (v22)
                break;
            }
            if (v14 == ++v16)
            {
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (v14)
                goto LABEL_12;
              break;
            }
          }
        }

      }
      v26 = objc_msgSend(&unk_251127EE8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v26);
  }

}

- (void)_addGPUTimeEntry
{
  void *v3;
  void *v4;
  NSString *derivedCounterScript;
  void *v6;
  NSString *v7;
  NSString *v8;
  id v9;

  {
    -[DYMTLDerivedCounterSupport _addGPUTimeEntry]::kGPUTimeCounter = (uint64_t)(id)*MEMORY[0x24BE39408];
  }
  v9 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", CFSTR("MTLStat_nSec"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v3, CFSTR("counters"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("GPU Time"), CFSTR("name"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("GPU Time in nSec"), CFSTR("description"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("Count"), CFSTR("type"));
  -[NSMutableDictionary objectForKeyedSubscript:](self->_counterDictionary, "objectForKeyedSubscript:", *MEMORY[0x24BE39388]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, -[DYMTLDerivedCounterSupport _addGPUTimeEntry]::kGPUTimeCounter);
  derivedCounterScript = self->_derivedCounterScript;
  if (derivedCounterScript)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "\nfunction GPUToolsGPUTime()\n{\n   return MTLStat_nSec\n}\n");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingString:](derivedCounterScript, "stringByAppendingString:", v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    v8 = self->_derivedCounterScript;
    self->_derivedCounterScript = v7;

  }
}

- (DYMTLDerivedCounterSupport)initWithMTLDevice:(id)a3
{
  id v4;
  DYMTLDerivedCounterSupport *v5;
  uint64_t v6;
  DYMTLDerivedCounterSupport *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DYMTLDerivedCounterSupport;
  v5 = -[DYMTLDerivedCounterSupport init](&v9, sel_init);
  if (!v5)
    goto LABEL_6;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_msgSend(v4, "baseObject");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = -[DYMTLDerivedCounterSupport initWithAcceleratorPort:](v5, "initWithAcceleratorPort:", objc_msgSend(v4, "acceleratorPort"));
    v7 = v5;
  }
  else
  {
LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (DYMTLDerivedCounterSupport)initWithAcceleratorPort:(unsigned int)a3
{
  DYMTLDerivedCounterSupport *v4;
  void *CFProperty;
  const __CFString *v6;
  const __CFString *v7;
  CFTypeID v8;
  __CFString *v9;
  DYMTLDerivedCounterSupport *v10;
  CFTypeID v11;
  CFTypeID TypeID;
  BOOL v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  DYMTLDerivedCounterSupport *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)DYMTLDerivedCounterSupport;
  v4 = -[DYMTLDerivedCounterSupport init](&v23, sel_init);
  if (v4)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, CFSTR("MetalPluginName"), 0, 0);
    if (CFProperty)
    {
      objc_storeStrong((id *)&v4->_metalPluginName, CFProperty);
      v6 = (const __CFString *)IORegistryEntryCreateCFProperty(a3, CFSTR("MetalStatisticsName"), 0, 0);
      if (v6)
        v7 = v6;
      else
        v7 = CFSTR("MetalStatistics");
      v8 = CFGetTypeID(v7);
      if (v8 == CFStringGetTypeID())
      {
        v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v7, 0);
      }
      else
      {
        v11 = CFGetTypeID(v7);
        TypeID = CFArrayGetTypeID();
        v13 = v11 == TypeID;
        if (v11 == TypeID)
          v9 = (__CFString *)v7;
        else
          v9 = 0;
        if (v13)
          v7 = 0;
      }
      v14 = MTLCreateSystemDefaultDevice();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "compare:", CFSTR("Unknown Unknown"));

      if (!v16 && -[__CFString count](v9, "count"))
      {
        -[__CFString firstObject](v9, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "rangeOfString:", CFSTR("AGXMetalStatistics"));
        if (objc_msgSend(v17, "rangeOfString:", CFSTR("AGXMetalStatisticsExternal")) == 0x7FFFFFFFFFFFFFFFLL
          && v18 < objc_msgSend(v17, "length"))
        {
          objc_msgSend(v17, "substringFromIndex:", objc_msgSend(CFSTR("AGXMetalStatistics"), "length"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("AGXMetalStatisticsExternal"), "stringByAppendingString:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          -[__CFString addObject:](v9, "addObject:", v20);
        }

      }
      if (v9)
      {
        -[DYMTLDerivedCounterSupport _loadAnalysis:vendorStringNames:vendorScriptPrefix:](v4, "_loadAnalysis:vendorStringNames:vendorScriptPrefix:", CFProperty, v9, 0);
        -[DYMTLDerivedCounterSupport _addGPUTimeEntry](v4, "_addGPUTimeEntry");
      }
      if (v7)
        CFRelease(v7);
      CFRelease(CFProperty);
      v21 = v4;

    }
    else
    {
      v10 = v4;
    }
  }

  return v4;
}

- (DYMTLDerivedCounterSupport)init
{
  DYMTLDerivedCounterSupport *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *counterDictionary;
  uint64_t v5;
  NSMutableDictionary *configurationVariables;
  DYMTLDerivedCounterSupport *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DYMTLDerivedCounterSupport;
  v2 = -[DYMTLDerivedCounterSupport init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    counterDictionary = v2->_counterDictionary;
    v2->_counterDictionary = v3;

    v5 = objc_opt_new();
    configurationVariables = v2->_configurationVariables;
    v2->_configurationVariables = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (NSMutableDictionary)counterDictionary
{
  return self->_counterDictionary;
}

- (NSString)derivedCounterScript
{
  return self->_derivedCounterScript;
}

- (NSString)analysisScript
{
  return self->_analysisScript;
}

- (NSMutableDictionary)configurationVariables
{
  return self->_configurationVariables;
}

- (NSString)metalPluginName
{
  return self->_metalPluginName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalPluginName, 0);
  objc_storeStrong((id *)&self->_configurationVariables, 0);
  objc_storeStrong((id *)&self->_analysisScript, 0);
  objc_storeStrong((id *)&self->_derivedCounterScript, 0);
  objc_storeStrong((id *)&self->_counterDictionary, 0);
}

@end
