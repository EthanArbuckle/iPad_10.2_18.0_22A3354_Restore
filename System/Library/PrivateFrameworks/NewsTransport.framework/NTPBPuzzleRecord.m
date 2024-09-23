@implementation NTPBPuzzleRecord

- (void)dealloc
{
  objc_super v3;

  -[NTPBPuzzleRecord setBase:](self, "setBase:", 0);
  -[NTPBPuzzleRecord setTitle:](self, "setTitle:", 0);
  -[NTPBPuzzleRecord setPuzzleDescription:](self, "setPuzzleDescription:", 0);
  -[NTPBPuzzleRecord setPuzzleTypeID:](self, "setPuzzleTypeID:", 0);
  -[NTPBPuzzleRecord setDataResourceID:](self, "setDataResourceID:", 0);
  -[NTPBPuzzleRecord setAuthors:](self, "setAuthors:", 0);
  -[NTPBPuzzleRecord setPublishedDate:](self, "setPublishedDate:", 0);
  -[NTPBPuzzleRecord setThumbnailImageCompactURL:](self, "setThumbnailImageCompactURL:", 0);
  -[NTPBPuzzleRecord setThumbnailImageLargeURL:](self, "setThumbnailImageLargeURL:", 0);
  -[NTPBPuzzleRecord setLanguage:](self, "setLanguage:", 0);
  -[NTPBPuzzleRecord setBlockedStorefrontIDs:](self, "setBlockedStorefrontIDs:", 0);
  -[NTPBPuzzleRecord setAllowedStorefrontIDs:](self, "setAllowedStorefrontIDs:", 0);
  -[NTPBPuzzleRecord setTeaserConfiguration:](self, "setTeaserConfiguration:", 0);
  -[NTPBPuzzleRecord setSubtitle:](self, "setSubtitle:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPuzzleRecord;
  -[NTPBPuzzleRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasPuzzleDescription
{
  return self->_puzzleDescription != 0;
}

- (BOOL)hasPuzzleTypeID
{
  return self->_puzzleTypeID != 0;
}

- (BOOL)hasDataResourceID
{
  return self->_dataResourceID != 0;
}

- (void)clearAuthors
{
  -[NSMutableArray removeAllObjects](self->_authors, "removeAllObjects");
}

- (void)addAuthors:(id)a3
{
  NSMutableArray *authors;

  authors = self->_authors;
  if (!authors)
  {
    authors = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_authors = authors;
  }
  -[NSMutableArray addObject:](authors, "addObject:", a3);
}

- (unint64_t)authorsCount
{
  return -[NSMutableArray count](self->_authors, "count");
}

- (id)authorsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_authors, "objectAtIndex:", a3);
}

+ (Class)authorsType
{
  return (Class)objc_opt_class();
}

- (void)setIsPaid:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_isPaid = a3;
}

- (void)setHasIsPaid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsPaid
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasPublishedDate
{
  return self->_publishedDate != 0;
}

- (void)setDifficultyLevel:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_difficultyLevel = a3;
}

- (void)setHasDifficultyLevel:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDifficultyLevel
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasThumbnailImageCompactURL
{
  return self->_thumbnailImageCompactURL != 0;
}

- (BOOL)hasThumbnailImageLargeURL
{
  return self->_thumbnailImageLargeURL != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)clearBlockedStorefrontIDs
{
  -[NSMutableArray removeAllObjects](self->_blockedStorefrontIDs, "removeAllObjects");
}

- (void)addBlockedStorefrontIDs:(id)a3
{
  NSMutableArray *blockedStorefrontIDs;

  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (!blockedStorefrontIDs)
  {
    blockedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_blockedStorefrontIDs = blockedStorefrontIDs;
  }
  -[NSMutableArray addObject:](blockedStorefrontIDs, "addObject:", a3);
}

- (unint64_t)blockedStorefrontIDsCount
{
  return -[NSMutableArray count](self->_blockedStorefrontIDs, "count");
}

- (id)blockedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_blockedStorefrontIDs, "objectAtIndex:", a3);
}

+ (Class)blockedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearAllowedStorefrontIDs
{
  -[NSMutableArray removeAllObjects](self->_allowedStorefrontIDs, "removeAllObjects");
}

- (void)addAllowedStorefrontIDs:(id)a3
{
  NSMutableArray *allowedStorefrontIDs;

  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (!allowedStorefrontIDs)
  {
    allowedStorefrontIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_allowedStorefrontIDs = allowedStorefrontIDs;
  }
  -[NSMutableArray addObject:](allowedStorefrontIDs, "addObject:", a3);
}

- (unint64_t)allowedStorefrontIDsCount
{
  return -[NSMutableArray count](self->_allowedStorefrontIDs, "count");
}

- (id)allowedStorefrontIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_allowedStorefrontIDs, "objectAtIndex:", a3);
}

+ (Class)allowedStorefrontIDsType
{
  return (Class)objc_opt_class();
}

- (void)setMinimumNewsVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinimumNewsVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasTeaserConfiguration
{
  return self->_teaserConfiguration != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (void)setBehaviorFlags:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_behaviorFlags = a3;
}

- (void)setHasBehaviorFlags:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBehaviorFlags
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsDeprecated:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isDeprecated = a3;
}

- (void)setHasIsDeprecated:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsDeprecated
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsDraft:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isDraft = a3;
}

- (void)setHasIsDraft:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsDraft
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPuzzleRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPuzzleRecord description](&v3, sel_description), -[NTPBPuzzleRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *title;
  NSString *puzzleDescription;
  NSString *puzzleTypeID;
  NSString *dataResourceID;
  NSMutableArray *authors;
  NTPBDate *publishedDate;
  NSString *thumbnailImageCompactURL;
  NSString *thumbnailImageLargeURL;
  NSString *language;
  NSMutableArray *blockedStorefrontIDs;
  NSMutableArray *allowedStorefrontIDs;
  NSString *teaserConfiguration;
  NSString *subtitle;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  puzzleDescription = self->_puzzleDescription;
  if (puzzleDescription)
    objc_msgSend(v3, "setObject:forKey:", puzzleDescription, CFSTR("puzzle_description"));
  puzzleTypeID = self->_puzzleTypeID;
  if (puzzleTypeID)
    objc_msgSend(v3, "setObject:forKey:", puzzleTypeID, CFSTR("puzzle_type_ID"));
  dataResourceID = self->_dataResourceID;
  if (dataResourceID)
    objc_msgSend(v3, "setObject:forKey:", dataResourceID, CFSTR("data_resource_ID"));
  authors = self->_authors;
  if (authors)
    objc_msgSend(v3, "setObject:forKey:", authors, CFSTR("authors"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaid), CFSTR("is_paid"));
  publishedDate = self->_publishedDate;
  if (publishedDate)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](publishedDate, "dictionaryRepresentation"), CFSTR("published_date"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_difficultyLevel), CFSTR("difficulty_level"));
  thumbnailImageCompactURL = self->_thumbnailImageCompactURL;
  if (thumbnailImageCompactURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailImageCompactURL, CFSTR("thumbnail_image_compact_URL"));
  thumbnailImageLargeURL = self->_thumbnailImageLargeURL;
  if (thumbnailImageLargeURL)
    objc_msgSend(v3, "setObject:forKey:", thumbnailImageLargeURL, CFSTR("thumbnail_image_large_URL"));
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", blockedStorefrontIDs, CFSTR("blocked_storefront_IDs"));
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", allowedStorefrontIDs, CFSTR("allowed_storefront_IDs"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumNewsVersion), CFSTR("minimum_news_version"));
  teaserConfiguration = self->_teaserConfiguration;
  if (teaserConfiguration)
    objc_msgSend(v3, "setObject:forKey:", teaserConfiguration, CFSTR("teaser_configuration"));
  subtitle = self->_subtitle;
  if (subtitle)
    objc_msgSend(v3, "setObject:forKey:", subtitle, CFSTR("subtitle"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_37;
LABEL_41:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDeprecated), CFSTR("is_deprecated"));
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_38;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_behaviorFlags), CFSTR("behavior_flags"));
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_41;
LABEL_37:
  if ((has & 0x10) != 0)
LABEL_38:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDraft), CFSTR("is_draft"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPuzzleRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *authors;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  char has;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_puzzleDescription)
    PBDataWriterWriteStringField();
  if (self->_puzzleTypeID)
    PBDataWriterWriteStringField();
  if (self->_dataResourceID)
    PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  authors = self->_authors;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authors, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(authors);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authors, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v6);
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_publishedDate)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_thumbnailImageCompactURL)
    PBDataWriterWriteStringField();
  if (self->_thumbnailImageLargeURL)
    PBDataWriterWriteStringField();
  if (self->_language)
    PBDataWriterWriteStringField();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(blockedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v11);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(allowedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v16);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_teaserConfiguration)
    PBDataWriterWriteStringField();
  if (self->_subtitle)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_52:
      if ((has & 0x10) == 0)
        return;
      goto LABEL_53;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_52;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return;
LABEL_53:
  PBDataWriterWriteBOOLField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *authors;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  char has;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 48) = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 136) = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 88) = -[NSString copyWithZone:](self->_puzzleDescription, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 96) = -[NSString copyWithZone:](self->_puzzleTypeID, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 64) = -[NSString copyWithZone:](self->_dataResourceID, "copyWithZone:", a3);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  authors = self->_authors;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authors, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(authors);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAuthors:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](authors, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v8);
  }
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 146) = self->_isPaid;
    *(_BYTE *)(v5 + 148) |= 0x20u;
  }

  *(_QWORD *)(v5 + 80) = -[NTPBDate copyWithZone:](self->_publishedDate, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_difficultyLevel;
    *(_BYTE *)(v5 + 148) |= 2u;
  }

  *(_QWORD *)(v5 + 120) = -[NSString copyWithZone:](self->_thumbnailImageCompactURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 128) = -[NSString copyWithZone:](self->_thumbnailImageLargeURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 72) = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(blockedStorefrontIDs);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBlockedStorefrontIDs:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v14);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(allowedStorefrontIDs);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllowedStorefrontIDs:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v20);
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_minimumNewsVersion;
    *(_BYTE *)(v5 + 148) |= 4u;
  }

  *(_QWORD *)(v5 + 112) = -[NSString copyWithZone:](self->_teaserConfiguration, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 104) = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_30;
LABEL_34:
    *(_BYTE *)(v5 + 144) = self->_isDeprecated;
    *(_BYTE *)(v5 + 148) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return (id)v5;
    goto LABEL_31;
  }
  *(_QWORD *)(v5 + 8) = self->_behaviorFlags;
  *(_BYTE *)(v5 + 148) |= 1u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_34;
LABEL_30:
  if ((has & 0x10) != 0)
  {
LABEL_31:
    *(_BYTE *)(v5 + 145) = self->_isDraft;
    *(_BYTE *)(v5 + 148) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSString *title;
  NSString *puzzleDescription;
  NSString *puzzleTypeID;
  NSString *dataResourceID;
  NSMutableArray *authors;
  char has;
  NTPBDate *publishedDate;
  NSString *thumbnailImageCompactURL;
  NSString *thumbnailImageLargeURL;
  NSString *language;
  NSMutableArray *blockedStorefrontIDs;
  NSMutableArray *allowedStorefrontIDs;
  NSString *teaserConfiguration;
  NSString *subtitle;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  base = self->_base;
  if ((unint64_t)base | *((_QWORD *)a3 + 6))
  {
    v5 = -[NTPBRecordBase isEqual:](base, "isEqual:");
    if (!v5)
      return v5;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)a3 + 17))
  {
    v5 = -[NSString isEqual:](title, "isEqual:");
    if (!v5)
      return v5;
  }
  puzzleDescription = self->_puzzleDescription;
  if ((unint64_t)puzzleDescription | *((_QWORD *)a3 + 11))
  {
    v5 = -[NSString isEqual:](puzzleDescription, "isEqual:");
    if (!v5)
      return v5;
  }
  puzzleTypeID = self->_puzzleTypeID;
  if ((unint64_t)puzzleTypeID | *((_QWORD *)a3 + 12))
  {
    v5 = -[NSString isEqual:](puzzleTypeID, "isEqual:");
    if (!v5)
      return v5;
  }
  dataResourceID = self->_dataResourceID;
  if ((unint64_t)dataResourceID | *((_QWORD *)a3 + 8))
  {
    v5 = -[NSString isEqual:](dataResourceID, "isEqual:");
    if (!v5)
      return v5;
  }
  authors = self->_authors;
  if ((unint64_t)authors | *((_QWORD *)a3 + 5))
  {
    v5 = -[NSMutableArray isEqual:](authors, "isEqual:");
    if (!v5)
      return v5;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)a3 + 148) & 0x20) == 0)
      goto LABEL_64;
    if (self->_isPaid)
    {
      if (!*((_BYTE *)a3 + 146))
        goto LABEL_64;
    }
    else if (*((_BYTE *)a3 + 146))
    {
      goto LABEL_64;
    }
  }
  else if ((*((_BYTE *)a3 + 148) & 0x20) != 0)
  {
    goto LABEL_64;
  }
  publishedDate = self->_publishedDate;
  if ((unint64_t)publishedDate | *((_QWORD *)a3 + 10))
  {
    v5 = -[NTPBDate isEqual:](publishedDate, "isEqual:");
    if (!v5)
      return v5;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 148) & 2) == 0 || self->_difficultyLevel != *((_QWORD *)a3 + 2))
      goto LABEL_64;
  }
  else if ((*((_BYTE *)a3 + 148) & 2) != 0)
  {
    goto LABEL_64;
  }
  thumbnailImageCompactURL = self->_thumbnailImageCompactURL;
  if (!((unint64_t)thumbnailImageCompactURL | *((_QWORD *)a3 + 15))
    || (v5 = -[NSString isEqual:](thumbnailImageCompactURL, "isEqual:")) != 0)
  {
    thumbnailImageLargeURL = self->_thumbnailImageLargeURL;
    if (!((unint64_t)thumbnailImageLargeURL | *((_QWORD *)a3 + 16))
      || (v5 = -[NSString isEqual:](thumbnailImageLargeURL, "isEqual:")) != 0)
    {
      language = self->_language;
      if (!((unint64_t)language | *((_QWORD *)a3 + 9)) || (v5 = -[NSString isEqual:](language, "isEqual:")) != 0)
      {
        blockedStorefrontIDs = self->_blockedStorefrontIDs;
        if (!((unint64_t)blockedStorefrontIDs | *((_QWORD *)a3 + 7))
          || (v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:")) != 0)
        {
          allowedStorefrontIDs = self->_allowedStorefrontIDs;
          if (!((unint64_t)allowedStorefrontIDs | *((_QWORD *)a3 + 4))
            || (v5 = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:")) != 0)
          {
            if ((*(_BYTE *)&self->_has & 4) != 0)
            {
              if ((*((_BYTE *)a3 + 148) & 4) == 0 || self->_minimumNewsVersion != *((_QWORD *)a3 + 3))
                goto LABEL_64;
            }
            else if ((*((_BYTE *)a3 + 148) & 4) != 0)
            {
              goto LABEL_64;
            }
            teaserConfiguration = self->_teaserConfiguration;
            if (!((unint64_t)teaserConfiguration | *((_QWORD *)a3 + 14))
              || (v5 = -[NSString isEqual:](teaserConfiguration, "isEqual:")) != 0)
            {
              subtitle = self->_subtitle;
              if (!((unint64_t)subtitle | *((_QWORD *)a3 + 13))
                || (v5 = -[NSString isEqual:](subtitle, "isEqual:")) != 0)
              {
                if ((*(_BYTE *)&self->_has & 1) != 0)
                {
                  if ((*((_BYTE *)a3 + 148) & 1) == 0 || self->_behaviorFlags != *((_QWORD *)a3 + 1))
                    goto LABEL_64;
                }
                else if ((*((_BYTE *)a3 + 148) & 1) != 0)
                {
                  goto LABEL_64;
                }
                if ((*(_BYTE *)&self->_has & 8) == 0)
                {
                  if ((*((_BYTE *)a3 + 148) & 8) != 0)
                    goto LABEL_64;
LABEL_62:
                  LOBYTE(v5) = (*((_BYTE *)a3 + 148) & 0x10) == 0;
                  if ((*(_BYTE *)&self->_has & 0x10) != 0)
                  {
                    if ((*((_BYTE *)a3 + 148) & 0x10) == 0)
                      goto LABEL_64;
                    if (self->_isDraft)
                    {
                      if (!*((_BYTE *)a3 + 145))
                        goto LABEL_64;
                    }
                    else if (*((_BYTE *)a3 + 145))
                    {
                      goto LABEL_64;
                    }
                    LOBYTE(v5) = 1;
                  }
                  return v5;
                }
                if ((*((_BYTE *)a3 + 148) & 8) != 0)
                {
                  if (self->_isDeprecated)
                  {
                    if (!*((_BYTE *)a3 + 144))
                      goto LABEL_64;
                    goto LABEL_62;
                  }
                  if (!*((_BYTE *)a3 + 144))
                    goto LABEL_62;
                }
LABEL_64:
                LOBYTE(v5) = 0;
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  unint64_t v23;

  v23 = -[NTPBRecordBase hash](self->_base, "hash");
  v22 = -[NSString hash](self->_title, "hash");
  v21 = -[NSString hash](self->_puzzleDescription, "hash");
  v20 = -[NSString hash](self->_puzzleTypeID, "hash");
  v19 = -[NSString hash](self->_dataResourceID, "hash");
  v18 = -[NSMutableArray hash](self->_authors, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v17 = 2654435761 * self->_isPaid;
  else
    v17 = 0;
  v16 = -[NTPBDate hash](self->_publishedDate, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v15 = 2654435761 * self->_difficultyLevel;
  else
    v15 = 0;
  v3 = -[NSString hash](self->_thumbnailImageCompactURL, "hash");
  v4 = -[NSString hash](self->_thumbnailImageLargeURL, "hash");
  v5 = -[NSString hash](self->_language, "hash");
  v6 = -[NSMutableArray hash](self->_blockedStorefrontIDs, "hash");
  v7 = -[NSMutableArray hash](self->_allowedStorefrontIDs, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v8 = 2654435761 * self->_minimumNewsVersion;
  else
    v8 = 0;
  v9 = -[NSString hash](self->_teaserConfiguration, "hash");
  v10 = -[NSString hash](self->_subtitle, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v11 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_12;
LABEL_15:
    v12 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_13;
LABEL_16:
    v13 = 0;
    return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  v11 = 2654435761 * self->_behaviorFlags;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_15;
LABEL_12:
  v12 = 2654435761 * self->_isDeprecated;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_16;
LABEL_13:
  v13 = 2654435761 * self->_isDraft;
  return v22 ^ v23 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
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
  NTPBDate *publishedDate;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  base = self->_base;
  v6 = *((_QWORD *)a3 + 6);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBPuzzleRecord setBase:](self, "setBase:");
  }
  if (*((_QWORD *)a3 + 17))
    -[NTPBPuzzleRecord setTitle:](self, "setTitle:");
  if (*((_QWORD *)a3 + 11))
    -[NTPBPuzzleRecord setPuzzleDescription:](self, "setPuzzleDescription:");
  if (*((_QWORD *)a3 + 12))
    -[NTPBPuzzleRecord setPuzzleTypeID:](self, "setPuzzleTypeID:");
  if (*((_QWORD *)a3 + 8))
    -[NTPBPuzzleRecord setDataResourceID:](self, "setDataResourceID:");
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        -[NTPBPuzzleRecord addAuthors:](self, "addAuthors:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v9);
  }
  if ((*((_BYTE *)a3 + 148) & 0x20) != 0)
  {
    self->_isPaid = *((_BYTE *)a3 + 146);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  publishedDate = self->_publishedDate;
  v13 = *((_QWORD *)a3 + 10);
  if (publishedDate)
  {
    if (v13)
      -[NTPBDate mergeFrom:](publishedDate, "mergeFrom:");
  }
  else if (v13)
  {
    -[NTPBPuzzleRecord setPublishedDate:](self, "setPublishedDate:");
  }
  if ((*((_BYTE *)a3 + 148) & 2) != 0)
  {
    self->_difficultyLevel = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 15))
    -[NTPBPuzzleRecord setThumbnailImageCompactURL:](self, "setThumbnailImageCompactURL:");
  if (*((_QWORD *)a3 + 16))
    -[NTPBPuzzleRecord setThumbnailImageLargeURL:](self, "setThumbnailImageLargeURL:");
  if (*((_QWORD *)a3 + 9))
    -[NTPBPuzzleRecord setLanguage:](self, "setLanguage:");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = (void *)*((_QWORD *)a3 + 7);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        -[NTPBPuzzleRecord addBlockedStorefrontIDs:](self, "addBlockedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v16);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = (void *)*((_QWORD *)a3 + 4);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        -[NTPBPuzzleRecord addAllowedStorefrontIDs:](self, "addAllowedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v21);
  }
  if ((*((_BYTE *)a3 + 148) & 4) != 0)
  {
    self->_minimumNewsVersion = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 14))
    -[NTPBPuzzleRecord setTeaserConfiguration:](self, "setTeaserConfiguration:");
  if (*((_QWORD *)a3 + 13))
    -[NTPBPuzzleRecord setSubtitle:](self, "setSubtitle:");
  v24 = *((_BYTE *)a3 + 148);
  if ((v24 & 1) != 0)
  {
    self->_behaviorFlags = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v24 = *((_BYTE *)a3 + 148);
    if ((v24 & 8) == 0)
    {
LABEL_58:
      if ((v24 & 0x10) == 0)
        return;
      goto LABEL_59;
    }
  }
  else if ((*((_BYTE *)a3 + 148) & 8) == 0)
  {
    goto LABEL_58;
  }
  self->_isDeprecated = *((_BYTE *)a3 + 144);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 148) & 0x10) == 0)
    return;
LABEL_59:
  self->_isDraft = *((_BYTE *)a3 + 145);
  *(_BYTE *)&self->_has |= 0x10u;
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSString)puzzleDescription
{
  return self->_puzzleDescription;
}

- (void)setPuzzleDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSString)puzzleTypeID
{
  return self->_puzzleTypeID;
}

- (void)setPuzzleTypeID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSString)dataResourceID
{
  return self->_dataResourceID;
}

- (void)setDataResourceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableArray)authors
{
  return self->_authors;
}

- (void)setAuthors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)isPaid
{
  return self->_isPaid;
}

- (NTPBDate)publishedDate
{
  return self->_publishedDate;
}

- (void)setPublishedDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (int64_t)difficultyLevel
{
  return self->_difficultyLevel;
}

- (NSString)thumbnailImageCompactURL
{
  return self->_thumbnailImageCompactURL;
}

- (void)setThumbnailImageCompactURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSString)thumbnailImageLargeURL
{
  return self->_thumbnailImageLargeURL;
}

- (void)setThumbnailImageLargeURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (void)setBlockedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (void)setAllowedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)teaserConfiguration
{
  return self->_teaserConfiguration;
}

- (void)setTeaserConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (int64_t)behaviorFlags
{
  return self->_behaviorFlags;
}

- (BOOL)isDeprecated
{
  return self->_isDeprecated;
}

- (BOOL)isDraft
{
  return self->_isDraft;
}

@end
