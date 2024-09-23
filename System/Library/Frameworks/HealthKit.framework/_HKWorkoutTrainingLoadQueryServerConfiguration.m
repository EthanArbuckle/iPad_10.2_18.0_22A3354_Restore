@implementation _HKWorkoutTrainingLoadQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKWorkoutTrainingLoadQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setOptions:", self->_options);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutTrainingLoadQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKWorkoutTrainingLoadQueryServerConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HKWorkoutTrainingLoadQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKWorkoutTrainingLoadQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"), v5.receiver, v5.super_class);

}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

@end
