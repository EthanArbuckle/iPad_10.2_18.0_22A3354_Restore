@implementation CTUserLabel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTUserLabel)initWithLabel:(id)a3
{
  return -[CTUserLabel initWithKey:label:labelId:](self, "initWithKey:label:labelId:", &stru_1E9523D68, a3, 0);
}

- (CTUserLabel)initWithKey:(id)a3 label:(id)a4 labelId:(id)a5
{
  id v8;
  id v9;
  id v10;
  CTUserLabel *v11;
  uint64_t v12;
  NSString *label;
  uint64_t v14;
  NSString *key;
  uint64_t v16;
  NSString *labelId;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CTUserLabel;
  v11 = -[CTUserLabel init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v9, "copy");
    label = v11->_label;
    v11->_label = (NSString *)v12;

    v14 = objc_msgSend(v8, "copy");
    key = v11->_key;
    v11->_key = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    labelId = v11->_labelId;
    v11->_labelId = (NSString *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[NSString copy](self->_key, "copy");
  v6 = (void *)-[NSString copy](self->_label, "copy");
  v7 = (void *)-[NSString copy](self->_labelId, "copy");
  v8 = (void *)objc_msgSend(v4, "initWithKey:label:labelId:", v5, v6, v7);

  return v8;
}

- (CTUserLabel)initWithCoder:(id)a3
{
  id v4;
  CTUserLabel *v5;
  uint64_t v6;
  NSString *label;
  uint64_t v8;
  NSString *key;
  uint64_t v10;
  NSString *labelId;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTUserLabel;
  v5 = -[CTUserLabel init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("labelKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("labelIdKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    labelId = v5->_labelId;
    v5->_labelId = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("labelKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_labelId, CFSTR("labelIdKey"));

}

- (int64_t)indexInPredefinedLabels:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5 < 1)
  {
LABEL_5:
    v7 = -1;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTUserLabel key](self, "key");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v7)
        goto LABEL_5;
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *label;
  void *v7;
  NSString *key;
  void *v9;
  NSString *labelId;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    label = self->_label;
    objc_msgSend(v5, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](label, "isEqualToString:", v7))
    {
      key = self->_key;
      objc_msgSend(v5, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](key, "isEqualToString:", v9))
      {
        labelId = self->_labelId;
        objc_msgSend(v5, "labelId");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSString isEqual:](labelId, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_key, "hash");
  v4 = -[NSString hash](self->_label, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_labelId, "hash");
}

- (id)_labelKeyDescription
{
  __CFString *v3;

  if (-[NSString isEqualToString:](self->_key, "isEqualToString:", &stru_1E9523D68))
    v3 = CFSTR("Customized");
  else
    v3 = self->_key;
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CTUserLabel _labelKeyDescription](self, "_labelKeyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<userLabel: key:%@ label:%@ labelId:%@>"), v4, self->_label, self->_labelId);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)labelId
{
  return self->_labelId;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_labelId, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
