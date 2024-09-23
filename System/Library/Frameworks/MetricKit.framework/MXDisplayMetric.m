@implementation MXDisplayMetric

- (MXDisplayMetric)initWithAveragePictureLevel:(id)a3
{
  id v5;
  MXDisplayMetric *v6;
  void *v7;
  double v8;
  double v9;
  MXDisplayMetric *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXDisplayMetric;
  v6 = -[MXMetric init](&v12, sel_init);
  if (!v6)
    goto LABEL_5;
  objc_msgSend(v5, "averageMeasurement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (v9 >= 0.0)
  {
    objc_storeStrong((id *)&v6->_averagePixelLuminance, a3);
LABEL_5:
    v10 = v6;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_averagePixelLuminance, CFSTR("averagePixelLuminance"));
}

- (MXDisplayMetric)initWithCoder:(id)a3
{
  id v4;
  MXDisplayMetric *v5;
  uint64_t v6;
  MXAverage *averagePixelLuminance;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXDisplayMetric;
  v5 = -[MXMetric init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("averagePixelLuminance"));
    v6 = objc_claimAutoreleasedReturnValue();
    averagePixelLuminance = v5->_averagePixelLuminance;
    v5->_averagePixelLuminance = (MXAverage *)v6;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  MXAverage *averagePixelLuminance;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  averagePixelLuminance = self->_averagePixelLuminance;
  if (averagePixelLuminance)
  {
    -[MXAverage toDictionary](averagePixelLuminance, "toDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("averagePixelLuminance"));

  }
  return v3;
}

- (MXAverage)averagePixelLuminance
{
  return (MXAverage *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averagePixelLuminance, 0);
}

@end
