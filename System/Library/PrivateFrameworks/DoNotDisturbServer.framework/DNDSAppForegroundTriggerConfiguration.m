@implementation DNDSAppForegroundTriggerConfiguration

- (DNDSAppForegroundTriggerConfiguration)init
{
  DNDSAppForegroundTriggerConfiguration *v2;
  DNDSAppForegroundTriggerConfiguration *v3;
  NSDictionary *bundleIDToModeIdentifierTriggers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DNDSAppForegroundTriggerConfiguration;
  v2 = -[DNDSAppForegroundTriggerConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    bundleIDToModeIdentifierTriggers = v2->_bundleIDToModeIdentifierTriggers;
    v2->_bundleIDToModeIdentifierTriggers = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v3;
}

- (id)triggeringBundleIdentifiers
{
  return -[NSDictionary allKeys](self->_bundleIDToModeIdentifierTriggers, "allKeys");
}

- (id)modeIdentifierForBundleIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_bundleIDToModeIdentifierTriggers, "objectForKeyedSubscript:", a3);
}

- (void)addTriggerForModeWithIdentifier:(id)a3 onForegroundOfApp:(id)a4
{
  NSDictionary *bundleIDToModeIdentifierTriggers;
  id v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *v10;
  id v11;

  bundleIDToModeIdentifierTriggers = self->_bundleIDToModeIdentifierTriggers;
  v7 = a4;
  v8 = a3;
  v11 = (id)-[NSDictionary mutableCopy](bundleIDToModeIdentifierTriggers, "mutableCopy");
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v7);

  v9 = (NSDictionary *)objc_msgSend(v11, "copy");
  v10 = self->_bundleIDToModeIdentifierTriggers;
  self->_bundleIDToModeIdentifierTriggers = v9;

}

- (id)description
{
  return -[NSDictionary description](self->_bundleIDToModeIdentifierTriggers, "description");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDToModeIdentifierTriggers, 0);
}

@end
