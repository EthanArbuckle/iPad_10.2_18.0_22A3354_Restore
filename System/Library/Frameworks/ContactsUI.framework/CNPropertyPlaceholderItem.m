@implementation CNPropertyPlaceholderItem

- (CNPropertyPlaceholderItem)initWithProperty:(id)a3
{
  id v5;
  CNPropertyPlaceholderItem *v6;
  CNPropertyPlaceholderItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPropertyPlaceholderItem;
  v6 = -[CNPropertyPlaceholderItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_property, a3);

  return v7;
}

- (NSString)title
{
  void *v2;
  id v3;
  void *v4;

  -[CNPropertyPlaceholderItem property](self, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("birthdays")))
  {
    v3 = (id)*MEMORY[0x1E0C96670];

    v2 = v3;
  }
  CNUILocalizedStringForPropertyWithFormatKey(CFSTR("ADD_NEW_ITEM"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
  objc_storeStrong((id *)&self->_property, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
}

@end
