@implementation CTSIMToolkitMenu

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSIMToolkitMenu title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Title=%@"), v4);

  -[CTSIMToolkitMenu subTitles](self, "subTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", SubTitlesCount=%lu"), objc_msgSend(v5, "count"));

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTSIMToolkitMenu title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setTitle:", v7);

  -[CTSIMToolkitMenu subTitles](self, "subTitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setSubTitles:", v9);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CTSIMToolkitMenu title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kTitleKey"));

  -[CTSIMToolkitMenu subTitles](self, "subTitles");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSubTitlesKey"));

}

- (CTSIMToolkitMenu)initWithCoder:(id)a3
{
  id v4;
  CTSIMToolkitMenu *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *subTitles;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSIMToolkitMenu;
  v5 = -[CTSIMToolkitMenu init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTitleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kSubTitlesKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    subTitles = v5->_subTitles;
    v5->_subTitles = (NSArray *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSArray)subTitles
{
  return self->_subTitles;
}

- (void)setSubTitles:(id)a3
{
  objc_storeStrong((id *)&self->_subTitles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTitles, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
