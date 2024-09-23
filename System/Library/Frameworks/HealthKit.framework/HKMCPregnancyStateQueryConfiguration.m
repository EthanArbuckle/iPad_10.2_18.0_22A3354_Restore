@implementation HKMCPregnancyStateQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMCPregnancyStateQueryConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIsRunningForMaintenance:", -[HKMCPregnancyStateQueryConfiguration isRunningForMaintenance](self, "isRunningForMaintenance"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMCPregnancyStateQueryConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKMCPregnancyStateQueryConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKMCPregnancyStateQueryConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_isRunningForMaintenance = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsRunningForMaintenance"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKMCPregnancyStateQueryConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_isRunningForMaintenance, CFSTR("IsRunningForMaintenance"), v5.receiver, v5.super_class);

}

- (BOOL)isRunningForMaintenance
{
  return self->_isRunningForMaintenance;
}

- (void)setIsRunningForMaintenance:(BOOL)a3
{
  self->_isRunningForMaintenance = a3;
}

@end
