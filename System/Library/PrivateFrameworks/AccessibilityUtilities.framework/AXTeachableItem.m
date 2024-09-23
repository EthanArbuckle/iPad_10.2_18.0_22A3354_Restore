@implementation AXTeachableItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[AXTeachableItem itemTitle](self, "itemTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("itemTitle"));

  -[AXTeachableItem itemDescription](self, "itemDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("itemDescription"));

  -[AXTeachableItem feature](self, "feature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("feature"));

  -[AXTeachableItem version](self, "version");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("version"));

}

- (AXTeachableItem)initWithCoder:(id)a3
{
  id v4;
  AXTeachableItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (AXTeachableItem *)objc_opt_new();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTeachableItem setItemTitle:](v5, "setItemTitle:", v6);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTeachableItem setItemDescription:](v5, "setItemDescription:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feature"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXTeachableItem setFeature:](v5, "setFeature:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXTeachableItem setVersion:](v5, "setVersion:", v9);
  return v5;
}

- (NSString)itemTitle
{
  return self->_itemTitle;
}

- (void)setItemTitle:(id)a3
{
  objc_storeStrong((id *)&self->_itemTitle, a3);
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
  objc_storeStrong((id *)&self->_itemDescription, a3);
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  objc_storeStrong((id *)&self->_feature, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_itemTitle, 0);
}

@end
