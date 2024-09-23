@implementation NTPBTodaySectionConfig

- (void)dealloc
{
  objc_super v3;

  -[NTPBTodaySectionConfig setName:](self, "setName:", 0);
  -[NTPBTodaySectionConfig setIdentifier:](self, "setIdentifier:", 0);
  -[NTPBTodaySectionConfig setArticleListTodaySectionConfig:](self, "setArticleListTodaySectionConfig:", 0);
  -[NTPBTodaySectionConfig setForYouTodaySectionConfig:](self, "setForYouTodaySectionConfig:", 0);
  -[NTPBTodaySectionConfig setArticleIDsTodaySectionConfig:](self, "setArticleIDsTodaySectionConfig:", 0);
  -[NTPBTodaySectionConfig setNameColorLight:](self, "setNameColorLight:", 0);
  -[NTPBTodaySectionConfig setPersonalizedTodaySectionConfig:](self, "setPersonalizedTodaySectionConfig:", 0);
  -[NTPBTodaySectionConfig setPersonalizationFeatureID:](self, "setPersonalizationFeatureID:", 0);
  -[NTPBTodaySectionConfig setPersonalizedPresenceConfig:](self, "setPersonalizedPresenceConfig:", 0);
  PBRepeatedUInt64Clear();
  -[NTPBTodaySectionConfig setBackgroundGradientColor:](self, "setBackgroundGradientColor:", 0);
  -[NTPBTodaySectionConfig setCompactName:](self, "setCompactName:", 0);
  -[NTPBTodaySectionConfig setPersonalizedPresenceFeatureID:](self, "setPersonalizedPresenceFeatureID:", 0);
  -[NTPBTodaySectionConfig setReferralBarName:](self, "setReferralBarName:", 0);
  -[NTPBTodaySectionConfig setGroupActionTitle:](self, "setGroupActionTitle:", 0);
  -[NTPBTodaySectionConfig setGroupActionUrl:](self, "setGroupActionUrl:", 0);
  -[NTPBTodaySectionConfig setItemsTodaySectionConfig:](self, "setItemsTodaySectionConfig:", 0);
  -[NTPBTodaySectionConfig setNameColorDark:](self, "setNameColorDark:", 0);
  -[NTPBTodaySectionConfig setTagTodaySectionConfig:](self, "setTagTodaySectionConfig:", 0);
  -[NTPBTodaySectionConfig setMutingTagID:](self, "setMutingTagID:", 0);
  -[NTPBTodaySectionConfig setGroupNameActionUrl:](self, "setGroupNameActionUrl:", 0);
  -[NTPBTodaySectionConfig setBackgroundColorLight:](self, "setBackgroundColorLight:", 0);
  -[NTPBTodaySectionConfig setBackgroundColorDark:](self, "setBackgroundColorDark:", 0);
  -[NTPBTodaySectionConfig setSubidentifier:](self, "setSubidentifier:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfig;
  -[NTPBTodaySectionConfig dealloc](&v3, sel_dealloc);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setFallbackOrder:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_fallbackOrder = a3;
}

- (void)setHasFallbackOrder:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasFallbackOrder
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)sectionType
{
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    return self->_sectionType;
  else
    return 0;
}

- (void)setSectionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_sectionType = a3;
}

- (void)setHasSectionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasSectionType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (unint64_t)cachedResultCutoffTime
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_cachedResultCutoffTime;
  else
    return 86400;
}

- (void)setCachedResultCutoffTime:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_cachedResultCutoffTime = a3;
}

- (void)setHasCachedResultCutoffTime:(BOOL)a3
{
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasCachedResultCutoffTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)readArticlesFilterMethod
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_readArticlesFilterMethod;
  else
    return 1;
}

- (void)setReadArticlesFilterMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_readArticlesFilterMethod = a3;
}

- (void)setHasReadArticlesFilterMethod:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasReadArticlesFilterMethod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasArticleListTodaySectionConfig
{
  return self->_articleListTodaySectionConfig != 0;
}

- (BOOL)hasForYouTodaySectionConfig
{
  return self->_forYouTodaySectionConfig != 0;
}

- (void)setMinimumStoriesAllocation:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_minimumStoriesAllocation = a3;
}

- (void)setHasMinimumStoriesAllocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasMinimumStoriesAllocation
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setMaximumStoriesAllocation:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_maximumStoriesAllocation = a3;
}

- (void)setHasMaximumStoriesAllocation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasMaximumStoriesAllocation
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setIntraSectionFilteringOptions:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_intraSectionFilteringOptions = a3;
}

- (void)setHasIntraSectionFilteringOptions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasIntraSectionFilteringOptions
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setInterSectionFilteringOptions:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_interSectionFilteringOptions = a3;
}

- (void)setHasInterSectionFilteringOptions:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasInterSectionFilteringOptions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)seenArticlesFilterMethod
{
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    return self->_seenArticlesFilterMethod;
  else
    return 1;
}

- (void)setSeenArticlesFilterMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_seenArticlesFilterMethod = a3;
}

- (void)setHasSeenArticlesFilterMethod:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSeenArticlesFilterMethod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasArticleIDsTodaySectionConfig
{
  return self->_articleIDsTodaySectionConfig != 0;
}

- (void)setShownInFavoritesOnlyMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_shownInFavoritesOnlyMode = a3;
}

- (void)setHasShownInFavoritesOnlyMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasShownInFavoritesOnlyMode
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasNameColorLight
{
  return self->_nameColorLight != 0;
}

- (BOOL)hasPersonalizedTodaySectionConfig
{
  return self->_personalizedTodaySectionConfig != 0;
}

- (void)setSeenArticlesMinimumTimeSinceFirstSeenToFilter:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_seenArticlesMinimumTimeSinceFirstSeenToFilter = a3;
}

- (void)setHasSeenArticlesMinimumTimeSinceFirstSeenToFilter:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSeenArticlesMinimumTimeSinceFirstSeenToFilter
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (BOOL)hasPersonalizationFeatureID
{
  return self->_personalizationFeatureID != 0;
}

- (void)setPresenceDeterminedByPersonalization:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_presenceDeterminedByPersonalization = a3;
}

- (void)setHasPresenceDeterminedByPersonalization:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasPresenceDeterminedByPersonalization
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasPersonalizedPresenceConfig
{
  return self->_personalizedPresenceConfig != 0;
}

- (unint64_t)queueMembershipsCount
{
  return self->_queueMemberships.count;
}

- (unint64_t)queueMemberships
{
  return self->_queueMemberships.list;
}

- (void)clearQueueMemberships
{
  PBRepeatedUInt64Clear();
}

- (void)addQueueMembership:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)queueMembershipAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_queueMemberships;
  unint64_t count;

  p_queueMemberships = &self->_queueMemberships;
  count = self->_queueMemberships.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_queueMemberships->list[a3];
}

- (void)setQueueMemberships:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (BOOL)hasBackgroundGradientColor
{
  return self->_backgroundGradientColor != 0;
}

- (void)setGlanceable:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_glanceable = a3;
}

- (void)setHasGlanceable:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasGlanceable
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasCompactName
{
  return self->_compactName != 0;
}

- (BOOL)hasPersonalizedPresenceFeatureID
{
  return self->_personalizedPresenceFeatureID != 0;
}

- (void)setPersonalizedPresenceFeatureImpressionPrior:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_personalizedPresenceFeatureImpressionPrior = a3;
}

- (void)setHasPersonalizedPresenceFeatureImpressionPrior:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPersonalizedPresenceFeatureImpressionPrior
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setPersonalizedPresenceFeatureClickPrior:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_personalizedPresenceFeatureClickPrior = a3;
}

- (void)setHasPersonalizedPresenceFeatureClickPrior:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasPersonalizedPresenceFeatureClickPrior
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasReferralBarName
{
  return self->_referralBarName != 0;
}

- (BOOL)hasGroupActionTitle
{
  return self->_groupActionTitle != 0;
}

- (BOOL)hasGroupActionUrl
{
  return self->_groupActionUrl != 0;
}

- (BOOL)hasItemsTodaySectionConfig
{
  return self->_itemsTodaySectionConfig != 0;
}

- (int)promotionCriterion
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_promotionCriterion;
  else
    return 0;
}

- (void)setPromotionCriterion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_promotionCriterion = a3;
}

- (void)setHasPromotionCriterion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPromotionCriterion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (BOOL)hasNameColorDark
{
  return self->_nameColorDark != 0;
}

- (BOOL)hasTagTodaySectionConfig
{
  return self->_tagTodaySectionConfig != 0;
}

- (BOOL)hasMutingTagID
{
  return self->_mutingTagID != 0;
}

- (BOOL)hasGroupNameActionUrl
{
  return self->_groupNameActionUrl != 0;
}

- (BOOL)hasBackgroundColorLight
{
  return self->_backgroundColorLight != 0;
}

- (BOOL)hasBackgroundColorDark
{
  return self->_backgroundColorDark != 0;
}

- (void)setFilterNonSubscribedInFavoritesOnlyMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_filterNonSubscribedInFavoritesOnlyMode = a3;
}

- (void)setHasFilterNonSubscribedInFavoritesOnlyMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($BFBDF6D6B56EC1F67905CD7E898803A7)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasFilterNonSubscribedInFavoritesOnlyMode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasSubidentifier
{
  return self->_subidentifier != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBTodaySectionConfig;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBTodaySectionConfig description](&v3, sel_description), -[NTPBTodaySectionConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *identifier;
  $BFBDF6D6B56EC1F67905CD7E898803A7 has;
  NTPBArticleListTodaySectionSpecificConfig *articleListTodaySectionConfig;
  NTPBForYouTodaySectionSpecificConfig *forYouTodaySectionConfig;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v10;
  NTPBArticleIDsTodaySectionSpecificConfig *articleIDsTodaySectionConfig;
  NSString *nameColorLight;
  NTPBPersonalizedTodaySectionSpecificConfig *personalizedTodaySectionConfig;
  NSString *personalizationFeatureID;
  NTPBPersonalizedSectionPresenceConfig *personalizedPresenceConfig;
  NSString *backgroundGradientColor;
  NSString *compactName;
  NSString *personalizedPresenceFeatureID;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v19;
  NSString *referralBarName;
  NSString *groupActionTitle;
  NSString *groupActionUrl;
  NTPBItemsTodaySectionSpecificConfig *itemsTodaySectionConfig;
  NSString *nameColorDark;
  NTPBTagTodaySectionSpecificConfig *tagTodaySectionConfig;
  NSString *mutingTagID;
  NSString *groupNameActionUrl;
  NSString *backgroundColorLight;
  NSString *backgroundColorDark;
  NSString *subidentifier;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_fallbackOrder), CFSTR("fallback_order"));
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_8;
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sectionType), CFSTR("section_type"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_77:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_cachedResultCutoffTime), CFSTR("cached_result_cutoff_time"));
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_9:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_readArticlesFilterMethod), CFSTR("read_articles_filter_method"));
LABEL_10:
  articleListTodaySectionConfig = self->_articleListTodaySectionConfig;
  if (articleListTodaySectionConfig)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBArticleListTodaySectionSpecificConfig dictionaryRepresentation](articleListTodaySectionConfig, "dictionaryRepresentation"), CFSTR("article_list_today_section_config"));
  forYouTodaySectionConfig = self->_forYouTodaySectionConfig;
  if (forYouTodaySectionConfig)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBForYouTodaySectionSpecificConfig dictionaryRepresentation](forYouTodaySectionConfig, "dictionaryRepresentation"), CFSTR("for_you_today_section_config"));
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x20) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_minimumStoriesAllocation), CFSTR("minimum_stories_allocation"));
    v10 = self->_has;
    if ((*(_BYTE *)&v10 & 0x10) == 0)
    {
LABEL_16:
      if ((*(_BYTE *)&v10 & 8) == 0)
        goto LABEL_17;
      goto LABEL_81;
    }
  }
  else if ((*(_BYTE *)&v10 & 0x10) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_maximumStoriesAllocation), CFSTR("maximum_stories_allocation"));
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v10 & 4) == 0)
      goto LABEL_18;
    goto LABEL_82;
  }
LABEL_81:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_intraSectionFilteringOptions), CFSTR("intra_section_filtering_options"));
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v10 & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_82:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_interSectionFilteringOptions), CFSTR("inter_section_filtering_options"));
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_19:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_seenArticlesFilterMethod), CFSTR("seen_articles_filter_method"));
LABEL_20:
  articleIDsTodaySectionConfig = self->_articleIDsTodaySectionConfig;
  if (articleIDsTodaySectionConfig)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBArticleIDsTodaySectionSpecificConfig dictionaryRepresentation](articleIDsTodaySectionConfig, "dictionaryRepresentation"), CFSTR("article_IDs_today_section_config"));
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_shownInFavoritesOnlyMode), CFSTR("shown_in_favorites_only_mode"));
  nameColorLight = self->_nameColorLight;
  if (nameColorLight)
    objc_msgSend(v4, "setObject:forKey:", nameColorLight, CFSTR("name_color_light"));
  personalizedTodaySectionConfig = self->_personalizedTodaySectionConfig;
  if (personalizedTodaySectionConfig)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBPersonalizedTodaySectionSpecificConfig dictionaryRepresentation](personalizedTodaySectionConfig, "dictionaryRepresentation"), CFSTR("personalized_today_section_config"));
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_seenArticlesMinimumTimeSinceFirstSeenToFilter), CFSTR("seen_articles_minimum_time_since_first_seen_to_filter"));
  personalizationFeatureID = self->_personalizationFeatureID;
  if (personalizationFeatureID)
    objc_msgSend(v4, "setObject:forKey:", personalizationFeatureID, CFSTR("personalization_feature_ID"));
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_presenceDeterminedByPersonalization), CFSTR("presence_determined_by_personalization"));
  personalizedPresenceConfig = self->_personalizedPresenceConfig;
  if (personalizedPresenceConfig)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBPersonalizedSectionPresenceConfig dictionaryRepresentation](personalizedPresenceConfig, "dictionaryRepresentation"), CFSTR("personalized_presence_config"));
  objc_msgSend(v4, "setObject:forKey:", PBRepeatedUInt64NSArray(), CFSTR("queue_membership"));
  backgroundGradientColor = self->_backgroundGradientColor;
  if (backgroundGradientColor)
    objc_msgSend(v4, "setObject:forKey:", backgroundGradientColor, CFSTR("background_gradient_color"));
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_glanceable), CFSTR("glanceable"));
  compactName = self->_compactName;
  if (compactName)
    objc_msgSend(v4, "setObject:forKey:", compactName, CFSTR("compact_name"));
  personalizedPresenceFeatureID = self->_personalizedPresenceFeatureID;
  if (personalizedPresenceFeatureID)
    objc_msgSend(v4, "setObject:forKey:", personalizedPresenceFeatureID, CFSTR("personalized_presence_feature_ID"));
  v19 = self->_has;
  if ((*(_BYTE *)&v19 & 0x80) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_personalizedPresenceFeatureImpressionPrior), CFSTR("personalized_presence_feature_impression_prior"));
    v19 = self->_has;
  }
  if ((*(_BYTE *)&v19 & 0x40) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_personalizedPresenceFeatureClickPrior), CFSTR("personalized_presence_feature_click_prior"));
  referralBarName = self->_referralBarName;
  if (referralBarName)
    objc_msgSend(v4, "setObject:forKey:", referralBarName, CFSTR("referral_bar_name"));
  groupActionTitle = self->_groupActionTitle;
  if (groupActionTitle)
    objc_msgSend(v4, "setObject:forKey:", groupActionTitle, CFSTR("group_action_title"));
  groupActionUrl = self->_groupActionUrl;
  if (groupActionUrl)
    objc_msgSend(v4, "setObject:forKey:", groupActionUrl, CFSTR("group_action_url"));
  itemsTodaySectionConfig = self->_itemsTodaySectionConfig;
  if (itemsTodaySectionConfig)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBItemsTodaySectionSpecificConfig dictionaryRepresentation](itemsTodaySectionConfig, "dictionaryRepresentation"), CFSTR("items_today_section_config"));
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_promotionCriterion), CFSTR("promotion_criterion"));
  nameColorDark = self->_nameColorDark;
  if (nameColorDark)
    objc_msgSend(v4, "setObject:forKey:", nameColorDark, CFSTR("name_color_dark"));
  tagTodaySectionConfig = self->_tagTodaySectionConfig;
  if (tagTodaySectionConfig)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBTagTodaySectionSpecificConfig dictionaryRepresentation](tagTodaySectionConfig, "dictionaryRepresentation"), CFSTR("tag_today_section_config"));
  mutingTagID = self->_mutingTagID;
  if (mutingTagID)
    objc_msgSend(v4, "setObject:forKey:", mutingTagID, CFSTR("muting_tag_ID"));
  groupNameActionUrl = self->_groupNameActionUrl;
  if (groupNameActionUrl)
    objc_msgSend(v4, "setObject:forKey:", groupNameActionUrl, CFSTR("group_name_action_url"));
  backgroundColorLight = self->_backgroundColorLight;
  if (backgroundColorLight)
    objc_msgSend(v4, "setObject:forKey:", backgroundColorLight, CFSTR("background_color_light"));
  backgroundColorDark = self->_backgroundColorDark;
  if (backgroundColorDark)
    objc_msgSend(v4, "setObject:forKey:", backgroundColorDark, CFSTR("background_color_dark"));
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_filterNonSubscribedInFavoritesOnlyMode), CFSTR("filter_non_subscribed_in_favorites_only_mode"));
  subidentifier = self->_subidentifier;
  if (subidentifier)
    objc_msgSend(v4, "setObject:forKey:", subidentifier, CFSTR("subidentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodaySectionConfigReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  $BFBDF6D6B56EC1F67905CD7E898803A7 has;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v5;
  unint64_t v6;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v7;

  if (self->_name)
    PBDataWriterWriteStringField();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_8;
      goto LABEL_79;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
LABEL_9:
    PBDataWriterWriteInt32Field();
LABEL_10:
  if (self->_articleListTodaySectionConfig)
    PBDataWriterWriteSubmessage();
  if (self->_forYouTodaySectionConfig)
    PBDataWriterWriteSubmessage();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    v5 = self->_has;
    if ((*(_BYTE *)&v5 & 0x10) == 0)
    {
LABEL_16:
      if ((*(_BYTE *)&v5 & 8) == 0)
        goto LABEL_17;
      goto LABEL_83;
    }
  }
  else if ((*(_BYTE *)&v5 & 0x10) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 8) == 0)
  {
LABEL_17:
    if ((*(_BYTE *)&v5 & 4) == 0)
      goto LABEL_18;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint64Field();
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 4) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v5 & 0x1000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_84:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_19:
    PBDataWriterWriteInt32Field();
LABEL_20:
  if (self->_articleIDsTodaySectionConfig)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_nameColorLight)
    PBDataWriterWriteStringField();
  if (self->_personalizedTodaySectionConfig)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_personalizationFeatureID)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_personalizedPresenceConfig)
    PBDataWriterWriteSubmessage();
  if (self->_queueMemberships.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_queueMemberships.count);
  }
  if (self->_backgroundGradientColor)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_compactName)
    PBDataWriterWriteStringField();
  if (self->_personalizedPresenceFeatureID)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    v7 = self->_has;
  }
  if ((*(_BYTE *)&v7 & 0x40) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_referralBarName)
    PBDataWriterWriteStringField();
  if (self->_groupActionTitle)
    PBDataWriterWriteStringField();
  if (self->_groupActionUrl)
    PBDataWriterWriteStringField();
  if (self->_itemsTodaySectionConfig)
    PBDataWriterWriteSubmessage();
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_nameColorDark)
    PBDataWriterWriteStringField();
  if (self->_tagTodaySectionConfig)
    PBDataWriterWriteSubmessage();
  if (self->_mutingTagID)
    PBDataWriterWriteStringField();
  if (self->_groupNameActionUrl)
    PBDataWriterWriteStringField();
  if (self->_backgroundColorLight)
    PBDataWriterWriteStringField();
  if (self->_backgroundColorDark)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_subidentifier)
    PBDataWriterWriteStringField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  $BFBDF6D6B56EC1F67905CD7E898803A7 has;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v7;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 208) = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 184) = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_fallbackOrder;
    *(_DWORD *)(v5 + 308) |= 2u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 1) == 0)
        goto LABEL_4;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 280) = self->_sectionType;
  *(_DWORD *)(v5 + 308) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x400) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_31:
  *(_QWORD *)(v5 + 32) = self->_cachedResultCutoffTime;
  *(_DWORD *)(v5 + 308) |= 1u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 268) = self->_readArticlesFilterMethod;
    *(_DWORD *)(v5 + 308) |= 0x400u;
  }
LABEL_6:

  *(_QWORD *)(v5 + 112) = -[NTPBArticleListTodaySectionSpecificConfig copyWithZone:](self->_articleListTodaySectionConfig, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 152) = -[NTPBForYouTodaySectionSpecificConfig copyWithZone:](self->_forYouTodaySectionConfig, "copyWithZone:", a3);
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x20) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_minimumStoriesAllocation;
    *(_DWORD *)(v5 + 308) |= 0x20u;
    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 0x10) == 0)
    {
LABEL_8:
      if ((*(_BYTE *)&v7 & 8) == 0)
        goto LABEL_9;
      goto LABEL_35;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
    goto LABEL_8;
  }
  *(_QWORD *)(v5 + 64) = self->_maximumStoriesAllocation;
  *(_DWORD *)(v5 + 308) |= 0x10u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 8) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&v7 & 4) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  *(_QWORD *)(v5 + 56) = self->_intraSectionFilteringOptions;
  *(_DWORD *)(v5 + 308) |= 8u;
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&v7 & 0x1000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_36:
  *(_QWORD *)(v5 + 48) = self->_interSectionFilteringOptions;
  *(_DWORD *)(v5 + 308) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 284) = self->_seenArticlesFilterMethod;
    *(_DWORD *)(v5 + 308) |= 0x1000u;
  }
LABEL_12:

  *(_QWORD *)(v5 + 104) = -[NTPBArticleIDsTodaySectionSpecificConfig copyWithZone:](self->_articleIDsTodaySectionConfig, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
  {
    *(_BYTE *)(v5 + 307) = self->_shownInFavoritesOnlyMode;
    *(_DWORD *)(v5 + 308) |= 0x10000u;
  }

  *(_QWORD *)(v5 + 224) = -[NSString copyWithZone:](self->_nameColorLight, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 256) = -[NTPBPersonalizedTodaySectionSpecificConfig copyWithZone:](self->_personalizedTodaySectionConfig, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
  {
    *(_QWORD *)(v5 + 96) = self->_seenArticlesMinimumTimeSinceFirstSeenToFilter;
    *(_DWORD *)(v5 + 308) |= 0x100u;
  }

  *(_QWORD *)(v5 + 232) = -[NSString copyWithZone:](self->_personalizationFeatureID, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 306) = self->_presenceDeterminedByPersonalization;
    *(_DWORD *)(v5 + 308) |= 0x8000u;
  }

  *(_QWORD *)(v5 + 240) = -[NTPBPersonalizedSectionPresenceConfig copyWithZone:](self->_personalizedPresenceConfig, "copyWithZone:", a3);
  PBRepeatedUInt64Copy();

  *(_QWORD *)(v5 + 136) = -[NSString copyWithZone:](self->_backgroundGradientColor, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 305) = self->_glanceable;
    *(_DWORD *)(v5 + 308) |= 0x4000u;
  }

  *(_QWORD *)(v5 + 144) = -[NSString copyWithZone:](self->_compactName, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 248) = -[NSString copyWithZone:](self->_personalizedPresenceFeatureID, "copyWithZone:", a3);
  v8 = self->_has;
  if ((*(_BYTE *)&v8 & 0x80) != 0)
  {
    *(_QWORD *)(v5 + 88) = self->_personalizedPresenceFeatureImpressionPrior;
    *(_DWORD *)(v5 + 308) |= 0x80u;
    v8 = self->_has;
  }
  if ((*(_BYTE *)&v8 & 0x40) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_personalizedPresenceFeatureClickPrior;
    *(_DWORD *)(v5 + 308) |= 0x40u;
  }

  *(_QWORD *)(v5 + 272) = -[NSString copyWithZone:](self->_referralBarName, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 160) = -[NSString copyWithZone:](self->_groupActionTitle, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 168) = -[NSString copyWithZone:](self->_groupActionUrl, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 192) = -[NTPBItemsTodaySectionSpecificConfig copyWithZone:](self->_itemsTodaySectionConfig, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
  {
    *(_DWORD *)(v5 + 264) = self->_promotionCriterion;
    *(_DWORD *)(v5 + 308) |= 0x200u;
  }

  *(_QWORD *)(v5 + 216) = -[NSString copyWithZone:](self->_nameColorDark, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 296) = -[NTPBTagTodaySectionSpecificConfig copyWithZone:](self->_tagTodaySectionConfig, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 200) = -[NSString copyWithZone:](self->_mutingTagID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 176) = -[NSString copyWithZone:](self->_groupNameActionUrl, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 128) = -[NSString copyWithZone:](self->_backgroundColorLight, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 120) = -[NSString copyWithZone:](self->_backgroundColorDark, "copyWithZone:", a3);
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 304) = self->_filterNonSubscribedInFavoritesOnlyMode;
    *(_DWORD *)(v5 + 308) |= 0x2000u;
  }

  *(_QWORD *)(v5 + 288) = -[NSString copyWithZone:](self->_subidentifier, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  NSString *name;
  NSString *identifier;
  $BFBDF6D6B56EC1F67905CD7E898803A7 has;
  int v9;
  NTPBArticleListTodaySectionSpecificConfig *articleListTodaySectionConfig;
  NTPBForYouTodaySectionSpecificConfig *forYouTodaySectionConfig;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v12;
  int v13;
  NTPBArticleIDsTodaySectionSpecificConfig *articleIDsTodaySectionConfig;
  int v15;
  NSString *nameColorLight;
  NTPBPersonalizedTodaySectionSpecificConfig *personalizedTodaySectionConfig;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v18;
  int v19;
  NSString *personalizationFeatureID;
  int v21;
  NTPBPersonalizedSectionPresenceConfig *personalizedPresenceConfig;
  NSString *backgroundGradientColor;
  int v24;
  NSString *compactName;
  NSString *personalizedPresenceFeatureID;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v27;
  int v28;
  NSString *referralBarName;
  NSString *groupActionTitle;
  NSString *groupActionUrl;
  NTPBItemsTodaySectionSpecificConfig *itemsTodaySectionConfig;
  int v33;
  NSString *nameColorDark;
  NTPBTagTodaySectionSpecificConfig *tagTodaySectionConfig;
  NSString *mutingTagID;
  NSString *groupNameActionUrl;
  NSString *backgroundColorLight;
  NSString *backgroundColorDark;
  int v40;
  NSString *subidentifier;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    name = self->_name;
    if (!((unint64_t)name | *((_QWORD *)a3 + 26)) || (IsEqual = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      identifier = self->_identifier;
      if (!((unint64_t)identifier | *((_QWORD *)a3 + 23))
        || (IsEqual = -[NSString isEqual:](identifier, "isEqual:")) != 0)
      {
        has = self->_has;
        v9 = *((_DWORD *)a3 + 77);
        if ((*(_BYTE *)&has & 2) != 0)
        {
          if ((v9 & 2) == 0 || self->_fallbackOrder != *((_QWORD *)a3 + 5))
            goto LABEL_62;
        }
        else if ((v9 & 2) != 0)
        {
          goto LABEL_62;
        }
        if ((*(_WORD *)&has & 0x800) != 0)
        {
          if ((v9 & 0x800) == 0 || self->_sectionType != *((_DWORD *)a3 + 70))
            goto LABEL_62;
        }
        else if ((v9 & 0x800) != 0)
        {
          goto LABEL_62;
        }
        if ((*(_BYTE *)&has & 1) != 0)
        {
          if ((v9 & 1) == 0 || self->_cachedResultCutoffTime != *((_QWORD *)a3 + 4))
            goto LABEL_62;
        }
        else if ((v9 & 1) != 0)
        {
          goto LABEL_62;
        }
        if ((*(_WORD *)&has & 0x400) != 0)
        {
          if ((v9 & 0x400) == 0 || self->_readArticlesFilterMethod != *((_DWORD *)a3 + 67))
            goto LABEL_62;
        }
        else if ((v9 & 0x400) != 0)
        {
          goto LABEL_62;
        }
        articleListTodaySectionConfig = self->_articleListTodaySectionConfig;
        if (!((unint64_t)articleListTodaySectionConfig | *((_QWORD *)a3 + 14))
          || (IsEqual = -[NTPBArticleListTodaySectionSpecificConfig isEqual:](articleListTodaySectionConfig, "isEqual:")) != 0)
        {
          forYouTodaySectionConfig = self->_forYouTodaySectionConfig;
          if (!((unint64_t)forYouTodaySectionConfig | *((_QWORD *)a3 + 19))
            || (IsEqual = -[NTPBForYouTodaySectionSpecificConfig isEqual:](forYouTodaySectionConfig, "isEqual:")) != 0)
          {
            v12 = self->_has;
            v13 = *((_DWORD *)a3 + 77);
            if ((*(_BYTE *)&v12 & 0x20) != 0)
            {
              if ((v13 & 0x20) == 0 || self->_minimumStoriesAllocation != *((_QWORD *)a3 + 9))
                goto LABEL_62;
            }
            else if ((v13 & 0x20) != 0)
            {
              goto LABEL_62;
            }
            if ((*(_BYTE *)&v12 & 0x10) != 0)
            {
              if ((v13 & 0x10) == 0 || self->_maximumStoriesAllocation != *((_QWORD *)a3 + 8))
                goto LABEL_62;
            }
            else if ((v13 & 0x10) != 0)
            {
              goto LABEL_62;
            }
            if ((*(_BYTE *)&v12 & 8) != 0)
            {
              if ((v13 & 8) == 0 || self->_intraSectionFilteringOptions != *((_QWORD *)a3 + 7))
                goto LABEL_62;
            }
            else if ((v13 & 8) != 0)
            {
              goto LABEL_62;
            }
            if ((*(_BYTE *)&v12 & 4) != 0)
            {
              if ((v13 & 4) == 0 || self->_interSectionFilteringOptions != *((_QWORD *)a3 + 6))
                goto LABEL_62;
            }
            else if ((v13 & 4) != 0)
            {
              goto LABEL_62;
            }
            if ((*(_WORD *)&v12 & 0x1000) != 0)
            {
              if ((v13 & 0x1000) == 0 || self->_seenArticlesFilterMethod != *((_DWORD *)a3 + 71))
                goto LABEL_62;
            }
            else if ((v13 & 0x1000) != 0)
            {
              goto LABEL_62;
            }
            articleIDsTodaySectionConfig = self->_articleIDsTodaySectionConfig;
            if ((unint64_t)articleIDsTodaySectionConfig | *((_QWORD *)a3 + 13))
            {
              IsEqual = -[NTPBArticleIDsTodaySectionSpecificConfig isEqual:](articleIDsTodaySectionConfig, "isEqual:");
              if (!IsEqual)
                return IsEqual;
              v12 = self->_has;
            }
            v15 = *((_DWORD *)a3 + 77);
            if ((*(_DWORD *)&v12 & 0x10000) != 0)
            {
              if ((v15 & 0x10000) == 0)
                goto LABEL_62;
              if (self->_shownInFavoritesOnlyMode)
              {
                if (!*((_BYTE *)a3 + 307))
                  goto LABEL_62;
              }
              else if (*((_BYTE *)a3 + 307))
              {
                goto LABEL_62;
              }
            }
            else if ((v15 & 0x10000) != 0)
            {
              goto LABEL_62;
            }
            nameColorLight = self->_nameColorLight;
            if (!((unint64_t)nameColorLight | *((_QWORD *)a3 + 28))
              || (IsEqual = -[NSString isEqual:](nameColorLight, "isEqual:")) != 0)
            {
              personalizedTodaySectionConfig = self->_personalizedTodaySectionConfig;
              if (!((unint64_t)personalizedTodaySectionConfig | *((_QWORD *)a3 + 32))
                || (IsEqual = -[NTPBPersonalizedTodaySectionSpecificConfig isEqual:](personalizedTodaySectionConfig, "isEqual:")) != 0)
              {
                v18 = self->_has;
                v19 = *((_DWORD *)a3 + 77);
                if ((*(_WORD *)&v18 & 0x100) != 0)
                {
                  if ((v19 & 0x100) == 0
                    || self->_seenArticlesMinimumTimeSinceFirstSeenToFilter != *((_QWORD *)a3 + 12))
                  {
                    goto LABEL_62;
                  }
                }
                else if ((v19 & 0x100) != 0)
                {
                  goto LABEL_62;
                }
                personalizationFeatureID = self->_personalizationFeatureID;
                if ((unint64_t)personalizationFeatureID | *((_QWORD *)a3 + 29))
                {
                  IsEqual = -[NSString isEqual:](personalizationFeatureID, "isEqual:");
                  if (!IsEqual)
                    return IsEqual;
                  v18 = self->_has;
                }
                v21 = *((_DWORD *)a3 + 77);
                if ((*(_WORD *)&v18 & 0x8000) != 0)
                {
                  if ((v21 & 0x8000) == 0)
                    goto LABEL_62;
                  if (self->_presenceDeterminedByPersonalization)
                  {
                    if (!*((_BYTE *)a3 + 306))
                      goto LABEL_62;
                  }
                  else if (*((_BYTE *)a3 + 306))
                  {
                    goto LABEL_62;
                  }
                }
                else if ((v21 & 0x8000) != 0)
                {
                  goto LABEL_62;
                }
                personalizedPresenceConfig = self->_personalizedPresenceConfig;
                if (!((unint64_t)personalizedPresenceConfig | *((_QWORD *)a3 + 30))
                  || (IsEqual = -[NTPBPersonalizedSectionPresenceConfig isEqual:](personalizedPresenceConfig, "isEqual:")) != 0)
                {
                  IsEqual = PBRepeatedUInt64IsEqual();
                  if (IsEqual)
                  {
                    backgroundGradientColor = self->_backgroundGradientColor;
                    if (!((unint64_t)backgroundGradientColor | *((_QWORD *)a3 + 17))
                      || (IsEqual = -[NSString isEqual:](backgroundGradientColor, "isEqual:")) != 0)
                    {
                      v24 = *((_DWORD *)a3 + 77);
                      if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
                      {
                        if ((v24 & 0x4000) == 0)
                          goto LABEL_62;
                        if (self->_glanceable)
                        {
                          if (!*((_BYTE *)a3 + 305))
                            goto LABEL_62;
                        }
                        else if (*((_BYTE *)a3 + 305))
                        {
                          goto LABEL_62;
                        }
                      }
                      else if ((v24 & 0x4000) != 0)
                      {
                        goto LABEL_62;
                      }
                      compactName = self->_compactName;
                      if (!((unint64_t)compactName | *((_QWORD *)a3 + 18))
                        || (IsEqual = -[NSString isEqual:](compactName, "isEqual:")) != 0)
                      {
                        personalizedPresenceFeatureID = self->_personalizedPresenceFeatureID;
                        if (!((unint64_t)personalizedPresenceFeatureID | *((_QWORD *)a3 + 31))
                          || (IsEqual = -[NSString isEqual:](personalizedPresenceFeatureID, "isEqual:")) != 0)
                        {
                          v27 = self->_has;
                          v28 = *((_DWORD *)a3 + 77);
                          if ((*(_BYTE *)&v27 & 0x80) != 0)
                          {
                            if ((v28 & 0x80) == 0
                              || self->_personalizedPresenceFeatureImpressionPrior != *((_QWORD *)a3 + 11))
                            {
                              goto LABEL_62;
                            }
                          }
                          else if ((v28 & 0x80) != 0)
                          {
                            goto LABEL_62;
                          }
                          if ((*(_BYTE *)&v27 & 0x40) != 0)
                          {
                            if ((v28 & 0x40) == 0
                              || self->_personalizedPresenceFeatureClickPrior != *((_QWORD *)a3 + 10))
                            {
                              goto LABEL_62;
                            }
                          }
                          else if ((v28 & 0x40) != 0)
                          {
                            goto LABEL_62;
                          }
                          referralBarName = self->_referralBarName;
                          if (!((unint64_t)referralBarName | *((_QWORD *)a3 + 34))
                            || (IsEqual = -[NSString isEqual:](referralBarName, "isEqual:")) != 0)
                          {
                            groupActionTitle = self->_groupActionTitle;
                            if (!((unint64_t)groupActionTitle | *((_QWORD *)a3 + 20))
                              || (IsEqual = -[NSString isEqual:](groupActionTitle, "isEqual:")) != 0)
                            {
                              groupActionUrl = self->_groupActionUrl;
                              if (!((unint64_t)groupActionUrl | *((_QWORD *)a3 + 21))
                                || (IsEqual = -[NSString isEqual:](groupActionUrl, "isEqual:")) != 0)
                              {
                                itemsTodaySectionConfig = self->_itemsTodaySectionConfig;
                                if (!((unint64_t)itemsTodaySectionConfig | *((_QWORD *)a3 + 24))
                                  || (IsEqual = -[NTPBItemsTodaySectionSpecificConfig isEqual:](itemsTodaySectionConfig, "isEqual:")) != 0)
                                {
                                  v33 = *((_DWORD *)a3 + 77);
                                  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
                                  {
                                    if ((v33 & 0x200) == 0 || self->_promotionCriterion != *((_DWORD *)a3 + 66))
                                      goto LABEL_62;
                                  }
                                  else if ((v33 & 0x200) != 0)
                                  {
                                    goto LABEL_62;
                                  }
                                  nameColorDark = self->_nameColorDark;
                                  if (!((unint64_t)nameColorDark | *((_QWORD *)a3 + 27))
                                    || (IsEqual = -[NSString isEqual:](nameColorDark, "isEqual:")) != 0)
                                  {
                                    tagTodaySectionConfig = self->_tagTodaySectionConfig;
                                    if (!((unint64_t)tagTodaySectionConfig | *((_QWORD *)a3 + 37))
                                      || (IsEqual = -[NTPBTagTodaySectionSpecificConfig isEqual:](tagTodaySectionConfig, "isEqual:")) != 0)
                                    {
                                      mutingTagID = self->_mutingTagID;
                                      if (!((unint64_t)mutingTagID | *((_QWORD *)a3 + 25))
                                        || (IsEqual = -[NSString isEqual:](mutingTagID, "isEqual:")) != 0)
                                      {
                                        groupNameActionUrl = self->_groupNameActionUrl;
                                        if (!((unint64_t)groupNameActionUrl | *((_QWORD *)a3 + 22))
                                          || (IsEqual = -[NSString isEqual:](groupNameActionUrl, "isEqual:")) != 0)
                                        {
                                          backgroundColorLight = self->_backgroundColorLight;
                                          if (!((unint64_t)backgroundColorLight | *((_QWORD *)a3 + 16))
                                            || (IsEqual = -[NSString isEqual:](backgroundColorLight, "isEqual:")) != 0)
                                          {
                                            backgroundColorDark = self->_backgroundColorDark;
                                            if (!((unint64_t)backgroundColorDark | *((_QWORD *)a3 + 15))
                                              || (IsEqual = -[NSString isEqual:](backgroundColorDark, "isEqual:")) != 0)
                                            {
                                              v40 = *((_DWORD *)a3 + 77);
                                              if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
                                              {
                                                if ((v40 & 0x2000) != 0)
                                                {
                                                  if (self->_filterNonSubscribedInFavoritesOnlyMode)
                                                  {
                                                    if (!*((_BYTE *)a3 + 304))
                                                      goto LABEL_62;
                                                    goto LABEL_148;
                                                  }
                                                  if (!*((_BYTE *)a3 + 304))
                                                  {
LABEL_148:
                                                    subidentifier = self->_subidentifier;
                                                    if ((unint64_t)subidentifier | *((_QWORD *)a3 + 36))
                                                      LOBYTE(IsEqual) = -[NSString isEqual:](subidentifier, "isEqual:");
                                                    else
                                                      LOBYTE(IsEqual) = 1;
                                                    return IsEqual;
                                                  }
                                                }
                                              }
                                              else if ((v40 & 0x2000) == 0)
                                              {
                                                goto LABEL_148;
                                              }
LABEL_62:
                                              LOBYTE(IsEqual) = 0;
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
  return IsEqual;
}

- (unint64_t)hash
{
  $BFBDF6D6B56EC1F67905CD7E898803A7 has;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v4;
  $BFBDF6D6B56EC1F67905CD7E898803A7 v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  unint64_t v19;
  unint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t v23;
  NSUInteger v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  unint64_t v29;
  unint64_t v30;
  NSUInteger v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  NSUInteger v45;
  NSUInteger v46;

  v46 = -[NSString hash](self->_name, "hash");
  v45 = -[NSString hash](self->_identifier, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    v44 = 2654435761u * self->_fallbackOrder;
    if ((*(_WORD *)&has & 0x800) != 0)
    {
LABEL_3:
      v43 = 2654435761 * self->_sectionType;
      if ((*(_BYTE *)&has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v42 = 0;
      if ((*(_WORD *)&has & 0x400) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v44 = 0;
    if ((*(_WORD *)&has & 0x800) != 0)
      goto LABEL_3;
  }
  v43 = 0;
  if ((*(_BYTE *)&has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v42 = 2654435761u * self->_cachedResultCutoffTime;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_5:
    v41 = 2654435761 * self->_readArticlesFilterMethod;
    goto LABEL_10;
  }
LABEL_9:
  v41 = 0;
LABEL_10:
  v40 = -[NTPBArticleListTodaySectionSpecificConfig hash](self->_articleListTodaySectionConfig, "hash");
  v39 = -[NTPBForYouTodaySectionSpecificConfig hash](self->_forYouTodaySectionConfig, "hash");
  v4 = self->_has;
  if ((*(_BYTE *)&v4 & 0x20) != 0)
  {
    v38 = 2654435761u * self->_minimumStoriesAllocation;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
    {
LABEL_12:
      v37 = 2654435761u * self->_maximumStoriesAllocation;
      if ((*(_BYTE *)&v4 & 8) != 0)
        goto LABEL_13;
      goto LABEL_18;
    }
  }
  else
  {
    v38 = 0;
    if ((*(_BYTE *)&v4 & 0x10) != 0)
      goto LABEL_12;
  }
  v37 = 0;
  if ((*(_BYTE *)&v4 & 8) != 0)
  {
LABEL_13:
    v36 = 2654435761u * self->_intraSectionFilteringOptions;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_14;
LABEL_19:
    v35 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0)
      goto LABEL_15;
    goto LABEL_20;
  }
LABEL_18:
  v36 = 0;
  if ((*(_BYTE *)&v4 & 4) == 0)
    goto LABEL_19;
LABEL_14:
  v35 = 2654435761u * self->_interSectionFilteringOptions;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_15:
    v34 = 2654435761 * self->_seenArticlesFilterMethod;
    goto LABEL_21;
  }
LABEL_20:
  v34 = 0;
LABEL_21:
  v33 = -[NTPBArticleIDsTodaySectionSpecificConfig hash](self->_articleIDsTodaySectionConfig, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    v32 = 2654435761 * self->_shownInFavoritesOnlyMode;
  else
    v32 = 0;
  v31 = -[NSString hash](self->_nameColorLight, "hash");
  v30 = -[NTPBPersonalizedTodaySectionSpecificConfig hash](self->_personalizedTodaySectionConfig, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    v29 = 2654435761u * self->_seenArticlesMinimumTimeSinceFirstSeenToFilter;
  else
    v29 = 0;
  v28 = -[NSString hash](self->_personalizationFeatureID, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    v27 = 2654435761 * self->_presenceDeterminedByPersonalization;
  else
    v27 = 0;
  v26 = -[NTPBPersonalizedSectionPresenceConfig hash](self->_personalizedPresenceConfig, "hash");
  v25 = PBRepeatedUInt64Hash();
  v24 = -[NSString hash](self->_backgroundGradientColor, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x40) != 0)
    v23 = 2654435761 * self->_glanceable;
  else
    v23 = 0;
  v22 = -[NSString hash](self->_compactName, "hash");
  v21 = -[NSString hash](self->_personalizedPresenceFeatureID, "hash");
  v5 = self->_has;
  if ((*(_BYTE *)&v5 & 0x80) != 0)
  {
    v20 = 2654435761u * self->_personalizedPresenceFeatureImpressionPrior;
    if ((*(_BYTE *)&v5 & 0x40) != 0)
      goto LABEL_35;
  }
  else
  {
    v20 = 0;
    if ((*(_BYTE *)&v5 & 0x40) != 0)
    {
LABEL_35:
      v19 = 2654435761u * self->_personalizedPresenceFeatureClickPrior;
      goto LABEL_38;
    }
  }
  v19 = 0;
LABEL_38:
  v18 = -[NSString hash](self->_referralBarName, "hash");
  v17 = -[NSString hash](self->_groupActionTitle, "hash");
  v16 = -[NSString hash](self->_groupActionUrl, "hash");
  v6 = -[NTPBItemsTodaySectionSpecificConfig hash](self->_itemsTodaySectionConfig, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    v7 = 2654435761 * self->_promotionCriterion;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_nameColorDark, "hash");
  v9 = -[NTPBTagTodaySectionSpecificConfig hash](self->_tagTodaySectionConfig, "hash");
  v10 = -[NSString hash](self->_mutingTagID, "hash");
  v11 = -[NSString hash](self->_groupNameActionUrl, "hash");
  v12 = -[NSString hash](self->_backgroundColorLight, "hash");
  v13 = -[NSString hash](self->_backgroundColorDark, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x20) != 0)
    v14 = 2654435761 * self->_filterNonSubscribedInFavoritesOnlyMode;
  else
    v14 = 0;
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[NSString hash](self->_subidentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  int v5;
  NTPBArticleListTodaySectionSpecificConfig *articleListTodaySectionConfig;
  uint64_t v7;
  NTPBForYouTodaySectionSpecificConfig *forYouTodaySectionConfig;
  uint64_t v9;
  int v10;
  NTPBArticleIDsTodaySectionSpecificConfig *articleIDsTodaySectionConfig;
  uint64_t v12;
  NTPBPersonalizedTodaySectionSpecificConfig *personalizedTodaySectionConfig;
  uint64_t v14;
  NTPBPersonalizedSectionPresenceConfig *personalizedPresenceConfig;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  int v20;
  NTPBItemsTodaySectionSpecificConfig *itemsTodaySectionConfig;
  uint64_t v22;
  NTPBTagTodaySectionSpecificConfig *tagTodaySectionConfig;
  uint64_t v24;

  if (*((_QWORD *)a3 + 26))
    -[NTPBTodaySectionConfig setName:](self, "setName:");
  if (*((_QWORD *)a3 + 23))
    -[NTPBTodaySectionConfig setIdentifier:](self, "setIdentifier:");
  v5 = *((_DWORD *)a3 + 77);
  if ((v5 & 2) != 0)
  {
    self->_fallbackOrder = *((_QWORD *)a3 + 5);
    *(_DWORD *)&self->_has |= 2u;
    v5 = *((_DWORD *)a3 + 77);
    if ((v5 & 0x800) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_7;
  }
  self->_sectionType = *((_DWORD *)a3 + 70);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 77);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_15:
  self->_cachedResultCutoffTime = *((_QWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)a3 + 77) & 0x400) != 0)
  {
LABEL_9:
    self->_readArticlesFilterMethod = *((_DWORD *)a3 + 67);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_10:
  articleListTodaySectionConfig = self->_articleListTodaySectionConfig;
  v7 = *((_QWORD *)a3 + 14);
  if (articleListTodaySectionConfig)
  {
    if (v7)
      -[NTPBArticleListTodaySectionSpecificConfig mergeFrom:](articleListTodaySectionConfig, "mergeFrom:");
  }
  else if (v7)
  {
    -[NTPBTodaySectionConfig setArticleListTodaySectionConfig:](self, "setArticleListTodaySectionConfig:");
  }
  forYouTodaySectionConfig = self->_forYouTodaySectionConfig;
  v9 = *((_QWORD *)a3 + 19);
  if (forYouTodaySectionConfig)
  {
    if (v9)
      -[NTPBForYouTodaySectionSpecificConfig mergeFrom:](forYouTodaySectionConfig, "mergeFrom:");
  }
  else if (v9)
  {
    -[NTPBTodaySectionConfig setForYouTodaySectionConfig:](self, "setForYouTodaySectionConfig:");
  }
  v10 = *((_DWORD *)a3 + 77);
  if ((v10 & 0x20) != 0)
  {
    self->_minimumStoriesAllocation = *((_QWORD *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x20u;
    v10 = *((_DWORD *)a3 + 77);
    if ((v10 & 0x10) == 0)
    {
LABEL_26:
      if ((v10 & 8) == 0)
        goto LABEL_27;
      goto LABEL_35;
    }
  }
  else if ((v10 & 0x10) == 0)
  {
    goto LABEL_26;
  }
  self->_maximumStoriesAllocation = *((_QWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x10u;
  v10 = *((_DWORD *)a3 + 77);
  if ((v10 & 8) == 0)
  {
LABEL_27:
    if ((v10 & 4) == 0)
      goto LABEL_28;
    goto LABEL_36;
  }
LABEL_35:
  self->_intraSectionFilteringOptions = *((_QWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 8u;
  v10 = *((_DWORD *)a3 + 77);
  if ((v10 & 4) == 0)
  {
LABEL_28:
    if ((v10 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_36:
  self->_interSectionFilteringOptions = *((_QWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)a3 + 77) & 0x1000) != 0)
  {
LABEL_29:
    self->_seenArticlesFilterMethod = *((_DWORD *)a3 + 71);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_30:
  articleIDsTodaySectionConfig = self->_articleIDsTodaySectionConfig;
  v12 = *((_QWORD *)a3 + 13);
  if (articleIDsTodaySectionConfig)
  {
    if (v12)
      -[NTPBArticleIDsTodaySectionSpecificConfig mergeFrom:](articleIDsTodaySectionConfig, "mergeFrom:");
  }
  else if (v12)
  {
    -[NTPBTodaySectionConfig setArticleIDsTodaySectionConfig:](self, "setArticleIDsTodaySectionConfig:");
  }
  if ((*((_BYTE *)a3 + 310) & 1) != 0)
  {
    self->_shownInFavoritesOnlyMode = *((_BYTE *)a3 + 307);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  if (*((_QWORD *)a3 + 28))
    -[NTPBTodaySectionConfig setNameColorLight:](self, "setNameColorLight:");
  personalizedTodaySectionConfig = self->_personalizedTodaySectionConfig;
  v14 = *((_QWORD *)a3 + 32);
  if (personalizedTodaySectionConfig)
  {
    if (v14)
      -[NTPBPersonalizedTodaySectionSpecificConfig mergeFrom:](personalizedTodaySectionConfig, "mergeFrom:");
  }
  else if (v14)
  {
    -[NTPBTodaySectionConfig setPersonalizedTodaySectionConfig:](self, "setPersonalizedTodaySectionConfig:");
  }
  if ((*((_BYTE *)a3 + 309) & 1) != 0)
  {
    self->_seenArticlesMinimumTimeSinceFirstSeenToFilter = *((_QWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)a3 + 29))
    -[NTPBTodaySectionConfig setPersonalizationFeatureID:](self, "setPersonalizationFeatureID:");
  if ((*((_BYTE *)a3 + 309) & 0x80) != 0)
  {
    self->_presenceDeterminedByPersonalization = *((_BYTE *)a3 + 306);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  personalizedPresenceConfig = self->_personalizedPresenceConfig;
  v16 = *((_QWORD *)a3 + 30);
  if (personalizedPresenceConfig)
  {
    if (v16)
      -[NTPBPersonalizedSectionPresenceConfig mergeFrom:](personalizedPresenceConfig, "mergeFrom:");
  }
  else if (v16)
  {
    -[NTPBTodaySectionConfig setPersonalizedPresenceConfig:](self, "setPersonalizedPresenceConfig:");
  }
  v17 = objc_msgSend(a3, "queueMembershipsCount");
  if (v17)
  {
    v18 = v17;
    for (i = 0; i != v18; ++i)
      -[NTPBTodaySectionConfig addQueueMembership:](self, "addQueueMembership:", objc_msgSend(a3, "queueMembershipAtIndex:", i));
  }
  if (*((_QWORD *)a3 + 17))
    -[NTPBTodaySectionConfig setBackgroundGradientColor:](self, "setBackgroundGradientColor:");
  if ((*((_BYTE *)a3 + 309) & 0x40) != 0)
  {
    self->_glanceable = *((_BYTE *)a3 + 305);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((_QWORD *)a3 + 18))
    -[NTPBTodaySectionConfig setCompactName:](self, "setCompactName:");
  if (*((_QWORD *)a3 + 31))
    -[NTPBTodaySectionConfig setPersonalizedPresenceFeatureID:](self, "setPersonalizedPresenceFeatureID:");
  v20 = *((_DWORD *)a3 + 77);
  if ((v20 & 0x80) != 0)
  {
    self->_personalizedPresenceFeatureImpressionPrior = *((_QWORD *)a3 + 11);
    *(_DWORD *)&self->_has |= 0x80u;
    v20 = *((_DWORD *)a3 + 77);
  }
  if ((v20 & 0x40) != 0)
  {
    self->_personalizedPresenceFeatureClickPrior = *((_QWORD *)a3 + 10);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)a3 + 34))
    -[NTPBTodaySectionConfig setReferralBarName:](self, "setReferralBarName:");
  if (*((_QWORD *)a3 + 20))
    -[NTPBTodaySectionConfig setGroupActionTitle:](self, "setGroupActionTitle:");
  if (*((_QWORD *)a3 + 21))
    -[NTPBTodaySectionConfig setGroupActionUrl:](self, "setGroupActionUrl:");
  itemsTodaySectionConfig = self->_itemsTodaySectionConfig;
  v22 = *((_QWORD *)a3 + 24);
  if (itemsTodaySectionConfig)
  {
    if (v22)
      -[NTPBItemsTodaySectionSpecificConfig mergeFrom:](itemsTodaySectionConfig, "mergeFrom:");
  }
  else if (v22)
  {
    -[NTPBTodaySectionConfig setItemsTodaySectionConfig:](self, "setItemsTodaySectionConfig:");
  }
  if ((*((_BYTE *)a3 + 309) & 2) != 0)
  {
    self->_promotionCriterion = *((_DWORD *)a3 + 66);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((_QWORD *)a3 + 27))
    -[NTPBTodaySectionConfig setNameColorDark:](self, "setNameColorDark:");
  tagTodaySectionConfig = self->_tagTodaySectionConfig;
  v24 = *((_QWORD *)a3 + 37);
  if (tagTodaySectionConfig)
  {
    if (v24)
      -[NTPBTagTodaySectionSpecificConfig mergeFrom:](tagTodaySectionConfig, "mergeFrom:");
  }
  else if (v24)
  {
    -[NTPBTodaySectionConfig setTagTodaySectionConfig:](self, "setTagTodaySectionConfig:");
  }
  if (*((_QWORD *)a3 + 25))
    -[NTPBTodaySectionConfig setMutingTagID:](self, "setMutingTagID:");
  if (*((_QWORD *)a3 + 22))
    -[NTPBTodaySectionConfig setGroupNameActionUrl:](self, "setGroupNameActionUrl:");
  if (*((_QWORD *)a3 + 16))
    -[NTPBTodaySectionConfig setBackgroundColorLight:](self, "setBackgroundColorLight:");
  if (*((_QWORD *)a3 + 15))
    -[NTPBTodaySectionConfig setBackgroundColorDark:](self, "setBackgroundColorDark:");
  if ((*((_BYTE *)a3 + 309) & 0x20) != 0)
  {
    self->_filterNonSubscribedInFavoritesOnlyMode = *((_BYTE *)a3 + 304);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)a3 + 36))
    -[NTPBTodaySectionConfig setSubidentifier:](self, "setSubidentifier:");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (unint64_t)fallbackOrder
{
  return self->_fallbackOrder;
}

- (NTPBArticleListTodaySectionSpecificConfig)articleListTodaySectionConfig
{
  return self->_articleListTodaySectionConfig;
}

- (void)setArticleListTodaySectionConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NTPBForYouTodaySectionSpecificConfig)forYouTodaySectionConfig
{
  return self->_forYouTodaySectionConfig;
}

- (void)setForYouTodaySectionConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (unint64_t)minimumStoriesAllocation
{
  return self->_minimumStoriesAllocation;
}

- (unint64_t)maximumStoriesAllocation
{
  return self->_maximumStoriesAllocation;
}

- (unint64_t)intraSectionFilteringOptions
{
  return self->_intraSectionFilteringOptions;
}

- (unint64_t)interSectionFilteringOptions
{
  return self->_interSectionFilteringOptions;
}

- (NTPBArticleIDsTodaySectionSpecificConfig)articleIDsTodaySectionConfig
{
  return self->_articleIDsTodaySectionConfig;
}

- (void)setArticleIDsTodaySectionConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (BOOL)shownInFavoritesOnlyMode
{
  return self->_shownInFavoritesOnlyMode;
}

- (NSString)nameColorLight
{
  return self->_nameColorLight;
}

- (void)setNameColorLight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (NTPBPersonalizedTodaySectionSpecificConfig)personalizedTodaySectionConfig
{
  return self->_personalizedTodaySectionConfig;
}

- (void)setPersonalizedTodaySectionConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (unint64_t)seenArticlesMinimumTimeSinceFirstSeenToFilter
{
  return self->_seenArticlesMinimumTimeSinceFirstSeenToFilter;
}

- (NSString)personalizationFeatureID
{
  return self->_personalizationFeatureID;
}

- (void)setPersonalizationFeatureID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (BOOL)presenceDeterminedByPersonalization
{
  return self->_presenceDeterminedByPersonalization;
}

- (NTPBPersonalizedSectionPresenceConfig)personalizedPresenceConfig
{
  return self->_personalizedPresenceConfig;
}

- (void)setPersonalizedPresenceConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (NSString)backgroundGradientColor
{
  return self->_backgroundGradientColor;
}

- (void)setBackgroundGradientColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (BOOL)glanceable
{
  return self->_glanceable;
}

- (NSString)compactName
{
  return self->_compactName;
}

- (void)setCompactName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSString)personalizedPresenceFeatureID
{
  return self->_personalizedPresenceFeatureID;
}

- (void)setPersonalizedPresenceFeatureID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (unint64_t)personalizedPresenceFeatureImpressionPrior
{
  return self->_personalizedPresenceFeatureImpressionPrior;
}

- (unint64_t)personalizedPresenceFeatureClickPrior
{
  return self->_personalizedPresenceFeatureClickPrior;
}

- (NSString)referralBarName
{
  return self->_referralBarName;
}

- (void)setReferralBarName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (NSString)groupActionTitle
{
  return self->_groupActionTitle;
}

- (void)setGroupActionTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSString)groupActionUrl
{
  return self->_groupActionUrl;
}

- (void)setGroupActionUrl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NTPBItemsTodaySectionSpecificConfig)itemsTodaySectionConfig
{
  return self->_itemsTodaySectionConfig;
}

- (void)setItemsTodaySectionConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSString)nameColorDark
{
  return self->_nameColorDark;
}

- (void)setNameColorDark:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (NTPBTagTodaySectionSpecificConfig)tagTodaySectionConfig
{
  return self->_tagTodaySectionConfig;
}

- (void)setTagTodaySectionConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (NSString)mutingTagID
{
  return self->_mutingTagID;
}

- (void)setMutingTagID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSString)groupNameActionUrl
{
  return self->_groupNameActionUrl;
}

- (void)setGroupNameActionUrl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (void)setBackgroundColorLight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

- (void)setBackgroundColorDark:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (BOOL)filterNonSubscribedInFavoritesOnlyMode
{
  return self->_filterNonSubscribedInFavoritesOnlyMode;
}

- (NSString)subidentifier
{
  return self->_subidentifier;
}

- (void)setSubidentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

@end
