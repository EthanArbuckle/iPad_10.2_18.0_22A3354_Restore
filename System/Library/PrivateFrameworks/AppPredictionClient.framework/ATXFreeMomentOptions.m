@implementation ATXFreeMomentOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFreeMomentOptions)initWithDurationHint:(double)a3 matchingOptions:(unint64_t)a4
{
  ATXFreeMomentOptions *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXFreeMomentOptions;
  result = -[ATXFreeMomentOptions init](&v7, sel_init);
  if (result)
  {
    result->_durationHint = a3;
    result->_matchingOptions = a4;
  }
  return result;
}

- (ATXFreeMomentOptions)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("durationHint"));
  v6 = v5;
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("matchingOptions"));

  return -[ATXFreeMomentOptions initWithDurationHint:matchingOptions:](self, "initWithDurationHint:matchingOptions:", v7, v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[ATXFreeMomentOptions durationHint](self, "durationHint");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("durationHint"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXFreeMomentOptions matchingOptions](self, "matchingOptions"), CFSTR("matchingOptions"));

}

- (double)durationHint
{
  return self->_durationHint;
}

- (unint64_t)matchingOptions
{
  return self->_matchingOptions;
}

@end
