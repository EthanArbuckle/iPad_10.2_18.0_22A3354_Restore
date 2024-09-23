@implementation DNDSMutableConfigurationRecord

- (void)setApplicationConfigurationType:(id)a3
{
  NSNumber *v4;
  NSNumber *applicationConfigurationType;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  applicationConfigurationType = self->super._applicationConfigurationType;
  self->super._applicationConfigurationType = v4;

}

- (void)setSenderConfigurationType:(id)a3
{
  NSNumber *v4;
  NSNumber *senderConfigurationType;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  senderConfigurationType = self->super._senderConfigurationType;
  self->super._senderConfigurationType = v4;

}

- (void)setSuppressionType:(id)a3
{
  NSNumber *v4;
  NSNumber *suppressionType;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  suppressionType = self->super._suppressionType;
  self->super._suppressionType = v4;

}

- (void)setSuppressionMode:(id)a3
{
  NSNumber *v4;
  NSNumber *suppressionMode;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  suppressionMode = self->super._suppressionMode;
  self->super._suppressionMode = v4;

}

- (void)setMinimumBreakthroughUrgency:(id)a3
{
  NSNumber *v4;
  NSNumber *minimumBreakthroughUrgency;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  minimumBreakthroughUrgency = self->super._minimumBreakthroughUrgency;
  self->super._minimumBreakthroughUrgency = v4;

}

- (void)setHideApplicationBadges:(id)a3
{
  NSNumber *v4;
  NSNumber *hideApplicationBadges;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  hideApplicationBadges = self->super._hideApplicationBadges;
  self->super._hideApplicationBadges = v4;

}

- (void)setAllowIntelligentManagement:(id)a3
{
  NSNumber *v4;
  NSNumber *allowIntelligentManagement;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  allowIntelligentManagement = self->super._allowIntelligentManagement;
  self->super._allowIntelligentManagement = v4;

}

- (void)setCompatibilityVersion:(id)a3
{
  NSNumber *v4;
  NSNumber *compatibilityVersion;

  v4 = (NSNumber *)objc_msgSend(a3, "copy");
  compatibilityVersion = self->super._compatibilityVersion;
  self->super._compatibilityVersion = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSConfigurationRecord _initWithRecord:]([DNDSConfigurationRecord alloc], "_initWithRecord:", self);
}

@end
