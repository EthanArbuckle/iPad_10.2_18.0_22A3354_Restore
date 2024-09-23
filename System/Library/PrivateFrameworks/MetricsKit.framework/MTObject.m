@implementation MTObject

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_metricsKit);
}

- (MTMetricsKitTemplate)metricsKit
{
  return (MTMetricsKitTemplate *)objc_loadWeakRetained((id *)&self->_metricsKit);
}

- (MTObject)initWithMetricsKit:(id)a3
{
  id v4;
  MTObject *v5;
  MTObject *v6;

  v4 = a3;
  v5 = -[MTObject init](self, "init");
  v6 = v5;
  if (v5)
    -[MTObject setMetricsKit:](v5, "setMetricsKit:", v4);

  return v6;
}

- (void)setMetricsKit:(id)a3
{
  objc_storeWeak((id *)&self->_metricsKit, a3);
}

@end
