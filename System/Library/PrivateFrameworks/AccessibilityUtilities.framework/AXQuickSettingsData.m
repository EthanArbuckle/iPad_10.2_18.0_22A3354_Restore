@implementation AXQuickSettingsData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXQuickSettingsData)initWithCoder:(id)a3
{
  id v4;
  AXQuickSettingsData *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXQuickSettingsData;
  v5 = -[AXQuickSettingsData init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frontmostAppIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXQuickSettingsData setFrontmostAppIdentifier:](v5, "setFrontmostAppIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("webAreaURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXQuickSettingsData setWebAreaURL:](v5, "setWebAreaURL:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXQuickSettingsData frontmostAppIdentifier](self, "frontmostAppIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("frontmostAppIdentifier"));

  -[AXQuickSettingsData webAreaURL](self, "webAreaURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("webAreaURL"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)AXQuickSettingsData;
  -[AXQuickSettingsData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXQuickSettingsData frontmostAppIdentifier](self, "frontmostAppIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)frontmostAppIdentifier
{
  return self->_frontmostAppIdentifier;
}

- (void)setFrontmostAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_frontmostAppIdentifier, a3);
}

- (NSString)webAreaURL
{
  return self->_webAreaURL;
}

- (void)setWebAreaURL:(id)a3
{
  objc_storeStrong((id *)&self->_webAreaURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAreaURL, 0);
  objc_storeStrong((id *)&self->_frontmostAppIdentifier, 0);
}

@end
