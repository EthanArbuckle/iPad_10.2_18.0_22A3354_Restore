@implementation _DKPRStream

- (void)setType:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)setName:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_name)
    -[_DKPRStream writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_type)
    -[_DKPRStream writeTo:].cold.2();
  PBDataWriterWriteSubmessage();

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
  v8.super_class = (Class)_DKPRStream;
  -[_DKPRStream description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRStream dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  _DKPRValueType *type;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  type = self->_type;
  if (type)
  {
    -[_DKPRValueType dictionaryRepresentation](type, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("type"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRStreamReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[_DKPRValueType copyWithZone:](self->_type, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  _DKPRValueType *type;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((name = self->_name, !((unint64_t)name | v4[1])) || -[NSString isEqual:](name, "isEqual:")))
  {
    type = self->_type;
    if ((unint64_t)type | v4[2])
      v7 = -[_DKPRValueType isEqual:](type, "isEqual:");
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

  v3 = -[NSString hash](self->_name, "hash");
  return -[_DKPRValueType hash](self->_type, "hash") ^ v3;
}

- (uint64_t)name
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)type
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPRStream writeTo:]", "_DKPRStream.m", 97, "nil != self->_name");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_DKPRStream writeTo:]", "_DKPRStream.m", 102, "self->_type != nil");
}

@end
