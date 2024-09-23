@implementation CNContactCardFieldSection

- (CNContactCardFieldSection)initWithSectionType:(id)a3 items:(id)a4
{
  return -[CNContactCardFieldSection initWithSectionType:items:displayTitle:](self, "initWithSectionType:items:displayTitle:", a3, a4, 0);
}

- (CNContactCardFieldSection)initWithSectionType:(id)a3 items:(id)a4 displayTitle:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNContactCardFieldSection *v12;
  CNContactCardFieldSection *v13;
  CNContactCardFieldSection *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNContactCardFieldSection;
  v12 = -[CNContactCardFieldSection init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sectionType, a3);
    objc_storeStrong((id *)&v13->_items, a4);
    objc_storeStrong((id *)&v13->_displayTitle, a5);
    v14 = v13;
  }

  return v13;
}

- (NSString)sectionType
{
  return self->_sectionType;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sectionType, 0);
}

@end
