@implementation NSSUsageBundle

- (unint64_t)totalSize
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_categories;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "size", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<NSSUsageBundle: %p; name: \"%@\", bundleIdentifier: \"%@\", categories: \"%@\", purgeable: \"%d\">"),
               self,
               self->_name,
               self->_bundleIdentifier,
               self->_categories,
               self->_purgeable);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categories, CFSTR("categories"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_purgeable, CFSTR("purgeable"));

}

- (NSSUsageBundle)initWithCoder:(id)a3
{
  id v4;
  NSSUsageBundle *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *bundleIdentifier;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *categories;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NSSUsageBundle;
  v5 = -[NSSUsageBundle init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("categories"));
    v13 = objc_claimAutoreleasedReturnValue();
    categories = v5->_categories;
    v5->_categories = (NSArray *)v13;

    v5->_purgeable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("purgeable"));
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (void)setTotalSize:(unint64_t)a3
{
  self->_totalSize = a3;
}

- (BOOL)isPurgeable
{
  return self->_purgeable;
}

- (void)setPurgeable:(BOOL)a3
{
  self->_purgeable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
