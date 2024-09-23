@implementation HFTVInputControlItemValue

- (HFTVInputControlItemValue)initWithInputName:(id)a3 identifier:(id)a4 isHidden:(BOOL)a5 isSelected:(BOOL)a6
{
  id v10;
  id v11;
  HFTVInputControlItemValue *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSNumber *identifier;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFTVInputControlItemValue;
  v12 = -[HFTVInputControlItemValue init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSNumber *)v15;

    v12->_isHidden = a5;
    v12->_isSelected = a6;
  }

  return v12;
}

- (BOOL)isConfigured
{
  return !-[HFTVInputControlItemValue isHidden](self, "isHidden");
}

+ (id)valueWithInputName:(id)a3 identifier:(id)a4 isHidden:(BOOL)a5 isSelected:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;

  v6 = a6;
  v7 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInputName:identifier:isHidden:isSelected:", v10, v9, v7, v6);

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTVInputControlItemValue name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[HFTVInputControlItemValue identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFTVInputControlItemValue isHidden](self, "isHidden"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFTVInputControlItemValue isSelected](self, "isSelected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  v11 = objc_msgSend(v3, "hash");
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HFTVInputControlItemValue *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  int v13;
  _BOOL4 v14;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7 == self)
  {
    LOBYTE(v13) = 1;
  }
  else if (v7)
  {
    -[HFTVInputControlItemValue name](v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTVInputControlItemValue name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v9))
    {
      -[HFTVInputControlItemValue identifier](v7, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFTVInputControlItemValue identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToNumber:", v11)
        && (v12 = -[HFTVInputControlItemValue isHidden](v7, "isHidden"),
            v12 == -[HFTVInputControlItemValue isHidden](self, "isHidden")))
      {
        v14 = -[HFTVInputControlItemValue isSelected](v7, "isSelected");
        v13 = v14 ^ -[HFTVInputControlItemValue isSelected](self, "isSelected") ^ 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTVInputControlItemValue name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("inputName"));

  -[HFTVInputControlItemValue identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", objc_msgSend(v5, "integerValue"), CFSTR("identifier"));

  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFTVInputControlItemValue isHidden](self, "isHidden"), CFSTR("isHidden"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFTVInputControlItemValue isSelected](self, "isSelected"), CFSTR("isSelected"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_class();
  -[HFTVInputControlItemValue name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTVInputControlItemValue identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueWithInputName:identifier:isHidden:isSelected:", v5, v6, -[HFTVInputControlItemValue isHidden](self, "isHidden"), -[HFTVInputControlItemValue isSelected](self, "isSelected"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
