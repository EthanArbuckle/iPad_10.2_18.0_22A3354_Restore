@implementation NPKProtoSetExpressPassResponse

- (void)setPending:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPending
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setCancelled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCancelled
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNeedsUnlock:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_needsUnlock = a3;
}

- (void)setHasNeedsUnlock:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNeedsUnlock
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasActualUniqueID
{
  return self->_actualUniqueID != 0;
}

- (void)clearCurrentUniqueIDs
{
  -[NSMutableArray removeAllObjects](self->_currentUniqueIDs, "removeAllObjects");
}

- (void)addCurrentUniqueIDs:(id)a3
{
  id v4;
  NSMutableArray *currentUniqueIDs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  currentUniqueIDs = self->_currentUniqueIDs;
  v8 = v4;
  if (!currentUniqueIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_currentUniqueIDs;
    self->_currentUniqueIDs = v6;

    v4 = v8;
    currentUniqueIDs = self->_currentUniqueIDs;
  }
  -[NSMutableArray addObject:](currentUniqueIDs, "addObject:", v4);

}

- (unint64_t)currentUniqueIDsCount
{
  return -[NSMutableArray count](self->_currentUniqueIDs, "count");
}

- (id)currentUniqueIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_currentUniqueIDs, "objectAtIndex:", a3);
}

+ (Class)currentUniqueIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasActualExpressPassInformation
{
  return self->_actualExpressPassInformation != 0;
}

- (void)clearCurrentExpressPassesInformations
{
  -[NSMutableArray removeAllObjects](self->_currentExpressPassesInformations, "removeAllObjects");
}

- (void)addCurrentExpressPassesInformation:(id)a3
{
  id v4;
  NSMutableArray *currentExpressPassesInformations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  currentExpressPassesInformations = self->_currentExpressPassesInformations;
  v8 = v4;
  if (!currentExpressPassesInformations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_currentExpressPassesInformations;
    self->_currentExpressPassesInformations = v6;

    v4 = v8;
    currentExpressPassesInformations = self->_currentExpressPassesInformations;
  }
  -[NSMutableArray addObject:](currentExpressPassesInformations, "addObject:", v4);

}

- (unint64_t)currentExpressPassesInformationsCount
{
  return -[NSMutableArray count](self->_currentExpressPassesInformations, "count");
}

- (id)currentExpressPassesInformationAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_currentExpressPassesInformations, "objectAtIndex:", a3);
}

+ (Class)currentExpressPassesInformationType
{
  return (Class)objc_opt_class();
}

- (void)clearExpressPassConfigurations
{
  -[NSMutableArray removeAllObjects](self->_expressPassConfigurations, "removeAllObjects");
}

- (void)addExpressPassConfigurations:(id)a3
{
  id v4;
  NSMutableArray *expressPassConfigurations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  expressPassConfigurations = self->_expressPassConfigurations;
  v8 = v4;
  if (!expressPassConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_expressPassConfigurations;
    self->_expressPassConfigurations = v6;

    v4 = v8;
    expressPassConfigurations = self->_expressPassConfigurations;
  }
  -[NSMutableArray addObject:](expressPassConfigurations, "addObject:", v4);

}

- (unint64_t)expressPassConfigurationsCount
{
  return -[NSMutableArray count](self->_expressPassConfigurations, "count");
}

- (id)expressPassConfigurationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_expressPassConfigurations, "objectAtIndex:", a3);
}

+ (Class)expressPassConfigurationsType
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSetExpressPassResponse;
  -[NPKProtoSetExpressPassResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoSetExpressPassResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *actualUniqueID;
  NSMutableArray *currentUniqueIDs;
  NSData *actualExpressPassInformation;
  NSMutableArray *currentExpressPassesInformations;
  NSMutableArray *expressPassConfigurations;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("pending"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_success);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("success"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cancelled);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cancelled"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_needsUnlock);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("needsUnlock"));

  }
LABEL_6:
  actualUniqueID = self->_actualUniqueID;
  if (actualUniqueID)
    objc_msgSend(v3, "setObject:forKey:", actualUniqueID, CFSTR("actualUniqueID"));
  currentUniqueIDs = self->_currentUniqueIDs;
  if (currentUniqueIDs)
    objc_msgSend(v3, "setObject:forKey:", currentUniqueIDs, CFSTR("currentUniqueIDs"));
  actualExpressPassInformation = self->_actualExpressPassInformation;
  if (actualExpressPassInformation)
    objc_msgSend(v3, "setObject:forKey:", actualExpressPassInformation, CFSTR("actualExpressPassInformation"));
  currentExpressPassesInformations = self->_currentExpressPassesInformations;
  if (currentExpressPassesInformations)
    objc_msgSend(v3, "setObject:forKey:", currentExpressPassesInformations, CFSTR("currentExpressPassesInformation"));
  expressPassConfigurations = self->_expressPassConfigurations;
  if (expressPassConfigurations)
    objc_msgSend(v3, "setObject:forKey:", expressPassConfigurations, CFSTR("expressPassConfigurations"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSetExpressPassResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  char v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_actualUniqueID)
    PBDataWriterWriteStringField();
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
    PBDataWriterWriteBOOLField();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = self->_currentUniqueIDs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v9);
  }

  if (self->_actualExpressPassInformation)
    PBDataWriterWriteDataField();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = self->_currentExpressPassesInformations;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        PBDataWriterWriteDataField();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v14);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = self->_expressPassConfigurations;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v23;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v23 != v20)
          objc_enumerationMutation(v17);
        PBDataWriterWriteDataField();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v19);
  }

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
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  _BYTE *v19;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[50] = self->_pending;
    v4[52] |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[51] = self->_success;
    v4[52] |= 8u;
  }
  v19 = v4;
  if (self->_actualUniqueID)
  {
    objc_msgSend(v4, "setActualUniqueID:");
    v4 = v19;
  }
  v6 = (char)self->_has;
  if ((v6 & 1) != 0)
  {
    v4[48] = self->_cancelled;
    v4[52] |= 1u;
    v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    v4[49] = self->_needsUnlock;
    v4[52] |= 2u;
  }
  if (-[NPKProtoSetExpressPassResponse currentUniqueIDsCount](self, "currentUniqueIDsCount"))
  {
    objc_msgSend(v19, "clearCurrentUniqueIDs");
    v7 = -[NPKProtoSetExpressPassResponse currentUniqueIDsCount](self, "currentUniqueIDsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[NPKProtoSetExpressPassResponse currentUniqueIDsAtIndex:](self, "currentUniqueIDsAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addCurrentUniqueIDs:", v10);

      }
    }
  }
  if (self->_actualExpressPassInformation)
    objc_msgSend(v19, "setActualExpressPassInformation:");
  if (-[NPKProtoSetExpressPassResponse currentExpressPassesInformationsCount](self, "currentExpressPassesInformationsCount"))
  {
    objc_msgSend(v19, "clearCurrentExpressPassesInformations");
    v11 = -[NPKProtoSetExpressPassResponse currentExpressPassesInformationsCount](self, "currentExpressPassesInformationsCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[NPKProtoSetExpressPassResponse currentExpressPassesInformationAtIndex:](self, "currentExpressPassesInformationAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addCurrentExpressPassesInformation:", v14);

      }
    }
  }
  if (-[NPKProtoSetExpressPassResponse expressPassConfigurationsCount](self, "expressPassConfigurationsCount"))
  {
    objc_msgSend(v19, "clearExpressPassConfigurations");
    v15 = -[NPKProtoSetExpressPassResponse expressPassConfigurationsCount](self, "expressPassConfigurationsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[NPKProtoSetExpressPassResponse expressPassConfigurationsAtIndex:](self, "expressPassConfigurationsAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addExpressPassConfigurations:", v18);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _BYTE *v6;
  char has;
  uint64_t v8;
  void *v9;
  char v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
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
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[50] = self->_pending;
    v5[52] |= 4u;
    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v5[51] = self->_success;
    v5[52] |= 8u;
  }
  v8 = -[NSString copyWithZone:](self->_actualUniqueID, "copyWithZone:", a3);
  v9 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v8;

  v10 = (char)self->_has;
  if ((v10 & 1) != 0)
  {
    v6[48] = self->_cancelled;
    v6[52] |= 1u;
    v10 = (char)self->_has;
  }
  if ((v10 & 2) != 0)
  {
    v6[49] = self->_needsUnlock;
    v6[52] |= 2u;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = self->_currentUniqueIDs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addCurrentUniqueIDs:", v16);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v13);
  }

  v17 = -[NSData copyWithZone:](self->_actualExpressPassInformation, "copyWithZone:", a3);
  v18 = (void *)*((_QWORD *)v6 + 1);
  *((_QWORD *)v6 + 1) = v17;

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = self->_currentExpressPassesInformations;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v6, "addCurrentExpressPassesInformation:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v21);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = self->_expressPassConfigurations;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v33 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v32);
        objc_msgSend(v6, "addExpressPassConfigurations:", v30);

      }
      v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v27);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *actualUniqueID;
  NSMutableArray *currentUniqueIDs;
  NSData *actualExpressPassInformation;
  NSMutableArray *currentExpressPassesInformations;
  NSMutableArray *expressPassConfigurations;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_45;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0)
      goto LABEL_45;
    if (self->_pending)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0)
      goto LABEL_45;
    if (self->_success)
    {
      if (!*((_BYTE *)v4 + 51))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 51))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_45;
  }
  actualUniqueID = self->_actualUniqueID;
  if ((unint64_t)actualUniqueID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](actualUniqueID, "isEqual:"))
      goto LABEL_45;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0)
      goto LABEL_45;
    if (self->_cancelled)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_45;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_45;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_45;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) != 0)
    {
      if (self->_needsUnlock)
      {
        if (!*((_BYTE *)v4 + 49))
          goto LABEL_45;
        goto LABEL_37;
      }
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_37;
    }
LABEL_45:
    v11 = 0;
    goto LABEL_46;
  }
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
    goto LABEL_45;
LABEL_37:
  currentUniqueIDs = self->_currentUniqueIDs;
  if ((unint64_t)currentUniqueIDs | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](currentUniqueIDs, "isEqual:"))
  {
    goto LABEL_45;
  }
  actualExpressPassInformation = self->_actualExpressPassInformation;
  if ((unint64_t)actualExpressPassInformation | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](actualExpressPassInformation, "isEqual:"))
      goto LABEL_45;
  }
  currentExpressPassesInformations = self->_currentExpressPassesInformations;
  if ((unint64_t)currentExpressPassesInformations | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](currentExpressPassesInformations, "isEqual:"))
      goto LABEL_45;
  }
  expressPassConfigurations = self->_expressPassConfigurations;
  if ((unint64_t)expressPassConfigurations | *((_QWORD *)v4 + 5))
    v11 = -[NSMutableArray isEqual:](expressPassConfigurations, "isEqual:");
  else
    v11 = 1;
LABEL_46:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_pending;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_success;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_actualUniqueID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_cancelled;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_8;
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_8:
  v7 = 2654435761 * self->_needsUnlock;
LABEL_11:
  v8 = v4 ^ v3 ^ v6 ^ v7 ^ v5;
  v9 = -[NSMutableArray hash](self->_currentUniqueIDs, "hash");
  v10 = v8 ^ v9 ^ -[NSData hash](self->_actualExpressPassInformation, "hash");
  v11 = -[NSMutableArray hash](self->_currentExpressPassesInformations, "hash");
  return v10 ^ v11 ^ -[NSMutableArray hash](self->_expressPassConfigurations, "hash");
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  id v5;
  char v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  __int128 v23;
  __int128 v24;
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
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = v4[52];
  if ((v6 & 4) != 0)
  {
    self->_pending = v4[50];
    *(_BYTE *)&self->_has |= 4u;
    v6 = v4[52];
  }
  if ((v6 & 8) != 0)
  {
    self->_success = v4[51];
    *(_BYTE *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v4 + 2))
    -[NPKProtoSetExpressPassResponse setActualUniqueID:](self, "setActualUniqueID:");
  v7 = *((_BYTE *)v5 + 52);
  if ((v7 & 1) != 0)
  {
    self->_cancelled = *((_BYTE *)v5 + 48);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v5 + 52);
  }
  if ((v7 & 2) != 0)
  {
    self->_needsUnlock = *((_BYTE *)v5 + 49);
    *(_BYTE *)&self->_has |= 2u;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = *((id *)v5 + 4);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        -[NPKProtoSetExpressPassResponse addCurrentUniqueIDs:](self, "addCurrentUniqueIDs:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v10);
  }

  if (*((_QWORD *)v5 + 1))
    -[NPKProtoSetExpressPassResponse setActualExpressPassInformation:](self, "setActualExpressPassInformation:");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = *((id *)v5 + 3);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        -[NPKProtoSetExpressPassResponse addCurrentExpressPassesInformation:](self, "addCurrentExpressPassesInformation:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v15);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = *((id *)v5 + 5);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        -[NPKProtoSetExpressPassResponse addExpressPassConfigurations:](self, "addExpressPassConfigurations:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * k), (_QWORD)v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v20);
  }

}

- (BOOL)pending
{
  return self->_pending;
}

- (BOOL)success
{
  return self->_success;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (BOOL)needsUnlock
{
  return self->_needsUnlock;
}

- (NSString)actualUniqueID
{
  return self->_actualUniqueID;
}

- (void)setActualUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_actualUniqueID, a3);
}

- (NSMutableArray)currentUniqueIDs
{
  return self->_currentUniqueIDs;
}

- (void)setCurrentUniqueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_currentUniqueIDs, a3);
}

- (NSData)actualExpressPassInformation
{
  return self->_actualExpressPassInformation;
}

- (void)setActualExpressPassInformation:(id)a3
{
  objc_storeStrong((id *)&self->_actualExpressPassInformation, a3);
}

- (NSMutableArray)currentExpressPassesInformations
{
  return self->_currentExpressPassesInformations;
}

- (void)setCurrentExpressPassesInformations:(id)a3
{
  objc_storeStrong((id *)&self->_currentExpressPassesInformations, a3);
}

- (NSMutableArray)expressPassConfigurations
{
  return self->_expressPassConfigurations;
}

- (void)setExpressPassConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_expressPassConfigurations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressPassConfigurations, 0);
  objc_storeStrong((id *)&self->_currentUniqueIDs, 0);
  objc_storeStrong((id *)&self->_currentExpressPassesInformations, 0);
  objc_storeStrong((id *)&self->_actualUniqueID, 0);
  objc_storeStrong((id *)&self->_actualExpressPassInformation, 0);
}

@end
