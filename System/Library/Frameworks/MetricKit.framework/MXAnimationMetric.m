@implementation MXAnimationMetric

- (MXAnimationMetric)initWithGlitchTimeRatio:(id)a3
{
  id v5;
  MXAnimationMetric *v6;
  double v7;
  MXAnimationMetric *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MXAnimationMetric;
  v6 = -[MXMetric init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "doubleValue");
    if (v7 <= 0.0)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_scrollHitchTimeRatio, a3);
  }
  v8 = v6;
LABEL_6:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_scrollHitchTimeRatio, CFSTR("scrollHitchTimeRatio"));
}

- (MXAnimationMetric)initWithCoder:(id)a3
{
  id v4;
  MXAnimationMetric *v5;
  uint64_t v6;
  NSMeasurement *scrollHitchTimeRatio;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXAnimationMetric;
  v5 = -[MXMetric init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scrollHitchTimeRatio"));
    v6 = objc_claimAutoreleasedReturnValue();
    scrollHitchTimeRatio = v5->_scrollHitchTimeRatio;
    v5->_scrollHitchTimeRatio = (NSMeasurement *)v6;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_scrollHitchTimeRatio)
  {
    -[MXMetric measurementFormatter](self, "measurementFormatter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromMeasurement:", self->_scrollHitchTimeRatio);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("scrollHitchTimeRatio"));

  }
  return v3;
}

- (NSMeasurement)scrollHitchTimeRatio
{
  return (NSMeasurement *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollHitchTimeRatio, 0);
}

@end
