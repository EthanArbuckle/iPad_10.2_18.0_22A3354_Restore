@implementation DIAttributePickerItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedDisplayName;
  id v5;

  localizedDisplayName = self->_localizedDisplayName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedDisplayName, CFSTR("localizedDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (DIAttributePickerItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DIAttributePickerItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDisplayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[DIAttributePickerItem initWithName:value:](self, "initWithName:value:", v5, v6);
  return v7;
}

- (DIAttributePickerItem)initWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  DIAttributePickerItem *v8;
  uint64_t v9;
  NSString *localizedDisplayName;
  uint64_t v11;
  NSString *value;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    v14.receiver = self;
    v14.super_class = (Class)DIAttributePickerItem;
    v8 = -[DIAttributePickerItem init](&v14, sel_init);
    if (v8)
    {
      v9 = objc_msgSend(v6, "copy");
      localizedDisplayName = v8->_localizedDisplayName;
      v8->_localizedDisplayName = (NSString *)v9;

      v11 = objc_msgSend(v7, "copy");
      value = v8->_value;
      v8->_value = (NSString *)v11;

    }
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIAttributePickerItem localizedDisplayName](self, "localizedDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedDisplayName: '%@'; "), v4);

  -[DIAttributePickerItem value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("value: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end
