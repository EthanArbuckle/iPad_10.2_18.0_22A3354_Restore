@implementation SYLogServiceState

void __59__SYLogServiceState_Convenience__setCocoaTransportOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a2;
  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setKey:", v6);

  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setValue:", v7);
  objc_msgSend(*(id *)(a1 + 32), "addTransportOptions:", v8);

}

- (void)addTransportOptions:(id)a3
{
  id v4;
  NSMutableArray *transportOptions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  transportOptions = self->_transportOptions;
  v8 = v4;
  if (!transportOptions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_transportOptions;
    self->_transportOptions = v6;

    v4 = v8;
    transportOptions = self->_transportOptions;
  }
  -[NSMutableArray addObject:](transportOptions, "addObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportOptions, 0);
  objc_storeStrong((id *)&self->_targetedDevice, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_peerGenerationID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_name)
    -[SYLogServiceState writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_engine)
    PBDataWriterWriteSubmessage();
  if (self->_session)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  if (self->_targetedDevice)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_transportOptions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (self->_peerID)
    PBDataWriterWriteStringField();
  if (self->_peerGenerationID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)setCocoaTransportOptions:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[SYLogServiceState clearTransportOptions](self, "clearTransportOptions");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__SYLogServiceState_Convenience__setCocoaTransportOptions___block_invoke;
  v5[3] = &unk_24CC668F8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

- (void)setTargetedDevice:(id)a3
{
  objc_storeStrong((id *)&self->_targetedDevice, a3);
}

- (void)setSessionQueueRunning:(BOOL)a3
{
  self->_sessionQueueRunning = a3;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setServiceType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_serviceType = a3;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (void)setPeerGenerationID:(id)a3
{
  objc_storeStrong((id *)&self->_peerGenerationID, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setEnqueuedSyncType:(int)a3
{
  self->_enqueuedSyncType = a3;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (void)clearTransportOptions
{
  -[NSMutableArray removeAllObjects](self->_transportOptions, "removeAllObjects");
}

- (BOOL)hasEngine
{
  return self->_engine != 0;
}

- (BOOL)hasSession
{
  return self->_session != 0;
}

- (BOOL)hasTargetedDevice
{
  return self->_targetedDevice != 0;
}

- (id)enqueuedSyncTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CC654B0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEnqueuedSyncType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Delta")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Reset")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)transportOptionsCount
{
  return -[NSMutableArray count](self->_transportOptions, "count");
}

- (id)transportOptionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_transportOptions, "objectAtIndex:", a3);
}

+ (Class)transportOptionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPeerID
{
  return self->_peerID != 0;
}

- (BOOL)hasPeerGenerationID
{
  return self->_peerGenerationID != 0;
}

- (int)serviceType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_serviceType;
  else
    return 0;
}

- (void)setHasServiceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServiceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)serviceTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CC654C8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsServiceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Master")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Slave")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SYLogServiceState;
  -[SYLogServiceState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLogServiceState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  SYLogEngineState *engine;
  void *v7;
  SYLogSessionState *session;
  void *v9;
  void *v10;
  SYLogDeviceState *targetedDevice;
  void *v12;
  uint64_t enqueuedSyncType;
  __CFString *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSString *peerID;
  NSString *peerGenerationID;
  uint64_t serviceType;
  __CFString *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  engine = self->_engine;
  if (engine)
  {
    -[SYLogEngineState dictionaryRepresentation](engine, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("engine"));

  }
  session = self->_session;
  if (session)
  {
    -[SYLogSessionState dictionaryRepresentation](session, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("session"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_sessionQueueRunning);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("sessionQueueRunning"));

  targetedDevice = self->_targetedDevice;
  if (targetedDevice)
  {
    -[SYLogDeviceState dictionaryRepresentation](targetedDevice, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("targetedDevice"));

  }
  enqueuedSyncType = self->_enqueuedSyncType;
  if (enqueuedSyncType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_enqueuedSyncType);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_24CC654B0[enqueuedSyncType];
  }
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("enqueuedSyncType"));

  if (-[NSMutableArray count](self->_transportOptions, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_transportOptions, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = self->_transportOptions;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v18);
    }

    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("transportOptions"));
  }
  peerID = self->_peerID;
  if (peerID)
    objc_msgSend(v4, "setObject:forKey:", peerID, CFSTR("peerID"));
  peerGenerationID = self->_peerGenerationID;
  if (peerGenerationID)
    objc_msgSend(v4, "setObject:forKey:", peerGenerationID, CFSTR("peerGenerationID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    serviceType = self->_serviceType;
    if (serviceType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_serviceType);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_24CC654C8[serviceType];
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("serviceType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogServiceStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;
  _BYTE *v10;

  v10 = a3;
  objc_msgSend(v10, "setName:", self->_name);
  if (self->_engine)
    objc_msgSend(v10, "setEngine:");
  if (self->_session)
    objc_msgSend(v10, "setSession:");
  v4 = v10;
  v10[80] = self->_sessionQueueRunning;
  if (self->_targetedDevice)
  {
    objc_msgSend(v10, "setTargetedDevice:");
    v4 = v10;
  }
  *((_DWORD *)v4 + 4) = self->_enqueuedSyncType;
  if (-[SYLogServiceState transportOptionsCount](self, "transportOptionsCount"))
  {
    objc_msgSend(v10, "clearTransportOptions");
    v5 = -[SYLogServiceState transportOptionsCount](self, "transportOptionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[SYLogServiceState transportOptionsAtIndex:](self, "transportOptionsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addTransportOptions:", v8);

      }
    }
  }
  if (self->_peerID)
    objc_msgSend(v10, "setPeerID:");
  v9 = v10;
  if (self->_peerGenerationID)
  {
    objc_msgSend(v10, "setPeerGenerationID:");
    v9 = v10;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v9 + 12) = self->_serviceType;
    v9[84] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[SYLogEngineState copyWithZone:](self->_engine, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[SYLogSessionState copyWithZone:](self->_session, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  *(_BYTE *)(v5 + 80) = self->_sessionQueueRunning;
  v12 = -[SYLogDeviceState copyWithZone:](self->_targetedDevice, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  *(_DWORD *)(v5 + 16) = self->_enqueuedSyncType;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = self->_transportOptions;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addTransportOptions:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v20;

  v22 = -[NSString copyWithZone:](self->_peerGenerationID, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v22;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_serviceType;
    *(_BYTE *)(v5 + 84) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  SYLogEngineState *engine;
  SYLogSessionState *session;
  SYLogDeviceState *targetedDevice;
  NSMutableArray *transportOptions;
  NSString *peerID;
  NSString *peerGenerationID;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_25;
  }
  engine = self->_engine;
  if ((unint64_t)engine | *((_QWORD *)v4 + 1))
  {
    if (!-[SYLogEngineState isEqual:](engine, "isEqual:"))
      goto LABEL_25;
  }
  session = self->_session;
  if ((unint64_t)session | *((_QWORD *)v4 + 7))
  {
    if (!-[SYLogSessionState isEqual:](session, "isEqual:"))
      goto LABEL_25;
  }
  if (self->_sessionQueueRunning)
  {
    if (!*((_BYTE *)v4 + 80))
      goto LABEL_25;
  }
  else if (*((_BYTE *)v4 + 80))
  {
LABEL_25:
    v12 = 0;
    goto LABEL_26;
  }
  targetedDevice = self->_targetedDevice;
  if ((unint64_t)targetedDevice | *((_QWORD *)v4 + 8)
    && !-[SYLogDeviceState isEqual:](targetedDevice, "isEqual:"))
  {
    goto LABEL_25;
  }
  if (self->_enqueuedSyncType != *((_DWORD *)v4 + 4))
    goto LABEL_25;
  transportOptions = self->_transportOptions;
  if ((unint64_t)transportOptions | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](transportOptions, "isEqual:"))
      goto LABEL_25;
  }
  peerID = self->_peerID;
  if ((unint64_t)peerID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](peerID, "isEqual:"))
      goto LABEL_25;
  }
  peerGenerationID = self->_peerGenerationID;
  if ((unint64_t)peerGenerationID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](peerGenerationID, "isEqual:"))
      goto LABEL_25;
  }
  v12 = (*((_BYTE *)v4 + 84) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 84) & 1) == 0 || self->_serviceType != *((_DWORD *)v4 + 12))
      goto LABEL_25;
    v12 = 1;
  }
LABEL_26:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  _BOOL4 sessionQueueRunning;
  unint64_t v7;
  uint64_t enqueuedSyncType;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[SYLogEngineState hash](self->_engine, "hash");
  v5 = -[SYLogSessionState hash](self->_session, "hash");
  sessionQueueRunning = self->_sessionQueueRunning;
  v7 = -[SYLogDeviceState hash](self->_targetedDevice, "hash");
  enqueuedSyncType = self->_enqueuedSyncType;
  v9 = -[NSMutableArray hash](self->_transportOptions, "hash");
  v10 = -[NSString hash](self->_peerID, "hash");
  v11 = -[NSString hash](self->_peerGenerationID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v12 = 2654435761 * self->_serviceType;
  else
    v12 = 0;
  return v4 ^ v3 ^ v5 ^ v7 ^ (2654435761 * sessionQueueRunning) ^ (2654435761 * enqueuedSyncType) ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  SYLogEngineState *engine;
  uint64_t v6;
  SYLogSessionState *session;
  uint64_t v8;
  SYLogDeviceState *targetedDevice;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[SYLogServiceState setName:](self, "setName:");
  engine = self->_engine;
  v6 = *((_QWORD *)v4 + 1);
  if (engine)
  {
    if (v6)
      -[SYLogEngineState mergeFrom:](engine, "mergeFrom:");
  }
  else if (v6)
  {
    -[SYLogServiceState setEngine:](self, "setEngine:");
  }
  session = self->_session;
  v8 = *((_QWORD *)v4 + 7);
  if (session)
  {
    if (v8)
      -[SYLogSessionState mergeFrom:](session, "mergeFrom:");
  }
  else if (v8)
  {
    -[SYLogServiceState setSession:](self, "setSession:");
  }
  self->_sessionQueueRunning = *((_BYTE *)v4 + 80);
  targetedDevice = self->_targetedDevice;
  v10 = *((_QWORD *)v4 + 8);
  if (targetedDevice)
  {
    if (v10)
      -[SYLogDeviceState mergeFrom:](targetedDevice, "mergeFrom:");
  }
  else if (v10)
  {
    -[SYLogServiceState setTargetedDevice:](self, "setTargetedDevice:");
  }
  self->_enqueuedSyncType = *((_DWORD *)v4 + 4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = *((id *)v4 + 9);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[SYLogServiceState addTransportOptions:](self, "addTransportOptions:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  if (*((_QWORD *)v4 + 5))
    -[SYLogServiceState setPeerID:](self, "setPeerID:");
  if (*((_QWORD *)v4 + 4))
    -[SYLogServiceState setPeerGenerationID:](self, "setPeerGenerationID:");
  if ((*((_BYTE *)v4 + 84) & 1) != 0)
  {
    self->_serviceType = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)name
{
  return self->_name;
}

- (SYLogEngineState)engine
{
  return self->_engine;
}

- (SYLogSessionState)session
{
  return self->_session;
}

- (BOOL)sessionQueueRunning
{
  return self->_sessionQueueRunning;
}

- (SYLogDeviceState)targetedDevice
{
  return self->_targetedDevice;
}

- (int)enqueuedSyncType
{
  return self->_enqueuedSyncType;
}

- (NSMutableArray)transportOptions
{
  return self->_transportOptions;
}

- (void)setTransportOptions:(id)a3
{
  objc_storeStrong((id *)&self->_transportOptions, a3);
}

- (NSString)peerID
{
  return self->_peerID;
}

- (NSString)peerGenerationID
{
  return self->_peerGenerationID;
}

- (NSDictionary)cocoaTransportOptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCED8]);
  -[SYLogServiceState transportOptions](self, "transportOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SYLogServiceState transportOptions](self, "transportOptions", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return (NSDictionary *)v5;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYLogServiceState writeTo:]", "SYLogServiceState.m", 298, "nil != self->_name");
}

@end
