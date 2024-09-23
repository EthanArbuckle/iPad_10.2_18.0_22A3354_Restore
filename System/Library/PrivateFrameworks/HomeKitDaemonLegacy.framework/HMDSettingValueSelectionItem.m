@implementation HMDSettingValueSelectionItem

- (HMDSettingValueSelectionItem)initWithIdentifier:(id)a3 selection:(id)a4
{
  id v7;
  id v8;
  HMDSettingValueSelectionItem *v9;
  HMDSettingValueSelectionItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSettingValueSelectionItem;
  v9 = -[HMDSettingValueSelectionItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_selection, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMDSettingValueSelectionItem *v4;
  HMDSettingValueSelectionItem *v5;
  HMDSettingValueSelectionItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMDSettingValueSelectionItem *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDSettingValueSelectionItem identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingValueSelectionItem identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[HMDSettingValueSelectionItem selection](self, "selection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSettingValueSelectionItem selection](v6, "selection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDSettingValueSelectionItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)selection
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
