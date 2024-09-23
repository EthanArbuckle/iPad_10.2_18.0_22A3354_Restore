@implementation HMDAnalyticsPredicateData

- (HMDAnalyticsPredicateData)init
{
  HMDAnalyticsPredicateData *v2;
  uint64_t v3;
  NSMutableArray *presenceEvents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDAnalyticsPredicateData;
  v2 = -[HMDAnalyticsPredicateData init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    presenceEvents = v2->_presenceEvents;
    v2->_presenceEvents = (NSMutableArray *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenceEvents, 0);
}

@end
