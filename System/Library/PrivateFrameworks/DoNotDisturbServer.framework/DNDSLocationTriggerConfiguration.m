@implementation DNDSLocationTriggerConfiguration

+ (id)emptyConfiguration
{
  return objc_alloc_init(DNDSLocationTriggerConfiguration);
}

- (DNDSLocationTriggerConfiguration)init
{
  DNDSLocationTriggerConfiguration *v2;
  uint64_t v3;
  NSMutableDictionary *modeIdentifierByRegionIdentifier;
  uint64_t v5;
  NSMutableDictionary *regionByRegionIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DNDSLocationTriggerConfiguration;
  v2 = -[DNDSLocationTriggerConfiguration init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    modeIdentifierByRegionIdentifier = v2->_modeIdentifierByRegionIdentifier;
    v2->_modeIdentifierByRegionIdentifier = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    regionByRegionIdentifier = v2->_regionByRegionIdentifier;
    v2->_regionByRegionIdentifier = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)regions
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allValues](self->_regionByRegionIdentifier, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)regionIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMutableDictionary allKeys](self->_regionByRegionIdentifier, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)regionForRegionIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_regionByRegionIdentifier, "objectForKeyedSubscript:", a3);
}

- (id)modeIdentifierForRegion:(id)a3
{
  NSMutableDictionary *modeIdentifierByRegionIdentifier;
  void *v4;
  void *v5;

  modeIdentifierByRegionIdentifier = self->_modeIdentifierByRegionIdentifier;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](modeIdentifierByRegionIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addTriggerForModeWithIdentifier:(id)a3 forRegion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_modeIdentifierByRegionIdentifier, "setObject:forKeyedSubscript:", v7, v8);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_regionByRegionIdentifier, "setObject:forKeyedSubscript:", v6, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionByRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_modeIdentifierByRegionIdentifier, 0);
}

@end
