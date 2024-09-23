@implementation AXSSKeyboardCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)commandWithStandardCommandIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStandardCommandIdentifier:", v4);

  return v5;
}

- (id)_initWithType:(id)a3 standardCommandIdentifier:(id)a4
{
  id v7;
  id v8;
  AXSSKeyboardCommand *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXSSKeyboardCommand;
  v9 = -[AXSSKeyboardCommand init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (AXSSKeyboardCommand)initWithStandardCommandIdentifier:(id)a3
{
  return (AXSSKeyboardCommand *)-[AXSSKeyboardCommand _initWithType:standardCommandIdentifier:](self, "_initWithType:standardCommandIdentifier:", CFSTR("Standard"), a3);
}

- (AXSSKeyboardCommand)initWithType:(id)a3
{
  return (AXSSKeyboardCommand *)-[AXSSKeyboardCommand _initWithType:standardCommandIdentifier:](self, "_initWithType:standardCommandIdentifier:", a3, 0);
}

- (AXSSKeyboardCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AXSSKeyboardCommand *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("standardCommandIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = (AXSSKeyboardCommand *)-[AXSSKeyboardCommand _initWithType:standardCommandIdentifier:](self, "_initWithType:standardCommandIdentifier:", v5, v6);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXSSKeyboardCommand type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("type"));

  -[AXSSKeyboardCommand standardCommandIdentifier](self, "standardCommandIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("standardCommandIdentifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[AXSSKeyboardCommand type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSKeyboardCommand standardCommandIdentifier](self, "standardCommandIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "_initWithType:standardCommandIdentifier:", v5, v6);

  return v7;
}

- (NSString)localizedName
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  -[AXSSKeyboardCommand type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Standard"));

  if (v4)
  {
    -[AXSSKeyboardCommand standardCommandIdentifier](self, "standardCommandIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("COMMAND_%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_1E5F9A110, CFSTR("FullKeyboardAccess"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E5F9A110;
  }
  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[AXSSKeyboardCommand isEqualToCommand:](self, "isEqualToCommand:", v4);

  return v5;
}

- (BOOL)isEqualToCommand:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[AXSSKeyboardCommand type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Standard"));

  if (v6)
  {
    objc_msgSend(v4, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Standard")))
    {
      objc_msgSend(v4, "standardCommandIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXSSKeyboardCommand standardCommandIdentifier](self, "standardCommandIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

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

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[AXSSKeyboardCommand type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AXSSKeyboardCommand standardCommandIdentifier](self, "standardCommandIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXSSKeyboardCommand;
  -[AXSSKeyboardCommand description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSKeyboardCommand type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSSKeyboardCommand standardCommandIdentifier](self, "standardCommandIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - type: %@, command identifier: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)standardCommandIdentifier
{
  return self->_standardCommandIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
