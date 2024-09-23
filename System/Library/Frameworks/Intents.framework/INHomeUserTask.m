@implementation INHomeUserTask

- (INHomeUserTask)initWithTaskType:(int64_t)a3 attribute:(int64_t)a4 value:(id)a5
{
  id v8;
  INHomeUserTask *v9;
  INHomeUserTask *v10;
  uint64_t v11;
  INHomeAttributeValue *value;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)INHomeUserTask;
  v9 = -[INHomeUserTask init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_taskType = a3;
    v9->_attribute = a4;
    v11 = objc_msgSend(v8, "copy");
    value = v10->_value;
    v10->_value = (INHomeAttributeValue *)v11;

  }
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_taskType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_attribute);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[INHomeAttributeValue hash](self->_value, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  INHomeUserTask *v4;
  INHomeUserTask *v5;
  INHomeUserTask *v6;
  INHomeAttributeValue *value;
  BOOL v8;

  v4 = (INHomeUserTask *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      v8 = 0;
      if (self->_taskType == v5->_taskType && self->_attribute == v5->_attribute)
      {
        value = self->_value;
        if (value == v6->_value || -[INHomeAttributeValue isEqual:](value, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INHomeUserTask)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  INHomeUserTask *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("taskType"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("attribute"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[INHomeUserTask initWithTaskType:attribute:value:](self, "initWithTaskType:attribute:value:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t taskType;
  id v5;

  taskType = self->_taskType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", taskType, CFSTR("taskType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_attribute, CFSTR("attribute"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_taskType - 1;
  if (v8 > 5)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2293808[v8];
  v10 = v9;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("taskType"));

  v11 = self->_attribute - 1;
  if (v11 > 0x41)
    v12 = CFSTR("unknown");
  else
    v12 = off_1E228B0B8[v11];
  v13 = v12;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("attribute"));

  objc_msgSend(v6, "encodeObject:", self->_value);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("value"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INHomeUserTask descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INHomeUserTask;
  -[INHomeUserTask description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INHomeUserTask _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  INHomeAttributeValue *value;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("taskType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_taskType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("attribute");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_attribute);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("value");
  value = self->_value;
  v6 = value;
  if (!value)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!value)

  return v7;
}

- (int64_t)taskType
{
  return self->_taskType;
}

- (int64_t)attribute
{
  return self->_attribute;
}

- (INHomeAttributeValue)value
{
  return self->_value;
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
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("taskType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = INHomeUserTaskTypeWithString(v9);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("attribute"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = INHomeAttributeTypeWithString(v11);

    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTaskType:attribute:value:", v10, v12, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
