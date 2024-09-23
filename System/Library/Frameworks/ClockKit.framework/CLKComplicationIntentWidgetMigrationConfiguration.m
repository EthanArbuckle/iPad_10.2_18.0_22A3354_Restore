@implementation CLKComplicationIntentWidgetMigrationConfiguration

- (CLKComplicationIntentWidgetMigrationConfiguration)initWithKind:(NSString *)kind extensionBundleIdentifier:(NSString *)extensionBundleIdentifier intent:(INIntent *)intent localizedDisplayName:(NSString *)localizedDisplayName
{
  NSString *v10;
  NSString *v11;
  INIntent *v12;
  NSString *v13;
  CLKComplicationIntentWidgetMigrationConfiguration *v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  INIntent *v20;
  uint64_t v21;
  NSString *v22;
  objc_super v24;

  v10 = kind;
  v11 = extensionBundleIdentifier;
  v12 = intent;
  v13 = localizedDisplayName;
  v24.receiver = self;
  v24.super_class = (Class)CLKComplicationIntentWidgetMigrationConfiguration;
  v14 = -[CLKComplicationWidgetMigrationConfiguration initPrivate](&v24, sel_initPrivate);
  if (v14)
  {
    v15 = -[NSString copy](v10, "copy");
    v16 = v14->_kind;
    v14->_kind = (NSString *)v15;

    v17 = -[NSString copy](v11, "copy");
    v18 = v14->_extensionBundleIdentifier;
    v14->_extensionBundleIdentifier = (NSString *)v17;

    v19 = -[INIntent copy](v12, "copy");
    v20 = v14->_intent;
    v14->_intent = (INIntent *)v19;

    v21 = -[NSString copy](v13, "copy");
    v22 = v14->_localizedDisplayName;
    v14->_localizedDisplayName = (NSString *)v21;

  }
  return v14;
}

- (void)setIntent:(id)a3
{
  INIntent **p_intent;
  id v5;

  p_intent = &self->_intent;
  v5 = a3;
  if ((-[INIntent isEqual:](*p_intent, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_intent, a3);

}

+ (CLKComplicationIntentWidgetMigrationConfiguration)intentWidgetMigrationConfigurationWithKind:(NSString *)kind extensionBundleIdentifier:(NSString *)extensionBundleIdentifier intent:(INIntent *)intent localizedDisplayName:(NSString *)localizedDisplayName
{
  NSString *v10;
  INIntent *v11;
  NSString *v12;
  NSString *v13;
  void *v14;

  v10 = localizedDisplayName;
  v11 = intent;
  v12 = extensionBundleIdentifier;
  v13 = kind;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKind:extensionBundleIdentifier:intent:localizedDisplayName:", v13, v12, v11, v10);

  return (CLKComplicationIntentWidgetMigrationConfiguration *)v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *kind;
  void *v7;
  NSString *extensionBundleIdentifier;
  void *v9;
  INIntent *intent;
  void *v11;
  NSString *localizedDisplayName;
  void *v13;
  BOOL v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLKComplicationIntentWidgetMigrationConfiguration;
  if (-[CLKComplicationWidgetMigrationConfiguration isEqual:](&v16, sel_isEqual_, v4)
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
      if (-[NSString isEqualToString:](extensionBundleIdentifier, "isEqualToString:", v9))
      {
        intent = self->_intent;
        objc_msgSend(v5, "intent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[INIntent isEqual:](intent, "isEqual:", v11))
        {
          localizedDisplayName = self->_localizedDisplayName;
          objc_msgSend(v5, "localizedDisplayName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = -[NSString isEqualToString:](localizedDisplayName, "isEqualToString:", v13);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationIntentWidgetMigrationConfiguration;
  v4 = -[CLKComplicationWidgetMigrationConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 1, self->_kind);
  objc_storeStrong(v4 + 2, self->_extensionBundleIdentifier);
  objc_storeStrong(v4 + 3, self->_intent);
  objc_storeStrong(v4 + 4, self->_localizedDisplayName);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKComplicationIntentWidgetMigrationConfiguration)initWithCoder:(id)a3
{
  id v4;
  CLKComplicationIntentWidgetMigrationConfiguration *v5;
  uint64_t v6;
  NSString *kind;
  uint64_t v8;
  NSString *extensionBundleIdentifier;
  uint64_t v10;
  INIntent *intent;
  uint64_t v12;
  NSString *localizedDisplayName;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKComplicationIntentWidgetMigrationConfiguration;
  v5 = -[CLKComplicationWidgetMigrationConfiguration initWithCoder:](&v15, sel_initWithCoder_, v4);
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

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_WidgetMigrationConfigurationKindIntent"));
    v10 = objc_claimAutoreleasedReturnValue();
    intent = v5->_intent;
    v5->_intent = (INIntent *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_WidgetMigrationConfigurationKindLocalizedDisplayName"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationIntentWidgetMigrationConfiguration;
  v4 = a3;
  -[CLKComplicationWidgetMigrationConfiguration encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_kind, CFSTR("_WidgetMigrationConfigurationKind"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionBundleIdentifier, CFSTR("_WidgetMigrationConfigurationKindExtensionBundleIdentifier"));
  INIntentWithTypedIntent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_WidgetMigrationConfigurationKindIntent"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedDisplayName, CFSTR("_WidgetMigrationConfigurationKindLocalizedDisplayName"));
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (INIntent)intent
{
  return self->_intent;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
