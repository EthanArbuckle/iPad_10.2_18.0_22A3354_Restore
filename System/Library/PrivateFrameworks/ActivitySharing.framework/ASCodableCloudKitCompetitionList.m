@implementation ASCodableCloudKitCompetitionList

- (void)clearCompetitions
{
  -[NSMutableArray removeAllObjects](self->_competitions, "removeAllObjects");
}

- (void)addCompetitions:(id)a3
{
  id v4;
  NSMutableArray *competitions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  competitions = self->_competitions;
  v8 = v4;
  if (!competitions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_competitions;
    self->_competitions = v6;

    v4 = v8;
    competitions = self->_competitions;
  }
  -[NSMutableArray addObject:](competitions, "addObject:", v4);

}

- (unint64_t)competitionsCount
{
  return -[NSMutableArray count](self->_competitions, "count");
}

- (id)competitionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_competitions, "objectAtIndex:", a3);
}

+ (Class)competitionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (void)setType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)ASCodableCloudKitCompetitionList;
  -[ASCodableCloudKitCompetitionList description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitCompetitionList dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSData *friendUUID;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_competitions, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_competitions, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_competitions;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("competitions"));
  }
  friendUUID = self->_friendUUID;
  if (friendUUID)
    objc_msgSend(v3, "setObject:forKey:", friendUUID, CFSTR("friendUUID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_type);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("type"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableCloudKitCompetitionListReadFrom((uint64_t)self, (uint64_t)a3);
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_competitions;
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

  if (self->_friendUUID)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ASCodableCloudKitCompetitionList competitionsCount](self, "competitionsCount"))
  {
    objc_msgSend(v8, "clearCompetitions");
    v4 = -[ASCodableCloudKitCompetitionList competitionsCount](self, "competitionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ASCodableCloudKitCompetitionList competitionsAtIndex:](self, "competitionsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addCompetitions:", v7);

      }
    }
  }
  if (self->_friendUUID)
    objc_msgSend(v8, "setFriendUUID:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v8 + 1) = self->_type;
    *((_BYTE *)v8 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_competitions;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend((id)v5, "addCompetitions:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = -[NSData copyWithZone:](self->_friendUUID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_type;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *competitions;
  NSData *friendUUID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  competitions = self->_competitions;
  if ((unint64_t)competitions | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](competitions, "isEqual:"))
      goto LABEL_10;
  }
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](friendUUID, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_type == *((_QWORD *)v4 + 1))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSMutableArray hash](self->_competitions, "hash");
  v4 = -[NSData hash](self->_friendUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_type;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *((id *)v4 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[ASCodableCloudKitCompetitionList addCompetitions:](self, "addCompetitions:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 3))
    -[ASCodableCloudKitCompetitionList setFriendUUID:](self, "setFriendUUID:");
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_type = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSMutableArray)competitions
{
  return self->_competitions;
}

- (void)setCompetitions:(id)a3
{
  objc_storeStrong((id *)&self->_competitions, a3);
}

- (NSData)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_friendUUID, 0);
  objc_storeStrong((id *)&self->_competitions, 0);
}

@end
