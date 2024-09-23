@implementation LSSpotlightAction

+ (id)new
{
  abort();
}

- (LSSpotlightAction)init
{
  abort();
}

- (id)_initWithIdentifier:(id)a3 unlocalizedTitle:(id)a4 symbolImageName:(id)a5
{
  LSSpotlightAction *v8;
  id *p_isa;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)LSSpotlightAction;
  v8 = -[LSSpotlightAction init](&v11, sel_init);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }
  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[LSSpotlightAction isEqualToSpotlightAction:](self, "isEqualToSpotlightAction:", a3);
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[LSSpotlightAction identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LSSpotlightAction unlocalizedTitle](self, "unlocalizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[LSSpotlightAction symbolImageName](self, "symbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ v4 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[LSSpotlightAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSSpotlightAction unlocalizedTitle](self, "unlocalizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSSpotlightAction symbolImageName](self, "symbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> { identifier = %@, unlocalizedTitle = %@, symbolImageName = %@ }"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_unlocalizedTitle, CFSTR("unlocalizedTitle"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_symbolImageName, CFSTR("symbolImageName"));
}

- (LSSpotlightAction)initWithCoder:(id)a3
{
  LSSpotlightAction *v4;
  uint64_t v5;
  NSString *identifier;
  uint64_t v7;
  NSString *unlocalizedTitle;
  uint64_t v9;
  NSString *symbolImageName;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LSSpotlightAction;
  v4 = -[LSSpotlightAction init](&v12, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v5;

    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unlocalizedTitle"));
    v7 = objc_claimAutoreleasedReturnValue();
    unlocalizedTitle = v4->_unlocalizedTitle;
    v4->_unlocalizedTitle = (NSString *)v7;

    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolImageName"));
    v9 = objc_claimAutoreleasedReturnValue();
    symbolImageName = v4->_symbolImageName;
    v4->_symbolImageName = (NSString *)v9;

  }
  return v4;
}

- (BOOL)isEqualToSpotlightAction:(id)a3
{
  void *v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  -[LSSpotlightAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    -[LSSpotlightAction unlocalizedTitle](self, "unlocalizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "unlocalizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqual:", v9))
    {
      v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    -[LSSpotlightAction symbolImageName](self, "symbolImageName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 || (objc_msgSend(a3, "symbolImageName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[LSSpotlightAction symbolImageName](self, "symbolImageName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "symbolImageName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v13 = 1;
    }

    goto LABEL_11;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)unlocalizedTitle
{
  return self->_unlocalizedTitle;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_unlocalizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
