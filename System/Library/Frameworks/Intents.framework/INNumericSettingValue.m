@implementation INNumericSettingValue

- (INNumericSettingValue)initWithValue:(id)a3 unit:(int64_t)a4
{
  id v6;
  INNumericSettingValue *v7;
  uint64_t v8;
  NSNumber *value;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INNumericSettingValue;
  v7 = -[INNumericSettingValue init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    value = v7->_value;
    v7->_value = (NSNumber *)v8;

    v7->_unit = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSNumber hash](self->_value, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_unit);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  INNumericSettingValue *v4;
  INNumericSettingValue *v5;
  NSNumber *value;
  BOOL v7;

  v4 = (INNumericSettingValue *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      value = self->_value;
      v7 = (value == v5->_value || -[NSNumber isEqual:](value, "isEqual:")) && self->_unit == v5->_unit;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INNumericSettingValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  INNumericSettingValue *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("unit"));

  v7 = -[INNumericSettingValue initWithValue:unit:](self, "initWithValue:unit:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("value"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_unit, CFSTR("unit"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("value"));
  if (self->_unit == 1)
    v9 = CFSTR("percentage");
  else
    v9 = CFSTR("unknown");
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("unit"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INNumericSettingValue descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INNumericSettingValue;
  -[INNumericSettingValue description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INNumericSettingValue _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSNumber *value;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("value");
  value = self->_value;
  v4 = value;
  if (!value)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[1] = CFSTR("unit");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_unit);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!value)
  return v6;
}

- (NSNumber)value
{
  return self->_value;
}

- (int64_t)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("unit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("percentage"));

    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:unit:", v7, v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
