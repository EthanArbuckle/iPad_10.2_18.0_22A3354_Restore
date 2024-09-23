@implementation NTPBWidgetSectionsArticleCountPair

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBWidgetSectionsArticleCountPair;
  -[NTPBWidgetSectionsArticleCountPair dealloc](&v3, sel_dealloc);
}

- (BOOL)hasWidgetSectionIdsExposed
{
  return self->_widgetSectionIdsExposed != 0;
}

- (unint64_t)countOfArticlesExposedEachSectionsCount
{
  return self->_countOfArticlesExposedEachSections.count;
}

- (int64_t)countOfArticlesExposedEachSections
{
  return self->_countOfArticlesExposedEachSections.list;
}

- (void)clearCountOfArticlesExposedEachSections
{
  PBRepeatedInt64Clear();
}

- (void)addCountOfArticlesExposedEachSection:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)countOfArticlesExposedEachSectionAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_countOfArticlesExposedEachSections;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_countOfArticlesExposedEachSections = &self->_countOfArticlesExposedEachSections;
  count = self->_countOfArticlesExposedEachSections.count;
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
  return p_countOfArticlesExposedEachSections->list[a3];
}

- (void)setCountOfArticlesExposedEachSections:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (BOOL)hasWidgetSectionSubidsExposed
{
  return self->_widgetSectionSubidsExposed != 0;
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
  v8.super_class = (Class)NTPBWidgetSectionsArticleCountPair;
  -[NTPBWidgetSectionsArticleCountPair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBWidgetSectionsArticleCountPair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *widgetSectionIdsExposed;
  void *v6;
  NSString *widgetSectionSubidsExposed;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  widgetSectionIdsExposed = self->_widgetSectionIdsExposed;
  if (widgetSectionIdsExposed)
    objc_msgSend(v3, "setObject:forKey:", widgetSectionIdsExposed, CFSTR("widget_section_ids_exposed"));
  PBRepeatedInt64NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("count_of_articles_exposed_each_section"));

  widgetSectionSubidsExposed = self->_widgetSectionSubidsExposed;
  if (widgetSectionSubidsExposed)
    objc_msgSend(v4, "setObject:forKey:", widgetSectionSubidsExposed, CFSTR("widget_section_subids_exposed"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWidgetSectionsArticleCountPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_widgetSectionIdsExposed)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_countOfArticlesExposedEachSections.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_countOfArticlesExposedEachSections.count);
  }
  if (self->_widgetSectionSubidsExposed)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_widgetSectionIdsExposed, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  PBRepeatedInt64Copy();
  v8 = -[NSString copyWithZone:](self->_widgetSectionSubidsExposed, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *widgetSectionIdsExposed;
  NSString *widgetSectionSubidsExposed;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((widgetSectionIdsExposed = self->_widgetSectionIdsExposed, !((unint64_t)widgetSectionIdsExposed | v4[4]))
     || -[NSString isEqual:](widgetSectionIdsExposed, "isEqual:"))
    && PBRepeatedInt64IsEqual())
  {
    widgetSectionSubidsExposed = self->_widgetSectionSubidsExposed;
    if ((unint64_t)widgetSectionSubidsExposed | v4[5])
      v7 = -[NSString isEqual:](widgetSectionSubidsExposed, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_widgetSectionIdsExposed, "hash");
  v4 = PBRepeatedInt64Hash() ^ v3;
  return v4 ^ -[NSString hash](self->_widgetSectionSubidsExposed, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[4])
  {
    -[NTPBWidgetSectionsArticleCountPair setWidgetSectionIdsExposed:](self, "setWidgetSectionIdsExposed:");
    v4 = v9;
  }
  v5 = objc_msgSend(v4, "countOfArticlesExposedEachSectionsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[NTPBWidgetSectionsArticleCountPair addCountOfArticlesExposedEachSection:](self, "addCountOfArticlesExposedEachSection:", objc_msgSend(v9, "countOfArticlesExposedEachSectionAtIndex:", i));
  }
  v8 = v9;
  if (v9[5])
  {
    -[NTPBWidgetSectionsArticleCountPair setWidgetSectionSubidsExposed:](self, "setWidgetSectionSubidsExposed:");
    v8 = v9;
  }

}

- (NSString)widgetSectionIdsExposed
{
  return self->_widgetSectionIdsExposed;
}

- (void)setWidgetSectionIdsExposed:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSectionIdsExposed, a3);
}

- (NSString)widgetSectionSubidsExposed
{
  return self->_widgetSectionSubidsExposed;
}

- (void)setWidgetSectionSubidsExposed:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSectionSubidsExposed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSectionSubidsExposed, 0);
  objc_storeStrong((id *)&self->_widgetSectionIdsExposed, 0);
}

@end
