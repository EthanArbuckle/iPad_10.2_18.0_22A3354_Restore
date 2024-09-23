@implementation GEOArrivalTimeInfo

- (GEOArrivalTimeInfo)initWithLegIndex:(unint64_t)a3 remainingTime:(double)a4
{
  GEOArrivalTimeInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOArrivalTimeInfo;
  result = -[GEOArrivalTimeInfo init](&v7, sel_init);
  if (result)
  {
    result->_legIndex = a3;
    result->_remainingTime = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOArrivalTimeInfo)initWithCoder:(id)a3
{
  id v4;
  GEOArrivalTimeInfo *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOArrivalTimeInfo;
  v5 = -[GEOArrivalTimeInfo init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_remainingTime"));
    v5->_remainingTime = v6;
    v5->_legIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_legIndex"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double remainingTime;
  id v5;

  remainingTime = self->_remainingTime;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_remainingTime"), remainingTime);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_legIndex, CFSTR("_legIndex"));

}

- (double)remainingTime
{
  return self->_remainingTime;
}

- (void)setRemainingTime:(double)a3
{
  self->_remainingTime = a3;
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (void)setLegIndex:(unint64_t)a3
{
  self->_legIndex = a3;
}

@end
