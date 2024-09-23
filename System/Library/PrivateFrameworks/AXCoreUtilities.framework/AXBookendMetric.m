@implementation AXBookendMetric

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)startMeasurement
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXBookendMetric;
  -[AXMetric _startMeasurement](&v2, sel__startMeasurement);
}

- (void)endMeasurement
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXBookendMetric;
  -[AXMetric _endMeasurement](&v2, sel__endMeasurement);
}

@end
