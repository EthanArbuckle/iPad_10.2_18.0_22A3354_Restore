@implementation _MPCProtoContainer

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoContainer;
  -[_MPCProtoContainer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCProtoContainer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  _MPCProtoContainerIdentifierSet *identifierSet;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSString *playActivityFeatureName;
  NSString *playActivityQueueGroupingID;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_containerType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("containerType"));

  }
  identifierSet = self->_identifierSet;
  if (identifierSet)
  {
    -[_MPCProtoContainerIdentifierSet dictionaryRepresentation](identifierSet, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("identifierSet"));

  }
  if (-[NSMutableArray count](self->_items, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_items;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("item"));
  }
  playActivityFeatureName = self->_playActivityFeatureName;
  if (playActivityFeatureName)
    objc_msgSend(v3, "setObject:forKey:", playActivityFeatureName, CFSTR("playActivityFeatureName"));
  playActivityQueueGroupingID = self->_playActivityQueueGroupingID;
  if (playActivityQueueGroupingID)
    objc_msgSend(v3, "setObject:forKey:", playActivityQueueGroupingID, CFSTR("playActivityQueueGroupingID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_identifierSet)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_items;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_playActivityFeatureName)
    PBDataWriterWriteStringField();
  if (self->_playActivityQueueGroupingID)
    PBDataWriterWriteStringField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_containerType;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[_MPCProtoContainerIdentifierSet copyWithZone:](self->_identifierSet, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_items;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v20);
        -[_MPCProtoContainer addItem:]((uint64_t)v6, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v15 = -[NSString copyWithZone:](self->_playActivityFeatureName, "copyWithZone:", a3);
  v16 = (void *)v6[4];
  v6[4] = v15;

  v17 = -[NSString copyWithZone:](self->_playActivityQueueGroupingID, "copyWithZone:", a3);
  v18 = (void *)v6[5];
  v6[5] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MPCProtoContainerIdentifierSet *identifierSet;
  NSMutableArray *items;
  NSString *playActivityFeatureName;
  NSString *playActivityQueueGroupingID;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_containerType != *((_DWORD *)v4 + 2))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  identifierSet = self->_identifierSet;
  if ((unint64_t)identifierSet | *((_QWORD *)v4 + 2)
    && !-[_MPCProtoContainerIdentifierSet isEqual:](identifierSet, "isEqual:"))
  {
    goto LABEL_15;
  }
  items = self->_items;
  if ((unint64_t)items | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](items, "isEqual:"))
      goto LABEL_15;
  }
  playActivityFeatureName = self->_playActivityFeatureName;
  if ((unint64_t)playActivityFeatureName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](playActivityFeatureName, "isEqual:"))
      goto LABEL_15;
  }
  playActivityQueueGroupingID = self->_playActivityQueueGroupingID;
  if ((unint64_t)playActivityQueueGroupingID | *((_QWORD *)v4 + 5))
    v9 = -[NSString isEqual:](playActivityQueueGroupingID, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_containerType;
  else
    v3 = 0;
  v4 = -[_MPCProtoContainerIdentifierSet hash](self->_identifierSet, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_items, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_playActivityFeatureName, "hash");
  return v6 ^ -[NSString hash](self->_playActivityQueueGroupingID, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playActivityQueueGroupingID, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_identifierSet, 0);
}

- (void)addItem:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

@end
