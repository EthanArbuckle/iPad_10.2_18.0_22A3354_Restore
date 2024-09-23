@implementation _MRSystemPlaybackCustomDataQueueProtobuf

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRSystemPlaybackCustomDataQueueProtobuf;
  -[_MRSystemPlaybackCustomDataQueueProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSystemPlaybackCustomDataQueueProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSData *data;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  data = self->_data;
  if (data)
    objc_msgSend(v4, "setObject:forKey:", data, CFSTR("data"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSystemPlaybackCustomDataQueueProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_identifier)
    -[_MRSystemPlaybackCustomDataQueueProtobuf writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_data)
    -[_MRSystemPlaybackCustomDataQueueProtobuf writeTo:].cold.2();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "setIdentifier:", identifier);
  objc_msgSend(v5, "setData:", self->_data);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSData *data;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:")))
  {
    data = self->_data;
    if ((unint64_t)data | v4[1])
      v7 = -[NSData isEqual:](data, "isEqual:");
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

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSData hash](self->_data, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[_MRSystemPlaybackCustomDataQueueProtobuf setIdentifier:](self, "setIdentifier:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[_MRSystemPlaybackCustomDataQueueProtobuf setData:](self, "setData:");
    v4 = v5;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRSystemPlaybackCustomDataQueueProtobuf writeTo:]", "_MRSystemPlaybackCustomDataQueueProtobuf.m", 83, "nil != self->_identifier");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_MRSystemPlaybackCustomDataQueueProtobuf writeTo:]", "_MRSystemPlaybackCustomDataQueueProtobuf.m", 88, "nil != self->_data");
}

@end
