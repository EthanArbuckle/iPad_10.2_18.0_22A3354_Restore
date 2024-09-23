@implementation CNAccountsAndGroupsSection

- (NSString)title
{
  void *v3;
  void (**v4)(void);
  NSString *v5;
  NSString *title;

  if (!self->_title)
  {
    -[CNAccountsAndGroupsSection titleProvider](self, "titleProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CNAccountsAndGroupsSection titleProvider](self, "titleProvider");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      title = self->_title;
      self->_title = v5;

    }
  }
  return self->_title;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  -[CNAccountsAndGroupsSection identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNAccountsAndGroupsSection identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "hash");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNAccountsAndGroupsSection;
    v5 = -[CNAccountsAndGroupsSection hash](&v7, sel_hash);
  }

  return (unint64_t)v5;
}

- (BOOL)isEqual:(id)a3
{
  CNAccountsAndGroupsSection *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (CNAccountsAndGroupsSection *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[CNAccountsAndGroupsSection identifier](v4, "identifier"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      -[CNAccountsAndGroupsSection identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAccountsAndGroupsSection identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)isAllContactsGlobalSection
{
  return self->_isAllContactsGlobalSection;
}

- (void)setIsAllContactsGlobalSection:(BOOL)a3
{
  self->_isAllContactsGlobalSection = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (id)titleProvider
{
  return self->_titleProvider;
}

- (void)setTitleProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_titleProvider, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
