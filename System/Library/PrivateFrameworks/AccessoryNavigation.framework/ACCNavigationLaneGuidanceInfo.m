@implementation ACCNavigationLaneGuidanceInfo

- (ACCNavigationLaneGuidanceInfo)init
{
  ACCNavigationLaneGuidanceInfo *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *infoDict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationLaneGuidanceInfo;
  v2 = -[ACCNavigationLaneGuidanceInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    infoDict = v2->_infoDict;
    v2->_infoDict = v3;

  }
  return v2;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4;
  id v5;
  char isKindOfClass;
  NSObject *v8;
  id v9;
  _DWORD v10[2];
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (v4 >= 4)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v4;
      _os_log_impl(&dword_219FB5000, v8, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate InfoType %d", (uint8_t *)v10, 8u);
    }

    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)copyInfo:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[ACCNavigationLaneGuidanceInfo keyForType:](ACCNavigationLaneGuidanceInfo, "keyForType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_infoDict, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)setInfo:(unsigned __int16)a3 data:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v6 = a4;
  +[ACCNavigationLaneGuidanceInfo keyForType:](ACCNavigationLaneGuidanceInfo, "keyForType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && -[ACCNavigationLaneGuidanceInfo _checkDataClassForType:data:](self, "_checkDataClassForType:data:", v4, v6))
  {
    -[NSMutableDictionary setObject:forKey:](self->_infoDict, "setObject:forKey:", v6, v7);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyDictionary
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", self->_infoDict);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", ACCNav_LGIUpdate_LaneInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "copyDictionary", (_QWORD)v12);
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_msgSend(v2, "setObject:forKey:", v4, ACCNav_LGIUpdate_LaneInfo);
  }

  return v2;
}

+ (id)keyForType:(unsigned __int16)a3
{
  int v3;
  __CFString **v4;
  __CFString *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3 == 3)
  {
    v4 = &ACCNav_LGIUpdate_InstructionText;
    goto LABEL_7;
  }
  v3 = a3;
  if (a3 == 2)
  {
    v4 = &ACCNav_LGIUpdate_LaneInfo;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v4 = &ACCNav_LGIUpdate_LaneGuidanceIndex;
LABEL_7:
    v5 = *v4;
    return v5;
  }
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_219FB5000, v8, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate InfoType %d", (uint8_t *)v10, 8u);
  }

  v5 = 0;
  return v5;
}

- (NSMutableDictionary)infoDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInfoDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoDict, 0);
}

@end
