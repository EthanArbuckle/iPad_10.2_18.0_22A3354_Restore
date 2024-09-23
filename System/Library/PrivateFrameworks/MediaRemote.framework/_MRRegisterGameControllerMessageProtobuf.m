@implementation _MRRegisterGameControllerMessageProtobuf

- (BOOL)hasProperties
{
  return self->_properties != 0;
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
  v8.super_class = (Class)_MRRegisterGameControllerMessageProtobuf;
  -[_MRRegisterGameControllerMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRegisterGameControllerMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRGameControllerPropertiesProtobuf *properties;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  properties = self->_properties;
  if (properties)
  {
    -[_MRGameControllerPropertiesProtobuf dictionaryRepresentation](properties, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("properties"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRegisterGameControllerMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_properties)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRGameControllerPropertiesProtobuf *properties;

  properties = self->_properties;
  if (properties)
    objc_msgSend(a3, "setProperties:", properties);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRGameControllerPropertiesProtobuf copyWithZone:](self->_properties, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRGameControllerPropertiesProtobuf *properties;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    properties = self->_properties;
    if ((unint64_t)properties | v4[1])
      v6 = -[_MRGameControllerPropertiesProtobuf isEqual:](properties, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[_MRGameControllerPropertiesProtobuf hash](self->_properties, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRGameControllerPropertiesProtobuf *properties;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  properties = self->_properties;
  v6 = v4[1];
  if (properties)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRGameControllerPropertiesProtobuf mergeFrom:](properties, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRRegisterGameControllerMessageProtobuf setProperties:](self, "setProperties:");
    goto LABEL_6;
  }

}

- (_MRGameControllerPropertiesProtobuf)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
