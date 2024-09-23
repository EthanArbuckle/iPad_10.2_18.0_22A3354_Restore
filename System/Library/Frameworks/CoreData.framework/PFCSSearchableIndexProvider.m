@implementation PFCSSearchableIndexProvider

- (id)createPrivateSearchableIndexWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  const __CFString *v9;

  v8 = objc_alloc((Class)getCoreSpotlightCSPrivateSearchableIndexClass[0]());
  if (a3)
    v9 = (const __CFString *)a3;
  else
    v9 = &stru_1E1EE23F0;
  return (id)objc_msgSend(v8, "initWithName:protectionClass:bundleIdentifier:", v9, a4, a5);
}

- (id)defaultSearchableIndex
{
  return (id)objc_msgSend((Class)getCoreSpotlightCSSearchableIndexClass[0](), "defaultSearchableIndex");
}

- (id)defaultPrivateSearchableIndex
{
  return (id)objc_msgSend((Class)getCoreSpotlightCSPrivateSearchableIndexClass[0](), "defaultSearchableIndex");
}

- (id)createSearchableIndexWithName:(id)a3 protectionClass:(id)a4 bundleIdentifier:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)getCoreSpotlightCSSearchableIndexClass[0]()), "initWithName:protectionClass:bundleIdentifier:", a3, a4, a5);
}

- (id)createPrivateSearchableIndexWithPath:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)getCoreSpotlightCSPrivateSearchableIndexClass[0]()), "initWithPath:", a3);
}

@end
