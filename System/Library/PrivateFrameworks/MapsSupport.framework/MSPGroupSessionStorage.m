@implementation MSPGroupSessionStorage

+ (id)groupStorageWithIdentifier:(id)a3 originator:(id)a4 receivingHandle:(id)a5 receivingAccountIdentifier:(id)a6
{
  MSPGroupSessionStorage *v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v6 = 0;
  if (a3 && a4)
  {
    v10 = a6;
    v11 = a5;
    v12 = a4;
    v13 = a3;
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(":"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MSPGroupSessionStorage);
    -[MSPGroupSessionStorage setOriginatorIdentifier:](v6, "setOriginatorIdentifier:", v15);
    -[MSPGroupSessionStorage setFromID:](v6, "setFromID:", v12);

    -[MSPGroupSessionStorage setReceivingHandle:](v6, "setReceivingHandle:", v11);
    -[MSPGroupSessionStorage setReceivingAccountIdentifier:](v6, "setReceivingAccountIdentifier:", v10);

    -[MSPGroupSessionStorage setGroupIdentifier:](v6, "setGroupIdentifier:", v13);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[MSPGroupSessionStorage setLastUpdateTimestamp:](v6, "setLastUpdateTimestamp:");
    v16 = objc_alloc_init(MEMORY[0x1E0D27540]);
    -[MSPGroupSessionStorage setState:](v6, "setState:", v16);

  }
  return v6;
}

- (void)updateWithState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[MSPGroupSessionStorage hasState](self, "hasState"))
  {
    -[MSPGroupSessionStorage state](self, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "merge:", v5);

  }
  else
  {
    -[MSPGroupSessionStorage setState:](self, "setState:", v5);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[MSPGroupSessionStorage setLastUpdateTimestamp:](self, "setLastUpdateTimestamp:");

}

- (BOOL)hasGroupIdentifier
{
  return self->_groupIdentifier != 0;
}

- (BOOL)hasOriginatorIdentifier
{
  return self->_originatorIdentifier != 0;
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (void)setLastUpdateTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lastUpdateTimestamp = a3;
}

- (void)setHasLastUpdateTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastUpdateTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasFromID
{
  return self->_fromID != 0;
}

- (void)clearMinimalStrategyIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_minimalStrategyIdentifiers, "removeAllObjects");
}

- (void)addMinimalStrategyIdentifier:(id)a3
{
  id v4;
  NSMutableArray *minimalStrategyIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  minimalStrategyIdentifiers = self->_minimalStrategyIdentifiers;
  v8 = v4;
  if (!minimalStrategyIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_minimalStrategyIdentifiers;
    self->_minimalStrategyIdentifiers = v6;

    v4 = v8;
    minimalStrategyIdentifiers = self->_minimalStrategyIdentifiers;
  }
  -[NSMutableArray addObject:](minimalStrategyIdentifiers, "addObject:", v4);

}

- (unint64_t)minimalStrategyIdentifiersCount
{
  return -[NSMutableArray count](self->_minimalStrategyIdentifiers, "count");
}

- (id)minimalStrategyIdentifierAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_minimalStrategyIdentifiers, "objectAtIndex:", a3);
}

+ (Class)minimalStrategyIdentifierType
{
  return (Class)objc_opt_class();
}

- (void)clearLiveStrategyIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_liveStrategyIdentifiers, "removeAllObjects");
}

- (void)addLiveStrategyIdentifier:(id)a3
{
  id v4;
  NSMutableArray *liveStrategyIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  liveStrategyIdentifiers = self->_liveStrategyIdentifiers;
  v8 = v4;
  if (!liveStrategyIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_liveStrategyIdentifiers;
    self->_liveStrategyIdentifiers = v6;

    v4 = v8;
    liveStrategyIdentifiers = self->_liveStrategyIdentifiers;
  }
  -[NSMutableArray addObject:](liveStrategyIdentifiers, "addObject:", v4);

}

- (unint64_t)liveStrategyIdentifiersCount
{
  return -[NSMutableArray count](self->_liveStrategyIdentifiers, "count");
}

- (id)liveStrategyIdentifierAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_liveStrategyIdentifiers, "objectAtIndex:", a3);
}

+ (Class)liveStrategyIdentifierType
{
  return (Class)objc_opt_class();
}

- (void)clearMessageStrategyIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_messageStrategyIdentifiers, "removeAllObjects");
}

- (void)addMessageStrategyIdentifier:(id)a3
{
  id v4;
  NSMutableArray *messageStrategyIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  messageStrategyIdentifiers = self->_messageStrategyIdentifiers;
  v8 = v4;
  if (!messageStrategyIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_messageStrategyIdentifiers;
    self->_messageStrategyIdentifiers = v6;

    v4 = v8;
    messageStrategyIdentifiers = self->_messageStrategyIdentifiers;
  }
  -[NSMutableArray addObject:](messageStrategyIdentifiers, "addObject:", v4);

}

- (unint64_t)messageStrategyIdentifiersCount
{
  return -[NSMutableArray count](self->_messageStrategyIdentifiers, "count");
}

- (id)messageStrategyIdentifierAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_messageStrategyIdentifiers, "objectAtIndex:", a3);
}

+ (Class)messageStrategyIdentifierType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasReceivingHandle
{
  return self->_receivingHandle != 0;
}

- (BOOL)hasReceivingAccountIdentifier
{
  return self->_receivingAccountIdentifier != 0;
}

- (void)clearSmsStrategyIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_smsStrategyIdentifiers, "removeAllObjects");
}

- (void)addSmsStrategyIdentifier:(id)a3
{
  id v4;
  NSMutableArray *smsStrategyIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  smsStrategyIdentifiers = self->_smsStrategyIdentifiers;
  v8 = v4;
  if (!smsStrategyIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_smsStrategyIdentifiers;
    self->_smsStrategyIdentifiers = v6;

    v4 = v8;
    smsStrategyIdentifiers = self->_smsStrategyIdentifiers;
  }
  -[NSMutableArray addObject:](smsStrategyIdentifiers, "addObject:", v4);

}

- (unint64_t)smsStrategyIdentifiersCount
{
  return -[NSMutableArray count](self->_smsStrategyIdentifiers, "count");
}

- (id)smsStrategyIdentifierAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_smsStrategyIdentifiers, "objectAtIndex:", a3);
}

+ (Class)smsStrategyIdentifierType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)MSPGroupSessionStorage;
  -[MSPGroupSessionStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPGroupSessionStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *groupIdentifier;
  NSString *originatorIdentifier;
  GEOSharedNavState *state;
  void *v8;
  void *v9;
  NSString *fromID;
  NSMutableArray *minimalStrategyIdentifiers;
  NSMutableArray *liveStrategyIdentifiers;
  NSMutableArray *messageStrategyIdentifiers;
  NSString *receivingHandle;
  NSString *receivingAccountIdentifier;
  NSMutableArray *smsStrategyIdentifiers;
  PBUnknownFields *unknownFields;
  void *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier)
    objc_msgSend(v3, "setObject:forKey:", groupIdentifier, CFSTR("groupIdentifier"));
  originatorIdentifier = self->_originatorIdentifier;
  if (originatorIdentifier)
    objc_msgSend(v4, "setObject:forKey:", originatorIdentifier, CFSTR("originatorIdentifier"));
  state = self->_state;
  if (state)
  {
    -[GEOSharedNavState dictionaryRepresentation](state, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("state"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastUpdateTimestamp);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("last_update_timestamp"));

  }
  fromID = self->_fromID;
  if (fromID)
    objc_msgSend(v4, "setObject:forKey:", fromID, CFSTR("fromID"));
  minimalStrategyIdentifiers = self->_minimalStrategyIdentifiers;
  if (minimalStrategyIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", minimalStrategyIdentifiers, CFSTR("minimalStrategyIdentifier"));
  liveStrategyIdentifiers = self->_liveStrategyIdentifiers;
  if (liveStrategyIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", liveStrategyIdentifiers, CFSTR("liveStrategyIdentifier"));
  messageStrategyIdentifiers = self->_messageStrategyIdentifiers;
  if (messageStrategyIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", messageStrategyIdentifiers, CFSTR("messageStrategyIdentifier"));
  receivingHandle = self->_receivingHandle;
  if (receivingHandle)
    objc_msgSend(v4, "setObject:forKey:", receivingHandle, CFSTR("receivingHandle"));
  receivingAccountIdentifier = self->_receivingAccountIdentifier;
  if (receivingAccountIdentifier)
    objc_msgSend(v4, "setObject:forKey:", receivingAccountIdentifier, CFSTR("receivingAccountIdentifier"));
  smsStrategyIdentifiers = self->_smsStrategyIdentifiers;
  if (smsStrategyIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", smsStrategyIdentifiers, CFSTR("smsStrategyIdentifier"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPGroupSessionStorageReadFrom((uint64_t)self, (uint64_t)a3);
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
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_groupIdentifier)
    PBDataWriterWriteStringField();
  if (self->_originatorIdentifier)
    PBDataWriterWriteStringField();
  if (self->_state)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_fromID)
    PBDataWriterWriteStringField();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = self->_minimalStrategyIdentifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v7);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = self->_liveStrategyIdentifiers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v12);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = self->_messageStrategyIdentifiers;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v17);
  }

  if (self->_receivingHandle)
    PBDataWriterWriteStringField();
  if (self->_receivingAccountIdentifier)
    PBDataWriterWriteStringField();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = self->_smsStrategyIdentifiers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    }
    while (v22);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v25);
}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  id v21;

  v4 = a3;
  v21 = v4;
  if (self->_groupIdentifier)
  {
    objc_msgSend(v4, "setGroupIdentifier:");
    v4 = v21;
  }
  if (self->_originatorIdentifier)
  {
    objc_msgSend(v21, "setOriginatorIdentifier:");
    v4 = v21;
  }
  if (self->_state)
  {
    objc_msgSend(v21, "setState:");
    v4 = v21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_lastUpdateTimestamp;
    *((_BYTE *)v4 + 104) |= 1u;
  }
  if (self->_fromID)
    objc_msgSend(v21, "setFromID:");
  if (-[MSPGroupSessionStorage minimalStrategyIdentifiersCount](self, "minimalStrategyIdentifiersCount"))
  {
    objc_msgSend(v21, "clearMinimalStrategyIdentifiers");
    v5 = -[MSPGroupSessionStorage minimalStrategyIdentifiersCount](self, "minimalStrategyIdentifiersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[MSPGroupSessionStorage minimalStrategyIdentifierAtIndex:](self, "minimalStrategyIdentifierAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addMinimalStrategyIdentifier:", v8);

      }
    }
  }
  if (-[MSPGroupSessionStorage liveStrategyIdentifiersCount](self, "liveStrategyIdentifiersCount"))
  {
    objc_msgSend(v21, "clearLiveStrategyIdentifiers");
    v9 = -[MSPGroupSessionStorage liveStrategyIdentifiersCount](self, "liveStrategyIdentifiersCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[MSPGroupSessionStorage liveStrategyIdentifierAtIndex:](self, "liveStrategyIdentifierAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addLiveStrategyIdentifier:", v12);

      }
    }
  }
  if (-[MSPGroupSessionStorage messageStrategyIdentifiersCount](self, "messageStrategyIdentifiersCount"))
  {
    objc_msgSend(v21, "clearMessageStrategyIdentifiers");
    v13 = -[MSPGroupSessionStorage messageStrategyIdentifiersCount](self, "messageStrategyIdentifiersCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        -[MSPGroupSessionStorage messageStrategyIdentifierAtIndex:](self, "messageStrategyIdentifierAtIndex:", k);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addMessageStrategyIdentifier:", v16);

      }
    }
  }
  if (self->_receivingHandle)
    objc_msgSend(v21, "setReceivingHandle:");
  if (self->_receivingAccountIdentifier)
    objc_msgSend(v21, "setReceivingAccountIdentifier:");
  if (-[MSPGroupSessionStorage smsStrategyIdentifiersCount](self, "smsStrategyIdentifiersCount"))
  {
    objc_msgSend(v21, "clearSmsStrategyIdentifiers");
    v17 = -[MSPGroupSessionStorage smsStrategyIdentifiersCount](self, "smsStrategyIdentifiersCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[MSPGroupSessionStorage smsStrategyIdentifierAtIndex:](self, "smsStrategyIdentifierAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addSmsStrategyIdentifier:", v20);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_groupIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_originatorIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  v10 = -[GEOSharedNavState copyWithZone:](self->_state, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_lastUpdateTimestamp;
    *(_BYTE *)(v5 + 104) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_fromID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v14 = self->_minimalStrategyIdentifiers;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v56 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMinimalStrategyIdentifier:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v16);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v20 = self->_liveStrategyIdentifiers;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v52 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLiveStrategyIdentifier:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v22);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v26 = self->_messageStrategyIdentifiers;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v48 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMessageStrategyIdentifier:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    }
    while (v28);
  }

  v32 = -[NSString copyWithZone:](self->_receivingHandle, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v32;

  v34 = -[NSString copyWithZone:](self->_receivingAccountIdentifier, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v34;

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v36 = self->_smsStrategyIdentifiers;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v44;
    do
    {
      for (m = 0; m != v38; ++m)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(v36);
        v41 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * m), "copyWithZone:", a3, (_QWORD)v43);
        objc_msgSend((id)v5, "addSmsStrategyIdentifier:", v41);

      }
      v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
    }
    while (v38);
  }

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *groupIdentifier;
  NSString *originatorIdentifier;
  GEOSharedNavState *state;
  NSString *fromID;
  NSMutableArray *minimalStrategyIdentifiers;
  NSMutableArray *liveStrategyIdentifiers;
  NSMutableArray *messageStrategyIdentifiers;
  NSString *receivingHandle;
  NSString *receivingAccountIdentifier;
  NSMutableArray *smsStrategyIdentifiers;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  groupIdentifier = self->_groupIdentifier;
  if ((unint64_t)groupIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](groupIdentifier, "isEqual:"))
      goto LABEL_27;
  }
  originatorIdentifier = self->_originatorIdentifier;
  if ((unint64_t)originatorIdentifier | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](originatorIdentifier, "isEqual:"))
      goto LABEL_27;
  }
  state = self->_state;
  if ((unint64_t)state | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOSharedNavState isEqual:](state, "isEqual:"))
      goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 1) == 0 || self->_lastUpdateTimestamp != *((double *)v4 + 2))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
LABEL_27:
    v15 = 0;
    goto LABEL_28;
  }
  fromID = self->_fromID;
  if ((unint64_t)fromID | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](fromID, "isEqual:"))
    goto LABEL_27;
  minimalStrategyIdentifiers = self->_minimalStrategyIdentifiers;
  if ((unint64_t)minimalStrategyIdentifiers | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](minimalStrategyIdentifiers, "isEqual:"))
      goto LABEL_27;
  }
  liveStrategyIdentifiers = self->_liveStrategyIdentifiers;
  if ((unint64_t)liveStrategyIdentifiers | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](liveStrategyIdentifiers, "isEqual:"))
      goto LABEL_27;
  }
  messageStrategyIdentifiers = self->_messageStrategyIdentifiers;
  if ((unint64_t)messageStrategyIdentifiers | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](messageStrategyIdentifiers, "isEqual:"))
      goto LABEL_27;
  }
  receivingHandle = self->_receivingHandle;
  if ((unint64_t)receivingHandle | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](receivingHandle, "isEqual:"))
      goto LABEL_27;
  }
  receivingAccountIdentifier = self->_receivingAccountIdentifier;
  if ((unint64_t)receivingAccountIdentifier | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](receivingAccountIdentifier, "isEqual:"))
      goto LABEL_27;
  }
  smsStrategyIdentifiers = self->_smsStrategyIdentifiers;
  if ((unint64_t)smsStrategyIdentifiers | *((_QWORD *)v4 + 11))
    v15 = -[NSMutableArray isEqual:](smsStrategyIdentifiers, "isEqual:");
  else
    v15 = 1;
LABEL_28:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  double lastUpdateTimestamp;
  double v8;
  long double v9;
  double v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;

  v3 = -[NSString hash](self->_groupIdentifier, "hash");
  v4 = -[NSString hash](self->_originatorIdentifier, "hash");
  v5 = -[GEOSharedNavState hash](self->_state, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    lastUpdateTimestamp = self->_lastUpdateTimestamp;
    v8 = -lastUpdateTimestamp;
    if (lastUpdateTimestamp >= 0.0)
      v8 = self->_lastUpdateTimestamp;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  v11 = v4 ^ v3 ^ v5 ^ v6;
  v12 = -[NSString hash](self->_fromID, "hash");
  v13 = v12 ^ -[NSMutableArray hash](self->_minimalStrategyIdentifiers, "hash");
  v14 = v11 ^ v13 ^ -[NSMutableArray hash](self->_liveStrategyIdentifiers, "hash");
  v15 = -[NSMutableArray hash](self->_messageStrategyIdentifiers, "hash");
  v16 = v15 ^ -[NSString hash](self->_receivingHandle, "hash");
  v17 = v16 ^ -[NSString hash](self->_receivingAccountIdentifier, "hash");
  return v14 ^ v17 ^ -[NSMutableArray hash](self->_smsStrategyIdentifiers, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOSharedNavState *state;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[MSPGroupSessionStorage setGroupIdentifier:](self, "setGroupIdentifier:");
  if (*((_QWORD *)v4 + 8))
    -[MSPGroupSessionStorage setOriginatorIdentifier:](self, "setOriginatorIdentifier:");
  state = self->_state;
  v6 = *((_QWORD *)v4 + 12);
  if (state)
  {
    if (v6)
      -[GEOSharedNavState mergeFrom:](state, "mergeFrom:");
  }
  else if (v6)
  {
    -[MSPGroupSessionStorage setState:](self, "setState:");
  }
  if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
    self->_lastUpdateTimestamp = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[MSPGroupSessionStorage setFromID:](self, "setFromID:");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = *((id *)v4 + 7);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        -[MSPGroupSessionStorage addMinimalStrategyIdentifier:](self, "addMinimalStrategyIdentifier:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v9);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = *((id *)v4 + 5);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        -[MSPGroupSessionStorage addLiveStrategyIdentifier:](self, "addLiveStrategyIdentifier:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v14);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = *((id *)v4 + 6);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        -[MSPGroupSessionStorage addMessageStrategyIdentifier:](self, "addMessageStrategyIdentifier:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v19);
  }

  if (*((_QWORD *)v4 + 10))
    -[MSPGroupSessionStorage setReceivingHandle:](self, "setReceivingHandle:");
  if (*((_QWORD *)v4 + 9))
    -[MSPGroupSessionStorage setReceivingAccountIdentifier:](self, "setReceivingAccountIdentifier:");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = *((id *)v4 + 11);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        -[MSPGroupSessionStorage addSmsStrategyIdentifier:](self, "addSmsStrategyIdentifier:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * m), (_QWORD)v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v24);
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (NSString)originatorIdentifier
{
  return self->_originatorIdentifier;
}

- (void)setOriginatorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_originatorIdentifier, a3);
}

- (GEOSharedNavState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (double)lastUpdateTimestamp
{
  return self->_lastUpdateTimestamp;
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void)setFromID:(id)a3
{
  objc_storeStrong((id *)&self->_fromID, a3);
}

- (NSMutableArray)minimalStrategyIdentifiers
{
  return self->_minimalStrategyIdentifiers;
}

- (void)setMinimalStrategyIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_minimalStrategyIdentifiers, a3);
}

- (NSMutableArray)liveStrategyIdentifiers
{
  return self->_liveStrategyIdentifiers;
}

- (void)setLiveStrategyIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_liveStrategyIdentifiers, a3);
}

- (NSMutableArray)messageStrategyIdentifiers
{
  return self->_messageStrategyIdentifiers;
}

- (void)setMessageStrategyIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_messageStrategyIdentifiers, a3);
}

- (NSString)receivingHandle
{
  return self->_receivingHandle;
}

- (void)setReceivingHandle:(id)a3
{
  objc_storeStrong((id *)&self->_receivingHandle, a3);
}

- (NSString)receivingAccountIdentifier
{
  return self->_receivingAccountIdentifier;
}

- (void)setReceivingAccountIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_receivingAccountIdentifier, a3);
}

- (NSMutableArray)smsStrategyIdentifiers
{
  return self->_smsStrategyIdentifiers;
}

- (void)setSmsStrategyIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_smsStrategyIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_smsStrategyIdentifiers, 0);
  objc_storeStrong((id *)&self->_receivingHandle, 0);
  objc_storeStrong((id *)&self->_receivingAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_originatorIdentifier, 0);
  objc_storeStrong((id *)&self->_minimalStrategyIdentifiers, 0);
  objc_storeStrong((id *)&self->_messageStrategyIdentifiers, 0);
  objc_storeStrong((id *)&self->_liveStrategyIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
