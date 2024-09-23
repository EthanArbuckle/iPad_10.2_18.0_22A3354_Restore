@implementation MGHome

- (MGHome)initWithClientService:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MGHome *v12;

  v6 = a4;
  v7 = a3;
  MGGroupIdentifierForHomeInHome(v6, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MGMemberIdentifiersForHome(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MGGroup initWithClientService:type:identifier:name:properties:memberIdentifiers:](self, "initWithClientService:type:identifier:name:properties:memberIdentifiers:", v7, v9, v8, v10, 0, v11);
  return v12;
}

- (MGHome)initWithConnectionProvider:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MGHome *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "clientServiceWithConnectionProvider:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[MGHome initWithClientService:home:](self, "initWithClientService:home:", v8, v6);
  return v9;
}

+ (id)type
{
  return CFSTR("com.apple.media-group.home");
}

- (id)HomeKitHomeIdentifier
{
  void *v2;
  void *v3;

  -[MGGroup identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MGHomeIdentifierForGroupIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)HomeKitHomeWithHomeManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MGGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MGHomeFromHomeManagerForGroupIdentifier(v4, v5);
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
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("($CURRENT_HOME != nil) && (SELF.identifier == $CURRENT_HOME.identifier)"));
}

@end
