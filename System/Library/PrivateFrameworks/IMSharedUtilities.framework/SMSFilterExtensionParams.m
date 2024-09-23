@implementation SMSFilterExtensionParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSFilterExtensionParams)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SMSFilterExtensionParams;
  return -[SMSFilterExtensionParams init](&v3, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[SMSFilterExtensionParams action](self, "action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("action"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSFilterExtensionParams subAction](self, "subAction"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("subAction"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSFilterExtensionParams filterMode](self, "filterMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("filterMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSFilterExtensionParams orderOfPlacementInUI](self, "orderOfPlacementInUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("orderOfPlacementInUI"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSFilterExtensionParams category](self, "category"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("category"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SMSFilterExtensionParams subCategory](self, "subCategory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("subCategory"));

  -[SMSFilterExtensionParams filterModeStringValue](self, "filterModeStringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("filterModeStringValue"));

  -[SMSFilterExtensionParams label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("label"));

  -[SMSFilterExtensionParams iconName](self, "iconName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("iconName"));

  -[SMSFilterExtensionParams folderName](self, "folderName");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("folderName"));

}

- (SMSFilterExtensionParams)initWithCoder:(id)a3
{
  id v4;
  SMSFilterExtensionParams *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SMSFilterExtensionParams;
  v5 = -[SMSFilterExtensionParams init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterExtensionParams setAction:](v5, "setAction:", objc_msgSend(v6, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subAction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterExtensionParams setSubAction:](v5, "setSubAction:", objc_msgSend(v7, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterExtensionParams setFilterMode:](v5, "setFilterMode:", objc_msgSend(v8, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orderOfPlacementInUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterExtensionParams setOrderOfPlacementInUI:](v5, "setOrderOfPlacementInUI:", objc_msgSend(v9, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterExtensionParams setCategory:](v5, "setCategory:", objc_msgSend(v10, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subCategory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterExtensionParams setSubCategory:](v5, "setSubCategory:", objc_msgSend(v11, "unsignedIntegerValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filterModeStringValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterExtensionParams setFilterModeStringValue:](v5, "setFilterModeStringValue:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterExtensionParams setLabel:](v5, "setLabel:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterExtensionParams setIconName:](v5, "setIconName:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("folderName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMSFilterExtensionParams setFolderName:](v5, "setFolderName:", v15);

  }
  return v5;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (unint64_t)subAction
{
  return self->_subAction;
}

- (void)setSubAction:(unint64_t)a3
{
  self->_subAction = a3;
}

- (unint64_t)filterMode
{
  return self->_filterMode;
}

- (void)setFilterMode:(unint64_t)a3
{
  self->_filterMode = a3;
}

- (unint64_t)orderOfPlacementInUI
{
  return self->_orderOfPlacementInUI;
}

- (void)setOrderOfPlacementInUI:(unint64_t)a3
{
  self->_orderOfPlacementInUI = a3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (unint64_t)subCategory
{
  return self->_subCategory;
}

- (void)setSubCategory:(unint64_t)a3
{
  self->_subCategory = a3;
}

- (NSString)filterModeStringValue
{
  return self->_filterModeStringValue;
}

- (void)setFilterModeStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_filterModeStringValue, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_storeStrong((id *)&self->_iconName, a3);
}

- (NSString)folderName
{
  return self->_folderName;
}

- (void)setFolderName:(id)a3
{
  objc_storeStrong((id *)&self->_folderName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_filterModeStringValue, 0);
}

@end
