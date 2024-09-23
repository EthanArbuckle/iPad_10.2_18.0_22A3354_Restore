@implementation NTPBTodayPersonalizationEvent

- (int)action
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_action;
  else
    return 1;
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAction
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (void)clearHeadlineTopics
{
  -[NSMutableArray removeAllObjects](self->_headlineTopics, "removeAllObjects");
}

- (void)addHeadlineTopics:(id)a3
{
  id v4;
  NSMutableArray *headlineTopics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  headlineTopics = self->_headlineTopics;
  v8 = v4;
  if (!headlineTopics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_headlineTopics;
    self->_headlineTopics = v6;

    v4 = v8;
    headlineTopics = self->_headlineTopics;
  }
  -[NSMutableArray addObject:](headlineTopics, "addObject:", v4);

}

- (unint64_t)headlineTopicsCount
{
  return -[NSMutableArray count](self->_headlineTopics, "count");
}

- (id)headlineTopicsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_headlineTopics, "objectAtIndex:", a3);
}

+ (Class)headlineTopicsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasHeadlinePublisher
{
  return self->_headlinePublisher != 0;
}

- (void)setCreatedAt:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_createdAt = a3;
}

- (void)setHasCreatedAt:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreatedAt
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setOrderInGroup:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_orderInGroup = a3;
}

- (void)setHasOrderInGroup:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOrderInGroup
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setOverallOrder:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_overallOrder = a3;
}

- (void)setHasOverallOrder:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOverallOrder
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSectionOrder:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_sectionOrder = a3;
}

- (void)setHasSectionOrder:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSectionOrder
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasPersonalizationSectionFeatureId
{
  return self->_personalizationSectionFeatureId != 0;
}

- (void)setGroupType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGroupType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)NTPBTodayPersonalizationEvent;
  -[NTPBTodayPersonalizationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTodayPersonalizationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *articleId;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSString *headlinePublisher;
  char has;
  void *v15;
  NSString *personalizationSectionFeatureId;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_action);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("action"));

  }
  articleId = self->_articleId;
  if (articleId)
    objc_msgSend(v3, "setObject:forKey:", articleId, CFSTR("article_id"));
  if (-[NSMutableArray count](self->_headlineTopics, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_headlineTopics, "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = self->_headlineTopics;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("headline_topics"));
  }
  headlinePublisher = self->_headlinePublisher;
  if (headlinePublisher)
    objc_msgSend(v3, "setObject:forKey:", headlinePublisher, CFSTR("headline_publisher"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_createdAt);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("created_at"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_18:
      if ((has & 8) == 0)
        goto LABEL_19;
      goto LABEL_28;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_orderInGroup, (_QWORD)v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("order_in_group"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_28:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_overallOrder, (_QWORD)v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("overall_order"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_sectionOrder, (_QWORD)v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("section_order"));

  }
LABEL_21:
  personalizationSectionFeatureId = self->_personalizationSectionFeatureId;
  if (personalizationSectionFeatureId)
    objc_msgSend(v3, "setObject:forKey:", personalizationSectionFeatureId, CFSTR("personalization_section_feature_id"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_groupType);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("group_type"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayPersonalizationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_articleId)
    PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_headlineTopics;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_headlinePublisher)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_16:
      if ((has & 8) == 0)
        goto LABEL_17;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_26:
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_18:
    PBDataWriterWriteInt64Field();
LABEL_19:
  if (self->_personalizationSectionFeatureId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  char has;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_action;
    *(_BYTE *)(v5 + 88) |= 0x20u;
  }
  v7 = -[NSString copyWithZone:](self->_articleId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v7;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = self->_headlineTopics;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v6, "addHeadlineTopics:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v15 = -[NSString copyWithZone:](self->_headlinePublisher, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v15;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_createdAt;
    *(_BYTE *)(v6 + 88) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 8) == 0)
        goto LABEL_13;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  *(_QWORD *)(v6 + 24) = self->_orderInGroup;
  *(_BYTE *)(v6 + 88) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_20:
  *(_QWORD *)(v6 + 32) = self->_overallOrder;
  *(_BYTE *)(v6 + 88) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *(_QWORD *)(v6 + 40) = self->_sectionOrder;
    *(_BYTE *)(v6 + 88) |= 0x10u;
  }
LABEL_15:
  v18 = -[NSString copyWithZone:](self->_personalizationSectionFeatureId, "copyWithZone:", a3, (_QWORD)v21);
  v19 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v18;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_groupType;
    *(_BYTE *)(v6 + 88) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *articleId;
  NSMutableArray *headlineTopics;
  NSString *headlinePublisher;
  char has;
  NSString *personalizationSectionFeatureId;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x20) == 0 || self->_action != *((_DWORD *)v4 + 12))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_40;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((_QWORD *)v4 + 7) && !-[NSString isEqual:](articleId, "isEqual:"))
    goto LABEL_40;
  headlineTopics = self->_headlineTopics;
  if ((unint64_t)headlineTopics | *((_QWORD *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](headlineTopics, "isEqual:"))
      goto LABEL_40;
  }
  headlinePublisher = self->_headlinePublisher;
  if ((unint64_t)headlinePublisher | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](headlinePublisher, "isEqual:"))
      goto LABEL_40;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_createdAt != *((double *)v4 + 1))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 4) == 0 || self->_orderInGroup != *((_QWORD *)v4 + 3))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 88) & 4) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 8) == 0 || self->_overallOrder != *((_QWORD *)v4 + 4))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 88) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 0x10) == 0 || self->_sectionOrder != *((_QWORD *)v4 + 5))
      goto LABEL_40;
  }
  else if ((*((_BYTE *)v4 + 88) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  personalizationSectionFeatureId = self->_personalizationSectionFeatureId;
  if ((unint64_t)personalizationSectionFeatureId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](personalizationSectionFeatureId, "isEqual:"))
    {
LABEL_40:
      v10 = 0;
      goto LABEL_41;
    }
    has = (char)self->_has;
  }
  v10 = (*((_BYTE *)v4 + 88) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 2) == 0 || self->_groupType != *((_QWORD *)v4 + 2))
      goto LABEL_40;
    v10 = 1;
  }
LABEL_41:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  char has;
  unint64_t v7;
  double createdAt;
  double v9;
  long double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v18;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v18 = 2654435761 * self->_action;
  else
    v18 = 0;
  v3 = -[NSString hash](self->_articleId, "hash");
  v4 = -[NSMutableArray hash](self->_headlineTopics, "hash");
  v5 = -[NSString hash](self->_headlinePublisher, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    createdAt = self->_createdAt;
    v9 = -createdAt;
    if (createdAt >= 0.0)
      v9 = self->_createdAt;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 4) == 0)
  {
    v12 = 0;
    if ((has & 8) != 0)
      goto LABEL_14;
LABEL_17:
    v13 = 0;
    if ((has & 0x10) != 0)
      goto LABEL_15;
    goto LABEL_18;
  }
  v12 = 2654435761 * self->_orderInGroup;
  if ((has & 8) == 0)
    goto LABEL_17;
LABEL_14:
  v13 = 2654435761 * self->_overallOrder;
  if ((has & 0x10) != 0)
  {
LABEL_15:
    v14 = 2654435761 * self->_sectionOrder;
    goto LABEL_19;
  }
LABEL_18:
  v14 = 0;
LABEL_19:
  v15 = -[NSString hash](self->_personalizationSectionFeatureId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v16 = 2654435761 * self->_groupType;
  else
    v16 = 0;
  return v3 ^ v18 ^ v4 ^ v5 ^ v7 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((v4[22] & 0x20) != 0)
  {
    self->_action = v4[12];
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 7))
    -[NTPBTodayPersonalizationEvent setArticleId:](self, "setArticleId:");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v5 + 9);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[NTPBTodayPersonalizationEvent addHeadlineTopics:](self, "addHeadlineTopics:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (*((_QWORD *)v5 + 8))
    -[NTPBTodayPersonalizationEvent setHeadlinePublisher:](self, "setHeadlinePublisher:");
  v11 = *((_BYTE *)v5 + 88);
  if ((v11 & 1) != 0)
  {
    self->_createdAt = *((double *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v11 = *((_BYTE *)v5 + 88);
    if ((v11 & 4) == 0)
    {
LABEL_16:
      if ((v11 & 8) == 0)
        goto LABEL_17;
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v5 + 88) & 4) == 0)
  {
    goto LABEL_16;
  }
  self->_orderInGroup = *((_QWORD *)v5 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v11 = *((_BYTE *)v5 + 88);
  if ((v11 & 8) == 0)
  {
LABEL_17:
    if ((v11 & 0x10) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_26:
  self->_overallOrder = *((_QWORD *)v5 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v5 + 88) & 0x10) != 0)
  {
LABEL_18:
    self->_sectionOrder = *((_QWORD *)v5 + 5);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_19:
  if (*((_QWORD *)v5 + 10))
    -[NTPBTodayPersonalizationEvent setPersonalizationSectionFeatureId:](self, "setPersonalizationSectionFeatureId:");
  if ((*((_BYTE *)v5 + 88) & 2) != 0)
  {
    self->_groupType = *((_QWORD *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
  objc_storeStrong((id *)&self->_articleId, a3);
}

- (NSMutableArray)headlineTopics
{
  return self->_headlineTopics;
}

- (void)setHeadlineTopics:(id)a3
{
  objc_storeStrong((id *)&self->_headlineTopics, a3);
}

- (NSString)headlinePublisher
{
  return self->_headlinePublisher;
}

- (void)setHeadlinePublisher:(id)a3
{
  objc_storeStrong((id *)&self->_headlinePublisher, a3);
}

- (double)createdAt
{
  return self->_createdAt;
}

- (int64_t)orderInGroup
{
  return self->_orderInGroup;
}

- (int64_t)overallOrder
{
  return self->_overallOrder;
}

- (int64_t)sectionOrder
{
  return self->_sectionOrder;
}

- (NSString)personalizationSectionFeatureId
{
  return self->_personalizationSectionFeatureId;
}

- (void)setPersonalizationSectionFeatureId:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationSectionFeatureId, a3);
}

- (int64_t)groupType
{
  return self->_groupType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationSectionFeatureId, 0);
  objc_storeStrong((id *)&self->_headlineTopics, 0);
  objc_storeStrong((id *)&self->_headlinePublisher, 0);
  objc_storeStrong((id *)&self->_articleId, 0);
}

@end
