@implementation DCCredentialElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
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
  id v17;

  v17 = a3;
  -[DCCredentialElement elementIdentifier](self, "elementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v4, 0x24C307888);

  -[DCCredentialElement stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DCCredentialElement stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v6, 0x24C307C68);

  }
  -[DCCredentialElement dateValue](self, "dateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DCCredentialElement dateValue](self, "dateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v8, 0x24C307C88);

  }
  -[DCCredentialElement dataValue](self, "dataValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[DCCredentialElement dataValue](self, "dataValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v10, 0x24C307CA8);

  }
  -[DCCredentialElement numberValue](self, "numberValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DCCredentialElement numberValue](self, "numberValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v12, 0x24C307CC8);

  }
  -[DCCredentialElement arrayValue](self, "arrayValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DCCredentialElement arrayValue](self, "arrayValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v14, 0x24C307CE8);

  }
  -[DCCredentialElement dictionaryValue](self, "dictionaryValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[DCCredentialElement dictionaryValue](self, "dictionaryValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v16, 0x24C307D08);

  }
  objc_msgSend(v17, "encodeInteger:forKey:", -[DCCredentialElement numericTypeHint](self, "numericTypeHint"), 0x24C307D28);

}

- (DCCredentialElement)initWithCoder:(id)a3
{
  id v3;
  DCCredentialElement *v4;
  uint64_t v5;
  NSString *elementIdentifier;
  uint64_t v7;
  NSString *stringValue;
  uint64_t v9;
  NSData *dataValue;
  uint64_t v11;
  NSDate *dateValue;
  uint64_t v13;
  NSNumber *numberValue;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSArray *arrayValue;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSDictionary *dictionaryValue;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)DCCredentialElement;
  v3 = a3;
  v4 = -[DCCredentialElement init](&v36, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307888);
  v5 = objc_claimAutoreleasedReturnValue();
  elementIdentifier = v4->_elementIdentifier;
  v4->_elementIdentifier = (NSString *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307C68);
  v7 = objc_claimAutoreleasedReturnValue();
  stringValue = v4->_stringValue;
  v4->_stringValue = (NSString *)v7;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307CA8);
  v9 = objc_claimAutoreleasedReturnValue();
  dataValue = v4->_dataValue;
  v4->_dataValue = (NSData *)v9;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307C88);
  v11 = objc_claimAutoreleasedReturnValue();
  dateValue = v4->_dateValue;
  v4->_dateValue = (NSDate *)v11;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307CC8);
  v13 = objc_claimAutoreleasedReturnValue();
  numberValue = v4->_numberValue;
  v4->_numberValue = (NSNumber *)v13;

  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v22, 0x24C307CE8);
  v23 = objc_claimAutoreleasedReturnValue();
  arrayValue = v4->_arrayValue;
  v4->_arrayValue = (NSArray *)v23;

  v25 = (void *)MEMORY[0x24BDBCF20];
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, v27, v28, v29, v30, v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v32, 0x24C307D08);
  v33 = objc_claimAutoreleasedReturnValue();
  dictionaryValue = v4->_dictionaryValue;
  v4->_dictionaryValue = (NSDictionary *)v33;

  LODWORD(v32) = objc_msgSend(v3, "decodeIntForKey:", 0x24C307D28);
  v4->_numericTypeHint = (int)v32;
  return v4;
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4 dataValue:(id)a5 dateValue:(id)a6 numberValue:(id)a7 arrayValue:(id)a8 dictionaryValue:(id)a9 numericTypeHint:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  DCCredentialElement *v23;
  uint64_t v24;
  NSString *elementIdentifier;
  uint64_t v26;
  NSString *stringValue;
  uint64_t v28;
  NSDate *dateValue;
  uint64_t v30;
  NSData *dataValue;
  uint64_t v32;
  NSNumber *numberValue;
  uint64_t v34;
  NSArray *arrayValue;
  uint64_t v36;
  NSDictionary *dictionaryValue;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)DCCredentialElement;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = -[DCCredentialElement init](&v39, sel_init);
  v24 = objc_msgSend(v22, "copy");

  elementIdentifier = v23->_elementIdentifier;
  v23->_elementIdentifier = (NSString *)v24;

  v26 = objc_msgSend(v21, "copy");
  stringValue = v23->_stringValue;
  v23->_stringValue = (NSString *)v26;

  v28 = objc_msgSend(v19, "copy");
  dateValue = v23->_dateValue;
  v23->_dateValue = (NSDate *)v28;

  v30 = objc_msgSend(v20, "copy");
  dataValue = v23->_dataValue;
  v23->_dataValue = (NSData *)v30;

  v32 = objc_msgSend(v18, "copy");
  numberValue = v23->_numberValue;
  v23->_numberValue = (NSNumber *)v32;

  v34 = objc_msgSend(v17, "copy");
  arrayValue = v23->_arrayValue;
  v23->_arrayValue = (NSArray *)v34;

  v36 = objc_msgSend(v16, "copy");
  dictionaryValue = v23->_dictionaryValue;
  v23->_dictionaryValue = (NSDictionary *)v36;

  v23->_numericTypeHint = a10;
  return v23;
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3
{
  return -[DCCredentialElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:", a3, 0, 0, 0, 0, 0, 0, 0);
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 stringValue:(id)a4
{
  return -[DCCredentialElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:", a3, a4, 0, 0, 0, 0, 0, 0);
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 dataValue:(id)a4
{
  return -[DCCredentialElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:", a3, 0, a4, 0, 0, 0, 0, 0);
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 dateValue:(id)a4
{
  return -[DCCredentialElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:", a3, 0, 0, a4, 0, 0, 0, 0);
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 arrayValue:(id)a4
{
  return -[DCCredentialElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:", a3, 0, 0, 0, 0, a4, 0, 0);
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 dictionaryValue:(id)a4
{
  return -[DCCredentialElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:", a3, 0, 0, 0, 0, 0, a4, 0);
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 intValue:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  DCCredentialElement *v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DCCredentialElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:", v7, 0, 0, 0, v8, 0, 0, 1);

  return v9;
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 doubleValue:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  DCCredentialElement *v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DCCredentialElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:", v7, 0, 0, 0, v8, 0, 0, 2);

  return v9;
}

- (DCCredentialElement)initWithElementIdentifier:(id)a3 BOOLValue:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  DCCredentialElement *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[DCCredentialElement initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:](self, "initWithElementIdentifier:stringValue:dataValue:dateValue:numberValue:arrayValue:dictionaryValue:numericTypeHint:", v7, 0, 0, 0, v8, 0, 0, 3);

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  -[DCCredentialElement stringValue](self, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[DCCredentialElement elementIdentifier](self, "elementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCCredentialElement stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("DCCredentialElement identifier = %@; string value = %@"), v5, v6);
  }
  else
  {
    -[DCCredentialElement dateValue](self, "dateValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      -[DCCredentialElement elementIdentifier](self, "elementIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[DCCredentialElement dateValue](self, "dateValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("DCCredentialElement identifier = %@; date value = %@"), v5, v6);
    }
    else
    {
      -[DCCredentialElement dataValue](self, "dataValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        -[DCCredentialElement elementIdentifier](self, "elementIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[DCCredentialElement dataValue](self, "dataValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("DCCredentialElement identifier = %@; data value = %@"), v5, v6);
      }
      else
      {
        -[DCCredentialElement numberValue](self, "numberValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = (void *)MEMORY[0x24BDD17C8];
          -[DCCredentialElement elementIdentifier](self, "elementIdentifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[DCCredentialElement numberValue](self, "numberValue");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          DCCredentialElementNumericTypeHintToString(-[DCCredentialElement numericTypeHint](self, "numericTypeHint"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringWithFormat:", CFSTR("DCCredentialElement identifier = %@; number value = %@, type hint = %@"),
            v5,
            v6,
            v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_8;
        }
        -[DCCredentialElement arrayValue](self, "arrayValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (void *)MEMORY[0x24BDD17C8];
          -[DCCredentialElement elementIdentifier](self, "elementIdentifier");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[DCCredentialElement arrayValue](self, "arrayValue");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("DCCredentialElement identifier = %@; array value = %@"), v5, v6);
        }
        else
        {
          -[DCCredentialElement dictionaryValue](self, "dictionaryValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = (void *)MEMORY[0x24BDD17C8];
          -[DCCredentialElement elementIdentifier](self, "elementIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();
          v5 = (void *)v20;
          if (!v18)
          {
            objc_msgSend(v19, "stringWithFormat:", CFSTR("DCCredentialElement identifier = %@; no value"), v20);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
          -[DCCredentialElement dictionaryValue](self, "dictionaryValue");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("DCCredentialElement identifier = %@; dictionary value = %@"),
            v5,
            v6);
        }
      }
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_9:
  return v11;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (NSArray)arrayValue
{
  return self->_arrayValue;
}

- (NSDictionary)dictionaryValue
{
  return self->_dictionaryValue;
}

- (unint64_t)numericTypeHint
{
  return self->_numericTypeHint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryValue, 0);
  objc_storeStrong((id *)&self->_arrayValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
}

@end
