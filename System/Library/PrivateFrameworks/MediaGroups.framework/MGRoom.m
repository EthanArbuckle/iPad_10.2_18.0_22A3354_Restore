@implementation MGRoom

- (MGRoom)initWithClientService:(id)a3 room:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MGRoom *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  MGGroupIdentifierForRoomInHome(v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MGMemberIdentifiersForRoomInHome(v9, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[MGGroup initWithClientService:type:identifier:name:properties:memberIdentifiers:](self, "initWithClientService:type:identifier:name:properties:memberIdentifiers:", v10, v12, v11, v13, 0, v14);
  return v15;
}

- (MGRoom)initWithConnectionProvider:(id)a3 room:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MGRoom *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "clientServiceWithConnectionProvider:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MGRoom initWithClientService:room:home:](self, "initWithClientService:room:home:", v11, v9, v8);
  return v12;
}

+ (id)type
{
  return CFSTR("com.apple.media-group.room");
}

- (id)HomeKitRoomIdentifier
{
  void *v2;
  void *v3;

  -[MGGroup identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MGRoomIdentifierForGroupIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)HomeKitRoomWithHomeManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MGGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MGRoomFromHomeManagerForGroupIdentifier(v4, v5);
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
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("($CURRENT_ROOM != nil) && (SELF.identifier == $CURRENT_ROOM.identifier)"));
}

@end
