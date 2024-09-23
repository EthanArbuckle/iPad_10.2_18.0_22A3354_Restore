@implementation ACProtobufVariableKeyValuePair

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ACProtobufVariableKeyValuePair;
  -[ACProtobufVariableKeyValuePair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACProtobufVariableKeyValuePair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  ACProtobufVariableValue *value;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  value = self->_value;
  if (value)
  {
    -[ACProtobufVariableValue dictionaryRepresentation](value, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("value"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACProtobufVariableKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  NSString *key;
  id v5;

  key = self->_key;
  v5 = a3;
  objc_msgSend(v5, "setKey:", key);
  objc_msgSend(v5, "setValue:", self->_value);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[ACProtobufVariableValue copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  ACProtobufVariableValue *value;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2])
      v7 = -[ACProtobufVariableValue isEqual:](value, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_key, "hash");
  return -[ACProtobufVariableValue hash](self->_value, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  ACProtobufVariableValue *value;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[ACProtobufVariableKeyValuePair setKey:](self, "setKey:");
    v4 = v7;
  }
  value = self->_value;
  v6 = v4[2];
  if (value)
  {
    if (v6)
    {
      -[ACProtobufVariableValue mergeFrom:](value, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[ACProtobufVariableKeyValuePair setValue:](self, "setValue:");
    goto LABEL_8;
  }

}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (ACProtobufVariableValue)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (ACProtobufVariableKeyValuePair)initWithObjectValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  ACProtobufVariableValue *v8;
  ACProtobufVariableKeyValuePair *v9;
  ACProtobufVariableKeyValuePair *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[ACProtobufVariableValue initWithObjectValue:]([ACProtobufVariableValue alloc], "initWithObjectValue:", v7);

  if (v8 && (v9 = -[ACProtobufVariableKeyValuePair init](self, "init"), (self = v9) != 0))
  {
    -[ACProtobufVariableKeyValuePair setKey:](v9, "setKey:", v6);
    -[ACProtobufVariableKeyValuePair setValue:](self, "setValue:", v8);
    self = self;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
