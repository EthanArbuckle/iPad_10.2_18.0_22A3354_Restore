@implementation DNDSMutableModeConfigurationTriggersRecord

- (void)setTriggers:(id)a3
{
  NSArray *v4;
  NSArray *triggers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  triggers = self->super._triggers;
  self->super._triggers = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  DNDSModeConfigurationTriggersRecord *v4;
  void *v5;
  DNDSModeConfigurationTriggersRecord *v6;

  v4 = +[DNDSModeConfigurationTriggersRecord allocWithZone:](DNDSModeConfigurationTriggersRecord, "allocWithZone:", a3);
  -[DNDSModeConfigurationTriggersRecord triggers](self, "triggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DNDSModeConfigurationTriggersRecord initWithTriggers:](v4, "initWithTriggers:", v5);

  return v6;
}

@end
