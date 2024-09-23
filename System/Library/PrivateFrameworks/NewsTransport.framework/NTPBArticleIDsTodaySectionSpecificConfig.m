@implementation NTPBArticleIDsTodaySectionSpecificConfig

- (void)dealloc
{
  objc_super v3;

  -[NTPBArticleIDsTodaySectionSpecificConfig setArticles:](self, "setArticles:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleIDsTodaySectionSpecificConfig;
  -[NTPBArticleIDsTodaySectionSpecificConfig dealloc](&v3, sel_dealloc);
}

- (void)clearArticles
{
  -[NSMutableArray removeAllObjects](self->_articles, "removeAllObjects");
}

- (void)addArticles:(id)a3
{
  NSMutableArray *articles;

  articles = self->_articles;
  if (!articles)
  {
    articles = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_articles = articles;
  }
  -[NSMutableArray addObject:](articles, "addObject:", a3);
}

- (unint64_t)articlesCount
{
  return -[NSMutableArray count](self->_articles, "count");
}

- (id)articlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_articles, "objectAtIndex:", a3);
}

+ (Class)articlesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleIDsTodaySectionSpecificConfig;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBArticleIDsTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBArticleIDsTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *articles;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[NSMutableArray count](self->_articles, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_articles, "count"));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    articles = self->_articles;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(articles);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "dictionaryRepresentation"));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("articles"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleIDsTodaySectionSpecificConfigReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *articles;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  articles = self->_articles;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articles, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(articles);
        PBDataWriterWriteSubmessage();
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articles, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *articles;
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
  articles = self->_articles;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articles, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          objc_enumerationMutation(articles);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addArticles:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](articles, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *articles;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    articles = self->_articles;
    if ((unint64_t)articles | *((_QWORD *)a3 + 1))
      LOBYTE(v5) = -[NSMutableArray isEqual:](articles, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_articles, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v4;
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
  v4 = (void *)*((_QWORD *)a3 + 1);
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
        -[NTPBArticleIDsTodaySectionSpecificConfig addArticles:](self, "addArticles:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (NSMutableArray)articles
{
  return self->_articles;
}

- (void)setArticles:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
