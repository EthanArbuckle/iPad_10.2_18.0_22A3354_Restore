@implementation NTPBTodayWidgetExposure

- (void)setWidgetArticleCount:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_widgetArticleCount = a3;
}

- (void)setHasWidgetArticleCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWidgetArticleCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setWidgetHeadlineExposureCount:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_widgetHeadlineExposureCount = a3;
}

- (void)setHasWidgetHeadlineExposureCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWidgetHeadlineExposureCount
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)clearWidgetSectionsArticleCountPairs
{
  -[NSMutableArray removeAllObjects](self->_widgetSectionsArticleCountPairs, "removeAllObjects");
}

- (void)addWidgetSectionsArticleCountPair:(id)a3
{
  id v4;
  NSMutableArray *widgetSectionsArticleCountPairs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  widgetSectionsArticleCountPairs = self->_widgetSectionsArticleCountPairs;
  v8 = v4;
  if (!widgetSectionsArticleCountPairs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_widgetSectionsArticleCountPairs;
    self->_widgetSectionsArticleCountPairs = v6;

    v4 = v8;
    widgetSectionsArticleCountPairs = self->_widgetSectionsArticleCountPairs;
  }
  -[NSMutableArray addObject:](widgetSectionsArticleCountPairs, "addObject:", v4);

}

- (unint64_t)widgetSectionsArticleCountPairsCount
{
  return -[NSMutableArray count](self->_widgetSectionsArticleCountPairs, "count");
}

- (id)widgetSectionsArticleCountPairAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_widgetSectionsArticleCountPairs, "objectAtIndex:", a3);
}

+ (Class)widgetSectionsArticleCountPairType
{
  return (Class)objc_opt_class();
}

- (void)clearWidgetPersonalizationFeatureCTRPairs
{
  -[NSMutableArray removeAllObjects](self->_widgetPersonalizationFeatureCTRPairs, "removeAllObjects");
}

- (void)addWidgetPersonalizationFeatureCTRPair:(id)a3
{
  id v4;
  NSMutableArray *widgetPersonalizationFeatureCTRPairs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  widgetPersonalizationFeatureCTRPairs = self->_widgetPersonalizationFeatureCTRPairs;
  v8 = v4;
  if (!widgetPersonalizationFeatureCTRPairs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_widgetPersonalizationFeatureCTRPairs;
    self->_widgetPersonalizationFeatureCTRPairs = v6;

    v4 = v8;
    widgetPersonalizationFeatureCTRPairs = self->_widgetPersonalizationFeatureCTRPairs;
  }
  -[NSMutableArray addObject:](widgetPersonalizationFeatureCTRPairs, "addObject:", v4);

}

- (unint64_t)widgetPersonalizationFeatureCTRPairsCount
{
  return -[NSMutableArray count](self->_widgetPersonalizationFeatureCTRPairs, "count");
}

- (id)widgetPersonalizationFeatureCTRPairAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_widgetPersonalizationFeatureCTRPairs, "objectAtIndex:", a3);
}

+ (Class)widgetPersonalizationFeatureCTRPairType
{
  return (Class)objc_opt_class();
}

- (int)widgetAppearanceType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_widgetAppearanceType;
  else
    return 0;
}

- (void)setWidgetAppearanceType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_widgetAppearanceType = a3;
}

- (void)setHasWidgetAppearanceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidgetAppearanceType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasWidgetIdentifier
{
  return self->_widgetIdentifier != 0;
}

- (void)setContentFetchDate:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contentFetchDate = a3;
}

- (void)setHasContentFetchDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentFetchDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (int)widgetExposureStackLocation
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_widgetExposureStackLocation;
  else
    return 0;
}

- (void)setWidgetExposureStackLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_widgetExposureStackLocation = a3;
}

- (void)setHasWidgetExposureStackLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWidgetExposureStackLocation
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)widgetExposureStackLocationAsString:(int)a3
{
  if (a3 < 6)
    return off_24CD50A50[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetExposureStackLocation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_EXPOSURE_STACK_LOCATION")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TODAY_PAGE_WIDGET_EXPOSURE_STACK_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_SCREEN_PAGE_ONE_WIDGET_EXPOSURE_STACK_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_SCREEN_PAGE_TWO_WIDGET_EXPOSURE_STACK_LOCATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_SCREEN_PAGE_THREE_WIDGET_EXPOSURE_STACK_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HOME_SCREEN_OTHER_PAGES_WIDGET_EXPOSURE_STACK_LOCATION")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)widgetType
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_widgetType;
  else
    return 0;
}

- (void)setWidgetType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_widgetType = a3;
}

- (void)setHasWidgetType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWidgetType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)widgetTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD50A80[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PINNED_WIDGET_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMART_STACK_WIDGET_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NON_SMART_STACK_WIDGET_TYPE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasEntryId
{
  return self->_entryId != 0;
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
  v8.super_class = (Class)NTPBTodayWidgetExposure;
  -[NTPBTodayWidgetExposure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTodayWidgetExposure dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  NSString *widgetIdentifier;
  void *v23;
  NSString *contentId;
  char v25;
  uint64_t widgetExposureStackLocation;
  __CFString *v27;
  uint64_t widgetType;
  __CFString *v29;
  NSString *entryId;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetArticleCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("widget_article_count"));

    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetHeadlineExposureCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("widget_headline_exposure_count"));

  }
  if (-[NSMutableArray count](self->_widgetSectionsArticleCountPairs, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_widgetSectionsArticleCountPairs, "count"));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = self->_widgetSectionsArticleCountPairs;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v37 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("widget_sections_article_count_pair"));
  }
  if (-[NSMutableArray count](self->_widgetPersonalizationFeatureCTRPairs, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_widgetPersonalizationFeatureCTRPairs, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = self->_widgetPersonalizationFeatureCTRPairs;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "dictionaryRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("widget_personalization_feature_CTR_pair"));
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_widgetAppearanceType);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("widget_appearance_type"));

  }
  widgetIdentifier = self->_widgetIdentifier;
  if (widgetIdentifier)
    objc_msgSend(v3, "setObject:forKey:", widgetIdentifier, CFSTR("widget_identifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_contentFetchDate);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("content_fetch_date"));

  }
  contentId = self->_contentId;
  if (contentId)
    objc_msgSend(v3, "setObject:forKey:", contentId, CFSTR("content_id"));
  v25 = (char)self->_has;
  if ((v25 & 8) != 0)
  {
    widgetExposureStackLocation = self->_widgetExposureStackLocation;
    if (widgetExposureStackLocation >= 6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetExposureStackLocation);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_24CD50A50[widgetExposureStackLocation];
    }
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("widget_exposure_stack_location"));

    v25 = (char)self->_has;
  }
  if ((v25 & 0x20) != 0)
  {
    widgetType = self->_widgetType;
    if (widgetType >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetType);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_24CD50A80[widgetType];
    }
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("widget_type"));

  }
  entryId = self->_entryId;
  if (entryId)
    objc_msgSend(v3, "setObject:forKey:", entryId, CFSTR("entry_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayWidgetExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
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
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_widgetSectionsArticleCountPairs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = self->_widgetPersonalizationFeatureCTRPairs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_widgetIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_contentId)
    PBDataWriterWriteStringField();
  v16 = (char)self->_has;
  if ((v16 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v16 = (char)self->_has;
  }
  if ((v16 & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_entryId)
    PBDataWriterWriteStringField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_widgetArticleCount;
    *(_BYTE *)(v5 + 76) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_widgetHeadlineExposureCount;
    *(_BYTE *)(v5 + 76) |= 0x10u;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = self->_widgetSectionsArticleCountPairs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addWidgetSectionsArticleCountPair:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v10);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = self->_widgetPersonalizationFeatureCTRPairs;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v28);
        objc_msgSend((id)v6, "addWidgetPersonalizationFeatureCTRPair:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v16);
  }

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_widgetAppearanceType;
    *(_BYTE *)(v6 + 76) |= 2u;
  }
  v20 = -[NSString copyWithZone:](self->_widgetIdentifier, "copyWithZone:", a3, (_QWORD)v28);
  v21 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v20;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_contentFetchDate;
    *(_BYTE *)(v6 + 76) |= 1u;
  }
  v22 = -[NSString copyWithZone:](self->_contentId, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v22;

  v24 = (char)self->_has;
  if ((v24 & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_widgetExposureStackLocation;
    *(_BYTE *)(v6 + 76) |= 8u;
    v24 = (char)self->_has;
  }
  if ((v24 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_widgetType;
    *(_BYTE *)(v6 + 76) |= 0x20u;
  }
  v25 = -[NSString copyWithZone:](self->_entryId, "copyWithZone:", a3);
  v26 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *widgetSectionsArticleCountPairs;
  NSMutableArray *widgetPersonalizationFeatureCTRPairs;
  char has;
  NSString *widgetIdentifier;
  NSString *contentId;
  NSString *entryId;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_widgetArticleCount != *((_DWORD *)v4 + 9))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x10) == 0 || self->_widgetHeadlineExposureCount != *((_DWORD *)v4 + 11))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 76) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  widgetSectionsArticleCountPairs = self->_widgetSectionsArticleCountPairs;
  if ((unint64_t)widgetSectionsArticleCountPairs | *((_QWORD *)v4 + 8)
    && !-[NSMutableArray isEqual:](widgetSectionsArticleCountPairs, "isEqual:"))
  {
    goto LABEL_44;
  }
  widgetPersonalizationFeatureCTRPairs = self->_widgetPersonalizationFeatureCTRPairs;
  if ((unint64_t)widgetPersonalizationFeatureCTRPairs | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](widgetPersonalizationFeatureCTRPairs, "isEqual:"))
      goto LABEL_44;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_widgetAppearanceType != *((_DWORD *)v4 + 8))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_44;
  }
  widgetIdentifier = self->_widgetIdentifier;
  if ((unint64_t)widgetIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](widgetIdentifier, "isEqual:"))
      goto LABEL_44;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_contentFetchDate != *((_QWORD *)v4 + 1))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_44;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((_QWORD *)v4 + 2))
  {
    if (-[NSString isEqual:](contentId, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_32;
    }
LABEL_44:
    v11 = 0;
    goto LABEL_45;
  }
LABEL_32:
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0 || self->_widgetExposureStackLocation != *((_DWORD *)v4 + 10))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 0x20) == 0 || self->_widgetType != *((_DWORD *)v4 + 18))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 76) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  entryId = self->_entryId;
  if ((unint64_t)entryId | *((_QWORD *)v4 + 3))
    v11 = -[NSString isEqual:](entryId, "isEqual:");
  else
    v11 = 1;
LABEL_45:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v3 = 2654435761 * self->_widgetArticleCount;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_widgetHeadlineExposureCount;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSMutableArray hash](self->_widgetSectionsArticleCountPairs, "hash");
  v6 = -[NSMutableArray hash](self->_widgetPersonalizationFeatureCTRPairs, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_widgetAppearanceType;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_widgetIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_contentFetchDate;
  else
    v9 = 0;
  v10 = -[NSString hash](self->_contentId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v11 = 2654435761 * self->_widgetExposureStackLocation;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_14;
LABEL_16:
    v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSString hash](self->_entryId, "hash");
  }
  v11 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_16;
LABEL_14:
  v12 = 2654435761 * self->_widgetType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSString hash](self->_entryId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 76);
  if ((v6 & 4) != 0)
  {
    self->_widgetArticleCount = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 76);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_widgetHeadlineExposureCount = *((_DWORD *)v4 + 11);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = *((id *)v4 + 8);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
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
        -[NTPBTodayWidgetExposure addWidgetSectionsArticleCountPair:](self, "addWidgetSectionsArticleCountPair:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = *((id *)v5 + 7);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        -[NTPBTodayWidgetExposure addWidgetPersonalizationFeatureCTRPair:](self, "addWidgetPersonalizationFeatureCTRPair:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }

  if ((*((_BYTE *)v5 + 76) & 2) != 0)
  {
    self->_widgetAppearanceType = *((_DWORD *)v5 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 6))
    -[NTPBTodayWidgetExposure setWidgetIdentifier:](self, "setWidgetIdentifier:");
  if ((*((_BYTE *)v5 + 76) & 1) != 0)
  {
    self->_contentFetchDate = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v5 + 2))
    -[NTPBTodayWidgetExposure setContentId:](self, "setContentId:");
  v17 = *((_BYTE *)v5 + 76);
  if ((v17 & 8) != 0)
  {
    self->_widgetExposureStackLocation = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 8u;
    v17 = *((_BYTE *)v5 + 76);
  }
  if ((v17 & 0x20) != 0)
  {
    self->_widgetType = *((_DWORD *)v5 + 18);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v5 + 3))
    -[NTPBTodayWidgetExposure setEntryId:](self, "setEntryId:");

}

- (int)widgetArticleCount
{
  return self->_widgetArticleCount;
}

- (int)widgetHeadlineExposureCount
{
  return self->_widgetHeadlineExposureCount;
}

- (NSMutableArray)widgetSectionsArticleCountPairs
{
  return self->_widgetSectionsArticleCountPairs;
}

- (void)setWidgetSectionsArticleCountPairs:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSectionsArticleCountPairs, a3);
}

- (NSMutableArray)widgetPersonalizationFeatureCTRPairs
{
  return self->_widgetPersonalizationFeatureCTRPairs;
}

- (void)setWidgetPersonalizationFeatureCTRPairs:(id)a3
{
  objc_storeStrong((id *)&self->_widgetPersonalizationFeatureCTRPairs, a3);
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIdentifier, a3);
}

- (int64_t)contentFetchDate
{
  return self->_contentFetchDate;
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
  objc_storeStrong((id *)&self->_contentId, a3);
}

- (NSString)entryId
{
  return self->_entryId;
}

- (void)setEntryId:(id)a3
{
  objc_storeStrong((id *)&self->_entryId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSectionsArticleCountPairs, 0);
  objc_storeStrong((id *)&self->_widgetPersonalizationFeatureCTRPairs, 0);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_entryId, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
}

@end
