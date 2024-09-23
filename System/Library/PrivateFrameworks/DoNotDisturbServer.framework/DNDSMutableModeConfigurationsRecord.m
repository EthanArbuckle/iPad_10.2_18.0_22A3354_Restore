@implementation DNDSMutableModeConfigurationsRecord

- (void)setModeConfiguration:(id)a3 forModeIdentifier:(id)a4
{
  if (a4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._modeConfigurationsByModeIdentifier, "setObject:forKeyedSubscript:", a3);
}

- (void)setMode:(id)a3 forModeIdentifier:(id)a4
{
  NSMutableDictionary *modeConfigurationsByModeIdentifier;
  id v7;
  void *v8;
  DNDSMutableModeConfigurationRecord *v9;
  id v10;

  v10 = a3;
  modeConfigurationsByModeIdentifier = self->super._modeConfigurationsByModeIdentifier;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](modeConfigurationsByModeIdentifier, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (DNDSMutableModeConfigurationRecord *)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(DNDSMutableModeConfigurationRecord);
  -[DNDSMutableModeConfigurationRecord setMode:](v9, "setMode:", v10);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._modeConfigurationsByModeIdentifier, "setObject:forKeyedSubscript:", v9, v7);

}

- (void)setConfiguration:(id)a3 forModeIdentifier:(id)a4
{
  NSMutableDictionary *modeConfigurationsByModeIdentifier;
  id v7;
  id v8;
  void *v9;
  id v10;

  modeConfigurationsByModeIdentifier = self->super._modeConfigurationsByModeIdentifier;
  v7 = a4;
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](modeConfigurationsByModeIdentifier, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setConfiguration:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._modeConfigurationsByModeIdentifier, "setObject:forKeyedSubscript:", v10, v7);

}

- (void)setTriggers:(id)a3 forModeIdentifier:(id)a4
{
  NSMutableDictionary *modeConfigurationsByModeIdentifier;
  id v7;
  id v8;
  void *v9;
  id v10;

  modeConfigurationsByModeIdentifier = self->super._modeConfigurationsByModeIdentifier;
  v7 = a4;
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](modeConfigurationsByModeIdentifier, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setTriggers:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._modeConfigurationsByModeIdentifier, "setObject:forKeyedSubscript:", v10, v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  DNDSModeConfigurationsRecord *v4;
  void *v5;
  id v6;

  v4 = +[DNDSModeConfigurationsRecord allocWithZone:](DNDSModeConfigurationsRecord, "allocWithZone:", a3);
  -[NSMutableDictionary allValues](self->super._modeConfigurationsByModeIdentifier, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DNDSModeConfigurationsRecord _initWithModeConfigurations:](v4, "_initWithModeConfigurations:", v5);

  return v6;
}

@end
