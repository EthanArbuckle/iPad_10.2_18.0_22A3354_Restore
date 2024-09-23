@implementation NTPBArticleListRecord

- (void)dealloc
{
  objc_super v3;

  -[NTPBArticleListRecord setBase:](self, "setBase:", 0);
  -[NTPBArticleListRecord setArticleIDs:](self, "setArticleIDs:", 0);
  -[NTPBArticleListRecord setMetadata:](self, "setMetadata:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleListRecord;
  -[NTPBArticleListRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
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

- (void)clearArticleIDs
{
  -[NSMutableArray removeAllObjects](self->_articleIDs, "removeAllObjects");
}

- (void)addArticleIDs:(id)a3
{
  NSMutableArray *articleIDs;

  articleIDs = self->_articleIDs;
  if (!articleIDs)
  {
    articleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_articleIDs = articleIDs;
  }
  -[NSMutableArray addObject:](articleIDs, "addObject:", a3);
}

- (unint64_t)articleIDsCount
{
  return -[NSMutableArray count](self->_articleIDs, "count");
}

- (id)articleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_articleIDs, "objectAtIndex:", a3);
}

+ (Class)articleIDsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleListRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBArticleListRecord description](&v3, sel_description), -[NTPBArticleListRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSMutableArray *articleIDs;
  NSString *metadata;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_type), CFSTR("type"));
  articleIDs = self->_articleIDs;
  if (articleIDs)
    objc_msgSend(v3, "setObject:forKey:", articleIDs, CFSTR("article_IDs"));
  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v3, "setObject:forKey:", metadata, CFSTR("metadata"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleListRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *articleIDs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  articleIDs = self->_articleIDs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleIDs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(articleIDs);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleIDs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  if (self->_metadata)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *articleIDs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  articleIDs = self->_articleIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleIDs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(articleIDs);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addArticleIDs:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleIDs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_metadata, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSMutableArray *articleIDs;
  NSString *metadata;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 2)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_type != *((_DWORD *)a3 + 8))
          goto LABEL_13;
      }
      else if ((*((_BYTE *)a3 + 36) & 1) != 0)
      {
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
      articleIDs = self->_articleIDs;
      if (!((unint64_t)articleIDs | *((_QWORD *)a3 + 1))
        || (v5 = -[NSMutableArray isEqual:](articleIDs, "isEqual:")) != 0)
      {
        metadata = self->_metadata;
        if ((unint64_t)metadata | *((_QWORD *)a3 + 3))
          LOBYTE(v5) = -[NSString isEqual:](metadata, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_type;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSMutableArray hash](self->_articleIDs, "hash");
  return v5 ^ v6 ^ -[NSString hash](self->_metadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBRecordBase *base;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  base = self->_base;
  v6 = *((_QWORD *)a3 + 2);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBArticleListRecord setBase:](self, "setBase:");
  }
  if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    self->_type = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[NTPBArticleListRecord addArticleIDs:](self, "addArticleIDs:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  if (*((_QWORD *)a3 + 3))
    -[NTPBArticleListRecord setMetadata:](self, "setMetadata:");
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)articleIDs
{
  return self->_articleIDs;
}

- (void)setArticleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
