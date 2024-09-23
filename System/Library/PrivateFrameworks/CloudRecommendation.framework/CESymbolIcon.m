@implementation CESymbolIcon

- (CESymbolIcon)initWithDictionary:(id)a3
{
  id v4;
  CESymbolIcon *v5;
  void *v6;
  NSString *v7;
  NSObject *identifier;
  void *v9;
  NSString *v10;
  NSObject *path;
  void *v12;
  NSString *v13;
  NSObject *systemColorName;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CESymbolIcon;
  v5 = -[CEIcon initWithDictionary:](&v16, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      identifier = v5->_identifier;
      v5->_identifier = v7;
    }
    else
    {
      _CELogSystem();
      identifier = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(identifier, OS_LOG_TYPE_DEBUG))
        -[CESymbolIcon initWithDictionary:].cold.3();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      path = v5->_path;
      v5->_path = v10;
    }
    else
    {
      _CELogSystem();
      path = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(path, OS_LOG_TYPE_DEBUG))
        -[CESymbolIcon initWithDictionary:].cold.2();
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("color"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v12;
      systemColorName = v5->_systemColorName;
      v5->_systemColorName = v13;
    }
    else
    {
      _CELogSystem();
      systemColorName = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(systemColorName, OS_LOG_TYPE_DEBUG))
        -[CESymbolIcon initWithDictionary:].cold.1();
    }

  }
  return v5;
}

- (CESymbolIcon)initWithCoder:(id)a3
{
  id v4;
  CESymbolIcon *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *path;
  uint64_t v10;
  NSString *systemColorName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CESymbolIcon;
  v5 = -[CEIcon initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v8 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemColorName"));
    v10 = objc_claimAutoreleasedReturnValue();
    systemColorName = v5->_systemColorName;
    v5->_systemColorName = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CESymbolIcon;
  v4 = -[CEIcon copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setPath:", self->_path);
  objc_msgSend(v4, "setSystemColorName:", self->_systemColorName);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CESymbolIcon;
  v4 = a3;
  -[CEIcon encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("id"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_path, CFSTR("path"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_systemColorName, CFSTR("systemColorName"));

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CESymbolIcon;
  -[CEIcon description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" id: %@, path: %@, systemColorName: %@"), self->_identifier, self->_path, self->_systemColorName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)systemColorName
{
  return self->_systemColorName;
}

- (void)setSystemColorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemColorName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithDictionary:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse color from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.2()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse path from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.3()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse identifier from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
