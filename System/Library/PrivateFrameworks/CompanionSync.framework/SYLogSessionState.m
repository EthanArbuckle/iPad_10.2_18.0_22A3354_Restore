@implementation SYLogSessionState

- (id)stateAsString:(int)a3
{
  if (a3 < 0xA)
    return off_24CC66520[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotStarted")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Continue")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SendComplete")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cancel")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Restart")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Error")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WaitingForStartConfirmation")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WaitingForCompletionConfirmation")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WaitingForBatchEnqueue")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SyncComplete")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setIsReset:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isReset = a3;
}

- (void)setHasIsReset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsReset
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPerMessageTimeout:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_perMessageTimeout = a3;
}

- (void)setHasPerMessageTimeout:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPerMessageTimeout
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFullSessionTimeout:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_fullSessionTimeout = a3;
}

- (void)setHasFullSessionTimeout:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFullSessionTimeout
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (void)setCanRestart:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_canRestart = a3;
}

- (void)setHasCanRestart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCanRestart
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCanRollback:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_canRollback = a3;
}

- (void)setHasCanRollback:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCanRollback
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCanceled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_canceled = a3;
}

- (void)setHasCanceled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCanceled
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearTransportOptions
{
  -[NSMutableArray removeAllObjects](self->_transportOptions, "removeAllObjects");
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

- (void)clearPeers
{
  -[NSMutableArray removeAllObjects](self->_peers, "removeAllObjects");
}

- (void)addPeer:(id)a3
{
  id v4;
  NSMutableArray *peers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  peers = self->_peers;
  v8 = v4;
  if (!peers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_peers;
    self->_peers = v6;

    v4 = v8;
    peers = self->_peers;
  }
  -[NSMutableArray addObject:](peers, "addObject:", v4);

}

- (unint64_t)peersCount
{
  return -[NSMutableArray count](self->_peers, "count");
}

- (id)peerAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_peers, "objectAtIndex:", a3);
}

+ (Class)peerType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasReason
{
  return self->_reason != 0;
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
  v8.super_class = (Class)SYLogSessionState;
  -[SYLogSessionState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYLogSessionState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  uint64_t state;
  __CFString *v7;
  void *v8;
  char has;
  void *v10;
  void *v11;
  SYLogErrorInfo *error;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  NSString *reason;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  state = self->_state;
  if (state >= 0xA)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_state);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_24CC66520[state];
  }
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("state"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSending);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("isSending"));

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isReset);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("isReset"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 1) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_perMessageTimeout);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("perMessageTimeout"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_fullSessionTimeout);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("fullSessionTimeout"));

  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxConcurrentMessages);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("maxConcurrentMessages"));

  error = self->_error;
  if (error)
  {
    -[SYLogErrorInfo dictionaryRepresentation](error, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("error"));

  }
  v14 = (char)self->_has;
  if ((v14 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_canRestart);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("canRestart"));

    v14 = (char)self->_has;
    if ((v14 & 8) == 0)
    {
LABEL_14:
      if ((v14 & 0x10) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_canRollback);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("canRollback"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_canceled);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("canceled"));

  }
LABEL_16:
  if (-[NSMutableArray count](self->_transportOptions, "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_transportOptions, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = self->_transportOptions;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

        }
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("transportOptions"));
  }
  if (-[NSMutableArray count](self->_peers, "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_peers, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v24 = self->_peers;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v37 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v26);
    }

    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("peer"));
  }
  reason = self->_reason;
  if (reason)
    objc_msgSend(v4, "setObject:forKey:", reason, CFSTR("reason"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SYLogSessionStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  char v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_identifier)
    -[SYLogSessionState writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_4:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_4;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField();
LABEL_6:
  PBDataWriterWriteUint64Field();
  if (self->_error)
    PBDataWriterWriteSubmessage();
  v7 = (char)self->_has;
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = (char)self->_has;
    if ((v7 & 8) == 0)
    {
LABEL_10:
      if ((v7 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_11:
    PBDataWriterWriteBOOLField();
LABEL_12:
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_transportOptions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
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
        PBDataWriterWriteSubmessage();
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = self->_peers;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

  if (self->_reason)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "setIdentifier:", self->_identifier);
  v4 = v15;
  *((_DWORD *)v15 + 16) = self->_state;
  *((_BYTE *)v15 + 84) = self->_isSending;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v15 + 83) = self->_isReset;
    *((_BYTE *)v15 + 88) |= 0x20u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v15 + 3) = *(_QWORD *)&self->_perMessageTimeout;
  *((_BYTE *)v15 + 88) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)v15 + 1) = *(_QWORD *)&self->_fullSessionTimeout;
    *((_BYTE *)v15 + 88) |= 1u;
  }
LABEL_5:
  *((_QWORD *)v15 + 2) = self->_maxConcurrentMessages;
  if (self->_error)
  {
    objc_msgSend(v15, "setError:");
    v4 = v15;
  }
  v6 = (char)self->_has;
  if ((v6 & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
LABEL_26:
    v4[81] = self->_canRollback;
    v4[88] |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v4[80] = self->_canRestart;
  v4[88] |= 4u;
  v6 = (char)self->_has;
  if ((v6 & 8) != 0)
    goto LABEL_26;
LABEL_9:
  if ((v6 & 0x10) != 0)
  {
LABEL_10:
    v4[82] = self->_canceled;
    v4[88] |= 0x10u;
  }
LABEL_11:
  if (-[SYLogSessionState transportOptionsCount](self, "transportOptionsCount"))
  {
    objc_msgSend(v15, "clearTransportOptions");
    v7 = -[SYLogSessionState transportOptionsCount](self, "transportOptionsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[SYLogSessionState transportOptionsAtIndex:](self, "transportOptionsAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addTransportOptions:", v10);

      }
    }
  }
  if (-[SYLogSessionState peersCount](self, "peersCount"))
  {
    objc_msgSend(v15, "clearPeers");
    v11 = -[SYLogSessionState peersCount](self, "peersCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[SYLogSessionState peerAtIndex:](self, "peerAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addPeer:", v14);

      }
    }
  }
  if (self->_reason)
    objc_msgSend(v15, "setReason:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  id v9;
  void *v10;
  char v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  *(_DWORD *)(v5 + 64) = self->_state;
  *(_BYTE *)(v5 + 84) = self->_isSending;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 83) = self->_isReset;
    *(_BYTE *)(v5 + 88) |= 0x20u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_perMessageTimeout;
  *(_BYTE *)(v5 + 88) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_fullSessionTimeout;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
LABEL_5:
  *(_QWORD *)(v5 + 16) = self->_maxConcurrentMessages;
  v9 = -[SYLogErrorInfo copyWithZone:](self->_error, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    *(_BYTE *)(v5 + 80) = self->_canRestart;
    *(_BYTE *)(v5 + 88) |= 4u;
    v11 = (char)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_7:
      if ((v11 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 81) = self->_canRollback;
  *(_BYTE *)(v5 + 88) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 82) = self->_canceled;
    *(_BYTE *)(v5 + 88) |= 0x10u;
  }
LABEL_9:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = self->_transportOptions;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTransportOptions:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v14);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = self->_peers;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v27);
        objc_msgSend((id)v5, "addPeer:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

  v24 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  char has;
  SYLogErrorInfo *error;
  NSMutableArray *transportOptions;
  NSMutableArray *peers;
  NSString *reason;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_61;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_61;
  }
  if (self->_state != *((_DWORD *)v4 + 16))
    goto LABEL_61;
  if (self->_isSending)
  {
    if (!*((_BYTE *)v4 + 84))
      goto LABEL_61;
  }
  else if (*((_BYTE *)v4 + 84))
  {
    goto LABEL_61;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x20) == 0)
      goto LABEL_61;
    if (self->_isReset)
    {
      if (!*((_BYTE *)v4 + 83))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 83))
    {
      goto LABEL_61;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_perMessageTimeout != *((double *)v4 + 3))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 88) & 2) != 0)
  {
    goto LABEL_61;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_fullSessionTimeout != *((double *)v4 + 1))
      goto LABEL_61;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_61;
  }
  if (self->_maxConcurrentMessages != *((_QWORD *)v4 + 2))
  {
LABEL_61:
    v11 = 0;
    goto LABEL_62;
  }
  error = self->_error;
  if ((unint64_t)error | *((_QWORD *)v4 + 4))
  {
    if (!-[SYLogErrorInfo isEqual:](error, "isEqual:"))
      goto LABEL_61;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0)
      goto LABEL_61;
    if (self->_canRestart)
    {
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 80))
    {
      goto LABEL_61;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 8) == 0)
      goto LABEL_61;
    if (self->_canRollback)
    {
      if (!*((_BYTE *)v4 + 81))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 81))
    {
      goto LABEL_61;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
    goto LABEL_61;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
    {
      if (self->_canceled)
      {
        if (!*((_BYTE *)v4 + 82))
          goto LABEL_61;
        goto LABEL_55;
      }
      if (!*((_BYTE *)v4 + 82))
        goto LABEL_55;
    }
    goto LABEL_61;
  }
  if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
    goto LABEL_61;
LABEL_55:
  transportOptions = self->_transportOptions;
  if ((unint64_t)transportOptions | *((_QWORD *)v4 + 9)
    && !-[NSMutableArray isEqual:](transportOptions, "isEqual:"))
  {
    goto LABEL_61;
  }
  peers = self->_peers;
  if ((unint64_t)peers | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](peers, "isEqual:"))
      goto LABEL_61;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((_QWORD *)v4 + 7))
    v11 = -[NSString isEqual:](reason, "isEqual:");
  else
    v11 = 1;
LABEL_62:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char has;
  uint64_t v5;
  _BOOL4 isSending;
  uint64_t state;
  unint64_t v8;
  double perMessageTimeout;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  double fullSessionTimeout;
  double v15;
  long double v16;
  double v17;
  unint64_t maxConcurrentMessages;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = -[NSString hash](self->_identifier, "hash");
  has = (char)self->_has;
  if ((has & 0x20) != 0)
    v5 = 2654435761 * self->_isReset;
  else
    v5 = 0;
  isSending = self->_isSending;
  state = self->_state;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    perMessageTimeout = self->_perMessageTimeout;
    v10 = -perMessageTimeout;
    if (perMessageTimeout >= 0.0)
      v10 = self->_perMessageTimeout;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((has & 1) != 0)
  {
    fullSessionTimeout = self->_fullSessionTimeout;
    v15 = -fullSessionTimeout;
    if (fullSessionTimeout >= 0.0)
      v15 = self->_fullSessionTimeout;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  maxConcurrentMessages = self->_maxConcurrentMessages;
  v19 = -[SYLogErrorInfo hash](self->_error, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v20 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_22;
LABEL_25:
    v21 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_23;
LABEL_26:
    v22 = 0;
    goto LABEL_27;
  }
  v20 = 2654435761 * self->_canRestart;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_25;
LABEL_22:
  v21 = 2654435761 * self->_canRollback;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_26;
LABEL_23:
  v22 = 2654435761 * self->_canceled;
LABEL_27:
  v23 = v19 ^ v20 ^ v21 ^ v22 ^ -[NSMutableArray hash](self->_transportOptions, "hash");
  v24 = v23 ^ -[NSMutableArray hash](self->_peers, "hash");
  return (2654435761 * state) ^ v3 ^ (2654435761 * isSending) ^ v5 ^ v8 ^ v13 ^ (2654435761u * maxConcurrentMessages) ^ v24 ^ -[NSString hash](self->_reason, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  SYLogErrorInfo *error;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 5))
    -[SYLogSessionState setIdentifier:](self, "setIdentifier:");
  self->_state = *((_DWORD *)v4 + 16);
  self->_isSending = *((_BYTE *)v4 + 84);
  v5 = *((_BYTE *)v4 + 88);
  if ((v5 & 0x20) != 0)
  {
    self->_isReset = *((_BYTE *)v4 + 83);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 88);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_perMessageTimeout = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_6:
    self->_fullSessionTimeout = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:
  self->_maxConcurrentMessages = *((_QWORD *)v4 + 2);
  error = self->_error;
  v7 = *((_QWORD *)v4 + 4);
  if (error)
  {
    if (v7)
      -[SYLogErrorInfo mergeFrom:](error, "mergeFrom:");
  }
  else if (v7)
  {
    -[SYLogSessionState setError:](self, "setError:");
  }
  v8 = *((_BYTE *)v4 + 88);
  if ((v8 & 4) != 0)
  {
    self->_canRestart = *((_BYTE *)v4 + 80);
    *(_BYTE *)&self->_has |= 4u;
    v8 = *((_BYTE *)v4 + 88);
    if ((v8 & 8) == 0)
    {
LABEL_17:
      if ((v8 & 0x10) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v4 + 88) & 8) == 0)
  {
    goto LABEL_17;
  }
  self->_canRollback = *((_BYTE *)v4 + 81);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
  {
LABEL_18:
    self->_canceled = *((_BYTE *)v4 + 82);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_19:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = *((id *)v4 + 9);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        -[SYLogSessionState addTransportOptions:](self, "addTransportOptions:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v11);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = *((id *)v4 + 6);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[SYLogSessionState addPeer:](self, "addPeer:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

  if (*((_QWORD *)v4 + 7))
    -[SYLogSessionState setReason:](self, "setReason:");

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)isSending
{
  return self->_isSending;
}

- (void)setIsSending:(BOOL)a3
{
  self->_isSending = a3;
}

- (BOOL)isReset
{
  return self->_isReset;
}

- (double)perMessageTimeout
{
  return self->_perMessageTimeout;
}

- (double)fullSessionTimeout
{
  return self->_fullSessionTimeout;
}

- (unint64_t)maxConcurrentMessages
{
  return self->_maxConcurrentMessages;
}

- (void)setMaxConcurrentMessages:(unint64_t)a3
{
  self->_maxConcurrentMessages = a3;
}

- (SYLogErrorInfo)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)canRestart
{
  return self->_canRestart;
}

- (BOOL)canRollback
{
  return self->_canRollback;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (NSMutableArray)transportOptions
{
  return self->_transportOptions;
}

- (void)setTransportOptions:(id)a3
{
  objc_storeStrong((id *)&self->_transportOptions, a3);
}

- (NSMutableArray)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
  objc_storeStrong((id *)&self->_peers, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportOptions, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setCocoaTransportOptions:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[SYLogSessionState clearTransportOptions](self, "clearTransportOptions");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__SYLogSessionState_Convenience__setCocoaTransportOptions___block_invoke;
  v5[3] = &unk_24CC668F8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __59__SYLogSessionState_Convenience__setCocoaTransportOptions___block_invoke(uint64_t a1, void *a2, void *a3)
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
  -[SYLogSessionState transportOptions](self, "transportOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SYLogSessionState transportOptions](self, "transportOptions", 0);
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
  __assert_rtn("-[SYLogSessionState writeTo:]", "SYLogSessionState.m", 395, "nil != self->_identifier");
}

@end
