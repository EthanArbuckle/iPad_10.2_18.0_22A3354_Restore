@implementation CAFSymbolImageWithColor

- (CAFSymbolImageWithColor)initWithDictionary:(id)a3
{
  id v4;
  CAFSymbolImageWithColor *v5;
  id v6;
  id v7;
  id v8;
  NSString *v9;
  NSString *name;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAFSymbolImageWithColor;
  v5 = -[CAFSymbolImageWithColor init](&v12, sel_init);
  if (v5)
  {
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("color"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    v5->_color = objc_msgSend(v7, "unsignedCharValue");
    objc_opt_class();
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
      v9 = (NSString *)v8;
    else
      v9 = 0;

    name = v5->_name;
    v5->_name = v9;

  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("color");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", -[CAFSymbolImageWithColor color](self, "color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("name");
  v9[0] = v3;
  -[CAFSymbolImageWithColor name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)

  return (NSDictionary *)v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[CAFSymbolImageWithColor color](self, "color");
  -[CAFSymbolImageWithColor name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { %@: %hhu, %@: %@ }>"), v4, self, CFSTR("color"), v5, CFSTR("name"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unsigned)color
{
  return self->_color;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
