@implementation SHMediaLibraryLabel

- (SHMediaLibraryLabel)initWithName:(id)a3
{
  id v5;
  SHMediaLibraryLabel *v6;
  SHMediaLibraryLabel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHMediaLibraryLabel;
  v6 = -[SHMediaLibraryLabel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (int64_t)type
{
  void *v2;
  int v3;

  -[SHMediaLibraryLabel name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("platform"));

  return v3 ^ 1u;
}

- (SHMediaLibraryLabel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SHMediaLibraryLabel *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHMediaLibraryLabelName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SHMediaLibraryLabel initWithName:](self, "initWithName:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("SHMediaLibraryLabelName"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SHMediaLibraryLabel *v5;
  void *v6;
  void *v7;
  SHMediaLibraryLabel *v8;

  v5 = +[SHMediaLibraryLabel allocWithZone:](SHMediaLibraryLabel, "allocWithZone:");
  -[SHMediaLibraryLabel name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[SHMediaLibraryLabel initWithName:](v5, "initWithName:", v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SHMediaLibraryLabel *v4;
  BOOL v5;

  v4 = (SHMediaLibraryLabel *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[SHMediaLibraryLabel isEqualLabel:](self, "isEqualLabel:", v4);
  }

  return v5;
}

- (BOOL)isEqualLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[SHMediaLibraryLabel name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToString:", v8);

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SHMediaLibraryLabel name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
