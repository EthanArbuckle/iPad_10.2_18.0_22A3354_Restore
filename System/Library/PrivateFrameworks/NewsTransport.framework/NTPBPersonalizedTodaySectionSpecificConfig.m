@implementation NTPBPersonalizedTodaySectionSpecificConfig

- (void)dealloc
{
  objc_super v3;

  -[NTPBPersonalizedTodaySectionSpecificConfig setMandatoryArticles:](self, "setMandatoryArticles:", 0);
  -[NTPBPersonalizedTodaySectionSpecificConfig setPersonalizedArticles:](self, "setPersonalizedArticles:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizedTodaySectionSpecificConfig;
  -[NTPBPersonalizedTodaySectionSpecificConfig dealloc](&v3, sel_dealloc);
}

- (void)clearMandatoryArticles
{
  -[NSMutableArray removeAllObjects](self->_mandatoryArticles, "removeAllObjects");
}

- (void)addMandatoryArticles:(id)a3
{
  NSMutableArray *mandatoryArticles;

  mandatoryArticles = self->_mandatoryArticles;
  if (!mandatoryArticles)
  {
    mandatoryArticles = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_mandatoryArticles = mandatoryArticles;
  }
  -[NSMutableArray addObject:](mandatoryArticles, "addObject:", a3);
}

- (unint64_t)mandatoryArticlesCount
{
  return -[NSMutableArray count](self->_mandatoryArticles, "count");
}

- (id)mandatoryArticlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_mandatoryArticles, "objectAtIndex:", a3);
}

+ (Class)mandatoryArticlesType
{
  return (Class)objc_opt_class();
}

- (void)clearPersonalizedArticles
{
  -[NSMutableArray removeAllObjects](self->_personalizedArticles, "removeAllObjects");
}

- (void)addPersonalizedArticles:(id)a3
{
  NSMutableArray *personalizedArticles;

  personalizedArticles = self->_personalizedArticles;
  if (!personalizedArticles)
  {
    personalizedArticles = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_personalizedArticles = personalizedArticles;
  }
  -[NSMutableArray addObject:](personalizedArticles, "addObject:", a3);
}

- (unint64_t)personalizedArticlesCount
{
  return -[NSMutableArray count](self->_personalizedArticles, "count");
}

- (id)personalizedArticlesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_personalizedArticles, "objectAtIndex:", a3);
}

+ (Class)personalizedArticlesType
{
  return (Class)objc_opt_class();
}

- (void)setMaxArticlesShown:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_maxArticlesShown = a3;
}

- (void)setHasMaxArticlesShown:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxArticlesShown
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizedTodaySectionSpecificConfig;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPersonalizedTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBPersonalizedTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *mandatoryArticles;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableArray *personalizedArticles;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if (-[NSMutableArray count](self->_mandatoryArticles, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_mandatoryArticles, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    mandatoryArticles = self->_mandatoryArticles;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mandatoryArticles, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(mandatoryArticles);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mandatoryArticles, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("mandatory_articles"));

  }
  if (-[NSMutableArray count](self->_personalizedArticles, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_personalizedArticles, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    personalizedArticles = self->_personalizedArticles;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](personalizedArticles, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(personalizedArticles);
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](personalizedArticles, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v13);
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("personalized_articles"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maxArticlesShown), CFSTR("max_articles_shown"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizedTodaySectionSpecificConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *mandatoryArticles;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *personalizedArticles;
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
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  mandatoryArticles = self->_mandatoryArticles;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mandatoryArticles, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(mandatoryArticles);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mandatoryArticles, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  personalizedArticles = self->_personalizedArticles;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](personalizedArticles, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(personalizedArticles);
        PBDataWriterWriteSubmessage();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](personalizedArticles, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *mandatoryArticles;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *personalizedArticles;
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
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  mandatoryArticles = self->_mandatoryArticles;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mandatoryArticles, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(mandatoryArticles);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMandatoryArticles:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mandatoryArticles, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  personalizedArticles = self->_personalizedArticles;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](personalizedArticles, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(personalizedArticles);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPersonalizedArticles:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](personalizedArticles, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_maxArticlesShown;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *mandatoryArticles;
  NSMutableArray *personalizedArticles;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    mandatoryArticles = self->_mandatoryArticles;
    if (!((unint64_t)mandatoryArticles | *((_QWORD *)a3 + 2))
      || (v5 = -[NSMutableArray isEqual:](mandatoryArticles, "isEqual:")) != 0)
    {
      personalizedArticles = self->_personalizedArticles;
      if (!((unint64_t)personalizedArticles | *((_QWORD *)a3 + 3))
        || (v5 = -[NSMutableArray isEqual:](personalizedArticles, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 1) == 0;
        if ((*(_BYTE *)&self->_has & 1) != 0)
          LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 1) != 0 && self->_maxArticlesShown == *((_QWORD *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSMutableArray hash](self->_mandatoryArticles, "hash");
  v4 = -[NSMutableArray hash](self->_personalizedArticles, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761u * self->_maxArticlesShown;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
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
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 2);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[NTPBPersonalizedTodaySectionSpecificConfig addMandatoryArticles:](self, "addMandatoryArticles:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)*((_QWORD *)a3 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[NTPBPersonalizedTodaySectionSpecificConfig addPersonalizedArticles:](self, "addPersonalizedArticles:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }
  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_maxArticlesShown = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSMutableArray)mandatoryArticles
{
  return self->_mandatoryArticles;
}

- (void)setMandatoryArticles:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)personalizedArticles
{
  return self->_personalizedArticles;
}

- (void)setPersonalizedArticles:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)maxArticlesShown
{
  return self->_maxArticlesShown;
}

@end
