@implementation RTEstimatedLocationOptions

- (RTEstimatedLocationOptions)init
{
  return -[RTEstimatedLocationOptions initWithAverageSpeed:enableFallbackModel:timeInterval:](self, "initWithAverageSpeed:enableFallbackModel:timeInterval:", 0, -1.0, -1.0);
}

- (RTEstimatedLocationOptions)initWithAverageSpeed:(double)a3 enableFallbackModel:(BOOL)a4 timeInterval:(double)a5
{
  RTEstimatedLocationOptions *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RTEstimatedLocationOptions;
  result = -[RTEstimatedLocationOptions init](&v9, sel_init);
  if (result)
  {
    result->_enableFallbackModel = a4;
    result->_averageSpeed = a3;
    result->_timeInterval = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTEstimatedLocationOptions)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("averageSpeed"));
  v6 = v5;
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableFallbackModel"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeInterval"));
  v9 = v8;

  return -[RTEstimatedLocationOptions initWithAverageSpeed:enableFallbackModel:timeInterval:](self, "initWithAverageSpeed:enableFallbackModel:timeInterval:", v7, v6, v9);
}

- (void)encodeWithCoder:(id)a3
{
  double averageSpeed;
  id v5;

  averageSpeed = self->_averageSpeed;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("averageSpeed"), averageSpeed);
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableFallbackModel, CFSTR("enableFallbackModel"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeInterval"), self->_timeInterval);

}

- (double)averageSpeed
{
  return self->_averageSpeed;
}

- (BOOL)enableFallbackModel
{
  return self->_enableFallbackModel;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

@end
