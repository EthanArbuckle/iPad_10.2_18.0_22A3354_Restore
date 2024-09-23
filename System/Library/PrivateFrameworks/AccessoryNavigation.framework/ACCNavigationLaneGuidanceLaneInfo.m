@implementation ACCNavigationLaneGuidanceLaneInfo

- (ACCNavigationLaneGuidanceLaneInfo)init
{
  ACCNavigationLaneGuidanceLaneInfo *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *infoDict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationLaneGuidanceLaneInfo;
  v2 = -[ACCNavigationLaneGuidanceLaneInfo init](&v6, sel_init);
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
      _os_log_impl(&dword_219FB5000, v8, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate:LaneInfo InfoType %d", (uint8_t *)v10, 8u);
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

  +[ACCNavigationLaneGuidanceLaneInfo keyForType:](ACCNavigationLaneGuidanceLaneInfo, "keyForType:", a3);
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
  +[ACCNavigationLaneGuidanceLaneInfo keyForType:](ACCNavigationLaneGuidanceLaneInfo, "keyForType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && -[ACCNavigationLaneGuidanceLaneInfo _checkDataClassForType:data:](self, "_checkDataClassForType:data:", v4, v6))
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
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_infoDict);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)keyForType:(unsigned __int16)a3
{
  int v3;
  __CFString **v4;
  BOOL v5;
  id v6;
  id result;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0u:
      v4 = &ACCNav_LGIUpdate_LaneInfo_Index;
      goto LABEL_14;
    case 1u:
      v4 = &ACCNav_LGIUpdate_LaneInfo_Status;
      goto LABEL_14;
    case 2u:
      v4 = &ACCNav_LGIUpdate_LaneInfo_Angle;
      goto LABEL_14;
    case 3u:
      v4 = &ACCNav_LGIUpdate_LaneInfo_AngleHighlight;
LABEL_14:
      result = *v4;
      break;
    default:
      if (gLogObjects)
        v5 = gNumLogObjects < 1;
      else
        v5 = 1;
      if (v5)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
        v8 = MEMORY[0x24BDACB70];
        v6 = MEMORY[0x24BDACB70];
      }
      else
      {
        v8 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = v3;
        _os_log_impl(&dword_219FB5000, v8, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown LaneGuidanceInfoUpdate:LaneInfo InfoType %d", (uint8_t *)v9, 8u);
      }

      result = 0;
      break;
  }
  return result;
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
