@implementation CEImageIcon

- (CEImageIcon)initWithDictionary:(id)a3
{
  id v4;
  CEImageIcon *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSURL *URL1x;
  void *v10;
  uint64_t v11;
  NSURL *URL2x;
  void *v13;
  uint64_t v14;
  NSURL *URL3x;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CEImageIcon;
  v5 = -[CEIcon initWithDictionary:](&v17, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iconUrls"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("1x"));
      v7 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        URL1x = v5->_URL1x;
        v5->_URL1x = (NSURL *)v8;

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("2x"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        URL2x = v5->_URL2x;
        v5->_URL2x = (NSURL *)v11;

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("3x"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        URL3x = v5->_URL3x;
        v5->_URL3x = (NSURL *)v14;

      }
    }
    else
    {
      _CELogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[CEImageIcon initWithDictionary:].cold.1();
    }

  }
  return v5;
}

- (CEImageIcon)initWithCoder:(id)a3
{
  id v4;
  CEImageIcon *v5;
  uint64_t v6;
  NSURL *URL1x;
  uint64_t v8;
  NSURL *URL2x;
  uint64_t v10;
  NSURL *URL3x;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CEImageIcon;
  v5 = -[CEIcon initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url1x"));
    v6 = objc_claimAutoreleasedReturnValue();
    URL1x = v5->_URL1x;
    v5->_URL1x = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url2x"));
    v8 = objc_claimAutoreleasedReturnValue();
    URL2x = v5->_URL2x;
    v5->_URL2x = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url3x"));
    v10 = objc_claimAutoreleasedReturnValue();
    URL3x = v5->_URL3x;
    v5->_URL3x = (NSURL *)v10;

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
  v6.super_class = (Class)CEImageIcon;
  v4 = -[CEIcon copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setURL1x:", self->_URL1x);
  objc_msgSend(v4, "setURL2x:", self->_URL2x);
  objc_msgSend(v4, "setURL3x:", self->_URL3x);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CEImageIcon;
  v4 = a3;
  -[CEIcon encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL1x, CFSTR("url1x"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL2x, CFSTR("url2x"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL3x, CFSTR("url3x"));

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CEImageIcon;
  -[CEIcon description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" url1x: %@ url2x: %@ url3x: %@"), self->_URL1x, self->_URL2x, self->_URL3x);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSURL)URL1x
{
  return self->_URL1x;
}

- (void)setURL1x:(id)a3
{
  objc_storeStrong((id *)&self->_URL1x, a3);
}

- (NSURL)URL2x
{
  return self->_URL2x;
}

- (void)setURL2x:(id)a3
{
  objc_storeStrong((id *)&self->_URL2x, a3);
}

- (NSURL)URL3x
{
  return self->_URL3x;
}

- (void)setURL3x:(id)a3
{
  objc_storeStrong((id *)&self->_URL3x, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL3x, 0);
  objc_storeStrong((id *)&self->_URL2x, 0);
  objc_storeStrong((id *)&self->_URL1x, 0);
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
  OUTLINED_FUNCTION_0(&dword_2380DF000, v2, v3, "%@ Unable to parse urls from dictionary", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
