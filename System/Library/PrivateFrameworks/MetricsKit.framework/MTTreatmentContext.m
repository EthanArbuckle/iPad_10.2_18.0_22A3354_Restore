@implementation MTTreatmentContext

- (MTTreatmentContext)initWithTreatment:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  MTTreatmentContext *v8;
  MTTreatmentContext *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTTreatmentContext;
  v8 = -[MTTreatmentContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[MTTreatmentContext setTreatment:](v8, "setTreatment:", v6);
    -[MTTreatmentContext setMetrics:](v9, "setMetrics:", v7);
  }

  return v9;
}

- (MTTreatment)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_treatment, a3);
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
}

@end
