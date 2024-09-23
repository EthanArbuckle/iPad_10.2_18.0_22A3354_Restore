@implementation INCodableLocalizationTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  INCodableLocalizationTable *v4;
  void *v5;
  void *v6;
  INCodableLocalizationTable *v7;

  v4 = +[INCodableLocalizationTable allocWithZone:](INCodableLocalizationTable, "allocWithZone:", a3);
  -[INCodableLocalizationTable bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableLocalizationTable tableName](self, "tableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[INCodableLocalizationTable initWithBundleIdentifier:tableName:](v4, "initWithBundleIdentifier:tableName:", v5, v6);

  return v7;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (INCodableLocalizationTable)initWithBundleIdentifier:(id)a3 tableName:(id)a4
{
  id v6;
  id v7;
  INCodableLocalizationTable *v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  uint64_t v11;
  NSString *tableName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INCodableLocalizationTable;
  v8 = -[INCodableLocalizationTable init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    tableName = v8->_tableName;
    v8->_tableName = (NSString *)v11;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  id v5;

  bundleIdentifier = self->_bundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tableName, CFSTR("tableName"));

}

- (INCodableLocalizationTable)initWithCoder:(id)a3
{
  id v4;
  INCodableLocalizationTable *v5;
  uint64_t v6;
  NSString *tableName;
  uint64_t v8;
  NSString *bundleIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INCodableLocalizationTable;
  v5 = -[INCodableLocalizationTable init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tableName"));
    v6 = objc_claimAutoreleasedReturnValue();
    tableName = v5->_tableName;
    v5->_tableName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[INCodableLocalizationTable tableName](self, "tableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INCodableLocalizationTable bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[INCodableLocalizationTable tableName](self, "tableName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tableName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[INCodableLocalizationTable bundleIdentifier](self, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "intents_setPlistSafeObject:forKey:", self->_tableName, CFSTR("tableName"));
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setTableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4;
  INCodableLocalizationTable *v5;
  uint64_t v6;
  NSString *tableName;
  uint64_t v8;
  NSString *bundleIdentifier;

  v4 = a3;
  v5 = objc_alloc_init(INCodableLocalizationTable);
  objc_msgSend(v4, "intents_stringForKey:", CFSTR("tableName"));
  v6 = objc_claimAutoreleasedReturnValue();
  tableName = v5->_tableName;
  v5->_tableName = (NSString *)v6;

  objc_msgSend(v4, "intents_stringForKey:", CFSTR("bundleIdentifier"));
  v8 = objc_claimAutoreleasedReturnValue();

  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v8;

  return v5;
}

@end
