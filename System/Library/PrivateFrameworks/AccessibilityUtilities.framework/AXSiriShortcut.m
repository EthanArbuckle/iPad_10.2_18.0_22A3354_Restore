@implementation AXSiriShortcut

- (AXSiriShortcut)initWithAccessibilityWorkflow:(id)a3
{
  id v4;
  AXSiriShortcut *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *shortcutName;
  uint64_t v10;
  NSString *associatedAppBundleIdentifier;
  AXSiriShortcut *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXSiriShortcut;
  v5 = -[AXSiriShortcut init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    shortcutName = v5->_shortcutName;
    v5->_shortcutName = (NSString *)v8;

    objc_msgSend(v4, "associatedAppBundleIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    associatedAppBundleIdentifier = v5->_associatedAppBundleIdentifier;
    v5->_associatedAppBundleIdentifier = (NSString *)v10;

    v5->_glyphCharacter = objc_msgSend(v4, "glyphCharacter");
    v12 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXSiriShortcut identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSiriShortcut shortcutName](self, "shortcutName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSiriShortcut associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXSiriShortcut<%p>. ID: '%@' name: '%@' bundleID: '%@' "), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSiriShortcut)initWithCoder:(id)a3
{
  id v4;
  AXSiriShortcut *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *shortcutName;
  uint64_t v10;
  NSString *associatedAppBundleIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXSiriShortcut;
  v5 = -[AXSiriShortcut init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shortcutName"));
    v8 = objc_claimAutoreleasedReturnValue();
    shortcutName = v5->_shortcutName;
    v5->_shortcutName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedAppBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    associatedAppBundleIdentifier = v5->_associatedAppBundleIdentifier;
    v5->_associatedAppBundleIdentifier = (NSString *)v10;

    v5->_glyphCharacter = objc_msgSend(v4, "decodeIntForKey:", CFSTR("glyphCharacter"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shortcutName, CFSTR("shortcutName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedAppBundleIdentifier, CFSTR("associatedAppBundleIdentifier"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_glyphCharacter, CFSTR("glyphCharacter"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)shortcutName
{
  return self->_shortcutName;
}

- (void)setShortcutName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (void)setGlyphCharacter:(unsigned __int16)a3
{
  self->_glyphCharacter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
