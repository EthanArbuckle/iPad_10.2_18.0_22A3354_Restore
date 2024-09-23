@implementation CAXPBContextualActionParameter

- (BOOL)hasParameterMetadata
{
  return self->_parameterMetadata != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)CAXPBContextualActionParameter;
  -[CAXPBContextualActionParameter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAXPBContextualActionParameter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *parameterType;
  NSData *parameterMetadata;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  parameterType = self->_parameterType;
  if (parameterType)
    objc_msgSend(v3, "setObject:forKey:", parameterType, CFSTR("parameterType"));
  parameterMetadata = self->_parameterMetadata;
  if (parameterMetadata)
    objc_msgSend(v4, "setObject:forKey:", parameterMetadata, CFSTR("parameterMetadata"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CAXPBContextualActionParameterReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_parameterType)
    -[CAXPBContextualActionParameter writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_parameterMetadata)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setParameterType:", self->_parameterType);
  if (self->_parameterMetadata)
    objc_msgSend(v4, "setParameterMetadata:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_parameterType, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_parameterMetadata, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *parameterType;
  NSData *parameterMetadata;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((parameterType = self->_parameterType, !((unint64_t)parameterType | v4[2]))
     || -[NSString isEqual:](parameterType, "isEqual:")))
  {
    parameterMetadata = self->_parameterMetadata;
    if ((unint64_t)parameterMetadata | v4[1])
      v7 = -[NSData isEqual:](parameterMetadata, "isEqual:");
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

  v3 = -[NSString hash](self->_parameterType, "hash");
  return -[NSData hash](self->_parameterMetadata, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[CAXPBContextualActionParameter setParameterType:](self, "setParameterType:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[CAXPBContextualActionParameter setParameterMetadata:](self, "setParameterMetadata:");
    v4 = v5;
  }

}

- (NSString)parameterType
{
  return self->_parameterType;
}

- (void)setParameterType:(id)a3
{
  objc_storeStrong((id *)&self->_parameterType, a3);
}

- (NSData)parameterMetadata
{
  return self->_parameterMetadata;
}

- (void)setParameterMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_parameterMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterType, 0);
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[CAXPBContextualActionParameter writeTo:]", "CAXPBContextualActionParameter.m", 82, "nil != self->_parameterType");
}

@end
