@implementation ATXAdoptionTypeToBudgetMapper

- (ATXAdoptionTypeToBudgetMapper)initWithAbuseControlConfig:(id)a3
{
  id v5;
  ATXAdoptionTypeToBudgetMapper *v6;
  ATXAdoptionTypeToBudgetMapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAdoptionTypeToBudgetMapper;
  v6 = -[ATXAdoptionTypeToBudgetMapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_abuseControlConfig, a3);

  return v7;
}

- (int64_t)softQuotaForAdoptionType:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      return -[ATXTimelineAbuseControlConfig defaultSoftRotationQuotaForDiverseSchemas](self->_abuseControlConfig, "defaultSoftRotationQuotaForDiverseSchemas");
    case 2uLL:
      return -[ATXTimelineAbuseControlConfig defaultSoftRotationQuotaForLikelyDiverseSchemas](self->_abuseControlConfig, "defaultSoftRotationQuotaForLikelyDiverseSchemas");
    case 1uLL:
      return -[ATXTimelineAbuseControlConfig defaultSoftRotationQuotaForSingleScoreSchemas](self->_abuseControlConfig, "defaultSoftRotationQuotaForSingleScoreSchemas");
  }
  return 0;
}

- (int64_t)hardQuotaForAdoptionType:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      return -[ATXTimelineAbuseControlConfig defaultHardRotationQuotaForDiverseSchemas](self->_abuseControlConfig, "defaultHardRotationQuotaForDiverseSchemas");
    case 2uLL:
      return -[ATXTimelineAbuseControlConfig defaultHardRotationQuotaForLikelyDiverseSchemas](self->_abuseControlConfig, "defaultHardRotationQuotaForLikelyDiverseSchemas");
    case 1uLL:
      return -[ATXTimelineAbuseControlConfig defaultHardRotationQuotaForSingleScoreSchemas](self->_abuseControlConfig, "defaultHardRotationQuotaForSingleScoreSchemas");
  }
  return 0;
}

- (int64_t)durationLimitForAdoptionType:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      return -[ATXTimelineAbuseControlConfig defaultDurationLimitForDiverseSchemas](self->_abuseControlConfig, "defaultDurationLimitForDiverseSchemas");
    case 2uLL:
      return -[ATXTimelineAbuseControlConfig defaultDurationLimitForLikelyDiverseSchemas](self->_abuseControlConfig, "defaultDurationLimitForLikelyDiverseSchemas");
    case 1uLL:
      return -[ATXTimelineAbuseControlConfig defaultDurationLimitForSingleScoreSchemas](self->_abuseControlConfig, "defaultDurationLimitForSingleScoreSchemas");
  }
  return -[ATXTimelineAbuseControlConfig defaultDurationLimit](self->_abuseControlConfig, "defaultDurationLimit");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
}

@end
