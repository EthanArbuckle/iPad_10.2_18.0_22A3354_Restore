@implementation HKRollingBaselineConfiguration

- (HKRollingBaselineConfiguration)initWithMinimumSampleCount:(int64_t)a3 maximumSampleCount:(int64_t)a4 maximumWindowDuration:(double)a5 options:(int64_t)a6
{
  HKRollingBaselineConfiguration *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKRollingBaselineConfiguration;
  result = -[HKRollingBaselineConfiguration init](&v11, sel_init);
  if (result)
  {
    result->_minimumSampleCount = a3;
    result->_maximumSampleCount = a4;
    result->_maximumWindowDuration = a5;
    result->_options = a6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  HKRollingBaselineConfiguration *v4;
  HKRollingBaselineConfiguration *v5;
  BOOL v6;

  v4 = (HKRollingBaselineConfiguration *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_minimumSampleCount == v5->_minimumSampleCount
        && self->_maximumSampleCount == v5->_maximumSampleCount
        && self->_maximumWindowDuration == v5->_maximumWindowDuration
        && self->_options == v5->_options;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = self->_maximumSampleCount ^ self->_minimumSampleCount;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maximumWindowDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ self->_options ^ objc_msgSend(v4, "hash");

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t minimumSampleCount;
  id v5;

  minimumSampleCount = self->_minimumSampleCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", minimumSampleCount, CFSTR("minimumSampleCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maximumSampleCount, CFSTR("maximumSampleCount"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maximumWindowDuration"), self->_maximumWindowDuration);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("options"));

}

- (HKRollingBaselineConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKRollingBaselineConfiguration *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKRollingBaselineConfiguration;
  v5 = -[HKRollingBaselineConfiguration init](&v8, sel_init);
  if (v5)
  {
    v5->_minimumSampleCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minimumSampleCount"));
    v5->_maximumSampleCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumSampleCount"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maximumWindowDuration"));
    v5->_maximumWindowDuration = v6;
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
  }

  return v5;
}

- (int64_t)minimumSampleCount
{
  return self->_minimumSampleCount;
}

- (int64_t)maximumSampleCount
{
  return self->_maximumSampleCount;
}

- (double)maximumWindowDuration
{
  return self->_maximumWindowDuration;
}

- (int64_t)options
{
  return self->_options;
}

@end
