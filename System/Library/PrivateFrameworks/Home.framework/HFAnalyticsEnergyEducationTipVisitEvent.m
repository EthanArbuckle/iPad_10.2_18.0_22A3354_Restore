@implementation HFAnalyticsEnergyEducationTipVisitEvent

- (HFAnalyticsEnergyEducationTipVisitEvent)initWithData:(id)a3
{
  void *v4;
  HFAnalyticsEnergyEducationTipVisitEvent *v5;
  HFAnalyticsEnergyEducationTipVisitEvent *v6;
  objc_super v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("educationTipViewState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    NSLog(CFSTR("HFAnalyticsEnergyEducationTipEvent viewState is nil"));
  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsEnergyEducationTipVisitEvent;
  v5 = -[HFAnalyticsEvent initWithEventType:](&v8, sel_initWithEventType_, 48);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_viewState, v4);

  return v6;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HFAnalyticsEnergyEducationTipVisitEvent;
  -[HFAnalyticsEvent payload](&v7, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsEnergyEducationTipVisitEvent viewState](self, "viewState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("educationTipViewState"));

  return v4;
}

- (NSNumber)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
  objc_storeStrong((id *)&self->_viewState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewState, 0);
}

@end
