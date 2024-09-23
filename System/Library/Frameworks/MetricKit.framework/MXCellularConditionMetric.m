@implementation MXCellularConditionMetric

- (MXCellularConditionMetric)initWithCellularConditionTime:(id)a3
{
  id v4;
  MXCellularConditionMetric *v5;
  MXHistogram *v6;
  MXHistogram *histogrammedCellularConditionTime;
  MXCellularConditionMetric *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXCellularConditionMetric;
  v5 = -[MXMetric init](&v10, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v6 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v4);
    histogrammedCellularConditionTime = v5->_histogrammedCellularConditionTime;
    v5->_histogrammedCellularConditionTime = v6;

  }
  v8 = v5;
LABEL_6:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_histogrammedCellularConditionTime, CFSTR("cellConditionTime"));
}

- (MXCellularConditionMetric)initWithCoder:(id)a3
{
  id v4;
  MXCellularConditionMetric *v5;
  uint64_t v6;
  MXHistogram *histogrammedCellularConditionTime;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXCellularConditionMetric;
  v5 = -[MXMetric init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cellConditionTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    histogrammedCellularConditionTime = v5->_histogrammedCellularConditionTime;
    v5->_histogrammedCellularConditionTime = (MXHistogram *)v6;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  MXHistogram *histogrammedCellularConditionTime;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  histogrammedCellularConditionTime = self->_histogrammedCellularConditionTime;
  if (histogrammedCellularConditionTime)
  {
    -[MXHistogram toDictionary](histogrammedCellularConditionTime, "toDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cellConditionTime"));

  }
  return v3;
}

- (MXHistogram)histogrammedCellularConditionTime
{
  return (MXHistogram *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogrammedCellularConditionTime, 0);
}

@end
