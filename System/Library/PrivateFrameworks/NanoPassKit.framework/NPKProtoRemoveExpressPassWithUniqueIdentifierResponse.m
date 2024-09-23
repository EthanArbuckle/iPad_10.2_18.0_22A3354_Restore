@implementation NPKProtoRemoveExpressPassWithUniqueIdentifierResponse

- (void)setPending:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)NPKProtoRemoveExpressPassWithUniqueIdentifierResponse;
  -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  NSData *actualExpressPassInformation;
  NSMutableArray *currentExpressPassesInformations;
  NSMutableArray *expressPassConfigurations;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("pending"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_success);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("success"));

  }
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
  return NPKProtoRemoveExpressPassWithUniqueIdentifierResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_actualExpressPassInformation)
    PBDataWriterWriteDataField();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = self->_currentExpressPassesInformations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteDataField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self->_expressPassConfigurations;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteDataField();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  void *v13;
  id v14;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[32] = self->_pending;
    v4[36] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[33] = self->_success;
    v4[36] |= 2u;
  }
  v14 = v4;
  if (self->_actualExpressPassInformation)
    objc_msgSend(v4, "setActualExpressPassInformation:");
  if (-[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse currentExpressPassesInformationsCount](self, "currentExpressPassesInformationsCount"))
  {
    objc_msgSend(v14, "clearCurrentExpressPassesInformations");
    v6 = -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse currentExpressPassesInformationsCount](self, "currentExpressPassesInformationsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse currentExpressPassesInformationAtIndex:](self, "currentExpressPassesInformationAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addCurrentExpressPassesInformation:", v9);

      }
    }
  }
  if (-[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse expressPassConfigurationsCount](self, "expressPassConfigurationsCount"))
  {
    objc_msgSend(v14, "clearExpressPassConfigurations");
    v10 = -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse expressPassConfigurationsCount](self, "expressPassConfigurationsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
      {
        -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse expressPassConfigurationsAtIndex:](self, "expressPassConfigurationsAtIndex:", j);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addExpressPassConfigurations:", v13);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[32] = self->_pending;
    v5[36] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[33] = self->_success;
    v5[36] |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_actualExpressPassInformation, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = self->_currentExpressPassesInformations;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addCurrentExpressPassesInformation:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v12);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_expressPassConfigurations;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v6, "addExpressPassConfigurations:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v18);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *actualExpressPassInformation;
  NSMutableArray *currentExpressPassesInformations;
  NSMutableArray *expressPassConfigurations;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0)
      goto LABEL_24;
    if (self->_pending)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_24;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_24;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) != 0)
    {
      if (self->_success)
      {
        if (!*((_BYTE *)v4 + 33))
          goto LABEL_24;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_18;
    }
LABEL_24:
    v8 = 0;
    goto LABEL_25;
  }
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
    goto LABEL_24;
LABEL_18:
  actualExpressPassInformation = self->_actualExpressPassInformation;
  if ((unint64_t)actualExpressPassInformation | *((_QWORD *)v4 + 1)
    && !-[NSData isEqual:](actualExpressPassInformation, "isEqual:"))
  {
    goto LABEL_24;
  }
  currentExpressPassesInformations = self->_currentExpressPassesInformations;
  if ((unint64_t)currentExpressPassesInformations | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](currentExpressPassesInformations, "isEqual:"))
      goto LABEL_24;
  }
  expressPassConfigurations = self->_expressPassConfigurations;
  if ((unint64_t)expressPassConfigurations | *((_QWORD *)v4 + 3))
    v8 = -[NSMutableArray isEqual:](expressPassConfigurations, "isEqual:");
  else
    v8 = 1;
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_pending;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_success;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSData hash](self->_actualExpressPassInformation, "hash");
  v6 = -[NSMutableArray hash](self->_currentExpressPassesInformations, "hash");
  return v5 ^ v6 ^ -[NSMutableArray hash](self->_expressPassConfigurations, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  char v6;
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
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (id *)v4;
  v6 = *((_BYTE *)v4 + 36);
  if ((v6 & 1) != 0)
  {
    self->_pending = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 36);
  }
  if ((v6 & 2) != 0)
  {
    self->_success = *((_BYTE *)v4 + 33);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
    -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse setActualExpressPassInformation:](self, "setActualExpressPassInformation:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5[2];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse addCurrentExpressPassesInformation:](self, "addCurrentExpressPassesInformation:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v5[3];
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse addExpressPassConfigurations:](self, "addExpressPassConfigurations:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
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
  objc_storeStrong((id *)&self->_currentExpressPassesInformations, 0);
  objc_storeStrong((id *)&self->_actualExpressPassInformation, 0);
}

@end
