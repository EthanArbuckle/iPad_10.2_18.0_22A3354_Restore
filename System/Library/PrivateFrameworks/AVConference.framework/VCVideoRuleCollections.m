@implementation VCVideoRuleCollections

- (id)getVideoRulesForTransport:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5
{
  VCVideoRuleCollectionKey *v6;
  void *v7;

  v6 = -[VCVideoRuleCollectionKey initWithPayload:transportType:encodingType:]([VCVideoRuleCollectionKey alloc], "initWithPayload:transportType:encodingType:", *(_QWORD *)&a4, a3, a5);
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_rules, "objectForKeyedSubscript:", v6);

  return (id)objc_msgSend(v7, "copy");
}

- (VCVideoRuleCollections)init
{
  VCVideoRuleCollections *v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCVideoRuleCollections;
  v2 = -[VCVideoRuleCollections init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v2->_rules = (NSMutableDictionary *)v3;
    if (v3)
    {
      v4 = objc_opt_new();
      v2->_supportedPayloads = (NSMutableArray *)v4;
      if (v4)
        return v2;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoRuleCollections init].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollections init].cold.1();
    }

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCVideoRuleCollections;
  -[VCVideoRuleCollections dealloc](&v3, sel_dealloc);
}

- (id)filterRules:(id)a3 byBitrateRule:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(a3);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v11, "compare:", a4) <= 0)
            objc_msgSend(v6, "addObject:", v11);
        }
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      }
      while (v8);
    }
    if (objc_msgSend(v6, "count") || !objc_msgSend(a3, "count"))
      objc_msgSend(v6, "sortUsingSelector:", sel_compare_);
    else
      objc_msgSend(v6, "addObject:", a4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315906;
        v16 = v13;
        v17 = 2080;
        v18 = "-[VCVideoRuleCollections filterRules:byBitrateRule:]";
        v19 = 1024;
        v20 = 122;
        v21 = 2080;
        v22 = objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCVideoRuleCollections: Returning filtered video rules %s", (uint8_t *)&v15, 0x26u);
      }
    }
    return v6;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoRuleCollections filterRules:byBitrateRule:].cold.1();
    }
    return 0;
  }
}

- (id)supportedVideoRulesSyncForTransportType:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v9;
  void *v10;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  objc_sync_enter(self);
  v9 = -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", v7, v6, v5);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v9);
  objc_sync_exit(self);
  return v10;
}

- (id)supportedVideoSizesForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_rules, "objectForKeyedSubscript:", a3);
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        v12 = v7;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          v13 = objc_msgSend(v7, "iWidth");
          if (v13 != objc_msgSend(v12, "iWidth")
            || (v14 = objc_msgSend(v7, "iHeight"), v14 != objc_msgSend(v12, "iHeight")))
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          ++v11;
          v12 = v7;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      }
      while (v9);
    }
    objc_msgSend(v5, "addObject:", v7);
  }
  return v5;
}

- (id)description
{
  id v3;
  NSMutableDictionary *rules;
  id v5;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("VCVideoRuleCollections description: count = %lu.\n"), -[NSMutableDictionary count](self->_rules, "count"));
  rules = self->_rules;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__VCVideoRuleCollections_description__block_invoke;
  v7[3] = &unk_1E9E58C40;
  v7[4] = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](rules, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (id)objc_msgSend(v3, "copy");

  return v5;
}

uint64_t __37__VCVideoRuleCollections_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("  encodingType = %d, payload = %d, transportType = %d, rules = "), objc_msgSend(a2, "encodingType"), objc_msgSend(a2, "payload"), objc_msgSend(a2, "transportType"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = *(void **)(a1 + 32);
        v11 = objc_msgSend(v9, "iWidth");
        v12 = objc_msgSend(v9, "iHeight");
        objc_msgSend(v9, "fRate");
        objc_msgSend(v10, "appendFormat:", CFSTR("%dx%d@%u "), v11, v12, v13);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v6);
  }
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
}

- (id)supportedVideoRulesSizesForBitrate:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6
{
  VCVideoRuleCollectionKey *v9;
  id v10;

  v9 = -[VCVideoRuleCollectionKey initWithPayload:transportType:encodingType:]([VCVideoRuleCollectionKey alloc], "initWithPayload:transportType:encodingType:", *(_QWORD *)&a5, a4, a6);
  v10 = -[VCVideoRuleCollections supportedVideoSizesForKey:](self, "supportedVideoSizesForKey:", v9);

  if (a5 == 126 && v10)
    return -[VCVideoRuleCollections filterRules:byBitrateRule:](self, "filterRules:byBitrateRule:", v10, a3);
  else
    return v10;
}

- (id)supportedVideoRulesForBitrate:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = -[VCVideoRuleCollections supportedVideoRulesSyncForTransportType:payload:encodingType:](self, "supportedVideoRulesSyncForTransportType:payload:encodingType:", a4, *(_QWORD *)&a5, a6);
  if (a5 == 126)
    v10 = -[VCVideoRuleCollections filterRules:byBitrateRule:](self, "filterRules:byBitrateRule:", v9, a3);
  else
    v10 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
  v11 = v10;
  objc_msgSend(v10, "sortUsingSelector:", sel_compareByPref_);
  return v11;
}

- (NSSet)supportedTransportTypes
{
  id v3;
  NSMutableDictionary *rules;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  rules = self->_rules;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](rules, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(rules);
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "transportType")));
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](rules, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  return (NSSet *)v3;
}

+ (id)newCorrectedVideoRules:(id)a3 payload:(int)a4
{
  uint64_t v4;
  void *v5;
  int v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  VCVideoRule *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  double v21;
  double v22;
  VCVideoRule *v23;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v4 = *(_QWORD *)&a4;
  v30 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "firstObject");
  if (!objc_msgSend(a3, "count") || objc_msgSend(v5, "iPayload") == (_DWORD)v4)
    return a3;
  v7 = objc_msgSend(v5, "iPayload");
  if ((_DWORD)v4 != 126 || v7 != 123)
  {
    v8 = objc_msgSend(v5, "iPayload");
    if ((_DWORD)v4 != 123 || v8 != 126)
      return a3;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(a3);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        v15 = [VCVideoRule alloc];
        v16 = objc_msgSend(v14, "iWidth");
        v17 = objc_msgSend(v14, "iHeight");
        objc_msgSend(v14, "fRate");
        v19 = v18;
        objc_msgSend(v14, "fPref");
        LODWORD(v21) = v20;
        LODWORD(v22) = v19;
        v23 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:priority:](v15, "initWithFrameWidth:frameHeight:frameRate:payload:priority:", v16, v17, v4, v22, v21);
        objc_msgSend(v9, "addObject:", v23);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v11);
  }
  return v9;
}

- (void)addVideoRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  VCVideoRuleCollectionKey *v11;
  id v12;

  if (a3)
  {
    v6 = a6;
    v7 = *(_QWORD *)&a5;
    v8 = a4;
    v10 = +[VCVideoRuleCollections newCorrectedVideoRules:payload:](VCVideoRuleCollections, "newCorrectedVideoRules:payload:", a3, *(_QWORD *)&a5);
    if (v10)
    {
      v12 = v10;
      if ((-[NSMutableArray containsObject:](self->_supportedPayloads, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7)) & 1) == 0)-[NSMutableArray addObject:](self->_supportedPayloads, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7));
      v11 = -[VCVideoRuleCollectionKey initWithPayload:transportType:encodingType:]([VCVideoRuleCollectionKey alloc], "initWithPayload:transportType:encodingType:", v7, v8, v6);
      objc_msgSend(v12, "sortUsingSelector:", sel_compare_);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rules, "setObject:forKeyedSubscript:", v12, v11);

    }
  }
}

- (void)appendVideoRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  VCVideoRuleCollectionKey *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v11 = -[VCVideoRuleCollectionKey initWithPayload:transportType:encodingType:]([VCVideoRuleCollectionKey alloc], "initWithPayload:transportType:encodingType:", *(_QWORD *)&a5, a4, a6);
  v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_rules, "objectForKeyedSubscript:", v11);

  if (v12)
  {
    v13 = +[VCVideoRuleCollections newCorrectedVideoRules:payload:](VCVideoRuleCollections, "newCorrectedVideoRules:payload:", a3, v7);
    if (v13)
    {
      v14 = v13;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v22 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            if ((objc_msgSend(v12, "containsObject:", v19) & 1) == 0)
              objc_msgSend(v12, "addObject:", v19);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
        }
        while (v16);
      }
      objc_msgSend(v12, "sortUsingSelector:", sel_compare_);

    }
  }
  else
  {
    -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](self, "addVideoRules:transportType:payload:encodingType:", a3, v8, v7, v6);
  }
}

- (void)removeVideoRulesWithWidth:(int)a3 height:(int)a4 transportType:(unsigned __int8)a5 encodingType:(unsigned __int8)a6
{
  uint64_t i;
  VCVideoRuleCollectionKey *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSMutableArray *obj;
  uint64_t v18;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v20 = a5;
  v21 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_supportedPayloads;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (v22)
  {
    v18 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(obj);
        v9 = -[VCVideoRuleCollectionKey initWithPayload:transportType:encodingType:]([VCVideoRuleCollectionKey alloc], "initWithPayload:transportType:encodingType:", objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "intValue"), v20, v21);
        v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_rules, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_opt_new();
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v10);
              v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              if (objc_msgSend(v16, "iWidth") == a3 && objc_msgSend(v16, "iHeight") == a4)
                objc_msgSend(v11, "addObject:", v16);
            }
            v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
          }
          while (v13);
        }
        objc_msgSend(v10, "removeObjectsInArray:", v11);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    }
    while (v22);
  }
}

- (void)limitRulesFromVideoRules:(int)a3 frameHeight:(int)a4 videoRules:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(a5);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((int)objc_msgSend(v13, "iWidth") > a3 || (int)objc_msgSend(v13, "iHeight") > a4)
          objc_msgSend(v8, "addObject:", v13);
      }
      v10 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v10);
  }
  objc_msgSend(a5, "removeObjectsInArray:", v8);

}

- (void)limitVideoRulesToMaxWidth:(int)a3 maxHeight:(int)a4 transportType:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  unint64_t v11;
  int v12;
  NSMutableArray *supportedPayloads;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  VCVideoRuleCollectionKey *v18;
  unint64_t v19;
  int v20;
  unsigned int v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v21 = a5;
  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v39 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "Cellular";
      v28 = v8;
      v29 = 2080;
      v30 = "-[VCVideoRuleCollections limitVideoRulesToMaxWidth:maxHeight:transportType:]";
      v31 = 1024;
      if (v21 == 1)
        v10 = "WiFi";
      v32 = 314;
      v33 = 1024;
      v34 = v6;
      v35 = 1024;
      v36 = v5;
      v37 = 2080;
      v38 = v10;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d maxWidth=%d, maxHeight=%d, transportType=%s", buf, 0x32u);
    }
  }
  if (objc_msgSend(&unk_1E9EFB030, "count"))
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v20 = v12;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      supportedPayloads = self->_supportedPayloads;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](supportedPayloads, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(supportedPayloads);
            v18 = -[VCVideoRuleCollectionKey initWithPayload:transportType:encodingType:]([VCVideoRuleCollectionKey alloc], "initWithPayload:transportType:encodingType:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "intValue"), v21, objc_msgSend((id)objc_msgSend(&unk_1E9EFB030, "objectAtIndexedSubscript:", v11), "intValue"));
            -[VCVideoRuleCollections limitRulesFromVideoRules:frameHeight:videoRules:](self, "limitRulesFromVideoRules:frameHeight:videoRules:", v6, v5, -[NSMutableDictionary objectForKeyedSubscript:](self->_rules, "objectForKeyedSubscript:", v18));

          }
          v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](supportedPayloads, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        }
        while (v15);
      }
      v11 = (v20 + 1);
      v19 = objc_msgSend(&unk_1E9EFB030, "count");
      v12 = v20 + 1;
    }
    while (v19 > v11);
  }
}

- (void)addSupportedPayload:(int)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", *(_QWORD *)&a3);
  -[NSMutableArray addObject:](self->_supportedPayloads, "addObject:", v4);

}

- (BOOL)isPayloadSupported:(int)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", *(_QWORD *)&a3);
  LOBYTE(self) = -[NSMutableArray containsObject:](self->_supportedPayloads, "containsObject:", v4);

  return (char)self;
}

+ (void)addRulesForU1ToCollection:(id)a3
{
  uint64_t v4;

  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCVideoRuleCollections addRulesForU1ToCollection:].cold.1(v4, (objc_class *)a1);
  }
}

+ (id)newU1VideoRuleCollections
{
  id v3;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_alloc_init((Class)a1);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCVideoRuleCollections newU1VideoRuleCollections].cold.1(v5, (objc_class *)a1);
    }
    goto LABEL_10;
  }
  objc_msgSend(a1, "addRulesForU1ToCollection:", v3);
  if (!objc_msgSend((id)objc_msgSend(v3, "rules"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCVideoRuleCollections newU1VideoRuleCollections].cold.2(v6, (objc_class *)a1);
    }
LABEL_10:

    return 0;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  NSMutableArray *supportedPayloads;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *rules;
  BOOL v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSMutableArray count](self->_supportedPayloads, "count");
  if (v5 != objc_msgSend((id)objc_msgSend(a3, "supportedPayloads"), "count"))
    return 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  supportedPayloads = self->_supportedPayloads;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](supportedPayloads, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(supportedPayloads);
      if (!objc_msgSend((id)objc_msgSend(a3, "supportedPayloads"), "containsObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9)))return 0;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](supportedPayloads, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
        if (v7)
          goto LABEL_5;
        break;
      }
    }
  }
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  rules = self->_rules;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__VCVideoRuleCollections_isEqual___block_invoke;
  v13[3] = &unk_1E9E58C68;
  v13[4] = a3;
  v13[5] = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](rules, "enumerateKeysAndObjectsUsingBlock:", v13);
  v11 = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return v11;
}

void *__34__VCVideoRuleCollections_isEqual___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *result;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "rules"), "objectForKeyedSubscript:", a2);
  if (result)
  {
    v8 = result;
    v9 = objc_msgSend(result, "count");
    result = (void *)objc_msgSend(a3, "count");
    if ((void *)v9 == result)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      result = (void *)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (!result)
        return result;
      v10 = result;
      v11 = *(_QWORD *)v15;
LABEL_5:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(a3);
        result = (void *)objc_msgSend(v8, "containsObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        if (!(_DWORD)result)
          break;
        if (v10 == (void *)++v12)
        {
          result = (void *)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
          v10 = result;
          if (result)
            goto LABEL_5;
          return result;
        }
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  *a4 = 1;
  return result;
}

- (BOOL)isEncodeSupported
{
  NSMutableDictionary *rules;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  rules = self->_rules;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__VCVideoRuleCollections_isEncodeSupported__block_invoke;
  v5[3] = &unk_1E9E58C90;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](rules, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__VCVideoRuleCollections_isEncodeSupported__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "encodingType");
  if ((_DWORD)result == 1)
  {
    result = objc_msgSend(a3, "count");
    if (result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (BOOL)isDecodeSupported
{
  NSMutableDictionary *rules;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  rules = self->_rules;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__VCVideoRuleCollections_isDecodeSupported__block_invoke;
  v5[3] = &unk_1E9E58C90;
  v5[4] = &v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](rules, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__VCVideoRuleCollections_isDecodeSupported__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "encodingType");
  if ((_DWORD)result == 2)
  {
    result = objc_msgSend(a3, "count");
    if (result)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (id)videoRulesCollectionsByRemovingPayload:(int)a3 andPayload:(int)a4 removeCellular:(BOOL)a5
{
  VCVideoRuleCollections *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v15;
  NSMutableArray *obj;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(VCVideoRuleCollections);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = -[VCVideoRuleCollections supportedPayloads](self, "supportedPayloads");
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "unsignedIntValue");
        if ((_DWORD)v13 != a3 && (_DWORD)v13 != a4)
        {
          v15 = v13;
          -[VCVideoRuleCollections addSupportedPayload:](v8, "addSupportedPayload:", v13);
          -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v8, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", 1, v15, 1)), 1, v15, 1);
          -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v8, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", 1, v15, 2)), 1, v15, 2);
          if (!a5)
          {
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v8, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", 2, v15, 1)), 2, v15, 1);
            -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v8, "addVideoRules:transportType:payload:encodingType:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](self, "getVideoRulesForTransport:payload:encodingType:", 2, v15, 2)), 2, v15, 2);
          }
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v10);
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSMutableArray mutableCopyWithZone:](self->_supportedPayloads, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setSupportedPayloads:", v6);

  v7 = (void *)-[NSMutableDictionary mutableCopyWithZone:](self->_rules, "mutableCopyWithZone:", a3);
  objc_msgSend(v5, "setRules:", v7);

  return v5;
}

- (NSMutableArray)supportedPayloads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSupportedPayloads:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)rules
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRules:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCVideoRules: Failed to create supported payload array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)filterRules:byBitrateRule:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCVideoRuleCollections: invalid bitrate rule", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)addRulesForU1ToCollection:(uint64_t)a1 .cold.1(uint64_t a1, objc_class *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_11(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Class=%s does NOT override this method.", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

+ (void)newU1VideoRuleCollections
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_11(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Skipping negotiating settings, as the local device does not support U+1 stream given by class=%s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

@end
