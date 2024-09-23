@implementation NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse

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

- (void)clearConflictingExpressPassIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_conflictingExpressPassIdentifiers, "removeAllObjects");
}

- (void)addConflictingExpressPassIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *conflictingExpressPassIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  conflictingExpressPassIdentifiers = self->_conflictingExpressPassIdentifiers;
  v8 = v4;
  if (!conflictingExpressPassIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_conflictingExpressPassIdentifiers;
    self->_conflictingExpressPassIdentifiers = v6;

    v4 = v8;
    conflictingExpressPassIdentifiers = self->_conflictingExpressPassIdentifiers;
  }
  -[NSMutableArray addObject:](conflictingExpressPassIdentifiers, "addObject:", v4);

}

- (unint64_t)conflictingExpressPassIdentifiersCount
{
  return -[NSMutableArray count](self->_conflictingExpressPassIdentifiers, "count");
}

- (id)conflictingExpressPassIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_conflictingExpressPassIdentifiers, "objectAtIndex:", a3);
}

+ (Class)conflictingExpressPassIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)clearConflictingReferenceExpressPassIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_conflictingReferenceExpressPassIdentifiers, "removeAllObjects");
}

- (void)addConflictingReferenceExpressPassIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *conflictingReferenceExpressPassIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  conflictingReferenceExpressPassIdentifiers = self->_conflictingReferenceExpressPassIdentifiers;
  v8 = v4;
  if (!conflictingReferenceExpressPassIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_conflictingReferenceExpressPassIdentifiers;
    self->_conflictingReferenceExpressPassIdentifiers = v6;

    v4 = v8;
    conflictingReferenceExpressPassIdentifiers = self->_conflictingReferenceExpressPassIdentifiers;
  }
  -[NSMutableArray addObject:](conflictingReferenceExpressPassIdentifiers, "addObject:", v4);

}

- (unint64_t)conflictingReferenceExpressPassIdentifiersCount
{
  return -[NSMutableArray count](self->_conflictingReferenceExpressPassIdentifiers, "count");
}

- (id)conflictingReferenceExpressPassIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_conflictingReferenceExpressPassIdentifiers, "objectAtIndex:", a3);
}

+ (Class)conflictingReferenceExpressPassIdentifiersType
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
  v8.super_class = (Class)NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse;
  -[NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *conflictingExpressPassIdentifiers;
  NSMutableArray *conflictingReferenceExpressPassIdentifiers;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_pending);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("pending"));

  }
  conflictingExpressPassIdentifiers = self->_conflictingExpressPassIdentifiers;
  if (conflictingExpressPassIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", conflictingExpressPassIdentifiers, CFSTR("conflictingExpressPassIdentifiers"));
  conflictingReferenceExpressPassIdentifiers = self->_conflictingReferenceExpressPassIdentifiers;
  if (conflictingReferenceExpressPassIdentifiers)
    objc_msgSend(v3, "setObject:forKey:", conflictingReferenceExpressPassIdentifiers, CFSTR("conflictingReferenceExpressPassIdentifiers"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoConflictingExpressPassIdentifiersForPassInformationResponseReadFrom(self, (uint64_t)a3);
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

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_conflictingExpressPassIdentifiers;
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
  v10 = self->_conflictingReferenceExpressPassIdentifiers;
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
        PBDataWriterWriteStringField();
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
  _BYTE *v4;
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
    v4[24] = self->_pending;
    v4[28] |= 1u;
  }
  v13 = v4;
  if (-[NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse conflictingExpressPassIdentifiersCount](self, "conflictingExpressPassIdentifiersCount"))
  {
    objc_msgSend(v13, "clearConflictingExpressPassIdentifiers");
    v5 = -[NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse conflictingExpressPassIdentifiersCount](self, "conflictingExpressPassIdentifiersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse conflictingExpressPassIdentifiersAtIndex:](self, "conflictingExpressPassIdentifiersAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addConflictingExpressPassIdentifiers:", v8);

      }
    }
  }
  if (-[NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse conflictingReferenceExpressPassIdentifiersCount](self, "conflictingReferenceExpressPassIdentifiersCount"))
  {
    objc_msgSend(v13, "clearConflictingReferenceExpressPassIdentifiers");
    v9 = -[NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse conflictingReferenceExpressPassIdentifiersCount](self, "conflictingReferenceExpressPassIdentifiersCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse conflictingReferenceExpressPassIdentifiersAtIndex:](self, "conflictingReferenceExpressPassIdentifiersAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addConflictingReferenceExpressPassIdentifiers:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
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

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_pending;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_conflictingExpressPassIdentifiers;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v6, "addConflictingExpressPassIdentifiers:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_conflictingReferenceExpressPassIdentifiers;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addConflictingReferenceExpressPassIdentifiers:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *conflictingExpressPassIdentifiers;
  NSMutableArray *conflictingReferenceExpressPassIdentifiers;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) != 0)
    {
      if (self->_pending)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_14;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_10;
    }
LABEL_14:
    v7 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
    goto LABEL_14;
LABEL_10:
  conflictingExpressPassIdentifiers = self->_conflictingExpressPassIdentifiers;
  if ((unint64_t)conflictingExpressPassIdentifiers | *((_QWORD *)v4 + 1)
    && !-[NSMutableArray isEqual:](conflictingExpressPassIdentifiers, "isEqual:"))
  {
    goto LABEL_14;
  }
  conflictingReferenceExpressPassIdentifiers = self->_conflictingReferenceExpressPassIdentifiers;
  if ((unint64_t)conflictingReferenceExpressPassIdentifiers | *((_QWORD *)v4 + 2))
    v7 = -[NSMutableArray isEqual:](conflictingReferenceExpressPassIdentifiers, "isEqual:");
  else
    v7 = 1;
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_pending;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_conflictingExpressPassIdentifiers, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_conflictingReferenceExpressPassIdentifiers, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  v5 = (id *)v4;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    self->_pending = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse addConflictingExpressPassIdentifiers:](self, "addConflictingExpressPassIdentifiers:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = v5[2];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[NPKProtoConflictingExpressPassIdentifiersForPassInformationResponse addConflictingReferenceExpressPassIdentifiers:](self, "addConflictingReferenceExpressPassIdentifiers:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), (_QWORD)v16);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (BOOL)pending
{
  return self->_pending;
}

- (NSMutableArray)conflictingExpressPassIdentifiers
{
  return self->_conflictingExpressPassIdentifiers;
}

- (void)setConflictingExpressPassIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_conflictingExpressPassIdentifiers, a3);
}

- (NSMutableArray)conflictingReferenceExpressPassIdentifiers
{
  return self->_conflictingReferenceExpressPassIdentifiers;
}

- (void)setConflictingReferenceExpressPassIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_conflictingReferenceExpressPassIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictingReferenceExpressPassIdentifiers, 0);
  objc_storeStrong((id *)&self->_conflictingExpressPassIdentifiers, 0);
}

@end
