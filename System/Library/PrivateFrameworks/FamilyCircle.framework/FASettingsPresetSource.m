@implementation FASettingsPresetSource

- (FASettingsPresetSource)initWithIdentifier:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  FASettingsPresetSource *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FASettingsPresetSource;
  v8 = -[FASettingsPresetSource init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_configuration, a4);
  }

  return v8;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *identifier;
  void *v7;
  FASettingsPresetConfiguration *configuration;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    identifier = self->_identifier;
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](identifier, "isEqualToString:", v7))
    {
      configuration = self->_configuration;
      objc_msgSend(v5, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[FASettingsPresetConfiguration isEqual:](configuration, "isEqual:", v9);

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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_configuration, CFSTR("values"));

}

- (FASettingsPresetSource)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FASettingsPresetSource *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("values"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[FASettingsPresetSource initWithIdentifier:configuration:](self, "initWithIdentifier:configuration:", v5, v6);
  return v7;
}

- (FASettingsPresetSource)initWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  FASettingsPresetConfiguration *v7;
  FASettingsPresetSource *v8;
  NSObject *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _FALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FASettingsPresetSource initWithDictionary:].cold.1();

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _FALogSystem();
    v7 = (FASettingsPresetConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
      -[FASettingsPresetSource initWithDictionary:].cold.1();
    goto LABEL_13;
  }
  v7 = -[FASettingsPresetConfiguration initWithDictionary:]([FASettingsPresetConfiguration alloc], "initWithDictionary:", v4);
  if (!v7)
  {
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FASettingsPresetSource initWithDictionary:].cold.1();

LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  self = -[FASettingsPresetSource initWithIdentifier:configuration:](self, "initWithIdentifier:configuration:", v6, v7);
  v8 = self;
LABEL_14:

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FASettingsPresetSource identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FASettingsPresetSource configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> ({\n identifier: %@\n configuration: %@\n)}"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (FASettingsPresetConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithDictionary:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CAEBA000, v0, v1, "Error decoding %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
