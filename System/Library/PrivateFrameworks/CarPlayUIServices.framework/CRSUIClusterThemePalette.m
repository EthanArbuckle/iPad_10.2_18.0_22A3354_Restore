@implementation CRSUIClusterThemePalette

- (CRSUIClusterThemePalette)initWithIdentifier:(id)a3 displayName:(id)a4 colorScheme:(id)a5 sortIndex:(int64_t)a6 accentColor:(id)a7 isDefault:(BOOL)a8 isProminent:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  CRSUIClusterThemePalette *v19;
  uint64_t v20;
  NSString *identifier;
  uint64_t v22;
  NSString *displayName;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CRSUIClusterThemePalette;
  v19 = -[CRSUIClusterThemePalette init](&v25, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    displayName = v19->_displayName;
    v19->_displayName = (NSString *)v22;

    objc_storeStrong((id *)&v19->_colorScheme, a5);
    v19->_sortIndex = a6;
    objc_storeStrong((id *)&v19->_themeAccentColor, a7);
    v19->_isDefault = a8;
    v19->_prominent = a9;
  }

  return v19;
}

- (UIColor)accentColor
{
  return -[CRSUIClusterThemeColor color](self->_themeAccentColor, "color");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CRSUIClusterThemePalette)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  CRSUIClusterThemePalette *v13;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorScheme"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accentColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefault"));
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isProminent"));

  v13 = 0;
  if (v5 && v6 && v9)
  {
    LOBYTE(v15) = v12;
    self = -[CRSUIClusterThemePalette initWithIdentifier:displayName:colorScheme:sortIndex:accentColor:isDefault:isProminent:](self, "initWithIdentifier:displayName:colorScheme:sortIndex:accentColor:isDefault:isProminent:", v5, v6, v9, v8, v10, v11, v15);
    v13 = self;
  }

  return v13;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CRSUIClusterThemePalette identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[CRSUIClusterThemePalette displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("displayName"));

  -[CRSUIClusterThemePalette colorScheme](self, "colorScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("colorScheme"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CRSUIClusterThemePalette sortIndex](self, "sortIndex"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("sortIndex"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_themeAccentColor, CFSTR("accentColor"));
  objc_msgSend(v8, "encodeBool:forKey:", -[CRSUIClusterThemePalette isDefault](self, "isDefault"), CFSTR("isDefault"));
  objc_msgSend(v8, "encodeBool:forKey:", -[CRSUIClusterThemePalette isProminent](self, "isProminent"), CFSTR("isProminent"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (CRSUIClusterThemeRepresentedColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)sortIndex
{
  return self->_sortIndex;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_themeAccentColor, 0);
}

@end
