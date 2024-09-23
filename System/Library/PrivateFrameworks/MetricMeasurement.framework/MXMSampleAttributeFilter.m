@implementation MXMSampleAttributeFilter

- (NSSet)stringValues
{
  void *v3;

  if (-[MXMSampleAttribute valueType](self, "valueType") == 1 && -[MXMSampleAttributeFilter finite](self, "finite"))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", self->_matchingStringAttributeValues);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSSet *)v3;
}

- (NSSet)numericValues
{
  void *v3;

  if (-[MXMSampleAttribute valueType](self, "valueType") == 2 && -[MXMSampleAttributeFilter finite](self, "finite"))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", self->_matchingNumericAttributeValues);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSSet *)v3;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  void *v5;

  -[MXMSampleAttributeFilter stringValues](self, "stringValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[MXMSampleAttributeFilter stringValues](self, "stringValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSNumber)numericValue
{
  void *v3;
  void *v4;
  void *v5;

  -[MXMSampleAttributeFilter numericValues](self, "numericValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[MXMSampleAttributeFilter numericValues](self, "numericValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (id)value
{
  int64_t v3;
  void *v4;

  v3 = -[MXMSampleAttribute valueType](self, "valueType");
  if (v3 == 2)
  {
    -[MXMSampleAttributeFilter numericValue](self, "numericValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    -[MXMSampleAttributeFilter stringValue](self, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSSet)values
{
  int64_t v3;
  void *v4;

  v3 = -[MXMSampleAttribute valueType](self, "valueType");
  if (v3 == 2)
  {
    -[MXMSampleAttributeFilter numericValues](self, "numericValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    -[MXMSampleAttributeFilter stringValues](self, "stringValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSSet *)v4;
}

- (BOOL)finite
{
  return 1;
}

- (MXMSampleAttributeFilter)initWithAttribute:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  MXMSampleAttributeFilter *v10;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "valueType");
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MXMSampleAttributeFilter initWithAttributeName:valueType:value:](self, "initWithAttributeName:valueType:value:", v5, v6, v9);

  return v10;
}

- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 stringValue:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  MXMSampleAttributeFilter *v9;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a3;
  objc_msgSend(v6, "setWithObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MXMSampleAttributeFilter initWithAttributeName:stringValues:](self, "initWithAttributeName:stringValues:", v7, v8);

  return v9;
}

- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 stringValues:(id)a4
{
  return -[MXMSampleAttributeFilter initWithAttributeName:valueType:value:](self, "initWithAttributeName:valueType:value:", a3, 1, a4);
}

- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 numericValue:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  MXMSampleAttributeFilter *v9;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a3;
  objc_msgSend(v6, "setWithObject:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MXMSampleAttributeFilter initWithAttributeName:numericValues:](self, "initWithAttributeName:numericValues:", v7, v8);

  return v9;
}

- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 numericValues:(id)a4
{
  return -[MXMSampleAttributeFilter initWithAttributeName:valueType:value:](self, "initWithAttributeName:valueType:value:", a3, 2, a4);
}

- (MXMSampleAttributeFilter)initWithAttributeName:(id)a3 valueType:(int64_t)a4 value:(id)a5
{
  id v8;
  MXMSampleAttributeFilter *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MXMSampleAttributeFilter;
  v9 = -[MXMSampleAttribute initWithAttributeName:valueType:value:](&v14, sel_initWithAttributeName_valueType_value_, a3, a4, 0);
  if (v9)
  {
    if (a4 == 2)
    {
      objc_msgSend(v8, "allObjects");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = 40;
      goto LABEL_6;
    }
    if (a4 == 1)
    {
      objc_msgSend(v8, "allObjects");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = 32;
LABEL_6:
      v12 = *(Class *)((char *)&v9->super.super.isa + v11);
      *(Class *)((char *)&v9->super.super.isa + v11) = (Class)v10;

    }
  }

  return v9;
}

- (BOOL)_matchesSampleAttributeValueWithValue:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MXMSampleAttributeFilter values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)_matchesSampleAttributeValueTypeWithAttributeValueType:(int64_t)a3
{
  return -[MXMSampleAttribute valueType](self, "valueType") == a3;
}

- (BOOL)_matchesSampleAttributeNameWithName:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[MXMSampleAttribute name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)matchesSampleWithAttribute:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MXMSampleAttributeFilter _matchesSampleAttributeNameWithName:](self, "_matchesSampleAttributeNameWithName:", v5)&& -[MXMSampleAttributeFilter _matchesSampleAttributeValueTypeWithAttributeValueType:](self, "_matchesSampleAttributeValueTypeWithAttributeValueType:", objc_msgSend(v4, "valueType")))
  {
    objc_msgSend(v4, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MXMSampleAttributeFilter _matchesSampleAttributeValueWithValue:](self, "_matchesSampleAttributeValueWithValue:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copy
{
  return -[MXMSampleAttributeFilter copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MXMSampleAttributeFilter *v4;
  void *v5;
  int64_t v6;
  void *v7;
  MXMSampleAttributeFilter *v8;

  v4 = [MXMSampleAttributeFilter alloc];
  -[MXMSampleAttribute name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MXMSampleAttribute valueType](self, "valueType");
  -[MXMSampleAttributeFilter values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MXMSampleAttributeFilter initWithAttributeName:valueType:value:](v4, "initWithAttributeName:valueType:value:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXMSampleAttributeFilter;
  v4 = a3;
  -[MXMSampleAttribute encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchingStringAttributeValues, CFSTR("matchingStrings"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchingNumericAttributeValues, CFSTR("matchingNumerics"));

}

- (MXMSampleAttributeFilter)initWithCoder:(id)a3
{
  id v4;
  MXMSampleAttributeFilter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *matchingStringAttributeValues;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *matchingNumericAttributeValues;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MXMSampleAttributeFilter;
  v5 = -[MXMSampleAttribute initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("matchingStrings"));
    v9 = objc_claimAutoreleasedReturnValue();
    matchingStringAttributeValues = v5->_matchingStringAttributeValues;
    v5->_matchingStringAttributeValues = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("matchingNumerics"));
    v14 = objc_claimAutoreleasedReturnValue();
    matchingNumericAttributeValues = v5->_matchingNumericAttributeValues;
    v5->_matchingNumericAttributeValues = (NSArray *)v14;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingNumericAttributeValues, 0);
  objc_storeStrong((id *)&self->_matchingStringAttributeValues, 0);
}

@end
