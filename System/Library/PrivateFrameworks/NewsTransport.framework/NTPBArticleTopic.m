@implementation NTPBArticleTopic

- (NSString)tagID
{
  return self->_tagID;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList)cohorts
{
  return self->_cohorts;
}

- (BOOL)hasContentAndRelevanceInfo
{
  return self->_contentAndRelevanceInfo != 0;
}

- (BOOL)isManagedTopic
{
  return self->_isManagedTopic;
}

- (BOOL)isManagedTopicWinner
{
  return self->_isManagedTopicWinner;
}

- (BOOL)isEligibleForGrouping
{
  return self->_isEligibleForGrouping;
}

- (BOOL)isEligibleForGroupingIfFavorited
{
  return self->_isEligibleForGroupingIfFavorited;
}

- (BOOL)isEligibleForGroupingIfAutofavorited
{
  return self->_isEligibleForGroupingIfAutofavorited;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats)conversionStats
{
  return self->_conversionStats;
}

- (BOOL)hasSubscriptionRate
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasQuality
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasOntologyLevel
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasFlowRate
{
  return *(_WORD *)&self->_has & 1;
}

- (double)subscriptionRate
{
  return self->_subscriptionRate;
}

- (double)flowRate
{
  return self->_flowRate;
}

- (void)setSubscriptionRate:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_subscriptionRate = a3;
}

- (void)setFlowRate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_flowRate = a3;
}

- (COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo)contentAndRelevanceInfo
{
  return self->_contentAndRelevanceInfo;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBArticleTopic setTagID:](self, "setTagID:", 0);
  -[NTPBArticleTopic setCohorts:](self, "setCohorts:", 0);
  -[NTPBArticleTopic setConversionStats:](self, "setConversionStats:", 0);
  -[NTPBArticleTopic setContentAndRelevanceInfo:](self, "setContentAndRelevanceInfo:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleTopic;
  -[NTPBArticleTopic dealloc](&v3, sel_dealloc);
}

- (void)setTagID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setConversionStats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setCohorts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setContentAndRelevanceInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setIsHidden:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isHidden = a3;
}

- (double)quality
{
  return self->_quality;
}

- (void)setQuality:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_quality = a3;
}

- (void)setIsManagedTopic:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isManagedTopic = a3;
}

- (void)setIsManagedTopicWinner:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isManagedTopicWinner = a3;
}

- (void)setIsEligibleForGroupingIfFavorited:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isEligibleForGroupingIfFavorited = a3;
}

- (void)setIsEligibleForGrouping:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isEligibleForGrouping = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  __int16 has;
  __int16 v7;
  __int16 v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 64) = -[NSString copyWithZone:](self->_tagID, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList copyWithZone:](self->_cohorts, "copyWithZone:", a3);
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 77) = self->_isHidden;
    *(_WORD *)(v5 + 80) |= 0x200u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 74) = self->_isEligibleForGrouping;
  *(_WORD *)(v5 + 80) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 76) = self->_isEligibleForGroupingIfFavorited;
    *(_WORD *)(v5 + 80) |= 0x100u;
  }
LABEL_5:

  *(_QWORD *)(v5 + 56) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats copyWithZone:](self->_conversionStats, "copyWithZone:", a3);
  v7 = (__int16)self->_has;
  if ((v7 & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 75) = self->_isEligibleForGroupingIfAutofavorited;
    *(_WORD *)(v5 + 80) |= 0x80u;
    v7 = (__int16)self->_has;
    if ((v7 & 0x400) == 0)
    {
LABEL_7:
      if ((v7 & 0x800) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 78) = self->_isManagedTopic;
  *(_WORD *)(v5 + 80) |= 0x400u;
  v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
LABEL_8:
    if ((v7 & 1) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *(_BYTE *)(v5 + 79) = self->_isManagedTopicWinner;
  *(_WORD *)(v5 + 80) |= 0x800u;
  v7 = (__int16)self->_has;
  if ((v7 & 1) == 0)
  {
LABEL_9:
    if ((v7 & 8) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *(double *)(v5 + 8) = self->_flowRate;
  *(_WORD *)(v5 + 80) |= 1u;
  v7 = (__int16)self->_has;
  if ((v7 & 8) == 0)
  {
LABEL_10:
    if ((v7 & 4) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *(double *)(v5 + 32) = self->_subscriptionRate;
  *(_WORD *)(v5 + 80) |= 8u;
  v7 = (__int16)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_11:
    if ((v7 & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_26:
  *(double *)(v5 + 24) = self->_quality;
  *(_WORD *)(v5 + 80) |= 4u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_12:
    *(_QWORD *)(v5 + 16) = self->_ontologyLevel;
    *(_WORD *)(v5 + 80) |= 2u;
  }
LABEL_13:

  *(_QWORD *)(v5 + 48) = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo copyWithZone:](self->_contentAndRelevanceInfo, "copyWithZone:", a3);
  v8 = (__int16)self->_has;
  if ((v8 & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 73) = self->_isDisallowedFromGrouping;
    *(_WORD *)(v5 + 80) |= 0x20u;
    v8 = (__int16)self->_has;
  }
  if ((v8 & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_hardFollowRequiredForGrouping;
    *(_WORD *)(v5 + 80) |= 0x10u;
  }
  return (id)v5;
}

- (void)setIsEligibleForGroupingIfAutofavorited:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isEligibleForGroupingIfAutofavorited = a3;
}

- (void)setIsDisallowedFromGrouping:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isDisallowedFromGrouping = a3;
}

- (void)setHardFollowRequiredForGrouping:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_hardFollowRequiredForGrouping = a3;
}

- (BOOL)hasTagID
{
  return self->_tagID != 0;
}

- (BOOL)hasCohorts
{
  return self->_cohorts != 0;
}

- (void)setHasIsHidden:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsHidden
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setHasIsEligibleForGrouping:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsEligibleForGrouping
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasIsEligibleForGroupingIfFavorited:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsEligibleForGroupingIfFavorited
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasConversionStats
{
  return self->_conversionStats != 0;
}

- (void)setHasIsEligibleForGroupingIfAutofavorited:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsEligibleForGroupingIfAutofavorited
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setHasIsManagedTopic:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsManagedTopic
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHasIsManagedTopicWinner:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsManagedTopicWinner
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setHasFlowRate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (void)setHasSubscriptionRate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (void)setHasQuality:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (void)setOntologyLevel:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ontologyLevel = a3;
}

- (void)setHasOntologyLevel:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (void)setHasIsDisallowedFromGrouping:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsDisallowedFromGrouping
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasHardFollowRequiredForGrouping:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHardFollowRequiredForGrouping
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBArticleTopic;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBArticleTopic description](&v3, sel_description), -[NTPBArticleTopic dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *tagID;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *cohorts;
  __int16 has;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *conversionStats;
  __int16 v9;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo *contentAndRelevanceInfo;
  __int16 v11;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  tagID = self->_tagID;
  if (tagID)
    objc_msgSend(v3, "setObject:forKey:", tagID, CFSTR("tag_ID"));
  cohorts = self->_cohorts;
  if (cohorts)
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList dictionaryRepresentation](cohorts, "dictionaryRepresentation"), CFSTR("cohorts"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isHidden), CFSTR("is_hidden"));
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x100) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEligibleForGrouping), CFSTR("is_eligible_for_grouping"));
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_8:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEligibleForGroupingIfFavorited), CFSTR("is_eligible_for_grouping_if_favorited"));
LABEL_9:
  conversionStats = self->_conversionStats;
  if (conversionStats)
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats dictionaryRepresentation](conversionStats, "dictionaryRepresentation"), CFSTR("conversion_stats"));
  v9 = (__int16)self->_has;
  if ((v9 & 0x80) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEligibleForGroupingIfAutofavorited), CFSTR("is_eligible_for_grouping_if_autofavorited"));
    v9 = (__int16)self->_has;
    if ((v9 & 0x400) == 0)
    {
LABEL_13:
      if ((v9 & 0x800) == 0)
        goto LABEL_14;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isManagedTopic), CFSTR("is_managed_topic"));
  v9 = (__int16)self->_has;
  if ((v9 & 0x800) == 0)
  {
LABEL_14:
    if ((v9 & 1) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isManagedTopicWinner), CFSTR("is_managed_topic_winner"));
  v9 = (__int16)self->_has;
  if ((v9 & 1) == 0)
  {
LABEL_15:
    if ((v9 & 8) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_flowRate), CFSTR("flow_rate"));
  v9 = (__int16)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_16:
    if ((v9 & 4) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_subscriptionRate), CFSTR("subscription_rate"));
  v9 = (__int16)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_17:
    if ((v9 & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_34:
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_quality), CFSTR("quality"));
  if ((*(_WORD *)&self->_has & 2) != 0)
LABEL_18:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_ontologyLevel), CFSTR("ontology_level"));
LABEL_19:
  contentAndRelevanceInfo = self->_contentAndRelevanceInfo;
  if (contentAndRelevanceInfo)
    objc_msgSend(v4, "setObject:forKey:", -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo dictionaryRepresentation](contentAndRelevanceInfo, "dictionaryRepresentation"), CFSTR("content_and_relevance_info"));
  v11 = (__int16)self->_has;
  if ((v11 & 0x20) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDisallowedFromGrouping), CFSTR("is_disallowed_from_grouping"));
    v11 = (__int16)self->_has;
  }
  if ((v11 & 0x10) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hardFollowRequiredForGrouping), CFSTR("hard_follow_required_for_grouping"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleTopicReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  __int16 v5;
  __int16 v6;

  if (self->_tagID)
    PBDataWriterWriteStringField();
  if (self->_cohorts)
    PBDataWriterWriteSubmessage();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x100) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_conversionStats)
    PBDataWriterWriteSubmessage();
  v5 = (__int16)self->_has;
  if ((v5 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (__int16)self->_has;
    if ((v5 & 0x400) == 0)
    {
LABEL_13:
      if ((v5 & 0x800) == 0)
        goto LABEL_14;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  v5 = (__int16)self->_has;
  if ((v5 & 0x800) == 0)
  {
LABEL_14:
    if ((v5 & 1) == 0)
      goto LABEL_15;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteBOOLField();
  v5 = (__int16)self->_has;
  if ((v5 & 1) == 0)
  {
LABEL_15:
    if ((v5 & 8) == 0)
      goto LABEL_16;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  v5 = (__int16)self->_has;
  if ((v5 & 8) == 0)
  {
LABEL_16:
    if ((v5 & 4) == 0)
      goto LABEL_17;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  v5 = (__int16)self->_has;
  if ((v5 & 4) == 0)
  {
LABEL_17:
    if ((v5 & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 2) != 0)
LABEL_18:
    PBDataWriterWriteInt64Field();
LABEL_19:
  if (self->_contentAndRelevanceInfo)
    PBDataWriterWriteSubmessage();
  v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (__int16)self->_has;
  }
  if ((v6 & 0x10) != 0)
    PBDataWriterWriteBOOLField();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *tagID;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *cohorts;
  __int16 has;
  __int16 v9;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *conversionStats;
  __int16 v11;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo *contentAndRelevanceInfo;
  __int16 v13;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  tagID = self->_tagID;
  if ((unint64_t)tagID | *((_QWORD *)a3 + 8))
  {
    v5 = -[NSString isEqual:](tagID, "isEqual:");
    if (!v5)
      return v5;
  }
  cohorts = self->_cohorts;
  if ((unint64_t)cohorts | *((_QWORD *)a3 + 5))
  {
    v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList isEqual:](cohorts, "isEqual:");
    if (!v5)
      return v5;
  }
  has = (__int16)self->_has;
  v9 = *((_WORD *)a3 + 40);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x200) == 0)
      goto LABEL_90;
    if (self->_isHidden)
    {
      if (!*((_BYTE *)a3 + 77))
        goto LABEL_90;
    }
    else if (*((_BYTE *)a3 + 77))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x200) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0)
      goto LABEL_90;
    if (self->_isEligibleForGrouping)
    {
      if (!*((_BYTE *)a3 + 74))
        goto LABEL_90;
    }
    else if (*((_BYTE *)a3 + 74))
    {
      goto LABEL_90;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_90;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x100) == 0)
      goto LABEL_90;
    if (self->_isEligibleForGroupingIfFavorited)
    {
      if (!*((_BYTE *)a3 + 76))
        goto LABEL_90;
    }
    else if (*((_BYTE *)a3 + 76))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x100) != 0)
  {
    goto LABEL_90;
  }
  conversionStats = self->_conversionStats;
  if ((unint64_t)conversionStats | *((_QWORD *)a3 + 7))
  {
    v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats isEqual:](conversionStats, "isEqual:");
    if (!v5)
      return v5;
    has = (__int16)self->_has;
  }
  v11 = *((_WORD *)a3 + 40);
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0)
      goto LABEL_90;
    if (self->_isEligibleForGroupingIfAutofavorited)
    {
      if (!*((_BYTE *)a3 + 75))
        goto LABEL_90;
    }
    else if (*((_BYTE *)a3 + 75))
    {
      goto LABEL_90;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x400) == 0)
      goto LABEL_90;
    if (self->_isManagedTopic)
    {
      if (!*((_BYTE *)a3 + 78))
        goto LABEL_90;
    }
    else if (*((_BYTE *)a3 + 78))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x400) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 40) & 0x800) == 0)
      goto LABEL_90;
    if (self->_isManagedTopicWinner)
    {
      if (!*((_BYTE *)a3 + 79))
        goto LABEL_90;
    }
    else if (*((_BYTE *)a3 + 79))
    {
      goto LABEL_90;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x800) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 1) != 0)
  {
    if ((v11 & 1) == 0 || self->_flowRate != *((double *)a3 + 1))
      goto LABEL_90;
  }
  else if ((v11 & 1) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_subscriptionRate != *((double *)a3 + 4))
      goto LABEL_90;
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_quality != *((double *)a3 + 3))
      goto LABEL_90;
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_90;
  }
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_ontologyLevel != *((_QWORD *)a3 + 2))
      goto LABEL_90;
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_90;
  }
  contentAndRelevanceInfo = self->_contentAndRelevanceInfo;
  if ((unint64_t)contentAndRelevanceInfo | *((_QWORD *)a3 + 6))
  {
    v5 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo isEqual:](contentAndRelevanceInfo, "isEqual:");
    if (!v5)
      return v5;
    has = (__int16)self->_has;
  }
  v13 = *((_WORD *)a3 + 40);
  if ((has & 0x20) != 0)
  {
    if ((v13 & 0x20) != 0)
    {
      if (self->_isDisallowedFromGrouping)
      {
        if (!*((_BYTE *)a3 + 73))
          goto LABEL_90;
        goto LABEL_88;
      }
      if (!*((_BYTE *)a3 + 73))
        goto LABEL_88;
    }
LABEL_90:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v13 & 0x20) != 0)
    goto LABEL_90;
LABEL_88:
  LOBYTE(v5) = (v13 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0)
      goto LABEL_90;
    if (self->_hardFollowRequiredForGrouping)
    {
      if (!*((_BYTE *)a3 + 72))
        goto LABEL_90;
    }
    else if (*((_BYTE *)a3 + 72))
    {
      goto LABEL_90;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double flowRate;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  double subscriptionRate;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  double quality;
  double v20;
  long double v21;
  double v22;
  uint64_t v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  NSUInteger v35;

  v35 = -[NSString hash](self->_tagID, "hash");
  v34 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList hash](self->_cohorts, "hash");
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
    v33 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
LABEL_6:
    v32 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v33 = 2654435761 * self->_isHidden;
  if ((has & 0x40) == 0)
    goto LABEL_6;
LABEL_3:
  v32 = 2654435761 * self->_isEligibleForGrouping;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v31 = 2654435761 * self->_isEligibleForGroupingIfFavorited;
    goto LABEL_8;
  }
LABEL_7:
  v31 = 0;
LABEL_8:
  v29 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats hash](self->_conversionStats, "hash");
  v4 = (__int16)self->_has;
  if ((v4 & 0x80) != 0)
  {
    v5 = 2654435761 * self->_isEligibleForGroupingIfAutofavorited;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_10:
      v6 = 2654435761 * self->_isManagedTopic;
      if ((*(_WORD *)&self->_has & 0x800) != 0)
        goto LABEL_11;
LABEL_18:
      v7 = 0;
      if ((v4 & 1) != 0)
        goto LABEL_12;
LABEL_19:
      v12 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_10;
  }
  v6 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0)
    goto LABEL_18;
LABEL_11:
  v7 = 2654435761 * self->_isManagedTopicWinner;
  if ((v4 & 1) == 0)
    goto LABEL_19;
LABEL_12:
  flowRate = self->_flowRate;
  v9 = -flowRate;
  if (flowRate >= 0.0)
    v9 = self->_flowRate;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_22:
  if ((v4 & 8) != 0)
  {
    subscriptionRate = self->_subscriptionRate;
    v15 = -subscriptionRate;
    if (subscriptionRate >= 0.0)
      v15 = self->_subscriptionRate;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((v4 & 4) != 0)
  {
    quality = self->_quality;
    v20 = -quality;
    if (quality >= 0.0)
      v20 = self->_quality;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  if ((v4 & 2) != 0)
    v23 = 2654435761 * self->_ontologyLevel;
  else
    v23 = 0;
  v24 = -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo hash](self->_contentAndRelevanceInfo, "hash", v29);
  v25 = (__int16)self->_has;
  if ((v25 & 0x20) != 0)
  {
    v26 = 2654435761 * self->_isDisallowedFromGrouping;
    if ((v25 & 0x10) != 0)
      goto LABEL_43;
LABEL_45:
    v27 = 0;
    return v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v23 ^ v24 ^ v26 ^ v27;
  }
  v26 = 0;
  if ((v25 & 0x10) == 0)
    goto LABEL_45;
LABEL_43:
  v27 = 2654435761 * self->_hardFollowRequiredForGrouping;
  return v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v23 ^ v24 ^ v26 ^ v27;
}

- (void)mergeFrom:(id)a3
{
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList *cohorts;
  uint64_t v6;
  __int16 v7;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats *conversionStats;
  uint64_t v9;
  __int16 v10;
  COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo *contentAndRelevanceInfo;
  uint64_t v12;
  __int16 v13;

  if (*((_QWORD *)a3 + 8))
    -[NTPBArticleTopic setTagID:](self, "setTagID:");
  cohorts = self->_cohorts;
  v6 = *((_QWORD *)a3 + 5);
  if (cohorts)
  {
    if (v6)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLCohortList mergeFrom:](cohorts, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBArticleTopic setCohorts:](self, "setCohorts:");
  }
  v7 = *((_WORD *)a3 + 40);
  if ((v7 & 0x200) != 0)
  {
    self->_isHidden = *((_BYTE *)a3 + 77);
    *(_WORD *)&self->_has |= 0x200u;
    v7 = *((_WORD *)a3 + 40);
    if ((v7 & 0x40) == 0)
    {
LABEL_10:
      if ((v7 & 0x100) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_10;
  }
  self->_isEligibleForGrouping = *((_BYTE *)a3 + 74);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 40) & 0x100) != 0)
  {
LABEL_11:
    self->_isEligibleForGroupingIfFavorited = *((_BYTE *)a3 + 76);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_12:
  conversionStats = self->_conversionStats;
  v9 = *((_QWORD *)a3 + 7);
  if (conversionStats)
  {
    if (v9)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLConversionStats mergeFrom:](conversionStats, "mergeFrom:");
  }
  else if (v9)
  {
    -[NTPBArticleTopic setConversionStats:](self, "setConversionStats:");
  }
  v10 = *((_WORD *)a3 + 40);
  if ((v10 & 0x80) != 0)
  {
    self->_isEligibleForGroupingIfAutofavorited = *((_BYTE *)a3 + 75);
    *(_WORD *)&self->_has |= 0x80u;
    v10 = *((_WORD *)a3 + 40);
    if ((v10 & 0x400) == 0)
    {
LABEL_22:
      if ((v10 & 0x800) == 0)
        goto LABEL_23;
      goto LABEL_33;
    }
  }
  else if ((*((_WORD *)a3 + 40) & 0x400) == 0)
  {
    goto LABEL_22;
  }
  self->_isManagedTopic = *((_BYTE *)a3 + 78);
  *(_WORD *)&self->_has |= 0x400u;
  v10 = *((_WORD *)a3 + 40);
  if ((v10 & 0x800) == 0)
  {
LABEL_23:
    if ((v10 & 1) == 0)
      goto LABEL_24;
    goto LABEL_34;
  }
LABEL_33:
  self->_isManagedTopicWinner = *((_BYTE *)a3 + 79);
  *(_WORD *)&self->_has |= 0x800u;
  v10 = *((_WORD *)a3 + 40);
  if ((v10 & 1) == 0)
  {
LABEL_24:
    if ((v10 & 8) == 0)
      goto LABEL_25;
    goto LABEL_35;
  }
LABEL_34:
  self->_flowRate = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  v10 = *((_WORD *)a3 + 40);
  if ((v10 & 8) == 0)
  {
LABEL_25:
    if ((v10 & 4) == 0)
      goto LABEL_26;
    goto LABEL_36;
  }
LABEL_35:
  self->_subscriptionRate = *((double *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  v10 = *((_WORD *)a3 + 40);
  if ((v10 & 4) == 0)
  {
LABEL_26:
    if ((v10 & 2) == 0)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_36:
  self->_quality = *((double *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)a3 + 40) & 2) != 0)
  {
LABEL_27:
    self->_ontologyLevel = *((_QWORD *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_28:
  contentAndRelevanceInfo = self->_contentAndRelevanceInfo;
  v12 = *((_QWORD *)a3 + 6);
  if (contentAndRelevanceInfo)
  {
    if (v12)
      -[COMAPPLEFELDSPARPROTOCOLLIVERPOOLContentAndRelevanceInfo mergeFrom:](contentAndRelevanceInfo, "mergeFrom:");
  }
  else if (v12)
  {
    -[NTPBArticleTopic setContentAndRelevanceInfo:](self, "setContentAndRelevanceInfo:");
  }
  v13 = *((_WORD *)a3 + 40);
  if ((v13 & 0x20) != 0)
  {
    self->_isDisallowedFromGrouping = *((_BYTE *)a3 + 73);
    *(_WORD *)&self->_has |= 0x20u;
    v13 = *((_WORD *)a3 + 40);
  }
  if ((v13 & 0x10) != 0)
  {
    self->_hardFollowRequiredForGrouping = *((_BYTE *)a3 + 72);
    *(_WORD *)&self->_has |= 0x10u;
  }
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (int64_t)ontologyLevel
{
  return self->_ontologyLevel;
}

- (BOOL)isDisallowedFromGrouping
{
  return self->_isDisallowedFromGrouping;
}

- (BOOL)hardFollowRequiredForGrouping
{
  return self->_hardFollowRequiredForGrouping;
}

@end
