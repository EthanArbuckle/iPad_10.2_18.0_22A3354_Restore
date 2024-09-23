@implementation WFFocusMode

- (WFFocusMode)initWithFCActivityDescribing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFFocusMode *v9;

  v4 = a3;
  objc_msgSend(v4, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitySymbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityColorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WFFocusMode initWithIdentifier:displayName:symbolName:colorName:](self, "initWithIdentifier:displayName:symbolName:colorName:", v5, v6, v7, v8);
  return v9;
}

- (WFFocusMode)initWithIdentifier:(id)a3 displayName:(id)a4 symbolName:(id)a5 colorName:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFFocusMode *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *displayName;
  uint64_t v19;
  NSString *symbolName;
  uint64_t v21;
  NSString *colorName;
  WFFocusMode *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WFFocusMode;
  v14 = -[WFFocusMode init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    displayName = v14->_displayName;
    v14->_displayName = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    symbolName = v14->_symbolName;
    v14->_symbolName = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    colorName = v14->_colorName;
    v14->_colorName = (NSString *)v21;

    v23 = v14;
  }

  return v14;
}

- (WFImage)symbolImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BEC14E0];
  -[WFFocusMode symbolName](self, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemImageNamed:configuration:renderingMode:", v4, 0, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEC1398];
  -[WFFocusMode colorName](self, "colorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithFocusColorName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "imageWithTintColor:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }

  return (WFImage *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFFocusMode identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[WFFocusMode displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[WFFocusMode symbolName](self, "symbolName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("symbolName"));

  -[WFFocusMode colorName](self, "colorName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("colorName"));

}

- (WFFocusMode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFFocusMode *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WFFocusMode initWithIdentifier:displayName:symbolName:colorName:](self, "initWithIdentifier:displayName:symbolName:colorName:", v5, v6, v7, v8);
  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
