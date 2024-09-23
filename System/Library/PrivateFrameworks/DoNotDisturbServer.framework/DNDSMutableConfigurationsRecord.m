@implementation DNDSMutableConfigurationsRecord

- (void)setModeConfigurations:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *modeConfigurations;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "copy");
  modeConfigurations = self->super._modeConfigurations;
  self->super._modeConfigurations = v4;

}

- (void)setConfiguration:(id)a3 forModeIdentifier:(id)a4
{
  NSMutableDictionary *modeConfigurations;
  id v6;
  id v7;

  modeConfigurations = self->super._modeConfigurations;
  v6 = a4;
  objc_msgSend(a3, "makeRecord");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](modeConfigurations, "setObject:forKey:", v7, v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSConfigurationsRecord _initWithRecord:]([DNDSConfigurationsRecord alloc], "_initWithRecord:", self);
}

@end
