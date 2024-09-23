@implementation NTPBPuzzleTypeRecord

- (void)dealloc
{
  objc_super v3;

  -[NTPBPuzzleTypeRecord setBase:](self, "setBase:", 0);
  -[NTPBPuzzleTypeRecord setName:](self, "setName:", 0);
  -[NTPBPuzzleTypeRecord setEngineResourceID:](self, "setEngineResourceID:", 0);
  -[NTPBPuzzleTypeRecord setSuperfeedConfigResourceID:](self, "setSuperfeedConfigResourceID:", 0);
  -[NTPBPuzzleTypeRecord setLatestPuzzleIDs:](self, "setLatestPuzzleIDs:", 0);
  -[NTPBPuzzleTypeRecord setPromotedPuzzleIDs:](self, "setPromotedPuzzleIDs:", 0);
  -[NTPBPuzzleTypeRecord setLanguage:](self, "setLanguage:", 0);
  -[NTPBPuzzleTypeRecord setBlockedStorefrontIDs:](self, "setBlockedStorefrontIDs:", 0);
  -[NTPBPuzzleTypeRecord setAllowedStorefrontIDs:](self, "setAllowedStorefrontIDs:", 0);
  -[NTPBPuzzleTypeRecord setNameImageURL:](self, "setNameImageURL:", 0);
  -[NTPBPuzzleTypeRecord setNameImageCompactURL:](self, "setNameImageCompactURL:", 0);
  -[NTPBPuzzleTypeRecord setNameImageForDarkBackgroundURL:](self, "setNameImageForDarkBackgroundURL:", 0);
  -[NTPBPuzzleTypeRecord setNameImageMaskURL:](self, "setNameImageMaskURL:", 0);
  -[NTPBPuzzleTypeRecord setCoverImageURL:](self, "setCoverImageURL:", 0);
  -[NTPBPuzzleTypeRecord setFeedNavImageURL:](self, "setFeedNavImageURL:", 0);
  -[NTPBPuzzleTypeRecord setExploreTileImageURL:](self, "setExploreTileImageURL:", 0);
  -[NTPBPuzzleTypeRecord setThemeConfiguration:](self, "setThemeConfiguration:", 0);
  -[NTPBPuzzleTypeRecord setImagesResourceID:](self, "setImagesResourceID:", 0);
  -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundImageURL:](self, "setNavigationChromeBackgroundImageURL:", 0);
  -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundImageCompactURL:](self, "setNavigationChromeBackgroundImageCompactURL:", 0);
  -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundImageLargeURL:](self, "setNavigationChromeBackgroundImageLargeURL:", 0);
  -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundDarkModeImageURL:](self, "setNavigationChromeBackgroundDarkModeImageURL:", 0);
  -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundDarkModeImageCompactURL:](self, "setNavigationChromeBackgroundDarkModeImageCompactURL:", 0);
  -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundDarkModeImageLargeURL:](self, "setNavigationChromeBackgroundDarkModeImageLargeURL:", 0);
  -[NTPBPuzzleTypeRecord setKind:](self, "setKind:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPuzzleTypeRecord;
  -[NTPBPuzzleTypeRecord dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasEngineResourceID
{
  return self->_engineResourceID != 0;
}

- (BOOL)hasSuperfeedConfigResourceID
{
  return self->_superfeedConfigResourceID != 0;
}

- (void)clearLatestPuzzleIDs
{
  -[NSMutableArray removeAllObjects](self->_latestPuzzleIDs, "removeAllObjects");
}

- (void)addLatestPuzzleIDs:(id)a3
{
  NSMutableArray *latestPuzzleIDs;

  latestPuzzleIDs = self->_latestPuzzleIDs;
  if (!latestPuzzleIDs)
  {
    latestPuzzleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_latestPuzzleIDs = latestPuzzleIDs;
  }
  -[NSMutableArray addObject:](latestPuzzleIDs, "addObject:", a3);
}

- (unint64_t)latestPuzzleIDsCount
{
  return -[NSMutableArray count](self->_latestPuzzleIDs, "count");
}

- (id)latestPuzzleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_latestPuzzleIDs, "objectAtIndex:", a3);
}

+ (Class)latestPuzzleIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearPromotedPuzzleIDs
{
  -[NSMutableArray removeAllObjects](self->_promotedPuzzleIDs, "removeAllObjects");
}

- (void)addPromotedPuzzleIDs:(id)a3
{
  NSMutableArray *promotedPuzzleIDs;

  promotedPuzzleIDs = self->_promotedPuzzleIDs;
  if (!promotedPuzzleIDs)
  {
    promotedPuzzleIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_promotedPuzzleIDs = promotedPuzzleIDs;
  }
  -[NSMutableArray addObject:](promotedPuzzleIDs, "addObject:", a3);
}

- (unint64_t)promotedPuzzleIDsCount
{
  return -[NSMutableArray count](self->_promotedPuzzleIDs, "count");
}

- (id)promotedPuzzleIDsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_promotedPuzzleIDs, "objectAtIndex:", a3);
}

+ (Class)promotedPuzzleIDsType
{
  return (Class)objc_opt_class();
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
  *(_BYTE *)&self->_has |= 1u;
  self->_minimumNewsVersion = a3;
}

- (void)setHasMinimumNewsVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinimumNewsVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasNameImageURL
{
  return self->_nameImageURL != 0;
}

- (BOOL)hasNameImageCompactURL
{
  return self->_nameImageCompactURL != 0;
}

- (BOOL)hasNameImageForDarkBackgroundURL
{
  return self->_nameImageForDarkBackgroundURL != 0;
}

- (BOOL)hasNameImageMaskURL
{
  return self->_nameImageMaskURL != 0;
}

- (BOOL)hasCoverImageURL
{
  return self->_coverImageURL != 0;
}

- (BOOL)hasFeedNavImageURL
{
  return self->_feedNavImageURL != 0;
}

- (BOOL)hasExploreTileImageURL
{
  return self->_exploreTileImageURL != 0;
}

- (BOOL)hasThemeConfiguration
{
  return self->_themeConfiguration != 0;
}

- (BOOL)hasImagesResourceID
{
  return self->_imagesResourceID != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageURL
{
  return self->_navigationChromeBackgroundImageURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageCompactURL
{
  return self->_navigationChromeBackgroundImageCompactURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundImageLargeURL
{
  return self->_navigationChromeBackgroundImageLargeURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundDarkModeImageURL
{
  return self->_navigationChromeBackgroundDarkModeImageURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundDarkModeImageCompactURL
{
  return self->_navigationChromeBackgroundDarkModeImageCompactURL != 0;
}

- (BOOL)hasNavigationChromeBackgroundDarkModeImageLargeURL
{
  return self->_navigationChromeBackgroundDarkModeImageLargeURL != 0;
}

- (BOOL)hasKind
{
  return self->_kind != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPuzzleTypeRecord;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPuzzleTypeRecord description](&v3, sel_description), -[NTPBPuzzleTypeRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBRecordBase *base;
  NSString *name;
  NSString *engineResourceID;
  NSString *superfeedConfigResourceID;
  NSMutableArray *latestPuzzleIDs;
  NSMutableArray *promotedPuzzleIDs;
  NSString *language;
  NSMutableArray *blockedStorefrontIDs;
  NSMutableArray *allowedStorefrontIDs;
  NSString *nameImageURL;
  NSString *nameImageCompactURL;
  NSString *nameImageForDarkBackgroundURL;
  NSString *nameImageMaskURL;
  NSString *coverImageURL;
  NSString *feedNavImageURL;
  NSString *exploreTileImageURL;
  NSString *themeConfiguration;
  NSString *imagesResourceID;
  NSString *navigationChromeBackgroundImageURL;
  NSString *navigationChromeBackgroundImageCompactURL;
  NSString *navigationChromeBackgroundImageLargeURL;
  NSString *navigationChromeBackgroundDarkModeImageURL;
  NSString *navigationChromeBackgroundDarkModeImageCompactURL;
  NSString *navigationChromeBackgroundDarkModeImageLargeURL;
  NSString *kind;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  base = self->_base;
  if (base)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), CFSTR("base"));
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  engineResourceID = self->_engineResourceID;
  if (engineResourceID)
    objc_msgSend(v3, "setObject:forKey:", engineResourceID, CFSTR("engine_resource_ID"));
  superfeedConfigResourceID = self->_superfeedConfigResourceID;
  if (superfeedConfigResourceID)
    objc_msgSend(v3, "setObject:forKey:", superfeedConfigResourceID, CFSTR("superfeed_config_resource_ID"));
  latestPuzzleIDs = self->_latestPuzzleIDs;
  if (latestPuzzleIDs)
    objc_msgSend(v3, "setObject:forKey:", latestPuzzleIDs, CFSTR("latest_puzzle_IDs"));
  promotedPuzzleIDs = self->_promotedPuzzleIDs;
  if (promotedPuzzleIDs)
    objc_msgSend(v3, "setObject:forKey:", promotedPuzzleIDs, CFSTR("promoted_puzzle_IDs"));
  language = self->_language;
  if (language)
    objc_msgSend(v3, "setObject:forKey:", language, CFSTR("language"));
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  if (blockedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", blockedStorefrontIDs, CFSTR("blocked_storefront_IDs"));
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  if (allowedStorefrontIDs)
    objc_msgSend(v3, "setObject:forKey:", allowedStorefrontIDs, CFSTR("allowed_storefront_IDs"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumNewsVersion), CFSTR("minimum_news_version"));
  nameImageURL = self->_nameImageURL;
  if (nameImageURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageURL, CFSTR("name_image_URL"));
  nameImageCompactURL = self->_nameImageCompactURL;
  if (nameImageCompactURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageCompactURL, CFSTR("name_image_compact_URL"));
  nameImageForDarkBackgroundURL = self->_nameImageForDarkBackgroundURL;
  if (nameImageForDarkBackgroundURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageForDarkBackgroundURL, CFSTR("name_image_for_dark_background_URL"));
  nameImageMaskURL = self->_nameImageMaskURL;
  if (nameImageMaskURL)
    objc_msgSend(v3, "setObject:forKey:", nameImageMaskURL, CFSTR("name_image_mask_URL"));
  coverImageURL = self->_coverImageURL;
  if (coverImageURL)
    objc_msgSend(v3, "setObject:forKey:", coverImageURL, CFSTR("cover_image_URL"));
  feedNavImageURL = self->_feedNavImageURL;
  if (feedNavImageURL)
    objc_msgSend(v3, "setObject:forKey:", feedNavImageURL, CFSTR("feed_nav_image_URL"));
  exploreTileImageURL = self->_exploreTileImageURL;
  if (exploreTileImageURL)
    objc_msgSend(v3, "setObject:forKey:", exploreTileImageURL, CFSTR("explore_tile_image_URL"));
  themeConfiguration = self->_themeConfiguration;
  if (themeConfiguration)
    objc_msgSend(v3, "setObject:forKey:", themeConfiguration, CFSTR("theme_configuration"));
  imagesResourceID = self->_imagesResourceID;
  if (imagesResourceID)
    objc_msgSend(v3, "setObject:forKey:", imagesResourceID, CFSTR("images_resource_ID"));
  navigationChromeBackgroundImageURL = self->_navigationChromeBackgroundImageURL;
  if (navigationChromeBackgroundImageURL)
    objc_msgSend(v3, "setObject:forKey:", navigationChromeBackgroundImageURL, CFSTR("navigation_chrome_background_image_URL"));
  navigationChromeBackgroundImageCompactURL = self->_navigationChromeBackgroundImageCompactURL;
  if (navigationChromeBackgroundImageCompactURL)
    objc_msgSend(v3, "setObject:forKey:", navigationChromeBackgroundImageCompactURL, CFSTR("navigation_chrome_background_image_compact_URL"));
  navigationChromeBackgroundImageLargeURL = self->_navigationChromeBackgroundImageLargeURL;
  if (navigationChromeBackgroundImageLargeURL)
    objc_msgSend(v3, "setObject:forKey:", navigationChromeBackgroundImageLargeURL, CFSTR("navigation_chrome_background_image_large_URL"));
  navigationChromeBackgroundDarkModeImageURL = self->_navigationChromeBackgroundDarkModeImageURL;
  if (navigationChromeBackgroundDarkModeImageURL)
    objc_msgSend(v3, "setObject:forKey:", navigationChromeBackgroundDarkModeImageURL, CFSTR("navigation_chrome_background_dark_mode_image_URL"));
  navigationChromeBackgroundDarkModeImageCompactURL = self->_navigationChromeBackgroundDarkModeImageCompactURL;
  if (navigationChromeBackgroundDarkModeImageCompactURL)
    objc_msgSend(v3, "setObject:forKey:", navigationChromeBackgroundDarkModeImageCompactURL, CFSTR("navigation_chrome_background_dark_mode_image_compact_URL"));
  navigationChromeBackgroundDarkModeImageLargeURL = self->_navigationChromeBackgroundDarkModeImageLargeURL;
  if (navigationChromeBackgroundDarkModeImageLargeURL)
    objc_msgSend(v3, "setObject:forKey:", navigationChromeBackgroundDarkModeImageLargeURL, CFSTR("navigation_chrome_background_dark_mode_image_large_URL"));
  kind = self->_kind;
  if (kind)
    objc_msgSend(v3, "setObject:forKey:", kind, CFSTR("kind"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPuzzleTypeRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *latestPuzzleIDs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableArray *promotedPuzzleIDs;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  __int128 v24;
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
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (self->_base)
    PBDataWriterWriteSubmessage();
  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_engineResourceID)
    PBDataWriterWriteStringField();
  if (self->_superfeedConfigResourceID)
    PBDataWriterWriteStringField();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  latestPuzzleIDs = self->_latestPuzzleIDs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latestPuzzleIDs, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(latestPuzzleIDs);
        PBDataWriterWriteStringField();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latestPuzzleIDs, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v6);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  promotedPuzzleIDs = self->_promotedPuzzleIDs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](promotedPuzzleIDs, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(promotedPuzzleIDs);
        PBDataWriterWriteStringField();
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](promotedPuzzleIDs, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v11);
  }
  if (self->_language)
    PBDataWriterWriteStringField();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(blockedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    }
    while (v16);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(allowedStorefrontIDs);
        PBDataWriterWriteStringField();
      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    }
    while (v21);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_nameImageURL)
    PBDataWriterWriteStringField();
  if (self->_nameImageCompactURL)
    PBDataWriterWriteStringField();
  if (self->_nameImageForDarkBackgroundURL)
    PBDataWriterWriteStringField();
  if (self->_nameImageMaskURL)
    PBDataWriterWriteStringField();
  if (self->_coverImageURL)
    PBDataWriterWriteStringField();
  if (self->_feedNavImageURL)
    PBDataWriterWriteStringField();
  if (self->_exploreTileImageURL)
    PBDataWriterWriteStringField();
  if (self->_themeConfiguration)
    PBDataWriterWriteStringField();
  if (self->_imagesResourceID)
    PBDataWriterWriteStringField();
  if (self->_navigationChromeBackgroundImageURL)
    PBDataWriterWriteStringField();
  if (self->_navigationChromeBackgroundImageCompactURL)
    PBDataWriterWriteStringField();
  if (self->_navigationChromeBackgroundImageLargeURL)
    PBDataWriterWriteStringField();
  if (self->_navigationChromeBackgroundDarkModeImageURL)
    PBDataWriterWriteStringField();
  if (self->_navigationChromeBackgroundDarkModeImageCompactURL)
    PBDataWriterWriteStringField();
  if (self->_navigationChromeBackgroundDarkModeImageLargeURL)
    PBDataWriterWriteStringField();
  if (self->_kind)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *latestPuzzleIDs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *promotedPuzzleIDs;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSMutableArray *blockedStorefrontIDs;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  NSMutableArray *allowedStorefrontIDs;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 24) = -[NTPBRecordBase copyWithZone:](self->_base, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 104) = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 48) = -[NSString copyWithZone:](self->_engineResourceID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 200) = -[NSString copyWithZone:](self->_superfeedConfigResourceID, "copyWithZone:", a3);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  latestPuzzleIDs = self->_latestPuzzleIDs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latestPuzzleIDs, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(latestPuzzleIDs);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addLatestPuzzleIDs:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](latestPuzzleIDs, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v8);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  promotedPuzzleIDs = self->_promotedPuzzleIDs;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](promotedPuzzleIDs, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(promotedPuzzleIDs);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPromotedPuzzleIDs:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](promotedPuzzleIDs, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v14);
  }

  *(_QWORD *)(v5 + 88) = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  blockedStorefrontIDs = self->_blockedStorefrontIDs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(blockedStorefrontIDs);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addBlockedStorefrontIDs:", v23);

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](blockedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v20);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  allowedStorefrontIDs = self->_allowedStorefrontIDs;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(allowedStorefrontIDs);
        v29 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addAllowedStorefrontIDs:", v29);

      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allowedStorefrontIDs, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    }
    while (v26);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_minimumNewsVersion;
    *(_BYTE *)(v5 + 216) |= 1u;
  }

  *(_QWORD *)(v5 + 136) = -[NSString copyWithZone:](self->_nameImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 112) = -[NSString copyWithZone:](self->_nameImageCompactURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 120) = -[NSString copyWithZone:](self->_nameImageForDarkBackgroundURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 128) = -[NSString copyWithZone:](self->_nameImageMaskURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_coverImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 64) = -[NSString copyWithZone:](self->_feedNavImageURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 56) = -[NSString copyWithZone:](self->_exploreTileImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 208) = -[NSString copyWithZone:](self->_themeConfiguration, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 72) = -[NSString copyWithZone:](self->_imagesResourceID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 184) = -[NSString copyWithZone:](self->_navigationChromeBackgroundImageURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 168) = -[NSString copyWithZone:](self->_navigationChromeBackgroundImageCompactURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 176) = -[NSString copyWithZone:](self->_navigationChromeBackgroundImageLargeURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 160) = -[NSString copyWithZone:](self->_navigationChromeBackgroundDarkModeImageURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 144) = -[NSString copyWithZone:](self->_navigationChromeBackgroundDarkModeImageCompactURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 152) = -[NSString copyWithZone:](self->_navigationChromeBackgroundDarkModeImageLargeURL, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 80) = -[NSString copyWithZone:](self->_kind, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NTPBRecordBase *base;
  NSString *name;
  NSString *engineResourceID;
  NSString *superfeedConfigResourceID;
  NSMutableArray *latestPuzzleIDs;
  NSMutableArray *promotedPuzzleIDs;
  NSString *language;
  NSMutableArray *blockedStorefrontIDs;
  NSMutableArray *allowedStorefrontIDs;
  NSString *nameImageURL;
  NSString *nameImageCompactURL;
  NSString *nameImageForDarkBackgroundURL;
  NSString *nameImageMaskURL;
  NSString *coverImageURL;
  NSString *feedNavImageURL;
  NSString *exploreTileImageURL;
  NSString *themeConfiguration;
  NSString *imagesResourceID;
  NSString *navigationChromeBackgroundImageURL;
  NSString *navigationChromeBackgroundImageCompactURL;
  NSString *navigationChromeBackgroundImageLargeURL;
  NSString *navigationChromeBackgroundDarkModeImageURL;
  NSString *navigationChromeBackgroundDarkModeImageCompactURL;
  NSString *navigationChromeBackgroundDarkModeImageLargeURL;
  NSString *kind;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    base = self->_base;
    if (!((unint64_t)base | *((_QWORD *)a3 + 3)) || (v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      name = self->_name;
      if (!((unint64_t)name | *((_QWORD *)a3 + 13)) || (v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
      {
        engineResourceID = self->_engineResourceID;
        if (!((unint64_t)engineResourceID | *((_QWORD *)a3 + 6))
          || (v5 = -[NSString isEqual:](engineResourceID, "isEqual:")) != 0)
        {
          superfeedConfigResourceID = self->_superfeedConfigResourceID;
          if (!((unint64_t)superfeedConfigResourceID | *((_QWORD *)a3 + 25))
            || (v5 = -[NSString isEqual:](superfeedConfigResourceID, "isEqual:")) != 0)
          {
            latestPuzzleIDs = self->_latestPuzzleIDs;
            if (!((unint64_t)latestPuzzleIDs | *((_QWORD *)a3 + 12))
              || (v5 = -[NSMutableArray isEqual:](latestPuzzleIDs, "isEqual:")) != 0)
            {
              promotedPuzzleIDs = self->_promotedPuzzleIDs;
              if (!((unint64_t)promotedPuzzleIDs | *((_QWORD *)a3 + 24))
                || (v5 = -[NSMutableArray isEqual:](promotedPuzzleIDs, "isEqual:")) != 0)
              {
                language = self->_language;
                if (!((unint64_t)language | *((_QWORD *)a3 + 11))
                  || (v5 = -[NSString isEqual:](language, "isEqual:")) != 0)
                {
                  blockedStorefrontIDs = self->_blockedStorefrontIDs;
                  if (!((unint64_t)blockedStorefrontIDs | *((_QWORD *)a3 + 4))
                    || (v5 = -[NSMutableArray isEqual:](blockedStorefrontIDs, "isEqual:")) != 0)
                  {
                    allowedStorefrontIDs = self->_allowedStorefrontIDs;
                    if (!((unint64_t)allowedStorefrontIDs | *((_QWORD *)a3 + 2))
                      || (v5 = -[NSMutableArray isEqual:](allowedStorefrontIDs, "isEqual:")) != 0)
                    {
                      if ((*(_BYTE *)&self->_has & 1) != 0)
                      {
                        if ((*((_BYTE *)a3 + 216) & 1) == 0 || self->_minimumNewsVersion != *((_QWORD *)a3 + 1))
                          goto LABEL_57;
                      }
                      else if ((*((_BYTE *)a3 + 216) & 1) != 0)
                      {
LABEL_57:
                        LOBYTE(v5) = 0;
                        return v5;
                      }
                      nameImageURL = self->_nameImageURL;
                      if (!((unint64_t)nameImageURL | *((_QWORD *)a3 + 17))
                        || (v5 = -[NSString isEqual:](nameImageURL, "isEqual:")) != 0)
                      {
                        nameImageCompactURL = self->_nameImageCompactURL;
                        if (!((unint64_t)nameImageCompactURL | *((_QWORD *)a3 + 14))
                          || (v5 = -[NSString isEqual:](nameImageCompactURL, "isEqual:")) != 0)
                        {
                          nameImageForDarkBackgroundURL = self->_nameImageForDarkBackgroundURL;
                          if (!((unint64_t)nameImageForDarkBackgroundURL | *((_QWORD *)a3 + 15))
                            || (v5 = -[NSString isEqual:](nameImageForDarkBackgroundURL, "isEqual:")) != 0)
                          {
                            nameImageMaskURL = self->_nameImageMaskURL;
                            if (!((unint64_t)nameImageMaskURL | *((_QWORD *)a3 + 16))
                              || (v5 = -[NSString isEqual:](nameImageMaskURL, "isEqual:")) != 0)
                            {
                              coverImageURL = self->_coverImageURL;
                              if (!((unint64_t)coverImageURL | *((_QWORD *)a3 + 5))
                                || (v5 = -[NSString isEqual:](coverImageURL, "isEqual:")) != 0)
                              {
                                feedNavImageURL = self->_feedNavImageURL;
                                if (!((unint64_t)feedNavImageURL | *((_QWORD *)a3 + 8))
                                  || (v5 = -[NSString isEqual:](feedNavImageURL, "isEqual:")) != 0)
                                {
                                  exploreTileImageURL = self->_exploreTileImageURL;
                                  if (!((unint64_t)exploreTileImageURL | *((_QWORD *)a3 + 7))
                                    || (v5 = -[NSString isEqual:](exploreTileImageURL, "isEqual:")) != 0)
                                  {
                                    themeConfiguration = self->_themeConfiguration;
                                    if (!((unint64_t)themeConfiguration | *((_QWORD *)a3 + 26))
                                      || (v5 = -[NSString isEqual:](themeConfiguration, "isEqual:")) != 0)
                                    {
                                      imagesResourceID = self->_imagesResourceID;
                                      if (!((unint64_t)imagesResourceID | *((_QWORD *)a3 + 9))
                                        || (v5 = -[NSString isEqual:](imagesResourceID, "isEqual:")) != 0)
                                      {
                                        navigationChromeBackgroundImageURL = self->_navigationChromeBackgroundImageURL;
                                        if (!((unint64_t)navigationChromeBackgroundImageURL | *((_QWORD *)a3 + 23))
                                          || (v5 = -[NSString isEqual:](navigationChromeBackgroundImageURL, "isEqual:")) != 0)
                                        {
                                          navigationChromeBackgroundImageCompactURL = self->_navigationChromeBackgroundImageCompactURL;
                                          if (!((unint64_t)navigationChromeBackgroundImageCompactURL | *((_QWORD *)a3 + 21))
                                            || (v5 = -[NSString isEqual:](navigationChromeBackgroundImageCompactURL, "isEqual:")) != 0)
                                          {
                                            navigationChromeBackgroundImageLargeURL = self->_navigationChromeBackgroundImageLargeURL;
                                            if (!((unint64_t)navigationChromeBackgroundImageLargeURL | *((_QWORD *)a3 + 22))
                                              || (v5 = -[NSString isEqual:](navigationChromeBackgroundImageLargeURL, "isEqual:")) != 0)
                                            {
                                              navigationChromeBackgroundDarkModeImageURL = self->_navigationChromeBackgroundDarkModeImageURL;
                                              if (!((unint64_t)navigationChromeBackgroundDarkModeImageURL | *((_QWORD *)a3 + 20))
                                                || (v5 = -[NSString isEqual:](navigationChromeBackgroundDarkModeImageURL, "isEqual:")) != 0)
                                              {
                                                navigationChromeBackgroundDarkModeImageCompactURL = self->_navigationChromeBackgroundDarkModeImageCompactURL;
                                                if (!((unint64_t)navigationChromeBackgroundDarkModeImageCompactURL | *((_QWORD *)a3 + 18))
                                                  || (v5 = -[NSString isEqual:](navigationChromeBackgroundDarkModeImageCompactURL, "isEqual:")) != 0)
                                                {
                                                  navigationChromeBackgroundDarkModeImageLargeURL = self->_navigationChromeBackgroundDarkModeImageLargeURL;
                                                  if (!((unint64_t)navigationChromeBackgroundDarkModeImageLargeURL | *((_QWORD *)a3 + 19))
                                                    || (v5 = -[NSString isEqual:](navigationChromeBackgroundDarkModeImageLargeURL, "isEqual:")) != 0)
                                                  {
                                                    kind = self->_kind;
                                                    if ((unint64_t)kind | *((_QWORD *)a3 + 10))
                                                      LOBYTE(v5) = -[NSString isEqual:](kind, "isEqual:");
                                                    else
                                                      LOBYTE(v5) = 1;
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
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
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;

  v3 = -[NTPBRecordBase hash](self->_base, "hash");
  v4 = -[NSString hash](self->_name, "hash");
  v5 = -[NSString hash](self->_engineResourceID, "hash");
  v6 = -[NSString hash](self->_superfeedConfigResourceID, "hash");
  v7 = -[NSMutableArray hash](self->_latestPuzzleIDs, "hash");
  v8 = -[NSMutableArray hash](self->_promotedPuzzleIDs, "hash");
  v9 = -[NSString hash](self->_language, "hash");
  v10 = -[NSMutableArray hash](self->_blockedStorefrontIDs, "hash");
  v11 = -[NSMutableArray hash](self->_allowedStorefrontIDs, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v12 = 2654435761 * self->_minimumNewsVersion;
  else
    v12 = 0;
  v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[NSString hash](self->_nameImageURL, "hash");
  v14 = -[NSString hash](self->_nameImageCompactURL, "hash");
  v15 = v14 ^ -[NSString hash](self->_nameImageForDarkBackgroundURL, "hash");
  v16 = v15 ^ -[NSString hash](self->_nameImageMaskURL, "hash");
  v17 = v16 ^ -[NSString hash](self->_coverImageURL, "hash");
  v18 = v13 ^ v17 ^ -[NSString hash](self->_feedNavImageURL, "hash");
  v19 = -[NSString hash](self->_exploreTileImageURL, "hash");
  v20 = v19 ^ -[NSString hash](self->_themeConfiguration, "hash");
  v21 = v20 ^ -[NSString hash](self->_imagesResourceID, "hash");
  v22 = v21 ^ -[NSString hash](self->_navigationChromeBackgroundImageURL, "hash");
  v23 = v22 ^ -[NSString hash](self->_navigationChromeBackgroundImageCompactURL, "hash");
  v24 = v18 ^ v23 ^ -[NSString hash](self->_navigationChromeBackgroundImageLargeURL, "hash");
  v25 = -[NSString hash](self->_navigationChromeBackgroundDarkModeImageURL, "hash");
  v26 = v25 ^ -[NSString hash](self->_navigationChromeBackgroundDarkModeImageCompactURL, "hash");
  v27 = v26 ^ -[NSString hash](self->_navigationChromeBackgroundDarkModeImageLargeURL, "hash");
  return v24 ^ v27 ^ -[NSString hash](self->_kind, "hash");
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
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t m;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  base = self->_base;
  v6 = *((_QWORD *)a3 + 3);
  if (base)
  {
    if (v6)
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBPuzzleTypeRecord setBase:](self, "setBase:");
  }
  if (*((_QWORD *)a3 + 13))
    -[NTPBPuzzleTypeRecord setName:](self, "setName:");
  if (*((_QWORD *)a3 + 6))
    -[NTPBPuzzleTypeRecord setEngineResourceID:](self, "setEngineResourceID:");
  if (*((_QWORD *)a3 + 25))
    -[NTPBPuzzleTypeRecord setSuperfeedConfigResourceID:](self, "setSuperfeedConfigResourceID:");
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 12);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        -[NTPBPuzzleTypeRecord addLatestPuzzleIDs:](self, "addLatestPuzzleIDs:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v9);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = (void *)*((_QWORD *)a3 + 24);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        -[NTPBPuzzleTypeRecord addPromotedPuzzleIDs:](self, "addPromotedPuzzleIDs:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v14);
  }
  if (*((_QWORD *)a3 + 11))
    -[NTPBPuzzleTypeRecord setLanguage:](self, "setLanguage:");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = (void *)*((_QWORD *)a3 + 4);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        -[NTPBPuzzleTypeRecord addBlockedStorefrontIDs:](self, "addBlockedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    }
    while (v19);
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = (void *)*((_QWORD *)a3 + 2);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v28;
    do
    {
      for (m = 0; m != v24; ++m)
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v22);
        -[NTPBPuzzleTypeRecord addAllowedStorefrontIDs:](self, "addAllowedStorefrontIDs:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * m));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    }
    while (v24);
  }
  if ((*((_BYTE *)a3 + 216) & 1) != 0)
  {
    self->_minimumNewsVersion = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 17))
    -[NTPBPuzzleTypeRecord setNameImageURL:](self, "setNameImageURL:");
  if (*((_QWORD *)a3 + 14))
    -[NTPBPuzzleTypeRecord setNameImageCompactURL:](self, "setNameImageCompactURL:");
  if (*((_QWORD *)a3 + 15))
    -[NTPBPuzzleTypeRecord setNameImageForDarkBackgroundURL:](self, "setNameImageForDarkBackgroundURL:");
  if (*((_QWORD *)a3 + 16))
    -[NTPBPuzzleTypeRecord setNameImageMaskURL:](self, "setNameImageMaskURL:");
  if (*((_QWORD *)a3 + 5))
    -[NTPBPuzzleTypeRecord setCoverImageURL:](self, "setCoverImageURL:");
  if (*((_QWORD *)a3 + 8))
    -[NTPBPuzzleTypeRecord setFeedNavImageURL:](self, "setFeedNavImageURL:");
  if (*((_QWORD *)a3 + 7))
    -[NTPBPuzzleTypeRecord setExploreTileImageURL:](self, "setExploreTileImageURL:");
  if (*((_QWORD *)a3 + 26))
    -[NTPBPuzzleTypeRecord setThemeConfiguration:](self, "setThemeConfiguration:");
  if (*((_QWORD *)a3 + 9))
    -[NTPBPuzzleTypeRecord setImagesResourceID:](self, "setImagesResourceID:");
  if (*((_QWORD *)a3 + 23))
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundImageURL:](self, "setNavigationChromeBackgroundImageURL:");
  if (*((_QWORD *)a3 + 21))
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundImageCompactURL:](self, "setNavigationChromeBackgroundImageCompactURL:");
  if (*((_QWORD *)a3 + 22))
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundImageLargeURL:](self, "setNavigationChromeBackgroundImageLargeURL:");
  if (*((_QWORD *)a3 + 20))
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundDarkModeImageURL:](self, "setNavigationChromeBackgroundDarkModeImageURL:");
  if (*((_QWORD *)a3 + 18))
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundDarkModeImageCompactURL:](self, "setNavigationChromeBackgroundDarkModeImageCompactURL:");
  if (*((_QWORD *)a3 + 19))
    -[NTPBPuzzleTypeRecord setNavigationChromeBackgroundDarkModeImageLargeURL:](self, "setNavigationChromeBackgroundDarkModeImageLargeURL:");
  if (*((_QWORD *)a3 + 10))
    -[NTPBPuzzleTypeRecord setKind:](self, "setKind:");
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSString)engineResourceID
{
  return self->_engineResourceID;
}

- (void)setEngineResourceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)superfeedConfigResourceID
{
  return self->_superfeedConfigResourceID;
}

- (void)setSuperfeedConfigResourceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSMutableArray)latestPuzzleIDs
{
  return self->_latestPuzzleIDs;
}

- (void)setLatestPuzzleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSMutableArray)promotedPuzzleIDs
{
  return self->_promotedPuzzleIDs;
}

- (void)setPromotedPuzzleIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableArray)blockedStorefrontIDs
{
  return self->_blockedStorefrontIDs;
}

- (void)setBlockedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)allowedStorefrontIDs
{
  return self->_allowedStorefrontIDs;
}

- (void)setAllowedStorefrontIDs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int64_t)minimumNewsVersion
{
  return self->_minimumNewsVersion;
}

- (NSString)nameImageURL
{
  return self->_nameImageURL;
}

- (void)setNameImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSString)nameImageCompactURL
{
  return self->_nameImageCompactURL;
}

- (void)setNameImageCompactURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSString)nameImageForDarkBackgroundURL
{
  return self->_nameImageForDarkBackgroundURL;
}

- (void)setNameImageForDarkBackgroundURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSString)nameImageMaskURL
{
  return self->_nameImageMaskURL;
}

- (void)setNameImageMaskURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSString)coverImageURL
{
  return self->_coverImageURL;
}

- (void)setCoverImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)feedNavImageURL
{
  return self->_feedNavImageURL;
}

- (void)setFeedNavImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)exploreTileImageURL
{
  return self->_exploreTileImageURL;
}

- (void)setExploreTileImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)themeConfiguration
{
  return self->_themeConfiguration;
}

- (void)setThemeConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (NSString)imagesResourceID
{
  return self->_imagesResourceID;
}

- (void)setImagesResourceID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSString)navigationChromeBackgroundImageURL
{
  return self->_navigationChromeBackgroundImageURL;
}

- (void)setNavigationChromeBackgroundImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSString)navigationChromeBackgroundImageCompactURL
{
  return self->_navigationChromeBackgroundImageCompactURL;
}

- (void)setNavigationChromeBackgroundImageCompactURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSString)navigationChromeBackgroundImageLargeURL
{
  return self->_navigationChromeBackgroundImageLargeURL;
}

- (void)setNavigationChromeBackgroundImageLargeURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSString)navigationChromeBackgroundDarkModeImageURL
{
  return self->_navigationChromeBackgroundDarkModeImageURL;
}

- (void)setNavigationChromeBackgroundDarkModeImageURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSString)navigationChromeBackgroundDarkModeImageCompactURL
{
  return self->_navigationChromeBackgroundDarkModeImageCompactURL;
}

- (void)setNavigationChromeBackgroundDarkModeImageCompactURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSString)navigationChromeBackgroundDarkModeImageLargeURL
{
  return self->_navigationChromeBackgroundDarkModeImageLargeURL;
}

- (void)setNavigationChromeBackgroundDarkModeImageLargeURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end
