@implementation MTTimerTimeInterval

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTTimerTimeInterval)initWithCoder:(id)a3
{
  id v4;
  MTTimerTimeInterval *v5;
  double v6;

  v4 = a3;
  v5 = -[MTTimerTimeInterval initWithTimeInterval:](self, "initWithTimeInterval:", 0.0);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("MTTimerTimeInterval"));
    v5->_remainingTime = v6;
  }

  return v5;
}

- (MTTimerTimeInterval)initWithTimeInterval:(double)a3
{
  MTTimerTimeInterval *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTTimerTimeInterval;
  result = -[MTTimerTimeInterval init](&v5, sel_init);
  if (result)
    result->_remainingTime = a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[MTTimerTimeInterval remainingTime](self, "remainingTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("MTTimerTimeInterval"));

}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE3E7BF8))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
    v7 = -[MTTimerTimeInterval isEqualToTime:](self, "isEqualToTime:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isEqualToTime:(id)a3
{
  return MTCompareTimerTimes(self, a3) == 0;
}

- (int64_t)compare:(id)a3
{
  return MTCompareTimerTimes(self, a3);
}

@end
