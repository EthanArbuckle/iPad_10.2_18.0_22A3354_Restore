@implementation MGZone

- (MGZone)initWithClientService:(id)a3 zone:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MGZone *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  MGGroupIdentifierForZoneInHome(v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MGMemberIdentifiersForZoneInHome(v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[MGGroup initWithClientService:type:identifier:name:properties:memberIdentifiers:](self, "initWithClientService:type:identifier:name:properties:memberIdentifiers:", v10, v12, v11, v13, 0, v14);
  return v15;
}

- (MGZone)initWithConnectionProvider:(id)a3 zone:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MGZone *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "clientServiceWithConnectionProvider:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MGZone initWithClientService:zone:home:](self, "initWithClientService:zone:home:", v11, v9, v8);
  return v12;
}

+ (id)type
{
  return CFSTR("com.apple.media-group.zone");
}

- (id)HomeKitZoneIdentifier
{
  void *v2;
  void *v3;

  -[MGGroup identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MGZoneIdentifierForGroupIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)HomeKitZoneWithHomeManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MGGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MGZoneFromHomeManagerForGroupIdentifier(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(a1, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("SELF.type = %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateForCurrentDevice
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("($CURRENT_ZONE != nil) && (SELF.identifier == $CURRENT_ZONE.identifier)"));
}

@end
