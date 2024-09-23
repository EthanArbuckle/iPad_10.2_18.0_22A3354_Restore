@implementation HFAnalyticsSectionReorderingEvent

- (HFAnalyticsSectionReorderingEvent)initWithData:(id)a3
{
  id v4;
  HFAnalyticsSectionReorderingEvent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *reorderingAction;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFAnalyticsSectionReorderingEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v11, sel_initWithEventType_, 39);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HFAnalyticsDataSectionCountKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    objc_storeStrong((id *)&v5->_numberOfSections, v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HFAnalyticsDataSectionReorderingTypeKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    reorderingAction = v5->_reorderingAction;
    v5->_reorderingAction = (NSString *)v8;

  }
  return v5;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsSectionReorderingEvent;
  -[HFAnalyticsEvent payload](&v8, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA7CD768, CFSTR("homeAppEventCount"));
  -[HFAnalyticsSectionReorderingEvent numberOfSections](self, "numberOfSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("reorderingSectionsCount"));

  -[HFAnalyticsSectionReorderingEvent reorderingAction](self, "reorderingAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("reorderingSectionsType"));

  return v4;
}

- (NSNumber)numberOfSections
{
  return self->_numberOfSections;
}

- (void)setNumberOfSections:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfSections, a3);
}

- (NSString)reorderingAction
{
  return self->_reorderingAction;
}

- (void)setReorderingAction:(id)a3
{
  objc_storeStrong((id *)&self->_reorderingAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reorderingAction, 0);
  objc_storeStrong((id *)&self->_numberOfSections, 0);
}

@end
