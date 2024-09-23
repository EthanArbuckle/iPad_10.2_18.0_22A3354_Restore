@implementation JETreatmentContext

- (JETreatmentContext)initWithTreatment:(id)a3 metrics:(id)a4
{
  id v7;
  id v8;
  JETreatmentContext *v9;
  JETreatmentContext *v10;
  uint64_t v11;
  NSDictionary *metrics;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)JETreatmentContext;
  v9 = -[JETreatmentContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_treatment, a3);
    v11 = objc_msgSend(v8, "copy");
    metrics = v10->_metrics;
    v10->_metrics = (NSDictionary *)v11;

  }
  return v10;
}

- (uint64_t)metrics
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)setMetrics:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
}

@end
