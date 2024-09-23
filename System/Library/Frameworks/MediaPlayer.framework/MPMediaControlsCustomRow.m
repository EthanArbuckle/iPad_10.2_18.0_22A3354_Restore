@implementation MPMediaControlsCustomRow

- (void)encodeWithCoder:(id)a3
{
  UTType *type;
  void *v5;
  id v6;

  type = self->_type;
  v6 = a3;
  -[UTType identifier](type, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("type"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_titleOverride, CFSTR("titleOverride"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (MPMediaControlsCustomRow)initWithCoder:(id)a3
{
  id v4;
  MPMediaControlsCustomRow *v5;
  void *v6;
  uint64_t v7;
  UTType *type;
  uint64_t v9;
  NSString *titleOverride;
  uint64_t v11;
  NSString *identifier;
  MPMediaControlsCustomRow *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPMediaControlsCustomRow;
  v5 = -[MPMediaControlsCustomRow init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (UTType *)v7;

    if (!v5->_type)
    {

      v13 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleOverride"));
    v9 = objc_claimAutoreleasedReturnValue();
    titleOverride = v5->_titleOverride;
    v5->_titleOverride = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

  }
  v13 = v5;
LABEL_6:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[MPMediaControlsCustomRow rowWithType:titleOverride:identifier:](MPMediaControlsCustomRow, "rowWithType:titleOverride:identifier:", self->_type, self->_titleOverride, self->_identifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  MPMediaControlsCustomRow *v4;
  MPMediaControlsCustomRow *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;

  v4 = (MPMediaControlsCustomRow *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MPMediaControlsCustomRow type](v5, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqual:", self->_type);

      -[MPMediaControlsCustomRow titleOverride](v5, "titleOverride");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 & objc_msgSend(v8, "isEqualToString:", self->_titleOverride);

      -[MPMediaControlsCustomRow identifier](v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v9 & objc_msgSend(v10, "isEqualToString:", self->_identifier);
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UTType)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)titleOverride
{
  return self->_titleOverride;
}

- (void)setTitleOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleOverride, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)rowWithType:(id)a3 titleOverride:(id)a4 identifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  MPMediaControlsCustomRow *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(MPMediaControlsCustomRow);
  -[MPMediaControlsCustomRow setType:](v10, "setType:", v9);

  -[MPMediaControlsCustomRow setTitleOverride:](v10, "setTitleOverride:", v8);
  -[MPMediaControlsCustomRow setIdentifier:](v10, "setIdentifier:", v7);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
