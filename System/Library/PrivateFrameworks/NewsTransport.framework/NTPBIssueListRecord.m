@implementation NTPBIssueListRecord

- (void)dealloc
{
  objc_super v3;

  -[NTPBIssueListRecord setBase:](self, "setBase:", 0);
  -[NTPBIssueListRecord setIssueIDs:](self, "setIssueIDs:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueListRecord;
  -[NTPBIssueListRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)clearIssueIDs
{
  -[NSMutableArray removeAllObjects](self->_issueIDs, "removeAllObjects");
}

- (void)addIssueIDs:(id)a3
{
  NSMutableArray *issueIDs;

  issueIDs = self->_issueIDs;
  if (!issueIDs)
  {
    issueIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_issueIDs = issueIDs;
  }
  -[NSMutableArray addObject:](issueIDs, "addObject:", a3);
}

- (unint64_t)issueIDsCount
{
  return -[NSMutableArray count](self->_issueIDs, "count");
}

- (id)issueIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_issueIDs, "objectAtIndex:", a3);
}

+ (Class)issueIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueListRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBIssueListRecord description](&v3, sel_description), -[NTPBIssueListRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSMutableArray *issueIDs;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  issueIDs = self->_issueIDs;
  if (issueIDs)
    objc_msgSend(v3, "setObject:forKey:", issueIDs, CFSTR("issue_IDs"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueListRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *issueIDs;
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
  if (self->_base)
    PBDataWriterWriteSubmessage();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  issueIDs = self->_issueIDs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](issueIDs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_enumerationMutation(issueIDs);
        PBDataWriterWriteStringField();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](issueIDs, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *issueIDs;
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
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  issueIDs = self->_issueIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](issueIDs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(issueIDs);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addIssueIDs:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](issueIDs, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSMutableArray *issueIDs;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 1)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      issueIDs = self->_issueIDs;
      if ((unint64_t)issueIDs | *((_QWORD *)a3 + 2))
        LOBYTE(v5) = -[NSMutableArray isEqual:](issueIDs, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  return -[NSMutableArray hash](self->_issueIDs, "hash") ^ v3;
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
  v6 = *((_QWORD *)a3 + 1);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBIssueListRecord setBase:](self, "setBase:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 2);
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
        -[NTPBIssueListRecord addIssueIDs:](self, "addIssueIDs:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSMutableArray)issueIDs
{
  return self->_issueIDs;
}

- (void)setIssueIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
