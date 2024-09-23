@implementation NTAggregationBudgetInfo

- (NTAggregationBudgetInfo)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTAggregationBudgetInfo;
  return -[NTAggregationBudgetInfo init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionSlotCostInfo, 0);
}

- (void)setEmbedsLimit:(unint64_t)a3
{
  self->_embedsLimit = a3;
}

- (void)setSectionSlotCostInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  -[NTAggregationBudgetInfo sectionSlotCostInfo](self, "sectionSlotCostInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSectionSlotCostInfo:", v5);

  objc_msgSend(v4, "setRespectMinMaxLimit:", -[NTAggregationBudgetInfo respectMinMaxLimit](self, "respectMinMaxLimit"));
  -[NTAggregationBudgetInfo slotsLimit](self, "slotsLimit");
  objc_msgSend(v4, "setSlotsLimit:");
  objc_msgSend(v4, "setAllowSectionTitles:", -[NTAggregationBudgetInfo allowSectionTitles](self, "allowSectionTitles"));
  return v4;
}

- (NTPBSectionSlotCostInfo)sectionSlotCostInfo
{
  return self->_sectionSlotCostInfo;
}

- (unint64_t)embedsLimit
{
  return self->_embedsLimit;
}

- (BOOL)respectMinMaxLimit
{
  return self->_respectMinMaxLimit;
}

- (void)setRespectMinMaxLimit:(BOOL)a3
{
  self->_respectMinMaxLimit = a3;
}

- (double)slotsLimit
{
  return self->_slotsLimit;
}

- (void)setSlotsLimit:(double)a3
{
  self->_slotsLimit = a3;
}

- (BOOL)allowSectionTitles
{
  return self->_allowSectionTitles;
}

- (void)setAllowSectionTitles:(BOOL)a3
{
  self->_allowSectionTitles = a3;
}

@end
