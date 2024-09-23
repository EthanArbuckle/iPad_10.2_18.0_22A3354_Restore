@implementation AXCustomContent

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXCustomContent;
  return -[AXCustomContent init](&v3, sel_init);
}

+ (AXCustomContent)customContentWithLabel:(NSString *)label value:(NSString *)value
{
  NSString *v5;
  NSString *v6;
  AXCustomContent *v7;

  v5 = value;
  v6 = label;
  v7 = -[AXCustomContent init]([AXCustomContent alloc], "init");
  -[AXCustomContent setLabel:](v7, "setLabel:", v6);

  -[AXCustomContent setValue:](v7, "setValue:", v5);
  -[AXCustomContent setImportance:](v7, "setImportance:", 0);
  return v7;
}

+ (AXCustomContent)customContentWithAttributedLabel:(NSAttributedString *)label attributedValue:(NSAttributedString *)value
{
  NSAttributedString *v5;
  NSAttributedString *v6;
  AXCustomContent *v7;

  v5 = value;
  v6 = label;
  v7 = -[AXCustomContent init]([AXCustomContent alloc], "init");
  -[AXCustomContent setAttributedLabel:](v7, "setAttributedLabel:", v6);

  -[AXCustomContent setAttributedValue:](v7, "setAttributedValue:", v5);
  -[AXCustomContent setImportance:](v7, "setImportance:", 0);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AXCustomContent *v3;
  AXCustomContent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = self;
  v14.receiver = v3;
  v14.super_class = (Class)AXCustomContent;
  v4 = -[AXCustomContent init](&v14, sel_init);
  -[AXCustomContent label](v3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[AXCustomContent setLabel:](v4, "setLabel:", v6);

  -[AXCustomContent attributedLabel](v3, "attributedLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[AXCustomContent setAttributedLabel:](v4, "setAttributedLabel:", v8);

  -[AXCustomContent value](v3, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[AXCustomContent setValue:](v4, "setValue:", v10);

  -[AXCustomContent attributedValue](v3, "attributedValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[AXCustomContent setAttributedValue:](v4, "setAttributedValue:", v12);

  -[AXCustomContent setImportance:](v4, "setImportance:", -[AXCustomContent importance](v3, "importance"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AXCustomContent label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("label"));

  -[AXCustomContent attributedLabel](self, "attributedLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("attributedLabel"));

  -[AXCustomContent value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("value"));

  -[AXCustomContent attributedValue](self, "attributedValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("attributedValue"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[AXCustomContent importance](self, "importance"), CFSTR("importance"));
}

- (AXCustomContent)initWithCoder:(id)a3
{
  id v4;
  AXCustomContent *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (AXCustomContent *)-[AXCustomContent _init](self, "_init");
  v6 = (void *)MEMORY[0x24BDBCF20];
  v27[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("label"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCustomContent setLabel:](v5, "setLabel:", v9);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v26 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("attributedLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCustomContent setAttributedLabel:](v5, "setAttributedLabel:", v13);

  v14 = (void *)MEMORY[0x24BDBCF20];
  v25 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("value"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCustomContent setValue:](v5, "setValue:", v17);

  v18 = (void *)MEMORY[0x24BDBCF20];
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("attributedValue"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCustomContent setAttributedValue:](v5, "setAttributedValue:", v21);

  v22 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("importance"));
  -[AXCustomContent setImportance:](v5, "setImportance:", v22);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AXCustomContentImportance v13;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXCustomContent label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[AXCustomContent value](self, "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[AXCustomContent attributedLabel](self, "attributedLabel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "attributedLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[AXCustomContent attributedValue](self, "attributedValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "attributedValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            v13 = -[AXCustomContent importance](self, "importance");
            v14 = v13 == objc_msgSend(v4, "importance");
          }
          else
          {
            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)label
{
  NSString *label;
  NSAttributedString *attributedLabel;

  label = self->_label;
  if (label)
    return label;
  attributedLabel = self->_attributedLabel;
  if (!attributedLabel)
    return label;
  -[NSAttributedString string](attributedLabel, "string");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)value
{
  NSString *value;
  NSAttributedString *attributedValue;

  value = self->_value;
  if (value)
    return value;
  attributedValue = self->_attributedValue;
  if (!attributedValue)
    return value;
  -[NSAttributedString string](attributedValue, "string");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSAttributedString)attributedLabel
{
  NSAttributedString *attributedLabel;
  NSAttributedString *v3;

  attributedLabel = self->_attributedLabel;
  if (attributedLabel || !self->_label)
    v3 = attributedLabel;
  else
    v3 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", self->_label);
  return v3;
}

- (NSAttributedString)attributedValue
{
  NSAttributedString *attributedValue;
  NSAttributedString *v3;

  attributedValue = self->_attributedValue;
  if (attributedValue || !self->_value)
    v3 = attributedValue;
  else
    v3 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", self->_value);
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)AXCustomContent;
  -[AXCustomContent description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCustomContent label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCustomContent value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: label: %@, value: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setAttributedLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAttributedValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AXCustomContentImportance)importance
{
  return self->_importance;
}

- (void)setImportance:(AXCustomContentImportance)importance
{
  self->_importance = importance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_attributedLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
