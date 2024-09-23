@implementation NTPBTodayWidgetSession

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayWidgetSession;
  -[NTPBTodayWidgetSession dealloc](&v3, sel_dealloc);
}

- (void)setWidgetArticleCount:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_widgetArticleCount = a3;
}

- (void)setHasWidgetArticleCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWidgetArticleCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWidgetSectionsExposed:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_widgetSectionsExposed = a3;
}

- (void)setHasWidgetSectionsExposed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidgetSectionsExposed
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unint64_t)countOfArticlesExposedPerSectionsCount
{
  return self->_countOfArticlesExposedPerSections.count;
}

- (int)countOfArticlesExposedPerSections
{
  return self->_countOfArticlesExposedPerSections.list;
}

- (void)clearCountOfArticlesExposedPerSections
{
  PBRepeatedInt32Clear();
}

- (void)addCountOfArticlesExposedPerSection:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)countOfArticlesExposedPerSectionAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_countOfArticlesExposedPerSections;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_countOfArticlesExposedPerSections = &self->_countOfArticlesExposedPerSections;
  count = self->_countOfArticlesExposedPerSections.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_countOfArticlesExposedPerSections->list[a3];
}

- (void)setCountOfArticlesExposedPerSections:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)clearWidgetSectionIdsExposeds
{
  -[NSMutableArray removeAllObjects](self->_widgetSectionIdsExposeds, "removeAllObjects");
}

- (void)addWidgetSectionIdsExposed:(id)a3
{
  id v4;
  NSMutableArray *widgetSectionIdsExposeds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  widgetSectionIdsExposeds = self->_widgetSectionIdsExposeds;
  v8 = v4;
  if (!widgetSectionIdsExposeds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_widgetSectionIdsExposeds;
    self->_widgetSectionIdsExposeds = v6;

    v4 = v8;
    widgetSectionIdsExposeds = self->_widgetSectionIdsExposeds;
  }
  -[NSMutableArray addObject:](widgetSectionIdsExposeds, "addObject:", v4);

}

- (unint64_t)widgetSectionIdsExposedsCount
{
  return -[NSMutableArray count](self->_widgetSectionIdsExposeds, "count");
}

- (id)widgetSectionIdsExposedAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_widgetSectionIdsExposeds, "objectAtIndex:", a3);
}

+ (Class)widgetSectionIdsExposedType
{
  return (Class)objc_opt_class();
}

- (void)clearCountOfArticlesExposedEachSections
{
  -[NSMutableArray removeAllObjects](self->_countOfArticlesExposedEachSections, "removeAllObjects");
}

- (void)addCountOfArticlesExposedEachSection:(id)a3
{
  id v4;
  NSMutableArray *countOfArticlesExposedEachSections;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  countOfArticlesExposedEachSections = self->_countOfArticlesExposedEachSections;
  v8 = v4;
  if (!countOfArticlesExposedEachSections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_countOfArticlesExposedEachSections;
    self->_countOfArticlesExposedEachSections = v6;

    v4 = v8;
    countOfArticlesExposedEachSections = self->_countOfArticlesExposedEachSections;
  }
  -[NSMutableArray addObject:](countOfArticlesExposedEachSections, "addObject:", v4);

}

- (unint64_t)countOfArticlesExposedEachSectionsCount
{
  return -[NSMutableArray count](self->_countOfArticlesExposedEachSections, "count");
}

- (id)countOfArticlesExposedEachSectionAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_countOfArticlesExposedEachSections, "objectAtIndex:", a3);
}

+ (Class)countOfArticlesExposedEachSectionType
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
  v8.super_class = (Class)NTPBTodayWidgetSession;
  -[NTPBTodayWidgetSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTodayWidgetSession dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  NSMutableArray *widgetSectionIdsExposeds;
  NSMutableArray *countOfArticlesExposedEachSections;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("widget_article_count"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetSectionsExposed);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("widget_sections_exposed"));

  }
  PBRepeatedInt32NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("count_of_articles_exposed_per_section"));

  widgetSectionIdsExposeds = self->_widgetSectionIdsExposeds;
  if (widgetSectionIdsExposeds)
    objc_msgSend(v3, "setObject:forKey:", widgetSectionIdsExposeds, CFSTR("widget_section_ids_exposed"));
  countOfArticlesExposedEachSections = self->_countOfArticlesExposedEachSections;
  if (countOfArticlesExposedEachSections)
    objc_msgSend(v3, "setObject:forKey:", countOfArticlesExposedEachSections, CFSTR("count_of_articles_exposed_each_section"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayWidgetSessionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableArray *v12;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_countOfArticlesExposedPerSections.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_countOfArticlesExposedPerSections.count);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_widgetSectionIdsExposeds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
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
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = self->_countOfArticlesExposedEachSections;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
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
        PBDataWriterWriteStringField();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_widgetArticleCount;
    *(_BYTE *)(v5 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_widgetSectionsExposed;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  PBRepeatedInt32Copy();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_widgetSectionIdsExposeds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addWidgetSectionIdsExposed:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_countOfArticlesExposedEachSections;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend(v6, "addCountOfArticlesExposedEachSection:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *widgetSectionIdsExposeds;
  NSMutableArray *countOfArticlesExposedEachSections;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_widgetArticleCount != *((_DWORD *)v4 + 10))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_widgetSectionsExposed != *((_DWORD *)v4 + 14))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_17;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_17;
  widgetSectionIdsExposeds = self->_widgetSectionIdsExposeds;
  if ((unint64_t)widgetSectionIdsExposeds | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](widgetSectionIdsExposeds, "isEqual:"))
      goto LABEL_17;
  }
  countOfArticlesExposedEachSections = self->_countOfArticlesExposedEachSections;
  if ((unint64_t)countOfArticlesExposedEachSections | *((_QWORD *)v4 + 4))
    v7 = -[NSMutableArray isEqual:](countOfArticlesExposedEachSections, "isEqual:");
  else
    v7 = 1;
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761 * self->_widgetArticleCount;
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
  v4 = 2654435761 * self->_widgetSectionsExposed;
LABEL_6:
  v5 = v4 ^ v3 ^ PBRepeatedInt32Hash();
  v6 = v5 ^ -[NSMutableArray hash](self->_widgetSectionIdsExposeds, "hash");
  return v6 ^ -[NSMutableArray hash](self->_countOfArticlesExposedEachSections, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
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
  v4 = a3;
  v5 = (id *)v4;
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 1) != 0)
  {
    self->_widgetArticleCount = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 60);
  }
  if ((v6 & 2) != 0)
  {
    self->_widgetSectionsExposed = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 2u;
  }
  v7 = objc_msgSend(v4, "countOfArticlesExposedPerSectionsCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[NTPBTodayWidgetSession addCountOfArticlesExposedPerSection:](self, "addCountOfArticlesExposedPerSection:", objc_msgSend(v5, "countOfArticlesExposedPerSectionAtIndex:", i));
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v5[6];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        -[NTPBTodayWidgetSession addWidgetSectionIdsExposed:](self, "addWidgetSectionIdsExposed:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v5[4];
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        -[NTPBTodayWidgetSession addCountOfArticlesExposedEachSection:](self, "addCountOfArticlesExposedEachSection:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * k), (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (int)widgetArticleCount
{
  return self->_widgetArticleCount;
}

- (int)widgetSectionsExposed
{
  return self->_widgetSectionsExposed;
}

- (NSMutableArray)widgetSectionIdsExposeds
{
  return self->_widgetSectionIdsExposeds;
}

- (void)setWidgetSectionIdsExposeds:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSectionIdsExposeds, a3);
}

- (NSMutableArray)countOfArticlesExposedEachSections
{
  return self->_countOfArticlesExposedEachSections;
}

- (void)setCountOfArticlesExposedEachSections:(id)a3
{
  objc_storeStrong((id *)&self->_countOfArticlesExposedEachSections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSectionIdsExposeds, 0);
  objc_storeStrong((id *)&self->_countOfArticlesExposedEachSections, 0);
}

@end
