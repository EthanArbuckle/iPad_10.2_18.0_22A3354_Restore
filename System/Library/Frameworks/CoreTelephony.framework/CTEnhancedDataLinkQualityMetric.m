@implementation CTEnhancedDataLinkQualityMetric

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  const char *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTEnhancedLinkQualityMetric enhancedLinkQuality](self, "enhancedLinkQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", enhancedLinkQuality=%@"), v4);

  v5 = -[CTEnhancedDataLinkQualityMetric metricType](self, "metricType");
  if ((unint64_t)(v5 - 1) > 8)
    v6 = "CTEnhancedLQMIndicationTypeUnknown";
  else
    v6 = off_1E152FF68[v5 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR(", metricType=%s"), v6);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CTEnhancedDataLinkQualityMetric;
  v4 = a3;
  -[CTEnhancedLinkQualityMetric encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTEnhancedDataLinkQualityMetric metricType](self, "metricType", v5.receiver, v5.super_class), CFSTR("metric_type"));

}

- (int64_t)metricType
{
  return self->_metricType;
}

- (CTEnhancedDataLinkQualityMetric)initWithCoder:(id)a3
{
  id v4;
  CTEnhancedDataLinkQualityMetric *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTEnhancedDataLinkQualityMetric;
  v5 = -[CTEnhancedLinkQualityMetric initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_metricType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("metric_type"));

  return v5;
}

- (CTEnhancedDataLinkQualityMetric)initWithType:(int64_t)a3 enhancedLinkQuality:(id)a4
{
  CTEnhancedDataLinkQualityMetric *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTEnhancedDataLinkQualityMetric;
  result = -[CTEnhancedLinkQualityMetric initWithEnhancedLinkQuality:](&v6, sel_initWithEnhancedLinkQuality_, a4);
  if (result)
    result->_metricType = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTEnhancedDataLinkQualityMetric;
  v4 = -[CTEnhancedLinkQualityMetric copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setMetricType:", -[CTEnhancedDataLinkQualityMetric metricType](self, "metricType"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setMetricType:(int64_t)a3
{
  self->_metricType = a3;
}

@end
