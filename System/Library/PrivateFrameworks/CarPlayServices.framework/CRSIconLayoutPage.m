@implementation CRSIconLayoutPage

- (CRSIconLayoutPage)initWithIcons:(id)a3
{
  id v4;
  CRSIconLayoutPage *v5;
  uint64_t v6;
  NSArray *icons;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRSIconLayoutPage;
  v5 = -[CRSIconLayoutPage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    icons = v5->_icons;
    v5->_icons = (NSArray *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v9.receiver = self;
  v9.super_class = (Class)CRSIconLayoutPage;
  -[CRSIconLayoutPage description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRSIconLayoutPage icons](self, "icons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@"), v7);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRSIconLayoutPage)initWithCoder:(id)a3
{
  id v4;
  CRSIconLayoutPage *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *icons;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRSIconLayoutPage;
  v5 = -[CRSIconLayoutPage init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("CRSIconLayoutPageIcons"));
    v9 = objc_claimAutoreleasedReturnValue();
    icons = v5->_icons;
    v5->_icons = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSIconLayoutPage icons](self, "icons");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CRSIconLayoutPageIcons"));

}

- (NSArray)icons
{
  return self->_icons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
}

@end
