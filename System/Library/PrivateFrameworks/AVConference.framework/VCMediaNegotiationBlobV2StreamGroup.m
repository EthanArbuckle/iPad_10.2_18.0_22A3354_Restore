@implementation VCMediaNegotiationBlobV2StreamGroup

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobV2StreamGroup setPayloads:](self, "setPayloads:", 0);
  -[VCMediaNegotiationBlobV2StreamGroup setStreams:](self, "setStreams:", 0);
  -[VCMediaNegotiationBlobV2StreamGroup setSettingsU1:](self, "setSettingsU1:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroup;
  -[VCMediaNegotiationBlobV2StreamGroup dealloc](&v3, sel_dealloc);
}

- (void)setStreamGroup:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_streamGroup = a3;
}

- (void)setHasStreamGroup:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStreamGroup
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearPayloads
{
  -[NSMutableArray removeAllObjects](self->_payloads, "removeAllObjects");
}

- (void)addPayloads:(id)a3
{
  NSMutableArray *payloads;

  payloads = self->_payloads;
  if (!payloads)
  {
    payloads = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_payloads = payloads;
  }
  -[NSMutableArray addObject:](payloads, "addObject:", a3);
}

- (unint64_t)payloadsCount
{
  return -[NSMutableArray count](self->_payloads, "count");
}

- (id)payloadsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_payloads, "objectAtIndex:", a3);
}

+ (Class)payloadsType
{
  return (Class)objc_opt_class();
}

- (void)clearStreams
{
  -[NSMutableArray removeAllObjects](self->_streams, "removeAllObjects");
}

- (void)addStreams:(id)a3
{
  NSMutableArray *streams;

  streams = self->_streams;
  if (!streams)
  {
    streams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_streams = streams;
  }
  -[NSMutableArray addObject:](streams, "addObject:", a3);
}

- (unint64_t)streamsCount
{
  return -[NSMutableArray count](self->_streams, "count");
}

- (id)streamsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_streams, "objectAtIndex:", a3);
}

+ (Class)streamsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSettingsU1
{
  return self->_settingsU1 != 0;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroup;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2StreamGroup description](&v3, sel_description), -[VCMediaNegotiationBlobV2StreamGroup dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *payloads;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableArray *streams;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  VCMediaNegotiationBlobV2SettingsU1 *settingsU1;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_streamGroup), CFSTR("streamGroup"));
  if (-[NSMutableArray count](self->_payloads, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_payloads, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    payloads = self->_payloads;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(payloads);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("payloads"));

  }
  if (-[NSMutableArray count](self->_streams, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_streams, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    streams = self->_streams;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(streams);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("streams"));

  }
  settingsU1 = self->_settingsU1;
  if (settingsU1)
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobV2SettingsU1 dictionaryRepresentation](settingsU1, "dictionaryRepresentation"), CFSTR("settingsU1"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2StreamGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *payloads;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *streams;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  payloads = self->_payloads;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(payloads);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v6);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  streams = self->_streams;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(streams);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v11);
  }
  if (self->_settingsU1)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_streamGroup;
    *((_BYTE *)a3 + 40) |= 1u;
  }
  if (-[VCMediaNegotiationBlobV2StreamGroup payloadsCount](self, "payloadsCount"))
  {
    objc_msgSend(a3, "clearPayloads");
    v5 = -[VCMediaNegotiationBlobV2StreamGroup payloadsCount](self, "payloadsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addPayloads:", -[VCMediaNegotiationBlobV2StreamGroup payloadsAtIndex:](self, "payloadsAtIndex:", i));
    }
  }
  if (-[VCMediaNegotiationBlobV2StreamGroup streamsCount](self, "streamsCount"))
  {
    objc_msgSend(a3, "clearStreams");
    v8 = -[VCMediaNegotiationBlobV2StreamGroup streamsCount](self, "streamsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addStreams:", -[VCMediaNegotiationBlobV2StreamGroup streamsAtIndex:](self, "streamsAtIndex:", j));
    }
  }
  if (self->_settingsU1)
    objc_msgSend(a3, "setSettingsU1:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id *v6;
  NSMutableArray *payloads;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *streams;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (id *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_streamGroup;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  payloads = self->_payloads;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(payloads);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addPayloads:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v9);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  streams = self->_streams;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(streams);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addStreams:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    }
    while (v15);
  }

  v6[2] = -[VCMediaNegotiationBlobV2SettingsU1 copyWithZone:](self->_settingsU1, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *payloads;
  NSMutableArray *streams;
  VCMediaNegotiationBlobV2SettingsU1 *settingsU1;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 40) & 1) == 0 || self->_streamGroup != *((_DWORD *)a3 + 6))
        goto LABEL_13;
    }
    else if ((*((_BYTE *)a3 + 40) & 1) != 0)
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    payloads = self->_payloads;
    if (!((unint64_t)payloads | *((_QWORD *)a3 + 1))
      || (v5 = -[NSMutableArray isEqual:](payloads, "isEqual:")) != 0)
    {
      streams = self->_streams;
      if (!((unint64_t)streams | *((_QWORD *)a3 + 4))
        || (v5 = -[NSMutableArray isEqual:](streams, "isEqual:")) != 0)
      {
        settingsU1 = self->_settingsU1;
        if ((unint64_t)settingsU1 | *((_QWORD *)a3 + 2))
          LOBYTE(v5) = -[VCMediaNegotiationBlobV2SettingsU1 isEqual:](settingsU1, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_streamGroup;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_payloads, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_streams, "hash");
  return v4 ^ v5 ^ -[VCMediaNegotiationBlobV2SettingsU1 hash](self->_settingsU1, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  VCMediaNegotiationBlobV2SettingsU1 *settingsU1;
  uint64_t v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)a3 + 40) & 1) != 0)
  {
    self->_streamGroup = *((_DWORD *)a3 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        -[VCMediaNegotiationBlobV2StreamGroup addPayloads:](self, "addPayloads:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v7);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        -[VCMediaNegotiationBlobV2StreamGroup addStreams:](self, "addStreams:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v12);
  }
  settingsU1 = self->_settingsU1;
  v16 = *((_QWORD *)a3 + 2);
  if (settingsU1)
  {
    if (v16)
      -[VCMediaNegotiationBlobV2SettingsU1 mergeFrom:](settingsU1, "mergeFrom:");
  }
  else if (v16)
  {
    -[VCMediaNegotiationBlobV2StreamGroup setSettingsU1:](self, "setSettingsU1:");
  }
}

- (unsigned)streamGroup
{
  return self->_streamGroup;
}

- (NSMutableArray)payloads
{
  return self->_payloads;
}

- (void)setPayloads:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableArray)streams
{
  return self->_streams;
}

- (void)setStreams:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (VCMediaNegotiationBlobV2SettingsU1)settingsU1
{
  return self->_settingsU1;
}

- (void)setSettingsU1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (VCMediaNegotiationBlobV2StreamGroup)initWithStreamGroupConfig:(id)a3 defaultConfig:(id)a4
{
  VCMediaNegotiationBlobV2StreamGroup *v6;
  uint64_t v7;
  uint64_t v8;
  VCMediaNegotiationBlobV2SettingsU1 *v9;
  VCMediaNegotiationBlobV2SettingsU1 *v10;

  v6 = -[VCMediaNegotiationBlobV2StreamGroup init](self, "init");
  if (v6)
  {
    if (!+[VCMediaNegotiationBlobV2StreamGroup isValidStreamGroupIDFromConfig:defaultConfig:](VCMediaNegotiationBlobV2StreamGroup, "isValidStreamGroupIDFromConfig:defaultConfig:", a3, a4))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:defaultConfig:].cold.5();
      }
      goto LABEL_27;
    }
    v7 = +[VCMediaNegotiationBlobV2StreamGroup streamGroupFromStreamGroupID:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupFromStreamGroupID:", objc_msgSend(a3, "groupID"));
    if (!(_DWORD)v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:defaultConfig:].cold.1();
      }
      goto LABEL_27;
    }
    v8 = v7;
    if (-[VCMediaNegotiationBlobV2StreamGroup streamGroup](v6, "streamGroup") != (_DWORD)v7)
      -[VCMediaNegotiationBlobV2StreamGroup setStreamGroup:](v6, "setStreamGroup:", v8);
    if (objc_msgSend(a3, "u1Config"))
    {
      v9 = -[VCMediaNegotiationBlobV2SettingsU1 initWithU1Config:]([VCMediaNegotiationBlobV2SettingsU1 alloc], "initWithU1Config:", objc_msgSend(a3, "u1Config"));
      if (!v9)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:defaultConfig:].cold.4();
        }
        goto LABEL_27;
      }
      v10 = v9;
      -[VCMediaNegotiationBlobV2StreamGroup setSettingsU1:](v6, "setSettingsU1:", v9);

    }
    if (-[VCMediaNegotiationBlobV2StreamGroup setupPayloadsWithGroupConfig:](v6, "setupPayloadsWithGroupConfig:", a3))
    {
      if (-[VCMediaNegotiationBlobV2StreamGroup setupStreamsWithGroupConfig:](v6, "setupStreamsWithGroupConfig:", a3))
        return v6;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:defaultConfig:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:defaultConfig:].cold.3();
    }
LABEL_27:

    return 0;
  }
  return v6;
}

- (VCMediaNegotiationBlobV2StreamGroup)initWithStreamGroupConfig:(id)a3
{
  id v5;

  v5 = +[VCMediaNegotiationBlobV2StreamGroup defaultsForStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "defaultsForStreamGroup:", +[VCMediaNegotiationBlobV2StreamGroup streamGroupFromStreamGroupID:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupFromStreamGroupID:", objc_msgSend(a3, "groupID")));
  if (v5)
    return -[VCMediaNegotiationBlobV2StreamGroup initWithStreamGroupConfig:defaultConfig:](self, "initWithStreamGroupConfig:defaultConfig:", a3, v5);

  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) initWithStreamGroupConfig:].cold.1();
  }
  return 0;
}

- (int)getStreamGroupConfig:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned int v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v14 = -2142961633;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) getStreamGroupConfig:].cold.1();
    }
    goto LABEL_22;
  }
  v5 = +[VCMediaNegotiationBlobV2StreamGroup defaultsForStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "defaultsForStreamGroup:", -[VCMediaNegotiationBlobV2StreamGroup streamGroup](self, "streamGroup"));
  if (!v5)
  {
    v14 = -2142961648;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) getStreamGroupConfig:].cold.2();
    }
LABEL_22:
    v7 = 0;
LABEL_23:

    return v14;
  }
  v6 = v5;
  v16 = +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupIDFromStreamGroup:", -[VCMediaNegotiationBlobV2StreamGroup streamGroup](self, "streamGroup"));
  v7 = v6;
  objc_msgSend(v7, "setMediaType:", objc_msgSend(v6, "mediaType"));
  objc_msgSend(v7, "setMediaSubtype:", objc_msgSend(v6, "mediaSubtype"));
  objc_msgSend(v7, "setSyncGroupID:", objc_msgSend(v6, "syncGroupID"));
  objc_msgSend(v7, "setU1Config:", -[VCMediaNegotiationBlobV2SettingsU1 u1Config](-[VCMediaNegotiationBlobV2StreamGroup settingsU1](self, "settingsU1"), "u1Config"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = -[VCMediaNegotiationBlobV2StreamGroup streams](self, "streams");
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v8);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "usesPayloadConfigsWithGroupID:", +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupIDFromStreamGroup:", self->_streamGroup)) & 1) != 0)break;
      if (v10 == ++v12)
      {
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        if (v10)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v13 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (-[VCMediaNegotiationBlobV2StreamGroup updatePayloadConfigsWithStreamGroupConfig:rtpSampleRates:](self, "updatePayloadConfigsWithStreamGroupConfig:rtpSampleRates:", v7, v13))
    {
      goto LABEL_13;
    }
    v14 = -2142961633;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) getStreamGroupConfig:].cold.4();
    }
    goto LABEL_23;
  }
LABEL_11:
  v13 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
LABEL_13:
  if (!-[VCMediaNegotiationBlobV2StreamGroup appendStreamsToStreamGroupConfig:streamGroupID:rtpSampleRates:](self, "appendStreamsToStreamGroupConfig:streamGroupID:rtpSampleRates:", v7, v16, v13))
  {
    v14 = -2142961633;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) getStreamGroupConfig:].cold.3();
    }
    goto LABEL_23;
  }
  +[VCMediaNegotiationBlobV2StreamGroup updateParentStreamIDForGroupConfig:](VCMediaNegotiationBlobV2StreamGroup, "updateParentStreamIDForGroupConfig:", v7);
  v14 = 0;
  *a3 = v7;
  return v14;
}

- (unsigned)codecIndexForType:(int64_t)a3 inPayloadConfigurations:(id)a4
{
  uint64_t v6;
  unsigned __int8 v7;

  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) codecIndexForType:inPayloadConfigurations:].cold.1();
    }
    return -1;
  }
  if (!objc_msgSend(a4, "count"))
    return -1;
  v6 = 0;
  v7 = 0;
  while (objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v6), "codecType") != a3)
  {
    v6 = ++v7;
    if (objc_msgSend(a4, "count") <= (unint64_t)v7)
      return -1;
  }
  return v7;
}

- (void)appendV2PayloadsToStreamConfig:(id)a3 streamGroupConfig:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a4)
  {
    if (a3)
    {
      if (objc_msgSend(a4, "groupID") == 1835623282)
      {
        v7 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultPayloadConfigurationsForStreamGroupID:", 1835623282);
        v8 = -[VCMediaNegotiationBlobV2StreamGroup codecIndexForType:inPayloadConfigurations:](self, "codecIndexForType:inPayloadConfigurations:", 20, v7);
        if ((_DWORD)v8 == 255)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v12 = VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaNegotiationBlobV2StreamGroup(Utils) appendV2PayloadsToStreamConfig:streamGroupConfig:].cold.3(v12);
          }
        }
        else
        {
          v9 = v8;
          if (objc_msgSend(v7, "count") > (unint64_t)v8)
          {
            v10 = objc_msgSend(v7, "objectAtIndex:", v9);
            if (v10)
            {
              v11 = v10;
              objc_msgSend(a3, "addCodec:", v9);
              objc_msgSend(a4, "addCodecConfig:", v11);
            }
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2StreamGroup(Utils) appendV2PayloadsToStreamConfig:streamGroupConfig:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) appendV2PayloadsToStreamConfig:streamGroupConfig:].cold.1();
  }
}

- (BOOL)appendStreamsToStreamGroupConfig:(id)a3 streamGroupID:(unsigned int)a4 rtpSampleRates:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int v20;
  char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  NSObject *v29;
  int v30;
  char *v31;
  uint64_t v32;
  NSMutableArray *obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v44;
  id v45;
  _BYTE v46[128];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  _BYTE v60[14];
  _BYTE v61[128];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = -[VCMediaNegotiationBlobV2StreamGroup streams](self, "streams");
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
  if (v37)
  {
    v6 = 0;
    v36 = *(_QWORD *)v68;
    v41 = a3;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v68 != v36)
          objc_enumerationMutation(obj);
        v42 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v7);
        v8 = (void *)objc_msgSend(v42, "streamConfigWithPayloadConfigs:payloadConfigSampleRates:streamGroupID:", objc_msgSend(a3, "codecConfigs"), a5, a4);
        if (!v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v28 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v30 = objc_msgSend(v42, "streamIndex");
              v31 = FourccToCStr(a4);
              *(_DWORD *)buf = 136316162;
              v52 = v28;
              v53 = 2080;
              v54 = "-[VCMediaNegotiationBlobV2StreamGroup(Utils) appendStreamsToStreamGroupConfig:streamGroupID:rtpSampleRates:]";
              v55 = 1024;
              v56 = 183;
              v57 = 1024;
              v58 = v30;
              v59 = 2080;
              *(_QWORD *)v60 = v31;
              _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to process the stream config (streamIndex=%d) for streamGroupID=%s. Skipping remaining streams", buf, 0x2Cu);
            }
          }
          goto LABEL_39;
        }
        v9 = v8;
        v39 = v7;
        v40 = v6;
        if (objc_msgSend(v8, "v2StreamID"))
          -[VCMediaNegotiationBlobV2StreamGroup appendV2PayloadsToStreamConfig:streamGroupConfig:](self, "appendV2PayloadsToStreamConfig:streamGroupConfig:", v9, a3);
        v44 = objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v45 = (id)objc_msgSend(v9, "codecs");
        v11 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v61, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v63 != v13)
                objc_enumerationMutation(v45);
              v15 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
              v16 = (void *)objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "objectAtIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
              if (objc_msgSend(v16, "cipherSuite") < 4)
              {
                v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v16, "cipherSuite"));
                v22 = (void *)v44;
              }
              else
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
                {
                  v17 = VRTraceErrorLogLevelToCSTR();
                  v18 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    v19 = objc_msgSend(v16, "cipherSuite");
                    v20 = objc_msgSend(v42, "streamIndex");
                    v21 = FourccToCStr(a4);
                    *(_DWORD *)buf = 136316418;
                    v52 = v17;
                    v53 = 2080;
                    v54 = "-[VCMediaNegotiationBlobV2StreamGroup(Utils) appendStreamsToStreamGroupConfig:streamGroupID:rtpSampleRates:]";
                    v55 = 1024;
                    v56 = 194;
                    v57 = 1024;
                    v58 = v19;
                    v59 = 1024;
                    *(_DWORD *)v60 = v20;
                    a3 = v41;
                    *(_WORD *)&v60[4] = 2080;
                    *(_QWORD *)&v60[6] = v21;
                    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown cipherSuite=%d (streamIndex=%d) for streamGroupID=%s. Skipping remaining streams", buf, 0x32u);
                  }
                }
                v22 = v10;
                v23 = (uint64_t)v15;
              }
              objc_msgSend(v22, "addObject:", v23);
            }
            v12 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v61, 16);
          }
          while (v12);
        }
        v6 = v40;
        if (v40)
          objc_msgSend(v40, "intersectSet:", v44);
        else
          v6 = (void *)v44;
        if (!objc_msgSend(v6, "count"))
          goto LABEL_39;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v48 != v26)
                objc_enumerationMutation(v10);
              objc_msgSend(v9, "removeCodec:", objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * j), "unsignedIntValue"));
            }
            v25 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
          }
          while (v25);
        }
        a3 = v41;
        objc_msgSend(v41, "addStreamConfig:", v9);
        v7 = v39 + 1;
      }
      while (v39 + 1 != v37);
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
      if (v37)
        continue;
      break;
    }
  }
LABEL_39:
  v32 = objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count");
  if (!v32 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) appendStreamsToStreamGroupConfig:streamGroupID:rtpSampleRates:].cold.1();
  }
  return v32 != 0;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  char *v9;
  char *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  id v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v6 = -[VCMediaNegotiationBlobV2StreamGroup getStreamGroupConfig:](self, "getStreamGroupConfig:", &v31);
  v7 = a4;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%lu] %@Stream Group: "), objc_msgSend((id)-[VCMediaNegotiationBlobV2StreamGroup data](self, "data"), "length"), a4);
  if (v31)
  {
    v9 = FourccToCStr(objc_msgSend(v31, "groupID"));
    v10 = FourccToCStr(objc_msgSend(v31, "mediaType"));
    objc_msgSend(v8, "appendFormat:", CFSTR("groupID='%s' mediaType='%s' subtype='%s'"), v9, v10, FourccToCStr(objc_msgSend(v31, "mediaSubtype")));
    if (objc_msgSend(v31, "syncGroupID"))
      objc_msgSend(v8, "appendFormat:", CFSTR(" syncGroupID='%s'"), FourccToCStr(objc_msgSend(v31, "syncGroupID")));
    objc_msgSend(v8, "appendFormat:", CFSTR(" encodeDecodeFeatures=%@"), objc_msgSend((id)objc_msgSend(v31, "u1Config"), "videoFeatureStringsFixedPosition"));
  }
  else
  {
    objc_msgSend(v8, "appendFormat:", CFSTR("Skipping (result=%x)"), v6);
  }
  v11 = objc_msgSend(v8, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v12, v13, v14, v15, v16, v17, v11);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v43 = v18;
      v44 = 2080;
      v45 = "-[VCMediaNegotiationBlobV2StreamGroup(Utils) printWithLogFile:prefix:]";
      v46 = 1024;
      v47 = 236;
      v48 = 2112;
      v49 = v8;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
  if (v31)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v20 = (void *)objc_msgSend(v31, "streamConfigs");
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v39 != v23)
            objc_enumerationMutation(v20);
          +[VCMediaNegotiationBlobV2StreamGroupStream printWithLogFile:prefix:streamConfig:](VCMediaNegotiationBlobV2StreamGroupStream, "printWithLogFile:prefix:streamConfig:", a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  "), v7), *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
      }
      while (v22);
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = (void *)objc_msgSend(v31, "codecConfigs");
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v25);
          +[VCMediaNegotiationBlobV2StreamGroupPayload printWithLogFile:prefix:payloadConfig:](VCMediaNegotiationBlobV2StreamGroupPayload, "printWithLogFile:prefix:payloadConfig:", a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  "), v7), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
      }
      while (v27);
    }
  }
}

+ (id)defaultsForStreamGroup:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  switch(a3)
  {
    case 0u:
      return 0;
    case 1u:
      v3 = 875704438;
      v4 = 1667329381;
      v5 = 1986618469;
      goto LABEL_19;
    case 2u:
      v4 = 1835623282;
      goto LABEL_16;
    case 3u:
      v4 = 1935897189;
      v5 = 1986618469;
      v3 = 875704422;
      v6 = 1937339233;
      goto LABEL_20;
    case 4u:
      v4 = 1937339233;
      v5 = 1936684398;
      v3 = 1819304813;
      goto LABEL_19;
    case 5u:
      v3 = 875704438;
      v4 = 1667329399;
      v6 = 1835623287;
      v5 = 1986618469;
      goto LABEL_8;
    case 6u:
      v4 = 1835623287;
      v5 = 1936684398;
      v3 = 1819304813;
      v6 = 0;
LABEL_8:
      v7 = 1;
      return +[VCMediaNegotiatorStreamGroupConfiguration streamGroupConfigWithGroupID:mediaType:subtype:syncGroupID:cipherSuite:](VCMediaNegotiatorStreamGroupConfiguration, "streamGroupConfigWithGroupID:mediaType:subtype:syncGroupID:cipherSuite:", v4, v5, v3, v6, v7);
    case 7u:
      v4 = 1667330164;
      v5 = 1835365473;
      v3 = 1667330164;
      goto LABEL_19;
    case 0xBu:
      v4 = 1936290409;
LABEL_16:
      v5 = 1936684398;
      v3 = 1819304813;
      v6 = 0;
      goto LABEL_20;
    case 0xCu:
      if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8)
        return 0;
      v4 = 1718909044;
      v5 = 1986618469;
      v3 = 875704422;
      goto LABEL_19;
    case 0xDu:
      if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8)
        return 0;
      v4 = 1717854580;
      v5 = 1835365473;
      v3 = 1835887209;
      goto LABEL_19;
    case 0xEu:
      if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8)
        return 0;
      v4 = 1650745716;
      v5 = 1835365473;
      v3 = 1717657974;
LABEL_19:
      v6 = 1835623282;
LABEL_20:
      v7 = 3;
      return +[VCMediaNegotiatorStreamGroupConfiguration streamGroupConfigWithGroupID:mediaType:subtype:syncGroupID:cipherSuite:](VCMediaNegotiatorStreamGroupConfiguration, "streamGroupConfigWithGroupID:mediaType:subtype:syncGroupID:cipherSuite:", v4, v5, v3, v6, v7);
    default:
      return +[VCMediaNegotiationBlobV2StreamGroup defaultsForStreamGroupCustom:](VCMediaNegotiationBlobV2StreamGroup, "defaultsForStreamGroupCustom:");
  }
}

+ (id)defaultsForStreamGroupCustom:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  switch(a3)
  {
    case 0x64617431u:
      v3 = 1751474550;
      v4 = 1684108337;
      goto LABEL_6;
    case 0x64617432u:
      v4 = 1684108338;
      v3 = 1717657974;
LABEL_6:
      v6 = 1835365473;
      break;
    case 0x64617433u:
      v4 = 1684108339;
      v6 = 1835365473;
      v3 = 1751212406;
      break;
    case 0x64617434u:
      v4 = 1684108340;
      v6 = 1835365473;
      v3 = 1651466614;
      break;
    case 0x64617435u:
      v4 = 1684108341;
      v6 = 1835365473;
      v3 = 1701142902;
      break;
    default:
      switch(a3)
      {
        case 0x76696431u:
          v4 = 1986618417;
          goto LABEL_17;
        case 0x76696432u:
          v4 = 1986618418;
          goto LABEL_17;
        case 0x76696433u:
          v4 = 1986618419;
          goto LABEL_17;
        case 0x76696434u:
          v4 = 1986618420;
LABEL_17:
          v6 = 1986618469;
          v3 = 875704422;
          return +[VCMediaNegotiatorStreamGroupConfiguration streamGroupConfigWithGroupID:mediaType:subtype:syncGroupID:cipherSuite:](VCMediaNegotiatorStreamGroupConfiguration, "streamGroupConfigWithGroupID:mediaType:subtype:syncGroupID:cipherSuite:", v4, v6, v3, 1835623282, 3);
        default:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v7 = VRTraceErrorLogLevelToCSTR();
            v8 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              +[VCMediaNegotiationBlobV2StreamGroup(Utils) defaultsForStreamGroupCustom:].cold.1(v7, a3, v8);
          }
          return 0;
      }
  }
  return +[VCMediaNegotiatorStreamGroupConfiguration streamGroupConfigWithGroupID:mediaType:subtype:syncGroupID:cipherSuite:](VCMediaNegotiatorStreamGroupConfiguration, "streamGroupConfigWithGroupID:mediaType:subtype:syncGroupID:cipherSuite:", v4, v6, v3, 1835623282, 3);
}

- (BOOL)isDefaultPayloadConfigsWithStreamGroupConfig:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_msgSend(a3, "streamConfigs");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      v9 = +[VCMediaNegotiationBlobV2StreamGroupStream isDefaultPayloadConfigsWithStreamConfig:payloadConfigs:streamGroupID:](VCMediaNegotiationBlobV2StreamGroupStream, "isDefaultPayloadConfigsWithStreamConfig:payloadConfigs:streamGroupID:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), objc_msgSend(a3, "codecConfigs"), objc_msgSend(a3, "groupID"));
      if (!v9)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (id)customPayloadConfigStateWithStreamGroupConfig:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "count"));
  if (objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "count"))
  {
    v5 = 1;
    v6 = MEMORY[0x1E0C9AAA0];
    do
      objc_msgSend(v4, "addObject:", v6);
    while (objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "count") > (unint64_t)v5++);
  }
  return v4;
}

- (BOOL)setupStreamsWithGroupConfig:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  VCMediaNegotiationBlobV2StreamGroupStream *v10;
  VCMediaNegotiationBlobV2StreamGroupStream *v11;
  _BOOL4 v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_msgSend(a3, "streamConfigs");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v5);
      v10 = -[VCMediaNegotiationBlobV2StreamGroupStream initWithStreamConfig:payloadConfigs:streamGroupID:]([VCMediaNegotiationBlobV2StreamGroupStream alloc], "initWithStreamConfig:payloadConfigs:streamGroupID:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9), objc_msgSend(a3, "codecConfigs"), objc_msgSend(a3, "groupID"));
      if (!v10)
        break;
      v11 = v10;
      -[VCMediaNegotiationBlobV2StreamGroup addStreams:](self, "addStreams:", v10);

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v12)
        return v12;
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) setupStreamsWithGroupConfig:].cold.1();
    }
    LOBYTE(v12) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (BOOL)isUsedPayloadConfigAtIndex:(id)a3 streamGroupConfig:(id)a4 rtpTimestampRate:(unsigned int *)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_msgSend(a4, "streamConfigs");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if (objc_msgSend((id)objc_msgSend(v12, "codecs"), "containsObject:", a3))
        {
          *a5 = objc_msgSend(v12, "rtpTimestampRate");
          LOBYTE(v8) = 1;
          return v8;
        }
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      v9 = v8;
      if (v8)
        continue;
      break;
    }
  }
  return v8;
}

- (BOOL)setupPayloadsWithGroupConfig:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  VCMediaNegotiationBlobV2StreamGroupPayload *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  id obj;
  unsigned int v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_msgSend(a3, "codecConfigs");
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v21;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(obj);
      v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9);
      if (!-[VCMediaNegotiationBlobV2StreamGroup isUsedPayloadConfigAtIndex:streamGroupConfig:rtpTimestampRate:](self, "isUsedPayloadConfigAtIndex:streamGroupConfig:rtpTimestampRate:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7 + v9), a3, &v18))break;
      v11 = [VCMediaNegotiationBlobV2StreamGroupPayload alloc];
      v12 = -[VCMediaNegotiationBlobV2StreamGroupPayload initWithPayloadConfig:index:rtpSampleRate:streamGroupID:](v11, "initWithPayloadConfig:index:rtpSampleRate:streamGroupID:", v10, v7 + v9, v18, objc_msgSend(a3, "groupID"));
      if (!v12)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v14)
            return v14;
          -[VCMediaNegotiationBlobV2StreamGroup(Utils) setupPayloadsWithGroupConfig:].cold.1();
        }
        goto LABEL_18;
      }
      v13 = (void *)v12;
      -[VCMediaNegotiationBlobV2StreamGroup addPayloads:](self, "addPayloads:", v12);

      if (v6 == ++v9)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
        v7 = (v7 + v9);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) setupPayloadsWithGroupConfig:].cold.2(v15);
    }
LABEL_18:
    LOBYTE(v14) = 0;
    return v14;
  }
LABEL_10:
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)updatePayloadConfigsWithStreamGroupConfig:(id)a3 rtpSampleRates:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  _BOOL4 v25;
  id v27;
  unsigned int v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupIDFromStreamGroup:", self->_streamGroup);
  v8 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultRTPSampleRateForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultRTPSampleRateForStreamGroupID:", v7);
  v9 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultPayloadConfigurationsForStreamGroupID:", v7);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = -[VCMediaNegotiationBlobV2StreamGroup payloads](self, "payloads");
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  if (v11)
  {
    v12 = v11;
    v27 = v9;
    v28 = v8;
    v13 = 0;
    v14 = *(_QWORD *)v31;
LABEL_3:
    v15 = 0;
    v16 = v13;
    while (1)
    {
      if (*(_QWORD *)v31 != v14)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
      v18 = objc_msgSend(v17, "payloadConfigurationWithStreamGroupID:index:", v7, v16 + v15, v27);
      if (!v18)
        break;
      v19 = v18;
      v20 = objc_msgSend(v17, "rtpSampleRateWithStreamGroupID:", v7);
      objc_msgSend(a4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20));
      objc_msgSend(a3, "addCodecConfig:", v19);
      if (v12 == ++v15)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
        v13 = (v16 + v15);
        if (v12)
          goto LABEL_3;
        v21 = v16 + v15;
        v8 = v28;
        v9 = v27;
        goto LABEL_11;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v25)
        return v25;
      -[VCMediaNegotiationBlobV2StreamGroup(Utils) updatePayloadConfigsWithStreamGroupConfig:rtpSampleRates:].cold.1();
    }
    LOBYTE(v25) = 0;
  }
  else
  {
    v21 = 0;
LABEL_11:
    if (objc_msgSend(v9, "count") > (unint64_t)v21)
    {
      v22 = v21;
      v23 = v21 + 1;
      do
      {
        if (objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v22), "codecType") != 102
          || +[VCHardwareSettings supportsHEVCEncoding](VCHardwareSettings, "supportsHEVCEncoding"))
        {
          objc_msgSend(a4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
          objc_msgSend(a3, "addCodecConfig:", objc_msgSend(v9, "objectAtIndex:", v22));
        }
        v22 = v23;
      }
      while (objc_msgSend(v9, "count") > (unint64_t)v23++);
    }
    LOBYTE(v25) = 1;
  }
  return v25;
}

- (void)updateDefaultPayloadConfigsWithConfig:(id)a3 rtpSampleRates:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultPayloadConfigurationsForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultPayloadConfigurationsForStreamGroupID:", +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupIDFromStreamGroup:", self->_streamGroup));
  v8 = +[VCMediaNegotiationBlobV2StreamGroupPayload defaultRTPSampleRateForStreamGroupID:](VCMediaNegotiationBlobV2StreamGroupPayload, "defaultRTPSampleRateForStreamGroupID:", +[VCMediaNegotiationBlobV2StreamGroup streamGroupIDFromStreamGroup:](VCMediaNegotiationBlobV2StreamGroup, "streamGroupIDFromStreamGroup:", self->_streamGroup));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(a3, "addCodecConfig:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        objc_msgSend(a4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v10);
  }
}

+ (void)updateParentStreamIDForGroupConfig:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int16 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_msgSend(a3, "streamConfigs");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isTemporalStream"))
        {
          if (v6)
            objc_msgSend(v9, "setParentStreamID:", v6);
          v6 = objc_msgSend(v9, "streamID");
        }
        else
        {
          v6 = 0;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v5);
  }
}

+ (id)negotiationCipherSuiteAsString:(unsigned int)a3
{
  if (a3 >= 4)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%d)"), *(_QWORD *)&a3);
  else
    return off_1E9E56D90[a3];
}

+ (BOOL)isValidStreamGroupIDFromConfig:(id)a3 defaultConfig:(id)a4
{
  int v6;
  int v7;
  int v8;

  if (!a4)
    return 0;
  v6 = objc_msgSend(a3, "mediaType");
  if (v6 != objc_msgSend(a4, "mediaType"))
    return 0;
  v7 = objc_msgSend(a3, "mediaSubtype");
  if (v7 != objc_msgSend(a4, "mediaSubtype"))
    return 0;
  v8 = objc_msgSend(a3, "syncGroupID");
  return v8 == objc_msgSend(a4, "syncGroupID");
}

+ (unsigned)streamGroupFromStreamGroupID:(unsigned int)a3
{
  unsigned int result;

  result = a3;
  if ((int)a3 <= 1718909043)
  {
    if ((int)a3 <= 1667330163)
    {
      switch(a3)
      {
        case 0x62646174u:
          return 14;
        case 0x63616D65u:
          return 1;
        case 0x63616D77u:
          return 5;
      }
    }
    else
    {
      if (a3 - 1684108337 < 5)
        return result;
      if (a3 == 1667330164)
        return 7;
      if (a3 == 1717854580)
        return 13;
    }
    return 0;
  }
  if ((int)a3 <= 1936290408)
  {
    if ((int)a3 > 1835623286)
    {
      if (a3 == 1835623287)
        return 6;
      if (a3 == 1935897189)
        return 3;
    }
    else
    {
      if (a3 == 1718909044)
        return 12;
      if (a3 == 1835623282)
        return 2;
    }
    return 0;
  }
  if (a3 - 1986618417 >= 4)
  {
    if (a3 == 1936290409)
      return 11;
    if (a3 == 1937339233)
      return 4;
    return 0;
  }
  return result;
}

+ (unsigned)streamGroupIDFromStreamGroup:(unsigned int)a3
{
  unsigned int result;

  result = 1667329381;
  switch(a3)
  {
    case 1u:
      return result;
    case 2u:
      result = 1835623282;
      break;
    case 3u:
      result = 1935897189;
      break;
    case 4u:
      result = 1937339233;
      break;
    case 5u:
      result = 1667329399;
      break;
    case 6u:
      result = 1835623287;
      break;
    case 7u:
      result = 1667330164;
      break;
    case 8u:
    case 9u:
    case 0xAu:
LABEL_6:
      result = 0;
      break;
    case 0xBu:
      result = 1936290409;
      break;
    case 0xCu:
      result = 1718909044;
      break;
    case 0xDu:
      result = 1717854580;
      break;
    case 0xEu:
      result = 1650745716;
      break;
    default:
      result = a3;
      switch(a3)
      {
        case 0x64617431u:
        case 0x64617432u:
        case 0x64617433u:
        case 0x64617434u:
        case 0x64617435u:
          return result;
        default:
          switch(a3)
          {
            case 0x76696431u:
            case 0x76696432u:
            case 0x76696433u:
            case 0x76696434u:
              return result;
            default:
              goto LABEL_6;
          }
      }
  }
  return result;
}

@end
