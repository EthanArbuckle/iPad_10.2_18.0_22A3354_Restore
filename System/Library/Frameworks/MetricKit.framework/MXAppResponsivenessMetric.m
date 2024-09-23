@implementation MXAppResponsivenessMetric

- (MXAppResponsivenessMetric)initWithAppResponsivenessData:(id)a3
{
  id v4;
  MXAppResponsivenessMetric *v5;
  MXHistogram *v6;
  MXHistogram *histogrammedApplicationHangTime;
  MXAppResponsivenessMetric *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXAppResponsivenessMetric;
  v5 = -[MXMetric init](&v10, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v6 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v4);
    histogrammedApplicationHangTime = v5->_histogrammedApplicationHangTime;
    v5->_histogrammedApplicationHangTime = v6;

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
  objc_msgSend(a3, "encodeObject:forKey:", self->_histogrammedApplicationHangTime, CFSTR("histogrammedAppHangTime"));
}

- (MXAppResponsivenessMetric)initWithCoder:(id)a3
{
  id v4;
  MXAppResponsivenessMetric *v5;
  uint64_t v6;
  MXHistogram *histogrammedApplicationHangTime;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXAppResponsivenessMetric;
  v5 = -[MXMetric init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogrammedAppHangTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    histogrammedApplicationHangTime = v5->_histogrammedApplicationHangTime;
    v5->_histogrammedApplicationHangTime = (MXHistogram *)v6;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  MXHistogram *histogrammedApplicationHangTime;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  histogrammedApplicationHangTime = self->_histogrammedApplicationHangTime;
  if (histogrammedApplicationHangTime)
  {
    -[MXHistogram toDictionary](histogrammedApplicationHangTime, "toDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("histogrammedAppHangTime"));

  }
  return v3;
}

- (MXHistogram)histogrammedApplicationHangTime
{
  return (MXHistogram *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogrammedApplicationHangTime, 0);
}

@end
