@implementation CNContactCardFieldItem

- (CNContactCardFieldItem)initWithGroupItem:(id)a3
{
  id v5;
  CNContactCardFieldItem *v6;
  CNContactCardFieldItem *v7;
  uint64_t v8;
  NSString *displayLabel;
  uint64_t v10;
  NSString *displayValue;
  CNContactCardFieldItem *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNContactCardFieldItem;
  v6 = -[CNContactCardFieldItem init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_groupItem, a3);
    objc_msgSend(v5, "displayLabel");
    v8 = objc_claimAutoreleasedReturnValue();
    displayLabel = v7->_displayLabel;
    v7->_displayLabel = (NSString *)v8;

    objc_msgSend(v5, "displayValue");
    v10 = objc_claimAutoreleasedReturnValue();
    displayValue = v7->_displayValue;
    v7->_displayValue = (NSString *)v10;

    v12 = v7;
  }

  return v7;
}

- (CNContactCardFieldItem)initWithDisplayLabel:(id)a3
{
  id v5;
  CNContactCardFieldItem *v6;
  CNContactCardFieldItem *v7;
  CNContactCardFieldItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactCardFieldItem;
  v6 = -[CNContactCardFieldItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayLabel, a3);
    v8 = v7;
  }

  return v7;
}

- (CNPropertyGroupItem)groupItem
{
  return self->_groupItem;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (NSString)displayValue
{
  return self->_displayValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayValue, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_groupItem, 0);
}

+ (id)photoItem
{
  CNContactCardFieldItem *v2;
  void *v3;
  void *v4;
  CNContactCardFieldItem *v5;

  v2 = [CNContactCardFieldItem alloc];
  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PHOTO_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNContactCardFieldItem initWithDisplayLabel:](v2, "initWithDisplayLabel:", v4);

  return v5;
}

@end
