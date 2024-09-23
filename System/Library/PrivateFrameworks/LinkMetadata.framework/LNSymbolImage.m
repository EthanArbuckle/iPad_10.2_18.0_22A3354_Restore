@implementation LNSymbolImage

- (NSString)systemName
{
  return self->_systemName;
}

- (LNSymbolImage)initWithSymbolSystemName:(id)a3
{
  return -[LNSymbolImage initWithSymbolSystemName:tintColorData:configurationData:platform:](self, "initWithSymbolSystemName:tintColorData:configurationData:platform:", a3, 0, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformAgnosticSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_tintColorData, 0);
  objc_storeStrong((id *)&self->_systemName, 0);
}

- (LNSymbolImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LNSymbolImage *v10;
  LNSymbolImage *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColorData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configurationData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platform"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platformAgnosticSymbolConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = -[LNSymbolImage initWithSymbolSystemName:tintColorData:platformAgnosticConfiguration:platform:](self, "initWithSymbolSystemName:tintColorData:platformAgnosticConfiguration:platform:", v5, v6, v9, v8);
    else
      v10 = -[LNSymbolImage initWithSymbolSystemName:tintColorData:configurationData:platform:](self, "initWithSymbolSystemName:tintColorData:configurationData:platform:", v5, v6, v7, v8);
    self = v10;

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (LNSymbolImage)initWithSymbolSystemName:(id)a3 tintColorData:(id)a4 configurationData:(id)a5 platform:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNSymbolImage *v15;
  LNSymbolImage *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11
    && (v18.receiver = self,
        v18.super_class = (Class)LNSymbolImage,
        v15 = -[LNImage initWithSystemImageNamed:](&v18, sel_initWithSystemImageNamed_, v11),
        (self = v15) != 0))
  {
    objc_storeStrong((id *)&v15->_systemName, a3);
    objc_storeStrong((id *)&self->_tintColorData, a4);
    objc_storeStrong((id *)&self->_configurationData, a5);
    objc_storeStrong((id *)&self->_platform, a6);
    self = self;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LNSymbolImage;
  v4 = a3;
  -[LNImage encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[LNSymbolImage tintColorData](self, "tintColorData", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tintColorData"));

  -[LNSymbolImage systemName](self, "systemName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("systemName"));

  -[LNSymbolImage platform](self, "platform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("platform"));

  -[LNSymbolImage configurationData](self, "configurationData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("configurationData"));

  -[LNSymbolImage platformAgnosticSymbolConfiguration](self, "platformAgnosticSymbolConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("platformAgnosticSymbolConfiguration"));

}

- (NSData)tintColorData
{
  return self->_tintColorData;
}

- (NSString)platform
{
  return self->_platform;
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (LNSymbolConfiguration)platformAgnosticSymbolConfiguration
{
  return self->_platformAgnosticSymbolConfiguration;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNSymbolImage)initWithSymbolSystemName:(id)a3 tintColorData:(id)a4 platformAgnosticConfiguration:(id)a5 platform:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNSymbolImage *v15;
  LNSymbolImage *v16;
  LNSymbolImage *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)LNSymbolImage;
  v15 = -[LNImage initWithSystemImageNamed:](&v19, sel_initWithSystemImageNamed_, v11);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_systemName, a3);
    objc_storeStrong((id *)&v16->_tintColorData, a4);
    objc_storeStrong((id *)&v16->_platformAgnosticSymbolConfiguration, a5);
    objc_storeStrong((id *)&v16->_platform, a6);
    v17 = v16;
  }

  return v16;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSymbolImage systemName](self, "systemName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSymbolImage platform](self, "platform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSymbolImage tintColorData](self, "tintColorData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;
  -[LNSymbolImage configurationData](self, "configurationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, systemName: %@, platform: %@, hasTintColorData: %d, hasConfigurationData: %d>"), v5, self, v6, v7, v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LNSymbolImage platformAgnosticSymbolConfiguration](self, "platformAgnosticSymbolConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, systemName: %@, platform: %@, hasTintColorData: %d, hasConfigurationData: %d>"), v5, self, v6, v7, v9, v12 != 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

@end
