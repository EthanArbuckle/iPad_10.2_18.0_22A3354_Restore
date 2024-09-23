@implementation ADParameter

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *key;
  NSString *value;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  key = self->_key;
  if (key)
    objc_msgSend(v3, "setObject:forKey:", key, CFSTR("key"));
  value = self->_value;
  if (value)
    objc_msgSend(v4, "setObject:forKey:", value, CFSTR("value"));
  return v4;
}

+ (id)options
{
  if (options_once_1 != -1)
    dispatch_once(&options_once_1, &__block_literal_global_3);
  return (id)options_sOptions_1;
}

void __22__ADParameter_options__block_invoke()
{
  void *v0;

  v0 = (void *)options_sOptions_1;
  options_sOptions_1 = (uint64_t)&unk_1E82BEBB0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ADParameter;
  -[ADParameter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADParameter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return ADParameterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_key)
    -[ADParameter writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_value)
    -[ADParameter writeTo:].cold.2();
  PBDataWriterWriteStringField();

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
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_key, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *key;
  NSString *value;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:")))
  {
    value = self->_value;
    if ((unint64_t)value | v4[2])
      v7 = -[NSString isEqual:](value, "isEqual:");
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
  return -[NSString hash](self->_value, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[ADParameter setKey:](self, "setKey:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[ADParameter setValue:](self, "setValue:");
    v4 = v5;
  }

}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
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

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ADParameter writeTo:]", "ADParameter.m", 96, "nil != self->_key");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ADParameter writeTo:]", "ADParameter.m", 101, "nil != self->_value");
}

@end
