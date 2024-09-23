@implementation CTSIMToolkitItem

- (CTSIMToolkitItem)initWithText:(id)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CTSIMToolkitItem *v7;
  void *v8;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CTSIMToolkitItem;
  v7 = -[CTSIMToolkitItem init](&v10, sel_init);
  if (v7)
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    -[CTSIMToolkitItem setText:](v7, "setText:", v8);

    -[CTSIMToolkitItem setSelected:](v7, "setSelected:", v4);
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSIMToolkitItem text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", Text=%@"), v4);

  v5 = -[CTSIMToolkitItem selected](self, "selected");
  v6 = CFSTR("No");
  if (v5)
    v6 = CFSTR("Yes");
  objc_msgSend(v3, "appendFormat:", CFSTR(", Selected=%@"), v6);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[CTSIMToolkitItem text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithText:selected:", v6, -[CTSIMToolkitItem selected](self, "selected"));

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTSIMToolkitItem text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kTextKey"));

  objc_msgSend(v5, "encodeBool:forKey:", -[CTSIMToolkitItem selected](self, "selected"), CFSTR("kSelectedKey"));
}

- (CTSIMToolkitItem)initWithCoder:(id)a3
{
  id v4;
  CTSIMToolkitItem *v5;
  uint64_t v6;
  NSString *text;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTSIMToolkitItem;
  v5 = -[CTSIMToolkitItem init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kTextKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_selected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kSelectedKey"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
