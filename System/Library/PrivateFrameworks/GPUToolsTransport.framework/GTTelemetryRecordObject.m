@implementation GTTelemetryRecordObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryRecordObject)initWithCoder:(id)a3
{
  id v4;
  GTTelemetryRecordObject *v5;
  float v6;
  float v7;
  float v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTTelemetryRecordObject;
  v5 = -[GTTelemetryRecordObject init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("min"));
    v5->_min = v6;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("max"));
    v5->_max = v7;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("average"));
    v5->_average = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float min;
  double v5;
  double v6;
  double v7;
  id v8;

  min = self->_min;
  v8 = a3;
  *(float *)&v5 = min;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("min"), v5);
  *(float *)&v6 = self->_max;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("max"), v6);
  *(float *)&v7 = self->_average;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("average"), v7);

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GTTelemetryRecordObject;
  -[GTTelemetryRecordObject description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (float)min
{
  return self->_min;
}

- (void)setMin:(float)a3
{
  self->_min = a3;
}

- (float)max
{
  return self->_max;
}

- (void)setMax:(float)a3
{
  self->_max = a3;
}

- (float)average
{
  return self->_average;
}

- (void)setAverage:(float)a3
{
  self->_average = a3;
}

@end
