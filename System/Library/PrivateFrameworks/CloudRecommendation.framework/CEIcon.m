@implementation CEIcon

- (CEIcon)initWithDictionary:(id)a3
{
  id v4;
  CEIcon *v5;
  void *v6;
  NSString *v7;
  NSObject *type;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CEIcon;
  v5 = -[CEIcon init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      type = v5->_type;
      v5->_type = v7;
    }
    else
    {
      _CELogSystem();
      type = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(type, OS_LOG_TYPE_DEBUG))
        -[CEIcon initWithDictionary:].cold.1();
    }

  }
  return v5;
}

- (CEIcon)initWithCoder:(id)a3
{
  id v4;
  CEIcon *v5;
  uint64_t v6;
  NSString *type;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CEIcon;
  v5 = -[CEIcon init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Icon with type: %@"), self->_type);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CEIcon *v4;

  v4 = -[CEIcon init](+[CEIcon allocWithZone:](CEIcon, "allocWithZone:", a3), "init");
  -[CEIcon setType:](v4, "setType:", self->_type);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_type, CFSTR("type"));
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse type from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
