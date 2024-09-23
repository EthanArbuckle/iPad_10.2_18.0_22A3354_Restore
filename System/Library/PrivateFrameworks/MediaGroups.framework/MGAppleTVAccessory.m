@implementation MGAppleTVAccessory

- (id)deviceIdentifier
{
  void *v2;
  void *v3;

  -[MGGroup properties](self, "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("deviceIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)type
{
  return CFSTR("com.apple.media-group.solo-AppleTVAccessory");
}

- (id)HomeKitAccesoryIdentifier
{
  void *v2;
  void *v3;

  -[MGGroup identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MGAccessoryIdentifierForGroupIdentifier(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)HomeKitAccessoryWithHomeManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MGGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MGAccessoryFromHomeManagerForGroupIdentifier(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
