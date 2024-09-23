@implementation HMMutableClientContext

- (HMMutableClientContext)initWithMetricIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMMutableClientContext;
  return -[HMClientContext initWithMetricIdentifier:](&v4, sel_initWithMetricIdentifier_, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMClientContext *v4;
  void *v5;
  HMClientContext *v6;

  v4 = [HMClientContext alloc];
  -[HMClientContext metricIdentifier](self, "metricIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMClientContext initWithMetricIdentifier:](v4, "initWithMetricIdentifier:", v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableClientContext *v4;
  void *v5;
  HMMutableClientContext *v6;

  v4 = +[HMMutableClientContext allocWithZone:](HMMutableClientContext, "allocWithZone:", a3);
  -[HMClientContext metricIdentifier](self, "metricIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMMutableClientContext initWithMetricIdentifier:](v4, "initWithMetricIdentifier:", v5);

  return v6;
}

+ (id)clientContextWithMetricIdentifier:(id)a3
{
  id v3;
  HMMutableClientContext *v4;

  v3 = a3;
  v4 = -[HMMutableClientContext initWithMetricIdentifier:]([HMMutableClientContext alloc], "initWithMetricIdentifier:", v3);

  return v4;
}

@end
