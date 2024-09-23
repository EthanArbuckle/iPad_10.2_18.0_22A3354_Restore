@implementation NTPBScoreProfile

- (NTPBScoreProfileDebug)debugFields
{
  return self->_debugFields;
}

- (double)agedPersonalizationScore
{
  return self->_agedPersonalizationScore;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBScoreProfile setCohortMemberships:](self, "setCohortMemberships:", 0);
  -[NTPBScoreProfile setGlobalCohort:](self, "setGlobalCohort:", 0);
  -[NTPBScoreProfile setCoefficients:](self, "setCoefficients:", 0);
  -[NTPBScoreProfile setDebugFields:](self, "setDebugFields:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBScoreProfile;
  -[NTPBScoreProfile dealloc](&v3, sel_dealloc);
}

- (void)setDebugFields:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (void)setCohortMemberships:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (void)setGlobalCohort:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (void)setCoefficients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (void)setUserFeedbackScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_userFeedbackScore = a3;
}

- (void)setSubscribedChannelCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_subscribedChannelCtr = a3;
}

- (void)setStaticMultiplier:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_staticMultiplier = a3;
}

- (void)setServerScoreDemocratizationFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_serverScoreDemocratizationFactor = a3;
}

- (void)setScoringVersion:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_scoringVersion = a3;
}

- (void)setRawUserFeedbackScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_rawUserFeedbackScore = a3;
}

- (void)setRawPersonalizationScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_rawPersonalizationScore = a3;
}

- (void)setQualitativeMultiplier:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_qualitativeMultiplier = a3;
}

- (void)setPublisherFavorability:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_publisherFavorability = a3;
}

- (void)setPublisherDampener:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_publisherDampener = a3;
}

- (void)setPersonalizationScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_personalizationScore = a3;
}

- (void)setPaidNonpaidSubscriptionCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_paidNonpaidSubscriptionCtr = a3;
}

- (void)setNicheContentMultiplier:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_nicheContentMultiplier = a3;
}

- (void)setMultiplier:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_multiplier = a3;
}

- (void)setIsEvergreen:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isEvergreen = a3;
}

- (void)setFeatureCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_featureCtr = a3;
}

- (void)setEmbeddingScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_embeddingScore = a3;
}

- (void)setDampenedStaticMultiplier:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_dampenedStaticMultiplier = a3;
}

- (void)setConversionMultiplier:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_conversionMultiplier = a3;
}

- (void)setContentTriggerDampener:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_contentTriggerDampener = a3;
}

- (void)setComputedGlobalScoreCoefficient:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_computedGlobalScoreCoefficient = a3;
}

- (void)setAutoSubscribeCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_autoSubscribeCtr = a3;
}

- (void)setAgedPersonalizationScore:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_agedPersonalizationScore = a3;
}

- (void)setHasFeatureCtr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFeatureCtr
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (void)setHasSubscribedChannelCtr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasSubscribedChannelCtr
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasPaidNonpaidSubscriptionCtr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPaidNonpaidSubscriptionCtr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasAutoSubscribeCtr:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAutoSubscribeCtr
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasComputedGlobalScoreCoefficient:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasComputedGlobalScoreCoefficient
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasUserFeedbackScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasUserFeedbackScore
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasRawUserFeedbackScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRawUserFeedbackScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasRawPersonalizationScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRawPersonalizationScore
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setHasPersonalizationScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPersonalizationScore
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasAgedPersonalizationScore:(BOOL)a3
{
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAgedPersonalizationScore
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasConversionMultiplier:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasConversionMultiplier
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasDampenedStaticMultiplier:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDampenedStaticMultiplier
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasStaticMultiplier:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasStaticMultiplier
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasQualitativeMultiplier:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasQualitativeMultiplier
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)clearCohortMemberships
{
  -[NSMutableArray removeAllObjects](self->_cohortMemberships, "removeAllObjects");
}

- (void)addCohortMemberships:(id)a3
{
  NSMutableArray *cohortMemberships;

  cohortMemberships = self->_cohortMemberships;
  if (!cohortMemberships)
  {
    cohortMemberships = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_cohortMemberships = cohortMemberships;
  }
  -[NSMutableArray addObject:](cohortMemberships, "addObject:", a3);
}

- (unint64_t)cohortMembershipsCount
{
  return -[NSMutableArray count](self->_cohortMemberships, "count");
}

- (id)cohortMembershipsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_cohortMemberships, "objectAtIndex:", a3);
}

+ (Class)cohortMembershipsType
{
  return (Class)objc_opt_class();
}

- (void)setHasEmbeddingScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasEmbeddingScore
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasPublisherDampener:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPublisherDampener
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setTabiScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_tabiScore = a3;
}

- (void)setHasTabiScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTabiScore
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setHasPublisherFavorability:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasPublisherFavorability
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasIsEvergreen:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsEvergreen
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (BOOL)hasGlobalCohort
{
  return self->_globalCohort != 0;
}

- (BOOL)hasCoefficients
{
  return self->_coefficients != 0;
}

- (void)setHasScoringVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasScoringVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setShadowTabiScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_shadowTabiScore = a3;
}

- (void)setHasShadowTabiScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasShadowTabiScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setShadowAgedPersonalizationScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_shadowAgedPersonalizationScore = a3;
}

- (void)setHasShadowAgedPersonalizationScore:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasShadowAgedPersonalizationScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasMultiplier:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMultiplier
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setDemocratizationFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_democratizationFactor = a3;
}

- (void)setHasDemocratizationFactor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDemocratizationFactor
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasNicheContentMultiplier:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNicheContentMultiplier
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasContentTriggerDampener:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasContentTriggerDampener
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasServerScoreDemocratizationFactor:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasServerScoreDemocratizationFactor
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setIsCoread:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isCoread = a3;
}

- (void)setHasIsCoread:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($4A3035DD976370AC557DD3FB75BB4EA0)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsCoread
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (BOOL)hasDebugFields
{
  return self->_debugFields != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBScoreProfile;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBScoreProfile description](&v3, sel_description), -[NTPBScoreProfile dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $4A3035DD976370AC557DD3FB75BB4EA0 has;
  void *v5;
  NSMutableArray *cohortMemberships;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $4A3035DD976370AC557DD3FB75BB4EA0 v11;
  NTPBScoringCohort *globalCohort;
  NTPBCoefficients *coefficients;
  $4A3035DD976370AC557DD3FB75BB4EA0 v14;
  NTPBScoreProfileDebug *debugFields;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_featureCtr), CFSTR("featureCtr"));
    has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_50;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_subscribedChannelCtr), CFSTR("subscribedChannelCtr"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_51;
  }
LABEL_50:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_paidNonpaidSubscriptionCtr), CFSTR("paidNonpaidSubscriptionCtr"));
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_52;
  }
LABEL_51:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_autoSubscribeCtr), CFSTR("autoSubscribeCtr"));
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_53;
  }
LABEL_52:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_computedGlobalScoreCoefficient), CFSTR("computedGlobalScoreCoefficient"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_54;
  }
LABEL_53:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_userFeedbackScore), CFSTR("userFeedbackScore"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_rawUserFeedbackScore), CFSTR("rawUserFeedbackScore"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_rawPersonalizationScore), CFSTR("rawPersonalizationScore"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_personalizationScore), CFSTR("personalizationScore"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_agedPersonalizationScore), CFSTR("agedPersonalizationScore"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_conversionMultiplier), CFSTR("conversionMultiplier"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_dampenedStaticMultiplier), CFSTR("dampenedStaticMultiplier"));
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_60:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_staticMultiplier), CFSTR("staticMultiplier"));
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_qualitativeMultiplier), CFSTR("qualitativeMultiplier"));
LABEL_16:
  if (-[NSMutableArray count](self->_cohortMemberships, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_cohortMemberships, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    cohortMemberships = self->_cohortMemberships;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cohortMemberships, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(cohortMemberships);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cohortMemberships, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cohortMemberships"));

  }
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x80) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_embeddingScore), CFSTR("embeddingScore"));
    v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x2000) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&v11 & 0x1000000) == 0)
        goto LABEL_28;
      goto LABEL_64;
    }
  }
  else if ((*(_WORD *)&v11 & 0x2000) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_publisherDampener), CFSTR("publisherDampener"));
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x1000000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v11 & 0x4000) == 0)
      goto LABEL_29;
    goto LABEL_65;
  }
LABEL_64:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_tabiScore), CFSTR("tabiScore"));
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v11 & 0x8000000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_65:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_publisherFavorability), CFSTR("publisherFavorability"));
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
LABEL_30:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEvergreen), CFSTR("isEvergreen"));
LABEL_31:
  globalCohort = self->_globalCohort;
  if (globalCohort)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBScoringCohort dictionaryRepresentation](globalCohort, "dictionaryRepresentation"), CFSTR("globalCohort"));
  coefficients = self->_coefficients;
  if (coefficients)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBCoefficients dictionaryRepresentation](coefficients, "dictionaryRepresentation"), CFSTR("coefficients"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_scoringVersion), CFSTR("scoring_version"));
    v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x200000) == 0)
    {
LABEL_37:
      if ((*(_DWORD *)&v14 & 0x100000) == 0)
        goto LABEL_38;
      goto LABEL_69;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x200000) == 0)
  {
    goto LABEL_37;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shadowTabiScore), CFSTR("shadowTabiScore"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v14 & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_70;
  }
LABEL_69:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_shadowAgedPersonalizationScore), CFSTR("shadowAgedPersonalizationScore"));
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&v14 & 0x40) == 0)
      goto LABEL_40;
    goto LABEL_71;
  }
LABEL_70:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_multiplier), CFSTR("multiplier"));
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v14 & 0x400) == 0)
      goto LABEL_41;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_democratizationFactor), CFSTR("democratization_factor"));
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x400) == 0)
  {
LABEL_41:
    if ((*(_BYTE *)&v14 & 8) == 0)
      goto LABEL_42;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_nicheContentMultiplier), CFSTR("niche_content_multiplier"));
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 8) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v14 & 0x80000) == 0)
      goto LABEL_43;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_contentTriggerDampener), CFSTR("content_trigger_dampener"));
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v14 & 0x4000000) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_74:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_serverScoreDemocratizationFactor), CFSTR("server_score_democratization_factor"));
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
LABEL_44:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCoread), CFSTR("is_coread"));
LABEL_45:
  debugFields = self->_debugFields;
  if (debugFields)
    objc_msgSend(v3, "setObject:forKey:", -[NTPBScoreProfileDebug dictionaryRepresentation](debugFields, "dictionaryRepresentation"), CFSTR("debugFields"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBScoreProfileReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  $4A3035DD976370AC557DD3FB75BB4EA0 has;
  NSMutableArray *cohortMemberships;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  $4A3035DD976370AC557DD3FB75BB4EA0 v10;
  $4A3035DD976370AC557DD3FB75BB4EA0 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_48;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteDoubleField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_58:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
LABEL_15:
    PBDataWriterWriteDoubleField();
LABEL_16:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  cohortMemberships = self->_cohortMemberships;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cohortMemberships, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(cohortMemberships);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cohortMemberships, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  v10 = self->_has;
  if ((*(_BYTE *)&v10 & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x2000) == 0)
    {
LABEL_25:
      if ((*(_DWORD *)&v10 & 0x1000000) == 0)
        goto LABEL_26;
      goto LABEL_62;
    }
  }
  else if ((*(_WORD *)&v10 & 0x2000) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteDoubleField();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v10 & 0x4000) == 0)
      goto LABEL_27;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteDoubleField();
  v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x4000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v10 & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_63:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
LABEL_28:
    PBDataWriterWriteBOOLField();
LABEL_29:
  if (self->_globalCohort)
    PBDataWriterWriteSubmessage();
  if (self->_coefficients)
    PBDataWriterWriteSubmessage();
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x40000) != 0)
  {
    PBDataWriterWriteUint64Field();
    v11 = self->_has;
    if ((*(_DWORD *)&v11 & 0x200000) == 0)
    {
LABEL_35:
      if ((*(_DWORD *)&v11 & 0x100000) == 0)
        goto LABEL_36;
      goto LABEL_67;
    }
  }
  else if ((*(_DWORD *)&v11 & 0x200000) == 0)
  {
    goto LABEL_35;
  }
  PBDataWriterWriteDoubleField();
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x100000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v11 & 0x200) == 0)
      goto LABEL_37;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteDoubleField();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
LABEL_37:
    if ((*(_BYTE *)&v11 & 0x40) == 0)
      goto LABEL_38;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteDoubleField();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x40) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v11 & 0x400) == 0)
      goto LABEL_39;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteDoubleField();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x400) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&v11 & 8) == 0)
      goto LABEL_40;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteDoubleField();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 8) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v11 & 0x80000) == 0)
      goto LABEL_41;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteDoubleField();
  v11 = self->_has;
  if ((*(_DWORD *)&v11 & 0x80000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v11 & 0x4000000) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_72:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x4000000) != 0)
LABEL_42:
    PBDataWriterWriteBOOLField();
LABEL_43:
  if (self->_debugFields)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $4A3035DD976370AC557DD3FB75BB4EA0 has;
  NSMutableArray *cohortMemberships;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  $4A3035DD976370AC557DD3FB75BB4EA0 v14;
  $4A3035DD976370AC557DD3FB75BB4EA0 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(double *)(v5 + 72) = self->_featureCtr;
    *(_DWORD *)(v5 + 252) |= 0x100u;
    has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_42;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 192) = self->_subscribedChannelCtr;
  *(_DWORD *)(v5 + 252) |= 0x800000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&has & 2) == 0)
      goto LABEL_5;
    goto LABEL_43;
  }
LABEL_42:
  *(double *)(v5 + 96) = self->_paidNonpaidSubscriptionCtr;
  *(_DWORD *)(v5 + 252) |= 0x800u;
  has = self->_has;
  if ((*(_BYTE *)&has & 2) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_6;
    goto LABEL_44;
  }
LABEL_43:
  *(double *)(v5 + 16) = self->_autoSubscribeCtr;
  *(_DWORD *)(v5 + 252) |= 2u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_45;
  }
LABEL_44:
  *(double *)(v5 + 24) = self->_computedGlobalScoreCoefficient;
  *(_DWORD *)(v5 + 252) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_46;
  }
LABEL_45:
  *(double *)(v5 + 208) = self->_userFeedbackScore;
  *(_DWORD *)(v5 + 252) |= 0x2000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_47;
  }
LABEL_46:
  *(double *)(v5 + 144) = self->_rawUserFeedbackScore;
  *(_DWORD *)(v5 + 252) |= 0x20000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_48;
  }
LABEL_47:
  *(double *)(v5 + 136) = self->_rawPersonalizationScore;
  *(_DWORD *)(v5 + 252) |= 0x10000u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&has & 1) == 0)
      goto LABEL_11;
    goto LABEL_49;
  }
LABEL_48:
  *(double *)(v5 + 104) = self->_personalizationScore;
  *(_DWORD *)(v5 + 252) |= 0x1000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 1) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_50;
  }
LABEL_49:
  *(double *)(v5 + 8) = self->_agedPersonalizationScore;
  *(_DWORD *)(v5 + 252) |= 1u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&has & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_51;
  }
LABEL_50:
  *(double *)(v5 + 40) = self->_conversionMultiplier;
  *(_DWORD *)(v5 + 252) |= 0x10u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 48) = self->_dampenedStaticMultiplier;
  *(_DWORD *)(v5 + 252) |= 0x20u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_52:
  *(double *)(v5 + 184) = self->_staticMultiplier;
  *(_DWORD *)(v5 + 252) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_15:
    *(double *)(v5 + 128) = self->_qualitativeMultiplier;
    *(_DWORD *)(v5 + 252) |= 0x8000u;
  }
LABEL_16:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  cohortMemberships = self->_cohortMemberships;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cohortMemberships, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(cohortMemberships);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addCohortMemberships:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](cohortMemberships, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x80) != 0)
  {
    *(double *)(v6 + 64) = self->_embeddingScore;
    *(_DWORD *)(v6 + 252) |= 0x80u;
    v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x2000) == 0)
    {
LABEL_25:
      if ((*(_DWORD *)&v14 & 0x1000000) == 0)
        goto LABEL_26;
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
    goto LABEL_25;
  }
  *(double *)(v6 + 112) = self->_publisherDampener;
  *(_DWORD *)(v6 + 252) |= 0x2000u;
  v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v14 & 0x4000) == 0)
      goto LABEL_27;
    goto LABEL_57;
  }
LABEL_56:
  *(double *)(v6 + 200) = self->_tabiScore;
  *(_DWORD *)(v6 + 252) |= 0x1000000u;
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v14 & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_57:
  *(double *)(v6 + 120) = self->_publisherFavorability;
  *(_DWORD *)(v6 + 252) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x8000000) != 0)
  {
LABEL_28:
    *(_BYTE *)(v6 + 249) = self->_isEvergreen;
    *(_DWORD *)(v6 + 252) |= 0x8000000u;
  }
LABEL_29:

  *(_QWORD *)(v6 + 240) = -[NTPBScoringCohort copyWithZone:](self->_globalCohort, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 216) = -[NTPBCoefficients copyWithZone:](self->_coefficients, "copyWithZone:", a3);
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
    *(_QWORD *)(v6 + 152) = self->_scoringVersion;
    *(_DWORD *)(v6 + 252) |= 0x40000u;
    v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x200000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v15 & 0x100000) == 0)
        goto LABEL_32;
      goto LABEL_61;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x200000) == 0)
  {
    goto LABEL_31;
  }
  *(double *)(v6 + 176) = self->_shadowTabiScore;
  *(_DWORD *)(v6 + 252) |= 0x200000u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x100000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v15 & 0x200) == 0)
      goto LABEL_33;
    goto LABEL_62;
  }
LABEL_61:
  *(double *)(v6 + 168) = self->_shadowAgedPersonalizationScore;
  *(_DWORD *)(v6 + 252) |= 0x100000u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) == 0)
  {
LABEL_33:
    if ((*(_BYTE *)&v15 & 0x40) == 0)
      goto LABEL_34;
    goto LABEL_63;
  }
LABEL_62:
  *(double *)(v6 + 80) = self->_multiplier;
  *(_DWORD *)(v6 + 252) |= 0x200u;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 0x40) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v15 & 0x400) == 0)
      goto LABEL_35;
    goto LABEL_64;
  }
LABEL_63:
  *(double *)(v6 + 56) = self->_democratizationFactor;
  *(_DWORD *)(v6 + 252) |= 0x40u;
  v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x400) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v15 & 8) == 0)
      goto LABEL_36;
    goto LABEL_65;
  }
LABEL_64:
  *(double *)(v6 + 88) = self->_nicheContentMultiplier;
  *(_DWORD *)(v6 + 252) |= 0x400u;
  v15 = self->_has;
  if ((*(_BYTE *)&v15 & 8) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v15 & 0x80000) == 0)
      goto LABEL_37;
LABEL_66:
    *(double *)(v6 + 160) = self->_serverScoreDemocratizationFactor;
    *(_DWORD *)(v6 + 252) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x4000000) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_65:
  *(double *)(v6 + 32) = self->_contentTriggerDampener;
  *(_DWORD *)(v6 + 252) |= 8u;
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x80000) != 0)
    goto LABEL_66;
LABEL_37:
  if ((*(_DWORD *)&v15 & 0x4000000) != 0)
  {
LABEL_38:
    *(_BYTE *)(v6 + 248) = self->_isCoread;
    *(_DWORD *)(v6 + 252) |= 0x4000000u;
  }
LABEL_39:

  *(_QWORD *)(v6 + 232) = -[NTPBScoreProfileDebug copyWithZone:](self->_debugFields, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $4A3035DD976370AC557DD3FB75BB4EA0 has;
  int v7;
  NSMutableArray *cohortMemberships;
  int v9;
  NTPBScoringCohort *globalCohort;
  NTPBCoefficients *coefficients;
  $4A3035DD976370AC557DD3FB75BB4EA0 v12;
  int v13;
  NTPBScoreProfileDebug *debugFields;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((_DWORD *)a3 + 63);
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_featureCtr != *((double *)a3 + 9))
        goto LABEL_99;
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_subscribedChannelCtr != *((double *)a3 + 24))
        goto LABEL_99;
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_paidNonpaidSubscriptionCtr != *((double *)a3 + 12))
        goto LABEL_99;
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_autoSubscribeCtr != *((double *)a3 + 2))
        goto LABEL_99;
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_computedGlobalScoreCoefficient != *((double *)a3 + 3))
        goto LABEL_99;
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_userFeedbackScore != *((double *)a3 + 26))
        goto LABEL_99;
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_rawUserFeedbackScore != *((double *)a3 + 18))
        goto LABEL_99;
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_rawPersonalizationScore != *((double *)a3 + 17))
        goto LABEL_99;
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_personalizationScore != *((double *)a3 + 13))
        goto LABEL_99;
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((v7 & 1) == 0 || self->_agedPersonalizationScore != *((double *)a3 + 1))
        goto LABEL_99;
    }
    else if ((v7 & 1) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_conversionMultiplier != *((double *)a3 + 5))
        goto LABEL_99;
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_dampenedStaticMultiplier != *((double *)a3 + 6))
        goto LABEL_99;
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_staticMultiplier != *((double *)a3 + 23))
        goto LABEL_99;
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_qualitativeMultiplier != *((double *)a3 + 16))
        goto LABEL_99;
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_99;
    }
    cohortMemberships = self->_cohortMemberships;
    if ((unint64_t)cohortMemberships | *((_QWORD *)a3 + 28))
    {
      v5 = -[NSMutableArray isEqual:](cohortMemberships, "isEqual:");
      if (!v5)
        return v5;
      has = self->_has;
    }
    v9 = *((_DWORD *)a3 + 63);
    if ((*(_BYTE *)&has & 0x80) != 0)
    {
      if ((v9 & 0x80) == 0 || self->_embeddingScore != *((double *)a3 + 8))
        goto LABEL_99;
    }
    else if ((v9 & 0x80) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v9 & 0x2000) == 0 || self->_publisherDampener != *((double *)a3 + 14))
        goto LABEL_99;
    }
    else if ((v9 & 0x2000) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v9 & 0x1000000) == 0 || self->_tabiScore != *((double *)a3 + 25))
        goto LABEL_99;
    }
    else if ((v9 & 0x1000000) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v9 & 0x4000) == 0 || self->_publisherFavorability != *((double *)a3 + 15))
        goto LABEL_99;
    }
    else if ((v9 & 0x4000) != 0)
    {
      goto LABEL_99;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v9 & 0x8000000) == 0)
        goto LABEL_99;
      if (self->_isEvergreen)
      {
        if (!*((_BYTE *)a3 + 249))
          goto LABEL_99;
      }
      else if (*((_BYTE *)a3 + 249))
      {
        goto LABEL_99;
      }
    }
    else if ((v9 & 0x8000000) != 0)
    {
      goto LABEL_99;
    }
    globalCohort = self->_globalCohort;
    if (!((unint64_t)globalCohort | *((_QWORD *)a3 + 30))
      || (v5 = -[NTPBScoringCohort isEqual:](globalCohort, "isEqual:")) != 0)
    {
      coefficients = self->_coefficients;
      if (!((unint64_t)coefficients | *((_QWORD *)a3 + 27))
        || (v5 = -[NTPBCoefficients isEqual:](coefficients, "isEqual:")) != 0)
      {
        v12 = self->_has;
        v13 = *((_DWORD *)a3 + 63);
        if ((*(_DWORD *)&v12 & 0x40000) != 0)
        {
          if ((v13 & 0x40000) == 0 || self->_scoringVersion != *((_QWORD *)a3 + 19))
            goto LABEL_99;
        }
        else if ((v13 & 0x40000) != 0)
        {
          goto LABEL_99;
        }
        if ((*(_DWORD *)&v12 & 0x200000) != 0)
        {
          if ((v13 & 0x200000) == 0 || self->_shadowTabiScore != *((double *)a3 + 22))
            goto LABEL_99;
        }
        else if ((v13 & 0x200000) != 0)
        {
          goto LABEL_99;
        }
        if ((*(_DWORD *)&v12 & 0x100000) != 0)
        {
          if ((v13 & 0x100000) == 0 || self->_shadowAgedPersonalizationScore != *((double *)a3 + 21))
            goto LABEL_99;
        }
        else if ((v13 & 0x100000) != 0)
        {
          goto LABEL_99;
        }
        if ((*(_WORD *)&v12 & 0x200) != 0)
        {
          if ((v13 & 0x200) == 0 || self->_multiplier != *((double *)a3 + 10))
            goto LABEL_99;
        }
        else if ((v13 & 0x200) != 0)
        {
          goto LABEL_99;
        }
        if ((*(_BYTE *)&v12 & 0x40) != 0)
        {
          if ((v13 & 0x40) == 0 || self->_democratizationFactor != *((double *)a3 + 7))
            goto LABEL_99;
        }
        else if ((v13 & 0x40) != 0)
        {
          goto LABEL_99;
        }
        if ((*(_WORD *)&v12 & 0x400) != 0)
        {
          if ((v13 & 0x400) == 0 || self->_nicheContentMultiplier != *((double *)a3 + 11))
            goto LABEL_99;
        }
        else if ((v13 & 0x400) != 0)
        {
          goto LABEL_99;
        }
        if ((*(_BYTE *)&v12 & 8) != 0)
        {
          if ((v13 & 8) == 0 || self->_contentTriggerDampener != *((double *)a3 + 4))
            goto LABEL_99;
        }
        else if ((v13 & 8) != 0)
        {
          goto LABEL_99;
        }
        if ((*(_DWORD *)&v12 & 0x80000) != 0)
        {
          if ((v13 & 0x80000) == 0 || self->_serverScoreDemocratizationFactor != *((double *)a3 + 20))
            goto LABEL_99;
        }
        else if ((v13 & 0x80000) != 0)
        {
          goto LABEL_99;
        }
        if ((*(_DWORD *)&v12 & 0x4000000) != 0)
        {
          if ((v13 & 0x4000000) != 0)
          {
            if (self->_isCoread)
            {
              if (!*((_BYTE *)a3 + 248))
                goto LABEL_99;
              goto LABEL_157;
            }
            if (!*((_BYTE *)a3 + 248))
            {
LABEL_157:
              debugFields = self->_debugFields;
              if ((unint64_t)debugFields | *((_QWORD *)a3 + 29))
                LOBYTE(v5) = -[NTPBScoreProfileDebug isEqual:](debugFields, "isEqual:");
              else
                LOBYTE(v5) = 1;
              return v5;
            }
          }
        }
        else if ((v13 & 0x4000000) == 0)
        {
          goto LABEL_157;
        }
LABEL_99:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $4A3035DD976370AC557DD3FB75BB4EA0 has;
  unint64_t v4;
  double featureCtr;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double subscribedChannelCtr;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double paidNonpaidSubscriptionCtr;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double autoSubscribeCtr;
  double v21;
  long double v22;
  double v23;
  unint64_t v24;
  double computedGlobalScoreCoefficient;
  double v26;
  long double v27;
  double v28;
  unint64_t v29;
  double userFeedbackScore;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;
  double rawUserFeedbackScore;
  double v36;
  long double v37;
  double v38;
  unint64_t v39;
  double rawPersonalizationScore;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  double personalizationScore;
  double v46;
  long double v47;
  double v48;
  unint64_t v49;
  double agedPersonalizationScore;
  double v51;
  long double v52;
  double v53;
  unint64_t v54;
  double conversionMultiplier;
  double v56;
  long double v57;
  double v58;
  unint64_t v59;
  double dampenedStaticMultiplier;
  double v61;
  long double v62;
  double v63;
  unint64_t v64;
  double staticMultiplier;
  double v66;
  long double v67;
  double v68;
  unint64_t v69;
  double qualitativeMultiplier;
  double v71;
  long double v72;
  double v73;
  $4A3035DD976370AC557DD3FB75BB4EA0 v74;
  unint64_t v75;
  double embeddingScore;
  double v77;
  long double v78;
  double v79;
  unint64_t v80;
  double publisherDampener;
  double v82;
  long double v83;
  double v84;
  unint64_t v85;
  double tabiScore;
  double v87;
  long double v88;
  double v89;
  unint64_t v90;
  double publisherFavorability;
  double v92;
  long double v93;
  double v94;
  $4A3035DD976370AC557DD3FB75BB4EA0 v95;
  double shadowTabiScore;
  double v97;
  long double v98;
  double v99;
  unint64_t v100;
  unint64_t v101;
  double shadowAgedPersonalizationScore;
  double v103;
  long double v104;
  double v105;
  unint64_t v106;
  double multiplier;
  double v108;
  long double v109;
  double v110;
  unint64_t v111;
  unint64_t v112;
  double democratizationFactor;
  double v114;
  long double v115;
  double v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  double nicheContentMultiplier;
  double v121;
  long double v122;
  double v123;
  unint64_t v124;
  double contentTriggerDampener;
  double v126;
  long double v127;
  double v128;
  unint64_t v129;
  double serverScoreDemocratizationFactor;
  double v131;
  long double v132;
  double v133;
  uint64_t v134;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  uint64_t v140;
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  unint64_t v154;
  unint64_t v155;
  unint64_t v156;
  unint64_t v157;

  has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    featureCtr = self->_featureCtr;
    v6 = -featureCtr;
    if (featureCtr >= 0.0)
      v6 = self->_featureCtr;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    subscribedChannelCtr = self->_subscribedChannelCtr;
    v11 = -subscribedChannelCtr;
    if (subscribedChannelCtr >= 0.0)
      v11 = self->_subscribedChannelCtr;
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
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    paidNonpaidSubscriptionCtr = self->_paidNonpaidSubscriptionCtr;
    v16 = -paidNonpaidSubscriptionCtr;
    if (paidNonpaidSubscriptionCtr >= 0.0)
      v16 = self->_paidNonpaidSubscriptionCtr;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    autoSubscribeCtr = self->_autoSubscribeCtr;
    v21 = -autoSubscribeCtr;
    if (autoSubscribeCtr >= 0.0)
      v21 = self->_autoSubscribeCtr;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    computedGlobalScoreCoefficient = self->_computedGlobalScoreCoefficient;
    v26 = -computedGlobalScoreCoefficient;
    if (computedGlobalScoreCoefficient >= 0.0)
      v26 = self->_computedGlobalScoreCoefficient;
    v27 = floor(v26 + 0.5);
    v28 = (v26 - v27) * 1.84467441e19;
    v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0)
        v24 += (unint64_t)v28;
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    v24 = 0;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    userFeedbackScore = self->_userFeedbackScore;
    v31 = -userFeedbackScore;
    if (userFeedbackScore >= 0.0)
      v31 = self->_userFeedbackScore;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    rawUserFeedbackScore = self->_rawUserFeedbackScore;
    v36 = -rawUserFeedbackScore;
    if (rawUserFeedbackScore >= 0.0)
      v36 = self->_rawUserFeedbackScore;
    v37 = floor(v36 + 0.5);
    v38 = (v36 - v37) * 1.84467441e19;
    v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0)
        v34 += (unint64_t)v38;
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    v34 = 0;
  }
  v153 = v34;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    rawPersonalizationScore = self->_rawPersonalizationScore;
    v41 = -rawPersonalizationScore;
    if (rawPersonalizationScore >= 0.0)
      v41 = self->_rawPersonalizationScore;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  v152 = v39;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    personalizationScore = self->_personalizationScore;
    v46 = -personalizationScore;
    if (personalizationScore >= 0.0)
      v46 = self->_personalizationScore;
    v47 = floor(v46 + 0.5);
    v48 = (v46 - v47) * 1.84467441e19;
    v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0)
        v44 += (unint64_t)v48;
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    v44 = 0;
  }
  v151 = v44;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    agedPersonalizationScore = self->_agedPersonalizationScore;
    v51 = -agedPersonalizationScore;
    if (agedPersonalizationScore >= 0.0)
      v51 = self->_agedPersonalizationScore;
    v52 = floor(v51 + 0.5);
    v53 = (v51 - v52) * 1.84467441e19;
    v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0)
        v49 += (unint64_t)v53;
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    v49 = 0;
  }
  v150 = v49;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    conversionMultiplier = self->_conversionMultiplier;
    v56 = -conversionMultiplier;
    if (conversionMultiplier >= 0.0)
      v56 = self->_conversionMultiplier;
    v57 = floor(v56 + 0.5);
    v58 = (v56 - v57) * 1.84467441e19;
    v54 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0)
        v54 += (unint64_t)v58;
    }
    else
    {
      v54 -= (unint64_t)fabs(v58);
    }
  }
  else
  {
    v54 = 0;
  }
  v149 = v54;
  if ((*(_BYTE *)&has & 0x20) != 0)
  {
    dampenedStaticMultiplier = self->_dampenedStaticMultiplier;
    v61 = -dampenedStaticMultiplier;
    if (dampenedStaticMultiplier >= 0.0)
      v61 = self->_dampenedStaticMultiplier;
    v62 = floor(v61 + 0.5);
    v63 = (v61 - v62) * 1.84467441e19;
    v59 = 2654435761u * (unint64_t)fmod(v62, 1.84467441e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0)
        v59 += (unint64_t)v63;
    }
    else
    {
      v59 -= (unint64_t)fabs(v63);
    }
  }
  else
  {
    v59 = 0;
  }
  v148 = v59;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    staticMultiplier = self->_staticMultiplier;
    v66 = -staticMultiplier;
    if (staticMultiplier >= 0.0)
      v66 = self->_staticMultiplier;
    v67 = floor(v66 + 0.5);
    v68 = (v66 - v67) * 1.84467441e19;
    v64 = 2654435761u * (unint64_t)fmod(v67, 1.84467441e19);
    if (v68 >= 0.0)
    {
      if (v68 > 0.0)
        v64 += (unint64_t)v68;
    }
    else
    {
      v64 -= (unint64_t)fabs(v68);
    }
  }
  else
  {
    v64 = 0;
  }
  v147 = v64;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    qualitativeMultiplier = self->_qualitativeMultiplier;
    v71 = -qualitativeMultiplier;
    if (qualitativeMultiplier >= 0.0)
      v71 = self->_qualitativeMultiplier;
    v72 = floor(v71 + 0.5);
    v73 = (v71 - v72) * 1.84467441e19;
    v69 = 2654435761u * (unint64_t)fmod(v72, 1.84467441e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0)
        v69 += (unint64_t)v73;
    }
    else
    {
      v69 -= (unint64_t)fabs(v73);
    }
  }
  else
  {
    v69 = 0;
  }
  v146 = v69;
  v145 = -[NSMutableArray hash](self->_cohortMemberships, "hash");
  v74 = self->_has;
  if ((*(_BYTE *)&v74 & 0x80) != 0)
  {
    embeddingScore = self->_embeddingScore;
    v77 = -embeddingScore;
    if (embeddingScore >= 0.0)
      v77 = self->_embeddingScore;
    v78 = floor(v77 + 0.5);
    v79 = (v77 - v78) * 1.84467441e19;
    v75 = 2654435761u * (unint64_t)fmod(v78, 1.84467441e19);
    if (v79 >= 0.0)
    {
      if (v79 > 0.0)
        v75 += (unint64_t)v79;
    }
    else
    {
      v75 -= (unint64_t)fabs(v79);
    }
  }
  else
  {
    v75 = 0;
  }
  v144 = v75;
  if ((*(_WORD *)&v74 & 0x2000) != 0)
  {
    publisherDampener = self->_publisherDampener;
    v82 = -publisherDampener;
    if (publisherDampener >= 0.0)
      v82 = self->_publisherDampener;
    v83 = floor(v82 + 0.5);
    v84 = (v82 - v83) * 1.84467441e19;
    v80 = 2654435761u * (unint64_t)fmod(v83, 1.84467441e19);
    if (v84 >= 0.0)
    {
      if (v84 > 0.0)
        v80 += (unint64_t)v84;
    }
    else
    {
      v80 -= (unint64_t)fabs(v84);
    }
  }
  else
  {
    v80 = 0;
  }
  v143 = v80;
  if ((*(_DWORD *)&v74 & 0x1000000) != 0)
  {
    tabiScore = self->_tabiScore;
    v87 = -tabiScore;
    if (tabiScore >= 0.0)
      v87 = self->_tabiScore;
    v88 = floor(v87 + 0.5);
    v89 = (v87 - v88) * 1.84467441e19;
    v85 = 2654435761u * (unint64_t)fmod(v88, 1.84467441e19);
    if (v89 >= 0.0)
    {
      if (v89 > 0.0)
        v85 += (unint64_t)v89;
    }
    else
    {
      v85 -= (unint64_t)fabs(v89);
    }
  }
  else
  {
    v85 = 0;
  }
  v142 = v85;
  if ((*(_WORD *)&v74 & 0x4000) != 0)
  {
    publisherFavorability = self->_publisherFavorability;
    v92 = -publisherFavorability;
    if (publisherFavorability >= 0.0)
      v92 = self->_publisherFavorability;
    v93 = floor(v92 + 0.5);
    v94 = (v92 - v93) * 1.84467441e19;
    v90 = 2654435761u * (unint64_t)fmod(v93, 1.84467441e19);
    if (v94 >= 0.0)
    {
      if (v94 > 0.0)
        v90 += (unint64_t)v94;
    }
    else
    {
      v90 -= (unint64_t)fabs(v94);
    }
  }
  else
  {
    v90 = 0;
  }
  v155 = v19;
  v141 = v90;
  if ((*(_DWORD *)&v74 & 0x8000000) != 0)
    v140 = 2654435761 * self->_isEvergreen;
  else
    v140 = 0;
  v139 = -[NTPBScoringCohort hash](self->_globalCohort, "hash");
  v138 = -[NTPBCoefficients hash](self->_coefficients, "hash");
  v95 = self->_has;
  if ((*(_DWORD *)&v95 & 0x40000) != 0)
  {
    v137 = 2654435761u * self->_scoringVersion;
    if ((*(_DWORD *)&v95 & 0x200000) != 0)
      goto LABEL_150;
LABEL_155:
    v100 = 0;
    goto LABEL_158;
  }
  v137 = 0;
  if ((*(_DWORD *)&v95 & 0x200000) == 0)
    goto LABEL_155;
LABEL_150:
  shadowTabiScore = self->_shadowTabiScore;
  v97 = -shadowTabiScore;
  if (shadowTabiScore >= 0.0)
    v97 = self->_shadowTabiScore;
  v98 = floor(v97 + 0.5);
  v99 = (v97 - v98) * 1.84467441e19;
  v100 = 2654435761u * (unint64_t)fmod(v98, 1.84467441e19);
  if (v99 >= 0.0)
  {
    if (v99 > 0.0)
      v100 += (unint64_t)v99;
  }
  else
  {
    v100 -= (unint64_t)fabs(v99);
  }
LABEL_158:
  v156 = v14;
  v157 = v4;
  if ((*(_DWORD *)&v95 & 0x100000) != 0)
  {
    shadowAgedPersonalizationScore = self->_shadowAgedPersonalizationScore;
    v103 = -shadowAgedPersonalizationScore;
    if (shadowAgedPersonalizationScore >= 0.0)
      v103 = self->_shadowAgedPersonalizationScore;
    v104 = floor(v103 + 0.5);
    v105 = (v103 - v104) * 1.84467441e19;
    v101 = 2654435761u * (unint64_t)fmod(v104, 1.84467441e19);
    if (v105 >= 0.0)
    {
      if (v105 > 0.0)
        v101 += (unint64_t)v105;
    }
    else
    {
      v101 -= (unint64_t)fabs(v105);
    }
  }
  else
  {
    v101 = 0;
  }
  v154 = v9;
  if ((*(_WORD *)&v95 & 0x200) != 0)
  {
    multiplier = self->_multiplier;
    v108 = -multiplier;
    if (multiplier >= 0.0)
      v108 = self->_multiplier;
    v109 = floor(v108 + 0.5);
    v110 = (v108 - v109) * 1.84467441e19;
    v106 = 2654435761u * (unint64_t)fmod(v109, 1.84467441e19);
    if (v110 >= 0.0)
    {
      if (v110 > 0.0)
        v106 += (unint64_t)v110;
    }
    else
    {
      v106 -= (unint64_t)fabs(v110);
    }
  }
  else
  {
    v106 = 0;
  }
  v111 = v24;
  if ((*(_BYTE *)&v95 & 0x40) != 0)
  {
    democratizationFactor = self->_democratizationFactor;
    v114 = -democratizationFactor;
    if (democratizationFactor >= 0.0)
      v114 = self->_democratizationFactor;
    v115 = floor(v114 + 0.5);
    v116 = (v114 - v115) * 1.84467441e19;
    v112 = 2654435761u * (unint64_t)fmod(v115, 1.84467441e19);
    if (v116 >= 0.0)
    {
      if (v116 > 0.0)
        v112 += (unint64_t)v116;
    }
    else
    {
      v112 -= (unint64_t)fabs(v116);
    }
  }
  else
  {
    v112 = 0;
  }
  v136 = v106;
  v117 = v101;
  if ((*(_WORD *)&v95 & 0x400) != 0)
  {
    nicheContentMultiplier = self->_nicheContentMultiplier;
    v121 = -nicheContentMultiplier;
    if (nicheContentMultiplier >= 0.0)
      v121 = self->_nicheContentMultiplier;
    v122 = floor(v121 + 0.5);
    v123 = (v121 - v122) * 1.84467441e19;
    v119 = 2654435761u * (unint64_t)fmod(v122, 1.84467441e19);
    v118 = v100;
    if (v123 >= 0.0)
    {
      if (v123 > 0.0)
        v119 += (unint64_t)v123;
    }
    else
    {
      v119 -= (unint64_t)fabs(v123);
    }
  }
  else
  {
    v118 = v100;
    v119 = 0;
  }
  if ((*(_BYTE *)&v95 & 8) != 0)
  {
    contentTriggerDampener = self->_contentTriggerDampener;
    v126 = -contentTriggerDampener;
    if (contentTriggerDampener >= 0.0)
      v126 = self->_contentTriggerDampener;
    v127 = floor(v126 + 0.5);
    v128 = (v126 - v127) * 1.84467441e19;
    v124 = 2654435761u * (unint64_t)fmod(v127, 1.84467441e19);
    if (v128 >= 0.0)
    {
      if (v128 > 0.0)
        v124 += (unint64_t)v128;
    }
    else
    {
      v124 -= (unint64_t)fabs(v128);
    }
  }
  else
  {
    v124 = 0;
  }
  if ((*(_DWORD *)&v95 & 0x80000) != 0)
  {
    serverScoreDemocratizationFactor = self->_serverScoreDemocratizationFactor;
    v131 = -serverScoreDemocratizationFactor;
    if (serverScoreDemocratizationFactor >= 0.0)
      v131 = self->_serverScoreDemocratizationFactor;
    v132 = floor(v131 + 0.5);
    v133 = (v131 - v132) * 1.84467441e19;
    v129 = 2654435761u * (unint64_t)fmod(v132, 1.84467441e19);
    if (v133 >= 0.0)
    {
      if (v133 > 0.0)
        v129 += (unint64_t)v133;
    }
    else
    {
      v129 -= (unint64_t)fabs(v133);
    }
  }
  else
  {
    v129 = 0;
  }
  if ((*(_DWORD *)&v95 & 0x4000000) != 0)
    v134 = 2654435761 * self->_isCoread;
  else
    v134 = 0;
  return v154 ^ v157 ^ v156 ^ v155 ^ v111 ^ v29 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v145 ^ v139 ^ v138 ^ v137 ^ v118 ^ v117 ^ v136 ^ v112 ^ v119 ^ v124 ^ v129 ^ v134 ^ -[NTPBScoreProfileDebug hash](self->_debugFields, "hash");
}

- (void)mergeFrom:(id)a3
{
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  NTPBScoringCohort *globalCohort;
  uint64_t v13;
  NTPBCoefficients *coefficients;
  uint64_t v15;
  int v16;
  NTPBScoreProfileDebug *debugFields;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x100) != 0)
  {
    self->_featureCtr = *((double *)a3 + 9);
    *(_DWORD *)&self->_has |= 0x100u;
    v5 = *((_DWORD *)a3 + 63);
    if ((v5 & 0x800000) == 0)
    {
LABEL_3:
      if ((v5 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_34;
    }
  }
  else if ((v5 & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  self->_subscribedChannelCtr = *((double *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x800) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_35;
  }
LABEL_34:
  self->_paidNonpaidSubscriptionCtr = *((double *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_36;
  }
LABEL_35:
  self->_autoSubscribeCtr = *((double *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_37;
  }
LABEL_36:
  self->_computedGlobalScoreCoefficient = *((double *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20000) == 0)
      goto LABEL_8;
    goto LABEL_38;
  }
LABEL_37:
  self->_userFeedbackScore = *((double *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x20000) == 0)
  {
LABEL_8:
    if ((v5 & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_39;
  }
LABEL_38:
  self->_rawUserFeedbackScore = *((double *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x10000) == 0)
  {
LABEL_9:
    if ((v5 & 0x1000) == 0)
      goto LABEL_10;
    goto LABEL_40;
  }
LABEL_39:
  self->_rawPersonalizationScore = *((double *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x1000) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0)
      goto LABEL_11;
    goto LABEL_41;
  }
LABEL_40:
  self->_personalizationScore = *((double *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_42;
  }
LABEL_41:
  self->_agedPersonalizationScore = *((double *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x10) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0)
      goto LABEL_13;
    goto LABEL_43;
  }
LABEL_42:
  self->_conversionMultiplier = *((double *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_44;
  }
LABEL_43:
  self->_dampenedStaticMultiplier = *((double *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  v5 = *((_DWORD *)a3 + 63);
  if ((v5 & 0x400000) == 0)
  {
LABEL_14:
    if ((v5 & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_44:
  self->_staticMultiplier = *((double *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)a3 + 63) & 0x8000) != 0)
  {
LABEL_15:
    self->_qualitativeMultiplier = *((double *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_16:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 28);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        -[NTPBScoreProfile addCohortMemberships:](self, "addCohortMemberships:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  v11 = *((_DWORD *)a3 + 63);
  if ((v11 & 0x80) != 0)
  {
    self->_embeddingScore = *((double *)a3 + 8);
    *(_DWORD *)&self->_has |= 0x80u;
    v11 = *((_DWORD *)a3 + 63);
    if ((v11 & 0x2000) == 0)
    {
LABEL_25:
      if ((v11 & 0x1000000) == 0)
        goto LABEL_26;
      goto LABEL_48;
    }
  }
  else if ((v11 & 0x2000) == 0)
  {
    goto LABEL_25;
  }
  self->_publisherDampener = *((double *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  v11 = *((_DWORD *)a3 + 63);
  if ((v11 & 0x1000000) == 0)
  {
LABEL_26:
    if ((v11 & 0x4000) == 0)
      goto LABEL_27;
    goto LABEL_49;
  }
LABEL_48:
  self->_tabiScore = *((double *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v11 = *((_DWORD *)a3 + 63);
  if ((v11 & 0x4000) == 0)
  {
LABEL_27:
    if ((v11 & 0x8000000) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_49:
  self->_publisherFavorability = *((double *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)a3 + 63) & 0x8000000) != 0)
  {
LABEL_28:
    self->_isEvergreen = *((_BYTE *)a3 + 249);
    *(_DWORD *)&self->_has |= 0x8000000u;
  }
LABEL_29:
  globalCohort = self->_globalCohort;
  v13 = *((_QWORD *)a3 + 30);
  if (globalCohort)
  {
    if (v13)
      -[NTPBScoringCohort mergeFrom:](globalCohort, "mergeFrom:");
  }
  else if (v13)
  {
    -[NTPBScoreProfile setGlobalCohort:](self, "setGlobalCohort:");
  }
  coefficients = self->_coefficients;
  v15 = *((_QWORD *)a3 + 27);
  if (coefficients)
  {
    if (v15)
      -[NTPBCoefficients mergeFrom:](coefficients, "mergeFrom:");
  }
  else if (v15)
  {
    -[NTPBScoreProfile setCoefficients:](self, "setCoefficients:");
  }
  v16 = *((_DWORD *)a3 + 63);
  if ((v16 & 0x40000) != 0)
  {
    self->_scoringVersion = *((_QWORD *)a3 + 19);
    *(_DWORD *)&self->_has |= 0x40000u;
    v16 = *((_DWORD *)a3 + 63);
    if ((v16 & 0x200000) == 0)
    {
LABEL_60:
      if ((v16 & 0x100000) == 0)
        goto LABEL_61;
      goto LABEL_73;
    }
  }
  else if ((v16 & 0x200000) == 0)
  {
    goto LABEL_60;
  }
  self->_shadowTabiScore = *((double *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  v16 = *((_DWORD *)a3 + 63);
  if ((v16 & 0x100000) == 0)
  {
LABEL_61:
    if ((v16 & 0x200) == 0)
      goto LABEL_62;
    goto LABEL_74;
  }
LABEL_73:
  self->_shadowAgedPersonalizationScore = *((double *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  v16 = *((_DWORD *)a3 + 63);
  if ((v16 & 0x200) == 0)
  {
LABEL_62:
    if ((v16 & 0x40) == 0)
      goto LABEL_63;
    goto LABEL_75;
  }
LABEL_74:
  self->_multiplier = *((double *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  v16 = *((_DWORD *)a3 + 63);
  if ((v16 & 0x40) == 0)
  {
LABEL_63:
    if ((v16 & 0x400) == 0)
      goto LABEL_64;
    goto LABEL_76;
  }
LABEL_75:
  self->_democratizationFactor = *((double *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  v16 = *((_DWORD *)a3 + 63);
  if ((v16 & 0x400) == 0)
  {
LABEL_64:
    if ((v16 & 8) == 0)
      goto LABEL_65;
    goto LABEL_77;
  }
LABEL_76:
  self->_nicheContentMultiplier = *((double *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  v16 = *((_DWORD *)a3 + 63);
  if ((v16 & 8) == 0)
  {
LABEL_65:
    if ((v16 & 0x80000) == 0)
      goto LABEL_66;
    goto LABEL_78;
  }
LABEL_77:
  self->_contentTriggerDampener = *((double *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v16 = *((_DWORD *)a3 + 63);
  if ((v16 & 0x80000) == 0)
  {
LABEL_66:
    if ((v16 & 0x4000000) == 0)
      goto LABEL_68;
    goto LABEL_67;
  }
LABEL_78:
  self->_serverScoreDemocratizationFactor = *((double *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  if ((*((_DWORD *)a3 + 63) & 0x4000000) != 0)
  {
LABEL_67:
    self->_isCoread = *((_BYTE *)a3 + 248);
    *(_DWORD *)&self->_has |= 0x4000000u;
  }
LABEL_68:
  debugFields = self->_debugFields;
  v18 = *((_QWORD *)a3 + 29);
  if (debugFields)
  {
    if (v18)
      -[NTPBScoreProfileDebug mergeFrom:](debugFields, "mergeFrom:");
  }
  else if (v18)
  {
    -[NTPBScoreProfile setDebugFields:](self, "setDebugFields:");
  }
}

- (double)featureCtr
{
  return self->_featureCtr;
}

- (double)subscribedChannelCtr
{
  return self->_subscribedChannelCtr;
}

- (double)paidNonpaidSubscriptionCtr
{
  return self->_paidNonpaidSubscriptionCtr;
}

- (double)autoSubscribeCtr
{
  return self->_autoSubscribeCtr;
}

- (double)computedGlobalScoreCoefficient
{
  return self->_computedGlobalScoreCoefficient;
}

- (double)userFeedbackScore
{
  return self->_userFeedbackScore;
}

- (double)rawUserFeedbackScore
{
  return self->_rawUserFeedbackScore;
}

- (double)rawPersonalizationScore
{
  return self->_rawPersonalizationScore;
}

- (double)conversionMultiplier
{
  return self->_conversionMultiplier;
}

- (double)dampenedStaticMultiplier
{
  return self->_dampenedStaticMultiplier;
}

- (double)staticMultiplier
{
  return self->_staticMultiplier;
}

- (double)qualitativeMultiplier
{
  return self->_qualitativeMultiplier;
}

- (NSMutableArray)cohortMemberships
{
  return self->_cohortMemberships;
}

- (double)embeddingScore
{
  return self->_embeddingScore;
}

- (double)publisherDampener
{
  return self->_publisherDampener;
}

- (double)tabiScore
{
  return self->_tabiScore;
}

- (double)publisherFavorability
{
  return self->_publisherFavorability;
}

- (BOOL)isEvergreen
{
  return self->_isEvergreen;
}

- (NTPBScoringCohort)globalCohort
{
  return self->_globalCohort;
}

- (NTPBCoefficients)coefficients
{
  return self->_coefficients;
}

- (unint64_t)scoringVersion
{
  return self->_scoringVersion;
}

- (double)shadowTabiScore
{
  return self->_shadowTabiScore;
}

- (double)shadowAgedPersonalizationScore
{
  return self->_shadowAgedPersonalizationScore;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (double)democratizationFactor
{
  return self->_democratizationFactor;
}

- (double)nicheContentMultiplier
{
  return self->_nicheContentMultiplier;
}

- (double)contentTriggerDampener
{
  return self->_contentTriggerDampener;
}

- (double)serverScoreDemocratizationFactor
{
  return self->_serverScoreDemocratizationFactor;
}

- (BOOL)isCoread
{
  return self->_isCoread;
}

@end
