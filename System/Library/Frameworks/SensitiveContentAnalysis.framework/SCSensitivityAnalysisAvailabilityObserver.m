@implementation SCSensitivityAnalysisAvailabilityObserver

- (SCSensitivityAnalysisAvailabilityObserver)initWithSubscription:(id)a3
{
  id v5;
  SCSensitivityAnalysisAvailabilityObserver *v6;
  SCSensitivityAnalysisAvailabilityObserver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCSensitivityAnalysisAvailabilityObserver;
  v6 = -[SCSensitivityAnalysisAvailabilityObserver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_subscription, a3);

  return v7;
}

- (void)cancel
{
  -[MOCancellable cancel](self->_subscription, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
