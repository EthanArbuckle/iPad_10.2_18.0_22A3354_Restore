@implementation ATXWidgetPersonality

- (ATXWidgetPersonality)initWithExtensionBundleId:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  ATXWidgetPersonality *v8;
  uint64_t v9;
  NSString *extensionBundleId;
  uint64_t v11;
  NSString *kind;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXWidgetPersonality;
  v8 = -[ATXWidgetPersonality init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    extensionBundleId = v8->_extensionBundleId;
    v8->_extensionBundleId = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    kind = v8->_kind;
    v8->_kind = (NSString *)v11;

  }
  return v8;
}

- (ATXWidgetPersonality)initWithStringRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  ATXWidgetPersonality *v8;

  v4 = a3;
  +[ATXWidgetPersonality widgetBundleIdForWidgetPersonalityStringRepresentation:](ATXWidgetPersonality, "widgetBundleIdForWidgetPersonalityStringRepresentation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXWidgetPersonality widgetKindForWidgetPersonalityStringRepresentation:](ATXWidgetPersonality, "widgetKindForWidgetPersonalityStringRepresentation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[ATXWidgetPersonality initWithExtensionBundleId:kind:](self, "initWithExtensionBundleId:kind:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (ATXWidgetPersonality)initWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXWidgetPersonality *v7;

  v4 = a3;
  objc_msgSend(v4, "extensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:](self, "initWithExtensionBundleId:kind:", v5, v6);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *extensionBundleId;
  id v5;

  extensionBundleId = self->_extensionBundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", extensionBundleId, CFSTR("extensionBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_kind, CFSTR("kind"));

}

- (ATXWidgetPersonality)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXWidgetPersonality *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionBundleId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXWidgetPersonality initWithExtensionBundleId:kind:](self, "initWithExtensionBundleId:kind:", v5, v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXWidgetPersonality *v4;
  ATXWidgetPersonality *v5;
  NSString *extensionBundleId;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSString *v12;
  NSString *v13;

  v4 = (ATXWidgetPersonality *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      extensionBundleId = self->_extensionBundleId;
      v7 = v5->_extensionBundleId;
      if (extensionBundleId == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = extensionBundleId;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v12 = self->_kind;
      v13 = v12;
      if (v12 == v5->_kind)
        v11 = 1;
      else
        v11 = -[NSString isEqual:](v12, "isEqual:");

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_extensionBundleId, "hash");
  return -[NSString hash](self->_kind, "hash") - v3 + 32 * v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithExtensionBundleId:kind:", self->_extensionBundleId, self->_kind);
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("Extension bundle id: %@; "), self->_extensionBundleId);
  objc_msgSend(v3, "appendFormat:", CFSTR("kind: %@; "), self->_kind);
  return v3;
}

- (id)stringRepresentation
{
  return (id)objc_msgSend((id)objc_opt_class(), "stringRepresentationForExtensionBundleId:kind:", self->_extensionBundleId, self->_kind);
}

+ (id)stringRepresentationForATXHomeScreenWidgetDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "avocadoDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avocadoDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringRepresentationForExtensionBundleId:kind:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)stringRepresentationForExtensionBundleId:(id)a3 kind:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@:%@"), v7, v6);

  return v8;
}

+ (id)widgetBundleIdForWidgetPersonalityStringRepresentation:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR(":"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)widgetKindForWidgetPersonalityStringRepresentation:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR(":"));
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", v4 + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (NSString)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
}

@end
