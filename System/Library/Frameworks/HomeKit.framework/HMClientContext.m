@implementation HMClientContext

- (HMClientContext)initWithMetricIdentifier:(id)a3
{
  id v4;
  HMClientContext *v5;
  uint64_t v6;
  NSString *metricIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMClientContext;
  v5 = -[HMClientContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    metricIdentifier = v5->_metricIdentifier;
    v5->_metricIdentifier = (NSString *)v6;

  }
  return v5;
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

- (NSString)metricIdentifier
{
  return self->_metricIdentifier;
}

- (void)setMetricIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_metricIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricIdentifier, 0);
}

@end
