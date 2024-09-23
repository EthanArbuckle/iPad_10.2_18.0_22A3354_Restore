@implementation ACHCodableAchievementProgressUpdateArray

- (void)clearAchievementProgressUpdates
{
  -[NSMutableArray removeAllObjects](self->_achievementProgressUpdates, "removeAllObjects");
}

- (void)addAchievementProgressUpdate:(id)a3
{
  id v4;
  NSMutableArray *achievementProgressUpdates;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  achievementProgressUpdates = self->_achievementProgressUpdates;
  v8 = v4;
  if (!achievementProgressUpdates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_achievementProgressUpdates;
    self->_achievementProgressUpdates = v6;

    v4 = v8;
    achievementProgressUpdates = self->_achievementProgressUpdates;
  }
  -[NSMutableArray addObject:](achievementProgressUpdates, "addObject:", v4);

}

- (unint64_t)achievementProgressUpdatesCount
{
  return -[NSMutableArray count](self->_achievementProgressUpdates, "count");
}

- (id)achievementProgressUpdateAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_achievementProgressUpdates, "objectAtIndex:", a3);
}

+ (Class)achievementProgressUpdateType
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
  v8.super_class = (Class)ACHCodableAchievementProgressUpdateArray;
  -[ACHCodableAchievementProgressUpdateArray description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableAchievementProgressUpdateArray dictionaryRepresentation](self, "dictionaryRepresentation");
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
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_achievementProgressUpdates, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_achievementProgressUpdates, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_achievementProgressUpdates;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("achievementProgressUpdate"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableAchievementProgressUpdateArrayReadFrom(self, (uint64_t)a3);
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
  v5 = self->_achievementProgressUpdates;
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

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  if (-[ACHCodableAchievementProgressUpdateArray achievementProgressUpdatesCount](self, "achievementProgressUpdatesCount"))
  {
    objc_msgSend(v8, "clearAchievementProgressUpdates");
    v4 = -[ACHCodableAchievementProgressUpdateArray achievementProgressUpdatesCount](self, "achievementProgressUpdatesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ACHCodableAchievementProgressUpdateArray achievementProgressUpdateAtIndex:](self, "achievementProgressUpdateAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAchievementProgressUpdate:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_achievementProgressUpdates;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend(v5, "addAchievementProgressUpdate:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *achievementProgressUpdates;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    achievementProgressUpdates = self->_achievementProgressUpdates;
    if ((unint64_t)achievementProgressUpdates | v4[1])
      v6 = -[NSMutableArray isEqual:](achievementProgressUpdates, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_achievementProgressUpdates, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *((id *)a3 + 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[ACHCodableAchievementProgressUpdateArray addAchievementProgressUpdate:](self, "addAchievementProgressUpdate:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSMutableArray)achievementProgressUpdates
{
  return self->_achievementProgressUpdates;
}

- (void)setAchievementProgressUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_achievementProgressUpdates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achievementProgressUpdates, 0);
}

- (ACHCodableAchievementProgressUpdateArray)initWithSerializedData:(id)a3 error:(id *)a4
{
  id v5;
  ACHCodableAchievementProgressUpdateArray *v6;

  v5 = a3;
  v6 = -[ACHCodableAchievementProgressUpdateArray initWithData:]([ACHCodableAchievementProgressUpdateArray alloc], "initWithData:", v5);

  return v6;
}

@end
