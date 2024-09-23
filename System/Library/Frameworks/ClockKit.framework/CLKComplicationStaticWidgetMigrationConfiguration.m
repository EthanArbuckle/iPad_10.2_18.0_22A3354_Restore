@implementation CLKComplicationStaticWidgetMigrationConfiguration

- (CLKComplicationStaticWidgetMigrationConfiguration)initWithKind:(NSString *)kind extensionBundleIdentifier:(NSString *)extensionBundleIdentifier
{
  NSString *v6;
  NSString *v7;
  CLKComplicationStaticWidgetMigrationConfiguration *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  objc_super v14;

  v6 = kind;
  v7 = extensionBundleIdentifier;
  v14.receiver = self;
  v14.super_class = (Class)CLKComplicationStaticWidgetMigrationConfiguration;
  v8 = -[CLKComplicationWidgetMigrationConfiguration initPrivate](&v14, sel_initPrivate);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_kind;
    v8->_kind = (NSString *)v9;

    v11 = -[NSString copy](v7, "copy");
    v12 = v8->_extensionBundleIdentifier;
    v8->_extensionBundleIdentifier = (NSString *)v11;

  }
  return v8;
}

+ (CLKComplicationStaticWidgetMigrationConfiguration)staticWidgetMigrationConfigurationWithKind:(NSString *)kind extensionBundleIdentifier:(NSString *)extensionBundleIdentifier
{
  NSString *v6;
  NSString *v7;
  void *v8;

  v6 = extensionBundleIdentifier;
  v7 = kind;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKind:extensionBundleIdentifier:", v7, v6);

  return (CLKComplicationStaticWidgetMigrationConfiguration *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *kind;
  void *v7;
  NSString *extensionBundleIdentifier;
  void *v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLKComplicationStaticWidgetMigrationConfiguration;
  if (-[CLKComplicationWidgetMigrationConfiguration isEqual:](&v12, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    kind = self->_kind;
    objc_msgSend(v5, "kind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](kind, "isEqualToString:", v7))
    {
      extensionBundleIdentifier = self->_extensionBundleIdentifier;
      objc_msgSend(v5, "extensionBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString isEqualToString:](extensionBundleIdentifier, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationStaticWidgetMigrationConfiguration;
  v4 = -[CLKComplicationWidgetMigrationConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 1, self->_kind);
  objc_storeStrong(v4 + 2, self->_extensionBundleIdentifier);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKComplicationStaticWidgetMigrationConfiguration)initWithCoder:(id)a3
{
  id v4;
  CLKComplicationStaticWidgetMigrationConfiguration *v5;
  uint64_t v6;
  NSString *kind;
  uint64_t v8;
  NSString *extensionBundleIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationStaticWidgetMigrationConfiguration;
  v5 = -[CLKComplicationWidgetMigrationConfiguration initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_WidgetMigrationConfigurationKind"));
    v6 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_WidgetMigrationConfigurationKindExtensionBundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKComplicationStaticWidgetMigrationConfiguration;
  v4 = a3;
  -[CLKComplicationWidgetMigrationConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, CFSTR("_WidgetMigrationConfigurationKind"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionBundleIdentifier, CFSTR("_WidgetMigrationConfigurationKindExtensionBundleIdentifier"));

}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
