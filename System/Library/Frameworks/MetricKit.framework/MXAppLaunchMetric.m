@implementation MXAppLaunchMetric

- (MXAppLaunchMetric)initWithLaunchTimeData:(id)a3 withResumeTimeData:(id)a4
{
  id v6;
  id v7;
  MXAppLaunchMetric *v8;
  MXAppLaunchMetric *v9;
  MXHistogram *v10;
  MXHistogram *histogrammedTimeToFirstDraw;
  MXHistogram *v12;
  MXHistogram *histogrammedApplicationResumeTime;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MXAppLaunchMetric;
  v8 = -[MXMetric init](&v15, sel_init);
  if (!v8)
    goto LABEL_5;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v6);
    histogrammedTimeToFirstDraw = v8->_histogrammedTimeToFirstDraw;
    v8->_histogrammedTimeToFirstDraw = v10;

    v12 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v7);
    histogrammedApplicationResumeTime = v8->_histogrammedApplicationResumeTime;
    v8->_histogrammedApplicationResumeTime = v12;

LABEL_5:
    v9 = v8;
  }

  return v9;
}

- (MXAppLaunchMetric)initWithLaunchTimeData:(id)a3 withResumeTimeData:(id)a4 withActivationTimeData:(id)a5
{
  id v8;
  id v9;
  id v10;
  MXAppLaunchMetric *v11;
  MXAppLaunchMetric *v12;
  MXHistogram *v13;
  MXHistogram *histogrammedTimeToFirstDraw;
  MXHistogram *v15;
  MXHistogram *histogrammedApplicationResumeTime;
  MXHistogram *v17;
  MXHistogram *histogrammedOptimizedTimeToFirstDraw;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MXAppLaunchMetric;
  v11 = -[MXMetric init](&v20, sel_init);
  if (!v11)
    goto LABEL_6;
  v12 = 0;
  if (v8 && v9 && v10)
  {
    v13 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v8);
    histogrammedTimeToFirstDraw = v11->_histogrammedTimeToFirstDraw;
    v11->_histogrammedTimeToFirstDraw = v13;

    v15 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v9);
    histogrammedApplicationResumeTime = v11->_histogrammedApplicationResumeTime;
    v11->_histogrammedApplicationResumeTime = v15;

    v17 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v10);
    histogrammedOptimizedTimeToFirstDraw = v11->_histogrammedOptimizedTimeToFirstDraw;
    v11->_histogrammedOptimizedTimeToFirstDraw = v17;

LABEL_6:
    v12 = v11;
  }

  return v12;
}

- (MXAppLaunchMetric)initWithLaunchTimeData:(id)a3 withResumeTimeData:(id)a4 withActivationTimeData:(id)a5 withExtendedLaunchTimeData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MXAppLaunchMetric *v14;
  MXAppLaunchMetric *v15;
  MXHistogram *v16;
  MXHistogram *histogrammedTimeToFirstDraw;
  MXHistogram *v18;
  MXHistogram *histogrammedApplicationResumeTime;
  MXHistogram *v20;
  MXHistogram *histogrammedOptimizedTimeToFirstDraw;
  MXHistogram *v22;
  MXHistogram *histogrammedExtendedLaunch;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)MXAppLaunchMetric;
  v14 = -[MXMetric init](&v25, sel_init);
  if (!v14)
    goto LABEL_7;
  v15 = 0;
  if (v10 && v11 && v12 && v13)
  {
    v16 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v10);
    histogrammedTimeToFirstDraw = v14->_histogrammedTimeToFirstDraw;
    v14->_histogrammedTimeToFirstDraw = v16;

    v18 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v11);
    histogrammedApplicationResumeTime = v14->_histogrammedApplicationResumeTime;
    v14->_histogrammedApplicationResumeTime = v18;

    v20 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v12);
    histogrammedOptimizedTimeToFirstDraw = v14->_histogrammedOptimizedTimeToFirstDraw;
    v14->_histogrammedOptimizedTimeToFirstDraw = v20;

    v22 = -[MXHistogram initWithHistogramBucketData:]([MXHistogram alloc], "initWithHistogramBucketData:", v13);
    histogrammedExtendedLaunch = v14->_histogrammedExtendedLaunch;
    v14->_histogrammedExtendedLaunch = v22;

LABEL_7:
    v15 = v14;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  MXHistogram *histogrammedTimeToFirstDraw;
  id v5;

  histogrammedTimeToFirstDraw = self->_histogrammedTimeToFirstDraw;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", histogrammedTimeToFirstDraw, CFSTR("histogrammedTimeToFirstDrawKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_histogrammedApplicationResumeTime, CFSTR("histogrammedResumeTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_histogrammedOptimizedTimeToFirstDraw, CFSTR("histogrammedOptimizedTimeToFirstDrawKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_histogrammedExtendedLaunch, CFSTR("histogrammedExtendedLaunch"));

}

- (MXAppLaunchMetric)initWithCoder:(id)a3
{
  id v4;
  MXAppLaunchMetric *v5;
  uint64_t v6;
  MXHistogram *histogrammedTimeToFirstDraw;
  uint64_t v8;
  MXHistogram *histogrammedApplicationResumeTime;
  uint64_t v10;
  MXHistogram *histogrammedOptimizedTimeToFirstDraw;
  uint64_t v12;
  MXHistogram *histogrammedExtendedLaunch;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MXAppLaunchMetric;
  v5 = -[MXMetric init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogrammedTimeToFirstDrawKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    histogrammedTimeToFirstDraw = v5->_histogrammedTimeToFirstDraw;
    v5->_histogrammedTimeToFirstDraw = (MXHistogram *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogrammedResumeTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    histogrammedApplicationResumeTime = v5->_histogrammedApplicationResumeTime;
    v5->_histogrammedApplicationResumeTime = (MXHistogram *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogrammedOptimizedTimeToFirstDrawKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    histogrammedOptimizedTimeToFirstDraw = v5->_histogrammedOptimizedTimeToFirstDraw;
    v5->_histogrammedOptimizedTimeToFirstDraw = (MXHistogram *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogrammedExtendedLaunch"));
    v12 = objc_claimAutoreleasedReturnValue();
    histogrammedExtendedLaunch = v5->_histogrammedExtendedLaunch;
    v5->_histogrammedExtendedLaunch = (MXHistogram *)v12;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  MXHistogram *histogrammedTimeToFirstDraw;
  void *v5;
  MXHistogram *histogrammedApplicationResumeTime;
  void *v7;
  MXHistogram *histogrammedOptimizedTimeToFirstDraw;
  void *v9;
  MXHistogram *histogrammedExtendedLaunch;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  histogrammedTimeToFirstDraw = self->_histogrammedTimeToFirstDraw;
  if (histogrammedTimeToFirstDraw)
  {
    -[MXHistogram toDictionary](histogrammedTimeToFirstDraw, "toDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("histogrammedTimeToFirstDrawKey"));

  }
  histogrammedApplicationResumeTime = self->_histogrammedApplicationResumeTime;
  if (histogrammedApplicationResumeTime)
  {
    -[MXHistogram toDictionary](histogrammedApplicationResumeTime, "toDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("histogrammedResumeTime"));

  }
  histogrammedOptimizedTimeToFirstDraw = self->_histogrammedOptimizedTimeToFirstDraw;
  if (histogrammedOptimizedTimeToFirstDraw)
  {
    -[MXHistogram toDictionary](histogrammedOptimizedTimeToFirstDraw, "toDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("histogrammedOptimizedTimeToFirstDrawKey"));

  }
  histogrammedExtendedLaunch = self->_histogrammedExtendedLaunch;
  if (histogrammedExtendedLaunch)
  {
    -[MXHistogram toDictionary](histogrammedExtendedLaunch, "toDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("histogrammedExtendedLaunch"));

  }
  return v3;
}

- (MXHistogram)histogrammedTimeToFirstDraw
{
  return (MXHistogram *)objc_getProperty(self, a2, 16, 1);
}

- (MXHistogram)histogrammedApplicationResumeTime
{
  return (MXHistogram *)objc_getProperty(self, a2, 24, 1);
}

- (MXHistogram)histogrammedOptimizedTimeToFirstDraw
{
  return (MXHistogram *)objc_getProperty(self, a2, 32, 1);
}

- (MXHistogram)histogrammedExtendedLaunch
{
  return (MXHistogram *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogrammedExtendedLaunch, 0);
  objc_storeStrong((id *)&self->_histogrammedOptimizedTimeToFirstDraw, 0);
  objc_storeStrong((id *)&self->_histogrammedApplicationResumeTime, 0);
  objc_storeStrong((id *)&self->_histogrammedTimeToFirstDraw, 0);
}

@end
