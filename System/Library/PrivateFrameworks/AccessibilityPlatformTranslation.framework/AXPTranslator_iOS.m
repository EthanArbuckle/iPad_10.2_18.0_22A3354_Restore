@implementation AXPTranslator_iOS

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__AXPTranslator_iOS_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_Translator;
}

- (AXPTranslator_iOS)init
{
  AXPTranslator_iOS *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *cacheQueue;
  uint64_t v5;
  NSMutableDictionary *translationCache;
  uint64_t v7;
  NSMutableDictionary *backTranslationCache;
  uint64_t v9;
  NSMutableArray *cachedElements;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AXPTranslator_iOS;
  v2 = -[AXPTranslator init](&v12, sel_init);
  v3 = dispatch_queue_create("com.apple.axptranslator.cache.queue", 0);
  cacheQueue = v2->_cacheQueue;
  v2->_cacheQueue = (OS_dispatch_queue *)v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  translationCache = v2->_translationCache;
  v2->_translationCache = (NSMutableDictionary *)v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = objc_claimAutoreleasedReturnValue();
  backTranslationCache = v2->_backTranslationCache;
  v2->_backTranslationCache = (NSMutableDictionary *)v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = objc_claimAutoreleasedReturnValue();
  cachedElements = v2->_cachedElements;
  v2->_cachedElements = (NSMutableArray *)v9;

  if (AXPIsCatalyst())
    objc_msgSend(MEMORY[0x24BDFEA90], "applyElementAttributeCacheScheme:", 7);
  return v2;
}

- (void)_addCacheElement:(id)a3 translationObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
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
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  if ((unint64_t)-[NSMutableArray count](self->_cachedElements, "count") > 0x1000)
  {
    -[NSMutableArray subarrayWithRange:](self->_cachedElements, "subarrayWithRange:", 0, 1024);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isEqual:", v6) & 1) == 0)
            -[AXPTranslator_iOS _removeCacheEntriesForElement:](self, "_removeCacheEntriesForElement:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  -[NSMutableArray addObject:](self->_cachedElements, "addObject:", v6);
  -[AXPTranslator_iOS translationCache](self, "translationCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v7, v6);

  -[AXPTranslator_iOS backTranslationCache](self, "backTranslationCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v6, v7);

}

- (void)_removeCacheEntriesForElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  -[NSMutableArray removeObject:](self->_cachedElements, "removeObject:", v4);
  -[AXPTranslator_iOS translationCache](self, "translationCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[AXPTranslator_iOS backTranslationCache](self, "backTranslationCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
        -[AXPTranslator_iOS backTranslationCache](self, "backTranslationCache", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v4);

        if (v16)
        {
          -[AXPTranslator_iOS backTranslationCache](self, "backTranslationCache");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "removeObjectForKey:", v13);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (id)translationCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  return self->_translationCache;
}

- (id)backTranslationCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheQueue);
  return self->_backTranslationCache;
}

- (id)attributedStringConversionBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__AXPTranslator_iOS_attributedStringConversionBlock__block_invoke;
  v3[3] = &unk_24E6ABBE8;
  v3[4] = self;
  return (id)MEMORY[0x2276661BC](v3, a2);
}

- (void)_registerAccessibilityNotifications
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_220DB6000, a2, OS_LOG_TYPE_ERROR, "Failed to create an accessibility event observer: %ld", (uint8_t *)&v2, 0xCu);
}

- (id)_processAccessibilityAttributeValue:(int64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  if (a3 == 1001)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", getpid());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1102
         && (-[AXPTranslator systemAppDelegate](self, "systemAppDelegate"),
             v4 = (void *)objc_claimAutoreleasedReturnValue(),
             v5 = objc_opt_respondsToSelector(),
             v4,
             (v5 & 1) != 0))
  {
    -[AXPTranslator systemAppDelegate](self, "systemAppDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frontmostProcessPids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)_processPerformAction:(int)a3 value:(id)a4
{
  return 0;
}

- (id)_processAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  return 0;
}

- (void)initializeAXRuntimeForSystemAppServer
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x24BDFEA88], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator systemAppDelegate](self, "systemAppDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSystemWideElement");

  objc_msgSend(v3, "setSystemWideServer:", v5);
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke;
  v13[3] = &unk_24E6ABC10;
  v13[4] = self;
  objc_msgSend(v3, "setAttributeCallback:", v13);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_2;
  v12[3] = &unk_24E6ABC38;
  v12[4] = self;
  objc_msgSend(v3, "setParameterizedAttributeCallback:", v12);
  objc_msgSend(v3, "setSetAttributeCallback:", &__block_literal_global);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_4;
  v11[3] = &unk_24E6ABCA0;
  v11[4] = self;
  objc_msgSend(v3, "setPerformActionCallback:", v11);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_5;
  v10[3] = &unk_24E6ABCC8;
  v10[4] = self;
  objc_msgSend(v3, "setApplicationElementCallback:", v10);
  objc_msgSend(v3, "setOutgoingValuePreprocessor:", &__block_literal_global_229);
  objc_msgSend(v3, "setClientObserverCallback:", &__block_literal_global_231);
  if (_AXUIElementServerRegistered())
  {
    _AXUIElementUnregisterServer();
    AXPlatformTranslationLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_220DB6000, v7, OS_LOG_TYPE_INFO, "Someone beat us here to registered, undo yourself!", v9, 2u);
    }

  }
  if ((_DWORD)v5)
  {
    AXPlatformTranslationLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_220DB6000, v8, OS_LOG_TYPE_INFO, "Registering as system wide server!", v9, 2u);
    }

    _AXUIElementRegisterSystemWideServerBroadcastRelayerCallback();
  }
  objc_msgSend(v3, "start");

}

- (void)setAccessibilityEnabled:(BOOL)a3
{
  if (!self->_accessibilityEnabled && a3)
    -[AXPTranslator_iOS enableAccessibility](self, "enableAccessibility", a3);
}

- (void)_signalAppAXReady
{
  NSObject *threadSemaphore;

  self->_axAppReadyFlag = 1;
  threadSemaphore = self->_threadSemaphore;
  if (threadSemaphore)
    dispatch_semaphore_signal(threadSemaphore);
}

- (void)_enableAccessibilityBridgeRuntime
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__AXPTranslator_iOS__enableAccessibilityBridgeRuntime__block_invoke;
  block[3] = &unk_24E6ABDB0;
  block[4] = self;
  if (_enableAccessibilityBridgeRuntime_onceToken != -1)
    dispatch_once(&_enableAccessibilityBridgeRuntime_onceToken, block);
}

- (int64_t)attributeFromRequest:(unint64_t)a3
{
  if (a3 > 0x7C)
    return 0;
  else
    return qword_220DCA388[a3];
}

- (id)processMultipleAttributeRequest:(id)a3
{
  return -[AXPTranslator_iOS processMultipleAttributeRequest:removeEmptyValue:](self, "processMultipleAttributeRequest:removeEmptyValue:", a3, 0);
}

- (id)processMultipleAttributeRequest:(id)a3 removeEmptyValue:(BOOL)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __AXUIElement *v25;
  AXError v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  const __AXUIElement *element;
  const __CFArray *obj;
  uint64_t v43;
  id v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CFArrayRef values;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v46 = a4;
  v61 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  objc_msgSend(v44, "clientType");
  AXOverrideRequestingClientType();
  objc_msgSend(v44, "translation");
  v5 = objc_claimAutoreleasedReturnValue();
  +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v5;
  v7 = objc_msgSend(v6, "createPlatformElementFromTranslationObject:", v5);

  v8 = (void *)MEMORY[0x24BDFEA90];
  v9 = (void *)objc_opt_new();
  element = (const __AXUIElement *)v7;
  objc_msgSend(v8, "uiElementWithAXElement:cache:", v7, v9);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0;
  v48 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v44, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("attributes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  v45 = v10;
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "integerValue");
        v20 = -[AXPTranslator_iOS attributeFromRequest:](self, "attributeFromRequest:", v19);
        if (v20)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v21);

          objc_msgSend(v11, "addObject:", v18);
        }
        else
        {
          -[AXPTranslator_iOS _processAttributeSpecialCases:uiElement:error:client:](self, "_processAttributeSpecialCases:uiElement:error:client:", v19, v47, &v58, objc_msgSend(v44, "clientType"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            -[AXPTranslator_iOS _nilOutEmptyValue:](self, "_nilOutEmptyValue:", v22);
            v23 = objc_claimAutoreleasedReturnValue();

            v22 = (void *)v23;
            v10 = v45;
          }
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v22, v18);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v15);
  }

  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setError:", v58);
  v25 = element;
  if (objc_msgSend(v10, "count"))
  {
    values = 0;
    v26 = AXUIElementCopyMultipleAttributeValues(element, (CFArrayRef)v10, 0, &values);
    if (v26)
    {
      objc_msgSend(v24, "setError:", _convertAXError(v26));
    }
    else
    {
      v39 = v24;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      obj = values;
      v27 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v27)
      {
        v28 = v27;
        v29 = 0;
        v43 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v50 != v43)
              objc_enumerationMutation(obj);
            _AXPConvertOutgoingValueWithDesiredType(*(void **)(*((_QWORD *)&v49 + 1) + 8 * j), 0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectAtIndexedSubscript:", v29 + j);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (int)objc_msgSend(v32, "intValue");
            objc_msgSend(v11, "objectAtIndexedSubscript:", v29 + j);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXPTranslator_iOS _postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:](self, "_postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:", v47, v33, (int)objc_msgSend(v34, "intValue"), v31, &v58);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v46)
            {
              -[AXPTranslator_iOS _nilOutEmptyValue:](self, "_nilOutEmptyValue:", v35);
              v36 = objc_claimAutoreleasedReturnValue();

              v35 = (void *)v36;
            }
            objc_msgSend(v11, "objectAtIndexedSubscript:", v29 + j, v39);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setObject:forKeyedSubscript:", v35, v37);

            v10 = v45;
          }
          v29 += j;
          v28 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        }
        while (v28);
      }

      v24 = v39;
      v25 = element;
    }
    if (values)
      CFRelease(values);
  }
  objc_msgSend(v24, "setResultData:", v48, v39);
  if (v25)
    CFRelease(v25);
  AXOverrideRequestingClientType();

  return v24;
}

- (id)_nilOutEmptyValue:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  id v7;
  char isKindOfClass;
  id v10;
  void *v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = objc_msgSend(v3, "count");
LABEL_4:
    v5 = v4 != 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = objc_msgSend(v3, "isEqualToNumber:", &unk_24E6B0F30);
LABEL_11:
    v5 = isKindOfClass ^ 1;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "length");
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_11;
  }
  v10 = v3;
  if (objc_msgSend(v10, "length"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "length") != 0;

  }
LABEL_5:
  if ((v5 & 1) != 0)
    v6 = v3;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)axElementFromTranslatorRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const void *v6;
  void *v7;

  v3 = a3;
  +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "translation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (const void *)objc_msgSend(v4, "createPlatformElementFromTranslationObject:", v5);
  objc_msgSend(MEMORY[0x24BDFEA68], "elementWithAXUIElement:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    CFRelease(v6);
  return v7;
}

- (id)processActionRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "clientType");
  AXOverrideRequestingClientType();
  v5 = _convertAXPActionToiOS(objc_msgSend(v4, "actionType"));
  -[AXPTranslator_iOS axElementFromTranslatorRequest:](self, "axElementFromTranslatorRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v5 == 2003)
  {
    v8 = objc_msgSend(v6, "scrollToVisible");
    goto LABEL_6;
  }
  if ((_DWORD)v5 == 2021)
  {
    objc_msgSend(v4, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AXPCustomActionIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "performAction:withValue:", 2021, v11);

LABEL_9:
    goto LABEL_10;
  }
  if ((_DWORD)v5 != 2010)
  {
    objc_msgSend(v4, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "performAction:withValue:", v5, v10);
    goto LABEL_9;
  }
  v8 = objc_msgSend(v6, "press");
LABEL_6:
  v9 = v8;
LABEL_10:
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setResultData:", v13);

  AXOverrideRequestingClientType();
  return v12;
}

- (id)_processParameterizedAttributeRequest:(id)a3 attribute:(int64_t)a4 parameter:(id)a5 error:(unint64_t *)a6
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectWithAXAttribute:parameter:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _AXPConvertOutgoingValueWithDesiredType(v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_postProcessAttributeRequest:(id)a3 iosAttribute:(int64_t)a4 axpAttribute:(unint64_t)a5 result:(id)a6 error:(unint64_t *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  id v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  const __CFString *v38;
  const __CFString *v39;
  void *v40;
  uint64_t v41;
  unint64_t *v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = v13;
  if (a4 == 2003 || a5 == 106 || a5 == 5)
  {
    v15 = (void *)MEMORY[0x24BDD1968];
    v14 = v13;
    v16 = *(_OWORD *)(MEMORY[0x24BDBF070] + 16);
    v49 = *MEMORY[0x24BDBF070];
    v50 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = objc_retainAutorelease(v14);
      if (!strcmp((const char *)objc_msgSend(v17, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}"))
        objc_msgSend(v17, "getValue:", &v49);
    }

    objc_msgSend(v15, "valueWithRect:", v49, v50);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (a4 <= 95226)
  {
    if (a4 == 2180)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v14, "integerValue"))
      {
        objc_msgSend(v12, "objectWithAXAttribute:", 2001);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v23, "attributeValueForKey:", *MEMORY[0x24BDFE9B8]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v25 = v24;

            v14 = v25;
          }

        }
      }
      goto LABEL_57;
    }
    if (a4 == 5057)
    {
      v22 = objc_msgSend(v13, "intValue");
      switch(v22)
      {
        case 2:

          v19 = &unk_24E6B0F60;
          goto LABEL_9;
        case 1:

          v19 = &unk_24E6B0F78;
          goto LABEL_9;
        case 0:

          v19 = &unk_24E6B0F48;
          goto LABEL_9;
      }
LABEL_57:
      v19 = v14;
      goto LABEL_9;
    }
LABEL_39:
    if (a5 == 83)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[AXPTranslator_iOS _processAuditIssuesResult:](self, "_processAuditIssuesResult:", v14);
        v41 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v41;
      }
      goto LABEL_19;
    }
    if (a5 == 13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_19;
      v42 = a7;
      v43 = v12;
      v44 = (void *)objc_opt_new();
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v26 = v14;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v46;
        v30 = CFSTR("CustomActionIdentifier");
        v31 = CFSTR("CustomActionName");
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v46 != v29)
              objc_enumerationMutation(v26);
            v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v33, "objectForKeyedSubscript:", v30);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectForKeyedSubscript:", v31);
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = (void *)v35;
              if (v34)
                v37 = v35 == 0;
              else
                v37 = 1;
              if (!v37)
              {
                v51[0] = CFSTR("AXPCustomActionIdentifier");
                v51[1] = CFSTR("AXPCustomActionName");
                v52[0] = v34;
                v52[1] = v35;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
                v38 = v31;
                v39 = v30;
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "addObject:", v40);

                v30 = v39;
                v31 = v38;
              }

            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v28);
      }

      a7 = v42;
      v12 = v43;
      a5 = 13;
      v19 = v44;
      goto LABEL_9;
    }
    goto LABEL_57;
  }
  if (a4 == 95227)
  {
    -[AXPTranslator_iOS _processOutgoingCustomRotorSearchResult:](self, "_processOutgoingCustomRotorSearchResult:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 95228)
      goto LABEL_39;
    -[AXPTranslator_iOS _processCustomRotorData:](self, "_processCustomRotorData:", v13);
    v18 = objc_claimAutoreleasedReturnValue();
  }
LABEL_8:
  v19 = (void *)v18;

LABEL_9:
  if (a5 == 47)
  {
LABEL_12:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v19, "rangeValue") != 0x7FFFFFFF)
      goto LABEL_14;
LABEL_18:

    v14 = 0;
    goto LABEL_19;
  }
  if (a5 != 119)
  {
    if (a5 != 92)
    {
LABEL_14:
      v14 = v19;
      goto LABEL_19;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_18;
  v20 = objc_msgSend(v19, "intValue");
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20 == 1);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {

    v14 = 0;
    *a7 = 3;
  }
LABEL_19:

  return v14;
}

- (id)_processOutgoingCustomRotorSearchResult:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("AXPCustomRotorTargetElement"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("targetRange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("AXPCustomRotorTargetRange"));
  return v5;
}

- (id)_processAuditIssuesResult:(id)a3
{
  return (id)objc_msgSend(a3, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_256);
}

- (id)_processCustomRotorData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFE970]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeLink")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B0F90;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeArticle")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B0F60;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeVisitedLink")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B0FA8;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeading")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B0FC0;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel1")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B0FD8;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel2")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B0FF0;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel3")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B1008;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel4")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B1020;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel5")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B0F00;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel6")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B0ED0;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeBoldText")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B1038;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeItalicText")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B0F18;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeUnderlineText")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B1050;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeMisspelledWord")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B1068;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeImage")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B0EE8;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeTextField")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B1080;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeTable")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B1098;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeList")))
    {
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B10B0;
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeLandmark")))
      {
        v8 = CFSTR("AXPCustomRotorName");
        v11 = v4;
        v9 = v7;
        goto LABEL_42;
      }
      v8 = CFSTR("AXPCustomRotorSystemType");
      v9 = &unk_24E6B10C8;
    }
    v11 = v4;
LABEL_42:
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v8);
    v10 = v4;

    goto LABEL_43;
  }
  v10 = 0;
LABEL_43:

  return v10;
}

- (id)_processDirectAttributeRequest:(id)a3 iosAttribute:(int64_t)a4 axpAttribute:(unint64_t)a5 parameter:(id)a6 error:(unint64_t *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v12 = a3;
  v13 = v12;
  if (a6)
    objc_msgSend(v12, "objectWithAXAttribute:parameter:", a4, a6);
  else
    objc_msgSend(v12, "objectWithAXAttribute:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _AXPConvertOutgoingValueWithDesiredType(v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXPTranslator_iOS _postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:](self, "_postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:", v13, a4, a5, v15, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_processStartsMediaSessionAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "numberWithAXAttribute:", 2004, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (*MEMORY[0x24BDFEFC8] & ~v5) == 0);
}

- (id)_processViewControllerDescriptionAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "stringWithAXAttribute:", 5041);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithAXAttribute:", 5042);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ [%@]"), v5, v6);
  }
  else
  {
    if (!objc_msgSend(v6, "length"))
    {
      v7 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@]"), v6, v9);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v7;
}

- (id)_processIsSelectedAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "numberWithAXAttribute:", 2004, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (*MEMORY[0x24BDFEF88] & ~v5) == 0);
}

- (id)_processIsRemoteElementAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "axElement");
  _AXUIElementIDForElement();
  return (id)objc_msgSend(v4, "numberWithInt:", v5 == 9999);
}

- (id)_processIsEnabledAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "numberWithAXAttribute:", 2004, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (*MEMORY[0x24BDFEF10] & ~v5) != 0);
}

- (id)_processUserInputLabelsAttributeRequest:(id)a3 error:(unint64_t *)a4 axpAttribute:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  objc_msgSend(v8, "objectWithAXAttribute:", 2186);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 87)
  {
    v10 = 0;
    goto LABEL_5;
  }
  if (a5 == 88)
  {
    v10 = objc_opt_class();
LABEL_5:
    _AXPConvertOutgoingValueWithDesiredType(v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  -[AXPTranslator_iOS _postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:](self, "_postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:", v8, 2186, a5, v9, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_processBrailleOverrideForAttributeRequest:(id)a3 error:(unint64_t *)a4 attribute:(unint64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = v6;
  if (a5 == 33)
  {
    v8 = 2001;
  }
  else
  {
    if (a5 != 46)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = 2077;
  }
  objc_msgSend(v6, "objectWithAXAttribute:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  if (AXPNilOrEmptyString(v9) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "attributeValueForKey:", *MEMORY[0x24BDFEAF8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_processChildrenAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = *MEMORY[0x24BDFE978];
  v12[0] = MEMORY[0x24BDBD1C8];
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS _processParameterizedAttributeRequest:attribute:parameter:error:](self, "_processParameterizedAttributeRequest:attribute:parameter:error:", v7, 95236, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_processClassNameAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (AXPIsCatalyst())
  {
    -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v6, 5045, 7, 0, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    *a4 = 3;
  }

  return v7;
}

- (id)_processCellWithIndexPathAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  _AXPiOSParameterFromPlatformParameter(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "ax_mappedArrayUsingBlock:", &__block_literal_global_315);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  -[AXPTranslator_iOS _processParameterizedAttributeRequest:attribute:parameter:error:](self, "_processParameterizedAttributeRequest:attribute:parameter:error:", v8, 92600, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_processElementHelpAttributeResquest:(id)a3 error:(unint64_t *)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a3;
  -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v6, 2188, 23, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXPNilOrEmptyString(v7)
    && (!AXPIsCatalyst()
     || AXPLinkedOnOrAfterGozul() && !AXPIsGoodOldAppleCatalystApp()))
  {
    -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v6, 2002, 23, 0, a4);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

- (id)_processLinkedUIElementsAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v6, 2167, 76, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v6, 2033, 76, 0, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v7, "count"))
  {
    v17 = v8;
LABEL_21:
    v10 = v17;
    goto LABEL_22;
  }
  if (!v8)
  {
    v17 = v7;
    goto LABEL_21;
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "addObjectsFromArray:", v7);
    objc_msgSend(v10, "addObjectsFromArray:", v7);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v9, "containsObject:", v16, (_QWORD)v19) & 1) == 0)
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

  }
LABEL_22:

  return v10;
}

- (id)_processIndexForTextMarkerAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v6;
  void *v7;
  const __AXValue *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  _AXPiOSParameterFromPlatformParameter(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectWithAXAttribute:parameter:", 94012, v7);
  v8 = (const __AXValue *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (_AXPConvertAXValueRefToNSValue(v8), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (v10 = v9,
        v11 = objc_msgSend(v9, "rangeValue"),
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v12))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0x7FFFFFFFFFFFFFFFLL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _AXPConvertOutgoingValueWithDesiredType(v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_processTextInputMarkedRangeAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  objc_msgSend(v4, "stringWithAXAttribute:", 2006);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__AXPTranslator_iOS__processTextInputMarkedRangeAttributeRequest_error___block_invoke;
    v8[3] = &unk_24E6ABE38;
    v8[4] = &v9;
    objc_msgSend(v5, "enumerateAttributesUsingBlock:", v8);
  }
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (id)_processZoomAttributeRequest:(BOOL)a3 axElement:(id)a4 parameter:(id)a5 error:(unint64_t *)a6
{
  _BOOL4 v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  _AXPiOSParameterFromPlatformParameter(a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  if (v7)
    v11 = 2001;
  else
    v11 = 2002;
  v12 = objc_msgSend(v8, "performAXAction:withValue:", v11, v9);

  objc_msgSend(v10, "numberWithBool:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _AXPConvertOutgoingValueWithDesiredType(v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_processLineRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  _AXPiOSParameterFromPlatformParameter(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectWithAXAttribute:parameter:", 94009, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _AXPConvertOutgoingValueWithDesiredType(v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_processNextLineRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[AXPTranslator_iOS _processLineRangeAttributeRequest:parameter:error:](self, "_processLineRangeAttributeRequest:parameter:error:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "rangeValue");
    v18 = CFSTR("parameter");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12 + v11 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPTranslator_iOS _processLineRangeAttributeRequest:parameter:error:](self, "_processLineRangeAttributeRequest:parameter:error:", v8, v14, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 && objc_msgSend(v15, "rangeValue") == 0x7FFFFFFF)
    {
      v16 = v10;

      v15 = v16;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_processPreviousLineRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[AXPTranslator_iOS _processLineRangeAttributeRequest:parameter:error:](self, "_processLineRangeAttributeRequest:parameter:error:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "rangeValue");
    v17 = CFSTR("parameter");
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = &unk_24E6B0F30;
    }
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPTranslator_iOS _processLineRangeAttributeRequest:parameter:error:](self, "_processLineRangeAttributeRequest:parameter:error:", v8, v14, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    if (v13 && objc_msgSend(v13, "rangeValue") == 0x7FFFFFFF)
    {
      v15 = v10;

      v13 = v15;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_processMoveFocusToOpaqueElementAttributeRequest:(id)a3 parameter:(id)a4 direction:(int64_t)a5 error:(unint64_t *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("parameter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDFE968]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v14;
        v19[1] = &unk_24E6B10E0;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", 0x7FFFFFFFLL, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19[2] = v15;
        v19[3] = v13;
        v19[4] = MEMORY[0x24BDBD1C8];
        v19[5] = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[AXPTranslator_iOS _processParameterizedAttributeRequest:attribute:parameter:error:](self, "_processParameterizedAttributeRequest:attribute:parameter:error:", v10, 95225, v16, a6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
        *a6 = 7;
      }

    }
    else
    {
      v17 = 0;
      *a6 = 7;
    }

  }
  else
  {
    v17 = 0;
    *a6 = 7;
  }

  return v17;
}

- (id)_processRawElementDataRequest:(id)a3 error:(unint64_t *)a4
{
  uint64_t Data;
  const void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a3, "axElement"))
    return 0;
  Data = _AXUIElementCreateData();
  if (!Data)
    return 0;
  v5 = (const void *)Data;
  v8[0] = CFSTR("TokenType");
  v8[1] = CFSTR("ElementData");
  v9[0] = CFSTR("AXElementTokenSimulator");
  v9[1] = Data;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v5);
  return v6;
}

- (id)_processSelectedTextRequest:(id)a3 error:(unint64_t *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(v6, "rangeWithAXAttribute:", 2005);
  if (v7 != 0x7FFFFFFF && v7 | v8)
  {
    v13 = CFSTR("parameter");
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXPTranslator_iOS _processStringForRangeAttributeRequest:parameter:error:](self, "_processStringForRangeAttributeRequest:parameter:error:", v6, v11, a4);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v9 = &stru_24E6ACC10;
    }

  }
  else
  {
    v9 = &stru_24E6ACC10;
  }

  return v9;
}

- (id)_processingSmuggledMarzipanRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("parameter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attribute"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (int)objc_msgSend(v11, "intValue");

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("parameter"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v8, v12, 0, v13, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
      *a5 = 7;
    }

  }
  else
  {
    v14 = 0;
    *a5 = 7;
  }

  return v14;
}

- (id)_processValueAttributeRequest:(id)a3 error:(unint64_t *)a4 axpAttribute:(unint64_t)a5 useAttributes:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  id v17;

  v6 = a6;
  v10 = a3;
  objc_msgSend(v10, "objectWithAXAttribute:", 2006);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v12 = objc_opt_class();
  else
    v12 = 0;
  _AXPConvertOutgoingValueWithDesiredType(v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5 == 118 || a5 == 53)
  {
    objc_msgSend(v10, "numberWithAXAttribute:", 2004);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");

    v16 = -[AXPTranslator_iOS _processRoleAttributeRequest:traits:error:](self, "_processRoleAttributeRequest:traits:error:", v10, v15, a4);
    if (v16 == 9)
    {
      -[AXPTranslator_iOS _processIsSelectedAttributeRequest:error:](self, "_processIsSelectedAttributeRequest:error:", v10, a4);
      v17 = v13;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      goto LABEL_13;
    }
    if (v16 == 18 || v16 == 13)
    {
      -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v10, 5059, 54, 0, a4);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v17;

        v13 = v17;
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  if (a5 == 118)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v13 = 0;
    }
  }

  return v13;
}

- (id)_processSyntheticStringValueAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  v6 = a3;
  -[AXPTranslator_iOS _processValueAttributeRequest:error:axpAttribute:useAttributes:](self, "_processValueAttributeRequest:error:axpAttribute:useAttributes:", v6, a4, 53, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXPNilOrEmptyString(v7))
  {
    -[AXPTranslator_iOS _processRoleAttributeRequest:error:](self, "_processRoleAttributeRequest:error:", v6, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if ((v9 & 0xFFFFFFFFFFFFFFF7) == 6)
    {
      -[AXPTranslator_iOS _processLabelAttributeRequest:error:axpAttribute:](self, "_processLabelAttributeRequest:error:axpAttribute:", v6, a4, 33);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v10;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v7, "string");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
LABEL_10:

  return v12;
}

- (id)_processLabelAttributeRequest:(id)a3 error:(unint64_t *)a4 axpAttribute:(unint64_t)a5
{
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a3, "objectWithAXAttribute:", 2001, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 == 3)
    v7 = objc_opt_class();
  else
    v7 = 0;
  _AXPConvertOutgoingValueWithDesiredType(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_processNumberOfCharactersAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[AXPTranslator_iOS _processSyntheticStringValueAttributeRequest:error:](self, "_processSyntheticStringValueAttributeRequest:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_processRoleAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a3;
  objc_msgSend(v6, "axElement");
  if ((AXUIElementIsApplication() & 1) != 0)
  {
    v7 = &unk_24E6B0F60;
  }
  else
  {
    objc_msgSend(v6, "numberWithAXAttribute:", 2004);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AXPTranslator_iOS _processRoleAttributeRequest:traits:error:](self, "_processRoleAttributeRequest:traits:error:", v6, v9, a4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (unint64_t)_processRoleAttributeRequest:(id)a3 traits:(unint64_t)a4 error:(unint64_t *)a5
{
  id v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v8 = a3;
  if (objc_msgSend(v8, "BOOLWithAXAttribute:", 5020)
    && !objc_msgSend(v8, "BOOLWithAXAttribute:", 2016))
  {
    v9 = 5;
    goto LABEL_18;
  }
  if ((*MEMORY[0x24BDFEF38] & ~a4) == 0 || (*MEMORY[0x24BDFEFF0] & ~a4) == 0)
  {
    v9 = 9;
    goto LABEL_18;
  }
  if ((*MEMORY[0x24BDFF0C8] & ~a4) == 0)
  {
    v9 = 3;
    goto LABEL_18;
  }
  if ((*MEMORY[0x24BDFEF28] & ~a4) == 0)
  {
    v9 = 19;
    goto LABEL_18;
  }
  if ((*MEMORY[0x24BDFEE60] & ~a4) == 0 || (*MEMORY[0x24BDFEEE0] & ~a4) == 0 || (*MEMORY[0x24BDFEEE8] & ~a4) == 0)
  {
    v10 = _AXPElementIsTabButton(v8, a4) == 0;
    v11 = 9;
    v12 = 2;
    goto LABEL_15;
  }
  if ((*MEMORY[0x24BDFEEC0] & ~a4) == 0)
  {
    v9 = 6;
    goto LABEL_18;
  }
  if (!AXPIsSwiftPlaygrounds() && (*MEMORY[0x24BDFF000] & ~a4) == 0 && (*MEMORY[0x24BDFF0C0] & ~a4) == 0)
    goto LABEL_24;
  if ((*MEMORY[0x24BDFEEF0] & ~a4) == 0)
  {
    v9 = 8;
    goto LABEL_18;
  }
  if ((*MEMORY[0x24BDFEED0] & ~a4) == 0 || (*MEMORY[0x24BDFEF30] & ~a4) == 0 || (*MEMORY[0x24BDFEEF8] & ~a4) == 0)
  {
    v9 = 7;
    goto LABEL_18;
  }
  if ((*MEMORY[0x24BDFEFD0] & ~a4) == 0)
  {
    v9 = 14;
    goto LABEL_18;
  }
  if (!AXPIsSwiftPlaygrounds() && (*MEMORY[0x24BDFF000] & ~a4) == 0)
    goto LABEL_24;
  if ((*MEMORY[0x24BDFF008] & ~a4) == 0)
  {
    v9 = 15;
    goto LABEL_18;
  }
  if ((*MEMORY[0x24BDFEDB8] & ~a4) != 0)
  {
    if ((objc_msgSend(v8, "BOOLWithAXAttribute:", 5056) & 1) != 0)
    {
      v9 = 11;
      goto LABEL_18;
    }
    if (!AXPIsSwiftPlaygrounds())
    {
      v14 = *MEMORY[0x24BDFF0C0];
      goto LABEL_46;
    }
    v14 = *MEMORY[0x24BDFF0C0];
    if ((*MEMORY[0x24BDFF000] & ~a4) != 0 || (v14 & a4) != v14)
    {
LABEL_46:
      objc_msgSend(MEMORY[0x24BDFEA68], "elementWithUIElement:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containerType");
      if ((v14 & ~a4) == 0 && !v16)
      {
        -[AXPTranslator_iOS _processChildrenAttributeRequest:error:](self, "_processChildrenAttributeRequest:error:", v8, a5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v17, "count"))
          {

            goto LABEL_57;
          }
        }

        v9 = 14;
LABEL_69:

        goto LABEL_18;
      }
      if (v16 > 1023)
      {
        switch(v16)
        {
          case 0x400:
            v9 = 20;
            goto LABEL_69;
          case 0x800:
            v9 = 12;
            goto LABEL_69;
          case 0x4000:
            v9 = 16;
            goto LABEL_69;
        }
      }
      else
      {
        switch(v16)
        {
          case 0:
LABEL_57:
            if (objc_msgSend(v8, "BOOLWithAXAttribute:", 2016))
              v9 = 4;
            else
              v9 = 5;
            goto LABEL_69;
          case 2:
            v9 = 21;
            goto LABEL_69;
          case 512:
            v9 = 10;
            goto LABEL_69;
        }
      }
      v9 = 5;
      goto LABEL_69;
    }
LABEL_24:
    v9 = 17;
    goto LABEL_18;
  }
  v10 = (*MEMORY[0x24BDFEFC0] & ~a4) == 0;
  v11 = 13;
  v12 = 18;
LABEL_15:
  if (v10)
    v9 = v12;
  else
    v9 = v11;
LABEL_18:

  return v9;
}

- (id)_processRoleDescriptionAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int16 v12;
  __int16 v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;

  v6 = a3;
  -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v6, 2077, 46, 0, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXPNilOrEmptyString(v7))
  {
    objc_msgSend(v6, "numberWithAXAttribute:", 2004);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

    if ((*MEMORY[0x24BDFEE58] & ~v9) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("back.button.role.description"), &stru_24E6ACC10, CFSTR("Localizable"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    if ((-[AXPTranslator_iOS _processRoleAttributeRequest:traits:error:](self, "_processRoleAttributeRequest:traits:error:", v6, v9, a4) & 0xFFFFFFFFFFFFFFEFLL) != 5)goto LABEL_18;
    objc_msgSend(MEMORY[0x24BDFEA68], "elementWithUIElement:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containerType");
    v13 = v12;
    if ((v12 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("container.role.description.table");
    }
    else if ((v12 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("container.role.description.list");
    }
    else if ((v12 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("container.role.description.landmark");
    }
    else if ((v12 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("container.role.description.fieldset");
    }
    else if ((v12 & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("container.role.description.dialog");
    }
    else if ((v12 & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("container.role.description.tree");
    }
    else if ((v12 & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("container.role.description.frame");
    }
    else if ((v12 & 0x80) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("container.role.description.article");
    }
    else if ((v12 & 0x1000) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("container.role.description.dataseries");
    }
    else
    {
      if ((v12 & 0x2000) == 0)
        goto LABEL_29;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("container.role.description.tableofcontents");
    }
    objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_24E6ACC10, CFSTR("Localizable"));
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v18;
LABEL_29:
    v19 = AXPNilOrEmptyString(v7);
    if ((v13 & 0x100) == 0 || !v19)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AccessibilityPlatformTranslation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("container.role.description.semanticgroup"), &stru_24E6ACC10, CFSTR("Localizable"));
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = v20;
LABEL_4:

    v7 = (void *)v11;
LABEL_5:

  }
LABEL_18:

  return v7;
}

- (id)_processBoundsForRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("parameter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v7, "BOOLWithAXAttribute:", 2301))
        v10 = 92703;
      else
        v10 = 92506;
      objc_msgSend(v7, "objectWithAXAttribute:parameter:", v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _AXPConvertOutgoingValueWithDesiredType(v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
      *a5 = 7;
    }

  }
  else
  {
    v12 = 0;
    *a5 = 7;
  }

  return v12;
}

- (id)_processVisibleTextRangeAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (objc_msgSend(v6, "rangeWithAXAttribute:", 2216) == 0x7FFFFFFF
    && objc_msgSend(v6, "BOOLWithAXAttribute:", 2025))
  {
    -[AXPTranslator_iOS _processSyntheticStringValueAttributeRequest:error:](self, "_processSyntheticStringValueAttributeRequest:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", 0, objc_msgSend(v7, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_processAuditIssuesAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  AXPTranslator_iOS *v23;
  unint64_t *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v23 = self;
  v24 = a5;
  v34 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = v6;
  _AXPiOSParameterFromPlatformParameter(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    v13 = *MEMORY[0x24BDFE8B0];
    v14 = MEMORY[0x24BDBD1C8];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v15);
        v31 = v13;
        v32 = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1, v23, v24, v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v16);

        ++v15;
      }
      while (v11 != v15);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", AXPIsCatalyst());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BDFE8A8]);

  objc_msgSend(v26, "objectWithAXAttribute:parameter:", 95005, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _AXPConvertOutgoingValueWithDesiredType(v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS _postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:](v23, "_postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:", v26, 95005, 83, v20, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_processAttributedStringForRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v8 = a3;
  _AXPiOSParameterFromPlatformParameter(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectWithAXAttribute:parameter:", 92508, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10
    || ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && !objc_msgSend(v10, "length"))
  {
    -[AXPTranslator_iOS _processRoleAttributeRequest:error:](self, "_processRoleAttributeRequest:error:", v8, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    if ((v12 & 0xFFFFFFFFFFFFFFF7) == 6)
    {
      objc_msgSend(v8, "objectWithAXAttribute:", 2001);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v9, "rangeValue");
      v16 = v15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v14 + v16 > (unint64_t)objc_msgSend(v13, "length"))
          goto LABEL_14;
        objc_msgSend(v13, "substringWithRange:", v14, v16);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || v14 + v16 > (unint64_t)objc_msgSend(v13, "length"))
          goto LABEL_14;
        objc_msgSend(v13, "attributedSubstringFromRange:", v14, v16);
        v17 = objc_claimAutoreleasedReturnValue();
      }

      v10 = (void *)v17;
LABEL_14:

    }
  }
  v18 = objc_opt_class();
  _AXPConvertOutgoingValueWithDesiredType(v10, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS _postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:](self, "_postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:", v8, 92508, 4, v19, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v20);

    v20 = (void *)v21;
  }

  return v20;
}

- (id)_processStringForRangeAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v8 = a3;
  _AXPiOSParameterFromPlatformParameter(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectWithAXAttribute:parameter:", 92505, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AXPTranslator_iOS _processSyntheticStringValueAttributeRequest:error:](self, "_processSyntheticStringValueAttributeRequest:error:", v8, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "rangeValue");
      v14 = v13;
      if (v12 + v13 <= (unint64_t)objc_msgSend(v11, "length"))
      {
        objc_msgSend(v11, "substringWithRange:", v12, v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }
  _AXPConvertOutgoingValueWithDesiredType(v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS _postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:](self, "_postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:", v8, 92505, 50, v15, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_processSubroleAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "numberWithAXAttribute:", 2004);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");

  v7 = &unk_24E6B0F48;
  if ((*MEMORY[0x24BDFEF38] & ~v6) != 0)
  {
    v7 = &unk_24E6B0F78;
    if ((*MEMORY[0x24BDFEFF0] & ~v6) != 0)
    {
      if ((*MEMORY[0x24BDFF0C8] & ~v6) != 0 || objc_msgSend(v4, "BOOLWithAXAttribute:", 2232))
      {
        if ((*MEMORY[0x24BDFEEF8] & ~v6) != 0)
        {
          if ((*MEMORY[0x24BDFEF80] & ~v6) != 0)
          {
            if ((*MEMORY[0x24BDFEF78] & ~v6) != 0)
            {
              if (!_AXPElementIsTabButton(v4, v6))
                v7 = &unk_24E6B0F48;
            }
            else
            {
              v7 = &unk_24E6B0F60;
            }
          }
          else
          {
            v7 = &unk_24E6B0FD8;
          }
        }
        else
        {
          v7 = &unk_24E6B0FC0;
        }
      }
      else
      {
        v7 = &unk_24E6B1038;
      }
    }
  }

  return v7;
}

- (id)_processAttributeSpecialCases:(unint64_t)a3 uiElement:(id)a4 error:(unint64_t *)a5 client:(unint64_t)a6
{
  return -[AXPTranslator_iOS _processAttributeSpecialCases:uiElement:parameter:error:client:](self, "_processAttributeSpecialCases:uiElement:parameter:error:client:", a3, a4, 0, a5, a6);
}

- (id)_processCustomActionsAttributeRequest:(id)a3 error:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(v6, "arrayWithAXAttribute:", 2036);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS _postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:](self, "_postProcessAttributeRequest:iosAttribute:axpAttribute:result:error:", v6, 0, 13, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_processFirstContainedElement:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCED8];
  v10 = *MEMORY[0x24BDFE980];
  v18[0] = *MEMORY[0x24BDFE978];
  v18[1] = v10;
  v19[0] = MEMORY[0x24BDBD1C8];
  v19[1] = MEMORY[0x24BDBD1C8];
  v11 = (void *)MEMORY[0x24BDBCE70];
  v12 = a4;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _AXPiOSParameterFromPlatformParameter(v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDFE968]);
  -[AXPTranslator_iOS _processParameterizedAttributeRequest:attribute:parameter:error:](self, "_processParameterizedAttributeRequest:attribute:parameter:error:", v8, 95230, v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_processFocusedElementAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v8, 3002, 19, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v8, 3027, 19, v9, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_processIsFocusedAttributeRequest:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v8 = a3;
  v9 = a4;
  -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v8, 2198, 28, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "BOOLValue") & 1) == 0)
  {
    -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v8, 2094, 28, v9, a5);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }

  return v10;
}

- (id)_processLastContainedElement:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCED8];
  v10 = *MEMORY[0x24BDFE980];
  v18[0] = *MEMORY[0x24BDFE978];
  v18[1] = v10;
  v19[0] = MEMORY[0x24BDBD1C8];
  v19[1] = MEMORY[0x24BDBD1C8];
  v11 = (void *)MEMORY[0x24BDBCE70];
  v12 = a4;
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _AXPiOSParameterFromPlatformParameter(v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDFE968]);
  -[AXPTranslator_iOS _processParameterizedAttributeRequest:attribute:parameter:error:](self, "_processParameterizedAttributeRequest:attribute:parameter:error:", v8, 95231, v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_processFirstElementForFocus:(id)a3 parameter:(id)a4 error:(unint64_t *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v12 = *MEMORY[0x24BDFE978];
  v13[0] = MEMORY[0x24BDBD1C8];
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS _processParameterizedAttributeRequest:attribute:parameter:error:](self, "_processParameterizedAttributeRequest:attribute:parameter:error:", v8, 95250, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_processVisibleOpaqueElements:(id)a3 error:(unint64_t *)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BDFE988];
  v12[0] = *MEMORY[0x24BDFE978];
  v12[1] = v6;
  v13[0] = MEMORY[0x24BDBD1C8];
  v13[1] = MEMORY[0x24BDBD1C8];
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS _processParameterizedAttributeRequest:attribute:parameter:error:](self, "_processParameterizedAttributeRequest:attribute:parameter:error:", v8, 95249, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_processAttributeSpecialCases:(unint64_t)a3 uiElement:(id)a4 parameter:(id)a5 error:(unint64_t *)a6 client:(unint64_t)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  AXPTranslator_iOS *v16;
  id v17;
  unint64_t *v18;
  uint64_t v19;
  AXPTranslator_iOS *v20;
  id v21;
  unint64_t *v22;
  uint64_t v23;
  AXPTranslator_iOS *v24;
  id v25;
  id v26;
  uint64_t v27;
  AXPTranslator_iOS *v28;
  id v29;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  AXPTranslator_iOS *v33;
  id v34;
  unint64_t *v35;
  uint64_t v36;
  AXPTranslator_iOS *v37;
  uint64_t v38;

  v12 = a4;
  v13 = a5;
  v14 = 0;
  switch(a3)
  {
    case 3uLL:
      v20 = self;
      v21 = v12;
      v22 = a6;
      v23 = 3;
      goto LABEL_17;
    case 4uLL:
      -[AXPTranslator_iOS _processAttributedStringForRangeAttributeRequest:parameter:error:](self, "_processAttributedStringForRangeAttributeRequest:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 5uLL:
      -[AXPTranslator_iOS _processBoundsForRangeAttributeRequest:parameter:error:](self, "_processBoundsForRangeAttributeRequest:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 6uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1DuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x25uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x34uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3DuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x41uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x49uLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x54uLL:
    case 0x59uLL:
    case 0x5AuLL:
    case 0x5BuLL:
      break;
    case 7uLL:
      -[AXPTranslator_iOS _processClassNameAttributeRequest:error:](self, "_processClassNameAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 8uLL:
    case 9uLL:
      -[AXPTranslator_iOS _processChildrenAttributeRequest:error:](self, "_processChildrenAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0xDuLL:
      -[AXPTranslator_iOS _processCustomActionsAttributeRequest:error:](self, "_processCustomActionsAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x12uLL:
      -[AXPTranslator_iOS _processFirstContainedElement:parameter:error:](self, "_processFirstContainedElement:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x13uLL:
      -[AXPTranslator_iOS _processFocusedElementAttributeRequest:parameter:error:](self, "_processFocusedElementAttributeRequest:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x17uLL:
      -[AXPTranslator_iOS _processElementHelpAttributeResquest:error:](self, "_processElementHelpAttributeResquest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x1BuLL:
      -[AXPTranslator_iOS _processIsEnabledAttributeRequest:error:](self, "_processIsEnabledAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x1CuLL:
      -[AXPTranslator_iOS _processIsFocusedAttributeRequest:parameter:error:](self, "_processIsFocusedAttributeRequest:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x1EuLL:
      -[AXPTranslator_iOS _processIsSelectedAttributeRequest:error:](self, "_processIsSelectedAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x21uLL:
      v20 = self;
      v21 = v12;
      v22 = a6;
      v23 = 33;
LABEL_17:
      -[AXPTranslator_iOS _processLabelAttributeRequest:error:axpAttribute:](v20, "_processLabelAttributeRequest:error:axpAttribute:", v21, v22, v23);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x22uLL:
      -[AXPTranslator_iOS _processLastContainedElement:parameter:error:](self, "_processLastContainedElement:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x23uLL:
      v24 = self;
      v25 = v12;
      v26 = v13;
      v27 = 1;
      goto LABEL_21;
    case 0x24uLL:
      v24 = self;
      v25 = v12;
      v26 = v13;
      v27 = 2;
LABEL_21:
      -[AXPTranslator_iOS _processMoveFocusToOpaqueElementAttributeRequest:parameter:direction:error:](v24, "_processMoveFocusToOpaqueElementAttributeRequest:parameter:direction:error:", v25, v26, v27, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x26uLL:
      -[AXPTranslator_iOS _processNumberOfCharactersAttributeRequest:error:](self, "_processNumberOfCharactersAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x2DuLL:
      -[AXPTranslator_iOS _processRoleAttributeRequest:error:](self, "_processRoleAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x2EuLL:
      -[AXPTranslator_iOS _processRoleDescriptionAttributeRequest:error:](self, "_processRoleDescriptionAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x31uLL:
      -[AXPTranslator_iOS _processStartsMediaSessionAttributeRequest:error:](self, "_processStartsMediaSessionAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x32uLL:
      -[AXPTranslator_iOS _processStringForRangeAttributeRequest:parameter:error:](self, "_processStringForRangeAttributeRequest:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x33uLL:
      -[AXPTranslator_iOS _processSubroleAttributeRequest:error:](self, "_processSubroleAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x35uLL:
      v28 = self;
      v29 = v12;
      v30 = a6;
      v31 = 53;
      goto LABEL_33;
    case 0x3AuLL:
      -[AXPTranslator_iOS _processVisibleOpaqueElements:error:](self, "_processVisibleOpaqueElements:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x3BuLL:
      -[AXPTranslator_iOS _processingSmuggledMarzipanRequest:parameter:error:](self, "_processingSmuggledMarzipanRequest:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x3CuLL:
      -[AXPTranslator_iOS _processRawElementDataRequest:error:](self, "_processRawElementDataRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x40uLL:
      v28 = self;
      v29 = v12;
      v30 = a6;
      v31 = 64;
LABEL_33:
      v32 = 0;
LABEL_50:
      -[AXPTranslator_iOS _processValueAttributeRequest:error:axpAttribute:useAttributes:](v28, "_processValueAttributeRequest:error:axpAttribute:useAttributes:", v29, v30, v31, v32);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x42uLL:
      -[AXPTranslator_iOS _processIsRemoteElementAttributeRequest:error:](self, "_processIsRemoteElementAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x48uLL:
      -[AXPTranslator_iOS _processLineRangeAttributeRequest:parameter:error:](self, "_processLineRangeAttributeRequest:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x4AuLL:
      -[AXPTranslator_iOS _processNextLineRangeAttributeRequest:parameter:error:](self, "_processNextLineRangeAttributeRequest:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x4BuLL:
      -[AXPTranslator_iOS _processPreviousLineRangeAttributeRequest:parameter:error:](self, "_processPreviousLineRangeAttributeRequest:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x4CuLL:
      -[AXPTranslator_iOS _processLinkedUIElementsAttributeRequest:error:](self, "_processLinkedUIElementsAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x52uLL:
      -[AXPTranslator_iOS _processViewControllerDescriptionAttributeRequest:error:](self, "_processViewControllerDescriptionAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x53uLL:
      -[AXPTranslator_iOS _processAuditIssuesAttributeRequest:parameter:error:](self, "_processAuditIssuesAttributeRequest:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x55uLL:
      -[AXPTranslator_iOS _processFirstElementForFocus:parameter:error:](self, "_processFirstElementForFocus:parameter:error:", v12, v13, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x56uLL:
      -[AXPTranslator_iOS _processSelectedTextRequest:error:](self, "_processSelectedTextRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x57uLL:
      v33 = self;
      v34 = v12;
      v35 = a6;
      v36 = 87;
      goto LABEL_45;
    case 0x58uLL:
      v33 = self;
      v34 = v12;
      v35 = a6;
      v36 = 88;
LABEL_45:
      -[AXPTranslator_iOS _processUserInputLabelsAttributeRequest:error:axpAttribute:](v33, "_processUserInputLabelsAttributeRequest:error:axpAttribute:", v34, v35, v36);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_57;
    case 0x5CuLL:
      -[AXPTranslator_iOS _processVisibleTextRangeAttributeRequest:error:](self, "_processVisibleTextRangeAttributeRequest:error:", v12, a6);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_57:
      v14 = (void *)v15;
      break;
    default:
      switch(a3)
      {
        case 'l':
          v16 = self;
          v17 = v12;
          v18 = a6;
          v19 = 33;
          goto LABEL_55;
        case 'm':
          v16 = self;
          v17 = v12;
          v18 = a6;
          v19 = 46;
LABEL_55:
          -[AXPTranslator_iOS _processBrailleOverrideForAttributeRequest:error:attribute:](v16, "_processBrailleOverrideForAttributeRequest:error:attribute:", v17, v18, v19);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_57;
        case 'o':
          -[AXPTranslator_iOS _processIndexForTextMarkerAttributeRequest:parameter:error:](self, "_processIndexForTextMarkerAttributeRequest:parameter:error:", v12, v13, a6);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_57;
        case 'v':
          if (a7 == 7)
          {
            v28 = self;
            v29 = v12;
            v30 = a6;
            v31 = 118;
            v32 = 1;
            goto LABEL_50;
          }
          v14 = 0;
          break;
        case 'y':
          v37 = self;
          v38 = 1;
          goto LABEL_53;
        case 'z':
          v37 = self;
          v38 = 0;
LABEL_53:
          -[AXPTranslator_iOS _processZoomAttributeRequest:axElement:parameter:error:](v37, "_processZoomAttributeRequest:axElement:parameter:error:", v38, v12, v13, a6);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_57;
        case '{':
          -[AXPTranslator_iOS _processTextInputMarkedRangeAttributeRequest:error:](self, "_processTextInputMarkedRangeAttributeRequest:error:", v12, a6);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_57;
        default:
          goto LABEL_58;
      }
      break;
  }
LABEL_58:

  return v14;
}

- (id)processCanSetAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v22;

  v4 = a3;
  objc_msgSend(v4, "clientType");
  AXOverrideRequestingClientType();
  v5 = (void *)objc_opt_new();
  -[AXPTranslator_iOS axElementFromTranslatorRequest:](self, "axElementFromTranslatorRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "attributeType");

  if (v7 > 46)
  {
    if (v7 == 53)
    {
      v14 = objc_msgSend(v6, "traits");
      v15 = *MEMORY[0x24BDFEDB8];
      v16 = *MEMORY[0x24BDFEDB8] & v14;
      v17 = (*MEMORY[0x24BDFF008] & ~v14) == 0 || v16 == v15;
      v20 = v17 && (*MEMORY[0x24BDFEF10] & ~v14) != 0;
      v17 = (*MEMORY[0x24BDFEED8] & v14) == *MEMORY[0x24BDFEED8];
      v13 = (void *)MEMORY[0x24BDD16E0];
      v12 = v17 || v16 == v15 || v20;
    }
    else
    {
      if (v7 != 47)
        goto LABEL_26;
      v10 = *MEMORY[0x24BDFF0C0];
      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = (v10 & ~objc_msgSend(v6, "traits")) == 0;
      v13 = v11;
    }
    objc_msgSend(v13, "numberWithInt:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_25:
    v22 = (void *)v19;
    objc_msgSend(v5, "setResultData:", v19);

    goto LABEL_26;
  }
  if (v7 == 2)
  {
    objc_msgSend(v5, "setResultData:", MEMORY[0x24BDBD1C8]);
  }
  else if (v7 == 28)
  {
    objc_msgSend(v6, "uiElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "BOOLWithAXAttribute:", 2204) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v6, "uiElement");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v18, "BOOLWithAXAttribute:", 3002);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_26:
  AXOverrideRequestingClientType();

  return v5;
}

- (id)processSetAttribute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "clientType");
  AXOverrideRequestingClientType();
  -[AXPTranslator_iOS axElementFromTranslatorRequest:](self, "axElementFromTranslatorRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "attributeType");
  if (v6 > 52)
  {
    switch(v6)
    {
      case '5':
        objc_msgSend(v5, "uiElement");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "parameters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("value"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAXAttribute:withString:", 2006, v15);
LABEL_21:

        goto LABEL_22;
      case 'b':
        objc_msgSend(v4, "parameters");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("value"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_23;
        objc_msgSend(v5, "uiElement");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = 2708;
        break;
      case 'a':
        objc_msgSend(v4, "parameters");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_23;
        objc_msgSend(v5, "uiElement");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        v14 = 2716;
        break;
      default:
        goto LABEL_24;
    }
    objc_msgSend(v12, "setAXAttribute:withNumber:", v14, v8);
LABEL_22:

    goto LABEL_23;
  }
  switch(v6)
  {
    case 2:
      objc_msgSend(v5, "uiElement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parameters");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAXAttribute:withObject:", 2018, v13);
      goto LABEL_22;
    case 28:
      objc_msgSend(v4, "parameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("focused"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v8, "BOOLValue"))
        {
          objc_msgSend(v5, "setNativeFocus");
          goto LABEL_23;
        }
        objc_msgSend(v5, "uiElement");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "uiElement");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAXAttribute:withUIElement:", 3002, v15);
        goto LABEL_21;
      }
LABEL_23:

      break;
    case 47:
      objc_msgSend(v4, "parameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("range"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v8, "rangeValue");
        objc_msgSend(v5, "setSelectedTextRange:", v9, v10);
      }
      goto LABEL_23;
  }
LABEL_24:
  AXOverrideRequestingClientType();

  return 0;
}

- (id)processSupportedActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "clientType");
  AXOverrideRequestingClientType();
  v5 = (void *)objc_opt_new();
  -[AXPTranslator_iOS axElementFromTranslatorRequest:](self, "axElementFromTranslatorRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "parameters", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("actions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "supportsAction:", _convertAXPActionToiOS((int)objc_msgSend(v14, "intValue"))))objc_msgSend(v7, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_msgSend(v5, "setResultData:", v7);
  AXOverrideRequestingClientType();

  return v5;
}

- (id)processSupportsAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "clientType");
  AXOverrideRequestingClientType();
  v21 = (void *)objc_opt_new();
  -[AXPTranslator_iOS axElementFromTranslatorRequest:](self, "axElementFromTranslatorRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v4, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "integerValue");
        if (v14 == 96)
        {
          v15 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v5, "uiElement");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          v18 = 2713;
          goto LABEL_10;
        }
        if (v14 == 81)
        {
          v15 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v5, "uiElement");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          v18 = 2317;
LABEL_10:
          objc_msgSend(v15, "numberWithBool:", objc_msgSend(v16, "BOOLWithAXAttribute:", v18));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v13);

          continue;
        }
        objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  objc_msgSend(v21, "setResultData:", v6);
  AXOverrideRequestingClientType();

  return v21;
}

- (id)_preprocessRequest:(int64_t)a3 parameter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  void *v15;
  uint64_t v16;
  AXValueRef v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;

  v5 = a4;
  if (a3 == 92516)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("AXStartElement"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v5, "mutableCopy");
        +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "createPlatformElementFromTranslationObject:", v18);

        objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("AXStartElement"));
        v5 = v19;
      }

    }
    goto LABEL_15;
  }
  if (a3 != 95227 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_15:
    v11 = v5;
    return v11;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("AXPCustomRotorTargetElement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("AXPCustomRotorTargetRange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("AXPCustomRotorDirection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("AXPCustomRotorUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("uuid"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9 != 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("direction"));

  +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (const void *)objc_msgSend(v13, "createPlatformElementFromTranslationObject:", v6);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("targetElement"));
  if (v14)
    CFRelease(v14);
  if (v7)
  {
    v23 = objc_msgSend(v7, "rangeValue");
    v24 = v16;
    if (v23 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = AXValueCreate(kAXValueTypeCFRange, &v23);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("targetRange"), v23, v24);
      if (v17)
        CFRelease(v17);
    }
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("currentItem"), v23, v24);

  return v11;
}

- (id)processAttributeRequest:(id)a3
{
  id v4;
  void *v5;
  __AXUIElement *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v22;
  void *v23;
  uint64_t v24;

  v4 = a3;
  objc_msgSend(v4, "translation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientType");
  AXOverrideRequestingClientType();
  v6 = -[AXPTranslator_iOS createPlatformElementFromTranslationObject:](self, "createPlatformElementFromTranslationObject:", v5);
  v7 = (void *)MEMORY[0x24BDFEA90];
  v8 = (void *)objc_opt_new();
  objc_msgSend(v7, "uiElementWithAXElement:cache:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  v11 = objc_msgSend(v4, "attributeType");
  objc_msgSend(v10, "setAttribute:", v11);
  v24 = 0;
  objc_msgSend(v4, "parameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS _processAttributeSpecialCases:uiElement:parameter:error:client:](self, "_processAttributeSpecialCases:uiElement:parameter:error:client:", v11, v9, v12, &v24, objc_msgSend(v4, "clientType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setResultData:", v13);

  objc_msgSend(v10, "resultData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v4, "parameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("parameter"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(v4, "parameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v4, "attributeType") == 63)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v17 = objc_msgSend(v16, "longValue");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = v16;
          v17 = _AXPConvertAXAttribute(v20);
          if (!v17)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("k%@Attribute"), v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = _AXPConvertAXAttribute(v22);

            if (!v17)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("kAX%@Attribute"), v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = _AXPConvertAXAttribute(v23);

            }
          }

        }
        else
        {
          v17 = 0;
        }
      }

      v16 = 0;
      if (!v17)
        goto LABEL_16;
    }
    else
    {
      v17 = -[AXPTranslator_iOS attributeFromRequest:](self, "attributeFromRequest:", v11);
      if (!v17)
      {
LABEL_16:
        v24 = -25205;
        goto LABEL_17;
      }
    }
    -[AXPTranslator_iOS _preprocessRequest:parameter:](self, "_preprocessRequest:parameter:", v17, v16);
    v18 = objc_claimAutoreleasedReturnValue();

    -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v9, v17, v11, v18, &v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setResultData:", v19);

    v16 = (void *)v18;
LABEL_17:

  }
  objc_msgSend(v10, "setError:", v24);
  if (v6)
    CFRelease(v6);
  AXOverrideRequestingClientType();

  return v10;
}

- (AXUIElement)systemAppElement
{
  AXUIElement *systemAppElement;
  void *v4;
  void *v5;
  __AXUIElement *v6;
  void *v7;
  void *v8;
  AXUIElement *v9;
  AXUIElement *v10;
  uint64_t v12;

  systemAppElement = self->_systemAppElement;
  if (!systemAppElement)
  {
    -[AXPTranslator_iOS systemWideElement](self, "systemWideElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    -[AXPTranslator_iOS _processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:](self, "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", v4, 1001, 0, 0, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = -[AXPTranslator_iOS createPlatformElementFromTranslationObject:](self, "createPlatformElementFromTranslationObject:", v5);
      v7 = (void *)MEMORY[0x24BDFEA90];
      v8 = (void *)objc_opt_new();
      objc_msgSend(v7, "uiElementWithAXElement:cache:", v6, v8);
      v9 = (AXUIElement *)objc_claimAutoreleasedReturnValue();
      v10 = self->_systemAppElement;
      self->_systemAppElement = v9;

      if (v6)
        CFRelease(v6);
    }

    systemAppElement = self->_systemAppElement;
  }
  return systemAppElement;
}

- (id)processApplicationObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const void *AppElementWithPid;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "clientType");
  AXOverrideRequestingClientType();
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v6, "intValue");
  else
    getpid();
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
  v8 = (void *)objc_opt_new();
  -[AXPTranslator_iOS translationObjectFromPlatformElement:](self, "translationObjectFromPlatformElement:", AppElementWithPid);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultData:", v9);
  if (AppElementWithPid)
    CFRelease(AppElementWithPid);
  AXOverrideRequestingClientType();

  return v8;
}

- (id)processFrontMostApp:(id)a3
{
  return -[AXPTranslator_iOS processFrontMostApp:withiOSAttribute:](self, "processFrontMostApp:withiOSAttribute:", a3, 1102);
}

- (id)_processFrontMostAppForContinuity:(id)a3
{
  return -[AXPTranslator_iOS processFrontMostApp:withiOSAttribute:](self, "processFrontMostApp:withiOSAttribute:", a3, 1111);
}

- (id)processFrontMostApp:(id)a3 withiOSAttribute:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD);
  int v10;
  void *v11;
  void *v12;
  const void *AppElementWithPid;
  void *v14;
  _QWORD v16[4];
  id v17;
  AXPTranslator_iOS *v18;
  uint64_t *v19;
  uint64_t *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  objc_msgSend(v6, "clientType");
  AXOverrideRequestingClientType();
  -[AXPTranslator_iOS systemAppElement](self, "systemAppElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __58__AXPTranslator_iOS_processFrontMostApp_withiOSAttribute___block_invoke;
  v16[3] = &unk_24E6ABE60;
  v8 = v7;
  v20 = &v22;
  v21 = a4;
  v17 = v8;
  v18 = self;
  v19 = &v26;
  v9 = (void (**)(_QWORD))MEMORY[0x2276661BC](v16);
  v10 = objc_msgSend(v8, "pid");
  if (v10 == getpid())
    dispatch_sync(MEMORY[0x24BDAC9B8], v9);
  else
    v9[2](v9);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setError:", v23[3]);
  objc_msgSend((id)v27[5], "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "intValue");
    AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
    -[AXPTranslator_iOS translationObjectFromPlatformElement:](self, "translationObjectFromPlatformElement:", AppElementWithPid);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setResultData:", v14);
    if (AppElementWithPid)
      CFRelease(AppElementWithPid);
  }
  else
  {
    objc_msgSend((id)v27[5], "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setResultData:", v14);
  }

  AXOverrideRequestingClientType();
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

- (id)processAXTreeElements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("treeDumpType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS generateAXTreeDumpForRequest:treeDumpType:](self, "generateAXTreeDumpForRequest:treeDumpType:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)generateAXTreeDumpForRequest:(id)a3 treeDumpType:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  AXPTranslatorRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  AXPTranslatorRequest *v30;
  void *v31;
  AXPTranslatorRequest *v32;
  void *v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  AXPTranslatorRequest *v44;
  void *v45;
  void *v46;
  AXPTranslatorRequest *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  AXPTranslatorRequest *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  AXPTranslatorRequest *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  AXPTranslatorRequest *v70;
  unint64_t v71;
  id v72;
  void *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  const __CFString *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  _BYTE v83[128];
  const __CFString *v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_msgSend(a3, "clientType");
  AXOverrideRequestingClientType();
  v61 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v63 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v72 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v74 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v60 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v64 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v66 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("AXPTreeDumpTypeInitialDump")))
  {
    -[AXPTranslator_iOS _topPriorityAXTreeAttrValues](self, "_topPriorityAXTreeAttrValues");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("AXPTreeDumpTypeAdditionalData")))
      goto LABEL_6;
    -[AXPTranslator_iOS _allAXTreeAttrValues](self, "_allAXTreeAttrValues");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  v73 = v9;
LABEL_6:
  v10 = objc_alloc_init(AXPTranslatorRequest);
  -[AXPTranslatorRequest setClientType:](v10, "setClientType:", v7);
  v59 = v10;
  -[AXPTranslator_iOS _processFrontMostAppForContinuity:](self, "_processFrontMostAppForContinuity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAssociatedRequestType:", 4);
  objc_msgSend(v63, "addObject:", v11);
  v62 = v11;
  objc_msgSend(v11, "translationResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v62, "translationResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObject:", v13);

    AXOverrideRequestingClientType();
    +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "translationResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (const void *)objc_msgSend(v14, "createPlatformElementFromTranslationObject:", v15);

    v17 = (void *)MEMORY[0x24BDFEA90];
    v18 = (void *)objc_opt_new();
    objc_msgSend(v17, "uiElementWithAXElement:cache:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setAXAttribute:withNumber:", 3071, MEMORY[0x24BDBD1C8]);
    -[AXPTranslator_iOS frontmostAppOnContinuityDisplay](self, "frontmostAppOnContinuityDisplay");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      -[AXPTranslator_iOS frontmostAppOnContinuityDisplay](self, "frontmostAppOnContinuityDisplay");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v19, "isEqual:", v22);

      if ((v23 & 1) == 0)
      {
        -[AXPTranslator_iOS frontmostAppOnContinuityDisplay](self, "frontmostAppOnContinuityDisplay");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setAXAttribute:withNumber:", 3071, MEMORY[0x24BDBD1C0]);

        -[AXPTranslator_iOS setFrontmostAppOnContinuityDisplay:](self, "setFrontmostAppOnContinuityDisplay:", v19);
      }
    }
    if (v16)
      CFRelease(v16);

  }
  if (v7 == 4)
  {
    v25 = (void *)MEMORY[0x24BDBCEB8];
    -[AXPTranslator_iOS _frontmostAppChildrenForXCTest](self, "_frontmostAppChildrenForXCTest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = v66;
  }
  if (objc_msgSend(v27, "count"))
  {
    v28 = 0;
    v65 = v6;
    v67 = v27;
    do
    {
      objc_msgSend(v27, "objectAtIndex:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_alloc_init(AXPTranslatorRequest);
      -[AXPTranslatorRequest setClientType:](v30, "setClientType:", v7);
      -[AXPTranslatorRequest setTranslation:](v30, "setTranslation:", v29);
      v84 = CFSTR("attributes");
      v85[0] = v73;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXPTranslatorRequest setParameters:](v30, "setParameters:", v31);

      v32 = v30;
      -[AXPTranslator_iOS processMultipleAttributeRequest:removeEmptyValue:](self, "processMultipleAttributeRequest:removeEmptyValue:", v30, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setAssociatedTranslationObject:", v29);
      objc_msgSend(v33, "setAssociatedRequestType:", 5);
      -[AXPTranslator_iOS _safelyAddAXTreeDumpResponse:toResponsesDict:](self, "_safelyAddAXTreeDumpResponse:toResponsesDict:", v33, v72);
      objc_msgSend(v33, "resultData");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v33, "resultData");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", &unk_24E6B0F00);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v37 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v27, "addObjectsFromArray:", v37);
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("AXPTreeDumpTypeAdditionalData")))
      {
        v68 = v37;
        v69 = v33;
        v70 = v32;
        v71 = v28;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        -[AXPTranslator_iOS _allAXTreeAttrValues](self, "_allAXTreeAttrValues");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
        if (v39)
        {
          v40 = v39;
          v41 = *(_QWORD *)v76;
          do
          {
            for (i = 0; i != v40; ++i)
            {
              if (*(_QWORD *)v76 != v41)
                objc_enumerationMutation(v38);
              v43 = objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "unsignedIntegerValue");
              v44 = objc_alloc_init(AXPTranslatorRequest);
              -[AXPTranslatorRequest setClientType:](v44, "setClientType:", v7);
              -[AXPTranslatorRequest setAttributeType:](v44, "setAttributeType:", v43);
              -[AXPTranslatorRequest setTranslation:](v44, "setTranslation:", v29);
              -[AXPTranslator_iOS processCanSetAttribute:](self, "processCanSetAttribute:", v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setAssociatedTranslationObject:", v29);
              objc_msgSend(v45, "setAttribute:", v43);
              objc_msgSend(v45, "setAssociatedRequestType:", 3);
              objc_msgSend(v45, "resultData");
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (v46)
                -[AXPTranslator_iOS _safelyAddAXTreeDumpResponse:toResponsesDict:](self, "_safelyAddAXTreeDumpResponse:toResponsesDict:", v45, v74);

            }
            v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
          }
          while (v40);
        }

        v47 = objc_alloc_init(AXPTranslatorRequest);
        -[AXPTranslatorRequest setClientType:](v47, "setClientType:", v7);
        v81 = CFSTR("actions");
        -[AXPTranslator_iOS _allAXTreeActions](self, "_allAXTreeActions");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v48;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXPTranslatorRequest setParameters:](v47, "setParameters:", v49);

        -[AXPTranslatorRequest setTranslation:](v47, "setTranslation:", v29);
        -[AXPTranslator_iOS processSupportedActions:](self, "processSupportedActions:", v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setAssociatedTranslationObject:", v29);
        objc_msgSend(v50, "setAssociatedRequestType:", 9);
        objc_msgSend(v50, "resultData");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
          -[AXPTranslator_iOS _safelyAddAXTreeDumpResponse:toResponsesDict:](self, "_safelyAddAXTreeDumpResponse:toResponsesDict:", v50, v74);
        v52 = objc_alloc_init(AXPTranslatorRequest);
        -[AXPTranslatorRequest setClientType:](v52, "setClientType:", v7);
        v79 = CFSTR("attributes");
        -[AXPTranslator_iOS _allAXTreeAttrValues](self, "_allAXTreeAttrValues");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v53;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXPTranslatorRequest setParameters:](v52, "setParameters:", v54);

        -[AXPTranslatorRequest setTranslation:](v52, "setTranslation:", v29);
        -[AXPTranslator_iOS processSupportsAttributes:](self, "processSupportsAttributes:", v52);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setAssociatedTranslationObject:", v29);
        objc_msgSend(v55, "setAssociatedRequestType:", 10);
        objc_msgSend(v55, "resultData");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v65;
        if (v56)
          -[AXPTranslator_iOS _safelyAddAXTreeDumpResponse:toResponsesDict:](self, "_safelyAddAXTreeDumpResponse:toResponsesDict:", v55, v64);

        v27 = v67;
        v37 = v68;
        v32 = v70;
        v28 = v71;
        v33 = v69;
      }
      ++v28;

    }
    while (v28 < objc_msgSend(v27, "count"));
  }
  objc_msgSend(v63, "addObjectsFromArray:", v72);
  objc_msgSend(v63, "addObjectsFromArray:", v74);
  objc_msgSend(v63, "addObjectsFromArray:", v60);
  objc_msgSend(v63, "addObjectsFromArray:", v64);
  v57 = (void *)objc_opt_new();
  objc_msgSend(v57, "setAssociatedRequestType:", 11);
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v63, CFSTR("treeDump"));
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v6, CFSTR("treeDumpType"));
  objc_msgSend(v57, "setResultData:", v61);
  AXOverrideRequestingClientType();

  return v57;
}

- (void)_safelyAddAXTreeDumpResponse:(id)a3 toResponsesDict:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "resultData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator_iOS _postProcessResultDataForSecureCoding:](self, "_postProcessResultDataForSecureCoding:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "setResultData:", v9);
    objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    AXPlatformTranslationLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AXPTranslator_iOS _safelyAddAXTreeDumpResponse:toResponsesDict:].cold.1(v6, v10);

  }
}

- (id)_postProcessResultDataForSecureCoding:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v4);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke;
    v20[3] = &unk_24E6ABE88;
    v20[4] = self;
    v6 = v5;
    v21 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v20);
    if (objc_msgSend(v6, "count") || !objc_msgSend(v4, "count"))
      v7 = (id)objc_msgSend(v6, "copy");
    else
      v7 = 0;
    v9 = v21;
LABEL_19:

    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v4);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_2;
    v18[3] = &unk_24E6ABEB0;
    v18[4] = self;
    v6 = v8;
    v19 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v18);
    if (objc_msgSend(v6, "count") || !objc_msgSend(v4, "count"))
      v7 = (id)objc_msgSend(v6, "copy");
    else
      v7 = 0;
    v9 = v19;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_3;
    v13[3] = &unk_24E6ABED8;
    v13[4] = self;
    v13[5] = &v14;
    objc_msgSend(v4, "enumerateAttributesUsingBlock:", v13);
LABEL_14:
    if (*((_BYTE *)v15 + 24))
      v7 = v4;
    else
      v7 = 0;
    _Block_object_dispose(&v14, 8);
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    v10 = objc_msgSend(v4, "length");
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_4;
    v12[3] = &unk_24E6ABED8;
    v12[4] = self;
    v12[5] = &v14;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v12);
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_opt_class(), "supportsSecureCoding"))
  {
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }
LABEL_20:

  return v7;
}

- (id)_frontmostAppChildrenForXCTest
{
  void *v3;
  void *v4;
  __AXUIElement *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[AXPTranslator_iOS processFrontMostApp:](self, "processFrontMostApp:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "translationResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXPTranslator_iOS createPlatformElementFromTranslationObject:](self, "createPlatformElementFromTranslationObject:", v4);

  objc_msgSend(MEMORY[0x24BDFEA90], "uiElementWithAXElement:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithAXAttribute:", 5001);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[AXPTranslator_iOS translationObjectFromPlatformElement:](self, "translationObjectFromPlatformElement:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  if (v5)
    CFRelease(v5);

  return v8;
}

- (id)_allAXTreeActions
{
  if (_allAXTreeActions_onceAttrToken != -1)
    dispatch_once(&_allAXTreeActions_onceAttrToken, &__block_literal_global_387);
  return (id)_allAXTreeActions_actionValues;
}

- (id)_topPriorityAXTreeAttrValues
{
  if (_topPriorityAXTreeAttrValues_onceAttrToken != -1)
    dispatch_once(&_topPriorityAXTreeAttrValues_onceAttrToken, &__block_literal_global_388);
  return (id)_topPriorityAXTreeAttrValues_attributeValues;
}

- (id)_allAXTreeAttrValues
{
  if (_allAXTreeAttrValues_onceAttrToken != -1)
    dispatch_once(&_allAXTreeAttrValues_onceAttrToken, &__block_literal_global_425);
  return (id)_allAXTreeAttrValues_attributeValues;
}

- (id)processHitTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  CFTypeRef v8;
  CFTypeRef v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __AXUIElement *v18;
  void *v19;
  const void *AppElementWithPid;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  pid_t pid;
  CFTypeRef cf[2];

  v4 = a3;
  objc_msgSend(v4, "clientType");
  AXOverrideRequestingClientType();
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("point"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)cf = *MEMORY[0x24BDBEFB0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_retainAutorelease(v6);
    if (!strcmp((const char *)objc_msgSend(v7, "objCType"), "{CGPoint=dd}"))
      objc_msgSend(v7, "getValue:", cf);
  }

  v9 = cf[0];
  v8 = cf[1];

  objc_msgSend(v4, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("displayId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "unsignedIntValue");

  objc_msgSend(v4, "parameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("contextId"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntValue");

  objc_msgSend(v4, "translation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rawElementData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (const __AXUIElement *)_AXUIElementCreateWithData();

  pid = objc_msgSend(v16, "pid");
  if (!pid)
  {
    if ((objc_msgSend(v16, "didPopuldateAppInfo") & 1) != 0
      || (AXUIElementGetPid(v18, &pid),
          objc_msgSend(v16, "setPid:", pid),
          objc_msgSend(v16, "setIsApplicationElement:", AXUIElementIsApplication()),
          objc_msgSend(v16, "setDidPopuldateAppInfo:", 1),
          !pid))
    {
      -[AXPTranslator systemAppDelegate](self, "systemAppDelegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) != 0)
      {
        -[AXPTranslator systemAppDelegate](self, "systemAppDelegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "frontmostProcessPids");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        pid = objc_msgSend(v28, "intValue");

      }
    }
  }
  cf[0] = 0;
  v19 = (void *)objc_opt_new();
  if (!pid)
  {
    -[AXPTranslator_iOS systemWideElement](self, "systemWideElement");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "axElement");
    if (v12)
      v29 = AXUIElementCopyElementUsingDisplayIdAtPosition();
    else
      v29 = _AXUIElementCopyElementAtPositionWithParams();
    v23 = v29;
    goto LABEL_21;
  }
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid();
  objc_msgSend(MEMORY[0x24BDFEA68], "elementWithAXUIElement:", AppElementWithPid);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if ((_DWORD)v15)
  {
    if (v12)
      goto LABEL_9;
    goto LABEL_8;
  }
  v15 = objc_msgSend(v21, "contextIdForPoint:", *(double *)&v9, *(double *)&v8);
  if (!v12)
LABEL_8:
    objc_msgSend(v22, "displayIdForContextId:", v15);
LABEL_9:
  AXConvertPointFromHostedCoordinates();
  v23 = _AXUIElementCopyElementAtPositionWithParams();
  if (AppElementWithPid)
    CFRelease(AppElementWithPid);
LABEL_21:

  objc_msgSend(v19, "setError:", _convertAXError(v23));
  if (v18)
    CFRelease(v18);
  -[AXPTranslator_iOS translationObjectFromPlatformElement:](self, "translationObjectFromPlatformElement:", cf[0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setResultData:", v30);
  if (cf[0])
  {
    CFRelease(cf[0]);
    cf[0] = 0;
  }
  AXOverrideRequestingClientType();

  return v19;
}

- (__AXUIElement)createPlatformElementFromTranslationObject:(id)a3
{
  id v4;
  NSObject *cacheQueue;
  id v6;
  __AXUIElement *v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__AXPTranslator_iOS_createPlatformElementFromTranslationObject___block_invoke;
  block[3] = &unk_24E6ABF60;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(cacheQueue, block);
  v7 = (__AXUIElement *)v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)translationObjectFromPlatformElement:(__AXUIElement *)a3
{
  __AXUIElement *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *cacheQueue;
  id v12;
  id v13;
  void *v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  __AXUIElement *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v3 = a3;
  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDFEA90];
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "uiElementWithAXElement:cache:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_new();
    v9 = _AXUIElementIDForElement();
    objc_msgSend(v8, "setUid:", v9, v10);
    objc_msgSend(v8, "setPid:", objc_msgSend(v7, "pid"));
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    v26 = 0;
    cacheQueue = self->_cacheQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__AXPTranslator_iOS_translationObjectFromPlatformElement___block_invoke;
    block[3] = &unk_24E6ABF88;
    v19 = &v21;
    block[4] = self;
    v12 = v8;
    v17 = v12;
    v13 = v7;
    v18 = v13;
    v20 = v3;
    dispatch_sync(cacheQueue, block);
    objc_msgSend((id)v22[5], "remoteDescriptionBlock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      objc_msgSend((id)v22[5], "setRemoteDescriptionBlock:", &__block_literal_global_504);
    v3 = (__AXUIElement *)(id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  return v3;
}

+ (id)translationObjectFromUIKitObject:(id)a3
{
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;

  v4 = _AXCreateAXUIElementWithElement();
  if (v4)
  {
    v5 = (const void *)v4;
    objc_msgSend(a1, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "translationObjectFromPlatformElement:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)platformElementFromTranslation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AXPTranslator fakeElementCache](self, "fakeElementCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "objectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    +[AXPIOSPlatformElement platformElementWithTranslationObject:](AXPIOSPlatformElement, "platformElementWithTranslationObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPTranslator fakeElementCache](self, "fakeElementCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "objectID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
  return v7;
}

- (id)translationObjectFromData:(id)a3
{
  const void *v4;
  void *v5;

  v4 = (const void *)_AXUIElementCreateWithData();
  -[AXPTranslator_iOS translationObjectFromPlatformElement:](self, "translationObjectFromPlatformElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    CFRelease(v4);
  return v5;
}

- (id)remoteTranslationDataWithTranslation:(id)a3 pid:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  const void *v8;
  int v9;
  void *Data;
  CFTypeRef cf;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  objc_msgSend(v5, "rawElementData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_7;
  objc_msgSend(v5, "rawElementData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (const void *)_AXUIElementCreateWithData();

  cf = 0;
  v9 = _AXPAXUIElementReplaceWithRemotePid((uint64_t)v8, &cf, v4);
  if (v8)
    CFRelease(v8);
  if (v9)
  {
    Data = (void *)_AXUIElementCreateData();
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  else
  {
LABEL_7:
    Data = 0;
  }

  return Data;
}

- (BOOL)accessibilityEnabled
{
  return self->_accessibilityEnabled;
}

- (__AXObserver)axEventObserver
{
  return self->_axEventObserver;
}

- (void)setAxEventObserver:(__AXObserver *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (void)setSystemAppElement:(id)a3
{
  objc_storeStrong((id *)&self->_systemAppElement, a3);
}

- (AXUIElement)systemWideElement
{
  return self->_systemWideElement;
}

- (void)setSystemWideElement:(id)a3
{
  objc_storeStrong((id *)&self->_systemWideElement, a3);
}

- (AXUIElement)frontmostAppOnContinuityDisplay
{
  return self->_frontmostAppOnContinuityDisplay;
}

- (void)setFrontmostAppOnContinuityDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_frontmostAppOnContinuityDisplay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontmostAppOnContinuityDisplay, 0);
  objc_storeStrong((id *)&self->_systemWideElement, 0);
  objc_storeStrong((id *)&self->_systemAppElement, 0);
  objc_storeStrong((id *)&self->_threadSemaphore, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_cachedElements, 0);
  objc_storeStrong((id *)&self->_backTranslationCache, 0);
  objc_storeStrong((id *)&self->_translationCache, 0);
}

- (void)_safelyAddAXTreeDumpResponse:(void *)a1 toResponsesDict:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "resultData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[AXPTranslator_iOS _safelyAddAXTreeDumpResponse:toResponsesDict:]";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_220DB6000, a2, OS_LOG_TYPE_ERROR, "%s: resultData does not conform to NSSecureCoding: %@", (uint8_t *)&v4, 0x16u);

}

@end
