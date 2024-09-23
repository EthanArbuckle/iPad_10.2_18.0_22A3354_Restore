@implementation CTNetwork

- (BOOL)isEqual:(id)a3
{
  CTNetwork *v4;
  CTNetwork *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (CTNetwork *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CTNetwork name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTNetwork name](v5, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7 || objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[CTNetwork plmn](self, "plmn");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTNetwork plmn](v5, "plmn");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9 || objc_msgSend(v8, "isEqualToString:", v9))
        {
          -[CTNetwork rat](self, "rat");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTNetwork rat](v5, "rat");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 == v11)
            v12 = 1;
          else
            v12 = objc_msgSend(v10, "isEqualToString:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTNetwork name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", name=%@"), v4);

  -[CTNetwork plmn](self, "plmn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", plmn=%@"), v5);

  -[CTNetwork rat](self, "rat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", rat=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTNetwork name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setName:", v6);

  -[CTNetwork plmn](self, "plmn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPlmn:", v8);

  -[CTNetwork rat](self, "rat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setRat:", v10);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CTNetwork name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[CTNetwork plmn](self, "plmn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("plmn"));

  -[CTNetwork rat](self, "rat");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("rat"));

}

- (CTNetwork)initWithCoder:(id)a3
{
  id v4;
  CTNetwork *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *plmn;
  uint64_t v10;
  NSString *rat;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTNetwork;
  v5 = -[CTNetwork init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plmn"));
    v8 = objc_claimAutoreleasedReturnValue();
    plmn = v5->_plmn;
    v5->_plmn = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rat"));
    v10 = objc_claimAutoreleasedReturnValue();
    rat = v5->_rat;
    v5->_rat = (NSString *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
  objc_storeStrong((id *)&self->_plmn, a3);
}

- (NSString)rat
{
  return self->_rat;
}

- (void)setRat:(id)a3
{
  objc_storeStrong((id *)&self->_rat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rat, 0);
  objc_storeStrong((id *)&self->_plmn, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
