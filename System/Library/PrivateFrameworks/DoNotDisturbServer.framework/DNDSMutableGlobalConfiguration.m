@implementation DNDSMutableGlobalConfiguration

- (void)setPreventAutoReply:(unint64_t)a3
{
  self->super._preventAutoReply = a3;
  self->super._automaticallyGenerated = 0;
}

- (void)setBypassSettings:(id)a3
{
  DNDBypassSettings *v4;
  DNDBypassSettings *bypassSettings;

  v4 = (DNDBypassSettings *)objc_msgSend(a3, "copy");
  bypassSettings = self->super._bypassSettings;
  self->super._bypassSettings = v4;

  self->super._automaticallyGenerated = 0;
}

- (void)setModesCanImpactAvailability:(unint64_t)a3
{
  self->super._modesCanImpactAvailability = a3;
  self->super._automaticallyGenerated = 0;
}

- (void)setLastModified:(id)a3
{
  NSDate *v4;
  NSDate *lastModified;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  lastModified = self->super._lastModified;
  self->super._lastModified = v4;

}

- (void)setAutomaticallyGenerated:(BOOL)a3
{
  self->super._automaticallyGenerated = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSGlobalConfiguration _initWithConfiguration:](+[DNDSGlobalConfiguration allocWithZone:](DNDSGlobalConfiguration, "allocWithZone:", a3), "_initWithConfiguration:", self);
}

@end
