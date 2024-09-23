@implementation INWellnessMetadataPair

- (INWellnessMetadataPair)initWithNumber:(id)a3 key:(id)a4
{
  id v7;
  id v8;
  INWellnessMetadataPair *v9;
  INWellnessMetadataPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INWellnessMetadataPair;
  v9 = -[INWellnessMetadataPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a4);
    objc_storeStrong((id *)&v10->_numberValue, a3);
  }

  return v10;
}

- (INWellnessMetadataPair)initWithString:(id)a3 key:(id)a4
{
  id v7;
  id v8;
  INWellnessMetadataPair *v9;
  INWellnessMetadataPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INWellnessMetadataPair;
  v9 = -[INWellnessMetadataPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a4);
    objc_storeStrong((id *)&v10->_stringValue, a3);
  }

  return v10;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_key, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSNumber *numberValue;
  NSString *stringValue;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v8 = 0;
    if (-[NSString isEqualToString:](self->_key, "isEqualToString:", v5[1]))
    {
      numberValue = self->_numberValue;
      if (!numberValue || -[NSNumber isEqualToNumber:](numberValue, "isEqualToNumber:", v5[2]))
      {
        stringValue = self->_stringValue;
        if (!stringValue || -[NSString isEqualToString:](stringValue, "isEqualToString:", v5[3]))
          v8 = 1;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (INWellnessMetadataPair)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  INWellnessMetadataPair *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc((Class)objc_opt_class());
  if (v7)
    v9 = objc_msgSend(v8, "initWithString:key:", v7, v5);
  else
    v9 = objc_msgSend(v8, "initWithNumber:key:", v6, v5);
  v10 = (INWellnessMetadataPair *)v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", key, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_numberValue, CFSTR("numberValue"));

}

- (id)description
{
  return -[INWellnessMetadataPair descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INWellnessMetadataPair;
  -[INWellnessMetadataPair description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INWellnessMetadataPair _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *stringValue;
  NSString *key;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  NSNumber *numberValue;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  stringValue = self->_stringValue;
  if (stringValue)
  {
    key = self->_key;
    v9[0] = CFSTR("key");
    v9[1] = CFSTR("value");
    v10[0] = key;
    v10[1] = stringValue;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v10;
    v6 = v9;
  }
  else
  {
    v11[0] = CFSTR("key");
    v11[1] = CFSTR("value");
    numberValue = self->_numberValue;
    v12[0] = self->_key;
    v12[1] = numberValue;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = v12;
    v6 = v11;
  }
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)key
{
  return self->_key;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
