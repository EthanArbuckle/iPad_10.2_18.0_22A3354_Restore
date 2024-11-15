@implementation NTPBWidgetConfig

- (void)setTopStoriesCutoffTime:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_topStoriesCutoffTime = a3;
}

- (void)setHasTopStoriesCutoffTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasTopStoriesCutoffTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setForYouCutoffTime:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_forYouCutoffTime = a3;
}

- (void)setHasForYouCutoffTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasForYouCutoffTime
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setTrendingCutoffTime:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_trendingCutoffTime = a3;
}

- (void)setHasTrendingCutoffTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasTrendingCutoffTime
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setEnabledSections:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_enabledSections = a3;
}

- (void)setHasEnabledSections:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasEnabledSections
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setParsecPopulationFloor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_parsecPopulationFloor = a3;
}

- (void)setHasParsecPopulationFloor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasParsecPopulationFloor
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setParsecPopulationCeiling:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_parsecPopulationCeiling = a3;
}

- (void)setHasParsecPopulationCeiling:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasParsecPopulationCeiling
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (int64_t)foregroundMinimumUpdateInterval
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_foregroundMinimumUpdateInterval;
  else
    return 60;
}

- (void)setForegroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_foregroundMinimumUpdateInterval = a3;
}

- (void)setHasForegroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasForegroundMinimumUpdateInterval
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (int64_t)backgroundMinimumUpdateInterval
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_backgroundMinimumUpdateInterval;
  else
    return 3600;
}

- (void)setBackgroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_backgroundMinimumUpdateInterval = a3;
}

- (void)setHasBackgroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBackgroundMinimumUpdateInterval
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTopStoriesForegroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_topStoriesForegroundMinimumUpdateInterval = a3;
}

- (void)setHasTopStoriesForegroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTopStoriesForegroundMinimumUpdateInterval
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setTopStoriesBackgroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_topStoriesBackgroundMinimumUpdateInterval = a3;
}

- (void)setHasTopStoriesBackgroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTopStoriesBackgroundMinimumUpdateInterval
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int64_t)forYouForegroundMinimumUpdateInterval
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_forYouForegroundMinimumUpdateInterval;
  else
    return 1200;
}

- (void)setForYouForegroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_forYouForegroundMinimumUpdateInterval = a3;
}

- (void)setHasForYouForegroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasForYouForegroundMinimumUpdateInterval
{
  return *(_BYTE *)&self->_has >> 7;
}

- (int64_t)forYouBackgroundMinimumUpdateInterval
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_forYouBackgroundMinimumUpdateInterval;
  else
    return 1200;
}

- (void)setForYouBackgroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_forYouBackgroundMinimumUpdateInterval = a3;
}

- (void)setHasForYouBackgroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasForYouBackgroundMinimumUpdateInterval
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setTrendingForegroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_trendingForegroundMinimumUpdateInterval = a3;
}

- (void)setHasTrendingForegroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasTrendingForegroundMinimumUpdateInterval
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setTrendingBackgroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_trendingBackgroundMinimumUpdateInterval = a3;
}

- (void)setHasTrendingBackgroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasTrendingBackgroundMinimumUpdateInterval
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setAlternativeButlerWidgetConfigPopulationFloor:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_alternativeButlerWidgetConfigPopulationFloor = a3;
}

- (void)setHasAlternativeButlerWidgetConfigPopulationFloor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAlternativeButlerWidgetConfigPopulationFloor
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setAlternativeButlerWidgetConfigPopulationCeiling:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_alternativeButlerWidgetConfigPopulationCeiling = a3;
}

- (void)setHasAlternativeButlerWidgetConfigPopulationCeiling:(BOOL)a3
{
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAlternativeButlerWidgetConfigPopulationCeiling
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setParsecTrendingCutoffTime:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_parsecTrendingCutoffTime = a3;
}

- (void)setHasParsecTrendingCutoffTime:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasParsecTrendingCutoffTime
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int64_t)articleListForegroundMinimumUpdateInterval
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_articleListForegroundMinimumUpdateInterval;
  else
    return 1200;
}

- (void)setArticleListForegroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_articleListForegroundMinimumUpdateInterval = a3;
}

- (void)setHasArticleListForegroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasArticleListForegroundMinimumUpdateInterval
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int64_t)articleListBackgroundMinimumUpdateInterval
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_articleListBackgroundMinimumUpdateInterval;
  else
    return 1200;
}

- (void)setArticleListBackgroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_articleListBackgroundMinimumUpdateInterval = a3;
}

- (void)setHasArticleListBackgroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasArticleListBackgroundMinimumUpdateInterval
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int64_t)trendingByParsecForegroundMinimumUpdateInterval
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_trendingByParsecForegroundMinimumUpdateInterval;
  else
    return 1200;
}

- (void)setTrendingByParsecForegroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_trendingByParsecForegroundMinimumUpdateInterval = a3;
}

- (void)setHasTrendingByParsecForegroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasTrendingByParsecForegroundMinimumUpdateInterval
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int64_t)trendingByParsecBackgroundMinimumUpdateInterval
{
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    return self->_trendingByParsecBackgroundMinimumUpdateInterval;
  else
    return 1200;
}

- (void)setTrendingByParsecBackgroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_trendingByParsecBackgroundMinimumUpdateInterval = a3;
}

- (void)setHasTrendingByParsecBackgroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasTrendingByParsecBackgroundMinimumUpdateInterval
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int64_t)widgetSectionConfigForegroundMinimumUpdateInterval
{
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    return self->_widgetSectionConfigForegroundMinimumUpdateInterval;
  else
    return 60;
}

- (void)setWidgetSectionConfigForegroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_widgetSectionConfigForegroundMinimumUpdateInterval = a3;
}

- (void)setHasWidgetSectionConfigForegroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasWidgetSectionConfigForegroundMinimumUpdateInterval
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (int64_t)widgetSectionConfigBackgroundMinimumUpdateInterval
{
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    return self->_widgetSectionConfigBackgroundMinimumUpdateInterval;
  else
    return 3600;
}

- (void)setWidgetSectionConfigBackgroundMinimumUpdateInterval:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_widgetSectionConfigBackgroundMinimumUpdateInterval = a3;
}

- (void)setHasWidgetSectionConfigBackgroundMinimumUpdateInterval:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasWidgetSectionConfigBackgroundMinimumUpdateInterval
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (int64_t)minimumArticleExposureDurationToBePreseen
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_minimumArticleExposureDurationToBePreseen;
  else
    return 1000;
}

- (void)setMinimumArticleExposureDurationToBePreseen:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_minimumArticleExposureDurationToBePreseen = a3;
}

- (void)setHasMinimumArticleExposureDurationToBePreseen:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMinimumArticleExposureDurationToBePreseen
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (unsigned)minimumNumberOfTimesPreseenToBeSeen
{
  if ((*((_BYTE *)&self->_has + 3) & 1) != 0)
    return self->_minimumNumberOfTimesPreseenToBeSeen;
  else
    return 2;
}

- (void)setMinimumNumberOfTimesPreseenToBeSeen:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_minimumNumberOfTimesPreseenToBeSeen = a3;
}

- (void)setHasMinimumNumberOfTimesPreseenToBeSeen:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($9BC32BF55D56916B44DC0A5BBED21F64)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasMinimumNumberOfTimesPreseenToBeSeen
{
  return *((_BYTE *)&self->_has + 3) & 1;
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
  v8.super_class = (Class)NTPBWidgetConfig;
  -[NTPBWidgetConfig description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBWidgetConfig dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  $9BC32BF55D56916B44DC0A5BBED21F64 has;
  void *v5;
  NSString *identifier;
  $9BC32BF55D56916B44DC0A5BBED21F64 v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_topStoriesCutoffTime);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("top_stories_cutoff_time"));

    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_forYouCutoffTime);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("for_you_cutoff_time"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_trendingCutoffTime);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("trending_cutoff_time"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_enabledSections);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("enabled_sections"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_parsecPopulationFloor);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("parsec_population_floor"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_parsecPopulationCeiling);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("parsec_population_ceiling"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_foregroundMinimumUpdateInterval);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("foreground_minimum_update_interval"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_backgroundMinimumUpdateInterval);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("background_minimum_update_interval"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_topStoriesForegroundMinimumUpdateInterval);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("top_stories_foreground_minimum_update_interval"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_topStoriesBackgroundMinimumUpdateInterval);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("top_stories_background_minimum_update_interval"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_forYouForegroundMinimumUpdateInterval);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("for_you_foreground_minimum_update_interval"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_forYouBackgroundMinimumUpdateInterval);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("for_you_background_minimum_update_interval"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_trendingForegroundMinimumUpdateInterval);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("trending_foreground_minimum_update_interval"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_trendingBackgroundMinimumUpdateInterval);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("trending_background_minimum_update_interval"));

  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_alternativeButlerWidgetConfigPopulationFloor);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("alternative_butler_widget_config_population_floor"));

  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_alternativeButlerWidgetConfigPopulationCeiling);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("alternative_butler_widget_config_population_ceiling"));

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_parsecTrendingCutoffTime);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("parsec_trending_cutoff_time"));

  }
LABEL_19:
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_articleListForegroundMinimumUpdateInterval);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("article_list_foreground_minimum_update_interval"));

    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 4) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v7 & 0x40000) == 0)
        goto LABEL_24;
      goto LABEL_50;
    }
  }
  else if ((*(_BYTE *)&v7 & 4) == 0)
  {
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_articleListBackgroundMinimumUpdateInterval);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("article_list_background_minimum_update_interval"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v7 & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_trendingByParsecForegroundMinimumUpdateInterval);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("trending_by_parsec_foreground_minimum_update_interval"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v7 & 0x400000) == 0)
      goto LABEL_26;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_trendingByParsecBackgroundMinimumUpdateInterval);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("trending_by_parsec_background_minimum_update_interval"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v7 & 0x200000) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_widgetSectionConfigForegroundMinimumUpdateInterval);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("widget_section_config_foreground_minimum_update_interval"));

  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v7 & 0x200) == 0)
      goto LABEL_28;
LABEL_54:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_minimumArticleExposureDurationToBePreseen);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("minimum_article_exposure_duration_to_be_preseen"));

    if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
      return v3;
    goto LABEL_29;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_widgetSectionConfigBackgroundMinimumUpdateInterval);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("widget_section_config_background_minimum_update_interval"));

  v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) != 0)
    goto LABEL_54;
LABEL_28:
  if ((*(_DWORD *)&v7 & 0x1000000) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_minimumNumberOfTimesPreseenToBeSeen);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("minimum_number_of_times_preseen_to_be_seen"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWidgetConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $9BC32BF55D56916B44DC0A5BBED21F64 has;
  $9BC32BF55D56916B44DC0A5BBED21F64 v5;
  id v6;

  v6 = a3;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt64Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_46:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_18:
    PBDataWriterWriteInt64Field();
LABEL_19:
  if (self->_identifier)
    PBDataWriterWriteStringField();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = self->_has;
    if ((*(_BYTE *)&v5 & 4) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&v5 & 0x40000) == 0)
        goto LABEL_24;
      goto LABEL_50;
    }
  }
  else if ((*(_BYTE *)&v5 & 4) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v5 & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v5 & 0x400000) == 0)
      goto LABEL_26;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x400000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v5 & 0x200000) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v5 & 0x200) == 0)
      goto LABEL_28;
LABEL_54:
    PBDataWriterWriteInt64Field();
    if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_53:
  PBDataWriterWriteInt64Field();
  v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) != 0)
    goto LABEL_54;
LABEL_28:
  if ((*(_DWORD *)&v5 & 0x1000000) != 0)
LABEL_29:
    PBDataWriterWriteUint32Field();
LABEL_30:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $9BC32BF55D56916B44DC0A5BBED21F64 has;
  uint64_t v8;
  void *v9;
  $9BC32BF55D56916B44DC0A5BBED21F64 v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    *(_QWORD *)(v5 + 120) = self->_topStoriesCutoffTime;
    *(_DWORD *)(v5 + 212) |= 0x4000u;
    has = self->_has;
    if ((*(_BYTE *)&has & 0x40) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x80000) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 56) = self->_forYouCutoffTime;
  *(_DWORD *)(v5 + 212) |= 0x40u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_5;
    goto LABEL_32;
  }
LABEL_31:
  *(_QWORD *)(v5 + 160) = self->_trendingCutoffTime;
  *(_DWORD *)(v5 + 212) |= 0x80000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v5 + 192) = self->_enabledSections;
  *(_DWORD *)(v5 + 212) |= 0x800000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_34;
  }
LABEL_33:
  *(double *)(v5 + 96) = self->_parsecPopulationFloor;
  *(_DWORD *)(v5 + 212) |= 0x800u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_35;
  }
LABEL_34:
  *(double *)(v5 + 88) = self->_parsecPopulationCeiling;
  *(_DWORD *)(v5 + 212) |= 0x400u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_36;
  }
LABEL_35:
  *(_QWORD *)(v5 + 72) = self->_foregroundMinimumUpdateInterval;
  *(_DWORD *)(v5 + 212) |= 0x100u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_37;
  }
LABEL_36:
  *(_QWORD *)(v5 + 40) = self->_backgroundMinimumUpdateInterval;
  *(_DWORD *)(v5 + 212) |= 0x10u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_38;
  }
LABEL_37:
  *(_QWORD *)(v5 + 128) = self->_topStoriesForegroundMinimumUpdateInterval;
  *(_DWORD *)(v5 + 212) |= 0x8000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_39;
  }
LABEL_38:
  *(_QWORD *)(v5 + 112) = self->_topStoriesBackgroundMinimumUpdateInterval;
  *(_DWORD *)(v5 + 212) |= 0x2000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_40;
  }
LABEL_39:
  *(_QWORD *)(v5 + 64) = self->_forYouForegroundMinimumUpdateInterval;
  *(_DWORD *)(v5 + 212) |= 0x80u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_41;
  }
LABEL_40:
  *(_QWORD *)(v5 + 48) = self->_forYouBackgroundMinimumUpdateInterval;
  *(_DWORD *)(v5 + 212) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_42;
  }
LABEL_41:
  *(_QWORD *)(v5 + 168) = self->_trendingForegroundMinimumUpdateInterval;
  *(_DWORD *)(v5 + 212) |= 0x100000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_16;
    goto LABEL_43;
  }
LABEL_42:
  *(_QWORD *)(v5 + 136) = self->_trendingBackgroundMinimumUpdateInterval;
  *(_DWORD *)(v5 + 212) |= 0x10000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_43:
  *(double *)(v5 + 16) = self->_alternativeButlerWidgetConfigPopulationFloor;
  *(_DWORD *)(v5 + 212) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_44:
  *(double *)(v5 + 8) = self->_alternativeButlerWidgetConfigPopulationCeiling;
  *(_DWORD *)(v5 + 212) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_18:
    *(_QWORD *)(v5 + 104) = self->_parsecTrendingCutoffTime;
    *(_DWORD *)(v5 + 212) |= 0x1000u;
  }
LABEL_19:
  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 200);
  *(_QWORD *)(v6 + 200) = v8;

  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_articleListForegroundMinimumUpdateInterval;
    *(_DWORD *)(v6 + 212) |= 8u;
    v10 = self->_has;
    if ((*(_BYTE *)&v10 & 4) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v10 & 0x40000) == 0)
        goto LABEL_22;
      goto LABEL_48;
    }
  }
  else if ((*(_BYTE *)&v10 & 4) == 0)
  {
    goto LABEL_21;
  }
  *(_QWORD *)(v6 + 24) = self->_articleListBackgroundMinimumUpdateInterval;
  *(_DWORD *)(v6 + 212) |= 4u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v10 & 0x20000) == 0)
      goto LABEL_23;
    goto LABEL_49;
  }
LABEL_48:
  *(_QWORD *)(v6 + 152) = self->_trendingByParsecForegroundMinimumUpdateInterval;
  *(_DWORD *)(v6 + 212) |= 0x40000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v10 & 0x400000) == 0)
      goto LABEL_24;
    goto LABEL_50;
  }
LABEL_49:
  *(_QWORD *)(v6 + 144) = self->_trendingByParsecBackgroundMinimumUpdateInterval;
  *(_DWORD *)(v6 + 212) |= 0x20000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v10 & 0x200000) == 0)
      goto LABEL_25;
    goto LABEL_51;
  }
LABEL_50:
  *(_QWORD *)(v6 + 184) = self->_widgetSectionConfigForegroundMinimumUpdateInterval;
  *(_DWORD *)(v6 + 212) |= 0x400000u;
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x200000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v10 & 0x200) == 0)
      goto LABEL_26;
LABEL_52:
    *(_QWORD *)(v6 + 80) = self->_minimumArticleExposureDurationToBePreseen;
    *(_DWORD *)(v6 + 212) |= 0x200u;
    if ((*(_DWORD *)&self->_has & 0x1000000) == 0)
      return (id)v6;
    goto LABEL_27;
  }
LABEL_51:
  *(_QWORD *)(v6 + 176) = self->_widgetSectionConfigBackgroundMinimumUpdateInterval;
  *(_DWORD *)(v6 + 212) |= 0x200000u;
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) != 0)
    goto LABEL_52;
LABEL_26:
  if ((*(_DWORD *)&v10 & 0x1000000) != 0)
  {
LABEL_27:
    *(_DWORD *)(v6 + 208) = self->_minimumNumberOfTimesPreseenToBeSeen;
    *(_DWORD *)(v6 + 212) |= 0x1000000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $9BC32BF55D56916B44DC0A5BBED21F64 has;
  int v6;
  NSString *identifier;
  int v8;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_130;
  has = self->_has;
  v6 = *((_DWORD *)v4 + 53);
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_topStoriesCutoffTime != *((_QWORD *)v4 + 15))
      goto LABEL_130;
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_forYouCutoffTime != *((_QWORD *)v4 + 7))
      goto LABEL_130;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_trendingCutoffTime != *((_QWORD *)v4 + 20))
      goto LABEL_130;
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_enabledSections != *((_DWORD *)v4 + 48))
      goto LABEL_130;
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_parsecPopulationFloor != *((double *)v4 + 12))
      goto LABEL_130;
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_parsecPopulationCeiling != *((double *)v4 + 11))
      goto LABEL_130;
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_foregroundMinimumUpdateInterval != *((_QWORD *)v4 + 9))
      goto LABEL_130;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_backgroundMinimumUpdateInterval != *((_QWORD *)v4 + 5))
      goto LABEL_130;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_topStoriesForegroundMinimumUpdateInterval != *((_QWORD *)v4 + 16))
      goto LABEL_130;
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_topStoriesBackgroundMinimumUpdateInterval != *((_QWORD *)v4 + 14))
      goto LABEL_130;
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_forYouForegroundMinimumUpdateInterval != *((_QWORD *)v4 + 8))
      goto LABEL_130;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_forYouBackgroundMinimumUpdateInterval != *((_QWORD *)v4 + 6))
      goto LABEL_130;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_trendingForegroundMinimumUpdateInterval != *((_QWORD *)v4 + 21))
      goto LABEL_130;
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_trendingBackgroundMinimumUpdateInterval != *((_QWORD *)v4 + 17))
      goto LABEL_130;
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_alternativeButlerWidgetConfigPopulationFloor != *((double *)v4 + 2))
      goto LABEL_130;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_alternativeButlerWidgetConfigPopulationCeiling != *((double *)v4 + 1))
      goto LABEL_130;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_parsecTrendingCutoffTime != *((_QWORD *)v4 + 13))
      goto LABEL_130;
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_130;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
    {
LABEL_130:
      v9 = 0;
      goto LABEL_131;
    }
    has = self->_has;
  }
  v8 = *((_DWORD *)v4 + 53);
  if ((*(_BYTE *)&has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_articleListForegroundMinimumUpdateInterval != *((_QWORD *)v4 + 4))
      goto LABEL_130;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_articleListBackgroundMinimumUpdateInterval != *((_QWORD *)v4 + 3))
      goto LABEL_130;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v8 & 0x40000) == 0 || self->_trendingByParsecForegroundMinimumUpdateInterval != *((_QWORD *)v4 + 19))
      goto LABEL_130;
  }
  else if ((v8 & 0x40000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v8 & 0x20000) == 0 || self->_trendingByParsecBackgroundMinimumUpdateInterval != *((_QWORD *)v4 + 18))
      goto LABEL_130;
  }
  else if ((v8 & 0x20000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0 || self->_widgetSectionConfigForegroundMinimumUpdateInterval != *((_QWORD *)v4 + 23))
      goto LABEL_130;
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v8 & 0x200000) == 0 || self->_widgetSectionConfigBackgroundMinimumUpdateInterval != *((_QWORD *)v4 + 22))
      goto LABEL_130;
  }
  else if ((v8 & 0x200000) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_minimumArticleExposureDurationToBePreseen != *((_QWORD *)v4 + 10))
      goto LABEL_130;
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_130;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_minimumNumberOfTimesPreseenToBeSeen != *((_DWORD *)v4 + 52))
      goto LABEL_130;
    v9 = 1;
  }
  else
  {
    v9 = (v8 & 0x1000000) == 0;
  }
LABEL_131:

  return v9;
}

- (unint64_t)hash
{
  $9BC32BF55D56916B44DC0A5BBED21F64 has;
  double parsecPopulationFloor;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double parsecPopulationCeiling;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double alternativeButlerWidgetConfigPopulationFloor;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  double alternativeButlerWidgetConfigPopulationCeiling;
  double v23;
  long double v24;
  double v25;
  uint64_t v26;
  NSUInteger v27;
  $9BC32BF55D56916B44DC0A5BBED21F64 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  has = self->_has;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    v48 = 2654435761 * self->_topStoriesCutoffTime;
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
LABEL_3:
      v47 = 2654435761 * self->_forYouCutoffTime;
      if ((*(_DWORD *)&has & 0x80000) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v48 = 0;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_3;
  }
  v47 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_4:
    v46 = 2654435761 * self->_trendingCutoffTime;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_5;
LABEL_13:
    v45 = 0;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_6;
LABEL_14:
    v8 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v46 = 0;
  if ((*(_DWORD *)&has & 0x800000) == 0)
    goto LABEL_13;
LABEL_5:
  v45 = 2654435761 * self->_enabledSections;
  if ((*(_WORD *)&has & 0x800) == 0)
    goto LABEL_14;
LABEL_6:
  parsecPopulationFloor = self->_parsecPopulationFloor;
  v5 = -parsecPopulationFloor;
  if (parsecPopulationFloor >= 0.0)
    v5 = self->_parsecPopulationFloor;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_17:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    parsecPopulationCeiling = self->_parsecPopulationCeiling;
    v11 = -parsecPopulationCeiling;
    if (parsecPopulationCeiling >= 0.0)
      v11 = self->_parsecPopulationCeiling;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    v44 = 2654435761 * self->_foregroundMinimumUpdateInterval;
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
LABEL_27:
      v43 = 2654435761 * self->_backgroundMinimumUpdateInterval;
      if ((*(_WORD *)&has & 0x8000) != 0)
        goto LABEL_28;
      goto LABEL_40;
    }
  }
  else
  {
    v44 = 0;
    if ((*(_BYTE *)&has & 0x10) != 0)
      goto LABEL_27;
  }
  v43 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_28:
    v42 = 2654435761 * self->_topStoriesForegroundMinimumUpdateInterval;
    if ((*(_WORD *)&has & 0x2000) != 0)
      goto LABEL_29;
    goto LABEL_41;
  }
LABEL_40:
  v42 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_29:
    v41 = 2654435761 * self->_topStoriesBackgroundMinimumUpdateInterval;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_30;
    goto LABEL_42;
  }
LABEL_41:
  v41 = 0;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_30:
    v40 = 2654435761 * self->_forYouForegroundMinimumUpdateInterval;
    if ((*(_BYTE *)&has & 0x20) != 0)
      goto LABEL_31;
    goto LABEL_43;
  }
LABEL_42:
  v40 = 0;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
LABEL_31:
    v38 = 2654435761 * self->_forYouBackgroundMinimumUpdateInterval;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_32;
    goto LABEL_44;
  }
LABEL_43:
  v38 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_32:
    v14 = 2654435761 * self->_trendingForegroundMinimumUpdateInterval;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_33;
LABEL_45:
    v15 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_34;
LABEL_46:
    v20 = 0;
    goto LABEL_49;
  }
LABEL_44:
  v14 = 0;
  if ((*(_DWORD *)&has & 0x10000) == 0)
    goto LABEL_45;
LABEL_33:
  v15 = 2654435761 * self->_trendingBackgroundMinimumUpdateInterval;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_46;
LABEL_34:
  alternativeButlerWidgetConfigPopulationFloor = self->_alternativeButlerWidgetConfigPopulationFloor;
  v17 = -alternativeButlerWidgetConfigPopulationFloor;
  if (alternativeButlerWidgetConfigPopulationFloor >= 0.0)
    v17 = self->_alternativeButlerWidgetConfigPopulationFloor;
  v18 = floor(v17 + 0.5);
  v19 = (v17 - v18) * 1.84467441e19;
  v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
  if (v19 >= 0.0)
  {
    if (v19 > 0.0)
      v20 += (unint64_t)v19;
  }
  else
  {
    v20 -= (unint64_t)fabs(v19);
  }
LABEL_49:
  if ((*(_BYTE *)&has & 1) != 0)
  {
    alternativeButlerWidgetConfigPopulationCeiling = self->_alternativeButlerWidgetConfigPopulationCeiling;
    v23 = -alternativeButlerWidgetConfigPopulationCeiling;
    if (alternativeButlerWidgetConfigPopulationCeiling >= 0.0)
      v23 = self->_alternativeButlerWidgetConfigPopulationCeiling;
    v24 = floor(v23 + 0.5);
    v25 = (v23 - v24) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0)
        v21 += (unint64_t)v25;
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    v21 = 0;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
    v26 = 2654435761 * self->_parsecTrendingCutoffTime;
  else
    v26 = 0;
  v27 = -[NSString hash](self->_identifier, "hash", v38);
  v28 = self->_has;
  if ((*(_BYTE *)&v28 & 8) != 0)
  {
    v29 = 2654435761 * self->_articleListForegroundMinimumUpdateInterval;
    if ((*(_BYTE *)&v28 & 4) != 0)
    {
LABEL_62:
      v30 = 2654435761 * self->_articleListBackgroundMinimumUpdateInterval;
      if ((*(_DWORD *)&v28 & 0x40000) != 0)
        goto LABEL_63;
      goto LABEL_71;
    }
  }
  else
  {
    v29 = 0;
    if ((*(_BYTE *)&v28 & 4) != 0)
      goto LABEL_62;
  }
  v30 = 0;
  if ((*(_DWORD *)&v28 & 0x40000) != 0)
  {
LABEL_63:
    v31 = 2654435761 * self->_trendingByParsecForegroundMinimumUpdateInterval;
    if ((*(_DWORD *)&v28 & 0x20000) != 0)
      goto LABEL_64;
    goto LABEL_72;
  }
LABEL_71:
  v31 = 0;
  if ((*(_DWORD *)&v28 & 0x20000) != 0)
  {
LABEL_64:
    v32 = 2654435761 * self->_trendingByParsecBackgroundMinimumUpdateInterval;
    if ((*(_DWORD *)&v28 & 0x400000) != 0)
      goto LABEL_65;
    goto LABEL_73;
  }
LABEL_72:
  v32 = 0;
  if ((*(_DWORD *)&v28 & 0x400000) != 0)
  {
LABEL_65:
    v33 = 2654435761 * self->_widgetSectionConfigForegroundMinimumUpdateInterval;
    if ((*(_DWORD *)&v28 & 0x200000) != 0)
      goto LABEL_66;
    goto LABEL_74;
  }
LABEL_73:
  v33 = 0;
  if ((*(_DWORD *)&v28 & 0x200000) != 0)
  {
LABEL_66:
    v34 = 2654435761 * self->_widgetSectionConfigBackgroundMinimumUpdateInterval;
    if ((*(_WORD *)&v28 & 0x200) != 0)
      goto LABEL_67;
LABEL_75:
    v35 = 0;
    if ((*(_DWORD *)&v28 & 0x1000000) != 0)
      goto LABEL_68;
LABEL_76:
    v36 = 0;
    return v47 ^ v48 ^ v46 ^ v45 ^ v8 ^ v9 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v14 ^ v15 ^ v20 ^ v21 ^ v26 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v27 ^ v34 ^ v35 ^ v36;
  }
LABEL_74:
  v34 = 0;
  if ((*(_WORD *)&v28 & 0x200) == 0)
    goto LABEL_75;
LABEL_67:
  v35 = 2654435761 * self->_minimumArticleExposureDurationToBePreseen;
  if ((*(_DWORD *)&v28 & 0x1000000) == 0)
    goto LABEL_76;
LABEL_68:
  v36 = 2654435761 * self->_minimumNumberOfTimesPreseenToBeSeen;
  return v47 ^ v48 ^ v46 ^ v45 ^ v8 ^ v9 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v14 ^ v15 ^ v20 ^ v21 ^ v26 ^ v29 ^ v30 ^ v31 ^ v32 ^ v33 ^ v27 ^ v34 ^ v35 ^ v36;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x4000) != 0)
  {
    self->_topStoriesCutoffTime = *((_QWORD *)v4 + 15);
    *(_DWORD *)&self->_has |= 0x4000u;
    v5 = *((_DWORD *)v4 + 53);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x80000) == 0)
        goto LABEL_4;
      goto LABEL_33;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_forYouCutoffTime = *((_QWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x80000) == 0)
  {
LABEL_4:
    if ((v5 & 0x800000) == 0)
      goto LABEL_5;
    goto LABEL_34;
  }
LABEL_33:
  self->_trendingCutoffTime = *((_QWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x800000) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0)
      goto LABEL_6;
    goto LABEL_35;
  }
LABEL_34:
  self->_enabledSections = *((_DWORD *)v4 + 48);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_36;
  }
LABEL_35:
  self->_parsecPopulationFloor = *((double *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_37;
  }
LABEL_36:
  self->_parsecPopulationCeiling = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  self->_foregroundMinimumUpdateInterval = *((_QWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x10) == 0)
  {
LABEL_9:
    if ((v5 & 0x8000) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  self->_backgroundMinimumUpdateInterval = *((_QWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((v5 & 0x2000) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  self->_topStoriesForegroundMinimumUpdateInterval = *((_QWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x2000) == 0)
  {
LABEL_11:
    if ((v5 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  self->_topStoriesBackgroundMinimumUpdateInterval = *((_QWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x80) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  self->_forYouForegroundMinimumUpdateInterval = *((_QWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x100000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  self->_forYouBackgroundMinimumUpdateInterval = *((_QWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x100000) == 0)
  {
LABEL_14:
    if ((v5 & 0x10000) == 0)
      goto LABEL_15;
    goto LABEL_44;
  }
LABEL_43:
  self->_trendingForegroundMinimumUpdateInterval = *((_QWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 0x10000) == 0)
  {
LABEL_15:
    if ((v5 & 2) == 0)
      goto LABEL_16;
    goto LABEL_45;
  }
LABEL_44:
  self->_trendingBackgroundMinimumUpdateInterval = *((_QWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 2) == 0)
  {
LABEL_16:
    if ((v5 & 1) == 0)
      goto LABEL_17;
    goto LABEL_46;
  }
LABEL_45:
  self->_alternativeButlerWidgetConfigPopulationFloor = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)v4 + 53);
  if ((v5 & 1) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_46:
  self->_alternativeButlerWidgetConfigPopulationCeiling = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)v4 + 53) & 0x1000) != 0)
  {
LABEL_18:
    self->_parsecTrendingCutoffTime = *((_QWORD *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_19:
  if (*((_QWORD *)v4 + 25))
  {
    v7 = v4;
    -[NTPBWidgetConfig setIdentifier:](self, "setIdentifier:");
    v4 = v7;
  }
  v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 8) != 0)
  {
    self->_articleListForegroundMinimumUpdateInterval = *((_QWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 8u;
    v6 = *((_DWORD *)v4 + 53);
    if ((v6 & 4) == 0)
    {
LABEL_23:
      if ((v6 & 0x40000) == 0)
        goto LABEL_24;
      goto LABEL_50;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_23;
  }
  self->_articleListBackgroundMinimumUpdateInterval = *((_QWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x40000) == 0)
  {
LABEL_24:
    if ((v6 & 0x20000) == 0)
      goto LABEL_25;
    goto LABEL_51;
  }
LABEL_50:
  self->_trendingByParsecForegroundMinimumUpdateInterval = *((_QWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x20000) == 0)
  {
LABEL_25:
    if ((v6 & 0x400000) == 0)
      goto LABEL_26;
    goto LABEL_52;
  }
LABEL_51:
  self->_trendingByParsecBackgroundMinimumUpdateInterval = *((_QWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x400000) == 0)
  {
LABEL_26:
    if ((v6 & 0x200000) == 0)
      goto LABEL_27;
    goto LABEL_53;
  }
LABEL_52:
  self->_widgetSectionConfigForegroundMinimumUpdateInterval = *((_QWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x400000u;
  v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x200000) == 0)
  {
LABEL_27:
    if ((v6 & 0x200) == 0)
      goto LABEL_28;
LABEL_54:
    self->_minimumArticleExposureDurationToBePreseen = *((_QWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x200u;
    if ((*((_DWORD *)v4 + 53) & 0x1000000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_53:
  self->_widgetSectionConfigBackgroundMinimumUpdateInterval = *((_QWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  v6 = *((_DWORD *)v4 + 53);
  if ((v6 & 0x200) != 0)
    goto LABEL_54;
LABEL_28:
  if ((v6 & 0x1000000) != 0)
  {
LABEL_29:
    self->_minimumNumberOfTimesPreseenToBeSeen = *((_DWORD *)v4 + 52);
    *(_DWORD *)&self->_has |= 0x1000000u;
  }
LABEL_30:

}

- (int64_t)topStoriesCutoffTime
{
  return self->_topStoriesCutoffTime;
}

- (int64_t)forYouCutoffTime
{
  return self->_forYouCutoffTime;
}

- (int64_t)trendingCutoffTime
{
  return self->_trendingCutoffTime;
}

- (unsigned)enabledSections
{
  return self->_enabledSections;
}

- (double)parsecPopulationFloor
{
  return self->_parsecPopulationFloor;
}

- (double)parsecPopulationCeiling
{
  return self->_parsecPopulationCeiling;
}

- (int64_t)topStoriesForegroundMinimumUpdateInterval
{
  return self->_topStoriesForegroundMinimumUpdateInterval;
}

- (int64_t)topStoriesBackgroundMinimumUpdateInterval
{
  return self->_topStoriesBackgroundMinimumUpdateInterval;
}

- (int64_t)trendingForegroundMinimumUpdateInterval
{
  return self->_trendingForegroundMinimumUpdateInterval;
}

- (int64_t)trendingBackgroundMinimumUpdateInterval
{
  return self->_trendingBackgroundMinimumUpdateInterval;
}

- (double)alternativeButlerWidgetConfigPopulationFloor
{
  return self->_alternativeButlerWidgetConfigPopulationFloor;
}

- (double)alternativeButlerWidgetConfigPopulationCeiling
{
  return self->_alternativeButlerWidgetConfigPopulationCeiling;
}

- (int64_t)parsecTrendingCutoffTime
{
  return self->_parsecTrendingCutoffTime;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
