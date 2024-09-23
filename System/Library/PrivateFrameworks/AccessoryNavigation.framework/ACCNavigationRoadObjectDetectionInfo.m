@implementation ACCNavigationRoadObjectDetectionInfo

- (ACCNavigationRoadObjectDetectionInfo)init
{
  ACCNavigationRoadObjectDetectionInfo *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *infoDict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACCNavigationRoadObjectDetectionInfo;
  v2 = -[ACCNavigationRoadObjectDetectionInfo init](&v6, sel_init);
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
  id v2;
  id v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v28;
  int v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v28 = (void *)MEMORY[0x24BDD17C8];
  v2 = -[ACCNavigationRoadObjectDetectionInfo copyInfo:](self, "copyInfo:", 0);
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("[ "));
  v4 = objc_msgSend(v2, "count");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      v29 = v8;
      v11 = v8 + 1;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v10);
        if (v4 > v11 + v10)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v10), "description");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), v13);

        }
        objc_msgSend(v12, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), v14);

        ++v10;
      }
      while (v7 != v10);
      v8 = v29 + v7;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }
  v15 = v5;

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  v16 = (void *)objc_msgSend(v3, "copy");

  v17 = -[ACCNavigationRoadObjectDetectionInfo copyInfo:](self, "copyInfo:", 1);
  v18 = -[ACCNavigationRoadObjectDetectionInfo copyInfo:](self, "copyInfo:", 2);
  v19 = -[ACCNavigationRoadObjectDetectionInfo copyInfo:](self, "copyInfo:", 3);
  v20 = -[ACCNavigationRoadObjectDetectionInfo copyInfo:](self, "copyInfo:", 4);
  v21 = objc_msgSend(v20, "count");
  v22 = -[ACCNavigationRoadObjectDetectionInfo copyInfo:](self, "copyInfo:", 5);
  v23 = objc_msgSend(v22, "count");
  v24 = -[ACCNavigationRoadObjectDetectionInfo copyInfo:](self, "copyInfo:", 6);
  objc_msgSend(v28, "stringWithFormat:", CFSTR("<ACCNavigationRoadObjectDetectionInfo: componentIDs %@, timestamp %@, egoSpeed %@, egoYawRate %@, roadSign count %lu, roadLane count %lu, roadObject count %lu>"), v16, v17, v18, v19, v21, v23, objc_msgSend(v24, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)_checkDataClassForType:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4;
  id v5;
  char isKindOfClass;

  v4 = a3;
  v5 = a4;
  if (v4 > 6)
  {
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

  +[ACCNavigationRoadObjectDetectionInfo keyForType:](ACCNavigationRoadObjectDetectionInfo, "keyForType:", a3);
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
  +[ACCNavigationRoadObjectDetectionInfo keyForType:](ACCNavigationRoadObjectDetectionInfo, "keyForType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    && -[ACCNavigationRoadObjectDetectionInfo _checkDataClassForType:data:](self, "_checkDataClassForType:data:", v4, v6))
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
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ACCNavigationRoadObjectRoadSignInfo *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  ACCNavigationRoadObjectRoadLaneInfo *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  ACCNavigationRoadObjectRoadObjectInfo *v31;
  ACCNavigationRoadObjectDetectionInfo *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary removeAllObjects](self->_infoDict, "removeAllObjects");
    _setInfoFromDictionary(v4, self->_infoDict, ACCNav_RODUpdate_ID);
    _setInfoFromDictionary(v4, self->_infoDict, ACCNav_RODUpdate_Timestamp);
    _setInfoFromDictionary(v4, self->_infoDict, ACCNav_RODUpdate_EgoSpeed);
    _setInfoFromDictionary(v4, self->_infoDict, ACCNav_RODUpdate_EgoYawRate);
    objc_msgSend(v4, "objectForKey:", ACCNav_RODUpdate_RoadSign);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = self;
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v42;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v42 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v11);
            v13 = objc_alloc_init(ACCNavigationRoadObjectRoadSignInfo);
            -[ACCNavigationRoadObjectRoadSignInfo setInfoFromDictionary:](v13, "setInfoFromDictionary:", v12);
            objc_msgSend(v6, "addObject:", v13);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v9);
      }

      -[NSMutableDictionary setObject:forKey:](v32->_infoDict, "setObject:forKey:", v6, ACCNav_RODUpdate_RoadSign);
    }
    objc_msgSend(v4, "objectForKey:", ACCNav_RODUpdate_RoadLane);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v38;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v38 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v20);
            v22 = objc_alloc_init(ACCNavigationRoadObjectRoadLaneInfo);
            -[ACCNavigationRoadObjectRoadLaneInfo setInfoFromDictionary:](v22, "setInfoFromDictionary:", v21);
            objc_msgSend(v15, "addObject:", v22);

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        }
        while (v18);
      }

      -[NSMutableDictionary setObject:forKey:](v32->_infoDict, "setObject:forKey:", v15, ACCNav_RODUpdate_RoadLane);
    }
    objc_msgSend(v4, "objectForKey:", ACCNav_RODUpdate_RoadObject);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v25 = v23;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v34;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v34 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v29);
            v31 = objc_alloc_init(ACCNavigationRoadObjectRoadObjectInfo);
            -[ACCNavigationRoadObjectRoadObjectInfo setInfoFromDictionary:](v31, "setInfoFromDictionary:", v30);
            objc_msgSend(v24, "addObject:", v31);

            ++v29;
          }
          while (v27 != v29);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
        }
        while (v27);
      }

      -[NSMutableDictionary setObject:forKey:](v32->_infoDict, "setObject:forKey:", v24, ACCNav_RODUpdate_RoadObject);
    }

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
      v4 = &ACCNav_RODUpdate_ID;
      goto LABEL_17;
    case 1u:
      v4 = &ACCNav_RODUpdate_Timestamp;
      goto LABEL_17;
    case 2u:
      v4 = &ACCNav_RODUpdate_EgoSpeed;
      goto LABEL_17;
    case 3u:
      v4 = &ACCNav_RODUpdate_EgoYawRate;
      goto LABEL_17;
    case 4u:
      v4 = &ACCNav_RODUpdate_RoadSign;
      goto LABEL_17;
    case 5u:
      v4 = &ACCNav_RODUpdate_RoadLane;
      goto LABEL_17;
    case 6u:
      v4 = &ACCNav_RODUpdate_RoadObject;
LABEL_17:
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
