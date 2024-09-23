@implementation HMDRemoteEventRouterProtoConnectMessage

- (void)setRouterVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_routerVersion = a3;
}

- (void)setHasRouterVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRouterVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasConnectEvent
{
  return self->_connectEvent != 0;
}

- (BOOL)hasUnregisterEvent
{
  return self->_unregisterEvent != 0;
}

- (void)clearTopicFilterAdditions
{
  -[NSMutableArray removeAllObjects](self->_topicFilterAdditions, "removeAllObjects");
}

- (void)addTopicFilterAdditions:(id)a3
{
  id v4;
  NSMutableArray *topicFilterAdditions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicFilterAdditions = self->_topicFilterAdditions;
  v8 = v4;
  if (!topicFilterAdditions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_topicFilterAdditions;
    self->_topicFilterAdditions = v6;

    v4 = v8;
    topicFilterAdditions = self->_topicFilterAdditions;
  }
  -[NSMutableArray addObject:](topicFilterAdditions, "addObject:", v4);

}

- (unint64_t)topicFilterAdditionsCount
{
  return -[NSMutableArray count](self->_topicFilterAdditions, "count");
}

- (id)topicFilterAdditionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicFilterAdditions, "objectAtIndex:", a3);
}

- (void)clearTopicAdditions
{
  -[NSMutableArray removeAllObjects](self->_topicAdditions, "removeAllObjects");
}

- (void)addTopicAdditions:(id)a3
{
  id v4;
  NSMutableArray *topicAdditions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  topicAdditions = self->_topicAdditions;
  v8 = v4;
  if (!topicAdditions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_topicAdditions;
    self->_topicAdditions = v6;

    v4 = v8;
    topicAdditions = self->_topicAdditions;
  }
  -[NSMutableArray addObject:](topicAdditions, "addObject:", v4);

}

- (unint64_t)topicAdditionsCount
{
  return -[NSMutableArray count](self->_topicAdditions, "count");
}

- (id)topicAdditionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_topicAdditions, "objectAtIndex:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteEventRouterProtoConnectMessage;
  -[HMDRemoteEventRouterProtoConnectMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoConnectMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  HMEProtoEventInfo *connectEvent;
  void *v6;
  HMEProtoEventInfo *unregisterEvent;
  void *v8;
  NSMutableArray *topicFilterAdditions;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_routerVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("routerVersion"));

  }
  connectEvent = self->_connectEvent;
  if (connectEvent)
  {
    -[HMEProtoEventInfo dictionaryRepresentation](connectEvent, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("connectEvent"));

  }
  unregisterEvent = self->_unregisterEvent;
  if (unregisterEvent)
  {
    -[HMEProtoEventInfo dictionaryRepresentation](unregisterEvent, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("unregisterEvent"));

  }
  topicFilterAdditions = self->_topicFilterAdditions;
  if (topicFilterAdditions)
    objc_msgSend(v3, "setObject:forKey:", topicFilterAdditions, CFSTR("topicFilterAdditions"));
  if (-[NSMutableArray count](self->_topicAdditions, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_topicAdditions, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_topicAdditions;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("topicAdditions"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMDRemoteEventRouterProtoConnectMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_connectEvent)
    PBDataWriterWriteSubmessage();
  if (self->_unregisterEvent)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_topicFilterAdditions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_topicAdditions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_routerVersion;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v13 = v4;
  if (self->_connectEvent)
    objc_msgSend(v4, "setConnectEvent:");
  if (self->_unregisterEvent)
    objc_msgSend(v13, "setUnregisterEvent:");
  if (-[HMDRemoteEventRouterProtoConnectMessage topicFilterAdditionsCount](self, "topicFilterAdditionsCount"))
  {
    objc_msgSend(v13, "clearTopicFilterAdditions");
    v5 = -[HMDRemoteEventRouterProtoConnectMessage topicFilterAdditionsCount](self, "topicFilterAdditionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HMDRemoteEventRouterProtoConnectMessage topicFilterAdditionsAtIndex:](self, "topicFilterAdditionsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addTopicFilterAdditions:", v8);

      }
    }
  }
  if (-[HMDRemoteEventRouterProtoConnectMessage topicAdditionsCount](self, "topicAdditionsCount"))
  {
    objc_msgSend(v13, "clearTopicAdditions");
    v9 = -[HMDRemoteEventRouterProtoConnectMessage topicAdditionsCount](self, "topicAdditionsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[HMDRemoteEventRouterProtoConnectMessage topicAdditionsAtIndex:](self, "topicAdditionsAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addTopicAdditions:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_routerVersion;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[HMEProtoEventInfo copyWithZone:](self->_connectEvent, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[HMEProtoEventInfo copyWithZone:](self->_unregisterEvent, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = self->_topicFilterAdditions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v15), "copyWithZone:", a3);
        objc_msgSend(v6, "addTopicFilterAdditions:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v13);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_topicAdditions;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend(v6, "addTopicAdditions:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v19);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HMEProtoEventInfo *connectEvent;
  HMEProtoEventInfo *unregisterEvent;
  NSMutableArray *topicFilterAdditions;
  NSMutableArray *topicAdditions;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_routerVersion != *((_DWORD *)v4 + 4))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  connectEvent = self->_connectEvent;
  if ((unint64_t)connectEvent | *((_QWORD *)v4 + 1)
    && !-[HMEProtoEventInfo isEqual:](connectEvent, "isEqual:"))
  {
    goto LABEL_15;
  }
  unregisterEvent = self->_unregisterEvent;
  if ((unint64_t)unregisterEvent | *((_QWORD *)v4 + 5))
  {
    if (!-[HMEProtoEventInfo isEqual:](unregisterEvent, "isEqual:"))
      goto LABEL_15;
  }
  topicFilterAdditions = self->_topicFilterAdditions;
  if ((unint64_t)topicFilterAdditions | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](topicFilterAdditions, "isEqual:"))
      goto LABEL_15;
  }
  topicAdditions = self->_topicAdditions;
  if ((unint64_t)topicAdditions | *((_QWORD *)v4 + 3))
    v9 = -[NSMutableArray isEqual:](topicAdditions, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_routerVersion;
  else
    v3 = 0;
  v4 = -[HMEProtoEventInfo hash](self->_connectEvent, "hash") ^ v3;
  v5 = -[HMEProtoEventInfo hash](self->_unregisterEvent, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_topicFilterAdditions, "hash");
  return v6 ^ -[NSMutableArray hash](self->_topicAdditions, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  HMEProtoEventInfo *connectEvent;
  uint64_t v7;
  HMEProtoEventInfo *unregisterEvent;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((v4[12] & 1) != 0)
  {
    self->_routerVersion = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  connectEvent = self->_connectEvent;
  v7 = *((_QWORD *)v5 + 1);
  if (connectEvent)
  {
    if (v7)
      -[HMEProtoEventInfo mergeFrom:](connectEvent, "mergeFrom:");
  }
  else if (v7)
  {
    -[HMDRemoteEventRouterProtoConnectMessage setConnectEvent:](self, "setConnectEvent:");
  }
  unregisterEvent = self->_unregisterEvent;
  v9 = *((_QWORD *)v5 + 5);
  if (unregisterEvent)
  {
    if (v9)
      -[HMEProtoEventInfo mergeFrom:](unregisterEvent, "mergeFrom:");
  }
  else if (v9)
  {
    -[HMDRemoteEventRouterProtoConnectMessage setUnregisterEvent:](self, "setUnregisterEvent:");
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = *((id *)v5 + 4);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[HMDRemoteEventRouterProtoConnectMessage addTopicFilterAdditions:](self, "addTopicFilterAdditions:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = *((id *)v5 + 3);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[HMDRemoteEventRouterProtoConnectMessage addTopicAdditions:](self, "addTopicAdditions:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (unsigned)routerVersion
{
  return self->_routerVersion;
}

- (HMEProtoEventInfo)connectEvent
{
  return self->_connectEvent;
}

- (void)setConnectEvent:(id)a3
{
  objc_storeStrong((id *)&self->_connectEvent, a3);
}

- (HMEProtoEventInfo)unregisterEvent
{
  return self->_unregisterEvent;
}

- (void)setUnregisterEvent:(id)a3
{
  objc_storeStrong((id *)&self->_unregisterEvent, a3);
}

- (NSMutableArray)topicFilterAdditions
{
  return self->_topicFilterAdditions;
}

- (void)setTopicFilterAdditions:(id)a3
{
  objc_storeStrong((id *)&self->_topicFilterAdditions, a3);
}

- (NSMutableArray)topicAdditions
{
  return self->_topicAdditions;
}

- (void)setTopicAdditions:(id)a3
{
  objc_storeStrong((id *)&self->_topicAdditions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unregisterEvent, 0);
  objc_storeStrong((id *)&self->_topicFilterAdditions, 0);
  objc_storeStrong((id *)&self->_topicAdditions, 0);
  objc_storeStrong((id *)&self->_connectEvent, 0);
}

+ (Class)topicFilterAdditionsType
{
  return (Class)objc_opt_class();
}

+ (Class)topicAdditionsType
{
  return (Class)objc_opt_class();
}

@end
