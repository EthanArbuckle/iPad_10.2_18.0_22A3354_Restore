@implementation GTTelemetryConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryConfiguration)init
{
  GTTelemetryConfiguration *v2;
  GTTelemetryConfiguration *v3;
  GTTelemetryConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryConfiguration;
  v2 = -[GTTelemetryConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_reportFrequencyInSeconds = INFINITY;
    v4 = v2;
  }

  return v3;
}

- (GTTelemetryConfiguration)initWithCoder:(id)a3
{
  id v4;
  GTTelemetryConfiguration *v5;
  float v6;
  GTTelemetryConfiguration *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTTelemetryConfiguration;
  v5 = -[GTTelemetryConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("reportFrequencyInSeconds"));
    v5->_reportFrequencyInSeconds = v6;
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v3;

  *(float *)&v3 = self->_reportFrequencyInSeconds;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("reportFrequencyInSeconds"), v3);
}

- (float)reportFrequencyInSeconds
{
  return self->_reportFrequencyInSeconds;
}

- (void)setReportFrequencyInSeconds:(float)a3
{
  self->_reportFrequencyInSeconds = a3;
}

@end
