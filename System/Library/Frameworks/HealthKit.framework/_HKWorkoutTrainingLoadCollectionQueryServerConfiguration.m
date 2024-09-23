@implementation _HKWorkoutTrainingLoadCollectionQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKWorkoutTrainingLoadCollectionQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setAnchorDate:", self->_anchorDate);
  objc_msgSend(v4, "setOptions:", self->_options);
  objc_msgSend(v4, "setIntervalComponents:", self->_intervalComponents);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKWorkoutTrainingLoadCollectionQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKWorkoutTrainingLoadCollectionQueryServerConfiguration *v5;
  uint64_t v6;
  NSDate *anchorDate;
  uint64_t v8;
  NSDateComponents *intervalComponents;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HKWorkoutTrainingLoadCollectionQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("anchor"));
    v6 = objc_claimAutoreleasedReturnValue();
    anchorDate = v5->_anchorDate;
    v5->_anchorDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intervals"));
    v8 = objc_claimAutoreleasedReturnValue();
    intervalComponents = v5->_intervalComponents;
    v5->_intervalComponents = (NSDateComponents *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKWorkoutTrainingLoadCollectionQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_options, CFSTR("options"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_anchorDate, CFSTR("anchor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_intervalComponents, CFSTR("intervals"));

}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (void)setAnchorDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDateComponents)intervalComponents
{
  return self->_intervalComponents;
}

- (void)setIntervalComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalComponents, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
}

@end
