@implementation ACCNavigationRoadObjectRoadObjectInfo

- (ACCNavigationRoadObjectRoadObjectInfo)init
{
  ACCNavigationRoadObjectRoadObjectInfo *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *infoDict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationRoadObjectRoadObjectInfo;
  v2 = -[ACCNavigationRoadObjectRoadObjectInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    infoDict = v2->_infoDict;
    v2->_infoDict = v3;

  }
  return v2;
}

- (id)description
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  void *v15;

  v15 = (void *)MEMORY[0x24BDD17C8];
  v14 = -[ACCNavigationRoadObjectRoadObjectInfo copyInfo:](self, "copyInfo:", 0);
  v3 = -[ACCNavigationRoadObjectRoadObjectInfo copyInfo:](self, "copyInfo:", 1);
  v4 = -[ACCNavigationRoadObjectRoadObjectInfo copyInfo:](self, "copyInfo:", 2);
  v5 = -[ACCNavigationRoadObjectRoadObjectInfo copyInfo:](self, "copyInfo:", 3);
  v6 = -[ACCNavigationRoadObjectRoadObjectInfo copyInfo:](self, "copyInfo:", 4);
  v7 = -[ACCNavigationRoadObjectRoadObjectInfo copyInfo:](self, "copyInfo:", 5);
  v8 = -[ACCNavigationRoadObjectRoadObjectInfo copyInfo:](self, "copyInfo:", 6);
  v9 = -[ACCNavigationRoadObjectRoadObjectInfo copyInfo:](self, "copyInfo:", 7);
  v10 = -[ACCNavigationRoadObjectRoadObjectInfo copyInfo:](self, "copyInfo:", 8);
  v11 = -[ACCNavigationRoadObjectRoadObjectInfo copyInfo:](self, "copyInfo:", 9);
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<ACCNavigationRoadObjectRoadObjectInfo: ID %@, state %@, type %@, isMoving %@, lateral[offset %@, speed %@, accel %@] forward[offset %@, speed %@, accel %@]>"), v14, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4;
  id v5;
  char isKindOfClass;
  BOOL v7;
  id v8;
  NSObject *v9;
  _DWORD v11[2];
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (v4 > 9)
  {
    if (gLogObjects)
      v7 = gNumLogObjects < 1;
    else
      v7 = 1;
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCNavigationRouteGuidanceUpdateInfo _checkDataClassForType:data:].cold.1();
      v9 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    else
    {
      v9 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v4;
      _os_log_impl(&dword_219FB5000, v9, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown RoadObjectDetection:RoadObject InfoType %d", (uint8_t *)v11, 8u);
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

  +[ACCNavigationRoadObjectRoadObjectInfo keyForType:](ACCNavigationRoadObjectRoadObjectInfo, "keyForType:", a3);
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
  +[ACCNavigationRoadObjectRoadObjectInfo keyForType:](ACCNavigationRoadObjectRoadObjectInfo, "keyForType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && -[ACCNavigationRoadObjectRoadObjectInfo _checkDataClassForType:data:](self, "_checkDataClassForType:data:", v4, v6))
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

- (void)setInfoFromDictionary:(id)a3
{
  NSMutableDictionary *infoDict;
  id v5;

  if (a3)
  {
    infoDict = self->_infoDict;
    v5 = a3;
    -[NSMutableDictionary removeAllObjects](infoDict, "removeAllObjects");
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_ID);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_State);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_Type);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_IsMoving);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_LateralOffset);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_LateralSpeed);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_LateralAccel);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_ForwardOffset);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_ForwardSpeed);
    _setInfoFromDictionary(v5, self->_infoDict, ACCNav_RODUpdate_RoadObject_ForwardAccel);

  }
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
      v4 = &ACCNav_RODUpdate_RoadObject_ID;
      goto LABEL_20;
    case 1u:
      v4 = &ACCNav_RODUpdate_RoadObject_State;
      goto LABEL_20;
    case 2u:
      v4 = &ACCNav_RODUpdate_RoadObject_Type;
      goto LABEL_20;
    case 3u:
      v4 = &ACCNav_RODUpdate_RoadObject_IsMoving;
      goto LABEL_20;
    case 4u:
      v4 = &ACCNav_RODUpdate_RoadObject_LateralOffset;
      goto LABEL_20;
    case 5u:
      v4 = &ACCNav_RODUpdate_RoadObject_LateralSpeed;
      goto LABEL_20;
    case 6u:
      v4 = &ACCNav_RODUpdate_RoadObject_LateralAccel;
      goto LABEL_20;
    case 7u:
      v4 = &ACCNav_RODUpdate_RoadObject_ForwardOffset;
      goto LABEL_20;
    case 8u:
      v4 = &ACCNav_RODUpdate_RoadObject_ForwardSpeed;
      goto LABEL_20;
    case 9u:
      v4 = &ACCNav_RODUpdate_RoadObject_ForwardAccel;
LABEL_20:
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
        _os_log_impl(&dword_219FB5000, v8, OS_LOG_TYPE_DEFAULT, "[#Navigation] ERROR: Unknown RoadObjectDetectionInfo infoType %d", (uint8_t *)v9, 8u);
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
