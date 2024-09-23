@implementation NTPBWidgetSectionConfigRecord

- (void)dealloc
{
  objc_super v3;

  -[NTPBWidgetSectionConfigRecord setBase:](self, "setBase:", 0);
  -[NTPBWidgetSectionConfigRecord setConfiguration2:](self, "setConfiguration2:", 0);
  -[NTPBWidgetSectionConfigRecord setArticleListIDs2s:](self, "setArticleListIDs2s:", 0);
  -[NTPBWidgetSectionConfigRecord setArticleIDs2s:](self, "setArticleIDs2s:", 0);
  -[NTPBWidgetSectionConfigRecord setSingleTagConfiguration:](self, "setSingleTagConfiguration:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBWidgetSectionConfigRecord;
  -[NTPBWidgetSectionConfigRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasConfiguration2
{
  return self->_configuration2 != 0;
}

- (void)clearArticleListIDs2s
{
  -[NSMutableArray removeAllObjects](self->_articleListIDs2s, "removeAllObjects");
}

- (void)addArticleListIDs2:(id)a3
{
  NSMutableArray *articleListIDs2s;

  articleListIDs2s = self->_articleListIDs2s;
  if (!articleListIDs2s)
  {
    articleListIDs2s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_articleListIDs2s = articleListIDs2s;
  }
  -[NSMutableArray addObject:](articleListIDs2s, "addObject:", a3);
}

- (unint64_t)articleListIDs2sCount
{
  return -[NSMutableArray count](self->_articleListIDs2s, "count");
}

- (id)articleListIDs2AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_articleListIDs2s, "objectAtIndex:", a3);
}

+ (Class)articleListIDs2Type
{
  return (Class)objc_opt_class();
}

- (void)clearArticleIDs2s
{
  -[NSMutableArray removeAllObjects](self->_articleIDs2s, "removeAllObjects");
}

- (void)addArticleIDs2:(id)a3
{
  NSMutableArray *articleIDs2s;

  articleIDs2s = self->_articleIDs2s;
  if (!articleIDs2s)
  {
    articleIDs2s = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_articleIDs2s = articleIDs2s;
  }
  -[NSMutableArray addObject:](articleIDs2s, "addObject:", a3);
}

- (unint64_t)articleIDs2sCount
{
  return -[NSMutableArray count](self->_articleIDs2s, "count");
}

- (id)articleIDs2AtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_articleIDs2s, "objectAtIndex:", a3);
}

+ (Class)articleIDs2Type
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSingleTagConfiguration
{
  return self->_singleTagConfiguration != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBWidgetSectionConfigRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBWidgetSectionConfigRecord description](&v3, sel_description), -[NTPBWidgetSectionConfigRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *configuration2;
  NSMutableArray *articleListIDs2s;
  NSMutableArray *articleIDs2s;
  NSString *singleTagConfiguration;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  configuration2 = self->_configuration2;
  if (configuration2)
    objc_msgSend(v3, "setObject:forKey:", configuration2, CFSTR("configuration2"));
  articleListIDs2s = self->_articleListIDs2s;
  if (articleListIDs2s)
    objc_msgSend(v3, "setObject:forKey:", articleListIDs2s, CFSTR("articleListIDs2"));
  articleIDs2s = self->_articleIDs2s;
  if (articleIDs2s)
    objc_msgSend(v3, "setObject:forKey:", articleIDs2s, CFSTR("articleIDs2"));
  singleTagConfiguration = self->_singleTagConfiguration;
  if (singleTagConfiguration)
    objc_msgSend(v3, "setObject:forKey:", singleTagConfiguration, CFSTR("singleTagConfiguration"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWidgetSectionConfigRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *articleListIDs2s;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *articleIDs2s;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_configuration2)
    PBDataWriterWriteStringField();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  articleListIDs2s = self->_articleListIDs2s;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleListIDs2s, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(articleListIDs2s);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleListIDs2s, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  articleIDs2s = self->_articleIDs2s;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleIDs2s, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(articleIDs2s);
        PBDataWriterWriteStringField();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleIDs2s, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }
  if (self->_singleTagConfiguration)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *articleListIDs2s;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *articleIDs2s;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
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
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[3] = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  v5[4] = (id)-[NSString copyWithZone:](self->_configuration2, "copyWithZone:", a3);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  articleListIDs2s = self->_articleListIDs2s;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleListIDs2s, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(articleListIDs2s);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addArticleListIDs2:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleListIDs2s, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  articleIDs2s = self->_articleIDs2s;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleIDs2s, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(articleIDs2s);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend(v5, "addArticleIDs2:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articleIDs2s, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  v5[5] = (id)-[NSString copyWithZone:](self->_singleTagConfiguration, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSString *configuration2;
  NSMutableArray *articleListIDs2s;
  NSMutableArray *articleIDs2s;
  NSString *singleTagConfiguration;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 3)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      configuration2 = self->_configuration2;
      if (!((unint64_t)configuration2 | *((_QWORD *)a3 + 4))
        || (v5 = -[NSString isEqual:](configuration2, "isEqual:")) != 0)
      {
        articleListIDs2s = self->_articleListIDs2s;
        if (!((unint64_t)articleListIDs2s | *((_QWORD *)a3 + 2))
          || (v5 = -[NSMutableArray isEqual:](articleListIDs2s, "isEqual:")) != 0)
        {
          articleIDs2s = self->_articleIDs2s;
          if (!((unint64_t)articleIDs2s | *((_QWORD *)a3 + 1))
            || (v5 = -[NSMutableArray isEqual:](articleIDs2s, "isEqual:")) != 0)
          {
            singleTagConfiguration = self->_singleTagConfiguration;
            if ((unint64_t)singleTagConfiguration | *((_QWORD *)a3 + 5))
              LOBYTE(v5) = -[NSString isEqual:](singleTagConfiguration, "isEqual:");
            else
              LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  v4 = -[NSString hash](self->_configuration2, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_articleListIDs2s, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_articleIDs2s, "hash");
  return v6 ^ -[NSString hash](self->_singleTagConfiguration, "hash");
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
  void *v12;
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
  base = self->_base;
  v6 = *((_QWORD *)a3 + 3);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBWidgetSectionConfigRecord setBase:](self, "setBase:");
  }
  if (*((_QWORD *)a3 + 4))
    -[NTPBWidgetSectionConfigRecord setConfiguration2:](self, "setConfiguration2:");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 2);
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
        -[NTPBWidgetSectionConfigRecord addArticleListIDs2:](self, "addArticleListIDs2:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 1);
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
        -[NTPBWidgetSectionConfigRecord addArticleIDs2:](self, "addArticleIDs2:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }
  if (*((_QWORD *)a3 + 5))
    -[NTPBWidgetSectionConfigRecord setSingleTagConfiguration:](self, "setSingleTagConfiguration:");
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)configuration2
{
  return self->_configuration2;
}

- (void)setConfiguration2:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)articleListIDs2s
{
  return self->_articleListIDs2s;
}

- (void)setArticleListIDs2s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)articleIDs2s
{
  return self->_articleIDs2s;
}

- (void)setArticleIDs2s:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)singleTagConfiguration
{
  return self->_singleTagConfiguration;
}

- (void)setSingleTagConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
