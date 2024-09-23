@implementation INHomeAutomationFromEntity

- (INHomeAutomationFromEntity)initWithValue:(id)a3 type:(int64_t)a4
{
  id v6;
  INHomeAutomationFromEntity *v7;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INHomeAutomationFromEntity;
  v7 = -[INHomeAutomationFromEntity init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    value = v7->_value;
    v7->_value = (NSString *)v8;

    v7->_type = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_value, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  INHomeAutomationFromEntity *v4;
  INHomeAutomationFromEntity *v5;
  NSString *value;
  BOOL v7;

  v4 = (INHomeAutomationFromEntity *)a3;
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
      v7 = (value == v5->_value || -[NSString isEqual:](value, "isEqual:")) && self->_type == v5->_type;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (INHomeAutomationFromEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  INHomeAutomationFromEntity *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));

  v7 = -[INHomeAutomationFromEntity initWithValue:type:](self, "initWithValue:type:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("value"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_value);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("value"));
  v9 = self->_type - 1;
  if (v9 > 2)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E2295320[v9];
  v11 = v10;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("type"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INHomeAutomationFromEntity descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INHomeAutomationFromEntity;
  -[INHomeAutomationFromEntity description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INHomeAutomationFromEntity _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *value;
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
  v8[1] = CFSTR("type");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!value)
  return v6;
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)type
{
  return self->_type;
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
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = INHomeAutomationEntityTypeWithString(v12);

    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:type:", v11, v13);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
