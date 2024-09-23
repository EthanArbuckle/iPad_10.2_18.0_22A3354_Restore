@implementation MGHomeTheater

- (id)audioEntityRouteID
{
  void *v2;
  void *v3;

  -[MGGroup properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("audioDestinationIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)type
{
  return CFSTR("com.apple.media-group.home-theater");
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
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(a1, "predicateForType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("($CURRENT_SOLO_GROUP != nil)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$CONTAINMENT_MAP[$CURRENT_SOLO_GROUP.identifier] != nil"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SUBQUERY($CONTAINMENT_MAP[$CURRENT_SOLO_GROUP.identifier], $container, SELF.identifier in $container)[SIZE] > 0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
