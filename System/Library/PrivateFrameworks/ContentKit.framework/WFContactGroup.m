@implementation WFContactGroup

+ (Class)preferredConcreteSubclass
{
  return (Class)objc_opt_class();
}

+ (id)allContactGroups
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "preferredConcreteSubclass"), "allContactGroups");
}

+ (id)contactGroupWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "allContactGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectMatchingKey:value:", CFSTR("name"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return 0;
}

- (NSArray)contacts
{
  return 0;
}

- (BOOL)containsContact:(id)a3
{
  return 0;
}

@end
