@implementation AVHapticPlayerParameterCurveControlPoint

- (AVHapticPlayerParameterCurveControlPoint)initWithTime:(double)a3 value:(float)a4
{
  AVHapticPlayerParameterCurveControlPoint *v6;
  AVHapticPlayerParameterCurveControlPoint *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVHapticPlayerParameterCurveControlPoint;
  v6 = -[AVHapticPlayerParameterCurveControlPoint init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[AVHapticPlayerParameterCurveControlPoint setTime:](v6, "setTime:", a3);
    *(float *)&v8 = a4;
    -[AVHapticPlayerParameterCurveControlPoint setValue:](v7, "setValue:", v8);
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("time"), self->_time);
  *(float *)&v4 = self->_value;
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("value"), v4);

}

- (AVHapticPlayerParameterCurveControlPoint)initWithCoder:(id)a3
{
  id v4;
  double v5;
  float v6;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("time"));
  self->_time = v5;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("value"));
  self->_value = v6;

  return self;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
