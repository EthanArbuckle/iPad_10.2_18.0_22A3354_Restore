@implementation HMDSettingSelectionItem

- (HMDSettingSelectionItem)initWithTitle:(id)a3
{
  id v4;
  HMDSettingSelectionItem *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *title;
  HMDSettingSelectionItem *v10;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDSettingSelectionItem;
    v5 = -[HMDSettingSelectionItem init](&v12, sel_init);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v6;

      v8 = objc_msgSend(v4, "copy");
      title = v5->_title;
      v5->_title = (NSString *)v8;

    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDSettingSelectionItem title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDSettingSelectionItem *v4;
  HMDSettingSelectionItem *v5;
  HMDSettingSelectionItem *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDSettingSelectionItem *)a3;
  if (self == v4)
  {
    v9 = 1;
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
      -[HMDSettingSelectionItem title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingSelectionItem title](v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDSettingSelectionItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingSelectionItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMDSettingSelectionItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDSettingSelectionItem *v6;
  uint64_t v7;
  NSUUID *identifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDSettingSelectionItem initWithTitle:](self, "initWithTitle:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMDSettingSelectionItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.identifier"));

  -[HMDSettingSelectionItem title](self, "title");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.title"));

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
